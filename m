Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573165;
	b=TYPPRX4P1ILZ/777VvwEM2W3ZYyc8uPPKRz8YPhOlj2HAMnd/2NsRnYXh8i3B7Uknb8k
	 tcKvY27oYHCtg6ciYmlxdji+4ooEA5IXQCKGUoeu+ZEOlss+iWwwZ61TQ4okKDRp6tRNB
	 IW15ECUYKD9YkzlTZeBcQfeg2ZR4P27MFevZXAO4Jq2SfmWLQriKTbWexngJr/OaZjP5V
	 iwuYXqOSrtrG07iOIaMp3d+ymh3ESDhVUCBjENYzDiuSTGoXkCMSCmzrUPdr8ZXVUjLV1
	 MHidBwPuXhUFx0d8hdrs+/2KIMiXN6dqjUX0kHOCHvK8EqWOvS1GppS+5Fr2V9gh2XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573165;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=EeTJgnmVl/5NmRNmBFkRkouEOm3tCBUEV7L+v5mqIog=;
	b=IhHlLYOCEPWEW4nfTq8M6VjbIMuDji/1v4ukI0dlgDaGzHhVOGSG5a6TdFV/O0vOoTpB
	 0TstZ1NKCS8XdgamyOGqB3l1/35J8AU6J+cJ3hEwKjrZNOaauIN75gSRsOmVkOoLaZcrE
	 Q/DmKAjKDoL10OHoAEywKh3r5mVWD3JYqI2XL0w9hrZUXafcplDkxT7owJTJls7jwl+fw
	 9hbJzIfsjDUlN4h5UbFhjhpFSCrchG1n2KIrDtAiqIdzY9hcTxASJpWc9Ezh4uCOvdKb3
	 A/eh4M1C9Z5Z88bjYJ19dXGeOZPPvxDZVbzD3G3iEvdtkrD/jHM9K4/P0dnsysP8nIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LEhp1NMT;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D1606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LEhp1NMT
X-UUID: 9eeadd5ae87611f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EeTJgnmVl/5NmRNmBFkRkouEOm3tCBUEV7L+v5mqIog=;
	b=LEhp1NMTdzWZfHps1ai3VgFtoQDHSYgHl8RQr57I5O1hEEdl7DeCYjut38kl52oIkcUnC6yiByf0bc2pCtELhQq7YUDJOOKWxpno+sblXPpBUOa/MchiNKkMRlfKrrtHuSLUndQ3q5N6EUajn52ngNmDtE0WTGxrGdsyj9AHW1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9664553e-64d6-45dc-be6c-d6187cd8402f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:49355d03-83e5-4da0-9d8b-8e0c13c2f73d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9eeadd5ae87611f18dc8c9802ae25ab1-20261125
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 112789925; Wed, 25 Nov 2026 10:19:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 10:19:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 10:19:18 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH v3] wifi: mt76: mt7925: Add coredump callback in pci_driver
Date: Wed, 25 Nov 2026 10:19:17 +0800
Message-ID: <20261125021917.1436754-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
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

From: Jeff Hsu <Jeff.Hsu@mediatek.com>

Register coredump callback(mt7925_coredump) in pci_driver,
it can let platform can trigger core dump to collect the
log and recover back after coredump complete without debugfs

Some platform not have debugfs

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
v2: Fix build error
v3: Just rebased for resubmit the patch
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5514a5284af4..f463229f6ce8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1261,6 +1261,7 @@ int mt7925_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(CHIP_CONFIG),
 				 &req, sizeof(req), false);
 }
+EXPORT_SYMBOL_GPL(mt7925_mcu_chip_config);
 
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index a7877c408736..e0349fa9b033 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -973,6 +973,17 @@ static int mt7925_pci_restore(struct device *device)
 	return _mt7925_pci_resume(device, true);
 }
 
+static void mt7925_coredump(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct mt76_dev *mdev = pci_get_drvdata(pdev);
+	struct mt792x_dev *dev_792x = container_of(mdev, struct mt792x_dev, mt76);
+
+	mt792x_mutex_acquire(dev_792x);
+	mt7925_mcu_chip_config(dev_792x, "assert");
+	mt792x_mutex_release(dev_792x);
+}
+
 static const struct dev_pm_ops mt7925_pm_ops = {
 	.suspend = pm_sleep_ptr(mt7925_pci_suspend),
 	.resume  = pm_sleep_ptr(mt7925_pci_resume),
@@ -989,6 +1000,7 @@ static struct pci_driver mt7925_pci_driver = {
 	.remove		= mt7925_pci_remove,
 	.shutdown       = mt7925_pci_shutdown,
 	.driver.pm	= pm_sleep_ptr(&mt7925_pm_ops),
+	.driver.coredump = mt7925_coredump,
 };
 
 module_pci_driver(mt7925_pci_driver);
-- 
2.45.2

