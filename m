Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364070;
	b=JR3EW/s6/Z86CIhgWAJkrH+LqAKnQjfz6mXf0O9HfMdyKtOWwpQzIahZQb3MwmuFP0Fh
	 QHezWgJxzaSt5G7AgdttZa+JMyDUnBv7pL63EgrRIkC+no2QNn4+P3oM8zArnOS2vE9pT
	 InLsu6Flbk3uo9ONH90SyNUGt3XuYlzHkmO/OjH1nYSytiZAlWqETXi8TiTDmFoSgKZ/z
	 7+hYxRujj0UB0Fn16KHLiOXP7Yqb57Kkn68guqJ2SP9yV5n1ZpH3rKMyc7phPs+xKt5zC
	 2I91ZcDAdYVk8e/gi1tS/lkPmMg8huCANrlVyerWfhQoG9hP75J2g6sKMpC4oT8tGtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364070;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=1Tkux7y6hn7HPIM0D5nWIk4scaTqerCbT6lSrk552GQ=;
	b=lFJVHKSaWffR5y2h/pvjBICOLsXklGxAL3XDpgOWx5uX4DKYXYvxhorqS21dGpBe9FG3
	 80mO48BxOPfVElVfZwMb68+DhbtJERdWAxPXr/SBR/u4UcmhrC/UK990AO13pFvi5Rzuv
	 NGdiU7UK1v0P0Ni6xoeIfzvc2TZ6yNAcx3JbqeEOHISZ5Ax3lkX2D4EnK+EI/e8Ifg1aW
	 J5I2rDn71p6Kas56tFGIoNR0QfV8vsZ6bPNkNHdGK9Aqfg2SYkJ24Tii49BwvtLjSCZ/b
	 bB4Q8yfnhAfqTJJ4yZQ+k22nNqDLvO5Wv0Tr1gJR7IjYa4R5bjoW7Fz2d9toj6mAsAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=c+6m413h;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C745606A320
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C745606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=c+6m413h
X-UUID: 79cc0a94dd7711f1b1788b6acf885367-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1Tkux7y6hn7HPIM0D5nWIk4scaTqerCbT6lSrk552GQ=;
	b=c+6m413h+SuAy4F8oNtfSxwtNbM4d4Zo8vUtV89mlq/mXMZVUHM1Oclaz2aKxzJ1CMCDXReicHGMATUlZND8mbrJ4eTSASzQTJKofIrjeEmmeEQmAPbv4Dc/IiNpE1PN9/16yRCCTdmjguH26HvoEqAV+77grwo6ys11mgF34NE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8fe14572-cb63-4b2f-bd09-6d3341a93201,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e03f948d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79cc0a94dd7711f1b1788b6acf885367-20261111
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2057607616; Wed, 11 Nov 2026 10:27:43 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 10:27:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 10:27:42 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Yung-lun.Chien@mediatek.com>,
	<jb.tsai@mediatek.com>, allen.chien <yung-lun.chien@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: program the fixed rate table via MCU on MT7928
Date: Wed, 11 Nov 2026 10:27:41 +0800
Message-ID: <20261111022741.783970-1-jb.tsai@mediatek.com>
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

From: "allen.chien" <yung-lun.chien@mediatek.com>

MT7928 drops host MMIO writes to the WTBLON CRs, so the legacy rates
written by mt7925_mac_set_fixed_rate_table() never reach the FR table
and the firmware falls back to defaults.

Program the table through the MCU REG_ACCESS command instead, using
mt7925_mcu_regval(), and log an error if any of the writes is rejected.

Signed-off-by: allen.chien <yung-lun.chien@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe294..9dcd65725d0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -167,10 +167,29 @@ void mt7925_mac_set_fixed_rate_table(struct mt792x_dev *dev,
 	u32 ctrl = MT_WTBL_ITCR_WR | MT_WTBL_ITCR_EXEC | tbl_idx;
 
 	if (is_mt7928(&dev->mt76)) {
-		mt76_wr(dev, MT7928_WTBL_ITDR0, rate_idx);
+		/* MT7928 drops host writes to the WTBLON CRs (reads still
+		 * work), so program the table through MCU REG_ACCESS.
+		 */
+		u32 spe = MT_WTBL_SPE_IDX_SEL;
+		u32 rate = rate_idx;
+		int ret;
+
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITDR0, &rate, true);
+		if (ret)
+			goto out;
 		/* use wtbl spe idx */
-		mt76_wr(dev, MT7928_WTBL_ITDR1, MT_WTBL_SPE_IDX_SEL);
-		mt76_wr(dev, MT7928_WTBL_ITCR, ctrl);
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITDR1, &spe, true);
+		if (ret)
+			goto out;
+		ret = mt7925_mcu_regval(dev, MT7928_WTBL_ITCR, &ctrl, true);
+		if (ret)
+			goto out;
+
+		return;
+out:
+		dev_err(dev->mt76.dev,
+			"failed to set fixed rate table idx %u: %d\n",
+			tbl_idx, ret);
 	} else {
 		mt76_wr(dev, MT_WTBL_ITDR0, rate_idx);
 		/* use wtbl spe idx */
-- 
2.45.2

