Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399336;
	b=2RBafcEM/VnMHaw0gyPWB2/KvV6e3/Ee60cKy2vC5DsJZWpzLhpukflsfoYKeDpTp4qS
	 GvgB7K7IznjpAhKPPyZsmNYiAFFwXvhjM7zRZxHJpy4Qv2jiBdpDicuLDeARvzc55HsNt
	 el5KFW5CNm8u9supYQcBXhYb7L1o7xtlSmbceUoqBjiLheRfZk+aEbzm4Uew3hk/vNPVn
	 rgTUW6jJ8m6PYOuFuuIBUPuiPNbSheSAhxk8w+tMwDvoUKelgkrrcWxZWxwAwyZjyLqOG
	 KBiACYJCbETY1g54v6+qgdCW9rz7BP4jnBNF6N6XcWnkU9VGd94P8VkPorHGs5eXSxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
	b=ym+bvLeOK8uzeX0tnHgCwLXBI+XPpaD9tNp/M6xUsoA1G6lsISTPI4RWxC0TNJqQpO6x
	 qXxvTpUMLUJImnS/BHohhPGqx/vzg4PTl3/NP7REQhhIJXUgBwqOVslFd5we5AKsYZMPc
	 JMti2e9boUdakrpW75Id3aCFSTctGLHEjXDV56oNvY2oAxrMcjIO+B+Lm4SwRPmrbVK/w
	 XjB44C+kr6KZnOtxvTJ9jY3+PPh+lbtosWNBcgzMfC7RSKvctZdiO+65rU2JQEZ7oXZpm
	 CbIsNSiAzbKr96QH9c281JOX+GLNJbOEoESVzBK9fbcG8U/dAdJpknUZwTdUOryH4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDRACTxp;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20B60A5BC2
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC20B60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDRACTxp
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5430f70c827so31460801cf.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399335; x=1795004135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
        b=LDRACTxpcaBYPqqXesao5drPy1TGCWlgCCJwTSD6BC/4JxEA7rUJ76bdsiMeqDsVvI
         xR3GhV4ZrdGYs8u7LjBlGqQ7SyTWCLikTc9A5ieH7qgyfrlE3ZZTNrRjfof4DWRh9mdV
         RLdHRcrr1xyvonnAJ58laY/on9XAUZN4H5SXIWB4xOlgZpjZUwR0fAvonsSISAo7EON0
         W7EBPHQC3c2J4s+8uwlMKtfrYYaT2zdi1XTUpzHL0erWuvhfN2UVujGMjl458WbYnc8U
         JE2p0UWCW+dPOH/F8Lmy+YYsjTAG+t1+8MBeTjrfT1+DFiiwv2uZJrbSUHsM/ctpytl7
         LbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399335; x=1795004135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXrY7UU9EURmgnyU0yrekzkyNzNba5SPdKcUPlDl9zU=;
        b=YE7eNrOOfwOvdzsluWy2x21mUFfYzwUmFIgNewBrs531ruqZ7o606DYx23dGhU4a2m
         66EgJTMvB6k0tBcQ7nS1kbl700/nkN29rUkPWzihwoGBOsGaEL82VH5WaXIRRCTjElPS
         1u/Vpky2HLzSEF8D7jt4yZApT5jhqhqMaN6hfIVdD2Wl+N4z4f65/rbypkjBqXjgFhM8
         us/LFIQEzFyGlHpDhJZ638x5/kMqhKye0Q7eB1xYfLsinM0lcNE2aWG9ZtmDTOxeCh8a
         VIuVd6PZZDDjgVw6GkFWxnmY+BKlj1xKS35gzgbfmoRxwiD+gjPpnKT0TuqeNEkbe2or
         FNLw==
X-Forwarded-Encrypted: i=1; AL+hErHHrHBN1lswXwG6gbDhcpPd5QAXPoGehrR4TJnscz2qjB8kEA0sQP6W8RIKuuo3dnvsTI1sgDaf7g5ofhJ0QA==@vger.kernel.org
X-Gm-Message-State: APuU4Z87j+H6Z82TaMIrBJUwCLqVk336l3Sn5PKRh3agJMFa2+jQ5FDA
	5fzp5/RK6/ksJZI1Md4JUxXadjsSTcALAuK8Q5VyshZ1PFfudVPk1F1Z503dtw==
