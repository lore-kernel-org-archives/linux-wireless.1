Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280415;
	b=xC34MOFP+VyfPt2kLYczHHvBWR73+3HC/qFOfg9ztUZYVi2PLtdg5AIDwU2i/3gZkMWy
	 pzowE9KlMB5cyokq28gwWNpHhKGjBsixxNBr+/WQ+Ke2Ei1w3VQ/0O0+jHP2s/1R+ydyP
	 fRLhDKFGzKTNJHNfSIiNoHV0VcA0ELXbfzOzs85kHCugpe0OnXRh51biackzYdhU3TVXy
	 EA4ycB/6l4OF9cQwOt8ujejRoSEln9A34Ah8PvaDCR6h71DBX3D2pm0u1BKwQbHtTlOpL
	 gnHUeAhTlvdiiUU6ScJxpAHwCjly2trJ2OfVzo49nsEZF4XMsUK51kKW8i4DX+a2Myg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280415;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=QyNsyvOq46f3GcxnNYdj2Ud9muh/DRw2/Ht6aro+AyM=;
	b=dkGgOQXY78KiEQM41RVUj6nomLx0fGhG6F1llgitAK8A3k9JxqGgLDEZw91OVyGOmgPh
	 if0pETWPMB+ypTR/jaObdiuNX+RNCQf3fsNLLIgFdqRgCI1iBgHxIIWFII0qM3/lHWSJz
	 wbRy7VSzntaTrQ8/JnWR4LGiHg8iZIC4XC4at04r+yh0+lHRjtjyiXkMCu+noTVosMVsU
	 nPNA2KwLKbs3pUZFh4VGGrnDe7oUgwL/gzlmiIn0TkHfTzWJn4ub7oN0fnCtbsQ6Nq1DL
	 81w9pKz0v0Z4JOf2S46NpUKHWso2awyU1GJjMOv5gb1FKRb3E1OlfwNN8Qoou9Tc6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TU819jvj;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA66E60A3807
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA66E60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TU819jvj
X-UUID: b383a576dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QyNsyvOq46f3GcxnNYdj2Ud9muh/DRw2/Ht6aro+AyM=;
	b=TU819jvjWZooZMS0nRjJojrzqxiZKlSx64BObdWxpG/E+NEhDTVzWckSD8sQBakjzMJBPMUiyEkGDo6tyCz279/Kn1YER1qnFyncmOWy2J5R0cOT2CswWtxV5pqd6On7FNrC6HqdgxdhAXMVI9YzAwxEqpCDPCZSSTCOkYxAiHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:83479989-2f24-4a47-b013-b3ff4c1f02f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5caf878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b383a576dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2138259554; Tue, 10 Nov 2026 11:13:28 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:27 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 04/28] wifi: mt76: mt792x: use named constants for the DBDC band
Date: Tue, 10 Nov 2026 11:12:20 +0800
Message-ID: <20261110031244.369014-5-emery.hsin@mediatek.com>
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

Replace the hard-coded 0xfe/0xff DBDC band values with a shared
mt792x_band_idx enum, covering the host band_idx and the mt7925/mt7921
ROC command band fields. No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 12 ++++++------
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 12 ++++++++++++
 5 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index e23c6026442f..628f221fcc15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -875,7 +875,7 @@ int mt7921_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.bw_from_ap = CMD_CBW_20MHZ,
 			.center_chan = center_ch,
 			.center_chan_from_ap = center_ch,
-			.dbdcband = 0xff, /* auto */
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
@@ -922,7 +922,7 @@ int mt7921_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
 			.bss_idx = vif->bss_conf.mt76.idx,
-			.dbdcband = 0xff, /* auto*/
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5672af18afe9..66d962bcba85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -800,7 +800,7 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
 
 	/* 0xff means BAND_AUTO to the firmware, and TGID cannot encode it */
-	if (band_idx && band_idx != 0xff)
+	if (band_idx && band_idx != MT792x_BAND_AUTO)
 		val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
 
 	txwi[1] = cpu_to_le32(val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 250746014b72..4d593291a23a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -399,7 +399,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
 			       0 : mconf->mt76.idx;
-	mconf->mt76.band_idx = 0xff;
+	mconf->mt76.band_idx = MT792x_BAND_AUTO;
 
 	mconf->absent = false;
 
@@ -2075,7 +2075,7 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		if (!err)
 			roc_taken = true;
 		else if (!is_mt7927(&dev->mt76))
-			mconf->mt76.band_idx = 0xff;
+			mconf->mt76.band_idx = MT792x_BAND_AUTO;
 	}
 
 	err = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7436101514cd..c8dab3cbb06b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1592,10 +1592,10 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 		req.roc[i].center_chan2 = 0;
 		req.roc[i].center_chan2_from_ap = 0;
 
-		/* STR : 0xfe indicates BAND_ALL with enabling DBDC
-		 * EMLSR : 0xff indicates (BAND_AUTO) without DBDC
-		 */
-		req.roc[i].dbdcband = type == MT7925_ROC_REQ_JOIN ? 0xfe : 0xff;
+		/* STR enables DBDC on all bands; otherwise let firmware pick */
+		req.roc[i].dbdcband = type == MT7925_ROC_REQ_JOIN ?
+				      MT792x_BAND_ALL :
+				      MT792x_BAND_AUTO;
 
 		if (chan->hw_value < center_ch)
 			req.roc[i].sco = 1; /* SCA */
@@ -1666,7 +1666,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			.maxinterval = cpu_to_le32(duration),
 			.bss_idx = mconf->mt76.idx,
 			.control_channel = chan->hw_value,
-			.dbdcband = 0xff, /* auto */
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 	struct cfg80211_chan_def chandef;
@@ -1735,7 +1735,7 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
 			.bss_idx = mconf->mt76.idx,
-			.dbdcband = 0xff, /* auto*/
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index d54ade9c18dc..8a366356e560 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -26,6 +26,18 @@
 #define MT792x_FW_CAP_NAN	BIT(5)
 #define MT792x_FW_CAP_CNM	BIT(7)
 
+/* DBDC band index; 0xff lets firmware pick the band */
+enum mt792x_band_idx {
+	MT792x_BAND_0 = 0,
+	MT792x_BAND_1 = 1,
+	MT792x_BAND_2 = 2,
+	MT792x_BAND_3 = 3,
+	MT792x_BAND_LIT = 3,
+	MT792x_BAND_NUM,
+	MT792x_BAND_ALL  = 0xfe,
+	MT792x_BAND_AUTO = 0xff,
+};
+
 /* Chip capability bit positions reported by firmware.
  * Use with BIT(): chip_cap & BIT(MT792x_CHIP_CAP_x).
  */
-- 
2.45.2

