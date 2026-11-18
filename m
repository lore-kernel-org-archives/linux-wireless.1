Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043986;
	b=S8ySzTw4d29PWFFt4Jp2ZjSFFfFtUNL8GMF1Dsz9s5ptbAsJl7XkhCP8L8It9pGeXp0L
	 35Pv7o/PhgwWmA5wz9I/uRj8/oMRij46793ZvCwsfMHzJF1bdOrnf5dZ6TbTv6Nv/N3KJ
	 jHt6nxDpZPFOWl1J0+Xe2t+iUc69GlDxm29xL4UU6NDsSSvn16DFqM4dSjgYfcdgpElqf
	 GvvobHxK24vqQ6Zf/Y5yUcXmsmy6i/t2JKx4zhxA5hsCXbqOYkuIHJOo7Posddi48HBr0
	 yZjHLWLMO6kuiAoXYiBfSgAATKiwd1+CkAVA4SOntkhAmRQiPlea/ZHI2py8YkECQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EDv2l3x/+/bJooCz9/4bolko6run+difC3F3jifyoyQ=;
	b=Mo5ErR/HA4QVfyHf5Oip2NHP1r7YO5xAzq/eXowyuiEvT2vsJqboKQu/GT1tJYzYF0nE
	 wsf47sPTWNuljP/kk01f86RfXmkLAKlWnsLNIiBCZcUVInxYavYPiix2Iu7PKTjZEJKeZ
	 OZ95G7GB4A5TrVBqlL9Twd0WJo5WY9wchkyH9h7N4SJFKcx0yVxqAKjj0IKad/7JPT1sP
	 0JfJKvBEee5jARCAMx7j6IigmVrlGfbLfvl90555M3h6m1Sa1audK1fUTPn9KuihbW784
	 CqUeZUIlK1lktCGw3u3G2jhRFg/Xos9Fo6vyxkdaD/WJeAGVLoiGHyw7R4yLzR6Y3vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JEGhF70U;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A060A2619
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108A060A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JEGhF70U
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so924773f8f.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043984; x=1795648784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDv2l3x/+/bJooCz9/4bolko6run+difC3F3jifyoyQ=;
        b=JEGhF70UA8X5U8Mu04Ib9fsgeTLW8FZL1lGDk6MUdcJdYNQohwvHZb8j5Hi100Nyr4
         elCK4t7HEsTjWjqeLcPd3FniMJ2zsnjq1ekZa360i79pForQ1qleQA+g37nVusVSxhCh
         2IUFr8mmNwRMwdbxJPBhaRaiJ5d5u8+R3c5y8fRAWrIU0m13pd468xiYTQ+Np54ma1zD
         8GGUeWgmOyc//yBDPEVZlfKPl0R9zC2XSEQJEs9VC/IGZYlx5ccIOKg32tyYMS04TGie
         aRkT54RK2IFWM35fgb9YMiEdjO2vYivs3N/ti9dD3zyDMQ9uWCAWeHdltppmwp3nVADo
         vUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043984; x=1795648784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDv2l3x/+/bJooCz9/4bolko6run+difC3F3jifyoyQ=;
        b=qHjL79OK5X39bDXDSdbr5LWkFMjmBFd/tHM8VW6raZ+/azKUuO+fT8Nx8w5jY5nNB/
         5/elwb8i4IADBTMB+KHIsrsDuM0uIvuYPzyo3aH/Vg7/+OYRiH+9SkqwXQJ3ver9ue1I
         Zo5rCoQZko5nNW62AqZk2pMxzCX46xhW0/sLJO4cN4wFKG3okSuaYlrDRg9k/j37bPiY
         cLmP5zNaT6hVdfM06WvecGJE7CQ2ea0rRHsSX8XruvkqkV3HEQmKTetBHngAFXQbqZB6
         nam4kgNhTmgHg4tIJS7J8x4o4mCMbRmhfNYUeY21V6Rl27sGZCKfGR9jqSyOD+HwNm8s
         F8SA==
X-Forwarded-Encrypted: i=1; AL+hErGxdAiVrJI1nSOPfZZY4ytbw26DqAzWmh3ut4VInRM41UotLsOXf3BinFdO5sVSh+to2dzn3qCLobjbJZlAEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kZGRsDQlq3DIIH5BqvuvK8GPpEXGsah+sGjnY+bgiuhUKZY56
	C3xFGNopQkqtVNgd8mz+RFdxYXLfmHqJV9Y+C4R2z6hboxusz7SxorOO
X-Gm-Gg: AYBFou2EnkYKbHs8AtiG23yjEXB0iMKLtkOr3wSXcf2WRJsKya56h8hpvXnSdWxEK79
	vPMJoj66NFKkcUyNYE4W/OMWwVCJDer7o8jLDDca8MaCa/KNU7KVd8ajAagdu+942b2mYRJxvQc
	/7lVWijkYd84sGr6GwnmpbzWGgvdrAMwizpv1L7S66UAqLfxJKjUOKvtuzFBb2NoW3H5/3VUP9v
	hruCX8aDAeerPbiW8hJ7G1w0Era859M09tWu4iB3ewnccBeL2YC0QCiOhwATKKxyWaxlNIorI1i
	mlZogp9p58WwlVqtjZahjHKuf0hxlj+EgSvKlvMDvgEd/7afjm9UEIONJlcsD62IA3nF0qKdd+3
	O7iCnCpSI9vYrZCX6aztr2FVvcGX4G5xnaMkXpAdMEYhG5kdO0Tyq5EIU0PwR0h7CVNUfe753Ny
	34jeUheAz0S8A8J8b09us5C7LlcdOWX8gwjcnfD0r4CnJAeu8H6dUoo0X3SI1uVa/OwxLR7rg5M
	lVqyeRkkAb3NiQd0VsmcARutnHa2ezY4uZUKGNAtE5qTuQ2hV9yay9gGhfURrQIb22QX2YS5jHa
	L1X2eUVRoVg3tVGJIsGxG/QQMro2AqcSU3Q=
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr85375575e9.4.1795043984377;
        Wed, 18 Nov 2026 15:19:44 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f9348sm5966095e9.8.2026.11.18.15.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:19:43 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v13 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Thu, 19 Nov 2026 00:19:40 +0100
Message-ID: <20261118231940.3950-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118231940.3950-1-mehmet.fide@gmail.com>
References: <20261118231940.3950-1-mehmet.fide@gmail.com>
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
index 9d5df3e65b97..c24932d00e14 100644
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
index c9ac2685437e..beafa562ca19 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -392,7 +392,7 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 	struct rtw_coex *coex = &rtwdev->coex;
 	struct rtw_coex_stat *coex_stat = &coex->stat;
 	u32 config = 0;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&rtwdev->mutex);
 
@@ -452,8 +452,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
 
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

