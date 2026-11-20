Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196706;
	b=MERFswEwcewy6pkQgQ/unmHrDWh+dlKtZ/M5rfgN8MM6/IVgJgBbYIkU14OiQykSyA7K
	 Joiftbzu/Anjme5F1D71uM90hmugtg81y79sacwREGKwwnRqQvYBIuPHikydQ4Ft/vRc/
	 s9n/0lSEhVPD4rrY9xeR/O7M7Sa4wxF4buSI3Yiyvr2pVbnw6NjiMYyqcYGdNQHmg6ZTh
	 Qv4o2NGG5Mjdy3vSY+6Fpj/9pHHGWnloOtmnuzIx8IOKq5EJUSMLK9XBLRXTJOxB7WXVW
	 QGJbAxDr3tHQ0nRVMXwTcKQHY+AB4y8R9F699FR8m7kQ9Pld1bZRro9Xa7ajo/3gfOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196706;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sxnGtYfdIk1ZBUxieqJlXqVcJKR0YbeHholExcvXDR4=;
	b=MNegFwf2P3oXpF8wA2WO0SIDRBGqeDLaCBJ8QLHM3LBJa30GsDgoOhdl0SPt9wiUZdih
	 z78hquU0AVF+zNKDp8zESe8aWrhILyAoyGYtkLbTwHCOd37g7bJrJfaF4v6hn6PYrRR68
	 oXYy5lQOhvRBScuQU30Xk7WNVxpjBrpA+W9GOsNM1fpa3rhnPFd4D2/iAjymcYkf+bj0z
	 xqbO0WWu8mIJ1O0IaMvsbZCWRc2W6eza2LzcLHMOdD9LCoMzMzqElszlTtqQblf8159Ib
	 QAaGo+vB+aqAZRWV6mC6B49A/9hs/MbFM41vTXvvEn9odZoKzzDDC+t8umEEO9+Zr6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mi72XqgO;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188260A2620
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8188260A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mi72XqgO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sxnGtYfdIk1ZBUxieqJlXqVcJKR0YbeHholExcvXDR4=; b=mi72XqgOPhohxYan6FrTK8KKFa
	vQPzI0xN6lAy65qmniMj/bj3aJ1YC5IYG7YIp0n332gH+yphqCJOhV+9GFj9AqXUKsQD+4NWryc7d
	GeOvhxB4YqQqxtZOCHmfO3+BehakkyVs0hw0hPMx7PI2RbZh3yqNzGZmb9SqgNH9ctbY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfX-0065GI-2b
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:03 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/20] wifi: mt76: mt7925: free removed vif links after an RCU grace period
Date: Fri, 20 Nov 2026 18:44:41 +0100
Message-ID: <20261120174459.1657382-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

mt7925_change_vif_links() frees the mconf and mlink of a removed link
with devm_kfree() before it clears mvif->link_conf[] and
mvif->sta.link[], and without a grace period. Readers such as
mt7925_mcu_bss_absence_iter() hold RCU alone, so a change of the active
links can cause a use after free. The error path of a link add frees
the same way, and leaves dev->mt76.wcid[] naming the freed mlink.

Free the links with kfree_rcu() after every pointer to them is cleared,
as mt7996_vif_link_free() does. On the error path, also remove the BSS
of each link whose add completed, and make mt7925_mac_link_bss_add()
undo its setup of an allocated link when the firmware command fails.
The embedded link keeps its state until mt7925_remove_interface()
releases it.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Fixes: ac03e5b82bc6 ("wifi: mt76: mt7925: Enhance mt7925_mac_link_bss_add to support MLO")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 70 ++++++++++++-------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d892434de54c..1fac66e8c50a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -449,6 +449,12 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 					  &mlink->wcid, true);
 	if (ret) {
+		if (mconf != &mvif->bss_conf) {
+			rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+			mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
+			dev->mt76.vif_mask &= ~BIT_ULL(mconf->mt76.idx);
+			mvif->phy->omac_mask &= ~BIT_ULL(mconf->mt76.omac_idx);
+		}
 		mt7925_p2p_bmc_remove(dev, mconf);
 		goto out;
 	}
@@ -2474,6 +2480,25 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	mt792x_mutex_release(dev);
 }
 
+static void
+mt7925_vif_link_remove(struct mt792x_dev *dev, struct mt792x_vif *mvif,
+		       unsigned int link_id, struct mt792x_bss_conf *mconf,
+		       struct mt792x_link_sta *mlink, bool bss_remove)
+{
+	rcu_assign_pointer(mvif->link_conf[link_id], NULL);
+	rcu_assign_pointer(mvif->sta.link[link_id], NULL);
+
+	if (bss_remove)
+		mt792x_mac_link_bss_remove(dev, mconf, mlink);
+
+	if (mconf != &mvif->bss_conf) {
+		mt7925_p2p_bmc_remove(dev, mconf);
+		kfree_rcu(mconf, mt76.rcu_head);
+	}
+	if (mlink != &mvif->sta.deflink)
+		kfree_rcu(mlink, rcu_head);
+}
+
 static int
 mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			u16 old_links, u16 new_links,
@@ -2487,6 +2512,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct ieee80211_bss_conf *link_conf;
+	unsigned long added = 0;
 	unsigned int link_id;
 	int err;
 
@@ -2502,15 +2528,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		if (!mconf || !mlink)
 			continue;
 
-		if (mconf != &mvif->bss_conf) {
-			mt792x_mac_link_bss_remove(dev, mconf, mlink);
-			mt7925_p2p_bmc_remove(dev, mconf);
-			devm_kfree(dev->mt76.dev, mconf);
-			devm_kfree(dev->mt76.dev, mlink);
-		}
-
-		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
-		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
+		mt7925_vif_link_remove(dev, mvif, link_id, mconf, mlink,
+				       mconf != &mvif->bss_conf);
 	}
 
 	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -2519,13 +2538,13 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			mconf = &mvif->bss_conf;
 			mlink = &mvif->sta.deflink;
 		} else {
-			mconf = devm_kzalloc(dev->mt76.dev, sizeof(*mconf),
-					     GFP_KERNEL);
-			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
-					     GFP_KERNEL);
+			mconf = kzalloc_obj(*mconf);
+			mlink = kzalloc_obj(*mlink);
 			if (!mconf || !mlink) {
-				mt792x_mutex_release(dev);
-				return -ENOMEM;
+				kfree(mconf);
+				kfree(mlink);
+				err = -ENOMEM;
+				goto free_unpublished;
 			}
 		}
 
@@ -2554,6 +2573,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		if (err < 0)
 			goto free;
 
+		added |= BIT(link_id);
+
 		if (mconf != &mvif->bss_conf) {
 			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
 						 vif->active_links);
@@ -2581,18 +2602,17 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return 0;
 
 free:
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS)
+		mt7925_vif_link_remove(dev, mvif, link_id, mconfs[link_id],
+				       mlinks[link_id], added & BIT(link_id));
+	goto out;
+
+free_unpublished:
 	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
-		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
-
-		if (mconfs[link_id] != &mvif->bss_conf) {
-			mt7925_p2p_bmc_remove(dev, mconfs[link_id]);
-			devm_kfree(dev->mt76.dev, mconfs[link_id]);
-		}
-		if (mlinks[link_id] != &mvif->sta.deflink)
-			devm_kfree(dev->mt76.dev, mlinks[link_id]);
+		kfree(mconfs[link_id]);
+		kfree(mlinks[link_id]);
 	}
-
+out:
 	mt792x_mutex_release(dev);
 
 	return err;
-- 
2.47.3

