Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=GXH3hvrQImS3BcyZ7bOUcFI8XhkXZIMFuCCK1Nrr31joAyrmREuuaxswWDsdKQqC9Bry
	 LhmYlLSDoSvUICnOGnNFwweCY0OlgJ1WI4f9CCyjRd6qnfnPOa9cvVdvmWgi7npnWlKAi
	 KjSLFwpgBKNDZcLqwwiipzARAqPQXmOhThzQIeZ1N9pQeXrD8MIOuoN6SlzZLgw0igfmq
	 j5qJ0RwQZqM0qK8GhV5uO7Q1HCDMRAEAfrTq4kWjrQ+tfBU+KcwC3gOl5U9UREnDUlGWc
	 U3nGEMZdKL/pxQeBYpH8v0D6HRl5B2oM27doSsIdZCltHzy4Eb52dVKAHXvFSj5OSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jJCjUrP+N9+bsAMm1lH4lEeYvZqaLwXs+FQwcY+a9PY=;
	b=URqXyQNWHrg0BmuhDi9KwOOx6ytbYjW8tkkqT6R2wpml/UxWf25JcYlnckoGAgtv46DQ
	 P8toVbW1fJouECJQiVe3AHt2KS5MPI4Duz8ICxMJh7+GUHDRlbanUI188w0vkXCQ3RT6a
	 yWiEIzEanvvA9lUy5Gm7YvN+pEWFTOetdxv7g3kNseTQ58fjUSYB0a8ro6J0U9Twe7Eur
	 OfBTjR8OCSH4jopeP6W2aSjJZmBkeqXYVtgs68RM1TJUJeBaSwPI9ICoUPGJozcgduKrw
	 hIVL4Puvr4tdbhuOmBTBpCCnJnapcxE/OYcNyqvQM54Wf4C+jz+JmyD+fKx51la7yhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pYPI9YTR;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262E606A337
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E262E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pYPI9YTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jJCjUrP+N9+bsAMm1lH4lEeYvZqaLwXs+FQwcY+a9PY=; b=pYPI9YTRjh1/frixHCu71+W8H5
	30IdOpueFjC9AAejePPLkpl/EAPqACOoKa+f1yRxN96xulrudakf5aDTZMQ4xslaem8R6KOZTaAX6
	IaMmTMgIGSjOA0pUKPgbdpOUwRO2xQVFd2SLg7aufEabc9DNPdadJpGREjgJS61rrJlI=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMf-00552s-2k
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/16] wifi: mt76: mt7996: limit the SKU TX power to the current channel
Date: Wed, 18 Nov 2026 17:18:12 +0100
Message-ID: <20261118161827.1208649-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

Since the switch to a single multi-radio wiphy,
mt7996_mcu_set_txpower_sku() takes the TX power from phy->txpower
instead of hw->conf.power_level. phy->txpower stays 0 until a BSS sets
its TX power, so a scan or an offchannel operation before that gets the
SKU limits of 0 dBm.

Take the maximum power of the current channel, limited by the TX power
of the BSS once a BSS sets it. Mark a phy without a BSS TX power with
INT_MIN, as mac80211 does for bss_conf.txpower, since 0 dBm is a valid
TX power of a BSS.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c  | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f44a3a8588d3..655023578b3e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -423,6 +423,7 @@ mt7996_init_wiphy_band(struct ieee80211_hw *hw, struct mt7996_phy *phy)
 
 	phy->slottime = 9;
 	phy->beacon_rate = -1;
+	phy->txpower = INT_MIN;
 	phy->rxfilter = MT_WF_RFCR_DROP_OTHER_UC;
 
 	if (phy->mt76->cap.has_2ghz) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b082998a4170..57b16f1f5c1d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -5779,7 +5779,10 @@ int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy)
 	struct sk_buff *skb;
 	int i, tx_power;
 
-	tx_power = mt76_get_power_bound(mphy, phy->txpower);
+	tx_power = mphy->chandef.chan->max_power;
+	if (phy->txpower != INT_MIN)
+		tx_power = min(tx_power, phy->txpower);
+	tx_power = mt76_get_power_bound(mphy, tx_power);
 	tx_power = mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
 					      &la, tx_power);
 	mphy->txpower_cur = tx_power;
-- 
2.47.3

