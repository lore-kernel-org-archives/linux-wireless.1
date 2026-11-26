Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686913;
	b=SCJFzFwyp8YGC9qKGJ+DfFXdVzEfGRsyMFl0VUpOHPh08D0Wqx1UrRi5E4OARWm9vM/b
	 0yioT6wANAdyQ/MjWXVzTBCi0v5rPYyKvy8eItSdG7xEt+QbxwadxV/6DVZ9bh5LCq7ze
	 NliH1eWIiEIiLLKKZ/eYKk8OIyh3/TXtGfh74JeiPzpx5BzufUjpoIb2rnkeJnBEFyNnw
	 04bmDi3jr0bnK320MOhr9dUCYANPHVKZRmu81iqblJca4bdU3o/LxZtRcTFX0JKqyyHhB
	 Qolb4cDIO18h9qdQl8F+xE6YZX6iPGRPG05kn46oAXwk0Bp5o2JLgcGZo866oZjTSSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686913;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=+BtjuLsO9Q3q7NzgTmSsCYrbaMijoPDOMSTQX2oiKqU=;
	b=tgoA37FnPNZU0M+B3bxiNx7f2P/mkUepuGrdCVegA/Q7+3OuVWvXDsnDUCVQSEGxZhHa
	 Inu9knsqHc8VZ6lLJtFGW5xcgkPKa+lD+pzsB51m7mrBmT6zzgYTU6RDG+huQRQMMFvSJ
	 Njfsymsd2MbTyXdcgwLEcuT6CZdMHkkZW+bZ5ETEifc1rGWGjE6SJx8Mf3LZKzx/UpaO3
	 OFUGRYz95/VyPQzlr3zqqKdogGSl6FYPjv6O0HyH8lBT4oiUQC8q+GssvFqSbUyUTEziM
	 6Pu5ZEWCtXJyiH0chfxUhq7AFYihAc0LkRXCEF+5zVF3KavoFOWzxlGt7Yg6s9EP70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=YwUrCkF1;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA43606A327
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA43606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=YwUrCkF1
X-UUID: 715bad9ce97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+BtjuLsO9Q3q7NzgTmSsCYrbaMijoPDOMSTQX2oiKqU=;
	b=YwUrCkF1ExFh//GyhimXFcMpr8hm0/gH9a8ZmrIAk4it76GvbGjcR0S0wOTz+mcVG/Dra30n0VSe1eYMdG9rATl21rO5c8UMpzaRhmvSllQh/fp4IRrbyv57yWFrdqPeeOscQkmtQT7NnoXOa4jZ2FoyTQhXsqZO+pGi723bu+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:de30b9aa-5a77-412c-92c5-01e8c2b874f1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:47f7d066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 715bad9ce97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 986039436; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 90D41200D0; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 5/5] wifi: mt76: mt7922/mt7928: send Tx/Rx statistics to FW for link tuning
Date: Thu, 26 Nov 2026 17:54:55 +0800
Message-ID: <20261126095455.3280998-6-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126095455.3280998-1-anthony.liu@mediatek.com>
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
 <20261126095455.3280998-1-anthony.liu@mediatek.com>
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

Update Tx/Rx statistics to FW for link speed tuning in FW.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  15 ++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  53 ++++++
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  14 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   6 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  12 ++
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   3 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  13 ++
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   5 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  15 ++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |   3 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  55 ++++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 169 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt792x_debugfs.c   |  32 ++++
 15 files changed, 402 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 01434b1e01f5..56f287c8ee54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -272,6 +272,21 @@ int mt76_connac_mcu_set_rts_thresh(struct mt76_dev *dev, u32 val, u8 band)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_rts_thresh);
 
