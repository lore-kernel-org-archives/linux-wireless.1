Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770712;
	b=nnRTr61hUm57sUBUui9a3cp//tF0q0YJ54xnDEFn/Pr+ikxgHP7CWKSXbZEtPmH4IXkh
	 YasbLAfdjr3sdTc8n9t6PffqAe9JbszijOJ6kxjh8HVD6S21R6Dp1duTXznS75V88eTt/
	 vNnm8vXCwcr0nmC8kA/uXr0y8xjo+IIVCJcOJrwWEM0UzJhZkR9X/Ei01z63RtAyjLGK8
	 ovhzvvZ0TCfA/ueFuMRUwyqKayt+sbZaA0wkHqfUm5Ahf28cVtQC/cH8fWNDGkSi9Tp+8
	 9SKBwzFCl07AJIvGUjpDo7xmaEcXnNv1GJ5CtSAuVTHbItid8I9ELpWhtVDFI/ohpSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770712;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=bvjAP/qK1nO0384LXljBq0cvF2Fr1FzsWxct/uOaDcg=;
	b=GuQiZ8x7qlLEXaQ4hDOHk+p2VCvpqjK8eVoS0qKV6cQnckBtFk+xoUVOIobwEA8Sp6NZ
	 900TyRX3cuFkCP4c+U5mZUNfba2KMnqkUfVY6uEubuCsnzYMcK9xR8Fqtj/Z5LjDLRZqT
	 9NwSAKIQjL+WBhQAj7bfEDchAagczc9Mu/KfUTHbKmcqB0KDuLP3Kj/8N3202aVhnsS+h
	 1PNavV/h+1qJYcOgWeBYtDUl3QmCU+ADKXjEdFwTIqU2fbFXGm9hzj1qeTYFGHyjTfeaR
	 6kMZd/sOljxHtWUavpM+AQRacFnlV5YN2KCSvDkORwIaIcO8HOc3QOhvWzvUd7iOYeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="fe6+oU/D";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0B606A327
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A0B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fe6+oU/D
X-UUID: 91a83818ea4211f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bvjAP/qK1nO0384LXljBq0cvF2Fr1FzsWxct/uOaDcg=;
	b=fe6+oU/DLgbzx8jRaod0ut/5ff2h938uK0kKrvLWg2+/Sb41gxjqS4FCfatA0fGtSxI5YoX7kUNRfS5PAavaofuj56ksgxU5QF8CcH/cVxOLDG+AjHRpOc2GFL4z7d17UtYa29UMlQwhc95VLXuwQQNJUkTMZ5zYkeDGb3gA678=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:08e145fa-38f4-4b27-a30c-941b723e7dae,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:fc03898b-b89a-4698-a5e2-7cf3a434e794,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 91a83818ea4211f1b9cf3d4034dccee2-20261127
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 352284936; Fri, 27 Nov 2026 17:11:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:11:44 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 17:11:44 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 8C370200C5; Fri, 27 Nov 2026 17:11:44 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v6 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per Tx/Rx stats
Date: Fri, 27 Nov 2026 17:11:37 +0800
Message-ID: <20261127091142.4119743-1-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6c37a7e4-a2f1-46e4-88f1-0439be6eb928@nbd.name>
References: <6c37a7e4-a2f1-46e4-88f1-0439be6eb928@nbd.name>
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
  wifi: mt76: refactor chip_config to accept generic commands
  wifi: mt76: refactor chip_cfg commands to be a generic API
  wifi: mt76: add ACPI MTFG option for bus configuration
  wifi: mt76: add PCIe speed tuning for mt7922/mt7928
  wifi: mt76: mt7922/mt7928: send Tx/Rx statistics to FW for link tuning

 .../wireless/mediatek/mt76/mt7615/debugfs.c   |   2 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |  54 ++++-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  60 ++++-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  16 +-
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   5 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   6 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  17 ++
 .../wireless/mediatek/mt76/mt7921/pci_mac.c   |   9 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  15 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |   1 -
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  18 ++
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |   9 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  60 +++++
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  |   1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 210 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt792x_debugfs.c   |  32 +++
 21 files changed, 524 insertions(+), 10 deletions(-)

-- 
2.45.2
---
V5 -> V6: Enable perf_ind by default, remove wrongly added Reviewed-By
V4 -> V5: Fix email title, reduce dup code, more checks to exclude 7921.
V3 -> V4: Add cover letter, fix crash (misuse of deflink) in mt792x_perf_account_rx().
V2 -> V3: Remove Gerrit-only: Change-Id.
V1 -> V2: Remove not needed lines copied from internal commits.

