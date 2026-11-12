Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460351;
	b=taXPPMq1dDnrocIWml2Fv6MtTyJNJ3ypJ478RngPhAIqGYhnvHGguDCBTGFEY3/Y5zaH
	 wlxGUcRTHxL8mlf0ovy9/B+fQhdn3Sv/HvghEGW6Nkie24iEXKNxSZ5YTt4rvM4cniZGM
	 YRaWqV9vTNFYGgOztJZ/4Nb7Ylz4Upym2PD31OosoXPS9IjpbEPdSN5vOZ/joqzb4NIr6
	 jRpRR4xiECfBaJr3ACF1yyTaO8jf+rR6b89K3JPF0p+PS0WvyEzqicbCw/gMqxo72nIWY
	 Nm7noZBlj89HgeijbYz5VDc1cFyPCSkqsTUFC0hQTrOvUQVbH8VkguuzuGfOpHbv2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
	b=xrm30h3bayBPobD4a+0vkxDTJ+47tijcOcAo57XDB/kzg6ErLIc41UPxhSV4oRkYrFqx
	 rOO1W0u53Bj3TbqrlUw0dCBwZXOgwLTRw8AlgAtL8T0tuGYrE8CW9u0pE1MSz30bS6vhf
	 ZF9ox5NNx83C1NJBtxMm2M9vT5+6fY+RPoD3MQzrMpEqdTzegD72kyU+x2wIKsdmePPxq
	 wzb8cvBppxwYMNuSvQp+Y6WyhR09meL2+XSLw7E6d7Ln813QudW9O+TQOhxhCRMk5NfFP
	 RI8/UB5sWM4PGTL30brxOr7qwNrBMcoWADTqF6LPW6t2yASoHr8fHq0ZTcR1SqLZGOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVETmuV3;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339760A3823
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7339760A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVETmuV3
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1931ff67a29so7093084c88.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460349; x=1795065149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=EVETmuV3n1UsEeIevPE4FGZMVEWc4t3KsSRphy2DraU6EF3J7Z0FuK6QyjnULmATVK
         NRWxuT+rHCPYY5G8dUPXkUqgdZB/9YSwLezD85gjgqcTkapo5bhU20L6p6geZKOm5+O6
         /r4GeJNPTnT4YWJ70C8cr6w+e5HQrHgV9O/VE+Xy3XexdOGQ9uPlbyHsO1lPZuSN6gb1
         Ietv06nB+HoRvDE+xXYIDVNMK5O7hx1NgWq1XCbkQnFQ+O8rNnCFMtbHe9hfiv7fxxVl
         /ixu4ACONMWmC4QZjRyAQRy3F6gaZgE2Dm7DMgM/xDfKSDhkFCLQOw+fXFsc6fBnSPlT
         Cvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460349; x=1795065149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXQAq0iO2NUcagvs9BZAvE/ORktOEIssq357NL0m3ak=;
        b=oMsHIdu4NAjWYskGKNNVOtL0GVuXRNFbTQxRTqSOuAc9oJAI+FkUUPw+AtLZQ+aRTj
         Qbn0QufuKFFSq4gHyJ3yn6yAZNz4N7agjTOaTsuZlod3BAab7k3E1b2MOYcITNSHeL1h
         hHwHRG7+ckacBhfliahVG1mpoFN9C/htE52EInSnTzkYDS4wEeKMTBMl+6swxBNkk0Py
         gXuoqE4Qu4KTUxT8N0BKtt2mobdQ3sBZ8a9AoQrzttPBeQGqhgNxZlmPDNH+5joPMOOC
         LRrASS7v9tKtEO+xO+z73gxAhMrNCSfyy7TPokr/qTKT1TGSBFBVkxsl1THioiR2A6bA
         B14Q==
X-Gm-Message-State: APuU4Z+DaIC1MB0xAum5AIpKJEpKHgbIF6b15f5GYy0Hh+KfkSLpyDck
	ubwj6D3cO61bFoGzVjSu4u33rCeJrU2bDStgSg3gCWvngIB8eBPAHhk7EzdChaJJwUY=
X-Gm-Gg: AYBFou2dLlihXjgE1XJ8WianxeOLuyqPqUCoroXbvCClBFwpQfQ+kCEzQSL9WtAqHaX
	sR71aDFutXOlENawIF7p2IHeyF5PoAlyxT4a1NlzHoJyQtnTT+6KZvn8XlSIjpFlAbNqT/KZhUG
	g/J92MgPAMbSdEhmeUKVNf/Fvon4ZPzAgzX4jAvwoO+AeDKERuI8PPZvmr553Nyxl9+1Gz6CPzp
	bJt2iHTMbpCbYKmzAdLF0H58DGAdaHpViPN93EnyB7QochJEHqNLQfczMBbejP0fwVRLDutxHq5
	SnzuBnJpLCG+8QofbVtMJlCKdTxg3bj9AzfOVs3H6X06w65rVuzJS85E9NzFKCJ3iRYi6oRvoql
	Q7gsc9oL5lzRhGmd++0/v+pfNcav8q2rgmi/DdSsxVXG6o6pq+FOO/394EWFXkPISRxMchEIj1m
	aDKxPwzkB0WYxOO6Tx3HKAbtrVtVfwqTM+SYL8Hm43HH3/gJrWO2dMiwDix8rclhPIAlmlfpJ4F
	GAvje3xbTwkmEiUgklpWb6yolydLF2XXKsJSqYllM49YBx6h6uI+oUiCxjNMIMNEWp2fY+QbnMs
	mvy3Q9G6x4NMMh0IkSCB8cs74Gzb2+Vnw+Ck/TpyBoZkm47m/ZkueiJPxmqLQdd3aHvIv5qo+wm
	t
X-Received: by 2002:a05:693c:4150:10b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-376851ce278mr5605100eec.13.1794460349192;
        Wed, 11 Nov 2026 21:12:29 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:28 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH 10/10] wifi: brcm80211: move the channel and rate tables of brcmsmac to brcmutil
Date: Thu, 12 Nov 2026 13:11:37 +0800
Message-ID: <20261112051142.2797529-11-ragulbaby@gmail.com>
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

