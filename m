Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628189;
	b=gzll9jQXFEORYbzOCY5l8JXOoKmlMi06ceOr+z9FaGEsyOzPjfvKWc4HM7z1GtreglTN
	 M5Yp+7B+yFVlgHD/FW0jGBAf5+X67uQTJ6hisQ/dInP21fszKSErnek6WjETlswbFOhIz
	 ngFvwybuL9/vRjeXibKu3GIcD3fUv0pvLHMyAn3S3/sHWxsZ4n+3vYEm/0cEjtT8fYDjz
	 ETq+RFPmyDvohnmyxTp2IPIB0cV7VLSrEHwcoNRj8F1NxErgY/jSICgI1QIqv4JMxXQJr
	 oBl1ukoHYuGMiRpSrrlK/Xzr2nYKb73x9OszKUcAzOpfdRkPKen38th4wYHaNX5cAgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628189;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wKOVUq6W8HheetWzwP89zr+0Gm+Ep/r5D91wxIyfeEs=;
	b=ImOmns16b7mZUvykFzWD5tcrbUy6bUWATymzdMACHHoPkkmlCzUJ42cYjegx/krfQgk/
	 SxjxDAzWAmFP9RbXETFYED7ORsdhJkwQRsmV2zZ16GeHVXU5cOebXOT/SFOCQrAGTgOq2
	 OeRersSTRA9frA1RXAG4QwfMCL7VY26Ov7i353TmyfUopkxgdzMChjhB7RGYRl8RnP/B3
	 euQn4BzJtYttumd+g6HJMzBGki692rBU0ZaIUiSn5sh2Uiman/t/sn8wcBr0D1smYDcWb
	 f4LRR/rfK+OIOZYYiitAO0pd1GxHE7FLjKTD1Srh/8Mt725AxCfn5aRsng3CZufAgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="g/fgEzLe";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4EA606A693
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4EA606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=g/fgEzLe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wKOVUq6W8HheetWzwP89zr+0Gm+Ep/r5D91wxIyfeEs=; b=g/fgEzLeQIz61BFLpeMH53yYww
	qjY3Yc3PyMuscLY1/Htj3xt2CFZxg0+kiW1r6yCWKbw+eOTORchjn610HBSOmF6Lpr4EUij3wSx7Q
	ScaoOVwT/mk9fSGHbSLFT+ymEJtqtrgT0IhD1miuXKqMoq1vOxqOYuN7aw4vR9et43rc=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-1n
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/18] wifi: mt76: mt7996: mask the LDPC bits of STA_REC_HT, _VHT and _HE_V2
Date: Wed, 25 Nov 2026 18:36:12 +0100
Message-ID: <20261125173616.3776951-14-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7996_mcu_sta_ht_tlv(), mt7996_mcu_sta_vht_tlv() and
mt7996_mcu_sta_he_tlv() send the capability words of the peer
unchanged, but an AP keeps its own LDPC setting in link_conf. The
firmware takes the HE LDPC bit of the station from STA_REC_HE_V2, and
STA_REC_RA picks LDPC for HE and EHT rates from that bit. An AP
configured without LDPC thus sends HE and EHT frames with LDPC to an
LDPC peer. STA_REC_HT and STA_REC_VHT also set the HT and VHT LDPC
flags of the WTBL entry from the raw words, and STA_REC_RA never clears
them.

