Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760011;
	b=L1ufuzmZbUn7X9f6QO3lrWx1LLuuc3T2cZsa2P57vIhy0PPzX0E2O8mXo/oVkO1y2lmr
	 HmmvnAmTF4nONUjsAetYV24ncNscQcR2nXH8bEhP56vZ0xMkySSBNB9QIAwOohuPc7SeR
	 KjZSBDd2pcLavm3qwJkoSp58XH9+4FK5FDd1IatrW6QaGvv/TFWJul2x50RZ0BdSXKtK6
	 mL/HXzh04PPsUnokQ2Py4D4DMg1yq0mGzDSd767fXnD6XFuGvHPRf1TGbEFeQuBGqmQaK
	 I13X4msLLVfc5l9J3G3Rhw6S1c/J1VMSBObi84hEr/PwnbgFcArz98wabnZ2ceVA/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
	b=kCq2NRkMB2uCe++e4P45UGFBZzrjK4bWJieL28vQxuyj6xq4QXKXAng/KijoroinpN6D
	 0Iy7mISghlzCLeGcmiLUvIj1TdpnRg3T3wtqZfb8rXs78d2l4fiQ0cT4olwQBLuS78yzW
	 qEuMVe/CUUWT821YuCHxotbZIQeiEySKOP8oWofDqAbUarxzWB8tpsQBWphBLOrdUpXlW
	 lSebA6gb5NfXSzKDmZUzayH6KCV7sJhV9WBDv5QL8mGiCiMAvcM4ypzNHOPG3OOaVOxyT
	 SQr+C1Pm3LM1FktBeMGhTyJvuVxOQpeSgx8yzKRD7LkKAqJd3zWeluDw5NitMlBNtPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUeC6G4g;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD8E606A338
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD8E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUeC6G4g
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so10285530eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760010; x=1796364810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=mUeC6G4gRQ8L4Zp13fvIf3GgJhnMPDOw2OPayynf620E0Hxdy6ummIVuiEtjYWDVyZ
         sm+7zH/GcOc7VXISPaSeRDTJtXrclZLxNG8NpCMeW6eoBtVXiWCtFeQYgf2RMXhSXeP+
         MgUXRo4HI/5VSa891BzAgn/QkR7ryKWHQNMS3aDDPNUy0ieVaJ8vmYi8hIuvtzQsC7li
         Y1wDcQV7XNU4GdA9RzwzFn5WPUXivFl0xoNdCCYgfy3pgsebONKmLGWKrm2TLM4yyeP3
         8mOYXITLkdaJN4j8pvPib/UXcNS24M6b5azmiYpdyJjRatOiezh81LPTdzIgDfNQaYLn
         UIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760010; x=1796364810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=Exv645+wT4gtM2f3aes0vsEzYtcX2yThv1BkMCXH3LakinuO4q2m5FYhMxVAeT1o4M
         n9yU8KYURq0e7b9+yYgVSp0OA/pYUxdC6Eu1a/nIWFo92w/f8vF7HLRdWJLMk4MAePoK
         7nFpRAWOAI9NcWWpLoB+i46wEqfWlZpPZnRAtzmbUvH3E7UpQNJo7Es+/aU6f3JCrcxb
         iJthnQ+vRD+TSqcqFRlvhORhrOhIgLDwVDvmDMTz9fJUE7XNw10hn+HB2elkbniCCGCA
         LFInvOBQUVedDrG4GF84Tj6UWV3IV3D2ZgrG4qI05jBnd4YkpNO6l84qSTjX0wjd+zH3
         YZ2A==
X-Gm-Message-State: APuU4Z8RDLT5rdoYS7ZERdmS06FEiIfuCUBgpQnwj7/63uJjWCbEYD9v
	lxrzqjwChcX6Kzu4C4cZy7oUYIoJ+ywJwscAtPFAwMJu/c7gPX3YyfSHkqeP8Me5U2g=
