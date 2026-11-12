Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468626;
	b=3zVR8fUIF437hemADx/cTKReD+HtuNKX+3G7t7JbrnzJq5PCzNxM2SXQ0eCZDycT1V2J
	 CDro7tiKsFBYE6BwOjwfKoSRHScZiZShok1d4osx33d0NRgtPhZe0GWo2jmSEpdVWpbMD
	 RmRyQydoo07AW1i9N6OO8hPSRV3Lba5J52qOYsSFjo+troWk168k1Tgzgc8a2mD+I8NRQ
	 X4WshCvME2Nyisz41TzN07XBjNcLB/ygM10FbNq044iYpbEkJ/7Dv1uVkQGy/nTFKKCyK
	 NKI67nhdNgyoxOCGq8lfuDPW1s0XZ2aKmeq/7c34J9ESRJ/NbjX4WORuyrbqupDLmWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468626;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=B4ZD1hoCg1eZv+nGM6aMDIlxG/CU8uh64RuLx3XJAV8=;
	b=ErXVNTckWfuFKkBJiGpUoh1iSpTQAIReDxAm+OZB7+7lyKjjzJhOqDFRYi9m25dLQzwW
	 MbahxXKzavACz4I3gm84D3cuZWdIEGI9nniFuznZ0yeGUp+p2FCu32FuGZjCn2R9Ji3UN
	 Mj2aNMDb8KGtduL31PleeZbjoXSEn3xUyD590/6dhu+9dTHmkkOyar+qIlG5Bvh6r/vfA
	 dQ3s4QIDTvFNcP9yMtJgvJ4Dol7o0kujHjDMpYX8aJbrOElIecHe6d1w2GBeJgr5fU/Hf
	 S4/bgnCrOEWmpN9YIMcRGMfdCSFp6c3dicmku7Ob4mMfujT31s7lnKv+ae9uBo5G5xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hZj6HRB+;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C155606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C155606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hZj6HRB+
X-UUID: e84e9c22de6a11f18dc8c9802ae25ab1-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B4ZD1hoCg1eZv+nGM6aMDIlxG/CU8uh64RuLx3XJAV8=;
	b=hZj6HRB+fJCcfjTKcn+cCsMpev4BBXFeb6vwi/ZISIMBweEiuzdy8+WKTh2R7AWueJQJYzqwjmv6ZNWgexrZbd/F/lI10t8lqEiy5rzYCMybXXBoueN4fdoeVP4MjS5xFZnatnIQ9khOehyJ87aj4MUL/DvVfz+Gkt49wTvKRrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:fded656d-cfb7-4316-a402-83b20e284c62,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:44bbbf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e84e9c22de6a11f18dc8c9802ae25ab1-20261112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1500292858; Thu, 12 Nov 2026 15:30:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:30:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:30:15 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: truncate the MTCL config to u8 explicitly
Date: Thu, 12 Nov 2026 15:30:14 +0800
Message-ID: <20261112073014.1798132-1-jb.tsai@mediatek.com>
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

mt792x_acpi_get_mtcl_conf() now returns a u32 and
MT792X_ACPI_MTCL_INVALID is 0xffffffff, but req.mtcl_conf in
__mt7921_mcu_set_clc() is still a u8, so the value is truncated
implicitly when there is no valid MTCL table.

Mask the value with 0xff to make the truncation explicit. The firmware
still gets 0xff for MT792X_ACPI_MTCL_INVALID, and valid MTCL configs
only use the low 6 bits, so there is no functional change.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..be0f1a063622 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1330,7 +1330,8 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		.env = env_cap,
 		.env_6g = dev->phy.power_type,
 		.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
-		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
+		/* MT792X_ACPI_MTCL_INVALID is sent to the FW as 0xff */
+		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2) & 0xff,
 	};
 	int ret, valid_cnt = 0;
 	u32 buf_len = 0;
-- 
2.18.0

