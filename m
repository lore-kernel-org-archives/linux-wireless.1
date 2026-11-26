Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=rlHKh2M5ineEuKGjvxuLfx3gZGbOeTqfgG/MHXReUXLczgFGZ/x/v/CPd2P52j6BGx/n
	 oWRCS1Vsfy6ZFADDtiorhykZ8AjoJOY3KtIPf+Jzlj6+8xvVKjsq8DwxsOYvln18X4z37
	 pAdj4Fre9loX5O9VKkH1uAFZi8S7ujmnSPejMI+/BwB91x5NMm4XZr4TtcXfeU7QHunwh
	 71sZ25nFjigGSmbVrZ+82lQX9a/NLXiNxqcQRUu27kwFEWtCVGjtzYol5x0t0AHwYvDZI
	 JDDmLeBAGH81kBHq6OmhlTfMcav2m/QqckkfVGOhPOwAjHlVKK9ULrHxelZQbLcPLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vn7JuEX4yMJ4u/7Qermd2wNvzHY/oT7FmmtahrfQQrU=;
	b=DXOJu+yqtbvAkpFDBpvF3Et17Lb8VT2RHwBEm+ZNS7RoVgrItU617GSRzO68+A84/26m
	 /RWfZlqP2Wtzk8WlBF2AHIFMQBcpucni3TWELjyfF8cBDWyKbDhwKmqnXVq5TLGu3MTad
	 HH8bO2K4YISFtNnuLevETYdTD5KEBvT02KxXcib1qF7ziMKUX0O5XVYQ2rKe/ToGIaDGI
	 TuU1AI/58IAH4dqsNDI8E4ktHVbh8ApsAwofIOnb6YpbEGug4qLhSaiQ0crpjRngqbN81
	 CeDQZG4WD4zt/dtktDhtZbK9M/ZtilrghNTFE1g//B1FnMqwzn0ZJXM8rLEEaQpWIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YcZVz3rw;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6E1606A32C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YcZVz3rw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Vn7JuEX4yMJ4u/7Qermd2wNvzHY/oT7FmmtahrfQQrU=; b=YcZVz3rwTh9UFoKdHXX1qQRevz
	JvWk8RofJfBHaEX7aUsGW9/FFp7HduJkPl76c7pFMl1UILeoAlaS2q9uDA+oN73jJFsikNeCDu1b3
	+ZMe9Gl91VX+y5DctSOvLcqO9KXzNJ6IvN4Ndv4+q9OWnbgvf6nJIrrjGnEOEywztP4k=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-0C
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/16] wifi: mt76: mt7615: check the RX PN of group addressed frames
Date: Thu, 26 Nov 2026 19:23:17 +0100
Message-ID: <20261126182325.2516607-8-nbd@nbd.name>
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
mt7615_rx_get_wcid() returns the vif wcid, whose per-TID counters all
group keys of the vif share. After a GTK rekey, frames of the new key
thus read as replays until their PN passes that of the old key. A frame
whose WLAN_IDX names the vif wcid gets no wcid and no replay check.

Check a group addressed frame against the counters of its key id, also
where WLAN_IDX names the vif wcid.

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 0def4ba75817..492d1e1b6f0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -95,7 +95,7 @@ static struct mt76_wcid *mt7615_rx_get_wcid(struct mt7615_dev *dev,
 		return wcid;
 
 	if (!wcid->sta)
-		return NULL;
+		return mt76_rx_group_wcid(wcid);
 
 	sta = container_of(wcid, struct mt7615_sta, wcid);
 	if (!sta->vif)
@@ -378,6 +378,8 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 		status->flag |= RX_FLAG_ONLY_MONITOR;
 
 	unicast = (rxd1 & MT_RXD1_NORMAL_ADDR_TYPE) == MT_RXD1_NORMAL_U2M;
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
 	status->wcid = mt7615_rx_get_wcid(dev, idx, unicast);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 175e847f49ef..7af53894edd1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -226,6 +226,8 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	INIT_LIST_HEAD(&mvif->sta.wcid.poll_list);
 	mvif->sta.wcid.idx = idx;
 	mt76_wcid_init(&mvif->sta.wcid, mvif->mt76.band_idx);
+	mt76_wcid_rx_group_pn_set(&mvif->sta.wcid, vif,
+				  &mvif->mt76.rx_group_pn);
 
 	mt7615_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-- 
2.47.3

