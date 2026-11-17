Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957990;
	b=4sBV/5WO7Ew/viQEufbCC8fPZnUwDTfHGeUcm8IqhinEHHHJvobdNiuaHbp65x62w0uN
	 l82vHil3794pqxFIsx4v7qm6d3rED1awth3iccW3cbnLHG1KYUJx/mDCfI2EwPhLisZTC
	 feyBHWpD3DTrwDh9nUUkZ6D98hlPV8Rdqahdi6yuxizN3s5lMZu4FxSpNKg9U+Ba+JGlG
	 WIoT1IuLfOe/C7eVmXVNv/4hYxiC14MwYAZjcPOJdbrH+C37WAIoAfO13Ql08dpaqEefc
	 qQEV6joALG5XgKpy1TddMJ0CHoTp2PUG6e1WU7NTisipwBad/+OjxjftWAezm+k4b1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
	b=zj3HpKN4nqHVxUROzCk/Ut4hg7MSbEXEydZLE90faHTIQ6WsAfynt7MFgz5vlIKAUCWa
	 L2tHlI9tbQEj8CHECT6ClQQzkdBftK4wWXEWExedlwgIAyvDnIFVb9PHvbk+PZqWp92ZY
	 OEaC7uJ0P0tdRbSqieoL1Wq9ZFBw0RIcyjCmEB1zZwhHMXQy0me5I0RlnLO50dPbS6YUL
	 kWY7tPpu6akGztGGM8VXK85a1HEigUpRZZ9rrac0Mpox1algrl3WEEFzzp3U2cYAet1QL
	 Ps23UEPgVGqv6YZ2BKgIznUoPky0y+ZgvzYENZP9mgoXjp/2ABkUVLmURtrwMGXvGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzQB8tj1;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909B606A895
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6909B606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzQB8tj1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so3880195e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957989; x=1795562789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
        b=bzQB8tj1zLLF4LBlQOYUMJzPbtQ/Wxv2SA0eB2pYZlAIniaE/yGVzCHNq7GKZJP4g2
         y8ZuIfNu2UtS1LydjnrT5fVuHv9GKkPZUU+U2wGN46QC9kPPXXT0+2uze3VafdRIDH9W
         1aTSaNmUbGG3MbaiWoaORt6H052/tjjzLfiRaLwdE/Zi0VHVWX8FShxvCviJDkhel3Mq
         Yp1CEtHGj08AybdhTMHoob7FjtH9qt60sE35nySmZyL6ym+lB4yP1sPRE1INHvE59Rt/
         JDqYNRWitSJuedcOkiw+6Rdhz4UD31e/+EKiza47ArLIdYrkL55LyQM9/YgjVk27Adhz
         tfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957989; x=1795562789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwRqgCt3CcHiMP0Wio9FutBC6C7E82wdVGDZ8D6AQjU=;
        b=xiwWOITZQ3FhSyntu/lA51i2t410YWXvUvwKLwFfmkL6ksu/fWJHGQ5vLwsB21urF3
         86YAwFzc3WPY5lvxy9h139mt/7UENSKQVp1hME+PjkZF2ZGis10aIWtuia3uMYUMC4py
         jYtngY6D4TLSYgsVQAH9lyE8lUn7piK4ChtHWzcNfIvYq8szQH/MbZA0OowG1v6oFI7t
         4LEkJO5iU0orKQtCxhKF2ynOj8n9o6o7n7KIMS5gLC4CDb02voSYJ32XWEKv992nNoV3
         3Qshkv62PyQiIMp93IlOk5sv2da4Pz7O9ubp4mxCln/wP+ETDSWQfrde3+MSr6feoS0r
         ORag==
X-Forwarded-Encrypted: i=1; AL+hErHzPbgUhA5C8FtKgttP4rMg5hGdoIYPt+vYJKe1swpUgqBkgeCMkszNGK95UsHMtPfCpv5QFhQyOIt5huMNGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8U8hpatzoXIXglvwvrVpklSlDp4Hyxyc7oEaCQPPcVE02OFo+7
	CSMFCWAlaUrbHS8sh+gRMgwIAsrcVn3azDFgL+XRH85HkCnwZUh/UaYk
X-Gm-Gg: AYBFou0w4OZPcxmq29yhTTO8sWuynbBVvt7HN8oYt2Ivv6SbDSbvDcCUT+nKHmTc2RG
	9bvdQ4IDhaMMjuZVInF1qUByDi6woHgZ2dCCSS8pJIoMa3ZduY64uDIskw6idQ/akQBE7xL2yDL
	3p0Woy1nG30aGiCqrS69H4Qw4eVUGFR0n7Y1lX9a6BdXgZRoxWHJemmFELCZcWM1BBN4RqzKSf9
	1DjFT03AHWuut4GpS3HMdpW1CtuLoCLeuYJgl2emq0KuhJr57tGPgeko4TE8RxxEOZwR+0g7iQr
	ZP3DGYpiygCAKZYLn5Vp1qnF51H2vzwZTH29TaQanMhNqK6XUnJMVavEJz8xpSh9vkTUs3NkpWZ
	M/WmVElnF2bRZnTRtYDmMDWe6P1hCBa9IL/S+FHAiJnWc1JhwBC+tytSZYVZszHFFe94PAtUK0Y
	C15LJJOQAtazUQPwq7hHO+WuBvZ9Dsl4loeH62Sw66qUxrNTBAJ3j+dzWxXLPcN4mhzERdhLfQI
	YHngyaxsO0iBHmytaZGWXZi+8oL4omMDSmpy6xvxiXKVbaFLggTehURZIlrJLSSmrGzSf2Kx/Zk
	YQwK1+aDdrV0oSRe+V0b+UYEwpfkeC7II0ln
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr15849105e9.0.1794957988643;
        Tue, 17 Nov 2026 15:26:28 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm20013915e9.11.2026.11.17.15.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:26:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v12 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 18 Nov 2026 00:26:24 +0100
