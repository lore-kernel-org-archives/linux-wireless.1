Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850346;
	b=w/3HMs6Jb1DduRQbWpNZcWZrC3BV8/YEdZH1kuU3PyT76/P8FjJrkkYnQzakUiw2z61v
	 CqNIpf7HD0SGo4xOvpELhG91BdG0uGaQf6RClrXMPqxJSq4pJw8PBv/DfOa0GdPrD0apa
	 i0xeINfuVUp5Is86mXcQK1esIQKxmDOo2RiIU8P684AWDvvegAJRKtXHX5V3s0+ckOcXO
	 hyJguUiEnfdkkjMjeo1QdITYq93hwzgsLq/k926BH+l4LnGbzsZp0014pugNuj//h3TpC
	 5+atDzFClrTQ8LNWv/8Qe59WYtyplLYXOinygUet2IL96ULgkdPjdPAxemHHjlrdz5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaJYRTa0OAAXpTOhsSY4T/66u4Yo+dcjuLC6zmE+ywY=;
	b=BBQaZWFLUT7n2QY3GesQ1D9HAqIhAtgJ8sd134mBdx4u7JlH30cXMuF1W37rwQpCyhTe
	 RBo6l0lImHAmGEpvrw9j72Rhf39jH+f/oHOWp0MgN48FHLKHyJc7OO7MMtQt86CmtMqAC
	 wEGugro3zAq0WhAwfnJEoFsGM0B9qK+2ym3MaoZ0QGjX9VxS8cUGt2o/wG8vAS7AZdn4R
	 00FQHcnjsEVme+3Y9dXMcwUXlP7vk+2MevGkZU96+F4kdn+KgfMLRQBOsLccuBpr98XED
	 U+H41/4tpAvYg7a5CZihbhlnXxYSdr6ryQX9wQxDd9hK3EoK1FkKa4QBaWgLdF8DgiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xf5fYdsV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF34606A6A2
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF34606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xf5fYdsV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so31760515e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795850344; x=1796455144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaJYRTa0OAAXpTOhsSY4T/66u4Yo+dcjuLC6zmE+ywY=;
        b=xf5fYdsV5jFH1hNbjMSVuZdkUY1OjtQre0OuSS9GkouTe1JPYD8qOaOAuiejabUAXi
         7GtDcyHQKfdjBh9T+zQ0vsv4p4svlGWrShvLgGU431bzh/Su560E7dPCp4o8HGZ+tebv
         mMUPNfmAgjNH5zqAxspvn5KqJDNl2tYEw/EdzU3PeJ29WYMPHeC2Z3d94W83BLMWwEJB
         gZiAspeYYK0i9sACCqshG9T1b7ZDHV1LElnx89F3ve1y3qY4wrfk58T1lvT5t7dEdnT4
         yOeTySHeR06VzlPNVKg2nnv5uCcfiZIGu7yobOS/Gpumkol4BN944PijGg+lAfVqmDFv
         QG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850344; x=1796455144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaJYRTa0OAAXpTOhsSY4T/66u4Yo+dcjuLC6zmE+ywY=;
        b=oZ3GuTKmszuzgf0rBuWYVWj5/75ik96CM3ErTYVa0y1CY/JpOtRjUttALXHHARi3zW
         SmRWdeObrsu9/vE1kLUppytzLQAVdl2tnfeZKIk09YBelVmznahiRjV6XaNtvzjt0XEU
         E5LFN16N3QUCLRgyhuQIo4aoXM7YFwi4WFi6iPgw8UDYi0cMRjj+UfIHdYjqt0cct/mr
         GzXCdRNae1WQugd8R/zOm8SHN+kLtm5FYOSFHQ9IuTsZAs/9ig6jB/4s1RdoiKBtSOrc
         A/4m5tpiaH/L2fsZ1FqnbFyPjlWaJShC7bqRUP4Z33pNMMevJqgcWA3WINyHnPwW+H9a
         arYA==