X-Gm-Gg: AZFdTZdEsos+4gZBMV/Gg0bX1ByMcQKPuLJEF3L4YlORZ/tiURIgLRM+9gljCIAPpJW
	UrkKnYI8akpzg3xsvv/iihjPrpBQI2eKdTtRThk0KvZUdEi/P04OA4Clr1G94HTAqro7pNJY9nM
	fGOUzW0QpOETBItF41lFPmh2aV7qTg+u0ykHjdEIJEbSeBd9weuJrc9k7VWCTnJqCWr0VoeCCnj
	G0l9byVRzxuxIcdz5+9LuBYL3X/tj+7i46hx0VyVs+VknZDMy8sPwH8gCCVMVsvUUkRwVnqOWj9
	IKWroKSIdqX48wm4gKj9K5s2bl9+M29sSAiw4ydWu1kMphRz+OwKD0/Dd0uWMlB8h4pGl9q8Gf3
	HHSlSS9R64z38rPWtf+BjGqFoPe7S9h1Bc9vDCnRzwLsAOTRLyTRBTqgaX6M0D+vBPAJh5GaAAI
	oDZ/Ple8cO/LSXpxtJsu8Pg3pF1XbeYMYUASYxstcvloWSBmfD//K/TeSOexQ+rfc+UzTH17kt6
	GvvHQLF3Ls6CIQD3YObIN/868jBiEF3mygDa4cOAr06VP+7VvM4ErslnIQKyqeaEOLmSrhqjP+k
	AVYvi2d3jf50VsvFdyZJjXIcNtPKHHlndH3h2iaNMQXjI9aPdx1xK1NRyNWavkm+8Gn1og==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr33878573eec.23.1795760010146;
        Thu, 26 Nov 2026 22:13:30 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:29 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH wireless-next v2 10/11] wifi: brcm80211: move the channel and rate tables of brcmsmac to brcmutil
Date: Fri, 27 Nov 2026 14:11:40 +0800
Message-ID: <20261127061147.506129-11-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the 2.4 and 5 GHz channel tables and the legacy rate table to
brcmutil as constant tables, so that other drivers of the d11 core can
register the same channels and rates.

Also fixes a bug where multiple instances of brcmsmac share the same
channel tables.

Put a copy of the channel tables in struct brcms_info so that changes
to one do not affect the rest of the instances.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c | 151 ++----------------
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |   9 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |   2 +-
 .../broadcom/brcm80211/brcmutil/band.c        | 140 ++++++++++++++++
 .../broadcom/brcm80211/include/brcmu_band.h   |  26 +++
 5 files changed, 185 insertions(+), 143 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index eeae85cae0..0db6868389 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -49,30 +49,6 @@
 	FIF_BCN_PRBRESP_PROMISC | \
 	FIF_PSPOLL)
 
