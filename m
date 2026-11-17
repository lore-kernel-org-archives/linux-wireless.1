Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938510;
	b=LR+nUMHjGf5RPY3ZD5XTZvY4W3xx8kYvAvl+BAw7GpEpEHDRYi5I556x5VEj4kHLk/RI
	 5LayWqKA+4fv5P5+Hx9+vEI0+GI6RzsDiwLd9cRv4rAGZNhmaaIay7QjASuVVAPVMPkkB
	 govTqUoRLejalHTfjx1wTI3VmPNiwq2PJQEDeo3kUsALV7eUKKBNEW1LSDKKAOLn3ws7W
	 ZrEcTAS9tva+A7maoSP77bKxOh4wcHaybKrSaEX6t+GFET/1iiDSkBnUgYEC6pIFvD6Tg
	 i95TEw0NaBRYs5gazu+BAiYM9olXVhkCj5HYlCqaD574RKkq7PO35Fw9hWvGKV1xX5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938510;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFTjRMOJk9FPfwTCE7YDFyVbTncizm0sfvonxzSSKOs=;
	b=Vn9CQ/yxBrM8pLMaKa6aSr48uxdS+vvWMZtnbprKeOVRf4WMckSHYZ9/n0icT4NehA34
	 EB0gVInb5pdpAByeHoLDUurgzJKZ/Le56c6MvdPy5ZmokjHhWGD2OkZPI4NRgIuOfg4W6
	 H66Fq3Pdy+QgrVZlePWdcPeP0vdemRCvGckS6FUgcV6KXc713OxuY1Y3m6+j4ZAwa/2eT
	 Pjx1yA3FceACcdA4P+xCZ+XPqIQ9EP4ifzExW1EEsHhKYRFuGKHKIhYDUWKUMQfSZRxwd
	 aoLKjbr5772Q3CzuHcmHJkxJPoeVWgZjdAgb9eVoi0LhHr9FzmkYmai4pOWGpxF/9Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Mmf1FC2j;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B1606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Mmf1FC2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qFTjRMOJk9FPfwTCE7YDFyVbTncizm0sfvonxzSSKOs=; b=Mmf1FC2jaAnG6eSFUF1XgzA76C
	asPLVFGZva7BWXu5E8c9XybNEkIoe1QeDILavIm7/MG+XVFRT64BZXQ/DBduZc4U72XhZm2Sc/DnQ
	mZNDTODSwh0i1f7qGh+oSvB9w3cUzFNEWwj8Mg2M5T0khurODc869vvnVqSVQ2AQlqQw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV1-004eiZ-0Z
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/19] wifi: mt76: mt7996: stop WED before the DMA reset of a full reset
Date: Tue, 17 Nov 2026 19:01:22 +0100
Message-ID: <20261117180134.2940930-7-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

Unlike the L1 SER path, mt7996_mac_restart() resets the WFSYS while the
attached WEDs still access it over PCIe. Their reads during the reset
get no completion, and MT7988 reports uncorrectable PCIe completion
timeouts on both root ports.

Stop both WEDs at the start of the restart, and disable the WED
interrupt agent and wait for it to go idle before the WFSYS reset. The
other agents stay enabled, since TX through WED stops after the restart
otherwise.

Fixes: 83eafc9251d6 ("wifi: mt76: mt7996: add wed tx support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 25 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 19 +++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  5 ++++
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 3d9353811a02..4450d35e9439 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 MediaTek Inc.
  */
 
+#include <linux/iopoll.h>
 #include "mt7996.h"
 #include "../dma.h"
 #include "mac.h"
@@ -957,6 +958,25 @@ int mt7996_dma_init(struct mt7996_dev *dev)
 	return 0;
 }
 
+static void
+mt7996_wed_int_agent_disable(struct mt7996_dev *dev,
+			     struct mtk_wed_device *wed)
+{
+	u32 val;
+
+	if (!mtk_wed_device_active(wed))
+		return;
+
+	val = mtk_wed_device_reg_read(wed, MT_WED_CTRL);
+	mtk_wed_device_reg_write(wed, MT_WED_CTRL,
+				 val & ~MT_WED_CTRL_WPDMA_INT_AGENT_EN);
+
+	if (read_poll_timeout(mtk_wed_device_reg_read, val,
+			      !(val & MT_WED_CTRL_WPDMA_INT_AGENT_BUSY),
+			      100, 20000, false, wed, MT_WED_CTRL))
+		dev_warn(dev->mt76.dev, "WED interrupt agent still busy\n");
+}
+
 void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 {
 	struct mt76_phy *phy2 = dev->mt76.phys[MT_BAND1];
@@ -996,8 +1016,11 @@ void mt7996_dma_reset(struct mt7996_dev *dev, bool force)
 		mt7996_rro_msdu_page_map_free(dev);
 
 	/* reset wfsys */
-	if (force)
+	if (force) {
+		mt7996_wed_int_agent_disable(dev, &dev->mt76.mmio.wed_hif2);
+		mt7996_wed_int_agent_disable(dev, &dev->mt76.mmio.wed);
 		mt7996_wfsys_reset(dev);
+	}
 
 	if (dev->hif2 && mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
 		mtk_wed_device_dma_reset(&dev->mt76.mmio.wed_hif2);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 03670293a78f..2e1d98bf823a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2291,6 +2291,16 @@ void mt7996_tx_token_put(struct mt7996_dev *dev)
 	}
 }
 
+static void
+mt7996_wed_stop(struct mt7996_dev *dev)
+{
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
+		mtk_wed_device_stop(&dev->mt76.mmio.wed_hif2);
+
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
+		mtk_wed_device_stop(&dev->mt76.mmio.wed);
+}
+
 static int
 mt7996_mac_restart(struct mt7996_dev *dev)
 {
@@ -2298,6 +2308,8 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 	struct mt7996_phy *phy;
 	int i, ret;
 
+	mt7996_wed_stop(dev);
+
 	if (dev->hif2) {
 		mt76_wr(dev, MT_INT1_MASK_CSR, 0x0);
 		mt76_wr(dev, MT_INT1_SOURCE_CSR, ~0);
@@ -2573,12 +2585,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	dev_info(dev->mt76.dev,"\n%s L1 SER recovery start.",
 		 wiphy_name(hw->wiphy));
 
-	if (mtk_wed_device_active(&dev->mt76.mmio.wed_hif2))
-		mtk_wed_device_stop(&dev->mt76.mmio.wed_hif2);
-
-	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
-		mtk_wed_device_stop(&dev->mt76.mmio.wed);
-
+	mt7996_wed_stop(dev);
 	mt7996_npu_hw_stop(dev);
 	ieee80211_stop_queues(mt76_hw(dev));
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index 6df6e4c3d45d..e82a281a773a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -782,6 +782,11 @@ enum offs_rev {
 #define MT_WF_SUBSYS_RST_BYPASS_WFDMA2_SLP_PROT	BIT(16)
 #define MT_WF_SUBSYS_RST_WHOLE_PATH_RST_REVERT_CYCLE	GENMASK(15, 8)
 
+/* WED registers, offsets for mtk_wed_device_reg_read() */
+#define MT_WED_CTRL				0x00c
+#define MT_WED_CTRL_WPDMA_INT_AGENT_EN		BIT(0)
+#define MT_WED_CTRL_WPDMA_INT_AGENT_BUSY	BIT(1)
+
 /* PCIE MAC */
 #define MT_PCIE_MAC_BASE			0x74030000
 #define MT_PCIE_MAC(ofs)			(MT_PCIE_MAC_BASE + (ofs))
-- 
2.47.3

