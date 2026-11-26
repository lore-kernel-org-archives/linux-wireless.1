Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686908;
	b=t9T2LjV2dJn/XyB0F1Jm3EhCwVDit6G9C3kHcZ4cy1MkqY622qi+rz50+3YZtDdM26U6
	 v7WKvH/5SWd6LJ62N7Mih9GkPMu1ZgvQ7e6L5pF6gQx1mN2dxS1Wats320J2/lNdEcvaq
	 Sry1lOa+STWIdGoeSw7b+QMrXtpbI2+kFSbttM6DCjMw7oD6kGqhE0Q3VRxriBq/tsG9Q
	 0ymBRHX47yB6Iz35/lrl94pkrGtI0oIbR0/MqIE5IZxrTWJhVNAxi/rsXd1ZjXjk5YZIn
	 2zgBUNXa2dfuGY0I8oKpbbMPlW4Wll7QkRXQyyIzNAlTKCAToiYIsuSOPHpVWXco7BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686908;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=ZpEvfrOsnzxI0Usk6ogp8zsWy48ijEzIpAKQBgY7nB8=;
	b=xd6nMHzel1XG3x3epgryzx7OEOLjTjV6f+mH/vbYqDjwNYfuOUlg66CtDDU8wTtgH1hW
	 eLGG/JYRTCVujNowhSByEuwU8h+baab5IQA8b3TYio5O5AYf+cHo8C8WEJrw8UQob0S4y
	 Ig1DpzfI++/IcxJUf3QJmE7I9n/KeTwrW+47JyaDxyxXsgvr2yt5du7TamSx6cw6TOaYk
	 O8J1w15OypLPXl1Z0mgZ+smShRbtzO62WRjzrUdcER0CCnpRhTb1OCCW42BRR5/NgwQRy
	 DrCkHeA48cbp4/VEMFKB7gCUolocQal0h9l05L/+AToYOai7oh0pMyS/PGbyy9rnxcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ARXAcOco;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D3E606A330
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D3E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ARXAcOco
X-UUID: 714953fee97f11f1b9cf3d4034dccee2-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZpEvfrOsnzxI0Usk6ogp8zsWy48ijEzIpAKQBgY7nB8=;
	b=ARXAcOcoHPLeGoIw6+Bp2BJ3CUPURXWCFzZ/E06NtJB3DBLUn+I/ksouZYUXYZBk85Mxj9hEhnla1eGaoym9mb238NUlsTgyphsL++tMrNOvKwR2K2z1haSA/fAAp/1C78JMwGmnOhoqbyy/GBoWIADS2k+JNTeGcu/r8rp8Hn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:580aee18-004a-487c-80fe-7715b81bfe8f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e27b171a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 714953fee97f11f1b9cf3d4034dccee2-20261126
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1765193850; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 675AC200C5; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per Tx/Rx stats
Date: Thu, 26 Nov 2026 17:54:50 +0800
Message-ID: <20261126095455.3280998-1-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
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

This series adds:
1. Read the HW charactistics flag from ACPI BIOS.
2. If the HW needs, collect and update Tx/Rx statistics to FW.
3. FW can then decide how to adjust PCIe link to improve T-put.

Anthony Liu (5):
  [PATCH 01/05] wifi: mt76: refactor chip_config to accept generic
    commands
  [PATCH 02/05] wifi: mt76: refactor chip_cfg commands to be a generic
    API
  [PATCH 03/05] wifi: mt76: add ACPI MTFG option for bus configuration
  [PATCH 04/05] wifi: mt76: add PCIe speed tuning for mt7922/mt7928
  [PATCH 05/05] wifi: mt76: mt7922/mt7928: send Tx/Rx statistics to FW
    for link tuning

 .../wireless/mediatek/mt76/mt7615/debugfs.c   |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  54 ++++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  60 ++++-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  38 +++-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   8 +
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   8 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  47 +++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   4 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   1 -
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  14 ++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |   8 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  57 +++++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  |   1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 211 ++++++++++++++++++
 20 files changed, 526 insertions(+), 10 deletions(-)


base-commit: 86b8d5b18d9712ae0001f078d1893c2dceac0bdb
-- 
2.45.2
---
V3 -> V4: Add cover letter, fix crash (misuse of deflink) in mt792x_perf_account_rx().
V2 -> V3: Remove Gerrit-only: Change-Id.
V1 -> V2: Remove not needed lines copied from internal commits.

