Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=saUiD9xxExXJ7x7iOzrCUJoC16UX8HxDzpBtdzVPDJhC+24X+/M9GIqxIIUmEiGc60sx
	 1NW1NOvpQ/92sUZndPHVLoEFuF/NApCvJ2Nld1wQ5pCoOJKY/TRiTJUdabZxqntvq3IzO
	 JolgdObNbaChw3R+sQBTsGKWMQuGr8utQlxNocKS8JhK6eEkHDvTvCSDNeMMP10LiUtDN
	 PjAyD4Z8t4PzB+mu7P84tuTlW2CqrhSt7S1kvy9DjTBVB+0n57xiCg1ZaYRCLCiLZUiOX
	 Rjk83LegTaWM2EqgXj4mzoBa00W2TTU9kV2/B8qBrlvbCFo8iaSLb13F+9o2tdnIkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t7v1Ota8n0faCG0PBrd4lhz3UUkrwpYF2pJSeT5j93c=;
	b=SJEPaKKQQPkIVaH9RTeeZkJwgAno13ngyF4PGflj716NMTr+2ogxJm79MSnPJLNLTXQ6
	 PRLtASen3ADzVtUB/4pukzT76e+KnDj/M7Wb/pEn3vyZFEVJTRldMzDTuhvKC30zx5jk6
	 0Dq033BIheT+0LgXpuXnRsf+k1wVo9iUvigNMtY/ejvZPhd1+BoT+VTheoit1FeOzi33W
	 Qnj2wZwSIL1FOvsk3o7xIY+jJEWslrb/WEE3ALvCxbi1kQuiOShyMRHOmdLyGyy3JKPng
	 srsYnenC/4HuNz32Q6VFrnt2JYgzXFNeDOOACNBEVl/aMgCTj9mM3wMA6laQfiEtjZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qEBZv1Qt;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5A606A336
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C5A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qEBZv1Qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t7v1Ota8n0faCG0PBrd4lhz3UUkrwpYF2pJSeT5j93c=; b=qEBZv1QtIpuqseevx9MDS64BoU
	B/4yu4U0k9buWjuuFUPDiHbaaRM2yRUdiW7+syNsTVYrmapNSCgTD0ieXgN6rBg1GtGQVH+Pr+hj9
	e6IwqPkTd6r3FBhlFMVT89mZ4J1hC1/gZlwX1lu7CYfmKzLXzYo/Iy/Dk+p0A78EO/74=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-1L
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/16] wifi: mt76: mt7915: check the RX PN of group addressed frames
Date: Thu, 26 Nov 2026 19:23:19 +0100
Message-ID: <20261126182325.2516607-10-nbd@nbd.name>
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
mt7915_rx_get_wcid() returns the vif wcid, whose per-TID counters all
group keys of the vif share. After a GTK rekey, frames of the new key
thus read as replays until their PN passes that of the old key. A frame
whose WLAN_IDX names the vif wcid gets no wcid and no replay check.

Check a group addressed frame against the counters of its key id, also
where WLAN_IDX names the vif wcid.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e458661d750b..0505d55f1c0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -61,7 +61,7 @@ static struct mt76_wcid *mt7915_rx_get_wcid(struct mt7915_dev *dev,
 		return wcid;
 
 	if (!wcid->sta)
-		return NULL;
+		return mt76_rx_group_wcid(wcid);
 
 	sta = container_of(wcid, struct mt7915_sta, wcid);
 	if (!sta->vif)
@@ -313,6 +313,8 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb,
 		status->flag |= RX_FLAG_ONLY_MONITOR;
 
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
 	status->wcid = mt7915_rx_get_wcid(dev, idx, unicast);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 50e67a209693..e604b82635e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -258,6 +258,8 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 	mvif->sta.wcid.idx = idx;
 	mvif->sta.wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&mvif->sta.wcid, phy->mt76->band_idx);
+	mt76_wcid_rx_group_pn_set(&mvif->sta.wcid, vif,
+				  &mvif->mt76.rx_group_pn);
 
 	mt7915_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-- 
2.47.3

