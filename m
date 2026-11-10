Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280424;
	b=eQNmdvRwqvoBSge7UnNrfg53bhYWdkD8lwxdyixpJpKLIw0rVvJZUUOwKvqIymKejDMU
	 0aLz+Q31r7IJjFFh7zmp6gPhW1XAx4DAw+umdGRLN3bNR10bUTld8PVmHOZntjgL4ZQV2
	 6kUIw5GjSzZZ5x/PdToKbkD18sQtA6wJ2n571PSknlAm4SgH82D7gSturCXRel0/HHoh6
	 NldHngatVV+ukVjODOF1wJv42IRIHNSZRHfKUYYCueP1Wzahqg/PZoUxsEOkyp/AxZnSN
	 A3m7xoyOT43jasCypgoDi5hYNIZ//lMoKUElAzUwXM/dyFBVLxQi+vM3NrU5XGxNnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280424;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=GYLqRqd5EdIKO5CoJUVvcLn0FQZpHCRCgYY/nD1XTus=;
	b=sQ6ItHG+flXE2RE0OA8YVEa3XOpRoS5O1naR4Q8KVP6rykBCJIBgSUc4heyABSO8GlcU
	 /C5Za8+GFfm++L4gnwozz0VbW8yDv1SlwkyjqfupfU87aJQoTA/KWnOZaBeCMZReRBSQM
	 8gI3xvGWR6k5Js8faQvORP5eUlyQvcLL+4BFrh5HXZiLrzGUxBvadmK/BxB2J6+yU0OWB
	 awndh32VihoQT2TlGxiUT1zbos+9hedTr6nYYAa5eXqgVh9d7mrYaVnyTef8KpDdGA2rG
	 NcLODkAEQu19AF+hJLVQz+6/Efb1+OjZ0CzX2ohMSYQgj78EyuWEVCmVFysVDfxAG6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GoeFEuvr;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B94606E637
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B94606E637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GoeFEuvr
X-UUID: b7b45f32dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GYLqRqd5EdIKO5CoJUVvcLn0FQZpHCRCgYY/nD1XTus=;
	b=GoeFEuvrscD+cjdwoHtsSZhIPMOgXxpaOhwrbavtJHNe36m5yBRAVv2q5jT1xwCXmLI0KmbN8hoFonsThnXiJhZOt1H7vHPGtW2QDDGhAD+RvpfNvw/tF89uBzoGzGumZvzAspHVs87ImZBS4HwP3FLrsSfWjWMEq6c1SouT/QY=;
X-CID-CACHE: Type:Local,Time:202611101113+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4e828d45-a310-4b22-86c0-b165062b004f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:511ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7b45f32dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 137784497; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH 15/28] wifi: mt76: mt7925: assign a per-MLD firmware link index
Date: Tue, 10 Nov 2026 11:12:31 +0800
Message-ID: <20261110031244.369014-16-emery.hsin@mediatek.com>
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

valid_links is only updated after the whole add loop, so links added in
the same batch all read hweight16(valid_links) == 0 and collided on one
firmware link index. Pass a 0-based per-MLD index from the caller in link
order instead, independent of the device-wide BSS index.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9330fe89a4f1..f191b9e7d3f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -378,7 +378,8 @@ static int mt7925_start(struct ieee80211_hw *hw)
 
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 				   struct ieee80211_bss_conf *link_conf,
-				   struct mt792x_link_sta *mlink)
+				   struct mt792x_link_sta *mlink,
+				   u8 link_idx)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct ieee80211_vif *vif = link_conf->vif;
@@ -416,7 +417,10 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
 			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
-	mconf->mt76.link_idx = hweight16(mvif->valid_links);
+	/* Per-MLD 0-based link index for the firmware, independent of the
+	 * device-wide BSS index (mt76.idx).
+	 */
+	mconf->mt76.link_idx = ieee80211_vif_is_mld(vif) ? link_idx : 0;
 
 	if (mvif->phy->mt76->chandef.chan &&
 	    mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
@@ -478,7 +482,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
-	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
+	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink, 0);
 	if (ret < 0)
 		goto out;
 
@@ -2444,6 +2448,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct ieee80211_bss_conf *link_conf;
+	u8 link_idx = hweight16(old_links);
 	unsigned int link_id;
 	int err;
 
@@ -2511,7 +2516,7 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
 		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
 
-		err = mt7925_mac_link_bss_add(dev, link_conf, mlink);
+		err = mt7925_mac_link_bss_add(dev, link_conf, mlink, link_idx++);
 		if (err < 0)
 			goto free;
 
-- 
2.45.2

