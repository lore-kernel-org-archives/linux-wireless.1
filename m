Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=ButxK/MU/Ho8Ym4BCwRNh1LkOk1G/NNwCspaAhLBCQxVP8o1FGdA6lt5g41cwULpfaut
	 zna4TDm0JHMpHNYNnHDUhbX7vpbDVYoh2a7fqHB5II+MX2llrWj0C9LTCdN9wPP3U5WEm
	 L2sitZfvbjZr0rH6OVbBh6NT8S7HI+bY1lpn4PLdhzRZ4UN0Q9K1o18AQCHi+yBk+axI6
	 upXFdLQzs1JYB28OHRjsgBvcyKLNvp0FeqUTQqqhxHMNz02LIhOJZhzHRf3s235f6weLU
	 qp8+0F1nbuDXsLajDUzhrIjNicJqlaOHD1Ag79iAohhaGiQnkhxX7silE4h66uar7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYXZxeXWM/CEiuQq/2FPP/kHzsghk6fyr7x+siANU/Y=;
	b=HW55rZphQf+47Z9PmE+k4tY+mgEnR+1EfrE8iB1DAYFqqriOfuG0t7DYAGO541SOlQc5
	 wSOnYtF8Ui6ESoSIh7YjoFPMS7ErHarrdoc2nEhgBFcB2sBcE3svmWp3oCX+eOoxu5GdX
	 zVfTHOsMt91B5cksosouG5C8J8Ct0Ruu0P9NUlr/aBIffArXXKZiddE5Kot+sAd3mu7vs
	 28y8m2xUf+FBB8dqV5luJQC4/d0J5gy43W8SCssIfCixOajRWrk/ZuRmjcha5klV7yR4n
	 WKfU55MKasR9cKA6uSxPu9yGGn8NMp0YKOW4eZLRuMKarM7+o3Wqo2xISUki9XWKcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="GBBJ0/IK";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849B606A68B
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5849B606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=GBBJ0/IK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cYXZxeXWM/CEiuQq/2FPP/kHzsghk6fyr7x+siANU/Y=; b=GBBJ0/IKfZJ46m1tRmbPiT1ou3
	XNAjX/Dz0ya/nrRtGxoHXbaAbCwo5AIUdSxLLTJhKb75l0bJL5rHsUmvHmP9e6ZaNnjV1JGg3Kv4E
	8/RkyzD+zG/mUdWS1vTQuZnSwd1viWuKIk+bZ86Gg6UImz0+NSBtyPQsnxM7ObJsCqrc=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-2z
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/16] wifi: mt76: mt7603: check the RX PN of group addressed frames
Date: Thu, 26 Nov 2026 19:23:22 +0100
Message-ID: <20261126182325.2516607-13-nbd@nbd.name>
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
mt7603_rx_get_wcid() returns the vif wcid, whose per-TID counters all
group keys of the vif share. After a GTK rekey, frames of the new key
thus read as replays until their PN passes that of the old key. A frame
whose WLAN_IDX names the vif wcid gets no wcid and no replay check.

Check a group addressed frame against the counters of its key id, also
where WLAN_IDX names the vif wcid.

Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c    | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7603/main.c   | 1 +
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 836ce7dfb551..5940306ed3ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -519,7 +519,7 @@ mt7603_rx_get_wcid(struct mt7603_dev *dev, u8 idx, bool unicast)
 		return wcid;
 
 	if (!wcid->sta)
-		return NULL;
+		return mt76_rx_group_wcid(wcid);
 
 	sta = container_of(wcid, struct mt7603_sta, wcid);
 	if (!sta->vif)
@@ -550,6 +550,8 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 	sband = (i & 1) ? &dev->mphy.sband_5g.sband : &dev->mphy.sband_2g.sband;
 	i >>= 1;
 
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
 	status->wcid = mt7603_rx_get_wcid(dev, idx, unicast);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 61f246193987..c8f77ace0eb1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -69,6 +69,7 @@ mt7603_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->sta.wcid.idx = idx;
 	mvif->sta.vif = mvif;
 	mt76_wcid_init(&mvif->sta.wcid, 0);
+	mt76_wcid_rx_group_pn_set(&mvif->sta.wcid, vif, &mvif->rx_group_pn);
 
 	eth_broadcast_addr(bc_addr);
 	mt7603_wtbl_init(dev, idx, mvif->idx, bc_addr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 47f5be44292d..6c89e087d57d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -86,6 +86,7 @@ struct mt7603_sta {
 struct mt7603_vif {
 	struct mt7603_sta sta; /* must be first */
 
+	struct mt76_rx_group_pn rx_group_pn;
 	u8 idx;
 };
 
-- 
2.47.3

