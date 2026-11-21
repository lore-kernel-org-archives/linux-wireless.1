Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=jgvSz6U07Aq/AFm5qEVD/rzcX5UX619UzsiuO92mxx9Jv1a4u84cv0UVa/S2mV4qvoYy
	 sMcfC0TCzubsKlaulYW/ymk0W6lX2bw3XPEVA/YIa4bRCcQnbV31NAXr3DPIHoWBmhI4I
	 E7mZ2IIQweOlCtd7BBsjOh9iyH0FS3qnK9ysj1pyJTDlFa9vPWOukz4W3ET9qP2CivjVp
	 yj4O07nZ1doTEGpm27WbcvuaUwb1lFVDbRDyZp0YrhqP48qLYuOP5wwQTvHm5QP3MhRND
	 9NPK+SfgBLJ7HuzmvADZlHF6ssAa0lMPnpNDmwEkY0ewo2eJJabaaUgFrTSuILwVspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UhqZhue6Rld8fUHnwGLu7x/szotTbD0mdAxh7e8QTjY=;
	b=thSfUOFvLengJP+ey+N2jPr7LtbnELPIl2kiboIC6rjBFYWzfNnXNr4fA/zapty2CrJE
	 fFRuoWBtNLsekHWl572OUEmMd5ukrbiboHTEPElGwd11bznh3NF5YQDkBD0zXIhWElINj
	 po9Wc9fQoC/Dz4BotVLmTsipBorV+EJKrxISLsNONV+3LF5jl1fr7kI89N0pqOHotcaDF
	 dv3GPOF0MG16VWJgrPKVVDRgDRIXPG78tCMz2i/nbg11G4eAmbXnziRMX2TkSmNZkatsX
	 BhI4OggHqHzbnf8jQZprquFFPJ+iE56HRb7hRvxafGVmgEamh09TO7BHz1AGA09OldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=r9YIV83U;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA96606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA96606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=r9YIV83U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UhqZhue6Rld8fUHnwGLu7x/szotTbD0mdAxh7e8QTjY=; b=r9YIV83UG/dFM2PVIBMkswFwYM
	PUmHZqC5Kydig3YVemmOEIawlNNeTkGtK2enXzvNr3oWHaNMYTiS9QnI7uECFVV1Y0JZtZ9piJc0y
	x+9rjM6uVixsaVbja21g4S35aQoEwSWLz1reIE3xQtYgKQfd3boCA4Oyhwb+nYwVPpkY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuK-006Q1I-1c
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/17] wifi: mt76: mt7996: name a new secondary link to the firmware first
Date: Sat, 21 Nov 2026 13:09:10 +0100
Message-ID: <20261121120926.3603979-1-nbd@nbd.name>
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

The driver sends no MLD setup when links only go away, so the firmware
keeps the primary and secondary link of the last MLD setup. If a link
of that pair goes from a station with three or more links,
mt7996_mac_sta_remove_link() picks a secondary link outside the pair.
Frames of odd TIDs then carry an MLD_ID that commit ce35ecffc96e
("wifi: mt76: mt7996: fix MLD ID in MAC TXD and HIF TXP") reports as a
cause of a firmware busy loop when that link is in power save.

mt7996_mac_sta_init_link() and the path of mt7996_mac_sta_add_links()
that takes back a kept link also pick the secondary link at once. When
a station with one link gets a new link, that pick is the new link.
Until mt7996_mac_sta_links_sync(), the firmware has no station record,
key or link pair for it, but mt7996_tx_prepare_skb() already puts
frames of odd TIDs on its WLAN_IDX. Both cases are reachable via
mt7996_mac_sta_change_links() when mac80211 changes the link stations.

Pick the secondary link of a new station once all its links exist. For
a link change, pick it in mt7996_mac_sta_links_sync(), after the MLD
setup of a joining link, which names it, or at once for a station that
is not connected, since the firmware holds no link pair for it. Until
then, keep the TX on the remaining link of the pair, so the station
sends both TID groups on one link. Keep the default link as the
secondary link meanwhile, since the rollback of a failed add reads
msta->link[] at the secondary link.

If the default link goes while it is also the secondary link, move the
default link to another valid link of the station.

Fixes: 53eadd11e927 ("wifi: mt76: mt7996: pick the secondary link from links with driver state")
Fixes: 85cd5534a3f2 ("wifi: mt76: mt7996: use correct link_id when filling TXD and TXP")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 23 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  6 ++---
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 69f1da5eae1b..d323557898b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1249,6 +1249,8 @@ mt7996_sta_deflink_set(struct ieee80211_sta *sta, unsigned int link_id,
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 
 	msta->deflink_id = link_id;
+	if (msta->seclink_id == IEEE80211_LINK_UNSPECIFIED)
+		msta->seclink_id = link_id;
 	mt7996_sta_init_txq_wcid(sta, idx);
 }
 
