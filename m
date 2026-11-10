Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280422;
	b=s2NpIBAvcGI1ih3F0r1jQ7inCKYV1Rl0HrxaycWtyhgt96vcXjByFV4C5Rzz4Xa4B3lH
	 e9YmfK3mkwa3BYaPcTp7c/pWXHIhsLEfIieufZpbgwpUYU3W4QrFVham4sTZjkm391b23
	 /cDLnQAsjaiesKCbapHhwJUQgKXcSlgOsZMr+obbpY4YzZcFmsRWHkcnjsoeqbICxcmwf
	 6lA7YCUQhDMccfaogQnsiv1kFpokIPbnRAdjAAy4K7zj2YmAHc+dL6MYueXSlGAt76+7X
	 ctWzsAUUtIqnUpOTh66oSXsex69QePp7DGdKYVLNdI2kbXdMboL2c9+ZPBYGhCQXDyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280422;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=8Qg2Uhm1gtlDncaLHm+HfiIdz5DZVEbgtKSsye2qViw=;
	b=M2xonsfLYvcezdFJutl5Thb7WHSE9F4QO6/HdcTm/bcfnL9quSezaS2Ed1nE0nEvWWKu
	 hDp10mLwfpbl0EkDUGZJnVZE2baskJSQO7Se/wXds/pUoax2rRVRaAc+yg0Gc0/ZQ++d+
	 uvN5j1zijBm0rud8SY9eVhtnNyz7+UAFFRcB7u4Vph5i6TFPxjMBPUjdd9b9hU1Td9l4Z
	 10qBi3XhlkG2Nmer91YDkyzs0kwj0X+jBIlKROTa+tu49arvcNN2Y8+jXqEzMQLOH62wK
	 GVWyz9VE+/2gkVfdA6WRC9UNYbi54zIvleXNniWVTK8l6pAitepESWFWrek44GJr09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rynWokgJ;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2482606E61B
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2482606E61B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rynWokgJ
X-UUID: b79c1c06dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8Qg2Uhm1gtlDncaLHm+HfiIdz5DZVEbgtKSsye2qViw=;
	b=rynWokgJx/Aw0IQdjafDTjupdr4/DQ0kKWolgAGz5qR6Q3oEA9LBtQKjuZmYgiCbuvO5NtofC/6b+isQB6E1ebVoFNx9LI46f+7l0pUG6i4hvutVTLKTzTK7iAtxYpE8i4rsWUBX4ScERgYi+wtR/jQnez5//OKFWERpjEe/Zz4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:99ab70d3-9290-46ee-a579-97b3d96f4f4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:581ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b79c1c06dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1097368979; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 14/28] wifi: mt76: mt7925: describe the whole MLD in the STA/BSS MLD TLVs
Date: Tue, 10 Nov 2026 11:12:30 +0800
Message-ID: <20261110031244.369014-15-emery.hsin@mediatek.com>
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

The firmware drops a per-link STAREC update with link_num == 1, so
mid-add links were never registered. Describe every existing link in
the MLD TLV (now up to 3 links), and limit EMLSR to fewer than 3 links.

This replaces the pending link parameter added by commit dd3f17ef69ed
("wifi: mt76: mt7925: keep MLD membership consistent during link add").

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  14 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 126 ++++++++----------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   2 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   3 +-
 5 files changed, 69 insertions(+), 78 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index cbe62db21bbf..20acfcb9d1b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1518,7 +1518,7 @@ mt7925_vif_connect_iter(void *priv, u8 *mac,
 					    true, NULL);
 		mt7925_mcu_sta_update(dev, NULL, vif,
 				      &mvif->sta.deflink, true,
-				      MT76_STA_INFO_STATE_NONE, NULL);
+				      MT76_STA_INFO_STATE_NONE);
 		mt7925_mcu_uni_add_beacon_offload(dev, hw, vif, true);
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 50e3716b7385..9330fe89a4f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1130,7 +1130,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (!is_secondary_link_sta) {
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
-					    MT76_STA_INFO_STATE_NONE, NULL);
+					    MT76_STA_INFO_STATE_NONE);
 		if (ret)
 			goto out_pm;
 	} else {
@@ -1151,13 +1151,13 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
 					    pri_mlink, true,
-					    MT76_STA_INFO_STATE_ASSOC, mlink);
+					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
 			goto out_pm;
 
 		ret = mt7925_mcu_sta_update(dev, link_sta, vif,
 					    mlink, true,
-					    MT76_STA_INFO_STATE_ASSOC, mlink);
+					    MT76_STA_INFO_STATE_ASSOC);
 		if (ret)
 			goto out_pm;
 	}
@@ -1356,7 +1356,7 @@ static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 	memset(mlink->airtime_ac, 0, sizeof(mlink->airtime_ac));
 
 	mt7925_mcu_sta_update(dev, link_sta, vif, mlink, true,
-			      MT76_STA_INFO_STATE_ASSOC, NULL);
+			      MT76_STA_INFO_STATE_ASSOC);
 
 	mt792x_mutex_release(dev);
 }
