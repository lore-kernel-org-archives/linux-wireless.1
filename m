Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273857;
	b=kThC6U0pdFrczcj5XA6OnBspbLyxdqyduzQkRGRemV4dgmiAOWWl+xq74uUeMMnRYW4C
	 +xxBqYUf7bwcTNy6VVCeHVlJyM8NYXLOAdFCO2wI2ADatpJX92koZcZaxOdZ0U+rAfsZN
	 QPOxgOY1U1dKXGMjWE1g1FDtAAP/s8rLWtqNdorm+Exbq1GsVBXVsFaM4pAE3PevksdRZ
	 cBMiKOmcOhPFB3PMXWAb7rSrT9ixI4N5efL7/30MK0fXD9MlLJ0gG//Yp1CBrM3yVsuqX
	 MP/E9I7Ns0oOCT26y/OoBnRsLXmoBnENNdXOZwdDBMx4VzguCrj6PZqw/A/r3GHyFbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273857;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=W9o2iCjAVK2c+dojBxo6HCm4QXiuhz+/nTtHq/H4yXw=;
	b=ELPDFGx5xUZCH4eyo5Dw7uT6fwxPE9ksMgGbFZFN8xPA7LZ/EpiFxlY18sndlY/wyYCR
	 4R0to2iblC7zCGFodw2IX+1nO1JPnMw/XN0oky64PcnyT07RPnftcZ5A0Kp9EpRcn9Lte
	 a7k+eW7zGlW+3TkOB+fIo7OC1aBUNhFBY/LyFo9N0lCmBf7YxjVP4sUGV1qieLxbnX4fq
	 Ar2dSSK/fcTVUjxHllOsvmh9FBSFJFY/NLeYusihgJ+tR3aLG18KHnaDjqeeoc8cYvkn5
	 C9JqD0HhgAcswqIx2KALtvfA0/8mumLNuScq2yX2Uei6PIuZDYHLLc8LLkgiialzZ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MoOPR5je;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191D60A3809
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 01:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8191D60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MoOPR5je
X-UUID: 6de744aadca511f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=W9o2iCjAVK2c+dojBxo6HCm4QXiuhz+/nTtHq/H4yXw=;
	b=MoOPR5jebWLF7fH/3Kt2pjc7rn4fEs+dLEcLdgsqgZRKzJtYaE5D39uyxxwyh2EN4GZiaY2T85A/QxsZiFggBizagJHmV4WQKTmDKJmiFwjQbmJPzpTBIymE6I+IPI/K+pvfEKpu6cImyObaFkp3BoJjDXfD9st+wuN4Zhiib+g=;
X-CID-CACHE: Type:Local,Time:202611100924+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a7d48e4c-be3a-403c-9dbc-426113f4529a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:f9aa0d57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6de744aadca511f1b1788b6acf885367-20261110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1760594421; Tue, 10 Nov 2026 09:24:09 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 09:24:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 09:24:08 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <jared.huang@mediatek.com>, <jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add 5.9G channel list and last batch size for sar update
Date: Tue, 10 Nov 2026 09:24:07 +0800
Message-ID: <20261110012407.342786-1-jb.tsai@mediatek.com>
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

From: Jared Huang <jared.huang@mediatek.com>

Use min(batch_len, n_chan - idx) so the last batch always holds the
channels that are left. Also add the missing 5.9G channel list.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Jared Huang <jared.huang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f45b0d81fd08..80a4f395c472 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4140,7 +4140,8 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		112, 114, 116, 118, 120, 122, 124,
 		126, 128, 132, 134, 136, 138, 140,
 		142, 144, 149, 151, 153, 155, 157,
-		159, 161, 165, 167
+		159, 161, 163, 165, 167, 169, 173,
+		175, 177
 	};
 	static const u8 chan_list_6ghz[] = {
 		  1,   3,   5,   7,   9,  11,  13,
@@ -4199,7 +4200,7 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 		int j, msg_len, num_ch;
 		struct sk_buff *skb;
 
-		num_ch = i == batch_size - 1 ? n_chan % batch_len : batch_len;
+		num_ch = min(batch_len, n_chan - idx);
 		msg_len = sizeof(*tx_power_tlv) + num_ch * sku_len;
 		skb = mt76_mcu_msg_alloc(dev, NULL, msg_len);
 		if (!skb) {
-- 
2.45.2

