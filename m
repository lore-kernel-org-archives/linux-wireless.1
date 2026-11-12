Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468735;
	b=HgCwm9pEwk7giXQiy6aDVfYDzC8IAEH2OkcneiDoP9sZIEN1Qf+1swb915xS95v3bemZ
	 aGO731s7x/oT0E1nLwwNZ1t7GlK6IRm3aydE+gaF4nTXLufXFF74yDV8bK628yVfaX7Y1
	 CwMfpdreJn16wCADTvoLBNQgnuMEJZLSUM/kXIJluNKTwY2w/YlNTgN6Gx/DiKGt7zgZF
	 FgKunsrHH+Ud2AokLv42zBWFrn1oxst+Krl4jBNVEPvjaXPFM9MMmFUC/kDkxutPKdxYv
	 XuHTrvi8/s5PcmcmGJbCgwMmdllxfKNaojtcw+UbJezPgGl5wLO5PCUV8IsXw+aYADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468735;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=TSNkfDZSFX0Fhs1s5+DAx+uvvgXFKQImTTEzVGUsFSM=;
	b=iqy2Pb3t6xWK5bhikMiUlIT8ntrJ+N+dzCy4EmoyGWneNI60/lvzaK4aru9PvCUINej8
	 KJ4zjI8y6sntwnl9LjgNWu3i0+pFrmZdZaQUzE0yAHzJkhjdAA/GCVReZj8VmgMb0Yg1B
	 YotTjR3eEhTGqXO24Bd7JS0Nlih1RqgEJIOBZii92bECfVS54Ye/pQebl/rFF3XiOruvu
	 psIHkVCE4PfC+Ho6kbUADdftBV9iMZfc4o1CJCUHhOG6pRNFUxXDv8YhldhADiv5q41H0
	 N9NxD9BGg13EOvFX/9ruoshNNInFHJAAkY/s3dCdoZ8RtIPSJth77NDCW77mZd6uONw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="krKg5/lh";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE7606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81EE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=krKg5/lh
X-UUID: 2befd054de6b11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TSNkfDZSFX0Fhs1s5+DAx+uvvgXFKQImTTEzVGUsFSM=;
	b=krKg5/lhFtgkcQFiOYsIgV0pTFVS14fazZlp7mPiv5wDGb8QSAZX8BLDyOY+fEZD6yCutf5xmOrB3icxoD78pocOewwa4Ll0ztshXb2tia1GrmSanA+vW3S+Bw/ppaySB+UK9RIPzcmQzgmnmlTHTAJ/iignLsGdyeHWFYqlOi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:20231493-8818-4693-8e80-526b3d6aff2c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:647b4844-4ab4-4ff2-867e-590f0718e263,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2befd054de6b11f1b1788b6acf885367-20261112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 813598582; Thu, 12 Nov 2026 15:32:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:32:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:32:09 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: hold mt76 mutex when setting CLC on regd change
Date: Thu, 12 Nov 2026 15:32:08 +0800
Message-ID: <20261112073208.1799206-1-jb.tsai@mediatek.com>
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

When neither MT7925_REGD_SUPPORTED nor MT792x_CHIP_CAP_11D_EN is set,
mt7925_regd_change() calls mt7925_mcu_set_clc() directly. Its callers,
mt7925_scan_work() and mt7925_mac_reset_work(), do not hold
mt76.mutex, so __mt7925_mcu_set_clc() reads phy.power_type_user
(written under the mutex from debugfs) and writes phy.clc_chan_conf
without the lock, and sends MCU commands without waking the device.
A concurrent 6G power mode change from debugfs can leave the CLC
request and the 6G power tables sent to the firmware inconsistent.

Wrap the fallback mt7925_mcu_set_clc() call with
mt792x_mutex_acquire()/mt792x_mutex_release(). Neither caller holds
the mutex already.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/regd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index fac910406aa9..3060a9d93fe1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -564,7 +564,14 @@ int mt7925_regd_change(struct mt792x_phy *phy, char *alpha2)
 	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN) {
 		return regulatory_hint(wiphy, alpha2);
 	} else {
-		return mt7925_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR, false);
+		int ret;
+
+		/* callers (scan_work, reset_work) do not hold mt76.mutex */
+		mt792x_mutex_acquire(dev);
+		ret = mt7925_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR, false);
+		mt792x_mutex_release(dev);
+
+		return ret;
 	}
 }
 EXPORT_SYMBOL_GPL(mt7925_regd_change);
-- 
2.18.0

