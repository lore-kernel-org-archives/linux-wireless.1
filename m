Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468696;
	b=Vq8SaSWr8Asfr8Sktw2PoH75I3DW+ugu/ALoTZFr52BbEReiQgSvgb3OsSzroHmLCuzC
	 78JMi5NDj1FzmvTlJg9wRNGNOJ3ckwVeSjXALtc96tMjR909sFP34I0kVeHnXmjdLZfn0
	 fIHlkVdo2YELjXlJVUrkhCiLcEqzm0NA6Wkr/hL/04qwHCVNnTvJVRC7QztSChIRIGJch
	 cN4p8E9INyqltQ41vAJESr5VmnQp539g3fpiLDojt87sqYHR1kjkkhl1RsrkX568pw+Hi
	 QN9zzvq3bzlOtRxHdnzAaIYSrpkBjKI319nQiAAELXqmRBelawLtMBn5k3k2uE9LydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468696;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=2pI2qUJfyIRhJ5YXQ0suS5d2nYo3nqfrvbF+nFQsyXM=;
	b=D+g/QbzdqmQu0RQiFfXjO3urlQ3PvMKpbItjibATWqgZezz4WfRW28fTVBMIJOuRzmSf
	 fO76fbdJe09Lw1ipKtk0P6rW6D8TgahGz2Yzpseq6wheACtr1yC1M7cvwJCGI/ZPImQRa
	 BaxCuxLw3VvQGaxXsY3iEkx6jDvKzMuRziR2ndpvl8O6oMWHzIGZfMzlBdRZMxjwpbXZX
	 h/TAdROxtGQyW8V5+J+e0Mmq5xYV/JnGCQL1kufTopOeZPwUj55jcyFe482JNjO0ZZ+nG
	 SkO4nL4wy00T+DSDlffEHiKfviPxdoe35CrqTLXQoBT65yUTnf4tRFnQryZkJ3WiBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oqc0vXr6;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA61606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oqc0vXr6
X-UUID: 1407c62cde6b11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2pI2qUJfyIRhJ5YXQ0suS5d2nYo3nqfrvbF+nFQsyXM=;
	b=oqc0vXr6v/QSASYWvsjWtc5sta2PNkdjpZzfmlJmChpIrDhfj0Hcq6g7M7dwODOcsdpRNOrgkT6u9bxJaik2+bIqWbcAEGBcc0c3t8Jiiqrq+6Q7WhZLdtONg5tgSasacL5lED8NHOKhQCWXxjIqajuWAfOfYMnkSCNiYmlPpLo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b1610618-e193-4d1d-9dc6-1dad42b9d119,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:97bfbf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1407c62cde6b11f1b1788b6acf885367-20261112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1021494789; Thu, 12 Nov 2026 15:31:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:31:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:31:29 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac: read token_count under token_lock
Date: Thu, 12 Nov 2026 15:31:27 +0800
Message-ID: <20261112073127.1798821-1-jb.tsai@mediatek.com>
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

dev->token_count is always updated with token_lock held
(mt76_token_consume(), mt76_token_release() and the tx token cleanup
paths), but mt76_connac_skip_fw_pmctrl() reads it without the lock,
which races with the tx and tx-free paths.

Read token_count under token_lock. All callers hold pm->mutex and run
in process context, and token_lock is never nested with pm->wake.lock,
so spin_lock_bh() is safe here.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 9af25eb48531..4e373dadf640 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -415,7 +415,10 @@ mt76_connac_skip_fw_pmctrl(struct mt76_phy *phy, struct mt76_connac_pm *pm)
 	struct mt76_dev *dev = phy->dev;
 	bool ret;
 
-	if (dev->token_count)
+	spin_lock_bh(&dev->token_lock);
+	ret = !!dev->token_count;
+	spin_unlock_bh(&dev->token_lock);
+	if (ret)
 		return true;
 
 	spin_lock_bh(&pm->wake.lock);
-- 
2.18.0

