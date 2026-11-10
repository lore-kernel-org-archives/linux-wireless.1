Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280425;
	b=VPGqbYaZsi6TDoRqTPohB7+pWj4kmqmINtiVLM+SDCymQTDtvrTHNw0zx/5Yi4lLcIZq
	 XBQ0d5isy47StPKHF7/j1DlC5fsbHphSozIy3ahzqBKOkiKlTh3TZXlcJY5R9rDqHXgUM
	 t1MSfarhsuFIh1X5LhfNnr6CQpMhSAGQLkqPRCqPuOJuG1qk1J5mrJYC/VzH2rmFGX/ES
	 Jc9fmoRlcVuPfxCB725/EL8OJCl2LCmM1Xs4CMbqDpDrbICzsQVExJO2G/SLLD55e3/rA
	 Jf+0lf/uShrwAO4Vls/zPTYdoFlxYnqU54rJ69Q0yfumg5lNXc7X54447+eLNTkPpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280425;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=DulNqdfKE6sH1mnNs6HM457oup51LrFAFnJgAmD9E3Q=;
	b=ZybeBIrU4LmuIwaAZEU4MFWKZZ6m1yyGD4mJKW/V2NvBclGArwbz0ThDJIkzt2xysrG+
	 QclCtEguhMapToxMBP0ZaVtz22NgusIdvre7hH3NHbDH5rXzrHhSYe8IweBzQvZIVDtnV
	 OLGiEN190vi+WbcMwxjABTqr8PaJn9vtMqbO+sfwBeyA0nnli7Ua04wki5XVn/AnAaBxP
	 tC2bEM/woIhdaiJEB5Lr00tFqGXYwcKfRls4vVyYmm2WYOjoQfTem9VnlNk/7wfjvEWEw
	 geBQ7Nr2I7glw2iRjgFLmWFQ4uGDNrWaz0/YbdyeAzTD2sBP4iP84STmdTLrma/9X3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=tunFnw8a;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499F60A3827
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3499F60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=tunFnw8a
X-UUID: b817548edcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DulNqdfKE6sH1mnNs6HM457oup51LrFAFnJgAmD9E3Q=;
	b=tunFnw8afnsdZ5bmQRh4/2S93ZHn908rKmGVa0lJ5Fuemn7SYEI9Dd40OPvOVF5TZnTHkenJ7k24XO+5nZ0T/NK1qWBKGrWXj3i1TX5Qd3d/rab/Zgf2SXv60hSrScycbjTtY0elNMo8G/Sg7k+eZHg2OqwrtJ6Z5JCgb4OPwiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6376e78b-8605-4e8c-a9ab-3930422276f9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:f3af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b817548edcb411f1b1788b6acf885367-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1741994199; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:36 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 28/28] wifi: mt76: mt7925: add hm_alg_ctrl debugfs to override the MLO link plan
Date: Tue, 10 Nov 2026 11:12:44 +0800
Message-ID: <20261110031244.369014-29-emery.hsin@mediatek.com>
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