@@ -1422,7 +1422,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
 	mt7925_mcu_sta_update(dev, link_sta, vif, mlink, false,
-			      MT76_STA_INFO_STATE_NONE, NULL);
+			      MT76_STA_INFO_STATE_NONE);
 	mt7925_mac_wtbl_update(dev, mlink->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
@@ -2144,7 +2144,7 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	err = mt7925_mcu_sta_update(dev, NULL, vif,
 				    &mvif->sta.deflink, true,
-				    MT76_STA_INFO_STATE_NONE, NULL);
+				    MT76_STA_INFO_STATE_NONE);
 out:
 	mt792x_mutex_release(dev);
 
@@ -2334,7 +2334,7 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_ASSOC) {
 		mt7925_mcu_sta_update(dev, NULL, vif,
 				      &mvif->sta.deflink, true,
-				      MT76_STA_INFO_STATE_ASSOC, NULL);
+				      MT76_STA_INFO_STATE_ASSOC);
 		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
 
 		if (ieee80211_vif_is_mld(vif))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 76f638953f50..27410eb940ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2328,7 +2328,8 @@ mt7925_mcu_sta_eht_mld_tlv(struct sk_buff *skb,
 		  (ext_capa->eml_capabilities & (IEEE80211_EML_CAP_EML_PADDING_DELAY |
 						IEEE80211_EML_CAP_EML_TRANSITION_DELAY));
 
-	if (eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP) {
+	if ((eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP) &&
+	    hweight16(mvif->valid_links) < 3) {
 		eht_mld->eml_cap[0] = u16_get_bits(eml_cap, GENMASK(7, 0));
 		eht_mld->eml_cap[1] = u16_get_bits(eml_cap, GENMASK(15, 8));
 	} else {
@@ -2340,82 +2341,67 @@ static void
 mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta,
-		       struct mt792x_bss_conf *mconf,
-		       struct mt792x_link_sta *mlink,
-		       struct mt792x_link_sta *pending)
+		       struct mt792x_link_sta *mlink)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
-	struct mt792x_dev *dev = mvif->phy->dev;
-	unsigned long valid = msta->valid_links;
-	struct mt792x_bss_conf *mconf_pri;
+	unsigned long valid = mvif->valid_links;
+	struct mt792x_link_sta *pri_mlink;
 	struct sta_rec_mld *mld;
-	unsigned int link_id;
+	unsigned int i, cnt = 0;
 	struct tlv *tlv;
-	u8 max_links;
-	u8 cnt = 0;
-
-	/* Primary link always uses driver's deflink WCID. */
-	mconf_pri = (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED) ?
-		    mt792x_vif_to_link(mvif, msta->deflink_id) : NULL;
-
-	/* If caller is operating on deflink, reuse its mconf as primary. */
-	if (!mconf_pri && mlink == &msta->deflink)
-		mconf_pri = mconf;
-
-	if (!mconf_pri) {
-		dev_warn_ratelimited(dev->mt76.dev,
-				     "mt7925: MLD_TLV_LINK skip (no primary mconf) sta=%pM\n",
-			sta->addr);
-		return;
-	}
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MLD, sizeof(*mld));
 	mld = (struct sta_rec_mld *)tlv;
 	memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
 
-	mld->primary_id = cpu_to_le16(msta->deflink.wcid.idx);
-	mld->wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
-
-	/* Always encode primary link first. */
-	mld->link[cnt].wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
-	mld->link[cnt++].bss_idx = mconf_pri->mt76.idx;
-
-	max_links = ARRAY_SIZE(mld->link);
-
-	/* A link being added is not set in msta->valid_links yet */
-	if (pending && pending != &msta->deflink)
-		valid |= BIT(pending->wcid.link_id);
-
-	for_each_set_bit(link_id, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-		struct mt792x_link_sta *mlink_sec;
-		struct mt792x_bss_conf *mconf_sec;
+	/* primary_id is the wcid of the primary link; the link being added is
+	 * not in msta->link[] yet.
+	 */
+	pri_mlink = (mlink && mlink->wcid.link_id == msta->deflink_id) ?
+		    mlink : mt792x_sta_to_link(msta, msta->deflink_id);
+	if (!pri_mlink)
+		pri_mlink = &msta->deflink;
+
+	mld->primary_id = cpu_to_le16(pri_mlink->wcid.idx);
+	/* secondary defaults to primary for a single link */
+	mld->secondary_id = cpu_to_le16(pri_mlink->wcid.idx);
+	mld->wlan_id = cpu_to_le16(pri_mlink->wcid.idx);
+
+	/* Describe every link, sorted by firmware link index; firmware ignores
+	 * an MLD TLV with link_num == 1.
+	 */
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_link_sta *mlink_i;
+		struct mt792x_bss_conf *mconf;
+		unsigned int j;
+		u8 bss_idx;
 
-		if (cnt == max_links)
+		if (cnt == ARRAY_SIZE(mld->link))
 			break;
 
-		if (link_id == msta->deflink_id)
-			continue;
-
-		mlink_sec = mt792x_sta_to_link(msta, link_id);
-		if (!mlink_sec && pending && link_id == pending->wcid.link_id)
-			mlink_sec = pending;
-		if (!mlink_sec || mlink_sec == &msta->deflink)
+		/* the link being added is passed in by the caller */
+		mlink_i = (mlink && mlink->wcid.link_id == i) ?
+			  mlink : mt792x_sta_to_link(msta, i);
+		if (!mlink_i)
 			continue;
 
-		mconf_sec = rcu_dereference_protected(mvif->link_conf[link_id],
-						      lockdep_is_held(&dev->mt76.mutex));
-		if (!mconf_sec)
-			continue;
-
-		if (cnt == 1)
-			mld->secondary_id = cpu_to_le16(mlink_sec->wcid.idx);
+		mconf = mt792x_vif_to_link(mvif, i);
+		bss_idx = mconf->mt76.idx;
 
-		mld->link[cnt].wlan_id = cpu_to_le16(mlink_sec->wcid.idx);
-		mld->link[cnt++].bss_idx = mconf_sec->mt76.idx;
+		/* insertion sort by bss_idx, at most 3 links */
+		for (j = cnt; j > 0 && mld->link[j - 1].bss_idx > bss_idx; j--)
+			mld->link[j] = mld->link[j - 1];
+		mld->link[j].wlan_id = cpu_to_le16(mlink_i->wcid.idx);
+		mld->link[j].bss_idx = bss_idx;
+		cnt++;
 	}
 
 	mld->link_num = cnt;
