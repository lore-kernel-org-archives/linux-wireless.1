Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=eCl90FQDaYeYlt6emLhjNs6C3eEbkAC+LhAn0ySs4jNSOV3mB1GEqFZ/+W99RnY3ohuq
	 UggppjqWakbwOgUNKLEGIWjpusWZ0qRCZMKFuzJAPgXQUQIOBu8sK/2RfLBQUiBsewXSD
	 r4HYbw8AxseHwkrXkij9mzrXuQOO0IiVjwz0EWfr/SiQmmRO17X0sAdM7OdVSQ+Cp5obz
	 N/Bof7SjzqY6m3+lvVAOd+lM0zgtgB835TR+vkLj2848yguNzkioAq0Kz6R2nWazckUeG
	 leNNuxAtGkOF9WaexulQcBA6igLelFC2xoffI0s4+oekVCrei/WMTKbcelWhUQW74vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+1lDIr7tXHCPnvLoy9hJmYkQVGr7D8ckeKU1AhqFjnQ=;
	b=TUIAZS+f9UpxuT280wzaKGjRnZDTGDfCjoOVwG/wMyg0GSRK07m6sMZeKE78igadcWwu
	 aQ2PVoElIL355xayyGo46v+kO+bINCpF+OE8kG7du7bB5loHmMQxNVzcAdsb7ZgFm/50p
	 hgYd67Ot3YOoxTFRP/EcjIlkfo0YwqdOlFN1Gst8KNKz+EfyzYJv730PW17RMfhWaJ05g
	 TCqQxH4t1QTgZQw3axdqqRwNqgrmZQUkzdmcAW8aj7limWT5wtMyLxarMKdDivD52gLZh
	 fJmm1HwWrTk6aBNEIek0MqOWuOxWy791cq1FiVyxiF5HCKediOsmn0L/nglGJAL3DTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WuT6kj8B;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F3606A687
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7F3606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WuT6kj8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+1lDIr7tXHCPnvLoy9hJmYkQVGr7D8ckeKU1AhqFjnQ=; b=WuT6kj8BoQMtVwZuD1MW8sR2y9
	C3dLXotkf0JyPmlM2rmPlNVCmJmfa3LClak/iogejb75aGsRUf4NANVbG5d33ttFij1TNi8K8zM+m
	bRuZsy/zeUyehJaK5dh792j5ixeZQOjTy+VKtKqG2SgrK/xF8Axc7xVaJhkycgmrxAvo=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-2s
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/20] wifi: mt76: read roc_phy and roc_link once without the mutex
Date: Mon, 23 Nov 2026 14:49:12 +0100
Message-ID: <20261123134920.154270-13-nbd@nbd.name>
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

mt7996_tx() tests mvif->roc_phy and roc_phy->roc_link without a lock
and loads each field again for its use, and mt76_vif_cleanup() does the
same with roc_phy. mt76_roc_complete() clears both fields under
dev->mutex, so a second load can return NULL, which mt7996_tx() and
mt76_vif_cleanup() then dereference. mt7996_vif_link_roc_abort() also
loads roc_phy before it takes dev->mutex.

Load roc_phy once with READ_ONCE() outside dev->mutex, and store it with
WRITE_ONCE(). It points to a phy, which lives as long as the device.
Make roc_link an RCU pointer, since mt7996_tx() reads it under the RCU
read lock and an offchannel link is freed with kfree_rcu().

A ROC of another interface can start on the phy between the two loads.
mt7996_tx() thus takes the wcid only from a link of its own interface.

Fixes: a8f424c1287c ("wifi: mt76: add multi-radio remain_on_channel functions")
Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c   | 14 +++++++-------
 drivers/net/wireless/mediatek/mt76/mac80211.c  |  6 ++++--
 drivers/net/wireless/mediatek/mt76/mt76.h      |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c   | 18 ++++++++++--------
 4 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index db2d6dfc12a9..6d9ca6dfecb7 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -394,14 +394,14 @@ mt76_vif_roc_phy(struct mt76_dev *dev, struct ieee80211_vif *vif)
 
 void mt76_roc_complete(struct mt76_phy *phy)
 {
-	struct mt76_vif_link *mlink = phy->roc_link;
+	struct mt76_vif_link *mlink = mt76_dereference(phy->roc_link, phy->dev);
 	struct mt76_dev *dev = phy->dev;
 
 	if (!phy->roc_vif)
 		return;
 
 	if (mlink && mlink->mvif->roc_phy == phy)
-		mlink->mvif->roc_phy = NULL;
+		WRITE_ONCE(mlink->mvif->roc_phy, NULL);
 	if (phy->chanctx && phy->main_chandef.chan && phy->offchannel &&
 	    !test_bit(MT76_MCU_RESET, &dev->phy.state)) {
 		__mt76_set_channel(phy, &phy->main_chandef, false);
@@ -409,7 +409,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
 	} else {
 		phy->offchannel = false;
 	}
-	phy->roc_link = NULL;
+	rcu_assign_pointer(phy->roc_link, NULL);
 	mt76_put_vif_phy_link(phy, phy->roc_vif, mlink);
 	phy->roc_vif = NULL;
 	if (!test_bit(MT76_RESTART, &dev->phy.state))
@@ -475,18 +475,18 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		goto restart_mac_work;
 	}
 