Add a debugfs knob to override the firmware hybrid-MLO link plan for
validation. Writing "<manual>-<obss>-<bt>-<plan>-<obss%>-<bt%>" to
/sys/kernel/debug/ieee80211/phyN/mt76/hm_alg_ctrl sends the UNI_CMD_HM
ALG_CTRL TLV to the firmware.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 41 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 30 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 16 ++++++++
 4 files changed, 88 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 5c27285542ab..233da1b0162d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1364,6 +1364,7 @@ enum {
 	MCU_UNI_CMD_ASSERT_DUMP = 0x6f,
 	MCU_UNI_CMD_EXT_EEPROM_CTRL = 0x74,
 	MCU_UNI_CMD_FACT_CAL = 0x7c,
+	MCU_UNI_CMD_HM = 0x7d,
 	MCU_UNI_CMD_RADIO_STATUS = 0x80,
 	MCU_UNI_CMD_MLD = 0x82,
 	MCU_UNI_CMD_PEER_MLD = 0x83,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..52e9bf437c8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -286,6 +286,46 @@ static int mt7925_chip_reset(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7925_chip_reset, "%lld\n");
 
+/* Hybrid-MLO link-plan control.
+ *
+ * Usage:
+ *   echo <ManualModeEn>-<ForceObss>-<ForceBT>-<ForcePlan>-<ObssTime%>-<BT%> \
+ *       > /sys/kernel/debug/ieee80211/phyX/mt76/hm_alg_ctrl
+ */
+static ssize_t
+mt7925_hm_alg_ctrl_set(struct file *file, const char __user *user_buf,
+		       size_t count, loff_t *ppos)
+{
+	struct mt792x_dev *dev = file->private_data;
+	struct mt7925_hm_alg_ctrl ctrl = {};
+	char buf[32];
+	int ret;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+	buf[count] = '\0';
+
+	if (sscanf(buf, "%hhu-%hhu-%hhu-%hhu-%hhu-%hhu",
+		   &ctrl.manual_mode_en, &ctrl.force_obss, &ctrl.force_bt,
+		   &ctrl.force_plan, &ctrl.obss_time_pct, &ctrl.bt_pct) != 6)
+		return -EINVAL;
+
+	mt792x_mutex_acquire(dev);
+	ret = mt7925_mcu_set_hm_alg_ctrl(dev, &ctrl);
+	mt792x_mutex_release(dev);
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations fops_hm_alg_ctrl = {
+	.write = mt7925_hm_alg_ctrl_set,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 int mt7925_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -312,6 +352,7 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
 				    mt792x_pm_stats);
 	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
+	debugfs_create_file("hm_alg_ctrl", 0200, dir, dev, &fops_hm_alg_ctrl);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 588328a01dc8..d02ab03fe7ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4606,3 +4606,33 @@ int mt7925_mcu_set_rssimonitor(struct mt792x_dev *dev, struct ieee80211_vif *vif
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(RSSI_MONITOR), &req,
 				 sizeof(req), false);
 }
+
+int mt7925_mcu_set_hm_alg_ctrl(struct mt792x_dev *dev,
+			       struct mt7925_hm_alg_ctrl *ctrl)
+{
+	struct {
+		u8 rsv[4];		/* struct UNI_CMD_HM fixed field */
+		__le16 tag;
+		__le16 len;
+		u8 manual_mode_en;
+		u8 force_obss;
+		u8 force_bt;
+		u8 force_plan;
+		u8 obss_time_pct;
+		u8 bt_pct;
+		u8 rsv2[6];
+	} __packed req = {
+		.tag = cpu_to_le16(UNI_CMD_HM_TAG_ALG_CTRL),
+		.len = cpu_to_le16(sizeof(req) -
+				   offsetof(typeof(req), tag)),
+		.manual_mode_en = ctrl->manual_mode_en,
+		.force_obss = ctrl->force_obss,
+		.force_bt = ctrl->force_bt,
+		.force_plan = ctrl->force_plan,
+		.obss_time_pct = ctrl->obss_time_pct,
+		.bt_pct = ctrl->bt_pct,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(HM), &req,
+				 sizeof(req), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index ae403c04e436..1f42a48e522d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -764,4 +764,20 @@ int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 int
 mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev,
 			 struct ieee80211_bss_conf *link_conf, bool enable);
+/* Hybrid-MLO algorithm control. Lets the host override the firmware's
+ * MLO link-plan decision for validation.
+ */
+#define UNI_CMD_HM_TAG_ALG_CTRL		0
+
+struct mt7925_hm_alg_ctrl {
+	u8 manual_mode_en;
+	u8 force_obss;
+	u8 force_bt;
+	u8 force_plan;
+	u8 obss_time_pct;
+	u8 bt_pct;
+};
+
+int mt7925_mcu_set_hm_alg_ctrl(struct mt792x_dev *dev,
+			       struct mt7925_hm_alg_ctrl *ctrl);
 #endif
-- 
2.45.2

