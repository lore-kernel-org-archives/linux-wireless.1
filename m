Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280422;
	b=b7PLETzsS0UKdzmj76JGxfDdvMmEZlUSMbz96uAgSmoKlm5kTbgKAlOCaAU7vIKxTnoO
	 Dxn60nUOM4S7KOMw/G56AtZ19xFaKYUutsvWQ9UwBtz+WsYa9xIQpzfbdUmn40AVmA8On
	 BUqPvhtaRyP0QzufZouta29HbuR1KnvKBykYfHfLQh2/UoVAQLd0KMXCvTQrr30JeWkk/
	 8vN8ID8Fb8bLd13h0o6UUVcv3nhmZJ8PbZpfdkKgDGAKUdJJoIpXZnQgPKTr+ioZrO9nG
	 9uslLedYT6gX/z5YFuQrJjZjD2KltBoPp+jtX86WaiRVpbC5O/Huv94ctuB5Z2oLD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280422;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=hGlaYzw+shYeBVv7YF+UseNrEEYGqB5adTNhGNtKdWM=;
	b=JTtX83i/CiXej9vKt7DIHgH52pfeRG+kLvP0+2SdacHx+ae2lF9oqrPD7Z4yL1h000aS
	 3a1+Zc+nze3T5UKgR/iTdJf9OP4dOiC7W/8nU4RBduVJAaNPwFkF3aIAI1OR+1N9fLMSY
	 HaJfGidi5xqqdAfJx4ViCL60BJUIkPVMKoOEoq2b7hr3ch/NpdKnuH9S0FCf9Rodc/CDz
	 f0lRkLx7uddUl8yd3jLaaDW/OLHsZHybvaRUIqptWht7W9RS/orNih/5MD7tzWaLJRauM
	 U5Vriu5Vp4ZdfGHZcrUvFScBUGZYQK6kjfpZb6d7V/Ne47piq6HXrS9tq/nBnEWJibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FYFhM1zh;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817F606E610
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A817F606E610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FYFhM1zh
X-UUID: b798e4aadcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hGlaYzw+shYeBVv7YF+UseNrEEYGqB5adTNhGNtKdWM=;
	b=FYFhM1zhRW66eGfF89D/9W2dOJOEwiYkN7NHLXbkOXceP2iRphB+4TEYjl9VChxf58e1E+isXfDPObXQ+8JAoTolrQ9+Iug1QKsqcMoXOeK9KVrZN6QLaXEA20wC1srlkXHGzVtymXusWwz9Jw9MPWwX/cPe9rJFdYTBnXN9Kj4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:37ef871c-8ae4-4c90-b3f3-590dd88b98f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1b941366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b798e4aadcb411f1b1788b6acf885367-20261110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1842265381; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 16/28] wifi: mt76: mt7925: share the primary OMAC across MLO links
Date: Tue, 10 Nov 2026 11:12:32 +0800
Message-ID: <20261110031244.369014-17-emery.hsin@mediatek.com>
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

Previously every MLD link used OMAC 0, which can clash with another
interface. Make each link reuse the primary link OMAC instead; only a
3-link hybrid MLD gives every link its own OMAC so each band's own MAC
is programmed independently.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f191b9e7d3f5..01d7526dbfa9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -379,7 +379,7 @@ static int mt7925_start(struct ieee80211_hw *hw)
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 				   struct ieee80211_bss_conf *link_conf,
 				   struct mt792x_link_sta *mlink,
-				   u8 link_idx)
+				   bool share_omac, u8 link_idx)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct ieee80211_vif *vif = link_conf->vif;
@@ -398,8 +398,11 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 		}
 	}
 
-	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
-			       0 : mconf->mt76.idx;
+	/* Links share the primary OMAC except in 3-link hybrid mode. */
+	if (share_omac)
+		mconf->mt76.omac_idx = mvif->bss_conf.mt76.idx;
+	else
+		mconf->mt76.omac_idx = mconf->mt76.idx;
 	mconf->mt76.band_idx = MT792x_BAND_AUTO;
 
 	mconf->absent = false;
@@ -482,7 +485,8 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
-	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink, 0);
+	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink,
+				      true, 0);
 	if (ret < 0)
 		goto out;
 
@@ -2516,7 +2520,9 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
 		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
 
-		err = mt7925_mac_link_bss_add(dev, link_conf, mlink, link_idx++);
+		err = mt7925_mac_link_bss_add(dev, link_conf, mlink,
+					      hweight16(new_links) != 3,
+					      link_idx++);
 		if (err < 0)
 			goto free;
 
-- 
2.45.2

