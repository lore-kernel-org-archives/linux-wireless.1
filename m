Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770714;
	b=nQAxks2n8wFMif0DaY6izV5vcD+y1mevj3veG6+rFdF56SfLDDCCfUAaGjIHXfIBsQlt
	 i37oM78sbbEwhyYNXNKS+CVXf86l6arqZ8SQDUOpDwe+48pcBnPCnZ3ZCRuXnVhv5B2gM
	 wy4hYxNGBCaqrJ59vRO+fwfKUGEAlzbWRveKaDXgj5bJlSB3qGnR983bka2NtQfPFLLP4
	 BGJsLAWxN+Pq9kDqMpJOsvqdCGsSb2hYPcjHXh5xChCZPXJ/PwcLhDgG8NBR6jzl0kLrl
	 TUYiF6DRT3bbJqEnQHZZdBVLSlyabIEi3rrzQCX4ZG8VVMzuLUcSpQkb0WmpfJBIPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770714;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=9i/KNixz8XcmN+DrNfxH9LQ7QcrQ2qr0RLDTB5dtP/s=;
	b=xNTkE3cChFeV1PSdKxnr4qrblV8TW9EeFnHvryspF/fM6lfFf1/yAbspYhw+ESFJ4xH0
	 fRnK9pl7SPWpMxV00ez+Ts2JPLA4DWmRp9OciH63hWV4BjOwwWazkdOSEEYISIyMTfRDQ
	 DV/3TZ4gyCjkfCo81tc3vMwuoiiUXTCfrbE7jOx0Oow8XLw4G4y36DASFZ50S/Y/dFyu/
	 KVCV3DLq2rDc1EylUym28/Ine7yVs+FSpHj8TeN9escNpSNXCtQqFi/UwHEpHNXODQsk0
	 8wfvpnpmRlD/yec/0bpMIA33qmW7sdAs6pG1fhawulHFzbZaa+31z8ZhnuoiXOieY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ADrxtlCq;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843CA606A332
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843CA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ADrxtlCq
X-UUID: 915df348ea4211f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9i/KNixz8XcmN+DrNfxH9LQ7QcrQ2qr0RLDTB5dtP/s=;
	b=ADrxtlCqGP3QU7uIcST+TL+IA+VSvhP9PfiMXC9+cLWda2t8D5DGS6462qrOW+rsNF85JYihEqV0CLi7dWybNbY3uT9ADOf/q5xrEL411ZO+v8G88t+KoqnVJecP2mOLc+XjwTlBIsbL8sn5kbQjOqtQg5YykhENGWenCfaU4I8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:637c49bb-29c4-4277-b3c4-10d4391771fe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:410f6c31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 915df348ea4211f1b9cf3d4034dccee2-20261127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1760812871; Fri, 27 Nov 2026 17:11:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:11:44 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 17:11:44 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id BA261200B6; Fri, 27 Nov 2026 17:11:44 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v6 3/5] wifi: mt76: add ACPI MTFG option for bus configuration
Date: Fri, 27 Nov 2026 17:11:40 +0800
Message-ID: <20261127091142.4119743-4-anthony.liu@mediatek.com>
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

Extend ACPI MTFG table parsing to support an additional MTFG bus
configuration option.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 2d7a967fd399..d8268ec56f98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -398,6 +398,7 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	} map[] = {
 		{ 1, 1 },
 		{ 4, 2 },
+		{ 13, 3 },
 	};
 	u8 flags = BIT(0);
 	int i, j;
-- 
2.45.2

