Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289813;
	b=eR6KBHFtiIKZUT+lQdxYDLWwqAmbxcnyyBsbcEvJBeXb+W3ca4hNj6EfPHcHSJKYIBi5
	 L2LcL3LEG0wxvE7uD8JtC1j0oOhdmXWsQshltecqSdk03dxoNHXzZnvYv5Cw9jgBdPmlN
	 ArNcPpQaWiyPR6JKd8ky+4844YKDYHoatZ7K1ozp2Sb4n36pIiwnPLEfa+cVNtbm2Pzxr
	 ny5FSvVojh1iLJdSJHOo4I2qsEEAFd03YjOzJh+K4g5UT4169MEIeIsEB5qzb3pGHyW7j
	 BVL/PaqydPOCeCvnoLR0EczbtEbXVjfsJcgB2xyKBMf5sPB5C1q+JPOEu6+eOt/Ne3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
	b=RQakHO1x6HSuYu7Kv6BrQe9tU6pSmWibZOgdmGN/YhUYrghwn240v33x9PYV1GGFPIi+
	 474neY9ATanOaYvFKqdrrp6KKKOkYLYDkbMYetyl6dVbybZwrOyP9f3JwXhbx9A6RzOiy
	 DCgBGGP94ygvi8POnMy5Or1SVXYAqDLXawTHASSpsi/Ubr+Jy76mGZl1bwn9FZApeKznJ
	 EByDOTYHVuEn6a412YwX+1327K9rUNO94iAxKF97fRPC6T4iyjHQrvhLeQfbGtgpsC0jL
	 /nG9qjBf639vxUHvJJC/8xeYOzRNdOc5WXm9EzpGyHpqfvkLOBrhvo2YaNKGobyhxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyRJwLlJ;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D00606A334
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D00606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyRJwLlJ
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9496317b730so266589585a.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289812; x=1795894612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
        b=fyRJwLlJrv37XPyARKP2qXwcSHNOu3doC6kjxvnhWBDkCGlBTw0mTpBTh5zx9lGpJE
         mzvBuNgWmkbLCOBP1HnC04hIELtD/RHHBGDqIrPAkImMbq51OpOhrWyeIKROHzVygpmc
         P06nKCSWWWGRBLi02aFTfV6z56CoH98jTMQV9zIZGPwGLskriz6totpUmNbDpOTbgC0E
         L9JeYiHFxPla5or9qty67OTxlxvTEVILip6V7N+jN7ZGqwpVArgM9Ul9xtW61OW3Ys49
         GfZV+mYT71rk58hXm0qosGZTHCV9DCWVaJEBAxNkEvdJTiCjCO0Cc/cBlU7n7gOZ5fH0
         71mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289812; x=1795894612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AAGWFnUnmtne/xBpwCek8lY/qOJ5UPyZmOfCh8cYXY=;
        b=eyGiikZ39SloFRj7YGjq3RRQhwy7Vmio9CaAjoCUL+7nuiGnbpdW7GoWpsJhQ556VQ
         bzvnfVK+u64Lxw3IluTAk4qc9p0kDMjDaKsOVojTp5fJ/z/CoT79migcOlS9g2D2Ia5z
         uLjqJiqQgz7HRttv0KRt4IV5YERnsv7DW8hG2BobKzD4LwsBYL12pH59ZL1ASvLciFJW
         nxCuuBgelx4o/NIDJXC4If6Zn46DNNjdean0yImUTPidaBFYmF7uXmPTJ9vKJ99o6LFz
         vYqqfyup7pKa8hnRUaogweE+x3Wj/vhBU02pa6xcKeqNCS+SJcnF/pjjgwZ1E06cSdT6
         h9RA==
X-Forwarded-Encrypted: i=1; AL+hErHVPRERuydLnORR32cS8oS0foLmxIY6c9rJ0hoRZTUXslA1xVmdw2nyFNWYe6K9i7D6sx+PveN5CAGYk+AZ6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZGQAEIoPyBpDxwBLvgv1yDv57ntecLUc3cXhNIxBiHdyCgypK
	dAO2cM5GsJou0TxdAu2kKioTQfEqLvulsvn88YQevGwe0cDvR91WVslC
