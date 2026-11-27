Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768876;
	b=HVmMGd2FAU7tBaa1hQkTIe1Gt73Qp2ksesfPh6yClP5LtNKEGelf7ILgsZHI7ZGlXrv0
	 5VMalI3I7Cl2mve0yxt7JeZ7GayziVOEKbBIafVLYx4qCCVoDWA+pmUc5X9nmjHYI788V
	 URIQC5gJtadf05luv7XS5Nqhq/EnP84KQrjUOgEuSBS3qtsAo9VqBB1YeVsosQhUCahdC
	 xDzacuuX6vHkfYSP+Hlc/wHgAqipB2PYLAP8DDsl/hWPE1rkXoCxejl5EZFnU4rHslrjt
	 7qzlO+zJGYHxwiWaSaq7xcMx7EQ7fsIBO5/l4rhhSpXXBgfRvaW5dxGDO+LnuG2Fd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768876;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=icwSomd9/pkE77nvCjEhjHFfyn1xfdl4Oy+vj7qpDKA=;
	b=oSTidQrYkKoe1JzxVKjxU40sfB/f2SkBS+Tvj9M27Dau5Q7KnZolCaAdFAiYZZZoTzzZ
	 OWZUY8+ISHZht0edRNIwz2jN/oWxlixTKApxRet4nZeOGpCMnwEkk34tY2oRkVey6mRQF
	 Z3+LmToD+CvGpvR571MNnwirXv+yeRd+1mH7T1o0RGfrBiq1M1fl8XnsBJxjCrBGguxiP
	 wMtetc9K/JiuObALXYwwjjGGSysS4XdXO4ewlsbDRMdQmhm513kojDSt2plnO10IBL5PA
	 /mM1aUlNQiLqQHOEnM3dmKjjEvucJeI+N9EcJCK1TJ2R+YhOz6ESYNWDlan1GQs/XxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Hly982mG;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427B606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3427B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Hly982mG
X-UUID: 4b432d1eea3e11f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=icwSomd9/pkE77nvCjEhjHFfyn1xfdl4Oy+vj7qpDKA=;
	b=Hly982mGyIl3T9T+VP8gTqum7Rxeol4PSaltdwPgVC4P08XTSemHkpYoB14OPsNugXIgoNq3hcqDIbMyS4lzpKPHMhjdSWdL+f0ZhLdovclTP6ASXtbVZOjkROmf4rX85yJXLA24GGfGwPJ26NLtylreWVtTN4iBKlorxLptjxQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:70f782a7-c112-4a24-bf18-74d13029e943,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b8686dd2-c16d-45a0-bf9a-a369dc5547b0,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b432d1eea3e11f1b9cf3d4034dccee2-20261127
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 160155230; Fri, 27 Nov 2026 16:41:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 16:41:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 16:41:08 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v1] wifi: mt76: mt7925: drop RX frame with a header gap past its end
Date: Fri, 27 Nov 2026 16:41:06 +0800
Message-ID: <20261127084106.4094862-1-eason.lai@mediatek.com>
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

hdr_gap includes the header padding from the RXD, but is not checked
against skb->len. If it is too large, skb_pull() fails and leaves no
headroom, so the __skb_push() in mt76_insert_ccmp_hdr() writes before
skb->head.

Drop the frame if hdr_gap is not within the skb.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 3389a3236187..b5eae71c5285 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -599,6 +599,9 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 
 	hdr_gap = (u8 *)rxd - skb->data + 2 * remove_pad;
+	if (hdr_gap >= skb->len)
+		return -EINVAL;
+
 	if (hdr_trans && ieee80211_has_morefrags(fc)) {
 		if (mt7925_reverse_frag0_hdr_trans(skb, hdr_gap))
 			return -EINVAL;
-- 
2.45.2