Message-ID: <20261117232624.1956815-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117232624.1956815-1-mehmet.fide@gmail.com>
References: <20261117232624.1956815-1-mehmet.fide@gmail.com>
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

The countdown downloads are queued one beacon interval apart, with no
relation to the TBTT. A download that runs late past the next TBTT
leaves a count out of the air.

Read the TSF after each download and queue the next step 10 ms after the
first TBTT that is at least 10 ms away. Every count that was downloaded,
the first one too, then has a TBTT to go out at; a download that runs
late delays the switch by a beacon interval instead of taking a count
off the air, and stations that took the time of the switch from an
earlier count then switch up to that interval before the AP. As with a
driver that fetches each beacon with ieee80211_beacon_get(), the first
CSA beacon carries the count after the first step.

The first count is downloaded the same way, not when mac80211 changes
the beacon: a download close to a TBTT keeps beacons off the air. On an
RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon or
the old one. On an RTL8822CE a TBTT up to about 100 us before the
download sent none and the next beacon stayed out too, and with a count
of 2 no CSA beacon went out. A step, the one that finishes the switch
too, that would run less than 5 ms after a TBTT or less than 10 ms
before one waits until 10 ms after that TBTT instead; with a beacon
interval of 20 ms or less there is no room for that and the steps are
not held. The switch completes up to one beacon interval later. The
replay after a hardware restart still downloads at once.

The USB chips raise no TBTT interrupt, so the TSF register is read. The
beaconing interface is always on port 0: rtw_core_port_switch() moves
an AP there, an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/fw.c       | 70 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  9 ++-
 drivers/net/wireless/realtek/rtw88/main.h     |  1 -
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 0910a9c7d7bc..755c35747559 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1824,16 +1825,54 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
-/* paced from the first download: a late one does not delay the next */
+#define RTW_CSA_TBTT_MARGIN_US	10000
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
+/* how long to wait so that a step does not run next to a TBTT */
+static u32 rtw_fw_csa_hold(struct rtw_dev *rtwdev, u32 interval)
+{
+	u32 rem;
+
+	if (interval <= 2 * RTW_CSA_TBTT_MARGIN_US)
+		return 0;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	if (rem < RTW_CSA_TBTT_MARGIN_US / 2)
+		return RTW_CSA_TBTT_MARGIN_US - rem;
+	if (interval - rem < RTW_CSA_TBTT_MARGIN_US)
+		return interval - rem + RTW_CSA_TBTT_MARGIN_US;
+
+	return 0;
+}
+
+/* after the first TBTT that can send what was downloaded last */
 static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
-	s64 delay;
+	u32 delay, rem;
+
+	div_u64_rem(rtw_fw_read_tsf(rtwdev), interval, &rem);
+	delay = interval - rem;
+	if (delay < RTW_CSA_TBTT_MARGIN_US)
+		delay += interval;
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
-				     usecs_to_jiffies(max(delay, 0)));
+				     usecs_to_jiffies(delay +
+						      RTW_CSA_TBTT_MARGIN_US));
 }
 
 void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
@@ -1848,7 +1887,6 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
 	rtwdev->csa_vif = vif;
 	rtwdev->csa_retry = retry;
 	rtwdev->csa_count = ieee80211_beacon_cntdwn_is_complete(vif, 0) ? 1 : 0;
-	rtwdev->csa_due = ktime_get();
 	rtw_fw_csa_queue(rtwdev, vif);
 }
 
@@ -1884,6 +1922,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	struct rtw_dev *rtwdev = container_of(work, struct rtw_dev,
 					      csa_beacon_work.work);
 	struct ieee80211_vif *vif;
+	u32 hold;
 	u8 count;
 
 	mutex_lock(&rtwdev->mutex);
@@ -1892,12 +1931,21 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
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
+
+	if (!rtwdev->csa_retry && rtwdev->csa_count == 1) {
+		ieee80211_csa_finish(vif, 0);
+		goto out;
+	}
 
+	if (!rtwdev->csa_retry) {
 		count = ieee80211_beacon_update_cntdwn(vif, 0);
 		if (!count)
 			goto out;
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 20969dd689df..b918e7041abe 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -392,7 +392,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -447,8 +447,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		ret = rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		/* the countdown downloads its beacons after a TBTT */
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			ret = rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		/*
 		 * A beacon with CSA starts the countdown, also when a restart
 		 * replays it. A beacon without CSA ends it.
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 0444fd46028e..dc3f6d05ac44 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2098,7 +2098,6 @@ struct rtw_dev {
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
 	struct ieee80211_vif *csa_wow_vif;
-	ktime_t csa_due;
 	u8 csa_count;
 	bool csa_retry;
 
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a..3ff4ae0885ef 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -506,6 +506,7 @@
 #define REG_USTIME_TSF		0x055C
 #define REG_BCN_MAX_ERR		0x055D
 #define REG_RXTSF_OFFSET_CCK	0x055E
+#define REG_TSFTR		0x0560
 #define REG_MISC_CTRL		0x0577
 #define BIT_EN_FREE_CNT		BIT(3)
 #define BIT_DIS_SECOND_CCA	(BIT(0) | BIT(1))
-- 
2.56.0