X-Gm-Gg: AZFdTZcPxap3L+Dwu2FUTI7QPHDANqvE1CnU3S70wIZnFMSo1Iqt/crnSIi8ff4L1w5
	FffJBNIGaWvl1edoyUNjdm50mVQpLeXWMgBwOBp1R0aRA32CblpDueNE/37CMa6/sVhrW+tavxQ
	YOr5cqqCW22x8WNKRjHSNh6A0lpm+MxeKhUj2B/MKQg+x61cqcrXHa7bMHv4WB77/ZNy5e64ESj
	X8P1tjk9V6fg28nIPHBc1/nv1LmA6lXzWiGk6rHdovhnf18Z/idgjk8gjtWA7rPPxI3yGu3SXvh
	PDu2FPiXFbBQSCgf+rOfCcG3SAjedJXcUnf1E0VK68BQmGJYCZ1rXZc2ocst/QzxlVrXCqM3Q7N
	UnkQr+RdU1a9MLtQyuB7FP6w5/1j4H98PYUa0imP8F9Wv/PNMWfpPqe9g+7TAMkEdOWbrAvQ4P9
	8v2kutNvNzQ1ERLOujPQ+fRUo2yivBfmn97SChoV0Y0No6B+2poafByTaXTsNbiR7iCjsRsHheM
	RQc5XBcxIyZtMwX92TIncN0xRyoDMyJaiGZOyMoihlK8ur9eo/Ieu5NnSl11rdUgp/LuJYTrbXX
	VjnaX2NiTG9GMGVx+ZPFtYKoZz3nfdyEUCKT
X-Received: by 2002:a05:620a:448e:b0:949:6fd4:353b with SMTP id af79cd13be357-949ba848065mr1196917785a.10.1795289812102;
        Sat, 21 Nov 2026 11:36:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm466931785a.42.2026.11.21.11.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:36:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Sat, 21 Nov 2026 20:36:44 +0100
Message-ID: <20261121193644.603289-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121193644.603289-1-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com>
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
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 75 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  8 +-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 -
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 059fe04014de..47f99e0b4a50 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1815,15 +1816,60 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
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
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
-				     usecs_to_jiffies(max(delay, 0)));
+				     usecs_to_jiffies(delay));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
@@ -1838,7 +1884,6 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtwdev->csa_vif = vif;
 	rtwdev->csa_retry = retry;
 	rtwdev->csa_count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
-	rtwdev->csa_due = ktime_get();
 	rtw_fw_csa_queue(rtwdev, vif);
 }
 
@@ -1873,6 +1918,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      csa_beacon_work.work);
 	struct ieee80211_vif *vif;
+	u32 hold;
 	u8 count;
 
 	mutex_lock(&rtwdev->mutex);
@@ -1881,12 +1927,21 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!vif || !vif->bss_conf.csa_active)
 		goto out;
 
-	if (!rtwdev->csa_retry) {
-		if (rtwdev->csa_count == 1) {
-			ieee80211_csa_finish(vif, 0);
-			goto out;
-		}
+	hold = rtw_fw_csa_hold(rtwdev,
+			       ieee80211_tu_to_usec(vif->bss_conf.beacon_int));
+	if (hold) {
+		ieee80211_queue_delayed_work(rtwdev->hw,
+					     &rtwdev->csa_beacon_work,
+					     usecs_to_jiffies(hold));
+		goto out;
+	}
 
+	if (!rtwdev->csa_retry && rtwdev->csa_count == 1) {
+		ieee80211_csa_finish(vif, 0);
+		goto out;
+	}
+
+	if (!rtwdev->csa_retry) {
 		count = ieee80211_beacon_update_cntdwn(vif, 0);
 		if (!count)
 			goto out;
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5b6aaa41bac8..46636b190dc3 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -398,7 +398,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -457,8 +457,10 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
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
index 3db76133d7ab..b369a299bc3f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2099,7 +2099,6 @@ struct rtw_dev {
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
 	struct ieee80211_vif *csa_wow_vif;
-	ktime_t csa_due;
 	u8 csa_count;
 	bool csa_retry;
 
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

