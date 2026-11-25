Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628189;
	b=Tjhs8Sx1BEbZpNUmVqQz80j87KOU7t8zukJdWzJgoAnU/dh/+C4GXblv4F4U1jY+mbl7
	 q6UNf6Pk4dhEKFSWRj0LP+eBGV/4Iv1L8ahDVTBTtwsdWFftu6/xtLRmVKVqF3BjWbou3
	 AgdkZbCnybGQt2RDDuaR6sUMWUVrWPAwWVMZq2GUUuvktqhnTB6wVNBd1w7UAXDXG8yqE
	 l0EXTgpVVwrHBXcKk0zM2mxM1LEyWB7SecsRqfEj74kL58jDqYv1F4HwKhmu+yFQhvLmh
	 8tUpPxzZ4xnnSZ0ps8d69MJkSVbvnrW/UFmj36beztwRl33sz2OIiRyRiQVeAZXeh/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628189;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dSb3aQKphCPjjhkEl3LZZnbt9E1QwQX1H+buXzTt7xg=;
	b=y4/LZWMCAOrbMW3i8FWLz2nQNyr3lIQvcsfwac2KNbopNoDxLEMmjhXutVSfiBXgIX8N
	 nqHzvdfaupsm6kt2kRntdvkBu57A8/Y69EtldyYemPK/G3ng9S73te0SVQEOTp4ovYirs
	 F/Bm508H7utOdRZikY5HrZ++3vyCbTlLe4rlJfWwxnMWRYzxaWUvSiMgTINLJ6GcQZXMq
	 c+JSA2EeSwWD1AXII6zINBpXoIptWzZsNJKZtTknuHTifNJha2jDq6kksANjvOTHGqSK7
	 2vocvaYRtrrYgrZ89LawfXc3oO58JMFFjBEPqH+05oVrffklAv45TY1UhI/G2xquK6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rthbhL18;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F2606A68F
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95F2606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rthbhL18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dSb3aQKphCPjjhkEl3LZZnbt9E1QwQX1H+buXzTt7xg=; b=rthbhL18NV/i57uyNATX/a3T+P
	Lg60FofdEUfwgM1XChWL+DhFnOCMoKB56S+xlAIHYmxHwJJ4yhKAQyn2DL04Txxiq7QYGRzZiSmNd
	UD1NP0FwiUL62Y1IBdgXJwbVlgzERQIO+8Icr1ska+7G+EptLZtDQ8MTuEV/Ss9nbqtg=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-1D
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/18] wifi: mt76: mt7915: mask the LDPC bits of STA_REC_HT and STA_REC_VHT
Date: Wed, 25 Nov 2026 18:36:11 +0100
Message-ID: <20261125173616.3776951-13-nbd@nbd.name>
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

mt7915_mcu_sta_ht_tlv() and mt7915_mcu_sta_vht_tlv() send the HT and
VHT capability words of the peer unchanged. The firmware picks LDPC for
a TX rate from these words. Only STA_REC_RA masks them with the LDPC
capability of the interface. Since commit 33eb14f10290 ("wifi: mt76:
mt7915: use mac80211 .sta_state op"), the update at authorisation sends
these TLVs again without STA_REC_RA. An AP configured without LDPC thus
sends LDPC frames to an LDPC peer.

Clear the LDPC bit of each word where the interface has no LDPC for that
mode. The rate control and HE TLVs already do so.

Fixes: 33eb14f10290 ("wifi: mt76: mt7915: use mac80211 .sta_state op")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8ac595779f88..5da3bfaa5c53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1032,33 +1032,45 @@ mt7915_mcu_sta_muru_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 }
 
 static void
-mt7915_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7915_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+		      struct ieee80211_sta *sta)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	u16 cap = sta->deflink.ht_cap.cap;
 	struct sta_rec_ht *ht;
 	struct tlv *tlv;
 
 	if (!sta->deflink.ht_cap.ht_supported)
 		return;
 
+	if (!mvif->cap.ht_ldpc)
+		cap &= ~IEEE80211_HT_CAP_LDPC_CODING;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 
 	ht = (struct sta_rec_ht *)tlv;
-	ht->ht_cap = cpu_to_le16(sta->deflink.ht_cap.cap);
+	ht->ht_cap = cpu_to_le16(cap);
 }
 
 static void
-mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	u32 cap = sta->deflink.vht_cap.cap;
 	struct sta_rec_vht *vht;
 	struct tlv *tlv;
 
 	if (!sta->deflink.vht_cap.vht_supported)
 		return;
 
+	if (!mvif->cap.vht_ldpc)
+		cap &= ~IEEE80211_VHT_CAP_RXLDPC;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
 
 	vht = (struct sta_rec_vht *)tlv;
-	vht->vht_cap = cpu_to_le32(sta->deflink.vht_cap.cap);
+	vht->vht_cap = cpu_to_le32(cap);
 	vht->vht_rx_mcs_map = sta->deflink.vht_cap.vht_mcs.rx_mcs_map;
 	vht->vht_tx_mcs_map = sta->deflink.vht_cap.vht_mcs.tx_mcs_map;
 }
@@ -1805,9 +1817,9 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		/* starec bfer */
 		mt7915_mcu_sta_bfer_tlv(dev, skb, vif, sta);
 		/* starec ht */
-		mt7915_mcu_sta_ht_tlv(skb, sta);
+		mt7915_mcu_sta_ht_tlv(skb, vif, sta);
 		/* starec vht */
-		mt7915_mcu_sta_vht_tlv(skb, sta);
+		mt7915_mcu_sta_vht_tlv(skb, vif, sta);
 		/* starec uapsd */
 		mt76_connac_mcu_sta_uapsd(skb, vif, sta);
 	}
-- 
2.47.3