@@ -1286,6 +1288,9 @@ mt7996_sta_deflink_release(struct mt7996_dev *dev, struct ieee80211_sta *sta,
 	if (msta->deflink_id != link_id)
 		return;
 
+	if (msta->seclink_id == link_id)
+		msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
+
 	msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	if (msta->seclink_id == link_id)
 		return;
@@ -1298,8 +1303,7 @@ mt7996_sta_deflink_release(struct mt7996_dev *dev, struct ieee80211_sta *sta,
 				       msta_seclink->wcid.idx);
 }
 
-static u8
-mt7996_sta_seclink_get(struct mt7996_dev *dev, struct mt7996_sta *msta)
+u8 mt7996_sta_seclink_get(struct mt7996_dev *dev, struct mt7996_sta *msta)
 {
 	struct mt7996_sta_link *msta_link;
 	unsigned int link_id;
@@ -1375,7 +1379,6 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	ewma_signal_init(&msta_link->wcid.rssi);
 
 	rcu_assign_pointer(msta->link[link_id], msta_link);
-	msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
 
 	mt7996_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
@@ -1416,7 +1419,9 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 
 		mt7996_sta_deflink_release(dev, sta, link_id);
 		msta_link->wcid.link_valid = false;
-		msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
+		/* the firmware keeps the link pair of its last MLD setup */
+		if (msta->seclink_id == link_id)
+			msta->seclink_id = msta->deflink_id;
 	}
 
 	if (flush) {
@@ -1495,7 +1500,6 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED)
 				mt7996_sta_deflink_set(sta, link_id,
 						       msta_link->wcid.idx);
-			msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
 			returned |= BIT(link_id);
 			continue;
 		}
@@ -1559,6 +1563,8 @@ mt7996_mac_sta_add(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	msta->ba_rx_mask = 0;
 	msta->vif = mvif;
 	err = mt7996_mac_sta_add_links(dev, vif, sta, links);
+	if (!err)
+		msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
 
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -1812,8 +1818,10 @@ mt7996_mac_sta_links_sync(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	unsigned int link_id;
 	int err;
 
-	if (msta->conn_state == CONN_STATE_DISCONNECT)
+	if (msta->conn_state == CONN_STATE_DISCONNECT) {
+		msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
 		return 0;
+	}
 
 	links &= mt7996_mac_sta_links(dev, vif, sta);
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -1886,6 +1894,9 @@ mt7996_mac_sta_links_sync(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			return err;
 	}
 
+	if (joined)
+		msta->seclink_id = mt7996_sta_seclink_get(dev, msta);
+
 	return mt7996_mac_sta_links_ba_add(dev, vif, sta, new_links | resumed);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d82a1f659366..0eeac9084de7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2815,11 +2815,11 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 {
 	unsigned long links = mt7996_mcu_sta_mld_setup_links(dev, vif, sta);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	u8 seclink_id = mt7996_sta_seclink_get(dev, msta);
 	unsigned int nlinks = hweight16(links);
 	struct mld_setup_link *mld_setup_link;
 	struct sta_rec_mld_setup *mld_setup;
 	struct mt7996_sta_link *msta_link;
-	u8 seclink_id = msta->deflink_id;
 	unsigned int link_id;
 	struct tlv *tlv;
 
@@ -2840,8 +2840,8 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		mld_setup->setup_wcid = cpu_to_le16(msta->fw_mld_idx);
 	mld_setup->primary_id = mld_setup->setup_wcid;
 
-	if (links & BIT(msta->seclink_id))
-		seclink_id = msta->seclink_id;
+	if (!(links & BIT(seclink_id)))
+		seclink_id = msta->deflink_id;
 	msta_link = mt7996_sta_link_protected(dev, msta, seclink_id);
 	mld_setup->seconed_id = cpu_to_le16(msta_link->wcid.idx);
 	mld_setup->link_num = nlinks;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index c50fd3c15728..5ee8bf12f73b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -941,6 +941,7 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 				unsigned int link_id, bool flush);
 u16 mt7996_mac_sta_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			 struct ieee80211_sta *sta);
+u8 mt7996_sta_seclink_get(struct mt7996_dev *dev, struct mt7996_sta *msta);
 void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,
 			      struct ieee80211_twt_setup *twt);
-- 
2.47.3

