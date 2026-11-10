Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280426;
	b=IKnfGb3xMqzaGw2yAmKqpiyyPmWDZfsTc89VbtOI8xhzL/ns8dstmH3UsatGjTN8DwEd
	 U6VxVXhvXEPmDJQhZwxz5G3MndjvNF2JhrSGv9gQzibAa8vWWUK15jjLvd/GM37j3fM2Q
	 lp7pVjJ0fryHdD41cRVjqo5OZJVbRTcaTFolA3M9MqojD8X9DeE1a9UH1BWHbHe/qYAOp
	 8Tamz+xxxLMqWz2fWgQSg9OCMcug5XVY3HBddYiPgINzJ+O8h3WvybAfQOyh6O0d27XMf
	 xdOF5eqOkDzkAQ3LedEwgGbiGMPCwpOG8yhfFuHob+2HGTX913QFL85aVJJbQrp0gbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280426;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ug14n02gPo7oMm0eBR67a2KWWf+Ck9I+JND8tnSrGfE=;
	b=pvy9JSZZMII6T6I4oIWt8YlKaJS4811qh6MrPFT3tTgvdUTBJrYkTeCCVJHXtKCxsT08
	 xISIG0ZWIpupJHB3rOVMXDomjIAw1/dSaHCWQjNNC20wbydhkmBIKmmcKmNr/LaBLXmOI
	 SSUUFUkxTVWUtFjWAtwskp5kpuCGQ+IvsptPbVhsgZQNnS31xwaVcdAC+b5mzhoAlhZPZ
	 /OTRYRxXl+O29MeRC3ibjrnER+BdNED3+sjsYTF2IyOZR0jDOiUph8HT6L4N+oTFKaI28
	 xgUNLYy31vzEzgrv4fTLnZKk/k4PiJdXuCBLQZm5WPVKI9YzyGY/utM0L6ghfb/TKkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=in9m8Rbr;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2D606A908
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB2D606A908
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=in9m8Rbr
X-UUID: b856dd2adcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ug14n02gPo7oMm0eBR67a2KWWf+Ck9I+JND8tnSrGfE=;
	b=in9m8RbrC/2iOHcHxIFyhJpINT7wB9ek0stcpZwRrZiYfNHr8LAM9j8CX4LL3vPYXmgLj9B4fqh3XCNt6Dk9xJyPNhG4T6qZpDvhrwyaofJuKMsYdB6yrbKEytHQJXYDpbZazE6y8CONms6BGf7WlDYqfP5Cl4X/WUFAAweFBuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6f088397-0ced-476c-87c4-c9a60be284ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:4f1ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b856dd2adcb411f1b1788b6acf885367-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1486063170; Tue, 10 Nov 2026 11:13:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:35 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 23/28] wifi: mt76: mt7925: bring up all MLO links on authorization
Date: Tue, 10 Nov 2026 11:12:39 +0800
Message-ID: <20261110031244.369014-24-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
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
Content-Type: text/plain
X-MTK: N

Bring up the MLO links at authorization instead of association: one MLO
ROC for the whole link set, then BSS_INFO and STA_REC for every link, and
re-install the keys that were set while only the primary link existed.
The links are no longer activated with ieee80211_set_active_links_async().

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 390 +++++++++++++-----
 1 file changed, 297 insertions(+), 93 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 45d656cfee21..1192a01006bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -484,6 +484,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->sta.vif = mvif;
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
+	mvif->valid_links = 0;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink,
 				      true, 0);
@@ -1344,39 +1345,6 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
-static void
-mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
-{
-	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct ieee80211_bss_conf *link_conf =
-		mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
-	struct cfg80211_chan_def *chandef = &link_conf->chanreq.oper;
-	enum nl80211_band band = chandef->chan->band, secondary_band;
-
-	u16 sel_links = mt76_select_links(vif, 2);
-	u8 secondary_link_id = __ffs(~BIT(mvif->deflink_id) & sel_links);
-
-	if (!ieee80211_vif_is_mld(vif) || hweight16(sel_links) < 2)
-		return;
-
-	link_conf = mt792x_vif_to_bss_conf(vif, secondary_link_id);
-	secondary_band = link_conf->chanreq.oper.chan->band;
-
-	if (band == NL80211_BAND_2GHZ ||
-	    (band == NL80211_BAND_5GHZ && secondary_band == NL80211_BAND_6GHZ)) {
-		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
-
-		mt792x_mutex_acquire(dev);
-
-		mt7925_set_mlo_roc(mvif->phy, &mvif->bss_conf, sel_links);
-
-		mt792x_mutex_release(dev);
-	}
-
-	ieee80211_set_active_links_async(vif, sel_links);
-}
-
 struct mt7925_set_links_key_iter {
 	unsigned long links;
 };