X-Gm-Gg: AYBFou12Jey39JOqr9Sf82oEQ7MQBBnTm6TctwkWR6z/zoj00N4ThWoZ+ulz86Fl+pg
	F4gyOYDYJ7DYM0+EoABehM5h+iM+gWvNvf6tH8T+CEgYo3hYq2X/mooQF7JVNysqIWrKFXBmxz0
	jzREkzOkzsTiU2WRemvLHFY/8woY/uR7v7A1RdvLfyd9jelAtMRJvCiLufvgZEe4BsscN3GirCI
	5RY046jkbH8bkZIi2znw5p5kDilBD6eT+vah6GpaLJ4Y3EcolSRo1x3krJGL7E1ag4fjNMI9tWd
	EXJZDMbshG6gAVU0dmtQRYgJtGaBKGbBEypikVJtTPWwRNc2aehBftYmbfgGs4oumEsNTJT12fT
	ts7D4Q7W7ebi07vqMtW3Mcf4tl1yt0j9S+oTsAlY/UP/og0pZNWeifZYSf/JMhoCgBBsnWNGqTP
	Gil58ubO93vEnpbkIojqEAvXlb4vujvOWrWd8Gig3JGaWU9w9PFB4LeSsq3ES86KgwEG525GjRU
	zs3l/6TMtJ0ZWLsMR2Y6GBRClLQjxB0ipgSxxIV8b1WeWslOQbpKQFnSdE4K1iuCS9WzN4hXV7a
	tCoCgceVsZQAx56JrRLFxO8umDz0JYjeCHI=
X-Received: by 2002:ac8:5749:0:b0:533:3e09:22bb with SMTP id d75a77b69052e-556c05ee974mr29897441cf.42.1794399334705;
        Wed, 11 Nov 2026 04:15:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 11 Nov 2026 13:15:25 +0100
Message-ID: <20261111121525.358041-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111121525.358041-1-mehmet.fide@gmail.com>
References: <20261111121525.358041-1-mehmet.fide@gmail.com>
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

Queue each download 10 ms after the next TBTT, read from the TSF, so it
may run late by almost a beacon interval; a later one is followed by
the next at once. A TSF jump, an IBSS merge or a reset, restarts the
schedule from the next TBTT.

The first count is downloaded the same way, not when mac80211 changes
the beacon: a download close to a TBTT keeps beacons off the air. On an
RTL8821CU and an RTL8822CU a TBTT during the download sent no beacon or
the old one. On an RTL8822CE a TBTT up to about 100 us before the
download sent none and the next beacon stayed out too, and with a count
of 2 no CSA beacon went out. The switch completes up to one beacon
interval later. The replay after a hardware restart still downloads at
once.

The USB chips raise no TBTT interrupt, so the TSF register is read. The
beaconing interface is always on port 0: rtw_core_port_switch() moves
an AP there, an IBSS runs alone.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v10:
    - the first count is downloaded by the countdown work, 10 ms after the
      next TBTT, and no longer when mac80211 changes the beacon. v9 took a
      TBTT up to 10 ms before the start as the one that sent the first
      count, but a TBTT during the download sends no CSA beacon, and with
      a count of 2 none went out at all (Luka). No download runs close to
      a TBTT now, so there is nothing left to guess
    - rebased on rtw-next
    - Acked-by from Ping-Ke and Reviewed-by from Luka dropped for the
      changed code
    
    Changes in v9:
    - Acked-by from Ping-Ke (on v8) and Reviewed-by from Luka
    
    Changes in v8:
    - the TSF read retries once, if the high word changed, instead of
      looping (Ping-Ke)
    - rtw_fw_csa_queue() takes a start argument and reads the TSF once,
      also on start (Ping-Ke)
    - the port 0 comment is gone, the commit message says it (Ping-Ke)
    - empty lines where asked (Ping-Ke)
    
    Changes in v7:
    - new patch, from Ping-Ke's review of the countdown pacing in v6

 drivers/net/wireless/realtek/rtw88/fw.c       | 48 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw88/mac80211.c |  7 ++-
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +-
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 4 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 2d81aaeed0d7..c30aa938f9a9 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 
 #include "main.h"
 #include "coex.h"
