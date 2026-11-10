Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280423;
	b=DGzWbZ9U5WZMkMsoTd1eEK2h58VTT+X///2MbgJqvIe+zolbJH/ZBdX0GTNoni4cx7YD
	 lL8tl2pu64m10kf+994UWe+iWU3Sj2y+LHcDUaqmdgJ+dEu8c1fWGq1mqrG8DKa/Kyd27
	 xLrjnrErOT6UnvDBpnOg8y/jQMulXT2WcHGErtgqeem+5cwprUsNST7hPKkrwM95BY+9Y
	 yA054Jya9qoXPtt08GkdC/wKvEFkQZKUC//UKywBtyOQWvvSRgYXToz6avXxeXpmmjMJ+
	 TUeERsPuU5YsKfhQBpgReBwksgOEXr02ov888qhFSTqG/4tIIRJcPydNUOsbiWn8HOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280423;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=fBKIrdD+OpqyCxmfrfOlNhxV8mT45GVvZRpEYJesGvY=;
	b=O4+tdoxXJaVFJYU34NQkVGxLDoqCjtlqXHunAH21MPby+iLRSGy7irODLTPYCwNeK7e4
	 dDJexp1ynOopZ1GfnA+0fZM7U7fBPpobBesc8yvbvcRRFzKlzMIxLSiP/+i8BL1AuV7ea
	 mqk8t+jx7iV8iYSaM7WNFk6taTVihBtdkyK/tcyFp0udRPCFVmX01ekotDNGJD5M2WzVd
	 iPwD+PPqm8U9Cm8tR3af84QD3EdmoSVhK8of788CnvIoaJS8o281BUch5Cuokz6nTBeXU
	 9NX5QqLVOGJ+0oqVvEzPlxUmUmyZOrRO/jnW0MRWS6Q07uVQvU89yO74icoYZwJz/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GjcVipl4;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB4606E62E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AB4606E62E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=GjcVipl4
X-UUID: b79c6ea4dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fBKIrdD+OpqyCxmfrfOlNhxV8mT45GVvZRpEYJesGvY=;
	b=GjcVipl4NFvJNCySAR2KXwErdaA7jJ2/eRY/+XTe3uP1Rh3kVzsOTA65KR8SNuTfdgbwLyIklwKRiDvDxbyhI1hBE/hRI8CrogCE9Ki/85WAZG4YlZ3izlFMVkBUwK8dptDlzI9Yhla2QYSDypA7W1Hhu+3hdC+IFezAOudAOeE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b830b1a3-eecf-40af-94ff-a52925caca5c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:481ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b79c6ea4dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1101612799; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
Subject: [PATCH 21/28] wifi: mt76: mt7925: only refresh the SEC tag when setting the first key
Date: Tue, 10 Nov 2026 11:12:37 +0800
Message-ID: <20261110031244.369014-22-emery.hsin@mediatek.com>
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

When the first key is installed the cipher is latched and the firmware
only needs the updated SEC tag, not a full BSS_INFO re-send. Use
mt7925_mcu_add_bss_sec() so a key install no longer reprograms the BSS.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a93df77da269..0bff5863e01e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -761,14 +761,12 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
 				  &mvif->sta;
 	struct ieee80211_bss_conf *link_conf;
-	struct ieee80211_link_sta *link_sta;
 	int idx = key->keyidx, err = 0;
 	struct mt792x_bss_conf *mconf;
 	struct mt76_wcid *wcid;
 	u8 *wcid_keyidx;
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
-	link_sta = sta ? mt792x_sta_to_link_sta(vif, sta, link_id) : NULL;
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
@@ -799,8 +797,8 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
 		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
-					link_sta, true);
+		/* only refresh the SEC (cipher) tag, not the whole BSS_INFO */
+		mt7925_mcu_add_bss_sec(phy, link_conf);
 	}
 
 	if (cmd == SET_KEY)
-- 
2.45.2