@@ -1446,50 +1414,98 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 	mt792x_mutex_release(dev);
 }
 
-int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-			 struct ieee80211_sta *sta, enum mt76_sta_event ev)
+/* Re-send each link's BSS_INFO after its STATE_NONE STAREC, then raise
+ * every link to STATE_ASSOC, primary first.
+ */
+static int mt7925_mac_multi_links_sta_assoc(struct mt76_dev *mdev,
+					    struct ieee80211_vif *vif,
+					    struct ieee80211_sta *sta,
+					    unsigned long new_links)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
-	struct ieee80211_link_sta *link_sta = &sta->deflink;
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned int link_id;
+	int err;
 
-	if (mvif->roc_join_held && !sta->tdls &&
-	    (ev == MT76_STA_EVENT_AUTHORIZE || ev == MT76_STA_EVENT_DISASSOC)) {
-		mvif->roc_join_held = false;
-		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
-	}
+	if (vif->type != NL80211_IFTYPE_STATION)
+		return 0;
 
-	switch (ev) {
-	case MT76_STA_EVENT_ASSOC:
-		if (ieee80211_vif_is_mld(vif)) {
-			struct mt792x_sta *msta =
-				(struct mt792x_sta *)sta->drv_priv;
+	if (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED &&
+	    (new_links & BIT(msta->deflink_id))) {
+		struct ieee80211_bss_conf *link_conf =
+			mt792x_vif_to_bss_conf(vif, msta->deflink_id);
+		struct ieee80211_link_sta *link_sta =
+			mt792x_sta_to_link_sta(vif, sta, msta->deflink_id);
 
-			link_sta = mt792x_sta_to_link_sta(vif, sta,
-							  msta->deflink_id);
-			mt7925_mac_set_links(mdev, vif);
+		if (link_conf && link_sta) {
+			struct mt792x_bss_conf *mconf =
+				mt792x_link_conf_to_mconf(link_conf);
+
+			err = mt7925_mcu_add_bss_info(&dev->phy,
+						      mconf->mt76.ctx,
+						      link_conf, link_sta,
+						      true);
+			if (err)
+				return err;
 		}
+	}
 
-		mt7925_mac_link_sta_assoc(mdev, vif, link_sta);
-		break;
-	case MT76_STA_EVENT_AUTHORIZE:
-		if (vif->type == NL80211_IFTYPE_NAN_DATA) {
-			int ret;
+	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_bss_conf *link_conf;
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_bss_conf *mconf;
 
-			mt792x_mutex_acquire(dev);
-			ret = mt792x_nan_map_sta_rec(mdev, vif, sta);
-			mt792x_mutex_release(dev);
+		if (link_id == msta->deflink_id)
+			continue;
 
-			return ret;
+		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!link_conf || !link_sta)
+			continue;
+		mconf = mt792x_link_conf_to_mconf(link_conf);
+
+		err = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+					      link_conf, link_sta, true);
+		if (err)
+			return err;
+	}
+
+	if (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED &&
+	    (new_links & BIT(msta->deflink_id))) {
+		struct mt792x_link_sta *mlink =
+			mt792x_sta_to_link(msta, msta->deflink_id);
+		struct ieee80211_link_sta *link_sta =
+			mt792x_sta_to_link_sta(vif, sta, msta->deflink_id);
+
+		if (mlink && link_sta) {
+			err = mt7925_mcu_sta_update(dev, link_sta, vif,
+						    mlink, true,
+						    MT76_STA_INFO_STATE_ASSOC);
+			if (err)
+				return err;
 		}
-		break;
-	default:
-		break;
+	}
+
+	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_link_sta *mlink;
+
+		if (link_id == msta->deflink_id)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		if (!mlink || !link_sta)
+			continue;
+
+		err = mt7925_mcu_sta_update(dev, link_sta, vif, mlink, true,
+					    MT76_STA_INFO_STATE_ASSOC);
+		if (err)
+			return err;
 	}
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(mt7925_mac_sta_event);
 
 static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct ieee80211_vif *vif,
@@ -1625,6 +1641,203 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	return 0;
 }
 
