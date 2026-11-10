Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280392;
	b=t4lcr9jhstFah7pOTCUEBqhycZsMg1LHYmdqUC9lAitldiIywN4SnisR5rfqzAKlBsqB
	 ANF/d+2oNM1BChA+9vOIdV+SuPJmMYxT/wV7qO8ReHGMzAmVVQdV0V4q6PPDsjDhWJejx
	 U9ZgFAYizyGNB2dWROkzM4LDOMNL9u5zFAA7lZneqc25foTWEEb+2VVZlAI8bFdu/NP3v
	 2p5kqFF5WodDxSiJcjJhkRjs+DuRAHeVLTXNicGjyLVCzYgQIWSu+pEr8/wUbpyfvexwy
	 twctNgnH9h+rgnXIoEWumalBA90vsq10wIPChOGdOigpXA0GYz4vz54C+z0FOz+s8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280392;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=b6mO35zQsUgdCke45nS1F0bWlUCIY7+zrG0PT6o+9Is=;
	b=zqPOtR8OHImZFVUxWNDBqS6P7FLtWiTDrMvJjvLEC/FFW70fOoIX4OTpZpnHD1s9HIaA
	 RCKeUmwwXdDZNCAWVene5ROC9oxx/ChG1uC4byGsBu3Dh+D8OUYeSyui0JU4jaKr5Ocx2
	 giHtIJyTXRqQHXtPQBOK/9FEr7yCedV4Y1atpNnDIo1hntrg8k3bQBKHDnTviq3SLZ6Xo
	 h9K+esOWyBx3FLSP2XZ8Y8ih8a3s9Pp2HzDDtFcvgkr5+Qw/5YDacbtGKNEuyH5N0xZlF
	 UmFR5FJsGxgVIFcRCNibxXhRaRlQFX6GvpUjkIwA+rlCLhXaexnuJV/3sG6/IBPPG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XsGx8rs7;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4FF606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XsGx8rs7
X-UUID: a3ee822adcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b6mO35zQsUgdCke45nS1F0bWlUCIY7+zrG0PT6o+9Is=;
	b=XsGx8rs7qiNe4rwoJ3H1dj+NpNCbvFMAxbIrvfbVv8b/KEIeIzNbISmb3D62n9aXITpeAvYimFhJsZukBZ5NXo2ycgDf6TrBNhs8nU0AYZoaS9jCeb8IQoqg7sScZMDV/wnH5meCjFCHWelfXoBXPPwJzTimar/J+9/kESdmdvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9dc22d0a-77f8-42b3-8576-b28f12455f8d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:20290f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a3ee822adcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1007493954; Tue, 10 Nov 2026 11:13:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:01 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 00/28] wifi: mt76: mt7925: add MLO hybrid and EMLSR support
Date: Tue, 10 Nov 2026 11:12:16 +0800
Message-ID: <20261110031244.369014-1-emery.hsin@mediatek.com>
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

This series adds station-mode multi-link operation to the mt7925 driver:
three-link hybrid MLO (one link per band) and EMLSR for APs on a vendor
OUI allowlist. Hybrid MLO and EMLSR are gated by the chip capabilities
the firmware reports.

Patches 1-8 fix the basic rate sent in the STA phy TLV and a sub-link
memory leak on disconnect, both with Fixes tags, then prepare the series
with no functional change: named constants for chip_cap, the DBDC band
and the HT secondary channel offset, a link STA wcid unwind helper, and
a gated mt792x_mcu_set_dev_active() also used by mt7921.

Patches 9-10 deactivate the DEV and BSS on disconnect and reactivate the
DEV before a reconnect, scan or off-channel operation. This covers the
MLO to legacy switch fixed by commit 8f9e5807671e ("wifi: mt76: mt7925:
restore the legacy BSS after MLO teardown") and replaces its BSS re-add.

Patches 11-19 add the firmware interfaces the link setup needs (the
third-link band limit, the EMLSR OUI allowlist and a multi-link
remain-on-channel) and keep the MLD consistent as links are added.
Patch 14 replaces the pending link parameter of commit dd3f17ef69ed
("wifi: mt76: mt7925: keep MLD membership consistent during link add").

Patches 20-28 bring up all links at authorization with one MLO ROC,
install the existing keys on the added links, apply the link state the
firmware reports, remap hybrid MLO TX to the primary link OMAC, and add
a hm_alg_ctrl debugfs file to override the firmware link plan.

The series is based on mt76 commit 8739e5b44b23 ("wifi: mt76: connac:
bound the scan IEs in mt76_connac_mcu_hw_scan()").

Emery Hsin (28):
  wifi: mt76: mt7925: fix the basic rate sent in the STA phy TLV
  wifi: mt76: mt7925: fix MLO sub-link memory leak on disconnect
  wifi: mt76: mt792x: turn chip_cap bits into an enum of bit positions
  wifi: mt76: mt792x: use named constants for the DBDC band
  wifi: mt76: use named constants for the HT secondary channel offset
  wifi: mt76: mt7925: factor out mt7925_mac_link_sta_free_wcid()
  wifi: mt76: mt792x: add a gated mt792x_mcu_set_dev_active() helper
  wifi: mt76: mt792x: route DEV (de)activation through
    mt792x_mcu_set_dev_active()
  wifi: mt76: mt7925: deactivate the DEV and BSS on disconnect
  wifi: mt76: mt7925: reactivate the DEV before (re)connect, scan and
    off-channel
  wifi: mt76: mt7925: parse the FW hybrid-MLO third-link band limit
  wifi: mt76: mt7925: gate EMLSR by AP vendor OUI allowlist
  wifi: mt76: mt7925: support multi-link hybrid/EMLSR remain-on-channel
  wifi: mt76: mt7925: describe the whole MLD in the STA/BSS MLD TLVs
  wifi: mt76: mt7925: assign a per-MLD firmware link index
  wifi: mt76: mt7925: share the primary OMAC across MLO links
  wifi: mt76: mt7925: carry the STA decap offload to later links
  wifi: mt76: mt7925: split link sta add into alloc and commit phases
  wifi: mt76: mt7925: publish every link before sending any STA_REC
  wifi: mt76: mt7925: add mt7925_mcu_add_bss_sec() helper
  wifi: mt76: mt7925: only refresh the SEC tag when setting the first
    key
  wifi: mt76: mt7925: add mt7925_set_links_key_iter() helper
  wifi: mt76: mt7925: bring up all MLO links on authorization
  wifi: mt76: mt7925: skip re-adding the primary MLD BSS_INFO in chanctx
    ops
  wifi: mt76: mt7925: apply FW-reported MLO link state
  wifi: mt76: mt7925: remap hybrid-MLO TX to the primary link OMAC
  wifi: mt76: mt7925: clear the MLD BSS tag on deactivate
  wifi: mt76: mt7925: add hm_alg_ctrl debugfs to override the MLO link
    plan

 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   4 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   7 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  14 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |   2 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  41 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |  23 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 843 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 628 +++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  26 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  33 +-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/regd.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/regd.h  |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  56 +-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  23 +-
 19 files changed, 1251 insertions(+), 476 deletions(-)

-- 
2.45.2

