Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573153;
	b=hlKWFGPhCSxCXtLaI6gchEG2y8P9t3xaRiuqhk4N3KLpJUOLm6KdtdrCa2JJHIEnQ5mk
	 5AkGxGrZpCeat/AmjcNCDGln06mT5nZJE9A5Bg3Uoo/VUAgcAZfoKhOEr9+XSicpe1pnk
	 nlxkJtMwiLjTEA0f89RAPpWpHKTQAz/X4gV0M+pBzJPceOm4zG+Y+fAXeEIuOdLBqysH7
	 QEJN0auSsI+lxrXXYyXhwdg+UkpY0FrwHEdjWBsRR7ZTMEratdrJknbOx1xntvGG5KAhU
	 iJRvup4XJC7SItyaGp3skVhot1osIX92UmPa85Rp39osVjIkXKo4UZbTfg+QblSWG5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573153;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=3IlIU13809y66WbLEiEHwoURO/EV4ytauQymOAkc89A=;
	b=Hl2t8mfsYZS0g3tbIQLvIkEcX9daHZIgvrcelXT3HkZ+CpmLzxyMajx3vMBgB7ha7Yw8
	 9JPBvvedpfiQvYkb2K969OGwywquiusW+xgpqUwcJ4Qq8t9Fv4aGJnQmYXw5dSSVvjbZW
	 9KE30h+B+MOKuF67ZKgY8+5K2622y8F+Mg7jb+BdigAMIKiY/FINo0CjQxrCyRHcL70Ha
	 cxr6iAvTSYJB7eYHE3xyBCm1tyFxOWQqKcm9WvRsI0712GtYoCNC6FN9cvzjz6qjpBsrl
	 dSTyrRmGgwkyOc4Ge6W2jMX70HBima9XJ5M3TmfrwTRcOgKJYKGG04MG0NW/88Yn3eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ri8F9rM+;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA4606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72EA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ri8F9rM+
X-UUID: 978103bee87611f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3IlIU13809y66WbLEiEHwoURO/EV4ytauQymOAkc89A=;
	b=ri8F9rM+UhrntCDq4rdkB7LrOKFeYAaM7xXdwC9/JhKfDk5Q1KCJdJqfHfq2UDvSy99+mb6uem7xgc0NdCO8V/eV5RSFCKAS66PbuYACohv5wtBcz5pKWsPXuOmFiivC2Cy2XonZVbrXltkw5fbAkpzN43W04loD3jlomPH56Y4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:76bd7299-ddfa-4785-ac8f-f5ff1e2dd57c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:e0345d03-83e5-4da0-9d8b-8e0c13c2f73d,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 978103bee87611f1b1788b6acf885367-20261125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 848772937; Wed, 25 Nov 2026 10:19:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 10:19:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 10:19:06 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>,
	Jeff Hsu <Jeff.Hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: Add flag to control if need DMA re-init
Date: Wed, 25 Nov 2026 10:19:04 +0800
Message-ID: <20261125021904.1436635-1-jb.tsai@mediatek.com>
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

Add flag(skip_wpdma_reinit) to control if need do DMA re-init

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 8d6c964bd6b6..84d658d3156a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -419,6 +419,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
 		dev->aspm_supported = true;
 
+	/* MT7921 needs wpdma reinit */
+	dev->skip_wpdma_reinit = false;
+
 	ret = mt792xe_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
-- 
2.45.2