+int mt76_connac_mcu_uni_set_perf_ind(struct mt76_dev *dev, u32 valid_period,
+				     const u64 *tx_bytes, const u64 *rx_bytes)
+{
+	struct mt76_connac_uni_perf_ind req = {
+		.tag = cpu_to_le16(UNI_PERF_IND_PARM),
+		.len = cpu_to_le16(sizeof(req) - sizeof(req.rsv)),
+	};
+
+	mt76_connac_perf_ind_v1_fill(&req.perf, valid_period, tx_bytes, rx_bytes);
+
+	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(PERF_IND), &req,
+				 sizeof(req), false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_set_perf_ind);
+
 void mt76_connac_mcu_beacon_loss_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 0d2670b7b9fb..605030f70a02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1354,6 +1354,7 @@ enum {
 	MCU_UNI_CMD_PP = 0x38,
 	MCU_UNI_CMD_FIXED_RATE_TABLE = 0x40,
 	MCU_UNI_CMD_RSSI_MONITOR = 0x41,
+	MCU_UNI_CMD_PERF_IND = 0x44,
 	MCU_UNI_CMD_TESTMODE_CTRL = 0x46,
 	MCU_UNI_CMD_NAN	= 0x56,
 	MCU_UNI_CMD_RRO = 0x57,
@@ -1404,6 +1405,7 @@ enum {
 	MCU_CE_CMD_SET_RATE_TX_POWER = 0x5d,
 	MCU_CE_CMD_SCHED_SCAN_ENABLE = 0x61,
 	MCU_CE_CMD_SCHED_SCAN_REQ = 0x62,
+	MCU_CE_CMD_PERF_IND = 0x7e,
 	MCU_CE_CMD_GET_NIC_CAPAB = 0x8a,
 	MCU_CE_CMD_RSSI_MONITOR = 0xa1,
 	MCU_CE_CMD_SET_MU_EDCA_PARMS = 0xb0,
@@ -1471,6 +1473,10 @@ enum {
 	UNI_CHIP_CONFIG_CHIP_CFG = 2,
 };
 
+enum {
+	UNI_PERF_IND_PARM = 0,
+};
+
 enum {
 	MT_NIC_CAP_TX_RESOURCE,
 	MT_NIC_CAP_TX_EFUSE_ADDR,
@@ -1883,6 +1889,51 @@ struct mt76_connac_config {
 	u8 data[320];
 } __packed;
 
+struct mt76_connac_perf_ind {
+	/* DW0 - common info*/
+	u8 cmd_ver;
+	u8 mask; /* per-field valid bitmap */
+	__le16 cmd_len;
+
+	/* DW1 - valid period of the stats */
+	__le32 valid_period;
+
+	/* DW2~15 - stats */
+	__le32 cur_tx_bytes[4];
+	__le32 cur_rx_bytes[4];
+	__le16 cur_rx_rate[4];
+	u8 cur_rx_rcpi0[4];
+	u8 cur_rx_rcpi1[4];
+	u8 cur_rx_nss[4];
+	u8 cur_rx_nss2[4];
+
+	/* DW16-77 padding */
+	__le32 pad[62];
+} __packed;
+
+struct mt76_connac_uni_perf_ind {
+	u8 rsv[4];
+	__le16 tag;
+	__le16 len;
+	struct mt76_connac_perf_ind perf;
+} __packed;
+
+static inline void
+mt76_connac_perf_ind_v1_fill(struct mt76_connac_perf_ind *perf, u32 valid_period,
+			     const u64 *tx_bytes, const u64 *rx_bytes)
+{
+	int i;
+
+	perf->mask = BIT(0) | BIT(1);
+	perf->cmd_len = cpu_to_le16(sizeof(*perf));
+	perf->valid_period = cpu_to_le32(valid_period);
+
+	for (i = 0; i < ARRAY_SIZE(perf->cur_tx_bytes); i++) {
+		perf->cur_tx_bytes[i] = cpu_to_le32(tx_bytes[i]);
+		perf->cur_rx_bytes[i] = cpu_to_le32(rx_bytes[i]);
+	}
+}
+
 struct mt76_connac_mcu_uni_event {
 	u8 cid;
 	u8 pad[3];
@@ -2083,6 +2134,8 @@ int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
 void mt76_connac_mcu_beacon_loss_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
 int mt76_connac_mcu_set_rts_thresh(struct mt76_dev *dev, u32 val, u8 band);
+int mt76_connac_mcu_uni_set_perf_ind(struct mt76_dev *dev, u32 valid_period,
+				     const u64 *tx_bytes, const u64 *rx_bytes);
 int mt76_connac_mcu_set_mac_enable(struct mt76_dev *dev, int band, bool enable,
 				   bool hdr_trans);
 int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 14c70ffa9665..5fa3c51a53bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -262,6 +262,11 @@ mt7921s_sched_quota_read(struct seq_file *s, void *data)
 	return 0;
 }
 
+DEFINE_DEBUGFS_ATTRIBUTE(fops_perf_ind_trig, NULL, mt792x_perf_ind_trig, "%lld\n");
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_perf_ind_enable, mt792x_perf_ind_enable_get,
+			 mt792x_perf_ind_enable_set, "%lld\n");
+
 int mt7921_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -291,5 +296,14 @@ int mt7921_init_debugfs(struct mt792x_dev *dev)
 	if (mt76_is_sdio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "sched-quota", dir,
 					    mt7921s_sched_quota_read);
+
+	/* PERF_IND is supported on MT7922 PCIe version */
+	if (mt76_is_mmio(&dev->mt76) && is_mt7922(&dev->mt76)) {
+		debugfs_create_file("perf_ind_enable", 0600, dir, dev,
+		                    &fops_perf_ind_enable);
+		debugfs_create_file("perf_ind_trig", 0200, dir, dev,
+		                    &fops_perf_ind_trig);
+	}
+
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index a2d577872566..30188fda893e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -613,6 +613,12 @@ void mt7921_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 	case PKT_TYPE_NORMAL_MCU:
 	case PKT_TYPE_NORMAL:
 		if (!mt7921_mac_fill_rx(dev, skb)) {
+			struct mt76_rx_status *status =
+				(struct mt76_rx_status *)skb->cb;
+
+			if (is_mt7922(&dev->mt76))
+				mt792x_perf_account_rx(dev, status->wcid, skb->len);
+
 			mt76_rx(&dev->mt76, q, skb);
 			return;
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 9b13e9c25cf3..02f1feef0140 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -728,6 +728,10 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		mt7921_mcu_sta_update(dev, NULL, vif, true,
 				      MT76_STA_INFO_STATE_ASSOC);
 		mt7921_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
+
+		/* PERF_IND is supported on MT7922 only within this family */
+		if (is_mt7922(&dev->mt76))
+			mt792x_perf_ind_update(dev, vif, MT792x_PERF_IND_TIME);
 	}
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 8d6c964bd6b6..87e42686358a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -68,6 +68,8 @@ static void mt7921e_unregister_device(struct mt792x_dev *dev)
 		netif_napi_del(&dev->mt76.napi[i]);
 	}
 	skb_queue_purge(&dev->phy.scan_event_list);
+	if (is_mt7922(&dev->mt76))
+		cancel_delayed_work_sync(&dev->perf.work);
 	cancel_delayed_work_sync(&dev->coredump.work);
 	skb_queue_purge(&dev->coredump.msg_list);
 
@@ -455,6 +457,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_irq;
 
+	/* the periodic performance indication is started on association */
+	if (is_mt7922(&dev->mt76))
+		mt792x_perf_ind_init(dev);
+
 	if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
 		device_init_wakeup(dev->mt76.dev, true);
 
@@ -494,6 +500,8 @@ static int mt7921_pci_suspend(struct device *device)
 
 	pm->suspended = true;
 	flush_work(&dev->reset_work);
+	if (is_mt7922(&dev->mt76))
+		cancel_delayed_work_sync(&dev->perf.work);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
@@ -617,6 +625,10 @@ static int mt7921_pci_resume(struct device *device)
 
 	mt7921_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
 	err = mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
+
+	/* re-arm the periodic performance indication if any bss is connected */
+	if (is_mt7922(&dev->mt76))
+		mt792x_perf_ind_resched(dev);
 failed:
 	pm->suspended = false;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index 6d8e221eb83f..b3f36a630292 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -21,6 +21,9 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (unlikely(tx_info->skb->len <= ETH_HLEN))
 		return -EINVAL;
 
+	if (is_mt7922(&dev->mt76))
+		mt792x_perf_account_tx(dev, info->control.vif, tx_info->skb->len);
+
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index cfe175dbc5f3..a92b930f6686 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -290,6 +290,11 @@ static int mt7925_chip_reset(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7925_chip_reset, "%lld\n");
 
+DEFINE_DEBUGFS_ATTRIBUTE(fops_perf_ind_trig, NULL, mt792x_perf_ind_trig, "%lld\n");
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_perf_ind_enable, mt792x_perf_ind_enable_get,
+			 mt792x_perf_ind_enable_set, "%lld\n");
+
 int mt7925_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -317,5 +322,13 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 				    mt792x_pm_stats);
 	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
 
