Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=4qfTiP55OFgpdloD4sAN0r+WxYbAP6rz9XVsC/uDabY7v281M0UjvfI3XRqr6huWGXjH
	 +EtPv2p0s00PDzqpMv4Vvma61Dl5zRhtXWpfPI7x4baK62VYlnphxcho23tuoHSk82nCW
	 R5H7VZmWhVbdLmoHl6PEPESD6jPQWYnF8C1EUy2mlrKaBPoFjZ5qDb5qt7iQAtvBuUfin
	 vpcvwbEYqbVA0aSnsuFsnf3BHj4lMI+bRMZQu+k1antU/tteXT49GJd3WIhDUbyW4uaEu
	 4ntSitK7pe8sdA7BViZfE4foQpZKTmTf7oR5eHu05wWSLO0JT5CbmmubVM694zQZZ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d1/damMB7tSqwq6DX4WHZ82JJMqig3EchKXdHRywHrw=;
	b=03/ELQGB+vSQSkl/8ptEMHk5K/ZMF9SooLlOK6aMH9Y1b0RURYHdDk/qy6mnZm0MjXYW
	 q14nabOcsr/tWm+tZigZETk44DYXFxyWZ0sneARfOtRNOS7JiTVwQTO0MYTpPfcluBSvK
	 7r+WO3r6lFdXBygOTWZ0d9OMEjdwbzvPNV0FT3C4TsTstDSIPd2m66+G2jbldfUG3T/F4
	 Qwfq1I0h3aPhAuZd1Kkd/WBzaLCamCrGzMrZ2gcG4so3ho7s0HL/X+pCEXeiwOThSpWFs
	 hP5yYEWe4DAAgbVYOwETTsuUOm6ftbB1KLd3dxYxe2PBnF3UcF1YpP63It6F9M6+7Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UQ2bjsj2;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9524606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9524606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UQ2bjsj2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=d1/damMB7tSqwq6DX4WHZ82JJMqig3EchKXdHRywHrw=; b=UQ2bjsj2+qVbeG9vKt8GlUXigV
	7x7JKyiO+Wtl/FeAiwajICUFBZzopiVdbcb0e5MBNPO9bJAagb25rqr6zwM7JCOZr01ExQRL98aBi
	zftRsANWzPfryEf61nWYoIj8SEYKX7DU3uWXRlkI/5kylbsFgRX1qNku6FtvDX87ew5M=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-0e
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/16] wifi: mt76: mt7915: send the current SM power save mode in STA_REC_HT
Date: Thu, 26 Nov 2026 19:23:12 +0100
Message-ID: <20261126182325.2516607-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

mt7915_mcu_sta_ht_tlv() sends the SM power save bits of the HT
capabilities of the association, which mac80211 does not update when
the peer changes its mode by an Action frame. A later STA_REC update,
for example after a firmware reset, thus restores the old mode, from
which the MT7915 chip takes the stream limit of the peer.

Send the current mode of the peer, as STA_REC_RA and the MMPS update
already do. For the peer of a station or mesh interface, mac80211 keeps
the mode disabled, since only a non-AP STA indicates it.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5da3bfaa5c53..6a19f52d9932 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1031,6 +1031,21 @@ mt7915_mcu_sta_muru_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 		HE_MAC(CAP3_RX_CTRL_FRAME_TO_MULTIBSS, elem->mac_cap_info[3]);
 }
 
+static enum mcu_mmps_mode
+mt7915_mcu_get_mmps_mode(enum ieee80211_smps_mode smps)
+{
+	switch (smps) {
+	case IEEE80211_SMPS_OFF:
+		return MCU_MMPS_DISABLE;
+	case IEEE80211_SMPS_STATIC:
+		return MCU_MMPS_STATIC;
+	case IEEE80211_SMPS_DYNAMIC:
+		return MCU_MMPS_DYNAMIC;
+	default:
+		return MCU_MMPS_DISABLE;
+	}
+}
+
 static void
 mt7915_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 		      struct ieee80211_sta *sta)
@@ -1045,6 +1060,9 @@ mt7915_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 
 	if (!mvif->cap.ht_ldpc)
 		cap &= ~IEEE80211_HT_CAP_LDPC_CODING;
+	u16p_replace_bits(&cap,
+			  mt7915_mcu_get_mmps_mode(sta->deflink.smps_mode),
+			  IEEE80211_HT_CAP_SM_PS);
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 
@@ -1429,21 +1447,6 @@ mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
-static enum mcu_mmps_mode
-mt7915_mcu_get_mmps_mode(enum ieee80211_smps_mode smps)
-{
-	switch (smps) {
-	case IEEE80211_SMPS_OFF:
-		return MCU_MMPS_DISABLE;
-	case IEEE80211_SMPS_STATIC:
-		return MCU_MMPS_STATIC;
-	case IEEE80211_SMPS_DYNAMIC:
-		return MCU_MMPS_DYNAMIC;
-	default:
-		return MCU_MMPS_DISABLE;
-	}
-}
-
 int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
-- 
2.47.3

