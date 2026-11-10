Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280420;
	b=Bjck1tYbCsJMw2D0dCPp7HbGL8la3QUSu7IfhKmkHXdwFpalTpbXGcLegexWifoRxknl
	 3tM52EXZBJXXbHZl1s1wtj3a0KUc28D5DBoIwGIPq1Y+cJYJ16pnrxtI4PBWPRnjEHwy5
	 OyctbiUm/dA/liXiLI95uPjlKWYkWjWGfxoYI3yfX9E0CS+RQ6/OnbbzG3nDjSasJl1FK
	 DTW4UWkHawOpkxTDc7NhTRMlKRqqgusfg68DalvnkPpfyTscd0Z0Rqh1IdvVKQCuK7kEf
	 75q6ay+K/K5HgUZxoUudNmw6NGm5KY3G0nJpu0mFSA7rqANdxLNQeB5m4t+u9VvMdsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280420;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=s3WU/ntEM/Qzr62B+Nsjoc7XB3FTBM7MGR2jCmGohMY=;
	b=EyY2vqOtYzE++hXpPdiwQHkyoNrMKovW1vYC72NS1ZelwsSnbNJ7Pr7zB4uPhGCxkbj/
	 5MJjNxY//GTxH7v+JfojhP2ocV+PdiZR3W36y4iMFmYaAM+PlaQ18A0PKVf6U50ObG6CB
	 NVUZl2af/R23U3zzNwuuGrYRBbb+qFtspLE6pL1f1ULGMIvpwo+k0jSTpSdowS2PEUaYB
	 JkxKyeM0Gs0q255CGg1W3R0vxXP7xUsyQuQ8fPcps1lU7m4Kchzd0x3/Ip4ABI2kU9Y5r
	 O8N05QkhRd0fNEI/ZObSqAGp8f6PzMQQVQwEUmFOJTy9ofPk3Au/kjb1SlcDTF4J70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s3DBYvLv;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4143606E603
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4143606E603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s3DBYvLv
X-UUID: b766d8b6dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s3WU/ntEM/Qzr62B+Nsjoc7XB3FTBM7MGR2jCmGohMY=;
	b=s3DBYvLvj9zsb6XSBWAZyo3JKaH6IgZw75tKSb7tWge2WXmnW6KFoMrDIVaiWyBtGmf7V60nswTj8dSUyeK4c0Xdh8oNJNQbk+wgArYkRCwE0Cgk3eWGuV4zJrlLNnUjp4Ewu9aURrIOv5d6JJVwkMO5Z7dxf1S95SQdhzr1sc4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f132ecd7-6754-4061-b685-95eb382998cc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:251ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b766d8b6dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936545567; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 11/28] wifi: mt76: mt7925: parse the FW hybrid-MLO third-link band limit
Date: Tue, 10 Nov 2026 11:12:27 +0800
Message-ID: <20261110031244.369014-12-emery.hsin@mediatek.com>
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

The EML capability TLV also carries a bitmap of the bands the firmware
forbids as the third (virtual) hybrid-MLO link. Store it so the
multi-link setup can keep those bands off the firmware virtual link.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 557f8d3dea12..1d59c02645c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1127,8 +1127,10 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data, int len)
 static void
 mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data, int len)
 {
+	/* The TLV also carries the third-link band limit for hybrid MLO at offset 3. */
 	struct mt7925_mcu_eml_cap {
-		u8 rsv[4];
+		u8 rsv[3];
+		u8 third_link_band_limit;
 		__le16 eml_cap;
 		u8 rsv2[6];
 	} __packed * cap;
@@ -1139,6 +1141,7 @@ mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data, int len)
 	cap = (struct mt7925_mcu_eml_cap *)data;
 
 	dev->phy.eml_cap = le16_to_cpu(cap->eml_cap);
+	dev->phy.mlo_third_link_band_limit = cap->third_link_band_limit;
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index b9bcc5e1197c..5a501e72baca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -228,6 +228,12 @@ struct mt792x_vif {
 	struct mt792x_nan nan;
 };
 
+/* Bands the firmware forbids as the hybrid-MLO 3rd (virtual) link.
+ * 6 GHz is never restricted, so it has no bit here.
+ */
+#define MT792x_THIRD_LINK_LIMIT_2G	BIT(0)
+#define MT792x_THIRD_LINK_LIMIT_5G	BIT(1)
+
 struct mt792x_phy {
 	struct mt76_phy *mt76;
 	struct mt792x_dev *dev;
@@ -259,6 +265,8 @@ struct mt792x_phy {
 	void *clc[MT792x_CLC_MAX_NUM];
 	u64 chip_cap;
 	u16 eml_cap;
+	/* bands not allowed as the 3rd link */
+	u8 mlo_third_link_band_limit;
 
 	struct work_struct roc_work;
 	struct timer_list roc_timer;
-- 
2.45.2

