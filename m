Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280411;
	b=AI5SAyEvnyqagizcHIZdtbhewRcH+0Qbv7HnuMdbfxBYufZ36WLSN3s6ud3+d8tk1LeG
	 N6tfmVca4dWcy6wjlw981BVZrZDvfYVUOmDOFTToffSWbrY4YYxCH1Vqt933Qcqu5AVXo
	 WwhnJ6TSuT1p7CqYYXgXJLoew4pnm8luhgaNKeN7Q3q9y1zS2ucctHXxMtPFxEYa6kd/n
	 KwLbc6X+R3rTcUQgv7JLql36/pwD0aJKnWuGUXWblU0vPNx4ijdg7l6Oq81RkCxUyso+1
	 gCsrfHGfCYiYto28E1B70xzgHozuOvQUmHiGtPtOhTpVh/EIo6+r1o3Ba9Zdz0a/tNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280411;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=CUbhWIBW6/Te9hvZwpZcIzzgttBQgh/qmqRi+xQc6Gw=;
	b=fL5w7k1ItiK3IjKt2SsqrRUb9JbTCvSrq5QWMK3NqgJclh2Ghmagz1hWYz1QC4uvHy07
	 RITURsbJwt/aLItzvUlkNZ3Mn/No63Z23V2p9i4ff1pAhotFJP7IAKgzac2FZr+zYLJnJ
	 vT3WWfyUIR3FGv567lY9F26TE7q4kn+30tk3yAt32XvVQ9aRJGFdWhUoD3KmW5dW0H8LB
	 xde6whLaT6h03BVATHFqOJf+9e0TNI6kkwiqN8VMhFhTKYArL0Mv1pXhwnX83wvmMsrIG
	 g2wz/c1gTA7Op21iFOXh517tiKE5hYafquthiDCdXqhGknLxVehTOuj3ZSNx+8Gm77Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CIt98AuJ;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16960A2607
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C16960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CIt98AuJ
X-UUID: b0803038dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CUbhWIBW6/Te9hvZwpZcIzzgttBQgh/qmqRi+xQc6Gw=;
	b=CIt98AuJ5d6t7HpwVTSLsoHQXVkW+9acI7+r9PweiIJ19t5hmjlZzNlP0xbOXMedeivd3EYA8+XvNNvYq3r5k3ouHtcKmuoMShU09HU7GzHY/GlxF6LE/vJqj7dA8DxYUpHiCVgKfs2IA/j7J1obRPzFcIpHu478KF9PHhsb6bw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:524bf784-9559-4d25-98ff-34b9b057592b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:37af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0803038dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1516161551; Tue, 10 Nov 2026 11:13:23 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:22 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 01/28] wifi: mt76: mt7925: fix the basic rate sent in the STA phy TLV
Date: Tue, 10 Nov 2026 11:12:17 +0800
Message-ID: <20261110031244.369014-2-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
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

phy->basic_rate was set from link_conf->basic_rates, a mac80211
band-relative index, but the firmware reads it as an absolute HW rate-set
and pinned the MMPDU rate to CCK 1M (illegal on 5/6 GHz). Send the band's
HW basic-rate set instead, like the BMC path.

Fixes: e7a9853e6b8a ("wifi: mt76: mt7925: extend mt7925_mcu_sta_phy_tlv for per-link STA")
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index f45b0d81fd08..de4c95006c4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2059,7 +2059,9 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 							    link_sta);
 	}
 
-	phy->basic_rate = cpu_to_le16((u16)link_conf->basic_rates);
+	/* Firmware expects the HW basic-rate bitmap, not mac80211's band-relative one. */
+	phy->basic_rate = cpu_to_le16(chandef->chan->band == NL80211_BAND_2GHZ ?
+			      HR_DSSS_ERP_BASIC_RATE : OFDM_BASIC_RATE);
 	if (link_sta->ht_cap.ht_supported) {
 		af = link_sta->ht_cap.ampdu_factor;
 		mm = link_sta->ht_cap.ampdu_density;
-- 
2.45.2

