Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=ovqxZwnb1OSn8Zfw0qeOrsyS4+PunwWLFtdjhQD3iKJY+xJeWnb2q5QRb0KBNYFVM1Wq
	 k70fON40s+hD+XBuVf4PuuOmcxtDdKKJMsaLNPVQHWTWtKt61ONlpDoTEGlyuE4ulMKA3
	 +c7kap9GLq+doa+cp3fWgOtL5o1BkuiTmK470MhgbEJZ5WBXKKyM15sL8X0TPjkMN4/U8
	 CgjfqitkN8iCuSnPdXgZX332vjToP4+BxQxEjvNnIbOBJBUPtGINp8vbs4klwnLOQUmSZ
	 K75n4bVWp5ikM+PkQqk3pc82DXsGAP0XPwpW5V0RJlpReHfwR9F7RHBqLMizmpJ/M0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W9XIQf5WO4PEAWNjD1poHpKZ6Je6CSNQUG+XksB14gM=;
	b=SHk6Z3W8UTFxpvpibuG7Vw4Yt4/Pp9q33O30c61oJpCtLyEvTdg4p65qOp2DQfiL3HXQ
	 /z5Mzz8esJy2NQXe4vRAWT/H01an748U8WuwXsCP5jA14Ciirru51j4DhKw+qW2NvjWbB
	 pHOt4+xuq2PzM7odZDmFgPN5t5s6XkpOrrEgqDUhIA0/zCCQrtz3bp+AEB+XrHbrCTf1T
	 QaGmJXy3/N39HuZAUdoSAoowykrLMs8n75EhUj1I/lBm+7e5F1hyN1DARSfpHT6iVOhMS
	 sqz8+TO2ESGCzGJxdCEPbzHoywjQ4wqZy+W9PaDreQdoh+VBPgQUMeifzyXSn6fyDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=B7kws+yQ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D370606A32C
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D370606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=B7kws+yQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W9XIQf5WO4PEAWNjD1poHpKZ6Je6CSNQUG+XksB14gM=; b=B7kws+yQQr6QO5oYaQ8YLFRnGU
	YE0rhH0yOYgL4/lElw97lbUrChnDTjQjJsSQ2LyjygJCpunmpSNjeEb61SsTFX+vjy9m16f9h1QQq
	f/VCAJZOEp/383gGxW3sZ+PslNoOT/NSbtxQAxWSQa5JJwHBoS6J2dWRmlk0vzBivoaY=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-2G
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/20] wifi: mt76: mt7925: leave the BIP check of a group frame to mac80211
Date: Mon, 23 Nov 2026 14:49:05 +0100
Message-ID: <20261123134920.154270-6-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7925_mac_fill_rx() sets RX_FLAG_DECRYPTED and RX_FLAG_IV_STRIPPED
for every frame whose RXD carries a cipher. That includes a group
addressed robust Management frame that the hardware matched with the
IGTK. The MME of such a frame stays in place, and the driver installs
the IGTK without an IPN.

With both flags, ieee80211_rx_h_decrypt() takes the frame as verified
and checks neither the MIC nor the IPN. No check of the IPN in the
hardware is known. A station with PMF can thus accept a replayed group
Deauthentication or Disassociation of its AP.

Do not report a frame with a BIP cipher as decrypted. mac80211 then
selects the IGTK by the key id of the MME, and checks the IPN and the
MIC. It also removes the MME. For an offloaded IGTK, it uses the CMAC
key that it keeps.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index a99a2c497458..cc8ea0d37430 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -423,6 +423,7 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	u8 mode = 0; /* , band_idx; */
 	u16 seq_ctrl = 0;
 	__le16 fc = 0;
+	u8 sec_mode;
 	int idx;
 
 	memset(status, 0, sizeof(*status));
@@ -478,7 +479,9 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2) != 0 &&
+	/* a BIP frame keeps its MME, for mac80211 to check MIC and IPN */
+	sec_mode = FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2);
+	if (sec_mode != 0 && sec_mode != MT_CIPHER_BIP_CMAC_128 &&
 	    !(rxd1 & (MT_RXD1_NORMAL_CLM | MT_RXD1_NORMAL_CM))) {
 		status->flag |= RX_FLAG_DECRYPTED;
 		status->flag |= RX_FLAG_IV_STRIPPED;
@@ -509,7 +512,7 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			switch (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2)) {
+			switch (sec_mode) {
 			case MT_CIPHER_AES_CCMP:
 			case MT_CIPHER_CCMP_CCX:
 			case MT_CIPHER_CCMP_256:
-- 
2.47.3

