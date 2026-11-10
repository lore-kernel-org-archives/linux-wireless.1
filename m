Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280423;
	b=3KimqMZnOOwg8cPQ+ox44DJVqtJNLyfrl3l+jAsbQCu0NH3wrxfZ7/6ZnFWjQPKPcIl2
	 3iOKnwwe/LQyFLBnEyQlHa0hOWnsP6CKxYWlH/gvC0vDJ6ps6eM7WOaO4LiVzrxUvGKJe
	 12h932Sk1lvfzWoeLUaAYsbWpfL+qEL/ohSRZ36GmHQ99f41wRxkbP5sOWE+/L02s0F6f
	 JmoAyKJSnMOmnXqcq0dXBfdpGsRxbtPb6Om11KU+SaqGDAjUVa0habXOiQpy89Jy5MKVb
	 FUv+/Tth5dEPpzKvilwRfNRZM9G9+REPPcqWIgFBlq2cIRKMNcfssD9D7PPC+XeDVSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280423;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=z4meNRwPR0gTIqxKvnxR0qV693IFvMZkroR4/E2fqMk=;
	b=OLBe5Ym27StX/3xGxykNDJwr0Kv1S8CqB6GTI2qjQkiZr6DT9JxLxIXNHObU69eq38QM
	 ut0am8svRQANysfIc68xfBGA/p+EclXyYUA0Hd9Wd6b6y1CxTnM0frr5iBzN8nW2+ve53
	 6LCQLNb3dLh3AoeJ4e7O252VeQ7nzyf359NNIMNnhmP788umxTyFLZhE9s3ANpTR0PDOA
	 zaUm9DqlWa20kFXcTkaHSwcLAcs4AG4kDuploqcgXD9F5WwrNj/OrdH27x6bSrPzfLX2V
	 +GKMtU5X9b0TPfb3LBrjBY3g6h++3YCNPTUKZ/jSGndWLNIXLmab3EqAvENQnJbClFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MujpjhV5;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC2606E631
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BC2606E631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MujpjhV5
X-UUID: b7b72f14dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z4meNRwPR0gTIqxKvnxR0qV693IFvMZkroR4/E2fqMk=;
	b=MujpjhV5/lxN1FsadIm+N1ZYp+kb+NkbzwrU5lAzMY0XgmtBjC/ud8XAnJqGNKGK/7SJl7JCGnTHTsWvaKLAIjxUgcKuKwiWOD1Mp9/G3l9hbP6ZTZleT/ruoFoN9OJiZSRbGxsQiiD3TrvlAs6thz+Man2eUV0jZ8NlaVqrntc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7a49a30a-f160-420a-9c76-6ea89ad5cf45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:232b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7b72f14dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770056206; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH 19/28] wifi: mt76: mt7925: publish every link before sending any STA_REC
Date: Tue, 10 Nov 2026 11:12:35 +0800
Message-ID: <20261110031244.369014-20-emery.hsin@mediatek.com>
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

The MLD setup TLV is built from msta->link[], so a STA_REC sent while
later links are missing carries a partial MLD. Publish every link first,
then program them primary first. A single link to MLD upgrade re-adds the
primary with a new wcid on the reused deflink storage.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 60 +++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b497e904d4b5..a93df77da269 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1212,6 +1212,9 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 	unsigned int link_id;
 	int err = 0;
 
+	/* Publish every link before sending any STAREC, so the MLD setup TLV
+	 * describes the whole MLD.
+	 */
 	for_each_set_bit(link_id, &new_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1220,6 +1223,26 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (msta->deflink_id == IEEE80211_LINK_UNSPECIFIED) {
 			mlink = &msta->deflink;
 			is_deflink = true;
+		} else if (link_id == msta->deflink_id &&
+			   rcu_access_pointer(msta->link[link_id]) ==
+			   &msta->deflink) {
+			/* Single link to MLD upgrade: re-add the primary with
+			 * a new wcid so it binds to the granted band. This runs
+			 * from the AUTHORIZE transition before mac80211 sets
+			 * WLAN_STA_AUTHORIZED, so no data is being sent on this
+			 * sta and reusing the deflink storage is safe.
+			 */
+			link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+			if (mt7925_mcu_sta_update(dev, link_sta, vif,
+						  &msta->deflink, false,
+						  MT76_STA_INFO_STATE_NONE))
+				dev_dbg(dev->mt76.dev,
+					"failed to tear down the old STA_REC\n");
+			mt7925_mac_link_sta_free_wcid(&dev->mt76,
+						      &msta->deflink);
+			synchronize_rcu();
+			mlink = &msta->deflink;
+			is_deflink = true;
 		} else {
 			mlink = kzalloc_obj(*mlink);
 			if (!mlink) {
@@ -1236,8 +1259,17 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		err = mt7925_mac_link_sta_alloc(&dev->mt76, vif, link_sta,
 						mlink);
 		if (err) {
-			if (!is_deflink)
+			if (!is_deflink) {
 				kfree(mlink);
+			} else if (link_id == msta->deflink_id) {
+				/* the upgrade path above already freed the
+				 * deflink wcid, so unpublish it here instead
+				 * of freeing the shared wcid a second time
+				 */
+				rcu_assign_pointer(msta->link[link_id], NULL);
+				msta->valid_links &= ~BIT(link_id);
+				msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+			}
 			break;
 		}
 
@@ -1246,13 +1278,33 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		if (is_deflink)
 			msta->deflink_id = link_id;
 
-		/* published into msta->link[]; let the unwind path free it */
 		added_links |= BIT(link_id);
+	}
+
+	/* Configure the primary link first, it anchors the MLD. */
+	if (!err && msta->deflink_id != IEEE80211_LINK_UNSPECIFIED &&
+	    (added_links & BIT(msta->deflink_id))) {
+		struct mt792x_link_sta *mlink =
+			mt792x_sta_to_link(msta, msta->deflink_id);
+		struct ieee80211_link_sta *link_sta =
+			mt792x_sta_to_link_sta(vif, sta, msta->deflink_id);
+
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta, mlink);
+	}
+	for_each_set_bit(link_id, &added_links,
+			 IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_sta *link_sta;
+		struct mt792x_link_sta *mlink;
 
-		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta,
-					      mlink);
 		if (err)
 			break;
+		if (link_id == msta->deflink_id)
+			continue;
+
+		mlink = mt792x_sta_to_link(msta, link_id);
+		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+		err = mt7925_mac_link_sta_add(&dev->mt76, vif, link_sta,
+					      mlink);
 	}
 
 	if (err && added_links)
-- 
2.45.2

