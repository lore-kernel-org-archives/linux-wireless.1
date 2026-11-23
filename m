Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=ldGsePqmjFY6gjsHm+bOVqaTC3GWc1SKxM18SbbfgEDCAkKytnkEMzfCiBZWAR0A3DsH
	 dLasEiujcotgrPfxEeQwFruS+RoL1VJVNTE9yMmiv6DhLmLpUkGi13lFlsauUIgzz//Kp
	 A+OxAlAVEibgilAj/UOWuY/U3vgYVnriLiyAGcfTs4dbRLAEKQpAW6+lr/fMCsOE5ZHYj
	 StUpaUv9LTWLkYmYiVPb+0P9QYqUIXyS29HMow+NuFDoh99S5PN4L6ExeEaHv7O04NtGI
	 nJuJfyIqDTiQECmBZ7/LZ7anIF6mPP4FuB+wsRz39GBIn9ZyFPhV/pyj9ocDG7NK20w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1by79QwBzQHxYXJ45iNQN5dWB+a8Pnd6BR3NB4MQ2Lk=;
	b=LzJQMiNIm4C6pWxNmPU2htZhlKkhJNyXEWy7NyV7uBJsO+efoW2PGW2tuwWQRKfADsaR
	 e100U6cL1bo/vsykVFWVVdOWeNMWDdjfuNu6hJMCO5Om3bnrZ5rEwH/tN5Qzz3B3lJGeo
	 aUYTkXnIKkCQwlfOSHVYjU639UYL5osXtBGoVKv9R9fLLWrzCoCnAHZY4gOm+kX3GIRvG
	 r6b/SX9SfkAG1UI/Hs3JHeR/TX/LxihtFzW2E0Q57s+aw1KlIWj2F91B9Qw9zPfd6Nr1A
	 q5lna7KLJw0Z+4Kc4yHqSeIGDVI4pDpnBHCfPMd93EHzsQVI+/IYO0wY2MibDX/pV8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pMT0NTKA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9B606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA9B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pMT0NTKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1by79QwBzQHxYXJ45iNQN5dWB+a8Pnd6BR3NB4MQ2Lk=; b=pMT0NTKAuPZqKTI9HSBYs9kj1d
	l6erXPBaU+iDZN+leLaVTDFYoe9qovpbTJ9tY59KMHsbR7g9XVJePIlty7TKb+Mbo5W7U5/Dv/oHo
	YPSl+P48Y9lefJz/vJPgjFzSNcBnvuN9JuGsAv0nlApcGz8iFSjd1L4dRBtC3TiXpWHk=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-1B
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/20] wifi: mt76: mt7915: leave the BIP check of a group frame to mac80211
Date: Mon, 23 Nov 2026 14:49:03 +0100
Message-ID: <20261123134920.154270-4-nbd@nbd.name>
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

mt7915_mac_fill_rx() sets RX_FLAG_DECRYPTED and RX_FLAG_IV_STRIPPED
for every frame whose RXD carries a cipher. That includes a group
addressed robust Management frame that the hardware matched with the
IGTK. The MME of such a frame stays in place, and the driver installs
the IGTK without an IPN.

With both flags, ieee80211_rx_h_decrypt() takes the frame as verified
and checks neither the MIC nor the IPN. The firmware of mt7981 keeps no
RX IPN. On mt7981, a station with PMF thus accepts a replayed group
Deauthentication or Disassociation of its AP.

Do not report a frame with a BIP cipher as decrypted. mac80211 then
selects the IGTK by the key id of the MME, and checks the IPN and the
MIC. It also removes the MME. For an offloaded IGTK, it uses the CMAC
key that it keeps.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 5d1b5abc8fff..b7f86195af2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -284,6 +284,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb,
 	u16 hdr_gap;
 	u16 seq_ctrl = 0;
 	__le16 fc = 0;
+	u8 sec_mode;
 	int idx;
 
 	memset(status, 0, sizeof(*status));
@@ -342,7 +343,9 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb,
 	if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1) != 0 &&
+	/* a BIP frame keeps its MME, for mac80211 to check MIC and IPN */
+	sec_mode = FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1);
+	if (sec_mode != 0 && sec_mode != MT_CIPHER_BIP_CMAC_128 &&
 	    !(rxd1 & (MT_RXD1_NORMAL_CLM | MT_RXD1_NORMAL_CM))) {
 		status->flag |= RX_FLAG_DECRYPTED;
 		status->flag |= RX_FLAG_IV_STRIPPED;
@@ -372,7 +375,7 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb,
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			switch (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1)) {
+			switch (sec_mode) {
 			case MT_CIPHER_AES_CCMP:
 			case MT_CIPHER_CCMP_CCX:
 			case MT_CIPHER_CCMP_256:
-- 
2.47.3