-	mlink->mvif->roc_phy = phy;
+	WRITE_ONCE(mlink->mvif->roc_phy, phy);
 	phy->roc_vif = vif;
-	phy->roc_link = mlink;
+	rcu_assign_pointer(phy->roc_link, mlink);
 
 	offchannel = mt76_offchannel_chandef(phy, chan, &chandef);
 	if (offchannel)
 		mt76_offchannel_notify(phy, true);
 	ret = __mt76_set_channel(phy, &chandef, offchannel);
 	if (ret) {
-		mlink->mvif->roc_phy = NULL;
+		WRITE_ONCE(mlink->mvif->roc_phy, NULL);
 		phy->roc_vif = NULL;
-		phy->roc_link = NULL;
+		rcu_assign_pointer(phy->roc_link, NULL);
 		mt76_put_vif_phy_link(phy, vif, mlink);
 		goto out;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index e554f2eea7cc..a42a950c20cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -2247,11 +2247,13 @@ void mt76_vif_cleanup(struct mt76_dev *dev, struct ieee80211_vif *vif)
 {
 	struct mt76_vif_link *mlink = (struct mt76_vif_link *)vif->drv_priv;
 	struct mt76_vif_data *mvif = mlink->mvif;
+	struct mt76_phy *phy;
 
 	rcu_assign_pointer(mvif->link[0], NULL);
 	mt76_abort_scan(dev);
-	if (mvif->roc_phy && mvif->roc_phy->roc_vif == vif)
-		mt76_abort_roc(mvif->roc_phy);
+	phy = READ_ONCE(mvif->roc_phy);
+	if (phy && phy->roc_vif == vif)
+		mt76_abort_roc(phy);
 }
 EXPORT_SYMBOL_GPL(mt76_vif_cleanup);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d82d22c14c9f..648f79c4b6d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -887,7 +887,7 @@ struct mt76_phy {
 
 	struct delayed_work roc_work;
 	struct ieee80211_vif *roc_vif;
-	struct mt76_vif_link *roc_link;
+	struct mt76_vif_link __rcu *roc_link;
 
 	struct delayed_work scan_work;
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f2bc33db35fb..c39e0ac9176c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2140,17 +2140,19 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 	}
 
 	if (mvif) {
-		struct mt76_vif_link *mlink;
+		struct mt76_vif_link *mlink, *roc_link;
+		struct mt76_phy *roc_phy;
 
 		mlink = rcu_dereference(mvif->mt76.link[link_id]);
 		if (mlink && mlink->wcid)
 			wcid = mlink->wcid;
 
-		if (mvif->mt76.roc_phy &&
-		    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
-			mphy = mvif->mt76.roc_phy;
-			if (mphy->roc_link)
-				wcid = mphy->roc_link->wcid;
+		roc_phy = READ_ONCE(mvif->mt76.roc_phy);
+		if (roc_phy && (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN)) {
+			mphy = roc_phy;
+			roc_link = rcu_dereference(roc_phy->roc_link);
+			if (roc_link && roc_link->mvif == &mvif->mt76)
+				wcid = roc_link->wcid;
 		} else if (mlink) {
 			mphy = mt76_vif_link_phy(mlink);
 		}
@@ -3081,7 +3083,7 @@ static void
 mt7996_vif_link_roc_abort(struct mt7996_dev *dev, struct ieee80211_vif *vif)
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt76_phy *phy = mvif->mt76.roc_phy;
+	struct mt76_phy *phy = READ_ONCE(mvif->mt76.roc_phy);
 	struct mt76_vif_link *mlink;
 	bool abort;
 
@@ -3089,7 +3091,7 @@ mt7996_vif_link_roc_abort(struct mt7996_dev *dev, struct ieee80211_vif *vif)
 		return;
 
 	mutex_lock(&dev->mt76.mutex);
-	mlink = phy->roc_link;
+	mlink = mt76_dereference(phy->roc_link, &dev->mt76);
 	abort = phy->roc_vif == vif && mlink && !mlink->offchannel;
 	mutex_unlock(&dev->mt76.mutex);
 
-- 
2.47.3

