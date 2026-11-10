Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280421;
	b=R695iiFlxrndysM10gzRfBiVae/njDPgEtWpNX9rhURO2Fl0AZ84p2kZtMKDAr4UPtkD
	 0R+E7Jyl7TE/H3nmxGBOG8RCIjYSLWXjAwYLLO/7ri45cEd7NTm15fjsqohv9hOCy19yU
	 Bjw7TEY+jvMIBHjCPM/ivLXhxmVc9G8u4uAidpXc/PD+t+ObC/YXuBsp7+Ia8MplMRIb8
	 IO+aBc9BsiwCxvDpBTcOEwhKjtIHTGukR1IIzjww9nQUYixcO/5G3H27rf6+DKj7l0ej8
	 swnc6d4s+Dm2KSBQD4j4s6426PP5gECt9g4Ne4OcELFohBo2Z6uZwl4vzoE9CC1TSkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280421;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=VWGqf+5dLKi5Vg/w4Oo7f/IevE9GNX58wIzKyWfZUKE=;
	b=uGVmXTNXDInBHMbCrvNeL0iviV9Vbh4o2rxXsy6a4jt6ECzTRIHTHkPHbXy1F3zDV87A
	 mFwkyh9DGltUU4BpieiGP557bZjYDSPNxCJkDYRmfsOYVV6tVFZLtVPYDcsNyCSumHwBe
	 BAEgfucIprR/+9b3Xcjul8NZqQd4gK0vuWkiulMlHax58z0L/+B4h+fw4h+gg+ItABVjF
	 GpCBBf9RdOMmLEIqGkPudwNb9OCGTpKHZ6SzyWTg7ZNr0vopQ7lSv5TaiepogzyzyrCtR
	 sxIZVdgo3iRRzQGXIqPN/WBCzw+2wlpgOyYDk//ticrKQy2F40vYoNJTxxChtM7urSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XYknGqJz;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23CA606E612
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23CA606E612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XYknGqJz
X-UUID: b7981296dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VWGqf+5dLKi5Vg/w4Oo7f/IevE9GNX58wIzKyWfZUKE=;
	b=XYknGqJzs2y1j+CvbYv/ytBN8bimGnhpumbAQuoK/oBgP5ITkJwzwHx4LTpkz84/0H5+bfejvVWBb1G8Mn3ukkSYjpNwiFEMWjMH3pPpn51tEhtWjHdsgWPoCsx9rzGVDkmeAoipdXDAgBs/LfbYaxmV6Sa+ukM3MjGLBQorHI8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2e721c0c-ad99-45bc-856f-180d642ac269,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:202b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7981296dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 614693792; Tue, 10 Nov 2026 11:13:35 +0800
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
Subject: [PATCH 13/28] wifi: mt76: mt7925: support multi-link hybrid/EMLSR remain-on-channel
Date: Tue, 10 Nov 2026 11:12:29 +0800
Message-ID: <20261110031244.369014-14-emery.hsin@mediatek.com>
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

Program the primary link first, then up to two more links, and select the
firmware channel-privilege request type from the negotiated links: HYBRID
for three links, MLSR otherwise. Add the roc_acquire_tlv cnm_func_mask and
extra_info fields and per-link band grants for the multi-link request.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  59 ++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 158 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   4 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   7 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   2 +
 5 files changed, 174 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 702e4f01b0ed..50e3716b7385 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -637,6 +637,10 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 		return -EBUSY;
 
 	token = ++phy->roc_token_id;
+
+	/* plain ROC, see mt7925_set_mlo_roc() */
+	phy->roc_is_mlo = false;
+	phy->roc_mconf = mconf;
 	phy->roc_grant = false;
 	phy->roc_notify = type == MT7925_ROC_REQ_ROC;
 
