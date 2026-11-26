Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686907;
	b=Su83C7Etcd+aP9CNmR47dhytyS6mKc4Rw37dVRde/tz3Oh7Dh3DTtgW51xnf9HxwBAcq
	 p9bxKLJGWzaULvJYic2L7hElaY7BZM/MzkqlSHe/J5/y/Y80lZ94bEI2s+ofRyJC40h6S
	 KqK06OT2j+jAL/1CKKS+mzhkuVuTCv8yTvFDdZgz1sRXp7KhxzoGUm5qQg91+NLYF+fTy
	 lgI6xhHtuuEdMP10v6xigOhHw0TmkjV7v5uLyXx0JN/QH8nYg+Vn3EZJzTrv/pB7hxhb9
	 frU2sZy0JSQhby8oXztYU2pNaSPOluU3Ys/FRnbe6O0HcC7DZdDsa90fNelO1MAT1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686907;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=tLsHBiEJs1mfnx5vHsnyve5QhwAOBLyfU727fgxFyVg=;
	b=CvwlorN88J9wvsTy5vzEqDjRCv753Qc1Nri6WBCa5D+64hlwCS7Cu7Vffm/jPOE+lZP/
	 qGmNKpyIRY055E2spQB7HFrWnD/5C6YRcgchG2AKyegzSnqfrriaV1U8wtG48dUk2/Dn+
	 mJw4Mhr0kh5+Z4avuEsQobfaOFyA6dr2dxyb6u5ESNE3Yf/Nf1wmnNSSONGOQVmWGNoIS
	 iNEZJr1U20SlpyRbut0gy10/+Mz0QynjWSGnB11b5+9HRn1aOQVv0fPCvxr+qec13cYN2
	 JmOcve1OXrgCa+hLjmVVD1jhdqVwQ45rtuoj1A4OOsfXNJipyNnyw/V8MuIK6Xykazg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=k+U0hCe0;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9D606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA9D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=k+U0hCe0
X-UUID: 71594b06e97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tLsHBiEJs1mfnx5vHsnyve5QhwAOBLyfU727fgxFyVg=;
	b=k+U0hCe0kRqk4KAnL2+vk8oAxxxTTy4WR9FX8/cAIfyg1WO8cIPar7k+BB0NVoNW+2baL/raE/OlhC8NesdthfrG2t8bNOKllwC610Qu4/63McLmK9hOSEekMXH3r7iOcNRoscDmj6c/ekiH0PFsQj8kKPlRtcZsIJn1DQ0Ssh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5afc565d-c7e4-4b8e-87fe-ad923ab75fb2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:16d35f31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 71594b06e97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1687169463; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 79723200C7; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 2/5] wifi: mt76: refactor chip_cfg commands to be a generic API
Date: Thu, 26 Nov 2026 17:54:52 +0800
Message-ID: <20261126095455.3280998-3-anthony.liu@mediatek.com>
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

New chip_cfg command isn't chip specific but only available to mt7925.

1. Move chip specific mt7925_mcu_chip_config() from mt76/mt7925/mcu.c to
   mt76_connac_mcu_uni_chip_config() in mt76/mt76_connac_mcu.c.
2. mt792x_mcu_chip_config() uses mt76_connac_mcu_uni_chip_config() if is
   dealing with CONNAC3 FW, and uses mt76_connac_mcu_chip_config()
   otherwise.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 35 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  5 +++
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  6 ++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  1 -
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 13 +++++++
 7 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 0e3f23e52382..01434b1e01f5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2060,6 +2060,41 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev, const char *cmd)
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_chip_config);
 
