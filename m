Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280416;
	b=ooiEOVHICSaPuRMFSUR8uWrlUztff0drChaK0S2FpYhs8cVkeNs3cQYplZ1afq5cIM0q
	 gojEn08DmJCYNXw2L5+xCdOUaraSMD5RkERWP0hYr0X6oi5aa0ef6Q5viKhelOjLk/Cbn
	 5+splmsvHMILPYmqkCgb5xy37+WciMM5+OXdxxn1vHGooBq1BXvSy70ZwIfn3K95cBIbK
	 eHpBzgJCS0PBSLmsX5S0DrU15Ewm8vgMc5h3oLMfjmHzmsbzNsvw12k8dVob+8vikJ2dd
	 8/P9dInpxz2ajXrgAQKx/gDeyX6VF1B+sa41w05vOqVUUec2djZNcpq2rRnAmUdC9ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280416;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=xJLNveDFuKmirXFB8kr8Gd2Nn0iWfnqyvxfylWCjxj4=;
	b=L5xBO4B3cJAy6e1+0SlyHJCF9Nfcox9z3e96qTWcICm7VmgVok0LU7QKfB8ErbbYltlm
	 nXZqNgD/5FCg/qf8Gz1glPFTu5BDfy2tXkTsnpQkkHlsPhaebdiJK0qCl4IJWUF2f6KDl
	 BA+LUKF5CaKiKqNas+ehiHmnhTgVN5pLKD0j2aHbTp4l53LbQfLnhswY1FwVShOdoh25D
	 T/R297p6oJNHTkofl6NNkAyjF9bfv9ZWB+BKS2OOLZYOYjS2z2kTQHQLVGGu6Vqo/XCcU
	 k1i8ysCveAc8SKhxufuD8Gg2m2so2tEXE4/l3ZjlCnsuvwD3rWE+iMYQSAlFKEqXDzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="fVj/QGVF";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9160A380C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D9160A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fVj/QGVF
X-UUID: b312e00cdcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xJLNveDFuKmirXFB8kr8Gd2Nn0iWfnqyvxfylWCjxj4=;
	b=fVj/QGVFTPgW84NGvmzDmchK4PhcZW6VlUX1Q+pZHneW4I2Sd0v3bSG+9Z8BrZRAjrHgPVS9mCVgCDERZliYp50y5nzoq6Nm2B3KnW9a4hnHip9ZD/6IJjgA5/t1q2s5IuIea44aCvJC/ZR3XsHQ1ny6EpWxr+dYBt7VB6rUGQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2c8d0dcb-584e-4ddc-9419-8b37b90013ee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:8b2a0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b312e00cdcb411f1b1788b6acf885367-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1501101308; Tue, 10 Nov 2026 11:13:28 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
Subject: [PATCH 03/28] wifi: mt76: mt792x: turn chip_cap bits into an enum of bit positions
Date: Tue, 10 Nov 2026 11:12:19 +0800
Message-ID: <20261110031244.369014-4-emery.hsin@mediatek.com>
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

Replace the MT792x_CHIP_CAP_* shifted-mask #defines with an enum of bit
positions, tested with BIT(): chip_cap & BIT(MT792x_CHIP_CAP_x). New bits
can be added by index without hand-shifting masks.

No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  4 ++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  |  4 ++--
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  6 ++---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  4 ++--
 .../net/wireless/mediatek/mt76/mt7925/regd.c  |  4 ++--
 .../net/wireless/mediatek/mt76/mt7925/regd.h  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 22 ++++++++++++-------
 11 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 09574d4417cd..9caf6547062f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -260,7 +260,7 @@ int __mt7921_start(struct mt792x_phy *phy)
 			return err;
 	}
 
-	if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN) {
+	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)) {
 		mt7921_mcu_wf_rf_pin_ctrl(phy, WF_RF_PIN_INIT);
 		wiphy_rfkill_start_polling(mphy->hw->wiphy);
 	}
@@ -348,7 +348,7 @@ mt7921_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	}
 
 	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
-	if (phy->chip_cap & MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN)
+	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN))
 		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_CQM_RSSI;
 
 	INIT_WORK(&mvif->csa_work, mt7921_csa_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 2bcd5f085cd4..e23c6026442f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1417,7 +1417,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 	if (!clc)
 		return 0;
 
-	if (dev->phy.chip_cap & MT792x_CHIP_CAP_CLC_EVT_EN)
+	if (dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_CLC_EVT_EN))
 		req.cap |= CLC_CAP_EVT_EN;
 
 	np = mt76_find_power_limits_node(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 8d6c964bd6b6..6e94daec8a1b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -47,7 +47,7 @@ static void mt7921e_unregister_device(struct mt792x_dev *dev)
 	struct pci_dev *pdev = to_pci_dev(dev->mt76.dev);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
-	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+	if (dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN))
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
 	mt7921_unregister_device(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 699617d9e48f..f6069f60d192 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -392,7 +392,7 @@ int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2)
 
 	if (MT7921_REGD_SUPPORTED(phy))
 		return mt7921_regd_update(phy, alpha2);
-	else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
+	else if (phy->chip_cap & BIT(MT792x_CHIP_CAP_11D_EN))
 		return regulatory_hint(wiphy, alpha2);
 	else
 		return mt7921_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR);
@@ -409,7 +409,7 @@ int mt7921_regd_init(struct mt792x_phy *phy)
 		wiphy->regulatory_flags |= REGULATORY_WIPHY_SELF_MANAGED |
 					   REGULATORY_DISABLE_BEACON_HINTS;
 		return mt7921_regd_update(phy, "00");