X-Forwarded-Encrypted: i=1; AL+hErHKrjOnE4+eQWaZMuAD/qgYxrHKCUHhScQ5hiomquSy3xVVj73goe4TrUmSigHKBpl/KOOsMlc0JpifHxbLWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+G+phwLHzS1iVt0b6YqCg7/6mv7NVqQi1BQZFNa+C7yrwkObpU
	mby/VeWnaE6y8LygfHlCuQ1imHmRMQvBWEq4zvb047MJntGJeupt7n9i
X-Gm-Gg: AZFdTZdtueLO+91dMy0wo1bMMBs3inuaiS58FgxHWITVIzqIkb9xPQiK+LRgJQ4qzYZ
	YcTn6/dMBfs+GnTSzRPkQa4GbOFnUuVjIlztLdF06QmO1eSeUIGJRyNYBIcgvMydqvEWagBeoMi
	kvOE23Mz6Vhe5YDSGAyQQY+PkbcbLP69juUZ31+IypOz/8FvqKuavC/hggu6Y6KkV66kILvVwz7
	2Y5v2qt8gutfvVRnHVkvhj3A/6nqS7YVbnK5r/7ypFZTK1FHBFOaWGwvWsypeBeaitG7g9QiP7Z
	4mFZ117u9G8LAtn1f4XZWjANADFFJchqqMd5BI1TlmZvc2y39TorccVzaaw9dn+UfEg0nm8l1sK
	s1j4bnKIIzn/8xeMIYCfsREmzF3DzZODTJtiER1Q+bmhq9wsgj0x83IU8kmfaxzUBOqG4HfupiC
	62BAV/NDZD0vLMBxkaZjvflLNJ2L6FXLKcZWtE/TFtLqlCX8u1DlM5zDfYNFc1B8YmlVmOgQ7cR
	iConNxedSQjlmqx6WU1swLFwpt4T54QCshBpNkgjCx3o8C0FxqL3PC8BEm6mHJHzDYwHu8wEMgy
	DNxLwrIa2Jn1UWSnIUuefJ/wflwkeoSISR4=
X-Received: by 2002:a05:600d:a:b0:4bb:aa4f:c01d with SMTP id 5b1f17b1804b1-4bbaa4fc151mr159934015e9.1.1795850343441;
        Fri, 27 Nov 2026 23:19:03 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm748649545e9.10.2026.11.27.23.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:19:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v15 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Sat, 28 Nov 2026 08:18:58 +0100
Message-ID: <20261128071858.42275-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261128071858.42275-1-mehmet.fide@gmail.com>
References: <20261128071858.42275-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The countdown steps run one beacon interval apart with no relation to
the TBTT, and a download close to a TBTT keeps beacons off the air. On
an RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon
or the old one. On an RTL8822CE a TBTT up to about 100 us before the
download also kept the next beacon out, so with a count of 2 no CSA
beacon went out.

Read the TSF and queue each step min(10 ms, interval / 4), but at least
5 ms, after the first TBTT that is at least min(10 ms, interval / 4)
away. A step that runs less than 5 ms after a TBTT, or less than that
margin before one, waits until after the TBTT. The first count is now
downloaded by the work too, not when mac80211 changes the beacon, so
the first CSA beacon carries the count after the first step, as with
drivers that fetch every beacon with ieee80211_beacon_get(). The replay
after a hardware restart still downloads at once.

A late download delays the switch by a beacon interval instead of
taking a count off the air; stations that took the switch time from an
earlier count then switch up to that interval before the AP. At short
intervals a USB download, 6 to 17 ms, can run past the next TBTT, and
the USB chips then send a count more than once.

The USB chips raise no TBTT interrupt, hence the TSF read. The beaconing
interface is always on port 0: rtw_core_port_switch() moves an AP
there, and an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---

Notes:
    v15: the CSA fields renamed for struct rtw_csa, no other change;
    Acked-by from Ping-Ke on v14

 drivers/net/wireless/realtek/rtw88/fw.c       | 75 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  8 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 -
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index d85364cdedaa..f13c68e622e7 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1815,15 +1816,60 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa.vif;
 }
 