@@ -662,16 +666,38 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 			      u16 sel_links)
 {
 	int err;
-	u8 token;
 
-	if (WARN_ON_ONCE(test_and_set_bit(MT76_STATE_ROC, &phy->mt76->state)))
-		return -EBUSY;
+	/* The plain and MLO ROC share MT76_STATE_ROC. Clear it with test_and_clear
+	 * so a concurrent mt7925_roc_work() self-no-ops before taking the mt792x
+	 * mutex this caller holds, otherwise the cancel_work_sync() below would
+	 * deadlock on it.
+	 */
+	if (WARN_ON_ONCE(test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))) {
+		struct mt792x_bss_conf *old = phy->roc_mconf;
 
-	token = ++phy->roc_token_id;
+		if (!phy->roc_is_mlo)
+			/* the ROC being taken over told mac80211 it is ready;
+			 * notify expiry so its state machine can move on
+			 */
+			ieee80211_remain_on_channel_expired(phy->mt76->hw);
+
+		timer_delete_sync(&phy->roc_timer);
+		cancel_work_sync(&phy->roc_work);
+		/* abort on the link the previous ROC was started on; using the
+		 * new request's mconf would carry the wrong bss_idx
+		 */
+		mt7925_mcu_abort_roc(phy, old, phy->roc_token_id);
+	}
+
+	set_bit(MT76_STATE_ROC, &phy->mt76->state);
+
+	phy->roc_is_mlo = true;
+	phy->roc_mconf = mconf;
 	phy->roc_grant = false;
 	phy->roc_notify = false;
 
-	err = mt7925_mcu_set_mlo_roc(phy, mconf, sel_links, 5, token);
+	err = mt7925_mcu_set_mlo_roc(phy, mconf, sel_links, 5,
+				     ++phy->roc_token_id);
 	if (err < 0) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
 		goto out;
@@ -2236,6 +2262,7 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_bss_conf *mconf;
 	u16 duration = info->duration ? info->duration :
 		       jiffies_to_msecs(HZ);
 
@@ -2246,9 +2273,14 @@ static void mt7925_mgd_prepare_tx(struct ieee80211_hw *hw,
 		duration = MT7925_P2P_GC_JOIN_CH_REQ_INTERVAL_MS;
 
 	mt792x_mutex_acquire(dev);
-	mt7925_set_roc(mvif->phy, &mvif->bss_conf,
-		       mvif->bss_conf.mt76.ctx->def.chan, duration,
-		       MT7925_ROC_REQ_JOIN);
+
+	mconf = mt792x_vif_to_link(mvif, info->link_id);
+
+	/* an inactive MLO link may have no chanctx */
+	if (mconf->mt76.ctx)
+		mt7925_set_roc(mvif->phy, mconf, mconf->mt76.ctx->def.chan,
+			       duration, MT7925_ROC_REQ_JOIN);
+
 	mt792x_mutex_release(dev);
 }
 
@@ -2257,6 +2289,8 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 				   struct ieee80211_prep_tx_info *info)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_bss_conf *mconf;
 
 	if (info->was_assoc)
 		return;
@@ -2274,7 +2308,14 @@ static void mt7925_mgd_complete_tx(struct ieee80211_hw *hw,
 		return;
 	}
 
-	mt7925_abort_roc(mvif->phy, &mvif->bss_conf);
+	/* abort on the link the ROC was started on; mt792x_vif_to_link needs
+	 * the mt76 mutex, drop it before mt7925_abort_roc re-takes it
+	 */
+	mt792x_mutex_acquire(dev);
+	mconf = mt792x_vif_to_link(mvif, info->link_id);
+	mt792x_mutex_release(dev);
+
+	mt7925_abort_roc(mvif->phy, mconf);
 }
 
 static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8323c821d4d8..76f638953f50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -450,16 +450,30 @@ mt7925_mcu_connection_loss_event(struct mt792x_dev *dev, struct sk_buff *skb)
 static void
 mt7925_mcu_roc_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
-	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt7925_roc_grant_tlv *grant = priv;
+	struct mt792x_bss_conf *mconf;
+	unsigned long valid_links;
+	unsigned int link_id;
 
-	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION)
+	/* MLD STA: update band_idx of the granted link */
+	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION) {
+		valid_links = READ_ONCE(mvif->valid_links);
+		for_each_set_bit(link_id, &valid_links, IEEE80211_MLD_MAX_NUM_LINKS) {
+			/* RCU iterator, no mutex held */
+			mconf = rcu_dereference(mvif->link_conf[link_id]);
+			if (mconf && mconf->mt76.idx == grant->bss_idx) {
+				mconf->mt76.band_idx = grant->dbdcband;
+				break;
+			}
+		}
 		return;
+	}
 
-	if (mvif->idx != grant->bss_idx)
+	if (mvif->bss_conf.mt76.idx != grant->bss_idx)
 		return;
 
