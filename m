Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262970;
	b=3jfp9KkQkYTQJVfL8hz70L71XHfScDhcAE+4YwZSCkGSXQA7FW8ThSALYiwZnNX7Unp8
	 hhpgiZ4FY3FFkuLBTO+bDEns1/1GWcpXt6gJhKh19tYE/TLAuKjK3ghfEWeHIF1PolfTP
	 WehTBSOevhVMbcX+WnGabj8WnHI8vrl5lM9uiF4fQPcXup5R8Wj8mvoE/KJ+VHETIAfBF
	 Mrj9mRHoVQvjuXSWa9483Vi5l91jyngGm1Ojh3ElToVyl60RJbR8BdD6HagkZhzhp0wtb
	 8yW4YfCZAmqw4FizcpwCZV+25sxeTluNTGbQkXNVR59UscXlVifnwNk3HCnn/iuWlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262970;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Syrybgo/YTVM0yW075YiahOtnhqWrZujSXMBBt4dQqI=;
	b=m7NGPVo767S3XWTzxBbq2/UJ71zaNa8vl+WVqzBPtUZmqwls+wvzUJjLKk5Kg3VIsMjb
	 x7H7gsBSKAFJ+cgH3OjXoZsuQ+ZKzc9GMUNC8L7UT4tzuJp4Mn/VeRd6MeIJJmnEjJHYm
	 mnN4Te/JioYpQdoZLuczOUw18NP3Xxku+yMajObExaoBvuDMOavxDuPehp/xrzBlEihsq
	 aNHVocVWaeXWWlGi9K6nZ0+8PnJlFsC1D3+T6Fhp15/mDAsNMb9PUdlfGwkd5PfcGtS+T
	 lBSmUpTo+QVqzSDK0MO0gJ/uMsWFs6ssSISFkD6mrIOUy6F6ZS8Yq2ucp89E4d483+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eLqrvcyQ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78142606A331
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78142606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eLqrvcyQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Syrybgo/YTVM0yW075YiahOtnhqWrZujSXMBBt4dQqI=; b=eLqrvcyQw9i2YRnYfxmwqCc7ay
	ytpCqjZ2OXV9F9Ke1pav2quXC5NJ49Y9WlejbMfwlHBeFVm0jdlnkM4DAUek/4eF04JbTEGLOfRKT
	2DsDx6XHkw9VGF3/vLioHJnPCDhjTS2rYLVvli42qMvxSAFLSGAyKVe24/rpiUdDT1V0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-0Q
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/17] wifi: mt76: mt792x: look up the TX links under RCU
Date: Sat, 21 Nov 2026 13:09:14 +0100
Message-ID: <20261121120926.3603979-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121120926.3603979-1-nbd@nbd.name>
References: <20261121120926.3603979-1-nbd@nbd.name>
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

mt792x_sta_to_link() and mt792x_vif_to_link() dereference the link
pointers with rcu_dereference_protected() and the mt76 mutex as its
condition. mt792x_tx() and mt7925_mac_write_txwi() call them on the TX
path, which holds an RCU read section but not the mutex. With
CONFIG_PROVE_RCU, the first frame sent on an MLO connection thus gives
a "suspicious rcu_dereference_protected() usage" warning.

Look the links up with rcu_dereference() on the TX path, matching
mt7996_sta_link(). Hold the read section of mt792x_tx() from the lookup
until the frame is queued, like mt7996_tx().

Fixes: ebb1406813c6 ("wifi: mt76: mt7925: add link handling to txwi")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 46 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 12 +++--
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index ca54d71db4c7..a99a2c497458 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -804,8 +804,8 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 					 BSS_CHANGED_FILS_DISCOVERY));
 	struct mt792x_bss_conf *mconf;
 
-	mconf = vif ? mt792x_vif_to_link((struct mt792x_vif *)vif->drv_priv,
-					 wcid->link_id) : NULL;
+	mconf = vif ? mt792x_vif_to_link_rcu((struct mt792x_vif *)vif->drv_priv,
+					     wcid->link_id) : NULL;
 	mvif = mconf ? (struct mt76_vif_link *)&mconf->mt76 : NULL;
 
 	if (mvif) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index b142be13ab78..3604f02a5376 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -434,16 +434,23 @@ struct mt792x_dev {
 	} cached_cal;
 };
 
