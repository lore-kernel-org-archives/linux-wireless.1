Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280416;
	b=ikSKlHsGJhx48UI83e9NVAlKeza296OG2sb50MgE2Wd3FgKz3EBxkNU2EBOAlj7j+CP1
	 JJpXJB+PqtGUWgOX1lrkHblilnxOlkC/A8uxw/cKWIdzITBGLV+ToO2pi8Xk1ZdSAp0+I
	 XcQuIMq3XaNmYH8CRSuNQ2ZzhWjbbZwfS6PnxDxwg3Eb/y9H4ljHDXnzZzt6T/ZMFDMVz
	 0nXIbscrDfNv0WKCWO9TXIkvP2Xx00xeDqA1AKrN6OgvV52KRrfx4/D6ihTOkxR+4u1xd
	 bLhwcZLpnBLERbSss27oGc79IBAK+iT9Uz9TbW2GqZdw4cKpSGUoKcLYuCJ25kOM7EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280416;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=AipeNk4KNk5XnDTmG7+2cR04bENv/ta70b3jNySa2Zw=;
	b=l1eF0Y654PtbmmpWE5QHHqrf/piptiFNg/4/ps5OG4s6tg2oFktSLSSx0ANS5m0zpGGc
	 XpVxJ9Lx+VxyuHT+IlvCKP7eYjlwJaa0iTufLfoyre3LvRgofUdNvhMwHrUCjRmWYhheu
	 7Kk60W0WRAsk0hel56azO5x8hSPa6Rp6Se6dejRGPXpTerJT0f0pKVfa6SPIEH7d/U/aZ
	 3koBRxpNuZQFc1Q985jRUdTGLiHCQroW6v5dEOZ65b10tTQGB74XZvXnzAp8ihKpjH0xt
	 IUHmNrkidI2gzqpbyjrQtuioPZ1Gr830gwYOBRh5Qf+CI8l2uJlHPcC0LWGxXGID9ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ry5oJCYS;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D860A2621
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9D860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ry5oJCYS
X-UUID: b3fc0d54dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AipeNk4KNk5XnDTmG7+2cR04bENv/ta70b3jNySa2Zw=;
	b=Ry5oJCYShhwzZUZum51Typ/G7K3qLKop26yoWZbXIQKb5nXemetzbOt2AYd0Z2x5X9N/UHjqvTVQfj1K2cMV8vjGJ5VEjpXARUSDj4EyuFQqwgKCm7qohWjYoB3rprU7n4WoQl/7fgp/rvsn1Pm+XofrCJeTA70qX7mxBBX/YGg=;
X-CID-CACHE: Type:Local,Time:202611101113+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:08d44ad9-9f9d-4ad3-b81f-c94243a24add,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:ca931366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3fc0d54dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750027524; Tue, 10 Nov 2026 11:13:29 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:28 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 05/28] wifi: mt76: use named constants for the HT secondary channel offset
Date: Tue, 10 Nov 2026 11:12:21 +0800
Message-ID: <20261110031244.369014-6-emery.hsin@mediatek.com>
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

Replace the hard-coded 0/1/3 sco values with the standard
IEEE80211_HT_PARAM_CHA_SEC_NONE/ABOVE/BELOW constants. No functional
change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  4 ++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  8 ++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 19 ++++++++++---------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 3ef55781a0da..cd9c4569e4b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1601,9 +1601,9 @@ int mt76_connac_mcu_uni_set_chctx(struct mt76_phy *phy, struct mt76_vif_link *mv
 	}
 
 	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 1; /* SCA */
+		rlm_req.rlm.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
-		rlm_req.rlm.sco = 3; /* SCB */
+		rlm_req.rlm.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE), &rlm_req,
 				 sizeof(rlm_req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 628f221fcc15..3954ca96c1f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -880,9 +880,9 @@ int mt7921_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 	};
 
 	if (chan->hw_value < center_ch)
-		req.roc.sco = 1; /* SCA */
+		req.roc.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (chan->hw_value > center_ch)
-		req.roc.sco = 3; /* SCB */
+		req.roc.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	switch (chan->band) {
 	case NL80211_BAND_6GHZ:
@@ -1293,9 +1293,9 @@ int mt7921_mcu_config_sniffer(struct mt792x_vif *vif,
 		req.tlv.center_ch2 = ieee80211_frequency_to_channel(freq2);
 
 	if (req.tlv.control_ch < req.tlv.center_ch)
-		req.tlv.sco = 1; /* SCA */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req.tlv.control_ch > req.tlv.center_ch)
-		req.tlv.sco = 3; /* SCB */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(vif->phy->mt76->dev, MCU_UNI_CMD(SNIFFER),
 				 &req, sizeof(req), true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index c8dab3cbb06b..b16a3c3122a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1598,9 +1598,9 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 				      MT792x_BAND_AUTO;
 
 		if (chan->hw_value < center_ch)
-			req.roc[i].sco = 1; /* SCA */
+			req.roc[i].sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 		else if (chan->hw_value > center_ch)
-			req.roc[i].sco = 3; /* SCB */
+			req.roc[i].sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 		req.roc[i].band = ch_band[chan->band];
 	}
@@ -1689,12 +1689,13 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		req.roc.center_chan2_from_ap = center_ch2;
 	}
 
-	/* 1 = SCA, 3 = SCB */
 	if (nl80211_chan_width_to_mhz(chandef.width) >= 40) {
 		pri40_freq = cfg80211_chandef_primary(&chandef,
 						      NL80211_CHAN_WIDTH_40, NULL);
 		if (pri40_freq > 0)
-			req.roc.sco = chan->center_freq < pri40_freq ? 1 : 3;
+			req.roc.sco = chan->center_freq < pri40_freq ?
+				       IEEE80211_HT_PARAM_CHA_SEC_ABOVE :
+				       IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 	}
 
 	switch (chan->band) {
@@ -2546,9 +2547,9 @@ int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 		req.tlv.center_ch2 = ieee80211_frequency_to_channel(freq2);
 
 	if (req.tlv.control_ch < req.tlv.center_ch)
-		req.tlv.sco = 1; /* SCA */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req.tlv.control_ch > req.tlv.center_ch)
-		req.tlv.sco = 3; /* SCB */
+		req.tlv.sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 
 	return mt76_mcu_send_msg(mphy->dev, MCU_UNI_CMD(SNIFFER),
 				 &req, sizeof(req), true);
@@ -2671,7 +2672,7 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	req->ht_op_info = 4; /* set HT 40M allowed */
 	req->rx_streams = hweight8(phy->antenna_mask);
 	req->center_chan2 = 0;
-	req->sco = 0;
+	req->sco = IEEE80211_HT_PARAM_CHA_SEC_NONE;
 	req->band = 1;
 
 	switch (band) {
@@ -2721,9 +2722,9 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	}
 
 	if (req->control_channel < req->center_chan)
-		req->sco = 1; /* SCA */
+		req->sco = IEEE80211_HT_PARAM_CHA_SEC_ABOVE;
 	else if (req->control_channel > req->center_chan)
-		req->sco = 3; /* SCB */
+		req->sco = IEEE80211_HT_PARAM_CHA_SEC_BELOW;
 }
 
 static struct sk_buff *
-- 
2.45.2