+	/* PERF_IND is supported on MT7928 PCIe version */
+	if (mt76_is_mmio(&dev->mt76) && is_mt7928(&dev->mt76)) {
+		debugfs_create_file("perf_ind_enable", 0600, dir, dev,
+		                    &fops_perf_ind_enable);
+		debugfs_create_file("perf_ind_trig", 0200, dir, dev,
+		                    &fops_perf_ind_trig);
+	}
+
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 692616df110f..4b233a234ab0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1533,12 +1533,15 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			struct mt76_rx_status *status =
 				(struct mt76_rx_status *)skb->cb;
 
-			if (!(status->flag & RX_FLAG_8023) &&
+				if (!(status->flag & RX_FLAG_8023) &&
 			    mt7925_p2p_rx_drop_chan_mismatch(dev, skb)) {
 				dev_kfree_skb(skb);
 				return;
 			}
 
+			if (is_mt7928(&dev->mt76))
+				mt792x_perf_account_rx(dev, status->wcid, skb->len);
+
 			mt76_rx(&dev->mt76, q, skb);
 			return;
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b7348e6f0290..1a2e47603d24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2470,6 +2470,10 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 
 		if (ieee80211_vif_is_mld(vif))
 			mvif->mlo_pm_state = MT792x_MLO_LINK_ASSOC;
+
+		/* PERF_IND is supported on MT7928 only within this family */
+		if (is_mt7928(&dev->mt76))
+			mt792x_perf_ind_update(dev, vif, MT792x_PERF_IND_TIME);
 	}
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index e49fddc9c81f..a2fefe2642ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -117,6 +117,9 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	cancel_work_sync(&dev->init_work);
 	dev->hw_init_done = false;
 