-	mvif->band_idx = grant->dbdcband;
+	mvif->bss_conf.mt76.band_idx = grant->dbdcband;
 }
 
 static void mt7925_mcu_roc_handle_grant(struct mt792x_dev *dev,
@@ -487,10 +501,12 @@ static void mt7925_mcu_roc_handle_grant(struct mt792x_dev *dev,
 	if (grant->reqtype == MT7925_ROC_REQ_ROC)
 		ieee80211_ready_on_channel(hw);
 	else if (grant->reqtype == MT7925_ROC_REQ_JOIN ||
-		 grant->reqtype == MT7925_ROC_REQ_GO_START_BSS)
+		 grant->reqtype == MT7925_ROC_REQ_GO_START_BSS ||
+		 dev->phy.roc_is_mlo)
+		/* MLO grants also carry the primary link band */
 		ieee80211_iterate_active_interfaces_atomic(hw,
-						IEEE80211_IFACE_ITER_RESUME_ALL,
-						mt7925_mcu_roc_iter, grant);
+					   IEEE80211_IFACE_ITER_RESUME_ALL,
+					   mt7925_mcu_roc_iter, grant);
 	dev->phy.roc_grant = true;
 	wake_up(&dev->phy.roc_wait);
 }
@@ -558,6 +574,14 @@ mt7925_mcu_uni_roc_event(struct mt792x_dev *dev, struct sk_buff *skb)
 			mt7925_mcu_roc_handle_grant(dev, tlv);
 			break;
 		case UNI_EVENT_ROC_GRANT_SUB_LINK:
+			if (le16_to_cpu(tlv->len) <
+			    sizeof(struct mt7925_roc_grant_tlv))
+				break;
+
+			/* per-link grant: only update the link band */
+			ieee80211_iterate_active_interfaces_atomic(dev->mt76.hw,
+								   IEEE80211_IFACE_ITER_RESUME_ALL,
+								   mt7925_mcu_roc_iter, tlv);
 			break;
 		}
 	}
@@ -1577,6 +1601,26 @@ int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 	return mt76_mcu_skb_send_msg(dev, skb, mcu_cmd, true);
 }
 
+static u8 mt7925_chandef_to_cw(const struct cfg80211_chan_def *chandef)
+{
+	static const u8 width_to_cw[] = {
+		[NL80211_CHAN_WIDTH_20_NOHT] = MT7925_CW_20_40MHZ,
+		[NL80211_CHAN_WIDTH_20] = MT7925_CW_20_40MHZ,
+		[NL80211_CHAN_WIDTH_40] = MT7925_CW_20_40MHZ,
+		[NL80211_CHAN_WIDTH_80] = MT7925_CW_80MHZ,
+		[NL80211_CHAN_WIDTH_160] = MT7925_CW_160MHZ,
+		[NL80211_CHAN_WIDTH_80P80] = MT7925_CW_80P80MHZ,
+		[NL80211_CHAN_WIDTH_5] = MT7925_CW_5MHZ,
+		[NL80211_CHAN_WIDTH_10] = MT7925_CW_10MHZ,
+		[NL80211_CHAN_WIDTH_320] = MT7925_CW_320MHZ,
+	};
+
+	if (chandef->width >= ARRAY_SIZE(width_to_cw))
+		return 0;
+
+	return width_to_cw[chandef->width];
+}
+
 int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			   u16 sel_links, int duration, u8 token_id)
 {
@@ -1599,33 +1643,51 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 		u16 tag;
 		struct mt792x_bss_conf *mconf;
 		struct ieee80211_channel *chan;
-	} links[2];
+		struct cfg80211_chan_def *chandef;
+	} links[3];
+	u16 rem_links;
+	u8 nlinks, max_links;
 
 	struct {
 		struct {
 			u8 rsv[4];
 		} __packed hdr;
-		struct roc_acquire_tlv roc[2];
+		struct roc_acquire_tlv roc[3];
 	} __packed req = {
 			.roc[0].tag = cpu_to_le16(UNI_ROC_NUM),
 			.roc[0].len = cpu_to_le16(sizeof(struct roc_acquire_tlv)),
 			.roc[1].tag = cpu_to_le16(UNI_ROC_NUM),
-			.roc[1].len = cpu_to_le16(sizeof(struct roc_acquire_tlv))
+			.roc[1].len = cpu_to_le16(sizeof(struct roc_acquire_tlv)),
+			.roc[2].tag = cpu_to_le16(UNI_ROC_NUM),
+			.roc[2].len = cpu_to_le16(sizeof(struct roc_acquire_tlv))
 	};
 
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 
-	if (!mconf || hweight16(vif->valid_links) < 2 ||
-	    hweight16(sel_links) != 2)
+	/* 2-link MLSR/EMLSR always; 3-link HYBRID only if the chip supports it */
+	max_links = (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN)) ? 3 : 2;
+	nlinks = hweight16(sel_links);
+	if (!mconf || hweight16(vif->valid_links) < 2)
 		return -EPERM;