+/* Unified-command form of chip_config (connac3, e.g. MT7925/MT7928): the same
+ * CE payload carried as a TLV inside MCU_UNI_CMD_CHIP_CONFIG.
+ */
+int mt76_connac_mcu_uni_chip_config(struct mt76_dev *dev, const char *cmd)
+{
+	ssize_t len;
+
+	struct {
+		u8 rsv[4];
+		__le16 tag;
+		__le16 len;
+		struct mt76_connac_config config;
+	} __packed req = {
+		.tag = cpu_to_le16(UNI_CHIP_CONFIG_CHIP_CFG),
+		.len = cpu_to_le16(sizeof(req) - sizeof(req.rsv)),
+		.config = {
+			.resp_type = 0,
+			.type = 0,
+		},
+	};
+
+	if (!cmd)
+		return -EINVAL;
+
+	len = strscpy(req.config.data, cmd);
+	if (len == -E2BIG)
+		return -E2BIG;
+
+	req.config.data_size = cpu_to_le16(len + 1);
+
+	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(CHIP_CONFIG),
+				 &req, sizeof(req), false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_chip_config);
+
 int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable)
 {
 	struct mt76_connac_config req = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index c5fb7e2adab1..0d2670b7b9fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1467,6 +1467,10 @@ enum UNI_ALL_STA_INFO_TAG {
 	UNI_ALL_STA_MAX_NUM
 };
 
+enum {
+	UNI_CHIP_CONFIG_CHIP_CFG = 2,
+};
+
 enum {
 	MT_NIC_CAP_TX_RESOURCE,
 	MT_NIC_CAP_TX_EFUSE_ADDR,
@@ -2123,6 +2127,7 @@ int mt76_connac_sta_state_dp(struct mt76_dev *dev,
 			     enum ieee80211_sta_state old_state,
 			     enum ieee80211_sta_state new_state);
 int mt76_connac_mcu_chip_config(struct mt76_dev *dev, const char *cmd);
+int mt76_connac_mcu_uni_chip_config(struct mt76_dev *dev, const char *cmd);
 int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index 0c40741273a9..cfe175dbc5f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -280,7 +280,7 @@ static int mt7925_chip_reset(void *data, u64 val)
 	default:
 		/* Collect the core dump before reset wifisys. */
 		mt792x_mutex_acquire(dev);
-		ret = mt7925_mcu_chip_config(dev, "assert");
+		ret = mt792x_mcu_chip_config(dev, "assert");
 		mt792x_mutex_release(dev);
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d89230fc9687..83f5f02395ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1280,7 +1280,7 @@ int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)
 
 	snprintf(cmd, sizeof(cmd), "KeepFullPwr %d", !enable);
 
-	return mt7925_mcu_chip_config(dev, cmd);
+	return mt792x_mcu_chip_config(dev, cmd);
 }
 EXPORT_SYMBOL_GPL(mt7925_mcu_set_deep_sleep);
 
@@ -1291,11 +1291,11 @@ int mt7925_mcu_set_thermal_protect(struct mt792x_dev *dev)
 
 	snprintf(cmd, sizeof(cmd), "ThermalProtGband %d %d %d %d %d %d %d %d %d %d",
 		 0, 100, 90, 80, 30, 1, 1, 115, 105, 5);
-	ret = mt7925_mcu_chip_config(dev, cmd);
+	ret = mt792x_mcu_chip_config(dev, cmd);
 
 	snprintf(cmd, sizeof(cmd), "ThermalProtAband %d %d %d %d %d %d %d %d %d %d",
 		 1, 100, 90, 80, 30, 1, 1, 115, 105, 5);
-	ret |= mt7925_mcu_chip_config(dev, cmd);
+	ret |= mt792x_mcu_chip_config(dev, cmd);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index fe40873e6107..7a9005db9c00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -115,7 +115,6 @@ enum {
 };
 
 enum {
-	UNI_CHIP_CONFIG_CHIP_CFG = 0x2,
 	UNI_CHIP_CONFIG_NIC_CAPA = 0x3,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 260abdc978f8..79f57736db35 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -669,6 +669,7 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_bss_conf *mconf,
 				struct mt792x_link_sta *mlink);
 void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
+int mt792x_mcu_chip_config(struct mt792x_dev *dev, const char *cmd);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 7dddce02d600..a59aedd498b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -1238,6 +1238,19 @@ void mt792x_config_mac_addr_list(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792x_config_mac_addr_list);
 
+/* Pick the chip_config command form the running chip's firmware understands:
+ * connac3 (mt7925/mt7928) needs the unified command, connac2 (mt7921/mt7922)
+ * uses the legacy CE command.
+ */
+int mt792x_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
+{
+	if (is_connac3(&dev->mt76))
+		return mt76_connac_mcu_uni_chip_config(&dev->mt76, cmd);
+
+	return mt76_connac_mcu_chip_config(&dev->mt76, cmd);
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_chip_config);
+
 MODULE_DESCRIPTION("MediaTek MT792x core driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
-- 
2.45.2