+
+	/* secondary is link[1] */
+	if (mld->link_num > 1)
+		mld->secondary_id = mld->link[1].wlan_id;
 }
 
 static void
@@ -2431,8 +2417,7 @@ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 
 static int
 mt7925_mcu_sta_cmd(struct mt76_phy *phy,
-		   struct mt76_sta_cmd_info *info,
-		   struct mt792x_link_sta *pending)
+		   struct mt76_sta_cmd_info *info)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -2470,10 +2455,14 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 					    info->vif, info->rcpi,
 					    info->state);
 
-		if (info->state != MT76_STA_INFO_STATE_NONE) {
+		/* Only MLD vifs carry the MLD TLV: a non-MLD vif (valid_links ==
+		 * 0) would produce link_num == 0 with primary_id set, which the
+		 * firmware cannot parse, and drops the unicast data path.
+		 */
+		if (info->state != MT76_STA_INFO_STATE_NONE &&
+		    ieee80211_vif_is_mld(info->vif)) {
 			mt7925_mcu_sta_mld_tlv(skb, info->vif,
-					       info->link_sta->sta,
-					       mconf, mlink, pending);
+					       info->link_sta->sta, mlink);
 
 			mt7925_mcu_sta_eht_mld_tlv(skb, info->vif, info->link_sta->sta);
 		}
@@ -2498,8 +2487,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 			  struct ieee80211_vif *vif,
 			  struct mt792x_link_sta *mlink,
 			  bool enable,
-			  enum mt76_sta_info_state state,
-			  struct mt792x_link_sta *pending)
+			  enum mt76_sta_info_state state)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	int rssi = -ewma_rssi_read(&mvif->bss_conf.rssi);
@@ -2517,7 +2505,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	info.wcid = &mlink->wcid;
 	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
-	return mt7925_mcu_sta_cmd(&dev->mphy, &info, pending);
+	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
 }
 
 int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
@@ -3205,7 +3193,11 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
 
-	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_EML_EN)) {
+	/* single active link, STR is not supported */
+	mld->max_link_num = 0;
+
+	if ((phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_EML_EN)) &&
+	    hweight16(mvif->valid_links) < 3) {
 		is_supported_ap = mt7925_emlsr_oui_allowed(phy->mt76->hw->wiphy,
 							   link_conf->chanreq.oper.chan,
 							   link_conf->bssid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index e0f8230b05a4..dea93f4186ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -479,7 +479,7 @@ struct sta_rec_mld {
 		__le16 wlan_id;
 		u8 bss_idx;
 		u8 rsv;
-	} __packed link[2];
+	} __packed link[3];
 } __packed;
 
 struct sta_rec_eht_mld {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 50745caadeeb..d829eb9686c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -315,8 +315,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 			  struct ieee80211_vif *vif,
 			  struct mt792x_link_sta *mlink,
 			  bool enable,
-			  enum mt76_sta_info_state state,
-			  struct mt792x_link_sta *pending);
+			  enum mt76_sta_info_state state);
 int mt7925_mcu_set_chan_info(struct mt792x_phy *phy, u16 tag);
 int mt7925_mcu_set_tx(struct mt792x_dev *dev, struct ieee80211_bss_conf *bss_conf);
 int mt7925_mcu_set_eeprom(struct mt792x_dev *dev);
-- 
2.45.2