+	if (nlinks < 2)
+		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(links); i++) {
-		links[i].id = i ? __ffs(~BIT(mconf->link_id) & sel_links) :
-				 mconf->link_id;
+	nlinks = min_t(u8, nlinks, max_links);
+
+	/* primary link first, then the remaining links one by one */
+	rem_links = sel_links & ~BIT(mconf->link_id);
+	for (i = 0; i < nlinks; i++) {
+		if (i == 0) {
+			links[i].id = mconf->link_id;
+		} else {
+			links[i].id = __ffs(rem_links);
+			rem_links &= ~BIT(links[i].id);
+		}
 		link_conf = mt792x_vif_to_bss_conf(vif, links[i].id);
 		if (WARN_ON_ONCE(!link_conf))
 			return -EPERM;
 
+		links[i].chandef = &link_conf->chanreq.oper;
 		links[i].chan = link_conf->chanreq.oper.chan;
 		if (WARN_ON_ONCE(!links[i].chan))
 			return -EPERM;
@@ -1638,18 +1700,38 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 	}
 
 	if (!(wiphy->iftype_ext_capab[0].mld_capa_and_ops &
-	      IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS))
-		type = is_AG_band ? MT7925_ROC_REQ_MLSR_AG :
-				    MT7925_ROC_REQ_MLSR_AA;
-	else
+	      IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS)) {
+		/* Three links use HYBRID. Otherwise use MLSR, since EMLSR_JOIN
+		 * does not place two same-band links on separate DBDC bands.
+		 */
+		if (nlinks == 3 &&
+		    (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN)))
+			type = MT7925_ROC_REQ_HYBRID;
+		else
+			type = is_AG_band ? MT7925_ROC_REQ_MLSR_AG :
+					    MT7925_ROC_REQ_MLSR_AA;
+	} else {
 		type = MT7925_ROC_REQ_JOIN;
+	}
+
+	for (i = 0; i < nlinks; i++) {
+		struct cfg80211_chan_def *chandef = links[i].chandef;
+		u8 center_ch2 = 0;
+		u8 bw;
 
-	for (i = 0; i < ARRAY_SIZE(links) && i < hweight16(vif->active_links); i++) {
 		if (WARN_ON_ONCE(!links[i].mconf || !links[i].chan))
 			continue;
 
 		chan = links[i].chan;
-		center_ch = ieee80211_frequency_to_channel(chan->center_freq);
+		/* use the actual operating bandwidth / center, not a fixed
+		 * 20 MHz assumption (aligns with gen4m CNM ch privilege req)
+		 */
+		bw = mt7925_chandef_to_cw(chandef);
+		center_ch = ieee80211_frequency_to_channel(chandef->center_freq1);
+		if (chandef->center_freq2)
+			center_ch2 =
+				ieee80211_frequency_to_channel(chandef->center_freq2);
+
 		req.roc[i].len = cpu_to_le16(sizeof(struct roc_acquire_tlv));
 		req.roc[i].tag = cpu_to_le16(links[i].tag);
 		req.roc[i].tokenid = token_id;
@@ -1657,12 +1739,12 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 		req.roc[i].maxinterval = cpu_to_le32(duration);
 		req.roc[i].bss_idx = links[i].mconf->mt76.idx;
 		req.roc[i].control_channel = chan->hw_value;
-		req.roc[i].bw = CMD_CBW_20MHZ;
-		req.roc[i].bw_from_ap = CMD_CBW_20MHZ;
+		req.roc[i].bw = bw;
+		req.roc[i].bw_from_ap = bw;
 		req.roc[i].center_chan = center_ch;
 		req.roc[i].center_chan_from_ap = center_ch;
-		req.roc[i].center_chan2 = 0;
-		req.roc[i].center_chan2_from_ap = 0;
+		req.roc[i].center_chan2 = center_ch2;
+		req.roc[i].center_chan2_from_ap = center_ch2;
 
 		/* STR enables DBDC on all bands; otherwise let firmware pick */
 		req.roc[i].dbdcband = type == MT7925_ROC_REQ_JOIN ?
@@ -1675,10 +1757,14 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 			req.roc[i].sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 		req.roc[i].band = ch_band[chan->band];
+
+		/* mark as a multi-link channel request */
+		req.roc[i].extra_info = BIT(MT7925_ROC_EXTRA_INFO_MULTI_LINK);
 	}
 
 	return mt76_mcu_send_msg(&mvif->phy->dev->mt76, MCU_UNI_CMD(ROC),
-				 &req, sizeof(req), true);
+				 &req, sizeof(req.hdr) + nlinks * sizeof(req.roc[0]),
+				 true);
 }
 
 /* CNM uses bw / center_chan to pick the band and to decide whether a request
@@ -1699,26 +1785,6 @@ mt7925_mcu_roc_chandef(struct mt792x_bss_conf *mconf,
 	cfg80211_chandef_create(chandef, chan, NL80211_CHAN_NO_HT);
 }
 
-static u8 mt7925_chandef_to_cw(const struct cfg80211_chan_def *chandef)
-{
-	static const u8 width_to_cw[] = {
-		[NL80211_CHAN_WIDTH_20_NOHT] = MT7925_CW_20_40MHZ,
-		[NL80211_CHAN_WIDTH_20] = MT7925_CW_20_40MHZ,
-		[NL80211_CHAN_WIDTH_40] = MT7925_CW_20_40MHZ,
-		[NL80211_CHAN_WIDTH_80] = MT7925_CW_80MHZ,
-		[NL80211_CHAN_WIDTH_160] = MT7925_CW_160MHZ,
-		[NL80211_CHAN_WIDTH_80P80] = MT7925_CW_80P80MHZ,
-		[NL80211_CHAN_WIDTH_5] = MT7925_CW_5MHZ,
-		[NL80211_CHAN_WIDTH_10] = MT7925_CW_10MHZ,
-		[NL80211_CHAN_WIDTH_320] = MT7925_CW_320MHZ,
-	};
-
-	if (chandef->width >= ARRAY_SIZE(width_to_cw))
-		return 0;
-
-	return width_to_cw[chandef->width];
-}
-
 int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		       struct ieee80211_channel *chan, int duration,
 		       enum mt7925_roc_req type, u8 token_id)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 4a6a1226a317..e0f8230b05a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -628,7 +628,9 @@ struct roc_acquire_tlv {
 	u8 reqtype;
 	__le32 maxinterval;
 	u8 dbdcband;
-	u8 rsv[3];
+	u8 cnm_func_mask;
+	u8 extra_info;
+	u8 rsv[1];
 } __packed;
 
 enum ENUM_CMD_TEST_CTRL_ACT {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 1c20b4ae7497..50745caadeeb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -79,6 +79,8 @@ enum mt7925_roc_req {
 	MT7925_ROC_REQ_DFS_CAC = 4,
 	MT7925_ROC_REQ_MLSR_AG = 10,
 	MT7925_ROC_REQ_MLSR_AA,
+	MT7925_ROC_REQ_HYBRID = 12,	/* CH_REQ_TYPE_HYBRID_MLO_MLSR_JOIN, 3-link */
+	MT7925_ROC_REQ_EMLSR = 13,	/* CH_REQ_TYPE_MLO_EMLSR_JOIN, needs FW support */
 	MT7925_ROC_REQ_NUM
 };
 
@@ -86,6 +88,11 @@ enum mt7925_roc_req {
 #define MT7925_P2P_CHNL_HOLD_TIME_MS		3000
 #define MT7925_P2P_GC_JOIN_CH_REQ_INTERVAL_MS	4000
 
+/* roc_acquire_tlv extra_info bits */
+enum {
+	MT7925_ROC_EXTRA_INFO_MULTI_LINK,	/* BIT(0): MLO channel request */
+	MT7925_ROC_EXTRA_INFO_EMLSR,		/* BIT(1): unused by FW, kept for parity */
+};
 enum {
 	UNI_EVENT_ROC_GRANT = 0,
 	UNI_EVENT_ROC_GRANT_SUB_LINK = 4,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 5a501e72baca..458f6f1fd6cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -274,6 +274,8 @@ struct mt792x_phy {
 	u8 roc_token_id;
 	bool roc_grant;
 	bool roc_notify; /* mac80211 expects the expiry of this ROC */
+	bool roc_is_mlo;
+	struct mt792x_bss_conf *roc_mconf;
 };
 
 struct mt792x_irq_map {
-- 
2.45.2

