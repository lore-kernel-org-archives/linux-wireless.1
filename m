Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508864;
	b=wcRZ0M7q6fVxlJyZmD62MmubWKKbf6wcmxJeQFML++/lSPyaCfEcY7jljzez1DqyqK47
	 lc+yEweKI4ozZ0D5Euxz61N21gYwVvXJtNn+iz0Cyl2iqewhshRFbOWzyB+XhjjO6fEf5
	 /zWiAsdJRkKFh7A8wJTZTokgow1W+5Sq/kkAA8vjMDeJM58FgLVW5T/2IUp9lBgwK3Qim
	 qMoF1XOHf2WX1H7tuhW7TtfdDfhURPkzZHV/Zmio/IFbVRPwz6Qo7Y5IcGQjxUSRAxThD
	 mHFHUt9ELsFxAOxc27mt7l01ES5XtGHdYHHOvujbw2hCGiCdKbngxxMKnbV9MkUrzvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508864;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=3OQ1PYe+/UtQxIO8ojP6HJWgK1PNjS8B93gaMwsFnLk=;
	b=IbbKUo4XfoMLhuuErvYqONGlWZTPLqN9H+nXl3ou5iaf5pRtWw31gsIHpXzQmG2pQlkB
	 VwH+/jxrRZdyhYTUP3e8mEiBFv39z10Hit+bA38d4u6T7BNoC67JronxTPRcB7+WUIpUQ
	 +XCtQNTytMtf9RuQtE3odyVdsqlq8EuX1+/qKCrpNVU0vLGBSDSbUIlH/RxexZ4gPG3v0
	 VJHR0INjWOMHfL2cg4PkNzo5Zim6KKagtaIODXJY9qFluCW2r5rmkbCNlHP/kSDc2zU8V
	 QsCCSaZhiJo+Ta7eEpFvvzdE4MXUnV6kATpiagpI0rZTrWFsOrAukLvvhqrzmAf6wbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fO07U+UW;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89931606A331
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89931606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=fO07U+UW
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO8Raa962381512, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795508857; bh=3OQ1PYe+/UtQxIO8ojP6HJWgK1PNjS8B93gaMwsFnLk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=fO07U+UWuXv3i2YeB9aY9Xu8QKhoiP2ePuALYAAqzQQ9WsO+qsBz8fEi6C73u79ZV
	 J1Msk7T5qLkCa7QxzANFyalhH0J62IT/XnIZYuYy0tU2/ARTsOvbCvzli51VcnlzuM
	 FXb1GYowiKDq3UJh/UujkR4mRTgTAONVrwHxhoCHRmft3u0ZJxDy3gPML4mbEhvsUL
	 Clpcyi3U8WHnsCkk2wPISHWV3wzmtfj/ur3Qria3r6W24dXQKbzeKtE05omXU0Db5w
	 nLJ8mHe5qPHUKtHk8lUQwtLMofNksSHGtRbM34GD04Jc2WTZsDQTjG52Qsq0LQggpT
	 4wQGEvet+zULQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO8Raa962381512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 16:27:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 16:27:36 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 16:27:35 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 16:27:35 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <gary.chang@realtek.com>, <spam@acio.nl>
Subject: [PATCH rtw-next] wifi: rtw89: support TX of BIP-CMAC-128 management frames
Date: Tue, 24 Nov 2026 16:27:17 +0800
Message-ID: <20261124082717.27780-1-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
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
Content-Type: text/plain

From: Chih-Kang Chang <gary.chang@realtek.com>

Flag software generate MMIC header but excluding 8-byte MIC space to
support hardware TX encryption of BIP-CMAC-128 for WiFi 7 and later chips.
For WiFi 6 chips, return not support for non-station mode to fallback
software crypto.

Reported-by: Vincent Schurink <spam@acio.nl>
Closes: https://github.com/morrownr/rtw89/pull/135
Signed-off-by: Chih-Kang Chang <gary.chang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/cam.c      |  3 ++
 drivers/net/wireless/realtek/rtw89/core.c     | 33 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw89/core.h     |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8851b.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852a.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852b.c |  1 +
 .../net/wireless/realtek/rtw89/rtw8852bt.c    |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852c.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8922a.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8922d.c |  1 +
 10 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/cam.c b/drivers/net/wireless/realtek/rtw89/cam.c