On an AP interface, clear the LDPC bit of each word where link_conf has
no LDPC for that mode. mt7996_mcu_sta_rate_ctrl_tlv() does the same for
the VHT flag, mt7915_mcu_sta_he_tlv() for the HE flag. The EHT
capabilities have no LDPC bit of their own; an EHT peer uses the HE bit.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 30 ++++++++++++++-----
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4e1164e3afa4..1c4bb5706d49 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1639,6 +1639,7 @@ int mt7996_mcu_add_rx_ba(struct mt7996_dev *dev,
 
 static void
 mt7996_mcu_sta_he_tlv(struct sk_buff *skb,
+		      struct ieee80211_bss_conf *link_conf,
 		      struct ieee80211_link_sta *link_sta,
 		      struct mt7996_vif_link *link)
 {
@@ -1660,6 +1661,9 @@ mt7996_mcu_sta_he_tlv(struct sk_buff *skb,
 		he->he_phy_cap[i] = elem->phy_cap_info[i];
 	}
 
+	if (link_conf->vif->type == NL80211_IFTYPE_AP && !link_conf->he_ldpc)
+		he->he_phy_cap[1] &= ~IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
+
 	mcs_map = link_sta->he_cap.he_mcs_nss_supp;
 	switch (link_sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
@@ -1742,18 +1746,23 @@ mt7996_mcu_sta_eht_tlv(struct sk_buff *skb,
 }
 
 static void
-mt7996_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
+mt7996_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
+		      struct ieee80211_link_sta *link_sta)
 {
+	u16 cap = link_sta->ht_cap.cap;
 	struct sta_rec_ht_uni *ht;
 	struct tlv *tlv;
 
 	if (!link_sta->ht_cap.ht_supported)
 		return;
 
+	if (link_conf->vif->type == NL80211_IFTYPE_AP && !link_conf->ht_ldpc)
+		cap &= ~IEEE80211_HT_CAP_LDPC_CODING;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 
 	ht = (struct sta_rec_ht_uni *)tlv;
-	ht->ht_cap = cpu_to_le16(link_sta->ht_cap.cap);
+	ht->ht_cap = cpu_to_le16(cap);
 	ht->ampdu_param = u8_encode_bits(link_sta->ht_cap.ampdu_factor,
 					 IEEE80211_HT_AMPDU_PARM_FACTOR) |
 			  u8_encode_bits(link_sta->ht_cap.ampdu_density,
@@ -1761,8 +1770,10 @@ mt7996_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 }
 
 static void
-mt7996_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
+mt7996_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
+		       struct ieee80211_link_sta *link_sta)
 {
+	u32 cap = link_sta->vht_cap.cap;
 	struct sta_rec_vht *vht;
 	struct tlv *tlv;
 
@@ -1770,10 +1781,13 @@ mt7996_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 	if (!link_sta->he_6ghz_capa.capa && !link_sta->vht_cap.vht_supported)
 		return;
 
+	if (link_conf->vif->type == NL80211_IFTYPE_AP && !link_conf->vht_ldpc)
+		cap &= ~IEEE80211_VHT_CAP_RXLDPC;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
 
 	vht = (struct sta_rec_vht *)tlv;
-	vht->vht_cap = cpu_to_le32(link_sta->vht_cap.cap);
+	vht->vht_cap = cpu_to_le32(cap);
 	vht->vht_rx_mcs_map = link_sta->vht_cap.vht_mcs.rx_mcs_map;
 	vht->vht_tx_mcs_map = link_sta->vht_cap.vht_mcs.tx_mcs_map;
 }
@@ -2691,7 +2705,7 @@ int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct mt7996_sta *msta,
 	 * update sta_rec_he here.
 	 */
 	if (changed)
-		mt7996_mcu_sta_he_tlv(skb, link_sta, link);
+		mt7996_mcu_sta_he_tlv(skb, link_conf, link_sta, link);
 
 	/* sta_rec_ra accommodates BW, NSS and only MCS range format
 	 * i.e 0-{7,8,9} for VHT.
@@ -3046,16 +3060,16 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 						link);
 		}
 		/* starec ht */
-		mt7996_mcu_sta_ht_tlv(skb, link_sta);
+		mt7996_mcu_sta_ht_tlv(skb, link_conf, link_sta);
 		/* starec vht */
-		mt7996_mcu_sta_vht_tlv(skb, link_sta);
+		mt7996_mcu_sta_vht_tlv(skb, link_conf, link_sta);
 		/* starec uapsd */
 		mt76_connac_mcu_sta_uapsd(skb, link_conf->vif, sta);
 		/* starec amsdu */
 		mt7996_mcu_sta_amsdu_tlv(dev, skb, link_conf->vif, link_sta,
 					 msta_link);
 		/* starec he */
-		mt7996_mcu_sta_he_tlv(skb, link_sta, link);
+		mt7996_mcu_sta_he_tlv(skb, link_conf, link_sta, link);
 		/* starec he 6g*/
 		mt7996_mcu_sta_he_6g_tlv(skb, link_sta);
 		/* starec eht */
-- 
2.47.3

