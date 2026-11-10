Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336258;
	b=rc4XLEC6ZXx1vJAwPWuDzTM+HnjkFYyrKPiEQQHboUzmGYhbHXSkMuM9DpJBMjWEg2fd
	 ZuGY4KjnXtkUHJQnN4FeGnFXlIboYbczovHjr6CZEOKC0q34tEnzhXrVvvMwYx+vN17RJ
	 cPnH1xc/G2IGlt/j2gGj+bLSjjnktknwNZRege/1emwmYJCWWNJRLSskMuhz/VGTwdstt
	 Iw75Z89m03GIS8UgOUtVcuXcI4JQ4m//BuVXUS8VmVQIrVXVY2zTaQollZFgDvMAMFM/e
	 OIk2buSYaNzhX9qrHVSzhxM5ksufJLQhrMTYGYUxDmVpcgUMCXYgvVoJocaJODg8ESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
	b=1LN6sMt1lsgNF9QQ1EQJmzg7fWdVMlu+ESc1TsXoMJzQI4xsrjBwTJrjj7NgS6gFfDa7
	 8EWjccB5TpJ6+QfUxcWfOwr+DoAy3i0oge3YqK45HrniC78IO9GyLsgnNv3YZ0eqdEIRG
	 udxbRVN1ExNgmiaXMUN4KvkiClTHn9jkWI/RhQTcEh0lJ7+lQbuEIhENk4+RuoJbOjryX
	 a7dXdWcHvgjPqSqyNoORIJQ/w+VPA6OfrX8XSkiXTVqZ4nJETax0fqvlmQmg+hehXTMcU
	 QbOPdx+FEo9Y9ATvdP7QfOOOiQ+lf8sBkmrDBtJtVRR5nhEUdM1+s1mwxeBAY18fVVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezuDOzpi;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23760A2609
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF23760A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezuDOzpi
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6deb848ddd7so1426547eaf.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336257; x=1794941057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
        b=ezuDOzpiJeWUtcdcQp/08EvyTvbUD5TuEAxOAs2jZakpnklSz3xV1bsYx5/OtST4pZ
         r+Spj69PFtMzYBU1jLqjevAy+bxJsHSwtMgW4aksv0klf1gsp1JDSYqOrW10hyKhG/+O
         gr/PtAy52AfNebb1ketiutaYZA5HToEyA+kff+Q687te9vbpJaWxW6guHUmhAGQcAWP4
         GKyEbWJy8eqPIrRYpD+GmiRXjMxOOIXMpoPHqMIMucz/Qj9pqZTrBA5jxWtcRuMAkYLS
         qkKwJTyAKh8K2YgFzxMmQyWbPS7LFMCoFFFQT0UGtWzbqJpxzkUzXtt9Bb6N5EZ6HIfP
         GJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336257; x=1794941057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrckW9zYKMVqkZPBuh2imu7DOw9yI7/mNlAYhX3+6TA=;
        b=uA4Z1f3wk7LT2ShrW52cyw09/2095rpNy6VWjjvnjen7xErZqyjZUiegN/r1Sgo6Qw
         lFzvsO2vMcDWR4B4qwkSW9bwgHh0pzwTVcUBmiN2+EYJKNA5A0yCTVcw6hZY3VKbhzqR
         hcD76eUgYtsL9YtLkc/iXSZNBDiYN0s4C3oE3lKQrzH5WKC/ZSlLGtSRlA2kCp1DsZ3J
         z8rQn+YPCyiz5HkdKbyJsOE5ABweFNxQqv3PtnrWojrvSla61P3Tx1F/dkZkmqTxr9+f
         0WFA15tEXf7o4tKoASxvMNiB00+WTvHWk5236JcBStRRTIpIIY2U5h+ivks49Zx/3ox6
         S/xA==
X-Gm-Message-State: APuU4Z9ZgqV9NmAiQhaYh5BXNKIk2LOEXMlv00IJgnklRbsyRCj//MZX
	ki4GhkBYN6z8fGgMovBYjB/SJEjEW+gdfNUEdkgg3RQlTW70T8hGT4SW
