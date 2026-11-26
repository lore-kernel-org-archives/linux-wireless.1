Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682241;
	b=Mg/5d6SEsKJ24lz8kOzbPgQKP6kfHcjCR6gdyh4Y6KpAOboiSniUj8kOxIfXb+Dg9ABL
	 0PWmr1D/nilgwqvR5028J8E5jLqggwCi+fExhrr1Raly0YfpTsuCDG2MV1R+94L2UYJqu
	 6KP+0RloPtVGLKmGXo9y117XLVmqmmSKx1xSZXn+3w8tdeZtxLc5mdzRbBXAp1/MqFm92
	 GTWABZG5AbV5NODoamFvMD/vcRHdQ1mH2sAFjUKkIui/g2Gt4ncIJrfkEGXXGkLe0wDbA
	 WJ7VNF4cAw5xygpwnGUc/CiAI/gdgAnF/hzT6QrDg3YuTGv8CFpsywEKrZtHd8vAYpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682241;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Bit7+xI+ixQfSVMvEjBWwMfRYpy/Ac7be8rBx7t5aU4=;
	b=hEkH6RavOHerpEpz/CICMgCCxlPVwqOrzm48KJyZl/FlmK3MPPFdrVWNCBoHimCgBZGT
	 0LvEa0Fgl4GhNM35onQihm0DEhZbfXh7bb8Z6ojCYSwLc7HgWvGVFzGvbLffEVr76FM22
	 oOfmEjjfrpWTJeiJgpnbrKY1DN2t5g1ITUNv2g0pcN+j4WM+YDVHF0cMOR5OjDlf6smob
	 4ZuSwDdm+XtpzLasbHsBdEhQJ7fFgdmSSmnZn+YvIH3uYdwwxOYDS8SVR38lhe9DbJaJM
	 tlYSzzAyCBkCuOivwLo2uqUZ/gMDTkqI2vrFGiLIGOgHRdNtpqvPX1FLgyTv6r3LN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NMSXsWq5;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EF606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NMSXsWq5
X-UUID: 95c04996e97411f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Bit7+xI+ixQfSVMvEjBWwMfRYpy/Ac7be8rBx7t5aU4=;
	b=NMSXsWq58DjBv4yI1IhSJMNNkYX6IVgPI0WCFOCDICvEY/3oiUO7FBG8ULrgnh8D7SQP2UY/8KvIpBhIltJq6vBO/k3Gd9JVVDdKUMnMNC7l9cTF8JEQmgSu2SmvRxq50pP8qnkGWp6NLABaHpoMNjYuFu5sh4SYYeCEPw0Smy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:38da4c48-9743-4e42-a691-224ca7d18094,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:ab025f31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95c04996e97411f1a7aecdb2598be72c-20261126
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 62522172; Thu, 26 Nov 2026 16:37:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 16:37:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 16:37:14 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v1] wifi: mt76: mt7928: fix uninitialized rate_info for CCK/OFDM tx status
Date: Thu, 26 Nov 2026 16:37:12 +0800
Message-ID: <20261126083712.3235059-1-eason.lai@mediatek.com>
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

The data rate variable is not initialized to zero, which can lead to
reporting garbage/incorrect data rates to cfg80211 when handling
CCK or OFDM rates.

Fixes: 5e738c59e028 ("wifi: mt76: mt7925: add MT7928 TXD/TXS/TX_DONE support")
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 1adec01f6832..afddeecc3002 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1137,9 +1137,9 @@ mt7928_mac_add_txs_skb_msg(struct mt792x_dev *dev, struct mt76_wcid *wcid,
 	struct ieee80211_supported_band *sband;
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_tx_info *info;
+	struct rate_info rate = {};
 	struct sk_buff_head list;
 	u32 txrate, mode, stbc;
-	struct rate_info rate;
 	struct mt76_phy *mphy;
 	struct sk_buff *skb;
 	bool cck = false;
-- 
2.45.2

