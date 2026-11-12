Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468516;
	b=AmHS4vGPMruaIAe/ihEL2RbJokcnp1FQrt9d8sQlodQ0APVmidUUXsXyA7hP1Isa+qvb
	 1nGwF2zaUQYGFJBa3KowL6VtSBD+Deqc1xt+lBbZC/VQ+cs4cin2wuRxcEFmgsYA9dFjB
	 yph/qLF/fvaJOzBOYAH4z2iXIl8UxlHrFMelCLXH5/a9PqvrAAM4w6zkNh8ulVDT4X1a6
	 LBBatTbn+/DxmmZbw0nbhp6frCQ6OyIpoJAGwWczbx2kdTt492oZCyJMHof+JRg++98I8
	 +7CDl+Rg55dEkCl9Gfcg1VPtEQ+tQfogvoPIR1oGtWw/ZyUXdxgafteYMK4w6AtKESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468516;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=WdFoLiUWlTSVaiTOte0hyThXncwNQVvnR/LdJEYOr80=;
	b=cuYObNi3b/JIgnrcRI40FcUUKPsMJRehMhdFpCK2TfcjMFt8+wD62T/imNKhhdNG2gb1
	 Rq5wZhcCfB5ZdGWPQUpnh2k5dXI1WR6f3/4l62/yRPfvC/D/Ul+le5T8F4JKKp9ohBgFI
	 2tN7oohziKzB0pK07TFd97XD1T0It9t1L76KKCbDHijj0pTyFvr0KBElRK7nN4Cqk7IIf
	 hu6Fvl2Py2vUL6j3Pz6oWEgNbEjieCdPkyMRE1wSAE+SXSsh7Y+9/2QzuQbHH3ve3YU/4
	 6bGNB5kKBQb8W2Xu9otc4/5WTjEC6zs/7qnz7eJEA1ZwpP081yXwVSmv3D3RVETLSQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=trf0V4PT;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5D606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB5D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=trf0V4PT
X-UUID: a9a7e924de6a11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WdFoLiUWlTSVaiTOte0hyThXncwNQVvnR/LdJEYOr80=;
	b=trf0V4PTmL6866MEfje0Qdy58Nydjs7sE2L6ARymzJi9YZTTQsW2K2lxqoLMpiqKsYvBW/kXUtlOKA3jHz4Ev+g1MRjTQzF/TPwb7mQX+sfS/WNVsdlrlvHcUuU2higK4/TiB5PlP/qEa1kFnXTxDHIvAd2jSY3UNrT6szGftsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:307d03ae-b4b2-4cbc-8cab-3ed8a1932ea7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:97e2a48d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a9a7e924de6a11f1b1788b6acf885367-20261112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 498370896; Thu, 12 Nov 2026 15:28:31 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:28:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:28:30 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: fix skb leak on SDIO bus hang in MCU send
Date: Thu, 12 Nov 2026 15:28:26 +0800
Message-ID: <20261112072827.1796829-1-jb.tsai@mediatek.com>
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

mt76_mcu_skb_send_and_get_msg() takes ownership of the skb, but on
SDIO it returns -EIO when MT76_RESET is set and the bus is hung without
freeing it, leaking one skb per MCU command.

Free the skb before returning -EIO.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index cbfb3bbec503..54b2ef2d5916 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -79,8 +79,10 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	int ret, seq;
 
 	if (mt76_is_sdio(dev))
-		if (test_bit(MT76_RESET, &dev->phy.state) && atomic_read(&dev->bus_hung))
+		if (test_bit(MT76_RESET, &dev->phy.state) && atomic_read(&dev->bus_hung)) {
+			dev_kfree_skb(skb);
 			return -EIO;
+		}
 
 	if (ret_skb)
 		*ret_skb = NULL;
-- 
2.18.0