index 22f21a04a96d..f657a90425b8 100644
--- a/drivers/net/wireless/realtek/rtw89/cam.c
+++ b/drivers/net/wireless/realtek/rtw89/cam.c
@@ -514,7 +514,10 @@ int rtw89_cam_sec_key_add(struct rtw89_dev *rtwdev,
 		ext_key = true;
 		break;
 	case WLAN_CIPHER_SUITE_AES_CMAC:
+		if (!chip->hw_bip_tx_encrypt && vif->type != NL80211_IFTYPE_STATION)
+			return -EOPNOTSUPP;
 		hw_key_type = RTW89_SEC_KEY_TYPE_BIP_CCMP128;
+		key->flags |= IEEE80211_KEY_FLAG_GENERATE_MMIE;
 		break;
 	default:
 		return -EOPNOTSUPP;
diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 0f36185c19bd..14e3bbd0bef3 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -716,6 +716,7 @@ rtw89_core_tx_update_sec_key(struct rtw89_dev *rtwdev,
 	struct rtw89_tx_desc_info *desc_info = &tx_req->desc_info;
 	struct sk_buff *skb = tx_req->skb;
 	u8 sec_type = RTW89_SEC_KEY_TYPE_NONE;
+	bool inc_pn = true;
 	u8 sec_cam_idx;
 	u64 pn64;
 
@@ -750,6 +751,10 @@ rtw89_core_tx_update_sec_key(struct rtw89_dev *rtwdev,
 	case WLAN_CIPHER_SUITE_GCMP_256:
 		sec_type = RTW89_SEC_KEY_TYPE_GCMP256;
 		break;
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		sec_type = RTW89_SEC_KEY_TYPE_BIP_CCMP128;
+		inc_pn = false;
+		break;
 	default:
 		rtw89_warn(rtwdev, "key cipher not supported %d\n", key->cipher);
 		return;
@@ -763,7 +768,11 @@ rtw89_core_tx_update_sec_key(struct rtw89_dev *rtwdev,
 	if (!chip->hw_sec_hdr)
 		return;
 
-	pn64 = atomic64_inc_return(&key->tx_pn);
+	if (inc_pn)
+		pn64 = atomic64_inc_return(&key->tx_pn);
+	else
+		pn64 = atomic64_read(&key->tx_pn);
+
 	desc_info->sec_seq[0] = pn64;
 	desc_info->sec_seq[1] = pn64 >> 8;
 	desc_info->sec_seq[2] = pn64 >> 16;
@@ -926,6 +935,20 @@ u8 rtw89_core_get_ch_dma_v2(struct rtw89_dev *rtwdev, u8 qsel)
 }
 EXPORT_SYMBOL(rtw89_core_get_ch_dma_v2);
 
+static void rtw89_core_tx_trim_bip_mic(struct rtw89_dev *rtwdev,
+				       struct rtw89_core_tx_request *tx_req,
+				       struct ieee80211_key_conf *key)
+{
+	const size_t mic_len = sizeof_field(struct ieee80211_mmie, mic);
+	struct sk_buff *skb = tx_req->skb;
+
+	if (key->cipher != WLAN_CIPHER_SUITE_AES_CMAC)
+		return;
+
+	skb_trim(skb, skb->len - mic_len);
+	tx_req->desc_info.pkt_size = skb->len;
+}
+
 static void
 rtw89_core_tx_update_mgmt_info(struct rtw89_dev *rtwdev,
 			       struct rtw89_core_tx_request *tx_req)
@@ -936,6 +959,7 @@ rtw89_core_tx_update_mgmt_info(struct rtw89_dev *rtwdev,
 	const struct rtw89_chan *chan = rtw89_chan_get(rtwdev,
 						       rtwvif_link->chanctx_idx);
 	struct sk_buff *skb = tx_req->skb;
+	struct ieee80211_key_conf *key;
 	u8 qsel, ch_dma;
 
 	qsel = rtw89_core_get_qsel_mgmt(rtwdev, tx_req);
@@ -955,11 +979,16 @@ rtw89_core_tx_update_mgmt_info(struct rtw89_dev *rtwdev,
 	desc_info->dis_data_fb = true;
 	desc_info->data_rate = rtw89_core_get_mgmt_rate(rtwdev, tx_req, chan);
 
-	if (chip->hw_mgmt_tx_encrypt && IEEE80211_SKB_CB(skb)->control.hw_key) {
+	key = IEEE80211_SKB_CB(skb)->control.hw_key;
+
+	if (chip->hw_mgmt_tx_encrypt && key) {
 		rtw89_core_tx_update_sec_key(rtwdev, tx_req);
 		rtw89_core_tx_update_llc_hdr(rtwdev, desc_info, skb);
 	}
 
+	if (chip->hw_bip_tx_encrypt && key)
+		rtw89_core_tx_trim_bip_mic(rtwdev, tx_req, key);
+
 	rtw89_debug(rtwdev, RTW89_DBG_TXRX,
 		    "tx mgmt frame with rate 0x%x on channel %d (band %d, bw %d)\n",
 		    desc_info->data_rate, chan->channel, chan->band_type,
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 87a832b5c290..8425bd0b3b83 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -5861,6 +5861,7 @@ struct rtw89_chip_info {
 	bool rx_freq_from_ie;
 	bool hw_sec_hdr;
 	bool hw_mgmt_tx_encrypt;
+	bool hw_bip_tx_encrypt;
 	bool hw_tkip_crypto;
 	bool hw_mlo_bmc_crypto;
 	u8 rf_path_num;
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8851b.c b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
index a80e51916da2..a089af82aca1 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8851b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
@@ -2655,6 +2655,7 @@ const struct rtw89_chip_info rtw8851b_chip_info = {
 	.rx_freq_from_ie	= true,
 	.hw_sec_hdr		= false,
 	.hw_mgmt_tx_encrypt	= false,
+	.hw_bip_tx_encrypt	= false,
 	.hw_tkip_crypto		= false,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 1,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852a.c b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
index b0f30b88cc08..5ff73cfde329 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
@@ -2426,6 +2426,7 @@ const struct rtw89_chip_info rtw8852a_chip_info = {
 	.rx_freq_from_ie	= true,
 	.hw_sec_hdr		= false,
 	.hw_mgmt_tx_encrypt	= false,
+	.hw_bip_tx_encrypt	= false,
 	.hw_tkip_crypto		= false,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 2,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852b.c b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
index af4be6f4a5ed..82f131ac77a5 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
@@ -1033,6 +1033,7 @@ const struct rtw89_chip_info rtw8852b_chip_info = {
 	.rx_freq_from_ie	= true,
 	.hw_sec_hdr		= false,
 	.hw_mgmt_tx_encrypt	= false,
+	.hw_bip_tx_encrypt	= false,
 	.hw_tkip_crypto		= false,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 2,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852bt.c b/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
index d3c7f3e4a30f..00c4cde28be9 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
@@ -873,6 +873,7 @@ const struct rtw89_chip_info rtw8852bt_chip_info = {
 	.rx_freq_from_ie	= true,
 	.hw_sec_hdr		= false,
 	.hw_mgmt_tx_encrypt     = false,
+	.hw_bip_tx_encrypt	= false,
 	.hw_tkip_crypto		= true,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 2,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852c.c b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
index ff2a1ff13604..5ad1bef0f3ea 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852c.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
@@ -3230,6 +3230,7 @@ const struct rtw89_chip_info rtw8852c_chip_info = {
 	.rx_freq_from_ie	= false,
 	.hw_sec_hdr		= true,
 	.hw_mgmt_tx_encrypt	= true,
+	.hw_bip_tx_encrypt	= false,
 	.hw_tkip_crypto		= true,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 2,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922a.c b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
index 37eb5ed3659b..d8c7675e413c 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
@@ -3278,6 +3278,7 @@ const struct rtw89_chip_info rtw8922a_chip_info = {
 	.rx_freq_from_ie	= false,
 	.hw_sec_hdr		= true,
 	.hw_mgmt_tx_encrypt	= true,
+	.hw_bip_tx_encrypt	= true,
 	.hw_tkip_crypto		= true,
 	.hw_mlo_bmc_crypto	= false,
 	.rf_path_num		= 2,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index 2c568bd67747..f86bc0657c60 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -3849,6 +3849,7 @@ const struct rtw89_chip_info rtw8922d_chip_info = {
 	.rx_freq_from_ie	= false,
 	.hw_sec_hdr		= true,
 	.hw_mgmt_tx_encrypt	= true,
+	.hw_bip_tx_encrypt	= true,
 	.hw_tkip_crypto		= true,
 	.hw_mlo_bmc_crypto	= true,
 	.rf_path_num		= 2,

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
prerequisite-patch-id: 0a9a3112f7131bc3bf6949a25a08f301b7867a7b
-- 
2.53.0

