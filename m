Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681417;
	b=L0z0/8IVPDrFZLzi1y4uPHp+juDkEh7fnm5jScf9eRVMv3qQlRQ8aTYARjGLZLQ7GF+0
	 Qss84GIz7wdcyv2qsLHhKJcCWsgR5W4XARgSko1K3hdOtorTR6xESxN3qZ0uvZG0E4Nnm
	 6+Hg/hyoXzw9iLPfeJd5sYTv+AvMPC+BbVH3eiwUaPRbpjo0JG9UtDcjMYkEAFx7DrnZx
	 NJ7oOg5+Pl/MlMUu3floIRffPhox+YbW/W81Iccgx0QaKuPPguHxTOokusWM6qawZsPDv
	 dzhQkglEWpnT5eLc6BZLHIgG04AbSEBCLXVa4xtnC6deAtNhReTi9F13JjR0yKhYFDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681417;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=cAaY/L0jicDyYPc/8PaLpndAdaujM+s27PpGmxriTQs=;
	b=V3semvPnkHWCjF817x1u305YhYNFYdDDB/82WiEkgkHZ1HjfVEOhyzdEE2VFMMyZbkLi
	 IhDhMBd9BckRtl0nQFVuwHBjLVdRWbGeNIXKbCXi3QJ8Wlcgx2nvDGH9vWFMkX2lLdIzI
	 eNjcIIg0njUFtPDZZjQXLa2IqS06FIrPJhv0lGVeYR/HlUsRKrbM3i8sxh7mW9u7EIn/f
	 isjcWxAQ+C2Eck0MpgBLgbjMhoc0+YKVzYAIGSj6Y3FENhEwBzWYR03IBV5ysH6M3VQVR
	 twLtLXBiLb5Jti0M+Bp2vp15KovqgtmV/NofmdG4ctdkSTjmVQGc3d5Y14FgOmX6m7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rjdavGw7;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42769606A337
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42769606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rjdavGw7
X-UUID: a91f3864e97211f1b9cf3d4034dccee2-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cAaY/L0jicDyYPc/8PaLpndAdaujM+s27PpGmxriTQs=;
	b=rjdavGw73GSoSUXqvghmlOgJF9mhsvPiMuSotGqdn5yJJx+82BvFlV3+fTrRIgDpL4bvoF5xXruxCakJYGbgQxfmSIyWMrsZnTVDxVjk3dJHIo15YRj5fnFocDyghNkc+tdrsFhht/UiUkWmrKAxrrw6KdOq9oyQgLbwmh3T1Fg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7d052faa-5c79-49df-828e-3a563e407b12,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:53ebc7bf-1c10-4783-912c-2488aa105b1f,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a91f3864e97211f1b9cf3d4034dccee2-20261126
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 107302628; Thu, 26 Nov 2026 16:23:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 16:23:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 16:23:28 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH v1] wifi: mt76: fix possible NULL access in mt76_tx
Date: Thu, 26 Nov 2026 16:22:28 +0800
Message-ID: <20261126082228.3226934-1-eason.lai@mediatek.com>
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

Add WARN_ON(!wcid) early return and drop redundant wcid NULL check

Co-developed-by: Anthony Liu <anthony.liu@mediatek.com>
Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index d8036466f495..2be43d05c9af 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -377,7 +377,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	struct mt76_dev *dev = phy->dev;
 	struct sk_buff_head *head;
 
-	if (mt76_testmode_enabled(phy)) {
+	if (WARN_ON(!wcid) || mt76_testmode_enabled(phy)) {
 		ieee80211_free_txskb(phy->hw, skb);
 		return;
 	}
@@ -385,7 +385,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	if (WARN_ON(skb_get_queue_mapping(skb) >= MT_TXQ_PSD))
 		skb_set_queue_mapping(skb, MT_TXQ_BE);
 
-	if (wcid && !(wcid->tx_info & MT_WCID_TX_INFO_SET))
+	if (!(wcid->tx_info & MT_WCID_TX_INFO_SET))
 		ieee80211_get_tx_rates(info->control.vif, sta, skb,
 				       info->control.rates, 1);
 
-- 
2.45.2