+/* Bring up all selected links at once: one MLO ROC for the whole set,
+ * then add every link on its granted band. Keys were installed when only
+ * the primary link existed, so re-install them on all links afterwards.
+ */
+static void
+mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+		     struct ieee80211_sta *sta)
+{
+	struct mt792x_bss_conf *mconfs[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mconf;
+	struct mt792x_link_sta *mlinks[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mlink;
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *pri_mconf = &mvif->bss_conf;
+	struct mt7925_set_links_key_iter key_it = { };
+	struct ieee80211_bss_conf *link_conf;
+	u8 order[IEEE80211_MLD_MAX_NUM_LINKS];
+	unsigned long sel_links, add, bss_done = 0;
+	unsigned int link_id, i;
+	int nadd = 0, err;
+	u8 max_links;
+
+	max_links = (dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN)) ? 3 : 2;
+	sel_links = mt76_select_links(vif, max_links);
+
+	if (!ieee80211_vif_is_mld(vif) || hweight16(sel_links) < 2)
+		return;
+
+	add = sel_links & ~vif->active_links;
+	if (!add)
+		return;
+
+	mt792x_mutex_acquire(dev);
+
+	/* allocate and publish the added sub-links' bss_conf / link_sta */
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		mconf = devm_kzalloc(dev->mt76.dev, sizeof(*mconf), GFP_KERNEL);
+		mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink), GFP_KERNEL);
+		if (!mconf || !mlink)
+			goto free;
+
+		mconfs[link_id] = mconf;
+		mlinks[link_id] = mlink;
+		mconf->link_id = link_id;
+		mconf->vif = mvif;
+		mlink->wcid.link_id = link_id;
+		mlink->wcid.link_valid = !!vif->valid_links;
+		mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
+	}
+
+	/* Keep bands the firmware does not allow as the third link off the
+	 * last slot, which the firmware VLS treats as the virtual link.
+	 */
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS)
+		order[nadd++] = link_id;
+
+	if ((dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN)) &&
+	    hweight16(sel_links) == 3 && nadd >= 2) {
+		link_conf = mt792x_vif_to_bss_conf(vif, order[nadd - 1]);
+		if (link_conf && link_conf->chanreq.oper.chan) {
+			enum nl80211_band b = link_conf->chanreq.oper.chan->band;
+			u8 lim = dev->phy.mlo_third_link_band_limit;
+
+			if ((b == NL80211_BAND_5GHZ && (lim & MT792x_THIRD_LINK_LIMIT_5G)) ||
+			    (b == NL80211_BAND_2GHZ && (lim & MT792x_THIRD_LINK_LIMIT_2G)))
+				swap(order[nadd - 1], order[nadd - 2]);
+		}
+	}
+
+	for (i = 0; i < nadd; i++) {
+		link_id = order[i];
+		mconf = mconfs[link_id];
+		mlink = mlinks[link_id];
+		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+
+		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
+		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
+
+		err = mt7925_mac_link_bss_add(dev, link_conf, mlink,
+					      hweight16(sel_links) != 3,
+					      i + 1);
+		if (err < 0)
+			goto free_bss;
+
+		bss_done |= BIT(link_id);
+	}
+
+	/* roc_iter looks up links via valid_links, publish before the ROC */
+	mvif->valid_links = sel_links;
+
+	/* one channel request covering all links */
+	err = mt7925_set_mlo_roc(&dev->phy, pri_mconf, sel_links);
+	if (err < 0)
+		goto free_bss;
+
+	err = mt7925_mac_sta_add_links(dev, vif, sta, sel_links);
+	if (err < 0)
+		goto free_roc;
+
+	/* Re-send BSS_INFO after the STAREC so firmware binds own_mld_id on
+	 * every link, then raise every link to STATE_ASSOC.
+	 */
+	err = mt7925_mac_multi_links_sta_assoc(mdev, vif, sta, sel_links);
+	if (err < 0)
+		goto free_roc;
+
+	/* Keys were installed when only the primary link existed; install
+	 * them on all links.
+	 */
+	key_it.links = sel_links;
+	ieee80211_iter_keys(mdev->hw, vif, mt7925_set_links_key_iter, &key_it);
+
+	mt792x_mutex_release(dev);
+
+	return;
+
+free_roc:
+	if (test_and_clear_bit(MT76_STATE_ROC, &dev->phy.mt76->state))
+		mt7925_mcu_abort_roc(&dev->phy, pri_mconf,
+				     dev->phy.roc_token_id);
+	/* roll back the added sta links that mt7925_mac_sta_add_links()
+	 * published. The primary link's STA_REC was reset to STATE_NONE during
+	 * the upgrade and cannot be restored here, so drop the connection and
+	 * let mac80211 reconnect instead of leaving it half torn down.
+	 */
+	mt7925_mac_sta_remove_links(dev, vif, sta, add);
+	ieee80211_connection_loss(vif);
+free_bss:
+	for_each_set_bit(link_id, &bss_done, IEEE80211_MLD_MAX_NUM_LINKS)
+		mt792x_mac_link_bss_remove(dev, mconfs[link_id],
+					   mlinks[link_id]);
+free:
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
+		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
+	}
+
+	/* wait for the readers before freeing the links */
+	synchronize_rcu();
+
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (mconfs[link_id])
+			devm_kfree(dev->mt76.dev, mconfs[link_id]);
+		if (mlinks[link_id])
+			devm_kfree(dev->mt76.dev, mlinks[link_id]);
+	}
+
+	mvif->valid_links = vif->active_links;
+
+	mt792x_mutex_release(dev);
+}
+
+int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta, enum mt76_sta_event ev)
+{
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_link_sta *link_sta = &sta->deflink;
+
+	if (mvif->roc_join_held && !sta->tdls &&
+	    (ev == MT76_STA_EVENT_AUTHORIZE || ev == MT76_STA_EVENT_DISASSOC)) {
+		mvif->roc_join_held = false;
+		mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
+	}
+
+	switch (ev) {
+	case MT76_STA_EVENT_ASSOC:
+		if (ieee80211_vif_is_mld(vif)) {
+			struct mt792x_sta *msta =
+				(struct mt792x_sta *)sta->drv_priv;
+
+			link_sta = mt792x_sta_to_link_sta(vif, sta,
+							  msta->deflink_id);
+		}
+		mt7925_mac_link_sta_assoc(mdev, vif, link_sta);
+		break;
+	case MT76_STA_EVENT_AUTHORIZE:
+		if (vif->type == NL80211_IFTYPE_NAN_DATA) {
+			int ret;
+
+			mt792x_mutex_acquire(dev);
+			ret = mt792x_nan_map_sta_rec(mdev, vif, sta);
+			mt792x_mutex_release(dev);
+
+			return ret;
+		}
+
+		if (ieee80211_vif_is_mld(vif))
+			mt7925_mac_set_links(mdev, vif, sta);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7925_mac_sta_event);
+
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
 {
@@ -2531,7 +2744,6 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	unsigned long add = new_links & ~old_links;
 	unsigned long rem = old_links & ~new_links;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct ieee80211_bss_conf *link_conf;
 	u8 link_idx = hweight16(old_links);
 	unsigned int link_id;
@@ -2540,6 +2752,20 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (old_links == new_links)
 		return 0;
 
+	/* The links already exist, so there is nothing to set up. Links are
+	 * not added or removed dynamically; ML reconfiguration is not yet
+	 * supported (TBD).
+	 */
+	if (!(new_links & ~mvif->valid_links) && new_links)
+		return 0;
+
+	/* On teardown mac80211 only passes the active links, but links that
+	 * the firmware never reported active were never in active_links. Use
+	 * the driver's own valid_links so every published sub-link is freed.
+	 */
+	if (!new_links)
+		rem = mvif->valid_links;
+
 	mt792x_mutex_acquire(dev);
 
 	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -2606,13 +2832,6 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 					      link_idx++);
 		if (err < 0)
 			goto free;
-
-		if (mconf != &mvif->bss_conf) {
-			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
-						 vif->active_links);
-			if (err < 0)
-				goto free;
-		}
 	}
 
 	mvif->valid_links = new_links;
@@ -2657,28 +2876,13 @@ static int
 mt7925_change_sta_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, u16 old_links, u16 new_links)
 {
-	unsigned long add = new_links & ~old_links;
-	unsigned long rem = old_links & ~new_links;
-	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	int err = 0;
-
-	if (old_links == new_links)
-		return 0;
-
-	mt792x_mutex_acquire(dev);
-
-	err = mt7925_mac_sta_remove_links(dev, vif, sta, rem);
-	if (err < 0)
-		goto out;
-
-	err = mt7925_mac_sta_add_links(dev, vif, sta, add);
-	if (err < 0)
-		goto out;
-
-out:
-	mt792x_mutex_release(dev);
-
-	return err;
+	/* No-op: links are set up in one shot by mt7925_mac_set_links() at
+	 * AUTHORIZE and torn down by mt7925_mac_sta_remove() on the sta_state
+	 * path. Links are not added or removed dynamically here; ML
+	 * reconfiguration is not yet supported (TBD). mac80211 requires the
+	 * hook to be present.
+	 */
+	return 0;
 }
 
 static int
-- 
2.45.2

