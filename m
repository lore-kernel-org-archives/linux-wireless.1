Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686906;
	b=WkAA4pi7kEynCGz10kUaGrN3FlQOSzgjf90FW8cj8og6MaZTNC8F3kbo4UYjiqwDQvfb
	 WHm7Gc6jvw+HZzVY5Fio4j2OYWvgHqRHx0X1fs9jj5Niv+u+c1VnjeMgeY0BU+8p+zzqI
	 hI2HkqDllPK91Vf0HcIgxjM8T4KZGfAdgERlJVT/MbQoPuvMQHkvIDwOF+GVkT39mvrHb
	 DoN/J7I8dtoK1vxlDyrcdU4gUyC17VvipX2rJBhh/CiLX6xPzcR+2pG4P5GUtJN18Wm4p
	 cQ147TKEFz1nYQka11jJK44Fmt5Z5/rv5gT+sfz+d8GK1q/AtYwyjI8QRGMdU6fk6mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686906;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=V51RBRaWra6jXb2uG6oS5X8Je/8egoYVGH5/RGp6LvA=;
	b=HU8njnUFsV8SBRimNLNq6Mchp07/Hf2tySir/1NgClSwM1zV2DyheL7QTH0FSrotZUsW
	 qHnVgTwzefUBD3wAKQ+yqFDzWX9UPZOKXmbCrcWVmcl1DrnOOqmf3cH+D21VWrYXcnYvD
	 vH3i7E+e/1m2JlBDJmuHifXFhosq7E46W/CcIbTRwBUUOIwsV/mfxt7q7bsgHV3gZcICI
	 yG8tz/JgpI/XdBc4lIZwFzV62FaajOp/xCeIriIN+Yw+Y8a7fV6skfl3DeXikSLD5XFqD
	 8IfFL2MbDPabXhC279C7bln53MbDoYXg0P+Q+BlGVXKzg7IOAkKh80OX/YS8QMTiv2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ea9POWt2;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90689606A323
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90689606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ea9POWt2
X-UUID: 7175b2dce97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=V51RBRaWra6jXb2uG6oS5X8Je/8egoYVGH5/RGp6LvA=;
	b=ea9POWt2gcEPnnALfCpup2Ss3VKBROV+dlW9x7hwAareD+pgxIbac4a2ZfmtmbuddHAiDMFF3KfaZ6D4Uq5kD937vMLHLtwSgxZ9IHJjA5BBZCRIt61/G8xISIUJOfBHpLCnrSVuXRn2gt1lMJyxHFSFnyRAuaCDsixnuveZ1zI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:997a3604-feb6-4c8e-8b5e-d162b9e5ea4d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:e8f6d066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7175b2dce97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1598527867; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 87AA7200CD; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 4/5] wifi: mt76: add PCIe speed tuning for mt7922/mt7928
Date: Thu, 26 Nov 2026 17:54:54 +0800
Message-ID: <20261126095455.3280998-5-anthony.liu@mediatek.com>
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

Some hardware platforms use ACPI MTFG table denoting the existence of
noise that impacts Wi-Fi performance.

This patch reads the ACPI SAR info and notifies FW to detect current
status and to adjust PCIe bus to mitigate the noise.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  5 ++++
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |  6 ++++
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  2 ++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  6 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  4 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 28 +++++++++++++++++++
 6 files changed, 51 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index a87ebcff547b..8059405f2d5c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -102,6 +102,11 @@ static int __mt7921_init_hardware(struct mt792x_dev *dev)
 		goto out;
 
 	ret = mt7921_mac_init(dev);
+	if (ret)
+		goto out;
+
+	if (is_mt7922(&dev->mt76))
+		ret = mt792x_mcu_set_dyn_pcie_gen(dev);
 out:
 	return ret;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index d5c33a0d409c..6d8e221eb83f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -118,6 +118,12 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 	if (err)
 		goto out;
 
+	if (is_mt7922(&dev->mt76)) {
+		err = mt792x_mcu_set_dyn_pcie_gen(dev);
+		if (err)
+			goto out;
+	}
+
 	err = __mt7921_start(&dev->phy);
 out:
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index ad51f71babd7..b8d629f9bbe5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -126,6 +126,8 @@ static int __mt7925_init_hardware(struct mt792x_dev *dev)
 		}
 	}
 
+	if (is_mt7928(&dev->mt76))
+		ret = mt792x_mcu_set_dyn_pcie_gen(dev);
 out:
 	return ret;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 6189615d6604..85da7645c8e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -202,6 +202,12 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 			goto out;
 	}
 
+	if (is_mt7928(&dev->mt76)) {
+		err = mt792x_mcu_set_dyn_pcie_gen(dev);
+		if (err)
+			goto out;
+	}
+
 	err = __mt7925_start(&dev->phy);
 out:
 	clear_bit(MT76_RESET, &dev->mphy.state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 79f57736db35..cdaf07725598 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -670,6 +670,7 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_link_sta *mlink);
 void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 int mt792x_mcu_chip_config(struct mt792x_dev *dev, const char *cmd);
+int mt792x_mcu_set_dyn_pcie_gen(struct mt792x_dev *dev);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 {
@@ -768,6 +769,9 @@ int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792xe_mcu_fw_pmctrl(struct mt792x_dev *dev);
 
+#define MT792X_ACPI_FLAG_VALID  BIT(0) /* ACPI SAR is valid */
+#define MT792X_ACPI_FLAG_PCIe   BIT(3) /* Valid only when valid is set */
+
 #ifdef CONFIG_ACPI
 int mt792x_init_acpi_sar(struct mt792x_dev *dev);
 int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index a59aedd498b2..25408fcc8af3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -1251,6 +1251,34 @@ int mt792x_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
 }
 EXPORT_SYMBOL_GPL(mt792x_mcu_chip_config);
 
+int mt792x_mcu_set_dyn_pcie_gen(struct mt792x_dev *dev)
+{
+	u8 acpi_conf = mt792x_acpi_get_flags(&dev->phy);
+	char cmd[64];
+	int ret = 0;
+
+	if (!(acpi_conf & MT792X_ACPI_FLAG_VALID) ||
+	    !(acpi_conf & MT792X_ACPI_FLAG_PCIe))
+		return 0;
+
+	strscpy(cmd, "PcieGenSwitch 1 1200 0 -60");
+	ret = mt792x_mcu_chip_config(dev, cmd);
+	if (ret)
+		return ret;
+
+	strscpy(cmd, "PcieGenSwitchAGGen2 0");
+	ret = mt792x_mcu_chip_config(dev, cmd);
+	if (ret)
+		return ret;
+
+	if (!dev->mphy.cap.has_6ghz)
+		return 0;
+
+	strscpy(cmd, "PcieGenSwitch6G 1");
+	return mt792x_mcu_chip_config(dev, cmd);
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_set_dyn_pcie_gen);
+
 MODULE_DESCRIPTION("MediaTek MT792x core driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
-- 
2.45.2