-#define CHAN2GHZ(channel, frequency, chflags)  { \
-	.band = NL80211_BAND_2GHZ, \
-	.center_freq = (frequency), \
-	.hw_value = (channel), \
-	.flags = chflags, \
-	.max_antenna_gain = 0, \
-	.max_power = 19, \
-}
-
-#define CHAN5GHZ(channel, chflags)  { \
-	.band = NL80211_BAND_5GHZ, \
-	.center_freq = 5000 + 5*(channel), \
-	.hw_value = (channel), \
-	.flags = chflags, \
-	.max_antenna_gain = 0, \
-	.max_power = 21, \
-}
-
-#define RATE(rate100m, _flags) { \
-	.bitrate = (rate100m), \
-	.flags = (_flags), \
-	.hw_value = (rate100m / 5), \
-}
-
 struct firmware_hdr {
 	__le32 offset;
 	__le32 len;
@@ -111,117 +87,10 @@ MODULE_DEVICE_TABLE(bcma, brcms_coreid_table);
 module_param_named(debug, brcm_msg_level, uint, 0644);
 #endif
 
-static struct ieee80211_channel brcms_2ghz_chantable[] = {
-	CHAN2GHZ(1, 2412, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(2, 2417, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(3, 2422, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(4, 2427, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN2GHZ(5, 2432, 0),
-	CHAN2GHZ(6, 2437, 0),
-	CHAN2GHZ(7, 2442, 0),
-	CHAN2GHZ(8, 2447, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(9, 2452, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(10, 2457, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(11, 2462, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(12, 2467,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(13, 2472,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN2GHZ(14, 2484,
-		 IEEE80211_CHAN_NO_IR |
-		 IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS |
-		 IEEE80211_CHAN_NO_OFDM)
-};
-
-static struct ieee80211_channel brcms_5ghz_nphy_chantable[] = {
-	/* UNII-1 */
-	CHAN5GHZ(36, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(40, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(44, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(48, IEEE80211_CHAN_NO_HT40PLUS),
-	/* UNII-2 */
-	CHAN5GHZ(52,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(56,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(60,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(64,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	/* MID */
-	CHAN5GHZ(100,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(104,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(108,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(112,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(116,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(120,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(124,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(128,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(132,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(136,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(140,
-		 IEEE80211_CHAN_RADAR |
-		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS |
-		 IEEE80211_CHAN_NO_HT40MINUS),
-	/* UNII-3 */
-	CHAN5GHZ(149, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(153, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(157, IEEE80211_CHAN_NO_HT40MINUS),
-	CHAN5GHZ(161, IEEE80211_CHAN_NO_HT40PLUS),
-	CHAN5GHZ(165, IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS)
-};
-
-/*
- * The rate table is used for both 2.4G and 5G rates. The
- * latter being a subset as it does not support CCK rates.
- */
-static struct ieee80211_rate legacy_ratetable[] = {
-	RATE(10, 0),
-	RATE(20, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(55, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(110, IEEE80211_RATE_SHORT_PREAMBLE),
-	RATE(60, 0),
-	RATE(90, 0),
-	RATE(120, 0),
-	RATE(180, 0),
-	RATE(240, 0),
-	RATE(360, 0),
-	RATE(480, 0),
-	RATE(540, 0),
-};
-
 static const struct ieee80211_supported_band brcms_band_2GHz_nphy_template = {
 	.band = NL80211_BAND_2GHZ,
-	.channels = brcms_2ghz_chantable,
-	.n_channels = ARRAY_SIZE(brcms_2ghz_chantable),
-	.bitrates = legacy_ratetable,
-	.n_bitrates = ARRAY_SIZE(legacy_ratetable),
+	.n_channels = ARRAY_SIZE(brcmu_2ghz_chantable),
+	.n_bitrates = ARRAY_SIZE(brcmu_legacy_ratetable),
 	.ht_cap = {
 		   /* from include/linux/ieee80211.h */
 		   .cap = IEEE80211_HT_CAP_GRN_FLD |
@@ -239,10 +108,8 @@ static const struct ieee80211_supported_band brcms_band_2GHz_nphy_template = {
 
 static const struct ieee80211_supported_band brcms_band_5GHz_nphy_template = {
 	.band = NL80211_BAND_5GHZ,
-	.channels = brcms_5ghz_nphy_chantable,
-	.n_channels = ARRAY_SIZE(brcms_5ghz_nphy_chantable),
-	.bitrates = legacy_ratetable + BRCMS_LEGACY_5G_RATE_OFFSET,
-	.n_bitrates = ARRAY_SIZE(legacy_ratetable) -
+	.n_channels = ARRAY_SIZE(brcmu_5ghz_nphy_chantable),
+	.n_bitrates = ARRAY_SIZE(brcmu_legacy_ratetable) -
 			BRCMS_LEGACY_5G_RATE_OFFSET,
 	.ht_cap = {
 		   .cap = IEEE80211_HT_CAP_GRN_FLD | IEEE80211_HT_CAP_SGI_20 |
@@ -1056,11 +923,16 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 
 	hw->wiphy->bands[NL80211_BAND_2GHZ] = NULL;
 	hw->wiphy->bands[NL80211_BAND_5GHZ] = NULL;
+	memcpy(wl->ratetable, brcmu_legacy_ratetable, sizeof(wl->ratetable));
 
 	phy_type = brcms_c_get_phy_type(wl->wlc, 0);
 	if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
 		band = &wlc->bandstate[BAND_2G_INDEX]->band;
 		*band = brcms_band_2GHz_nphy_template;
+		memcpy(wl->chantable_2ghz, brcmu_2ghz_chantable,
+		       sizeof(wl->chantable_2ghz));
+		band->channels = wl->chantable_2ghz;
+		band->bitrates = wl->ratetable;
 		if (phy_type == PHY_TYPE_LCN) {
 			/* Single stream */
 			band->ht_cap.mcs.rx_mask[1] = 0;
@@ -1076,6 +948,11 @@ static int ieee_hw_rate_init(struct ieee80211_hw *hw)
 		if (phy_type == PHY_TYPE_N || phy_type == PHY_TYPE_LCN) {
 			band = &wlc->bandstate[BAND_5G_INDEX]->band;
 			*band = brcms_band_5GHz_nphy_template;
+			memcpy(wl->chantable_5ghz, brcmu_5ghz_nphy_chantable,
+			       sizeof(wl->chantable_5ghz));
+			band->channels = wl->chantable_5ghz;
+			band->bitrates = wl->ratetable +
+					 BRCMS_LEGACY_5G_RATE_OFFSET;
 			hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
 		} else {
 			return -EPERM;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
index eaf926a96a..c9b47cb2ad 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.h
@@ -21,14 +21,10 @@
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
 #include <linux/leds.h>
+#include <brcmu_band.h>
 
 #include "ucode_loader.h"
 #include "led.h"
-/*
- * Starting index for 5G rates in the
- * legacy rate table.
- */
-#define BRCMS_LEGACY_5G_RATE_OFFSET	4
 
 /* softmac ioctl definitions */
 #define BRCMS_SET_SHORTSLOT_OVERRIDE		146
@@ -85,6 +81,9 @@ struct brcms_info {
 	bool mute_tx;
 	struct brcms_led radio_led;
 	struct led_classdev led_dev;
+	struct ieee80211_channel chantable_2ghz[BRCMU_NUM_2GHZ_CHANNELS];
+	struct ieee80211_channel chantable_5ghz[BRCMU_NUM_5GHZ_CHANNELS];
+	struct ieee80211_rate ratetable[BRCMU_NUM_LEGACY_RATES];
 };
 
 /* misc callbacks */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
index 5d8b7c26ad..46cee2cf13 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
@@ -7,4 +7,4 @@
 ccflags-y := -I $(src)/../include
 
 obj-$(CONFIG_BRCMUTIL)	+= brcmutil.o
-brcmutil-objs	= utils.o d11.o rate.o
+brcmutil-objs	= utils.o d11.o rate.o band.o
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c b/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
new file mode 100644
index 0000000000..df0ad02334
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2010 Broadcom Corporation
+ */
+
+#include <linux/export.h>
+
+#include <brcmu_band.h>
+
+#define CHAN2GHZ(channel, frequency, chflags)  { \
+	.band = NL80211_BAND_2GHZ, \
+	.center_freq = (frequency), \
+	.hw_value = (channel), \
+	.flags = chflags, \
+	.max_antenna_gain = 0, \
+	.max_power = 19, \
+}
+
+#define CHAN5GHZ(channel, chflags)  { \
+	.band = NL80211_BAND_5GHZ, \
+	.center_freq = 5000 + 5*(channel), \
+	.hw_value = (channel), \
+	.flags = chflags, \
+	.max_antenna_gain = 0, \
+	.max_power = 21, \
+}
+
+#define RATE(rate100m, _flags) { \
+	.bitrate = (rate100m), \
+	.flags = (_flags), \
+	.hw_value = (rate100m / 5), \
+}
+
+const struct ieee80211_channel brcmu_2ghz_chantable[BRCMU_NUM_2GHZ_CHANNELS] = {
+	CHAN2GHZ(1, 2412, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(2, 2417, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(3, 2422, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(4, 2427, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN2GHZ(5, 2432, 0),
+	CHAN2GHZ(6, 2437, 0),
+	CHAN2GHZ(7, 2442, 0),
+	CHAN2GHZ(8, 2447, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(9, 2452, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(10, 2457, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(11, 2462, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(12, 2467,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(13, 2472,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN2GHZ(14, 2484,
+		 IEEE80211_CHAN_NO_IR |
+		 IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS |
+		 IEEE80211_CHAN_NO_OFDM)
+};
+EXPORT_SYMBOL(brcmu_2ghz_chantable);
+
+const struct ieee80211_channel brcmu_5ghz_nphy_chantable[BRCMU_NUM_5GHZ_CHANNELS] = {
+	/* UNII-1 */
+	CHAN5GHZ(36, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(40, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(44, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(48, IEEE80211_CHAN_NO_HT40PLUS),
+	/* UNII-2 */
+	CHAN5GHZ(52,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(56,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(60,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(64,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	/* MID */
+	CHAN5GHZ(100,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(104,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(108,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(112,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(116,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(120,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(124,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(128,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(132,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(136,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(140,
+		 IEEE80211_CHAN_RADAR |
+		 IEEE80211_CHAN_NO_IR | IEEE80211_CHAN_NO_HT40PLUS |
+		 IEEE80211_CHAN_NO_HT40MINUS),
+	/* UNII-3 */
+	CHAN5GHZ(149, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(153, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(157, IEEE80211_CHAN_NO_HT40MINUS),
+	CHAN5GHZ(161, IEEE80211_CHAN_NO_HT40PLUS),
+	CHAN5GHZ(165, IEEE80211_CHAN_NO_HT40PLUS | IEEE80211_CHAN_NO_HT40MINUS)
+};
+EXPORT_SYMBOL(brcmu_5ghz_nphy_chantable);
+
+/*
+ * The rate table is used for both 2.4G and 5G rates. The
+ * latter being a subset as it does not support CCK rates.
+ */
+const struct ieee80211_rate brcmu_legacy_ratetable[BRCMU_NUM_LEGACY_RATES] = {
+	RATE(10, 0),
+	RATE(20, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(55, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(110, IEEE80211_RATE_SHORT_PREAMBLE),
+	RATE(60, 0),
+	RATE(90, 0),
+	RATE(120, 0),
+	RATE(180, 0),
+	RATE(240, 0),
+	RATE(360, 0),
+	RATE(480, 0),
+	RATE(540, 0),
+};
+EXPORT_SYMBOL(brcmu_legacy_ratetable);
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
new file mode 100644
index 0000000000..ee62eda869
--- /dev/null
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2010 Broadcom Corporation
+ */
+
+#ifndef _BRCMU_BAND_H_
+#define _BRCMU_BAND_H_
+
+#include <net/cfg80211.h>
+
+#define BRCMU_NUM_2GHZ_CHANNELS		14
+#define BRCMU_NUM_5GHZ_CHANNELS		24
+#define BRCMU_NUM_LEGACY_RATES		12
+
+/*
+ * Starting index for 5G rates in the
+ * legacy rate table.
+ */
+#define BRCMS_LEGACY_5G_RATE_OFFSET	4
+
+/* Drivers register copies of these, as cfg80211 updates their flags. */
+extern const struct ieee80211_channel brcmu_2ghz_chantable[BRCMU_NUM_2GHZ_CHANNELS];
+extern const struct ieee80211_channel brcmu_5ghz_nphy_chantable[BRCMU_NUM_5GHZ_CHANNELS];
+extern const struct ieee80211_rate brcmu_legacy_ratetable[BRCMU_NUM_LEGACY_RATES];
+
+#endif /* _BRCMU_BAND_H_ */
-- 
2.53.0