X-Gm-Gg: AYBFou0iq6E9af9fSlBxeT35Vp9LrMg0dnK/1Al5QInQC1eHJA+doBFzKtCVpMWMIKu
	K4tq+VKRGcs66t/IkowuwQl6y4+rgWTsmBZ539LL6fbbuA6BfRGKQ33SbYFWPa1sO93eWZgDEOG
	xNWjWuvusxC1lUIRYrRWFopPGReISPgrIFKpSzpV0rMOYd7GfwrxSm7zYH0fMSnAZLq5XH1v4kc
	AvgGBFLy+3CUBLjZVHQYZtbDc8FOD9OVddetCYTxDmrO73D3jnSrEIcSwpZXMp98rNBj/RlWpXA
	WFaB+ktljG9Lt6Zz7d1XKrqn29H+Z358yZTRMF8jtmuCtSWiiJ//aWdy2B//kWdBgQGRiB0cko6
	6d2Z2HXjsEbFFRhKy3zHeWA/Oj7lTxAuZJSLllkEhX42rvscytNsMpTLdNbnBaMR7orLDxH5Y32
	6IF+wbYsIbv04uocQI1bMNpJzaccyY1YM9fZjqSpwle/q1bmu9ztZKI3RPeLsTV3aF3//p5tWs7
	F2koB40Kb5UC8WW7loVA1ZYe1WyX0NA8KidxLznzS7PNq0BHAzqGNCJ2p70RHNWGluhENCDWw4m
	I5IBnlnaFZRk32HJu7pn4DdIBFMNUAQafg==
X-Received: by 2002:a05:6820:4418:b0:6f5:f71c:1acf with SMTP id 006d021491bc7-718a6b35a93mr1418391eaf.58.1794336256417;
        Tue, 10 Nov 2026 10:44:16 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:15 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 5/6] wifi: rtlwifi: use ieee80211_is_ctl() instead of WLAN_FC_GET_TYPE()
Date: Tue, 10 Nov 2026 12:44:08 -0600
Message-ID: <20261110184409.42205-6-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
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

Six RX status parsers read the frame type with WLAN_FC_GET_TYPE() from
wifi.h only to compare it against IEEE80211_FTYPE_CTL.
ieee80211_is_ctl() from <linux/ieee80211.h> does that test directly on
the little endian frame control.

Use it at the six sites, drop the type variables that only held the
result, and remove WLAN_FC_GET_TYPE() together with WLAN_FC_GET_VERS(),
WLAN_FC_GET_STYPE() and WLAN_FC_MORE_DATA(), which have no users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
Assisted-by: Claude:claude-fable-5-1
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c       | 5 ++---
 drivers/net/wireless/realtek/rtlwifi/wifi.h                | 4 ----
 7 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
index 99472053ccff..3ab08b345df7 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
@@ -221,7 +221,7 @@ static void _rtl92ce_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, c_fc;
+	u16 c_fc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
@@ -229,11 +229,10 @@ static void _rtl92ce_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	c_fc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 
 	packet_matchbssid =
