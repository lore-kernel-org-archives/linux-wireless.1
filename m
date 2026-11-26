Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=01VrRPs1+N04kButqlkAD1R+iz1xDkfB23wirhdcXnvf3KA7fFfCVT+4YoaAJ1c0bWht
	 yq0asPi67DV1mRNIS1UzI21tHUVdk4GRYpYcb/c39+Mxtyd1vrxx1elhfMoCRjlfS8irb
	 GaYQ95dBncGE2lB9fG8nNH+BtTqVun9I+PUMaPrUAUQ0PX/W6IDlBkudQ5BaqtD7CH+3G
	 HAuTGUTPjAZfn71YxAI+xryKKgvzxfKHpMt+oghZCOzNvQD/QUTl2sQcnCwYFGThwyxnr
	 y2A4+rC6rQ6evLKYneMEWGP/hEd1wlzkmzb6YC2I7sai6CaF0QGVSUD6V2Xgm7tb6nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1gNc3KrySEo/mKuN7yOumcsfSuMCSYgk3SYpVzPq0WI=;
	b=NFgZcqscdBfliDxghVk5RLU256QzbshnIrUWqdGEtR5kyx2sStyrp3fYWY8PtaT3ZA83
	 L5PJLXVddj7ObA2ESDBWRI7yzKGdh8Uvs7dOY+dlxPPYlxY2SeIFc0y9PiY7WU1hv8Q7+
	 sRSoyeG9aDealMMPHfwDEwp+gepdhPWWnRfjNdzZSkZzv7i9Wdhiv8olnLxVp9O0gipd7
	 +QK4htBFaUA17xYDajW6IQq9S8BGtZ12H527rAwxfL1839A6OHBNsr3A7KhI6rYFEMy/W
	 tMvDl6+h1ETL7bT+qHo3ThAdUDZDh/OYsI3d+u97Dph6oxMpgtbG/U7LJ2+ZfSdTWcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nsNKm6NG;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE2D606A680
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE2D606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nsNKm6NG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1gNc3KrySEo/mKuN7yOumcsfSuMCSYgk3SYpVzPq0WI=; b=nsNKm6NGveDyMUQRyfc03dUxv2
	+g4pi/XpPAbu30YqA/MiE45bCq8VR6mR+uVAu593KMx17jZNWrXb2Ybq2qmN80k8aUPihvS2D+xU4
	0g8MIzJKs/R/xDI7EIGRAWb17jPzzS/V6JJa3ODEDdAX9bq4zxUjqG9u6YOAYNM4Bw7A=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-1t
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/16] wifi: mt76: mt792x: check the RX PN of group addressed frames
Date: Thu, 26 Nov 2026 19:23:20 +0100
Message-ID: <20261126182325.2516607-11-nbd@nbd.name>
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

For a group addressed frame whose WLAN_IDX names a peer,
mt792x_rx_get_wcid() returns the vif wcid, whose per-TID counters all
group keys of the vif share. After a GTK rekey, frames of the new key
thus read as replays until their PN passes that of the old key. On
mt7925 this wcid also serves every link of an MLD station, each with a
GTK of its own. A frame whose WLAN_IDX names the vif wcid gets no wcid
and no replay check.

Check a group addressed frame against the counters of its key id, on
the vif wcid of the link that holds the key.

Also point mvif->sta.vif at the vif in mt7921_add_interface(), as
mt7925_add_interface() does, since the link lookup reads it. The
fragment path of mt7921_mac_fill_rx() then needs a station behind the
wcid, as mt7925_reverse_frag0_hdr_trans() does.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c  | 8 ++++++--
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index a2d577872566..a843b0a46a99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -212,6 +212,8 @@ mt7921_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 
 	chfreq = FIELD_GET(MT_RXD3_NORMAL_CH_FREQ, rxd3);
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
 	status->wcid = mt792x_rx_get_wcid(dev, idx, unicast);
 
@@ -385,7 +387,7 @@ mt7921_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 		struct ieee80211_vif *vif;
 		int err;
 
-		if (!msta || !msta->vif)
+		if (!msta || !msta->vif || !status->wcid->sta)
 			return -EINVAL;
 
 		vif = container_of((void *)msta->vif, struct ieee80211_vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 9b13e9c25cf3..eaf8e5098b0c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -317,6 +317,7 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->bss_conf.mt76.omac_idx = mvif->bss_conf.mt76.idx;
 	mvif->phy = phy;
 	mvif->bss_conf.vif = mvif;
+	mvif->sta.vif = mvif;
 	mvif->bss_conf.mt76.band_idx = 0;
 	mvif->bss_conf.mt76.wmm_idx = mvif->bss_conf.mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
@@ -335,6 +336,8 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->sta.deflink.wcid.idx = idx;
 	mvif->sta.deflink.wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&mvif->sta.deflink.wcid, mvif->bss_conf.mt76.band_idx);
+	mt76_wcid_rx_group_pn_set(&mvif->sta.deflink.wcid, vif,
+				  &mvif->bss_conf.mt76.rx_group_pn);
 
 	mt7921_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 3389a3236187..1e8498956cc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -444,6 +444,8 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 
 	chfreq = FIELD_GET(MT_RXD3_NORMAL_CH_FREQ, rxd3);
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
 	status->wcid = mt792x_rx_get_wcid(dev, idx, unicast);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index c26d9982650f..3e614af35141 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -449,6 +449,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	mlink->wcid.idx = idx;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&mlink->wcid, 0);
+	mt76_wcid_rx_group_pn_set(&mlink->wcid, vif, &mconf->mt76.rx_group_pn);
 
 	mt7925_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index ebf4c32924c4..d4ea2142631c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -147,14 +147,18 @@ struct mt76_wcid *mt792x_rx_get_wcid(struct mt792x_dev *dev, u16 idx,
 		return wcid;
 
 	if (!wcid->sta)
-		return NULL;
+		return mt76_rx_group_wcid(wcid);
 
 	link = container_of(wcid, struct mt792x_link_sta, wcid);
 	sta = link->sta;
 	if (!sta->vif)
 		return NULL;
 
-	return &sta->vif->sta.deflink.wcid;
+	link = mt792x_sta_to_link_rcu(&sta->vif->sta, wcid->link_id);
+	if (!link)
+		link = &sta->vif->sta.deflink;
+
+	return &link->wcid;
 }
 EXPORT_SYMBOL_GPL(mt792x_rx_get_wcid);
 
-- 
2.47.3

