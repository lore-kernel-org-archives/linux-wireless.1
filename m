Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770713;
	b=Hrm96kTA7OxENri5mYSOmDrgIDShRnntpxLdXNTwAnGCFNiLz7TRyWpB6EAZpmrjvJLE
	 ast7hvMlUF6+4f7kOjTCF03sQZ76z0lFJUGIAXIfJGmUNUwFVsPpsete65LgiBpaJrquQ
	 EY7IuKe6Fki2nyixJYJ7QcCGtfqqKFQjY5XU8V1ZtmpFhciSVemjd+Mumb9fOKCwhB3bU
	 HGGvCYRpNbeUumHXO18I8Qh/+mvfKqs4+3XF62VRSWDmmy7qt/4DPoVauYp/gGbK7PmyH
	 x4XTYUs3qUlJHyx2IePN4z3LQY1AGKMn4Hdfa8W3xC74OBJGBwnMcmEcyxeOIsNRIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770713;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=WRcMC60qfGe7doi3i9bWyspPYCm7peysPYuREIXcydE=;
	b=3OBkV2oDE0c2A5EfMe4k5MtZEUazxVxckVZsLy2XJjGUeVhk0QUhRKZwarBThIZ3iAD5
	 KkVL1gszyOyjeGMVDjbnJKjhUpTUhuu/85rZJsKFqeNrSplLLTZ+LolaGDD0FfT9qE5p8
	 6l8Ql0oJJ7Z5RIzRGQyFwc6pWIzQPUmsujzpRlhA8llzjy5kfF/AwNPB/i8hDftGDJZ6y
	 Oe2Q+QqH0MsWazpRjDFVqKze3Eqh8xjUuiXEm936TbrtnY8qzGyS9ypW0+RlY1GyWzFe7
	 pqpfQBsT1OFmS7FsdSVBj80JNZBOiffOq+ideCO54B/he7HQika7wbsdQ/u/suK3rmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="Lm/Vp/qz";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1A606A33F
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E1A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Lm/Vp/qz
X-UUID: 91d5a582ea4211f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WRcMC60qfGe7doi3i9bWyspPYCm7peysPYuREIXcydE=;
	b=Lm/Vp/qzcCHPKGku+vII4AqTvwe02vypNNv6YzSqaJ6CHuvAgdmO69hLSLffiuNbRYjoq9UdOkNM4tKU5RwKEzZ3dDscjcUNbFfb3DutxU1LFeBG1VEDBR1+0aE5Jm5It1aOb74MEAYI02LjaIJbs9banMeD9AfB1WAIPkvw3Gc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cd7e2e07-047e-45dc-877c-d9c073d47211,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:fd03898b-b89a-4698-a5e2-7cf3a434e794,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91d5a582ea4211f1b9cf3d4034dccee2-20261127
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1457132843; Fri, 27 Nov 2026 17:11:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:11:44 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 17:11:44 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id A9459200C5; Fri, 27 Nov 2026 17:11:44 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v6 2/5] wifi: mt76: refactor chip_cfg commands to be a generic API
Date: Fri, 27 Nov 2026 17:11:39 +0800
Message-ID: <20261127091142.4119743-3-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261127091142.4119743-1-anthony.liu@mediatek.com>
References: <6c37a7e4-a2f1-46e4-88f1-0439be6eb928@nbd.name>
 <20261127091142.4119743-1-anthony.liu@mediatek.com>
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

