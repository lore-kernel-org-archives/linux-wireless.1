Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770712;
	b=okyrh6jd2zQBojePs97wI8vv6NjJxWVHThwUcEOHjFUfoAMiFLebX3Wxbhkoa6sty37E
	 17j6nUNwPMHNA+TNup8oBi70MHPu5L4DzZqXqjAbf+n3u4ykszQhdlOZq+unnjBwzYB9C
	 P3HfUCWPKvY+MiigACSpEr2Io39+8xS5uDVVZfRyQUVUId/QeXtb4qCHwellwS0RC1roS
	 Png9Uv5bY9UXi17zZpvTLOonWedVYSJq/IwQzYV5c6vJVKx+jtNGoRqYyJWO87/bUlTrR
	 gq+OtwKoqhzc5akw9gTqmolGPwWBQEEbQ2SS06PWAci4fT7BzjqXNtsi1WVGZMF0EmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770712;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=bX3ZErLssyV36jOf5yEvNyFXPDGcjkg44nY/dvrfRmo=;
	b=3nb9VQ0ts9iie/2xub5iqMVLaRaPX6CY0kiRjlishNDA93+JmM9IaSoBgzHUOppbW5Uf
	 N+hE1ihGrAkaRk8/QLpiE71hi7feR0XFhuPomJpxm62t40RNEz6+Fs3IGUTbHODCnnYML
	 AjBnARnMVz7ZMgI+ThSWNaCrP7M41P9Gl0sx/XZmT3E6EjwAo7mKQtiEXzypRK+SYorkL
	 /UmA/jIMPJ6xrdc3UnoLzuyd1uJnXZYoiGjDnxwoSQSZM8HjBDq4TmOi/r2WEX5ibl0nK
	 Xg3dGxzi0va6x8VgV6DFpTc2d3cdXsB5JZHtFuVLXEoOfRi25b26oIThBvzmyLX3fJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="AMimLHt/";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83240606A331
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83240606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=AMimLHt/
X-UUID: 91c17f08ea4211f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bX3ZErLssyV36jOf5yEvNyFXPDGcjkg44nY/dvrfRmo=;
	b=AMimLHt/kl/TUN5jyW2kUszpYvGSQ8MyEcDkghRhH9Dlo/ygFGCZBwtvgjXUbDUu//b2hNapq8KxiILA2TUClsW7mqFNv6qMsDI0XbIrPyz4Vlr1lQoh6vto4x1/Z2hblCBmpR2+UH1j0G0IqWgW6rF5XaPGJKo+0zdCVEj9dPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:215b55c3-1505-43a3-8571-46f41fbf08c2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:ba006267-988b-4c38-b75e-cec7fe8e32a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91c17f08ea4211f1b9cf3d4034dccee2-20261127
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1278620359; Fri, 27 Nov 2026 17:11:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:11:44 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 17:11:44 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 9A9A4200C6; Fri, 27 Nov 2026 17:11:44 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v6 1/5] wifi: mt76: refactor chip_config to accept generic commands
Date: Fri, 27 Nov 2026 17:11:38 +0800
Message-ID: <20261127091142.4119743-2-anthony.liu@mediatek.com>
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

The API, mt76_connac_mcu_chip_config(), was only used to send reset
command but the chip_config command is a carrier of more commands.

This patch enables other FW commands to be carried over
mt76_connac_mcu_chip_config().

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
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

