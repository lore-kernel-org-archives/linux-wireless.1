Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885949;
	b=1qdBv5AdNAehl8GbKw+ZrOcDRK65XWnhn8QL1H9xrouEg93LSrEKXnXaLfbOAvFoA29D
	 /r2FqvE0Q71tg1F1y1ZIoVGoSzb9dwKf+FTgL0HzcfzUsNxrMPMlmiZBvznAEaexiwetR
	 xpuuJt9OTGBDxtvvPwYIILKgRk24pcLbBJIzkSFDaSETbrs30IZfCc0fgkmLrN9UPFStl
	 3g1DWRW510b2PXrd024HXLfj+ZItvnTNEy4F7sENRY9xK58AQXY0QW673W6jydcRg114Z
	 rgy67NSg9Y52hOGAhNi46uXBScvhI5TnzNdq1CakYHEPDENMA6oSmmt36UxzZ6LOL4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885949;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=x62Zg6VLsYh9Iboa/Dsaz93j2H4OtK6uJ349Z+lx6YM=;
	b=gcDFdrwHBDtnvKTBpkmQ9RYkq8KE+yGRSb7FaBdyOu1tnDhC7NYWD/QPbquKCm3dA/CI
	 4pgJe1C+aRqywo3BBJmK45q6uPbXrs/Gpo5N7/spIHcbcUDSbTOT9p6yC8ep2y9P5tTVL
	 DbXo/Szl9jkRwRUYKgmuDklwlfNYskyRJjSzyl6SVJfGWh0MX8oGDbBs9hIIPLLazj0WH
	 bH6Qv9qvY4qirSk8CJVvsijaxQ5VKqs/LUAzab9DbHWe53s3jErfUjdhQlaIkZ+zVVw4o
	 3jDOIKMJozpEIR8JFRbwGobQW5GEATlejquH8wAIuPU5gqjHejuZztp0lo/uhkPGc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="ZuAEWle/";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17793606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 03:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17793606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ZuAEWle/
X-UUID: 8ec273cae23611f18dc8c9802ae25ab1-20261117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x62Zg6VLsYh9Iboa/Dsaz93j2H4OtK6uJ349Z+lx6YM=;
	b=ZuAEWle/BVyVbGFUV5EvNSfgzhC5Mr3I4pYAyqyJiqbaGMT46wmp3CTSmX7+4IF12y7S07YsQBnlkL5WWCQwyvKW/Hbdz6LEfGg8Z7R74lfO6rKmFcSxKlm40bC7F+8Z//5nG3qspgH6yr0mJryOK3HppAZiWI13QHbJ/P+RWx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8718fd3b-71c4-4748-86d6-8da713eee205,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:7a906466-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ec273cae23611f18dc8c9802ae25ab1-20261117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1440044056; Tue, 17 Nov 2026 11:25:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:25:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:25:36 +0800
From: Michael Shih <michael.shih@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.Lai@mediatek.com>, Michael Shih <michael.shih@mediatek.com>
Subject: [PATCH v6 0/2] wifi: mt76: mt7925/mt7928: per-channel survey dump during scan
Date: Tue, 17 Nov 2026 11:25:28 +0800
Message-ID: <20261117032530.470475-1-michael.shih@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261112075558.1813785-2-michael.shih@mediatek.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
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

This series improves channel survey reporting for mt7925/mt7928 so that
"iw <dev> survey dump" shows meaningful per-channel airtime.

Patch 1 adds a stats debugfs infrastructure (shared stats.c/stats.h and
the firmware MIB plumbing) that patch 2 builds on.

Patch 2 wires up two survey accounting paths on top of it:
 - the home/operating channel, settled from assign_vif_chanctx() since
   mt7925 is firmware/chanctx managed and never goes through
   __mt76_set_channel(); and
 - the scanned channels, folded in from the per-channel airtime carried
   by the firmware scan-done CHNLINFO event.

After the series, both the connected channel and every channel visited
during a firmware-offloaded scan report non-zero active/busy/rx/tx time.

Changes since v5:
 - <fill in what changed vs v5 before sending>

Michael Shih (2):
  wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
  wifi: mt76: mt7925: support per-channel survey dump during scan

 drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 173 ++++
 .../wireless/mediatek/mt76/mt7925/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 345 +++++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  12 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  30 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   7 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/stats.c | 884 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/stats.h | 315 +++++++
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   6 +
 13 files changed, 1779 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.h

-- 
2.45.2

