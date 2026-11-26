Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686912;
	b=OevLdkjo8rxskb1Iy8qzOaY48AOjKdKXgfkEA95rDwEIhoMeV4RL6p/yRx2kPDt+ne7C
	 RZDIga1ndik0zE4GRQXQvPJFjHzTTPSh/ludrE1B/ueIj8RBXSmMJc7iZzXu+I+7JIkue
	 RL8JKdfjF8BdlDl0xttgPjkcEM2wrpbD3lqxfsBe7piYeJwCRHBPqR1XF4sD4kNI9knyq
	 W6YCu/wHPgjlMO0PlHihZZjUeXg0bSfneeegpTwzOv2CvquKUnX7G14KGM7KmwhiEfdC/
	 2aleksH5a/vBZBcl5if1EcMbPHcSq8TdbgHhZ6W9mVZGQXEk8ufBg57UImKnoKZWwsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686912;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=kB7fUCbNbel6JoV0lC/FqkxHrEfwn0hBummjB4Ajh7A=;
	b=L7/7JdP4qZcN83QWm42UlM1ltzZJzoVkScdbyiuKC/dkOFgN9grfu8jFSfHg/tHAk9DP
	 TY1Azutk1uDuMmc9rUTquIldWT4dFrbl3zxIoxRteUOSKyW4XXuR64B7GmrRh0TygMVHk
	 KnaaqTy1rriVBLheLm9KGJV2AL9CBnNw9P9RAgfD6qdejXW8/+wIy/M21vOVgFaBxxFRM
	 eesq5YDbbVlrf4ta8EHFHPoPULgY+tBobZ33d/qnu1Hb6DtnOEajnE8TsZGpNmZRB+q7u
	 zKmscvaxj/Y1VGOrX33tIQ/1mWPGaxK3WufJrjyEzSjrHkqLCuyNll28QwwO17PmFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pOxgRupz;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC6606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=pOxgRupz
X-UUID: 7159accce97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kB7fUCbNbel6JoV0lC/FqkxHrEfwn0hBummjB4Ajh7A=;
	b=pOxgRupzlyviXA/pOf6Uj5/3VlVjRvcdVL3xnHnnKsPZ4PrYf8alKfhut2EOa7SMXe6Qgwrvb9X4thGcpLSQlvSIky8JR7T7FQHqR3MBY9rp0+pQLt642ZYcPEVsXXeR/t5oBleM4+L25z9q0W+yG5IWWouDn8ZpS2iLFi5NWkg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2f3b6fbc-fcd6-4296-8c0c-382f8bebb96e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:60d35f31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7159accce97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1081181075; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 7046E200C6; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 1/5] wifi: mt76: refactor chip_config to accept generic commands
Date: Thu, 26 Nov 2026 17:54:51 +0800
Message-ID: <20261126095455.3280998-2-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126095455.3280998-1-anthony.liu@mediatek.com>
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
 <20261126095455.3280998-1-anthony.liu@mediatek.com>
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

The API, mt76_connac_mcu_chip_config(), was only used to send reset
command but the chip_config command is a carrier of more commands.

This patch enables other FW commands to be carried over
mt76_connac_mcu_chip_config().

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c  | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 6a1475e3c899..83cffa94bc0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -54,7 +54,7 @@ static int mt7615_config(void *data, u64 val)
 	int ret;
 
 	mt7615_mutex_acquire(dev);
-	ret = mt76_connac_mcu_chip_config(&dev->mt76);
+	ret = mt76_connac_mcu_chip_config(&dev->mt76, "assert");
 	mt7615_mutex_release(dev);
 
 	return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 744b4d1f6519..0e3f23e52382 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2047,13 +2047,13 @@ int mt76_connac_mcu_sched_scan_enable(struct mt76_phy *phy,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_sched_scan_enable);
 
-int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
+int mt76_connac_mcu_chip_config(struct mt76_dev *dev, const char *cmd)
 {
 	struct mt76_connac_config req = {
 		.resp_type = 0,
 	};
 
-	strscpy(req.data, "assert");
+	strscpy(req.data, cmd);
 
 	return mt76_mcu_send_msg(dev, MCU_CE_CMD(CHIP_CONFIG),
 				 &req, sizeof(req), false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 6a51b1df4fc7..c5fb7e2adab1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -2122,7 +2122,7 @@ void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 int mt76_connac_sta_state_dp(struct mt76_dev *dev,
 			     enum ieee80211_sta_state old_state,
 			     enum ieee80211_sta_state new_state);
-int mt76_connac_mcu_chip_config(struct mt76_dev *dev);
+int mt76_connac_mcu_chip_config(struct mt76_dev *dev, const char *cmd);
 int mt76_connac_mcu_set_deep_sleep(struct mt76_dev *dev, bool enable);
 void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 				    struct mt76_connac_coredump *coredump);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 825dfcd2c6ac..14c70ffa9665 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -238,7 +238,7 @@ static int mt7921_chip_reset(void *data, u64 val)
 	default:
 		/* Collect the core dump before reset wifisys. */
 		mt792x_mutex_acquire(dev);
-		ret = mt76_connac_mcu_chip_config(&dev->mt76);
+		ret = mt76_connac_mcu_chip_config(&dev->mt76, "assert");
 		mt792x_mutex_release(dev);
 		break;
 	}
-- 
2.45.2

