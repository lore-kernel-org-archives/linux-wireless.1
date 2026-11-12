Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460327;
	b=uHkmuhr/SPUSpakBlCm+A+bPS/LSItIyKR+OPbT0uB0yKyL3glZmwWzaArxV6bCRT0Tj
	 rH/hpKsNXCGUWcCjbmqtJOTw56rF7YTUdaSZ4whl8bxySgAzXc6VzZao2zXS4I9mO2wHI
	 pzQaaOjhaXgsH0kz1qy8vfnwXA6aacCSRNwC+V4H4GQjJ7h10GFpdjci5Jpdi1EgnBqsn
	 Eq1oMA9+54ir6QDXg4KpKhxLRkXEw7ypB52SNSiM+ORtGuimwk3tsyjagZFX209882fTv
	 8BSN9StRV3365Y/fm3k4hMWJ2JvTYkhJbkNrXFsQiE4yDFOiafBg+/L2fDwjDp2HIkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
	b=IitjFuBwgZwizHicELIvleYFsDOOS3VCi9TTKEVIY7e3sfyVKMMEBE7o38CYawpqikAG
	 v/HYxGKAEaRcOevxBcjBfieB7lwVV/UD+SkIMxdNhyLj+lqDB+4ZfIhkCN739q1xuTcny
	 pbsrbMDLSulXWYA8uylO+xk8I7CuyHNIj253OqWNqi5TLgHihfdGK9SSt2gRbVoyXu7f1
	 N1O5PYYnTfTDn0vR4G6Ua/c5bao+Tg28p3xu0FhSA7+CRQPXmAa1iF4DkR82M5s2iFqFj
	 XI7XGaZoc6kGCtmIIm0wQTELmCzel0DjV3elMiU28emAofCA44gRt6pI8zu/A+Ll+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7VsY7Pe;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B331606A899
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B331606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7VsY7Pe
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7660422eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460327; x=1795065127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=f7VsY7Pelz/eXl3TcfKcjkAaCYErc2Xfl2NqSNMxAyO9DngYBpdpeDkhPhI/V9Ksbo
         w7bF8MJ/P1a9btuycvhzP3tw3xEXr2qZ6I/IiwA9uiOSsrYvZLIbSLrI260CUFBn3ngR
         51b5Q38U+b5TbQtZWFjZlimjPrzvDJuDrNC4a2+kGz7CiGY7SAu6CMyXaVOwYwHZza0m
         C4gIQsUqDZZGdx3EjKDlHjyUkxSVdKvaf4ZxSznPkTCA9xDMQEImKlYJk30RmgBHA6CD
         77SHbKLnWAZSS5LnvyRV1qtOiih+qq1r1oe55O6dguWnr7ontCJn8MLbIKNnf7haVMC1
         H2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460327; x=1795065127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=TV2M1r7rRRHEHsEx/3Ta//epAA6ed4CKJSbnc8vqTQZyLkaiU24+DzeCLnuNmZTvBL
         qKOOEgW8Z0vkf0BKltqFR7srHCo8appnLZcsn/yE49Bmc0gr0MkN5f7Rbo+gS9atgSPI
         wzv849ch7AixPUnOCL1RIn177I90Qi4AIj2Xvyeqcao9PHbv/g6/kEch+vAXcW1NLfHP
         l6KMp8Fg7wq/T8Qj1ov1J3/XO7b6TN+2C8+DSnhys4QPHqK4iLXInvXU90iCxOrxBVql
         pYhGVcyFJ2QElW7IpgBUx2oY+4pPoQ+Y1ZWAl5sG+yWuvcHdsDFXZvzSZqSmqmHe/gPh
         f9/w==
X-Gm-Message-State: APuU4Z/GBI4WAMsxPcd/D7QD839u/3REE5QHA1haTAtuAJDWpCkxpXpf
	VYqf9sjo/sEQODTPUxu6eHdJHStMUMsF4j2JD1OzFX4F6h2yiO6re6VJDH45o1Qu9g4=
X-Gm-Gg: AYBFou1DXfLGFmfj20mSMVeLSu9QYzARYKcULDrPPbx7fJVvQDWTGweyUJTOyyqDh4d
	8pafaYpOFvphuSRqEkuYFZJs0o7TwurCOFpfRQSLsvJqak0XnwywXfC5hMXzjLYsOQCAVN0Zptn
	cuH6xFV7T4WXVym47XUX9TaJVFjJFV6q5YdhhOIPGB0xPCXxOZGteK1B1ZYQiWWZWZpyGzPa3Sy
	Oo0Vx78c8f69mksjz+VO3P1R3ZENEkj+MlRMnAyrPblbjd/GV7pmUQevWKVWqz+frCx2FLiqnLu
	LGLF5pz317IisCY/9hrBEjEr1ruEp2Hhfv+BWrAiCz1uOVqT05mIhY2TuQ+QryTPsq+bBS2hyBF
	RQ7MnM+CLGCDAHS1FMqe+DJizo7bYzmTmwROBwL7NEfnGNPHFoBWyfQ5IXR+wSwFEadCbV+OQ4B
	gOzEv7DjaE0Z8gbnzByNSC1Zkyd5AlwmSX5DS++wm8n4+LpNK/wdcgiEGmBT5t/hjlhF6Na0V2c
	w5IEhyNqC/jeupgRYVgjsN87Z+ApOKFEAILFKnbUtV1RLI69eabERufCCSsDL0dB5P7xO6wEmP6
	3y0GJ4Tv7ViX81JObteF6ODf7TMFH+o8bDspDu/sbyc0DOz/UVhYWi8zG8a4a5BW7pJX3LTKXPZ
	y
X-Received: by 2002:a05:693c:4081:b0:377:678:231b with SMTP id 5a478bee46e88-37706782701mr3839735eec.25.1794460326598;
        Wed, 11 Nov 2026 21:12:06 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:06 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Thu, 12 Nov 2026 13:11:30 +0800
Message-ID: <20261112051142.2797529-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7e..d519e950ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f519..c5aaaec434 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc0052..ac577c8e85 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e2..7c1d43323a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

