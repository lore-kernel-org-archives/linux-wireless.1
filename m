Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=gk8VWo95mOJK4SXJnyVYZAdJCUXTBAwdqNeK040a35teJhMgq6gDjoojflu663MjJLYW
	 j4wExFLO1b2z7xIvfM27QcXlN7tKn/WLmTK7wo6R16P0I3hsFHymcUOcynKDHcvOK8q4m
	 Mjwrltl0tUrw85rAwgxHU+ZEKRc9En2V6LA55d86TROG8kwVk+qW0/1AmnrV2f8aFjopA
	 iiER+9tH4A9v3UKIWC1LqyUgX1SqYe28WWojGr/0bufdUPE9wSFrXysW7FP45aKspxU2H
	 t0oH7ol9xxTqGwWi1qg/j9BUMk4Yp+Gm3g3+MWpGbrENqI+kHyrAUUYhElcHyZClQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Sh3MDzg+7b/kPA7lqN31IFiYr54thP6YVKB1nY8LJI=;
	b=seKHIwh/9KvweZQB8YKlcIb1941LCGlwPkaohwnhjFQqCl1z6DHcPCD/ioXLBAOqYuhM
	 gbP25OxteeYHdkKB3TQDJVFHRRloscWUibRY6hDgAdnCSzuzPnRORaGY2Sl5XMewD4Nzx
	 W2mCJf+Ew7HLdRB8XoYzs1sfzC3lTaLqRJrUvVQKTnsrlw7YEb/KZ48BhMFA4jnsLg0lR
	 yu2sZE8oOqNzs4IdNqfZrBHFCGxJiOzKywcwHIwtgco0A5272U7C72LEHGgf5VMcB0Uwe
	 nttGNPoaG6gNqossfnRe/poCv0wiaSa/sUFNkLDezbOUuyp4KUKXdVzz9TC5vEIyb6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gLmWlwSJ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1E60A260B
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD1E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gLmWlwSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0Sh3MDzg+7b/kPA7lqN31IFiYr54thP6YVKB1nY8LJI=; b=gLmWlwSJbbkgLXnbQD0flVifEx
	Trog2fUAxLNEu8l3yH2qSQwdYzh9KB7xbcTMKc/T7OU+hJkRIsnXKwI0GMYVb7OpJVepr9qNwtMgD
	a86t+eGxESQnM67ve8qwkx5RS+BOZgA4vO1nglMXRQ05GnoB/tPEq29vwyiavK3xYSB0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-1F
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/20] wifi: mt76: mt7915: drop the TWT agreements at a full reset
Date: Thu, 19 Nov 2026 13:43:42 +0100
Message-ID: <20261119124352.1842164-10-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

The firmware that a full reset reloads holds no TWT agreement, but
mt7915_mac_full_reset() keeps those of the driver and only runs
INIT_LIST_HEAD() on dev->twt_list. The disassociation or the removal of
a station with a flow then corrupts the list.

Drop the TWT agreements of the driver at a full reset as well.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardware restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cfa7433dc470..6e2b26017692 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1435,6 +1435,7 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 static void
 mt7915_mac_full_reset(struct mt7915_dev *dev)
 {
+	struct mt7915_twt_flow *flow, *tmp;
 	struct mt76_phy *ext_phy;
 	struct mt7915_phy *phy2;
 	int i;
@@ -1476,7 +1477,15 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 		list_del_init(dev->sta_rc_list.next);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-	INIT_LIST_HEAD(&dev->twt_list);
+	list_for_each_entry_safe(flow, tmp, &dev->twt_list, list) {
+		struct mt7915_sta *msta;
+
+		msta = container_of(flow, struct mt7915_sta, twt.flow[flow->id]);
+		msta->twt.flowid_mask &= ~BIT(flow->id);
+		list_del_init(&flow->list);
+	}
+	dev->twt.table_mask = 0;
+	dev->twt.n_agrt = 0;
 
 	i = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
 	dev->mt76.global_wcid.idx = i;
-- 
2.47.3

