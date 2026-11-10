Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280071;
	b=FCF3Gh2E+odGVAIjglVrYDJ32JC6lQgX7oPmsdnlfB/pSJT6afo5H8dR6MYU0a5KNoC2
	 o0vivsfHHafilWVn2im2IvACZkNqF7tDMRzgBVHnVn3/0XSa7ZA/SRYRpBDIQ0HZdIoij
	 paBUmLRaUTUBEUyCS2dh2tdgk5/LwMetU+6jXrYA7+niYtBW/BYRUFrRFYNEBPItcuA4Z
	 W0oFVbd2LR6KIWHGVJ81gJndC8M7H8WkTb4dSloa1IvMIrIo1psQG9kBoIDKZu2ERqdzR
	 q7zODLygwf+GQ2m4EoM3zd7+FlqiOc799kae6WJJ1UjMfo2UrZNHMS3532SyfW+3fgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280071;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=w/eXjAMoSt68fyDM2nHRizh1dd533oPQwuSg5wzA7sQ=;
	b=sw+WKXzEz4O++LK1LuMjgwyYkT6R2eQkJPPMcKZ58gfFdL6vIMLdyQkdCPIgR0aBpa37
	 Wg00PV6DufGcRHTpzdSJXUTMLxdsEmbhQwj/SexG7wake000Om+6gSQ0u+XuMzjw2IWKV
	 NApvkX7DPxWczQxEdEA3X7SVstChlRsuiz5F4q1A+ofsCdwjBnUALyot2bN/fk1SfvxoA
	 xkwjcSLICP1sZWZf+Q1Xv/kdmLxkeX4BzvGqG1kU90eziXASuzMwAi2zckAiP8m2pvL4S
	 eOeVp3ssLth5j/19qEcJ4kV/vUQo3NG3AB/31L5lvU8tt8H20QuNqJVlAUrS9hdGz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=gORRkX6f;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF10606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF10606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=gORRkX6f
X-UUID: e674ab0cdcb311f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=w/eXjAMoSt68fyDM2nHRizh1dd533oPQwuSg5wzA7sQ=;
	b=gORRkX6f23ehHYYkQlykwmw0UDF/iQoM8sVxEGsXW9bRg0Jmf7NSgRaaOuP1hcAU4JvqvQtd3IUFdJpcMDbK30qQD0PMJ4W8UG4Rkol9KPeZuJN/Vu+gvfiHlRWUv3YvAafB71wPQW6gYjmSNWyDNnbffLYk8julMkML0UknOaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b63580be-0d7c-4da6-9118-48c4af4bf2ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:13180f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e674ab0cdcb311f1b1788b6acf885367-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 397241363; Tue, 10 Nov 2026 11:07:44 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:07:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:07:43 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: drop redundant MCU restart before firmware download
Date: Tue, 10 Nov 2026 11:07:37 +0800
Message-ID: <20261110030737.367177-1-emery.hsin@mediatek.com>
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

Resetting the MCU state before firmware download is the legacy approach
and causes problems on MT7928. The wfsys reset at probe already leaves
the chip in a clean state, so drop the MCU restart and FW_PWR_ON poll.

Fixes: 9eef868b86db ("wifi: mt76: mt792x: ensure MCU ready before ROM patch download")
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 80756aa8d99d..1965e9de7099 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -1135,13 +1135,6 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 {
 	int ret;
 
-	mt76_connac_mcu_restart(&dev->mt76);
-
-	if (!mt76_poll_msec(dev, MT_CONN_ON_MISC, MT_TOP_MISC_FW_STATE,
-			    MT_TOP_MISC2_FW_PWR_ON, 1000))
-		dev_warn(dev->mt76.dev,
-			 "MCU is not ready for firmware download\n");
-
 	if (is_mt7928(&dev->mt76)) {
 		dev_info(dev->mt76.dev, "Loading CB firmware patch: %s\n",
 			 mt792x_cb_patch_name(dev));
-- 
2.45.2