-static inline struct mt792x_bss_conf *
-mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
+static inline bool
+mt792x_vif_is_mld_link(struct mt792x_vif *mvif, u8 link_id)
 {
 	struct ieee80211_vif *vif;
-	struct mt792x_bss_conf *bss_conf;
 
 	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
-	if (!ieee80211_vif_is_mld(vif) ||
-	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+	return ieee80211_vif_is_mld(vif) &&
+	       link_id < IEEE80211_LINK_UNSPECIFIED;
+}
+
+static inline struct mt792x_bss_conf *
+mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
+{
+	struct mt792x_bss_conf *bss_conf;
+
+	if (!mt792x_vif_is_mld_link(mvif, link_id))
 		return &mvif->bss_conf;
 
 	bss_conf = rcu_dereference_protected(mvif->link_conf[link_id],
@@ -452,21 +459,38 @@ mt792x_vif_to_link(struct mt792x_vif *mvif, u8 link_id)
 	return bss_conf ? bss_conf : &mvif->bss_conf;
 }
 
+static inline struct mt792x_bss_conf *
+mt792x_vif_to_link_rcu(struct mt792x_vif *mvif, u8 link_id)
+{
+	struct mt792x_bss_conf *bss_conf;
+
+	if (!mt792x_vif_is_mld_link(mvif, link_id))
+		return &mvif->bss_conf;
+
+	bss_conf = rcu_dereference(mvif->link_conf[link_id]);
+
+	return bss_conf ? bss_conf : &mvif->bss_conf;
+}
+
 static inline struct mt792x_link_sta *
 mt792x_sta_to_link(struct mt792x_sta *msta, u8 link_id)
 {
-	struct ieee80211_vif *vif;
-
-	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
-
-	if (!ieee80211_vif_is_mld(vif) ||
-	    link_id >= IEEE80211_LINK_UNSPECIFIED)
+	if (!mt792x_vif_is_mld_link(msta->vif, link_id))
 		return &msta->deflink;
 
 	return rcu_dereference_protected(msta->link[link_id],
 		lockdep_is_held(&msta->vif->phy->dev->mt76.mutex));
 }
 
+static inline struct mt792x_link_sta *
+mt792x_sta_to_link_rcu(struct mt792x_sta *msta, u8 link_id)
+{
+	if (!mt792x_vif_is_mld_link(msta->vif, link_id))
+		return &msta->deflink;
+
+	return rcu_dereference(msta->link[link_id]);
+}
+
 static inline struct mt792x_bss_conf *
 mt792x_link_conf_to_mconf(struct ieee80211_bss_conf *link_conf)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 8dbc5e84cd48..5babfc00dee1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -189,6 +189,8 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		}
 	}
 
+	rcu_read_lock();
+
 	if (control->sta) {
 		struct mt792x_link_sta *mlink;
 		struct mt792x_sta *sta;
@@ -197,10 +199,10 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		sta = (struct mt792x_sta *)control->sta->drv_priv;
 		if (link_id >= IEEE80211_LINK_UNSPECIFIED)
 			link_id = sta->deflink_id;
-		mlink = mt792x_sta_to_link(sta, link_id);
+		mlink = mt792x_sta_to_link_rcu(sta, link_id);
 		if (!mlink) {
 			ieee80211_free_txskb(hw, skb);
-			return;
+			goto unlock;
 		}
 		wcid = &mlink->wcid;
 	}
@@ -229,7 +231,6 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		struct ieee80211_bss_conf *conf;
 
 		link_id = wcid->link_id;
-		rcu_read_lock();
 		conf = rcu_dereference(vif->link_conf[link_id]);
 		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
 
@@ -238,13 +239,12 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 
 		if (vif->type == NL80211_IFTYPE_STATION)
 			memcpy(hdr->addr3, conf->bssid, ETH_ALEN);
-		rcu_read_unlock();
 	}
 
 	if (mt76_connac_pm_ref(mphy, &dev->pm)) {
 		mt76_tx(mphy, control->sta, wcid, skb);
 		mt76_connac_pm_unref(mphy, &dev->pm);
-		return;
+		goto unlock;
 	}
 
 	qid = skb_get_queue_mapping(skb);
@@ -254,6 +254,8 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	}
 
 	mt76_connac_pm_queue_skb(hw, &dev->pm, wcid, skb);
+unlock:
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(mt792x_tx);
 
-- 
2.47.3