-	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
+	} else if (phy->chip_cap & BIT(MT792x_CHIP_CAP_11D_EN))
 		wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE |
 					   REGULATORY_DISABLE_BEACON_HINTS;
 	else
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index d4223ba8fbd5..0e1ac58965e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -53,7 +53,7 @@ struct mt7921_regd_query_req {
 };
 
 #define MT7921_REGD_SUPPORTED(phy) \
-	(((phy)->chip_cap & MT792x_CHIP_CAP_REGD_EN) && \
+	(((phy)->chip_cap & BIT(MT792x_CHIP_CAP_FWREGDCH_EN)) && \
 	(phy)->clc[MT792x_CLC_REGD])
 
 int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0a6c931843ec..250746014b72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -282,7 +282,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 		},
 	};
 
-	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EN))
+	if (!(phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_EN)))
 		return 0;
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
@@ -357,7 +357,7 @@ int __mt7925_start(struct mt792x_phy *phy)
 	ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
 				     MT792x_WATCHDOG_TIME);
 
-	if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN))
 		wiphy_rfkill_start_polling(mphy->hw->wiphy);
 
 	return 0;
@@ -483,7 +483,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 		goto out;
 
 	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
-	if (phy->chip_cap & MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN)
+	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN))
 		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_CQM_RSSI;
 
 	INIT_WORK(&mvif->csa_work, mt7925_csa_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index de4c95006c4e..7436101514cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3065,7 +3065,7 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
 
-	if (phy->chip_cap & MT792x_CHIP_CAP_MLO_EML_EN) {
+	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_EML_EN)) {
 		mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
 				     IEEE80211_EML_CAP_EMLSR_SUPP);
 	} else {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..4e704d8eb89c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -45,7 +45,7 @@ static int mt7925e_init_reset(struct mt792x_dev *dev)
  */
 void mt7925e_axidma_cal_cache_init(struct mt792x_dev *dev)
 {
-	if (!(dev->phy.chip_cap & MT792x_CHIP_CAP_AXIDMA_EN))
+	if (!(dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_AXIDMA_EN)))
 		return;
 
 	if (dev->cached_cal.va) {
@@ -101,7 +101,7 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
-	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+	if (dev->phy.chip_cap & BIT(MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN))
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
 	cancel_work_sync(&dev->init_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index 57f1736b54a3..4dd01457ada2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -450,7 +450,7 @@ int mt7925_regd_change(struct mt792x_phy *phy, char *alpha2)
 
 	if (MT7925_REGD_SUPPORTED(phy)) {
 		return mt7925_regd_update(phy, alpha2);
-	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN) {
+	} else if (phy->chip_cap & BIT(MT792x_CHIP_CAP_11D_EN)) {
 		return regulatory_hint(wiphy, alpha2);
 	} else {
 		return mt7925_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR);
@@ -469,7 +469,7 @@ int mt7925_regd_init(struct mt792x_phy *phy)
 		wiphy->regulatory_flags |= REGULATORY_WIPHY_SELF_MANAGED |
 					   REGULATORY_DISABLE_BEACON_HINTS;
 		return mt7925_regd_update(phy, "00");
-	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN) {
+	} else if (phy->chip_cap & BIT(MT792x_CHIP_CAP_11D_EN)) {
 		wiphy->regulatory_flags |= REGULATORY_COUNTRY_IE_IGNORE |
 					   REGULATORY_DISABLE_BEACON_HINTS;
 	} else {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
index 65ef2b140f51..4b08fd891311 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
@@ -56,7 +56,7 @@ struct mt7925_regd_query_req {
 };
 
 #define MT7925_REGD_SUPPORTED(phy) \
-	(((phy)->chip_cap & MT792x_CHIP_CAP_REGD_EN) && \
+	(((phy)->chip_cap & BIT(MT792x_CHIP_CAP_FWREGDCH_EN)) && \
 	(phy)->clc[MT792x_CLC_REGD])
 
 int mt7925_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4753ec20fe0c..d54ade9c18dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -26,14 +26,20 @@
 #define MT792x_FW_CAP_NAN	BIT(5)
 #define MT792x_FW_CAP_CNM	BIT(7)
 
-#define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
-#define MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN BIT(1)
-#define MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN BIT(3)
-#define MT792x_CHIP_CAP_11D_EN BIT(4)
-#define MT792x_CHIP_CAP_REGD_EN BIT(5)
-#define MT792x_CHIP_CAP_MLO_EN BIT(8)
-#define MT792x_CHIP_CAP_MLO_EML_EN BIT(9)
-#define MT792x_CHIP_CAP_AXIDMA_EN BIT(16)
+/* Chip capability bit positions reported by firmware.
+ * Use with BIT(): chip_cap & BIT(MT792x_CHIP_CAP_x).
+ */
+enum mt792x_chip_cap {
+	MT792x_CHIP_CAP_CLC_EVT_EN = 0,		/* FWREGD_EVENT_SUPPORT */
+	MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN = 1,
+	MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN = 3,
+	MT792x_CHIP_CAP_11D_EN = 4,		/* WF_DYNAMIC_11D_SUPPORT */
+	MT792x_CHIP_CAP_FWREGDCH_EN = 5,	/* WF_REGDCH_SUPPORT */
+	MT792x_CHIP_CAP_MLO_EN = 8,		/* MLO_MLSR_SUPPORT */
+	MT792x_CHIP_CAP_MLO_EML_EN = 9,		/* MLO_EMLSR_SUPPORT */
+	MT792x_CHIP_CAP_MLO_HYBRID_EN = 10,	/* MLO_HYBRID_SUPPORT */
+	MT792x_CHIP_CAP_AXIDMA_EN = 16,		/* WF_AXIDMA_SUPPORT */
+};
 
 /* NOTE: used to map mt76_rates. idx may change if firmware expands table */
 #define MT792x_BASIC_RATES_TBL	14
-- 
2.45.2

