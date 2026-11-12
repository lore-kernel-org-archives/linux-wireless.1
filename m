Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470168;
	b=E3zR87lzQ4sB7qHQgF7bAsNeBIX44zu6y3qjVUlrlOhWUpEmu6fRbrmsFUwgd1Chu1nu
	 yFDV+lbxUiDaV79KihxOSVxbguiNdOREtqj08SWGezjPcrMgSpTrOlbHzjfu2Hc1nO1iL
	 +Gd+Y927RNJuAnsFp0DNHTdPJnzlQZKW8HERbd30OAKDqV0YqgDJ2Lifd4QUrYtDdGcdx
	 1w/zTURj36Jmw2z2d8/vt6tFn4IsdwTTCC8Dy+RwsM3Rn9Hd0iVc/ebbBjJ2aX06uQoUI
	 kxMHYKJbEkRudi1ntSPO8baEsOyPC7bIxCWao+qtiOjsWs0p9gZtvFlRxbbTVEqy1NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470168;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=Y4DVgx/mGlmuhgHDZE1G28E4DY9y8m7qpC3/caUCi4s=;
	b=w634X9HYe1v3I/v0ksSEufoXOyUn/LGTsuOJKPZjpciKv+9cR5jSNh38oTPGhR2QghLP
	 MtfYTUhvg0xGiHOxSisGFKhz7xsW650l9t1LBYP21ft69fQmfhK4prCzcsX3a0Vm8h25U
	 lDs6efaB+JY10tIZZD1n+7299XeAC9e/TeHux08we0a9YOf0hX3F6huJwyjk61ZwznmfF
	 J3p2JHAF10ex0Xg3LKgIg1NsagH//VFdBlcHkxZiBWiuXJSu0iniEqCYD82RhIw+kNJrt
	 DYtGDDOBe5dD2Sb+dEghiMhu3xLoXRjH5JxxDkB60gT19Nfq8Jc4rHxR/6zXEuxOSKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ykkvmp7R;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26430606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26430606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ykkvmp7R
X-UUID: 80ed3bdede6e11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y4DVgx/mGlmuhgHDZE1G28E4DY9y8m7qpC3/caUCi4s=;
	b=Ykkvmp7RyBzRhVAvRbX6KRMjj4pC6oSYmA0uUIJV/cS0fzy24aMnsZi/rDWF+OHJ5XPislMka7W/IHF319gXlIjMriyg0Mxouz7Y3Q3yA2cPZLmcDGhMKDP4aQQhjoep5hH6vdtyQG/+3M2/80calI1piRLjwTpXZPM6l3nNEAQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:789b56fa-0bee-477b-abad-ba86c6341d45,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2a9dc675-ed77-40ef-9f03-2ef866e69ea9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80ed3bdede6e11f1b1788b6acf885367-20261112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 799721939; Thu, 12 Nov 2026 15:56:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:56:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:56:00 +0800
From: Michael Shih <michael.shih@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.Lai@mediatek.com>, Michael Shih <michael.shih@mediatek.com>
Subject: [PATCH v5 0/2] wifi: mt76: mt7925: per-channel survey dump during scan
Date: Thu, 12 Nov 2026 15:55:55 +0800
Message-ID: <20261112075558.1813785-1-michael.shih@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260831032832.83338-1-eason.lai@mediatek.com>
References: <20260831032832.83338-1-eason.lai@mediatek.com>
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

This series improves channel survey reporting for mt7925 so that
"iw <dev> survey dump" shows meaningful per-channel airtime.

Patch 1 adds a stats debugfs infrastructure (shared stats.c/stats.h and
the firmware MIB plumbing) that patch 2 builds on.

Patch 2 wires up two channel survey accounting paths on top of it:
 - the home/operating channel, settled from assign_vif_chanctx() since
   mt7925 is firmware/chanctx managed and never goes through
   __mt76_set_channel(); and
 - the scanned channels, folded in from the per-channel airtime carried
   by the firmware scan-done CHNLINFO event.

After the series, both the connected channel and every channel visited
during a firmware-offloaded scan report non-zero active/busy/rx/tx time.

Changes since v4:
---
v2: (1) Remove redundant code to fix build errors. 
    (2) Move UNI_CMD_MIB_DATA enum definition from 'mt76/mt76_connac_mcu.h' to
        'mt7925/stats.h' to avoid redeclartion with 'mt76/mt7996/mcu.h'
v3: (1) Remove redundant code to fix build errors. 
    (2) Move UNI_CMD_MIB_DATA enum definition from 'mt76/mt76_connac_mcu.h' to
        'mt7925/stats.h' to avoid redeclartion with 'mt76/mt7996/mcu.h'
v4: (1) Fix inconsistent indenting.
    (2) Fix array offset 'band_idx' as to before use, not after use.
v5: Adding the second patch for supporting channel survey command: "iw <dev> survey dump"
---
Michael Shih (2):
  wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
  wifi: mt76: mt7925: support per-channel survey dump during scan

 drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 173 ++++
 .../wireless/mediatek/mt76/mt7925/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 344 +++++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  12 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  30 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   7 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/stats.c | 884 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/stats.h | 315 +++++++
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   6 +
 13 files changed, 1778 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.h

-- 
2.45.2

