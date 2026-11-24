Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509796;
	b=hTadqNlUVrrLfPgCPdSyJpwofhw3RE12pTfqzRBtKaxP+YbZIbB8b7BFD+p/h46yxQXS
	 gfFvOBLshaxdmahhdetXAYHWhl5KQSmQooOxAYsN5gDnkHp4/IhOQ1J7ygbVWcO6Vlja4
	 +rl9wcKwsaCc/8rEx427LgfdzTAU2B7B5rWP9PNqQNg8mBZYT+E+whVqSbitajvNrdJMn
	 NAbK/Nf8VrdIxpdWUYT8sMn1bmx+keJucD3H6I9F5nP7zVIUv0mI2zuKnlIGPZOSw6scz
	 F0NiYYGZYVzESNkP2fRO74e6gKzh4y7DHnwqC8uJXGBC2Kx680aDzVwT0uBHDe+fTLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509796;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G4EwtdqBsnBDZVmzrds4kB3EpH0dHee1mLbhBQv6Oxk=;
	b=pJNzooK5p5F+vEFyKw3W7Q2old/eKgd28V/dY2btOQjhBcT0ljcZ+0Y2G8JE+fosd4jD
	 Wi8lQrnH63D8fWEr0NrE430OHIr8Jj1tLmeE1r7FXB/SjKNiVX80rPx/4gv+9RGXW9oN1
	 oDlwobZTfWAARCagcNMLT7qM3EWpEsUyy3OyPg/DPfYqykOYzhh2sW1czBa3ceE8CjIch
	 vEb/VM2AFbqLogVxGwGJsrBOdCN92fHqKQESeJMo4LW4GGIx0Et+Z6vpyodxEoP113qv1
	 OO3x3fwShAA+43mVrNsKrhgfqp86+Njk3tSi8F6BJNNlYTe2mJ0rLGidQadmbCUIcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tR9weNvZ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73260A2609
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D73260A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tR9weNvZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=G4EwtdqBsnBDZVmzrds4kB3EpH0dHee1mLbhBQv6Oxk=; b=tR9weNvZAQChvTStunVqf9iw0H
	A8xP/ltzRTUsutI8yMFuy/8TD2roQa/cW4IbJzQ0RKo+Ie48uvWmFrsNjCLCrSk0bgWQ7y/jE8hWb
	iQX4xDRd9QWoOSQPnDeeRJYe1sElT7o9bJSAQoTCDRqoGwpTcUtsKBHt1IcEBTH+wLqM=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7O-007dJf-26
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:14 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 20/20] wifi: mt76: mt7996: set the default link again when a link is reused
Date: Tue, 24 Nov 2026 09:43:09 +0100
Message-ID: <20261124084309.1981968-20-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

Since commit 08813703ac41 ("wifi: mt76: mt7996: Destroy vif active links
in mt7996_remove_interface()"), a removed vif link stays valid. Its
removal still clears mvif->mt76.deflink_id if it is the default link.
A later add on the same band reuses the link and leaves deflink_id unset
until the interface goes away. A mesh point thus loses its TSF
adjustment after it leaves and joins the mesh, since mt7996_offset_tsf()
finds no link.

Make a reused link the default link if the interface has none. Give its
wcid to the TX queue as well, as the first add of a link does.

Fixes: 08813703ac41 ("wifi: mt76: mt7996: Destroy vif active links in mt7996_remove_interface()")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c220376cded6..ac4f8b89bd90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -356,6 +356,20 @@ static void mt7996_vif_link_free(struct mt7996_vif_link *link,
 	kfree_rcu(mlink, rcu_head);
 }
 
+static void mt7996_vif_deflink_init(struct ieee80211_vif *vif,
+				    struct mt7996_vif_link *link)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt76_txq *mtxq;
+
+	if (!vif->txq || mvif->mt76.deflink_id != IEEE80211_LINK_UNSPECIFIED)
+		return;
+
+	mtxq = (struct mt76_txq *)vif->txq->drv_priv;
+	mvif->mt76.deflink_id = link->msta_link.wcid.link_id;
+	mtxq->wcid = link->msta_link.wcid.idx;
+}
+
 static int mt7996_vif_link_reuse(struct mt7996_phy *phy,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_bss_conf *link_conf,
@@ -369,10 +383,16 @@ static int mt7996_vif_link_reuse(struct mt7996_phy *phy,
 		return ret;
 
 	if (vif->type == NL80211_IFTYPE_AP && ieee80211_vif_is_mld(vif))
-		return mt7996_mcu_mld_link_oper(phy->dev, link_conf, link, true);
+		ret = mt7996_mcu_mld_link_oper(phy->dev, link_conf, link, true);
+	else
+		ret = mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink,
+					      &link->msta_link, true);
+	if (ret)
+		return ret;
 
-	return mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink,
-				       &link->msta_link, true);
+	mt7996_vif_deflink_init(vif, link);
+
+	return 0;
 }
 
 int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
@@ -475,14 +495,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
 	if (!mlink->wcid->offchannel) {
-		if (vif->txq &&
-		    mvif->mt76.deflink_id == IEEE80211_LINK_UNSPECIFIED) {
-			struct mt76_txq *mtxq;
-
-			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
-			mvif->mt76.deflink_id = link_conf->link_id;
-			mtxq->wcid = idx;
-		}
+		mt7996_vif_deflink_init(vif, link);
 		mvif->mt76.valid_links |= BIT(link_conf->link_id);
 	}
 
@@ -564,10 +577,8 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 
 		if (vif->txq && mvif->mt76.deflink_id == link_id) {
 			struct ieee80211_bss_conf *iter;
-			struct mt76_txq *mtxq;
 
 			mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
-			mtxq = (struct mt76_txq *)vif->txq->drv_priv;
 			/* Primary link will be removed, look for a new one */
 			for_each_vif_active_link(vif, iter, link_id) {
 				if (link_id == msta_link->wcid.link_id)
@@ -577,8 +588,7 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 				if (!link)
 					continue;
 
-				mtxq->wcid = link->msta_link.wcid.idx;
-				mvif->mt76.deflink_id = link_id;
+				mt7996_vif_deflink_init(vif, link);
 				break;
 			}
 		}
-- 
2.47.3

