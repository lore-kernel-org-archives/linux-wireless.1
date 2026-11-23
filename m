Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441766;
	b=FpLpjMg8MBXfu3z+NOG/42IQzgzqTch6g9mDHunBMMKXi1HoqY66tR6S7BJWahyIV794
	 OVDXvP9L16WdlM6ReyCC/1FRD0EVT5vE9adudC8kBhd2TWDVHSumKjF4rfhOlqdMdsClJ
	 useIZ2hiVuIelcvfOB2lAYFhXdxDKSeA69cQuH4k2Wxlc0tHnwZN039lpQwB2LpxVnKrD
	 A4v0aWOvi8n6zQrByj3TAoQuh0dlYe+xuZldQnnMhx9joNcmj/6UcJagHAGz0IxAM55XD
	 gOdHg3EO5rx3Er3AdZDr5RSFVaP2V84z5ERMK/PCn4dO8YRTqYAmBgK85IJFvILRT8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e8KSxVkOlcYgdE67987okdN8kyg/eYh7u5fRVusOO0s=;
	b=m1jaQsa9w1e72xHcmiE11e8Aiyy/yOs7xgQskdcpTupfmvIBl/yCbthbhRX0W61y88ua
	 pXR+cXpJh8+P/lMt8VI2F+EfrRJUInM/rIZNHDpsSXsN5C3gjBBGkFxmAipdrBm/eGF5S
	 T/rBqK9h2gM1w2h4OArdjgzsTIPFgcat+eVbSD8iUtjybm2lGurZPPGwDjt35sKewCz0G
	 Wvd91JmvJ8bHHwVv9O6fOsZ2bV9uGczOTA2Fzu6chHlXiplTkXZLmrsT9ygTcP3dzOkZm
	 owYn9OnCYLcj3MILyG/h8J1GM+OJy7QDl1d3xeKmuTzSxIjNMvPxKiljSr1IiAdXczA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Jrrh94Af;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADBF606A337
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADBF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Jrrh94Af
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e8KSxVkOlcYgdE67987okdN8kyg/eYh7u5fRVusOO0s=; b=Jrrh94Af5+QB3GJejqT3001ygG
	7lXj25VYpOwEgFBUrRpCdUkNIHtlPmEXjc+2Xkbi2zVM4m4D+uth/x/IG5P+N1aWZfgQMptQm5UMa
	srlH1mxx39U+EsSEGXFXvdbVEuyIe4beBioNYvpvGMF0pc0hCT0+Z3Lflv9fC0qV6U/8=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-2q
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 19/20] wifi: mt76: connac: set the band of an RX block ack scoreboard reset
Date: Mon, 23 Nov 2026 14:49:18 +0100
Message-ID: <20261123134920.154270-19-nbd@nbd.name>
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

mt76_connac_mcu_wtbl_ba_tlv() leaves band_idx of the recipient WTBL_BA
TLV at 0. The firmware takes the band of the RX block ack scoreboard
reset from this field alone. A session start or stop of a station on
band 1 thus resets the scoreboard entry of band 0. The entry on band 1
gets no reset.

Reachable via mt7915_ampdu_action() for every station of a band 1 phy.

Pass the band of the station's interface with the TLV. mt7615 keeps
band 0, because its firmware's use of the field is not known.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      | 8 ++++----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 9 +++++----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 4 ++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 3b4982660e61..e31fb63a5562 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -796,7 +796,7 @@ mt7615_mcu_wtbl_tx_ba(struct mt7615_dev *dev,
 		return PTR_ERR(wtbl_hdr);
 
 	mt76_connac_mcu_wtbl_ba_tlv(&dev->mt76, skb, params, enable, true,
-				    NULL, wtbl_hdr);
+				    0, NULL, wtbl_hdr);
 
 	err = mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				    MCU_EXT_CMD(WTBL_UPDATE), true);
@@ -844,7 +844,7 @@ mt7615_mcu_wtbl_rx_ba(struct mt7615_dev *dev,
 		return PTR_ERR(wtbl_hdr);
 
 	mt76_connac_mcu_wtbl_ba_tlv(&dev->mt76, skb, params, enable, false,
-				    NULL, wtbl_hdr);
+				    0, NULL, wtbl_hdr);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_EXT_CMD(WTBL_UPDATE), true);
@@ -967,7 +967,7 @@ mt7615_mcu_sta_ba(struct mt7615_dev *dev,
 		return PTR_ERR(wtbl_hdr);
 
 	mt76_connac_mcu_wtbl_ba_tlv(&dev->mt76, skb, params, enable, tx,
-				    sta_wtbl, wtbl_hdr);
+				    0, sta_wtbl, wtbl_hdr);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
@@ -1201,7 +1201,7 @@ mt7615_mcu_uni_rx_ba(struct mt7615_dev *dev,
 		return PTR_ERR(wtbl_hdr);
 
 	mt76_connac_mcu_wtbl_ba_tlv(&dev->mt76, skb, params, enable, false,
-				    sta_wtbl, wtbl_hdr);
+				    0, sta_wtbl, wtbl_hdr);
 
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_UNI_CMD(STA_REC_UPDATE), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ce1b4ed5e0d1..a250007101d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1148,8 +1148,8 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_sta_cmd);
 
 void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_ampdu_params *params,
-				 bool enable, bool tx, void *sta_wtbl,
-				 void *wtbl_tlv)
+				 bool enable, bool tx, u8 band_idx,
+				 void *sta_wtbl, void *wtbl_tlv)
 {
 	struct wtbl_ba *ba;
 	struct tlv *tlv;
@@ -1171,6 +1171,7 @@ void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		ba->rst_ba_tid = params->tid;
 		ba->rst_ba_sel = RST_BA_MAC_TID_MATCH;
 		ba->rst_ba_sb = 1;
+		ba->band_idx = band_idx;
 	}
 
 	if (!is_connac_v1(dev)) {
@@ -1357,8 +1358,8 @@ int mt76_connac_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
 	if (IS_ERR(wtbl_hdr))
 		return PTR_ERR(wtbl_hdr);
 
-	mt76_connac_mcu_wtbl_ba_tlv(dev, skb, params, enable, tx, sta_wtbl,
-				    wtbl_hdr);
+	mt76_connac_mcu_wtbl_ba_tlv(dev, skb, params, enable, tx,
+				    mvif->band_idx, sta_wtbl, wtbl_hdr);
 
 	ret = mt76_connac_mcu_sta_wed_update(dev, skb);
 	if (ret) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index a39f90eeb1c2..c5fb7e2adab1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -2053,8 +2053,8 @@ void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 void *wtbl_tlv, bool ht_ldpc, bool vht_ldpc);
 void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_ampdu_params *params,
-				 bool enable, bool tx, void *sta_wtbl,
-				 void *wtbl_tlv);
+				 bool enable, bool tx, u8 band_idx,
+				 void *sta_wtbl, void *wtbl_tlv);
 void mt76_connac_mcu_sta_ba_tlv(struct sk_buff *skb,
 				struct ieee80211_ampdu_params *params,
 				bool enable, bool tx);
-- 
2.47.3