@@ -1809,14 +1810,47 @@ bool rtw_fw_csa_active(struct rtw_dev *rtwdev)
 	return !!rtwdev->csa_vif;
 }
 
-/* paced from the first download: a late one does not delay the next */
-static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
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
+static void rtw_fw_csa_queue(struct rtw_dev *rtwdev, struct ieee80211_vif *vif,
+			     bool start)
 {
 	u32 interval = ieee80211_tu_to_usec(vif->bss_conf.beacon_int);
+	u64 tsf = rtw_fw_read_tsf(rtwdev);
 	s64 delay;
+	u32 rem;
+
+	if (start) {
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+	} else {
+		rtwdev->csa_tbtt += interval;
+	}
+
+	delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	if (delay > interval + RTW_CSA_TBTT_MARGIN_US ||
+	    delay < -(s64)interval) {
+		/* the TSF jumped: restart from the next TBTT */
+		div_u64_rem(tsf, interval, &rem);
+		rtwdev->csa_tbtt = tsf - rem + interval;
+		delay = rtwdev->csa_tbtt + RTW_CSA_TBTT_MARGIN_US - tsf;
+	}
 
-	rtwdev->csa_due = ktime_add_us(rtwdev->csa_due, interval);
-	delay = ktime_us_delta(rtwdev->csa_due, ktime_get());
 	ieee80211_queue_delayed_work(rtwdev->hw, &rtwdev->csa_beacon_work,
 				     usecs_to_jiffies(max(delay, 0)));
 }
@@ -1829,8 +1863,8 @@ void rtw_fw_csa_start(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
 		return;
 
 	rtwdev->csa_vif = vif;
-	rtwdev->csa_due = ktime_get();
-	rtw_fw_csa_queue(rtwdev, vif);
+
+	rtw_fw_csa_queue(rtwdev, vif, true);
 }
 
 void rtw_fw_csa_stop(struct rtw_dev *rtwdev, struct ieee80211_vif *vif)
@@ -1880,7 +1914,7 @@ void rtw_fw_csa_beacon_work(struct work_struct *work)
 	if (!ieee80211_beacon_cntdwn_is_complete(vif, 0)) {
 		rtw_fw_download_rsvd_page(rtwdev);
 		rtw_send_rsvd_page_h2c(rtwdev);
-		rtw_fw_csa_queue(rtwdev, vif);
+		rtw_fw_csa_queue(rtwdev, vif, false);
 	} else {
 		ieee80211_csa_finish(vif, 0);
 	}
diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index e6c9866fd599..dbd148760b9b 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -441,8 +441,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		rtw_set_dtim_period(rtwdev, conf->dtim_period);
-		rtw_fw_download_rsvd_page(rtwdev);
-		rtw_send_rsvd_page_h2c(rtwdev);
+		/* the countdown downloads its beacons after a TBTT */
+		if (!conf->csa_active || changed & BSS_CHANGED_BEACON_ENABLED) {
+			rtw_fw_download_rsvd_page(rtwdev);
+			rtw_send_rsvd_page_h2c(rtwdev);
+		}
 		/* restart replay resumes it, a beacon without CSA ends it */
 		if (conf->csa_active)
 			rtw_fw_csa_start(rtwdev, vif);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 5d18841a705f..466992b85c43 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2096,7 +2096,7 @@ struct rtw_dev {
 	struct work_struct update_beacon_work;
 	struct delayed_work csa_beacon_work;
 	struct ieee80211_vif *csa_vif;
-	ktime_t csa_due;
+	u64 csa_tbtt;
 
 	/* used to protect txqs list */
 	spinlock_t txq_lock;
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