+	if (is_mt7928(&dev->mt76))
+		cancel_delayed_work_sync(&dev->perf.work);
+
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 	cancel_work_sync(&dev->reset_work);
@@ -779,6 +782,12 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_dma;
 
+	/* PERF_IND is only supported on MT7928 in this family; MT7925 opts out.
+	 * The periodic indication itself is started on association.
+	 */
+	if (is_mt7928(&dev->mt76))
+		mt792x_perf_ind_init(dev);
+
 	return 0;
 
 err_free_dma:
@@ -815,6 +824,8 @@ static int mt7925_pci_suspend(struct device *device)
 	pm->suspended = true;
 	dev->hif_resumed = false;
 	flush_work(&dev->reset_work);
+	if (is_mt7928(&dev->mt76))
+		cancel_delayed_work_sync(&dev->perf.work);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
@@ -950,6 +961,10 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 		mt7925_mcu_set_deep_sleep(dev, false);
 
 	mt7925_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
+
+	/* re-arm the periodic performance indication if any bss is connected */
+	if (is_mt7928(&dev->mt76))
+		mt792x_perf_ind_resched(dev);
 failed:
 	pm->suspended = false;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 85da7645c8e2..31667c80ab74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -24,6 +24,9 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (unlikely(tx_info->skb->len <= ETH_HLEN))
 		return -EINVAL;
 
+	if (is_mt7928(&dev->mt76))
+		mt792x_perf_account_tx(dev, info->control.vif, tx_info->skb->len);
+
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index cdaf07725598..860f4c9dc326 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -45,6 +45,9 @@
 
 #define MT792x_WATCHDOG_TIME	(HZ / 4)
 
+#define MT792x_PERF_UPDATE_PERIOD	1000	/* ms */
+#define MT792x_PERF_IND_TIME		(HZ)	/* 1 second */
+
 #define MT792x_DRV_OWN_RETRY_COUNT	10
 #define MT792x_MCU_INIT_RETRY_COUNT	10
 #define MT792x_WFSYS_INIT_RETRY_COUNT	2
@@ -175,6 +178,12 @@ struct mt792x_bss_conf {
 	/* For group-addressed frames that are sent outside a TXQ */
 	struct mt792x_link_sta bmc;
 	bool bmc_valid;
+
+	/* Tx/Rx statistics */
+	atomic64_t perf_tx_bytes;
+	atomic64_t perf_rx_bytes;
+	u64 perf_last_tx_bytes;
+	u64 perf_last_rx_bytes;
 };
 
 struct mt792x_nan_conf {
@@ -433,6 +442,11 @@ struct mt792x_dev {
 		u32 size;
 		bool reused;
 	} cached_cal;
+
+	struct {
+		struct delayed_work work;
+		bool enabled;
+	} perf;
 };
 
 static inline bool
@@ -483,6 +497,39 @@ mt792x_sta_to_link(struct mt792x_sta *msta, u8 link_id)
 		lockdep_is_held(&msta->vif->phy->dev->mt76.mutex));
 }
 