+#define RTW_CSA_TBTT_MARGIN_US	10000
+#define RTW_CSA_TBTT_AFTER_US	5000
+
+static u64 rtw_fw_read_tsf(struct rtw_dev *rtwdev)
+{
+	u32 hi, lo, tmp;
+
+	hi = rtw_read32(rtwdev, REG_TSFTR + 4);
+	lo = rtw_read32(rtwdev, REG_TSFTR);
+	tmp = rtw_read32(rtwdev, REG_TSFTR + 4);
+	if (tmp != hi) {
+		hi = tmp;
+		lo = rtw_read32(rtwdev, REG_TSFTR);
+	}
+
+	return ((u64)hi << 32) | lo;
+}
+
+static u32 rtw_fw_csa_margin(u32 interval)
+{
+	return min_t(u32, RTW_CSA_TBTT_MARGIN_US, interval / 4);
+}
+
+static u32 rtw_fw_csa_after(u32 interval)
+{
+	return max_t(u32, rtw_fw_csa_margin(interval), RTW_CSA_TBTT_AFTER_US);
+}
+
+static u32 rtw_fw_csa_hold(struct rtw_dev *rtwdev, u32 interval)
+{
+	u32 rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	if (rem < RTW_CSA_TBTT_AFTER_US)
+		return rtw_fw_csa_after(interval) - rem;
+	if (interval - rem < rtw_fw_csa_margin(interval))
+		return interval - rem + rtw_fw_csa_after(interval);
+
+	return 0;
+}
+
 static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
-	s64 delay;
+	u32 delay, rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	delay = interval - rem;
+	if (delay < rtw_fw_csa_margin(interval))
+		delay += interval;
+	delay += rtw_fw_csa_after(interval);
 
-	rtwdev->csa.due = ktime_add_us(rtwdev->csa.due, interval);
-	delay = ktime_us_delta(rtwdev->csa.due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa.beacon_work,
-				     usecs_to_jiffies(max(delay, 0)));
+				     usecs_to_jiffies(delay));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
@@ -1838,7 +1884,6 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtwdev->csa.vif = vif;
 	rtwdev->csa.retry = retry;
 	rtwdev->csa.count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
-	rtwdev->csa.due = ktime_get();
 	rtw_fw_csa_queue(rtwdev, vif);
 }
 
@@ -1873,6 +1918,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      csa.beacon_work.work);
 	struct ieee80211_vif *vif;
+	u32 hold;
 	u8 count;
 
 	mutex_lock(&rtwdev->mutex);
@@ -1881,12 +1927,21 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!vif || !vif->bss_conf.csa_active)
 		goto out;
 
-	if (!rtwdev->csa.retry) {
-		if (rtwdev->csa.count == 1) {
-			ieee80211_csa_finish(vif, 0);
-			goto out;
-		}
+	hold = rtw_fw_csa_hold(rtwdev,
+			       ieee80211_tu_to_usec(vif->bss_conf.beacon_int));
+	if (hold) {
+		ieee80211_queue_delayed_work(rtwdev->hw,
+					     &rtwdev->csa.beacon_work,
+					     usecs_to_jiffies(hold));
+		goto out;
+	}
 
+	if (!rtwdev->csa.retry && rtwdev->csa.count == 1) {
+		ieee80211_csa_finish(vif, 0);
+		goto out;
+	}
+
+	if (!rtwdev->csa.retry) {
 		count = ieee80211_beacon_update_cntdwn(vif, 0);
 		if (!count)
 			goto out;
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 8a578ef26e15..7ca50c25d319 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -396,7 +396,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -455,8 +455,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		ret = rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			ret = rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		if (conf->csa_active)
 			rtw_fw_csa_start(rtwdev, vif, !!ret);
 		else
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 73184e55c614..f10733ddfd76 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2064,7 +2064,6 @@ struct rtw_hw_scan_info {
 struct rtw_csa {
 	struct delayed_work beacon_work;
 	struct ieee80211_vif *vif;
-	ktime_t due;
 	u8 count;
 	bool retry;
 };
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 877b82640e91..3a2255422d78 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -507,6 +507,7 @@
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
+#define REG_TSFTR		0x0560
 #define REG_MISC_CTRL		0x0577
 #define BIT_EN_FREE_CNT		BIT(3)
 #define BIT_DIS_SECOND_CCA	(BIT(0) | BIT(1))
-- 
2.56.0

