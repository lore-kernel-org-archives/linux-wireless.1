Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770712;
	b=fD+GEqnPWcfjvARGbWChv0Zxal0hCDHsq/uosNzAaGkaHjDlT0DJzJWdWTGdmc+k6x03
	 dXJwNBkgpNN7gNY9ogSUAnnwicHpUz44IlX1JghXvxprkGxgYgnAR7w+coaAsZCwoIRUD
	 4siHYwx/Ouhbfuxp7AhArJLJkVwm/bd9CYZICJz60Es1UQZ23Uv9vBOJRA8q4hTnRX1V2
	 ZjWFIwbdQrhHjomktjv3kTHfOT4npWT//ZisqK574HNRJvBv6mzTx1PsT+ArrXigSv4xm
	 wNY9W0WFWMkW9Qo1oDhcbhuHiq7W8Sx1JzfLA1DrZsOTENaoT4ntJegJlqcDxqVc3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770712;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=rjbX/u9rl9w1Dbf6U4Ax0tI6g79U4qZNVX6Ft8MT7nE=;
	b=3S3+09Y0Sb46yAx3B7dH2QDG4iBEj0M+0lau7rNEBNRS18U2qe+fe/UWLj0Sw0gtFYrB
	 u3GbczzRkP6NMbHfdw25MT8k2Wsmo9uQDrOuj/Qx0hkYAvKrhnaWa51x8reAiSOYUxi4m
	 W8Q99Yb5lQIslHhEN0pNPYyEKvknYvfdlpzMbisR90nJFriPIDMbOMyB5Wlx0Uwq+ZYw5
	 pDuHRIpOO5bBKeqcEgxBCDhl1kzlcJwcfSz0Chl2BaHpL4P/3XJrC0HlI7nm4GkI0JRw7
	 nCz17NAG/U9vN1La7gyScBZutTRKwhdgcmGkFyzB1p4K1mlgVnfTbZSU8fljueoUWBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oSRVfMUL;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDFA606A339
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDFA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oSRVfMUL
X-UUID: 917fa0b0ea4211f1a7aecdb2598be72c-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rjbX/u9rl9w1Dbf6U4Ax0tI6g79U4qZNVX6Ft8MT7nE=;
	b=oSRVfMULYCUicXfQ1Yhdwj5mgCdZ7sgIQBA9EF5nrwHyK6NklbFA+CS7pjXJz2b9CMzclnhsL1zZ5q8TPuySH6rOEGm2VU2JNIWXb+Ldmsy7NxRdCayqKMSz9az8EnF5zJwDv17xGXwsVlTC5BZiO5OUSi7/J027X6VAq8f6SRs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dd1287df-f28b-4ed2-a9c5-71d2592264b7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:5e3edd66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 917fa0b0ea4211f1a7aecdb2598be72c-20261127
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1058161691; Fri, 27 Nov 2026 17:11:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:11:45 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 17:11:45 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id D3AB7200C7; Fri, 27 Nov 2026 17:11:44 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v6 4/5] wifi: mt76: add PCIe speed tuning for mt7922/mt7928
Date: Fri, 27 Nov 2026 17:11:41 +0800
Message-ID: <20261127091142.4119743-5-anthony.liu@mediatek.com>
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

Some hardware platforms use ACPI MTFG table denoting the existence of
noise that impacts Wi-Fi performance.

This patch reads the ACPI SAR info and notifies FW to detect current
status and to adjust PCIe bus to mitigate the noise.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
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