+/* accumulate TX bytes for the interface transmitting @len bytes */
+static inline void
+mt792x_perf_account_tx(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+		       u32 len)
+{
+	struct mt792x_vif *mvif;
+
+	if (!vif)
+		return;
+
+	mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	atomic64_add(len, &mvif->bss_conf.perf_tx_bytes);
+}
+
+/* accumulate RX bytes for the interface owning @wcid */
+static inline void
+mt792x_perf_account_rx(struct mt792x_dev *dev, struct mt76_wcid *wcid, u32 len)
+{
+	struct mt792x_link_sta *link;
+
+	// allow only real station link through
+	if (!wcid || !wcid->sta)
+		return;
+
+	link = container_of(wcid, struct mt792x_link_sta, wcid);
+
+	if (!link->sta || !link->sta->vif)
+		return;
+
+	atomic64_add(len, &link->sta->vif->bss_conf.perf_rx_bytes);
+}
+
 static inline struct mt792x_link_sta *
 mt792x_sta_to_link_rcu(struct mt792x_sta *msta, u8 link_id)
 {
@@ -671,6 +718,14 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 int mt792x_mcu_chip_config(struct mt792x_dev *dev, const char *cmd);
 int mt792x_mcu_set_dyn_pcie_gen(struct mt792x_dev *dev);
+void mt792x_perf_ind_update(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+			    unsigned long delay);
+void mt792x_perf_ind_init(struct mt792x_dev *dev);
+void mt792x_perf_ind_resched(struct mt792x_dev *dev);
+int mt792x_perf_ind_trigger(struct mt792x_dev *dev, u64 val);
+int mt792x_perf_ind_trig(void *data, u64 val);
+int mt792x_perf_ind_enable_get(void *data, u64 *val);
+int mt792x_perf_ind_enable_set(void *data, u64 val);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 25408fcc8af3..46536abf7287 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -367,6 +367,175 @@ int mt792x_get_stats(struct ieee80211_hw *hw,
 }
 EXPORT_SYMBOL_GPL(mt792x_get_stats);
 
+static int mt792x_mcu_set_perf_ind(struct mt792x_dev *dev, u32 valid_period,
+			    const u64 *tx_bytes, const u64 *rx_bytes)
+{
+	struct mt76_connac_perf_ind req = {};
+
+	mt76_connac_perf_ind_v1_fill(&req, valid_period, tx_bytes, rx_bytes);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(PERF_IND),
+				 &req, sizeof(req), false);
+}
+
+static int mt792x_mcu_perf_ind(struct mt792x_dev *dev, u32 valid_period,
+			       const u64 *tx_bytes, const u64 *rx_bytes)
+{
+	if (is_connac3(&dev->mt76))
+		return mt76_connac_mcu_uni_set_perf_ind(&dev->mt76, valid_period,
+							tx_bytes, rx_bytes);
+
+	return mt792x_mcu_set_perf_ind(dev, valid_period, tx_bytes, rx_bytes);
+}
+
+static bool mt792x_perf_vif_active(struct ieee80211_vif *vif)
+{
+	return vif->cfg.assoc;
+}
+
+struct mt792x_perf_iter_data {
+	u64 tx_delta[MT792x_MAX_INTERFACES];
+	u64 rx_delta[MT792x_MAX_INTERFACES];
+	bool connected;
+};
+
+static void mt792x_perf_collect_iter(void *priv, u8 *mac,
+				     struct ieee80211_vif *vif)
+{
+	struct mt792x_perf_iter_data *data = priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = &mvif->bss_conf;
+	u8 idx = mconf->mt76.idx;
+	u64 tx, rx, last_tx, last_rx;
+
+	if (!mt792x_perf_vif_active(vif) || idx >= MT792x_MAX_INTERFACES)
+		return;
+
+	data->connected = true;
+
+	tx = atomic64_read(&mconf->perf_tx_bytes);
+	if (!tx) {
+		data->tx_delta[idx] = 0;
+	} else {
+		last_tx = mconf->perf_last_tx_bytes;
+		data->tx_delta[idx] = tx <= last_tx ? 0 : tx - last_tx;
+		mconf->perf_last_tx_bytes = tx;
+	}
+
+	rx = atomic64_read(&mconf->perf_rx_bytes);
+	if (!rx) {
+		data->rx_delta[idx] = 0;
+	} else {
+		last_rx = mconf->perf_last_rx_bytes;
+		data->rx_delta[idx] = rx <= last_rx ? 0 : rx - last_rx;
+		mconf->perf_last_rx_bytes = rx;
+	}
+}
+
+static void mt792x_perf_active_iter(void *priv, u8 *mac,
+				    struct ieee80211_vif *vif)
+{
+	bool *active = priv;
+
+	if (mt792x_perf_vif_active(vif))
+		*active = true;
+}
+
+static bool mt792x_perf_any_connected(struct mt792x_dev *dev)
+{
+	bool active = false;
+
+	ieee80211_iterate_active_interfaces(dev->mphy.hw,
+					    IEEE80211_IFACE_ITER_NORMAL,
+					    mt792x_perf_active_iter,
+					    &active);
+	return active;
+}
+
+void mt792x_perf_ind_update(struct mt792x_dev *dev, struct ieee80211_vif *vif,
+			    unsigned long delay)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	/* Reset snapshots so a future re-association starts clean */
+	if (!mt792x_perf_vif_active(vif)) {
+		atomic64_set(&mvif->bss_conf.perf_tx_bytes, 0);
+		atomic64_set(&mvif->bss_conf.perf_rx_bytes, 0);
+		mvif->bss_conf.perf_last_tx_bytes = 0;
+		mvif->bss_conf.perf_last_rx_bytes = 0;
+	}
+
+	if (!mt76_is_mmio(&dev->mt76))
+		return;
+
+	if (mt792x_perf_any_connected(dev))
+		queue_delayed_work(dev->mt76.wq, &dev->perf.work, delay);
+	else
+		cancel_delayed_work(&dev->perf.work);
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_update);
+
+static void mt792x_perf_work(struct work_struct *work)
+{
+	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
+					      perf.work.work);
+	struct mt792x_perf_iter_data data = {};
+
+	/* not enabled */
+	if (!dev->perf.enabled)
+		return;
+
+	/* skip while asleep */
+	if (!mt76_connac_pm_ref(&dev->mphy, &dev->pm))
+		goto reschedule;
+
+	ieee80211_iterate_active_interfaces(dev->mphy.hw,
+					    IEEE80211_IFACE_ITER_NORMAL,
+					    mt792x_perf_collect_iter, &data);
+
+	if (data.connected)
+		mt792x_mcu_perf_ind(dev, MT792x_PERF_UPDATE_PERIOD,
+				    data.tx_delta, data.rx_delta);
+
+	mt76_connac_pm_unref(&dev->mphy, &dev->pm);
+
+reschedule:
+	if (mt792x_perf_any_connected(dev))
+		queue_delayed_work(dev->mt76.wq, &dev->perf.work,
+				   MT792x_PERF_IND_TIME);
+}
+
+void mt792x_perf_ind_init(struct mt792x_dev *dev)
+{
+	INIT_DELAYED_WORK(&dev->perf.work, mt792x_perf_work);
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_init);
+
+void mt792x_perf_ind_resched(struct mt792x_dev *dev)
+{
+	if (mt792x_perf_any_connected(dev))
+		queue_delayed_work(dev->mt76.wq, &dev->perf.work,
+				   MT792x_PERF_IND_TIME);
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_resched);
+
+int mt792x_perf_ind_trigger(struct mt792x_dev *dev, u64 val)
+{
+	u64 bytes[MT792x_MAX_INTERFACES];
+	int i;
+
+	for (i = 0; i < MT792x_MAX_INTERFACES; i++)
+		bytes[i] = val;
+
+	/* wake the chip and serialize against other MCU commands */
+	mt792x_mutex_acquire(dev);
+	mt792x_mcu_perf_ind(dev, MT792x_PERF_UPDATE_PERIOD, bytes, bytes);
+	mt792x_mutex_release(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_trigger);
+
 u64 mt792x_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c b/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
index 65c37e0cef8f..98683cdc7205 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
@@ -166,3 +166,35 @@ int mt792x_pm_idle_timeout_get(void *data, u64 *val)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mt792x_pm_idle_timeout_get);
+
+/* send one perf_ind carrying the written value in every tx/rx byte field */
+int mt792x_perf_ind_trig(void *data, u64 val)
+{
+	struct mt76_dev *mdev = data;
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+	return mt792x_perf_ind_trigger(dev, val);
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_trig);
+
+int mt792x_perf_ind_enable_get(void *data, u64 *val)
+{
+	struct mt76_dev *mdev = data;
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+	*val = dev->perf.enabled;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_enable_get);
+
+int mt792x_perf_ind_enable_set(void *data, u64 val)
+{
+	struct mt76_dev *mdev = data;
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+	dev->perf.enabled = !!val;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_perf_ind_enable_set);
-- 
2.45.2