-	    ((IEEE80211_FTYPE_CTL != type) &&
+	    (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (c_fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (c_fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
index a76f2dc8a977..c3ea858af693 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/mac.c
@@ -719,17 +719,16 @@ void rtl92c_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, cpu_fc;
+	u16 cpu_fc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cpu_fc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 	packet_matchbssid =
-	    ((IEEE80211_FTYPE_CTL != type) &&
+	    (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cpu_fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cpu_fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a34492030..0fcba5b56c71 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -355,7 +355,7 @@ static void _rtl92d_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	bool packet_matchbssid;
 	bool packet_beacon;
 	bool packet_toself;
-	u16 type, cfc;
+	u16 cfc;
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
@@ -364,9 +364,8 @@ static void _rtl92d_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cfc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
-	packet_matchbssid = ((type != IEEE80211_FTYPE_CTL) &&
+	packet_matchbssid = (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cfc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cfc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
index b057d035a3a8..3fb8a641770d 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
@@ -201,7 +201,7 @@ static void _rtl92se_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	__le16 fc;
-	u16 type, cfc;
+	u16 cfc;
 	bool packet_matchbssid, packet_toself, packet_beacon = false;
 
 	tmp_buf = skb->data + pstats->rx_drvinfo_size + pstats->rx_bufshift;
@@ -209,10 +209,9 @@ static void _rtl92se_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
 	cfc = le16_to_cpu(fc);
-	type = WLAN_FC_GET_TYPE(fc);
 	praddr = hdr->addr1;
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(fc) &&
 	     ether_addr_equal(mac->bssid,
 			      (cfc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 			      (cfc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
index f40b0efebe3a..976d840d9e49 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
@@ -225,17 +225,16 @@ static void translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	/*u8 *psaddr;*/
-	u16 fc, type;
+	u16 fc;
 	bool packet_matchbssid, packet_toself, packet_beacon;
 
 	tmp_buf = skb->data + pstatus->rx_drvinfo_size + pstatus->rx_bufshift;
 
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
-	type = WLAN_FC_GET_TYPE(hdr->frame_control);
 	praddr = hdr->addr1;
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(hdr->frame_control) &&
 		(ether_addr_equal(mac->bssid, (fc & IEEE80211_FCTL_TODS) ?
 		 hdr->addr1 : (fc & IEEE80211_FCTL_FROMDS) ?
 		 hdr->addr2 : hdr->addr3)) &&
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
index b6029bfaedac..bb9fc0783bdc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
@@ -197,19 +197,18 @@ static void _rtl8723be_translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *tmp_buf;
 	u8 *praddr;
 	u8 *psaddr;
-	u16 fc, type;
+	u16 fc;
 	bool packet_matchbssid, packet_toself, packet_beacon;
 
 	tmp_buf = skb->data + pstatus->rx_drvinfo_size + pstatus->rx_bufshift;
 
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
-	type = WLAN_FC_GET_TYPE(hdr->frame_control);
 	praddr = hdr->addr1;
 	psaddr = ieee80211_get_SA(hdr);
 	memcpy(pstatus->psaddr, psaddr, ETH_ALEN);
 
-	packet_matchbssid = ((IEEE80211_FTYPE_CTL != type) &&
+	packet_matchbssid = (!ieee80211_is_ctl(hdr->frame_control) &&
 	     (ether_addr_equal(mac->bssid, (fc & IEEE80211_FCTL_TODS) ?
 				  hdr->addr1 : (fc & IEEE80211_FCTL_FROMDS) ?
 				  hdr->addr2 : hdr->addr3)) &&
diff --git a/drivers/net/wireless/realtek/rtlwifi/wifi.h b/drivers/net/wireless/realtek/rtlwifi/wifi.h
index 24c6db867421..e289a88e9666 100644
--- a/drivers/net/wireless/realtek/rtlwifi/wifi.h
+++ b/drivers/net/wireless/realtek/rtlwifi/wifi.h
@@ -2810,10 +2810,6 @@ enum bt_radio_shared {
 
 #define packet_get_type(_packet) (EF1BYTE((_packet).octet[0]) & 0xFC)
 #define RTL_WATCH_DOG_TIME	2000
-#define WLAN_FC_GET_VERS(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_VERS)
-#define WLAN_FC_GET_TYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_FTYPE)
-#define WLAN_FC_GET_STYPE(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_STYPE)
-#define WLAN_FC_MORE_DATA(fc)	(le16_to_cpu(fc) & IEEE80211_FCTL_MOREDATA)
 #define rtl_dm(rtlpriv)		(&((rtlpriv)->dm))
 
 #define	RT_RF_OFF_LEVL_ASPM		BIT(0)	/*PCI ASPM */
-- 
2.43.0

