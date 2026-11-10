Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280424;
	b=nhYMwcFyS9FLy9u3kZKH7RnJAl4YnWA6VGLKkECBSfjYyJHuZiF3MYgSGaazrllHKrWx
	 1RcZ9I1idATg7euwebUObsG0Fif7p0w0BDzMxHb4dKdCy/5eY7yRvkCbXIYvuTCqIDlBx
	 +LobqWdeyZ4OXA6o8KlSA7YvdJ2aOc6Y0LYybDJLrvLn0yYZQXWPhsFjrffaQTPl4cFAw
	 0uqlryuU21Fb8eFUTPa7j068sk8rbk1hLLSzQcWf7SmxPITIR3dmWu20DAf+yThS3bydy
	 seoe5pv1KpndpG1uRR73nO6fTrPz25mEsd1wVoG+2WRoitQzejqez+PL90BG/STh29w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280424;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=mOclOdLtwD0RZuWcwJURIXNVb1vabSOVh2+DSfAelBQ=;
	b=cdEUiUL6w+Wg2riQscDjlSVp/RAlQ1ft0qjjOwz9LXMAvmkIhklQnKYWNbTS6fUMPVYr
	 0SuLlh4J4lm5Yxp5znSQIhqX5XrzoYpfj7g7yCmiFsHeBiWLNEu63kZQmW5LgBk+N+p50
	 qSdJ91/dwY6QFnrCESUkduupdY8D3fgZTiIviqj0qaJ8MFxrz0f9ZqqWL9hHV6kWZyhDK
	 dDSuv/hy0WG7/1vRmJkfNr+yyK/0XtbSKBMgREDUBKnb5E42S3pCz4IQHZk2tryAqziAQ
	 3BygwxO8dkdAr5Epu56p3GDwfprwSDYBR0FBQawzeFIJinqEzDSCU7XWfMqwGcjZuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lsluEGbj;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099A606E63E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C099A606E63E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lsluEGbj
X-UUID: b79efa02dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mOclOdLtwD0RZuWcwJURIXNVb1vabSOVh2+DSfAelBQ=;
	b=lsluEGbj0SHQUXwhj1tXbiFcLJNceqIiPEG9qnFw2G9SM9kARTeyBT0q99kPjPop3N31dJsVjZ0lKfkvjdcbltNW+1SaHryq5yJssgr+hZPdjknQ8iewFcFV13fc8WyUtQO20p5ceB8VVPqqPbYdHJHd8yh41rzzcH/nRziSPVs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1a6d9efa-3718-43fe-8ba4-53ad8b8824bb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:1d2b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b79efa02dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 20578368; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:35 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 17/28] wifi: mt76: mt7925: carry the STA decap offload to later links
Date: Tue, 10 Nov 2026 11:12:33 +0800
Message-ID: <20261110031244.369014-18-emery.hsin@mediatek.com>
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

.sta_set_decap_offload() runs once with only the first link present.
Remember the setting on the sta and iterate msta->valid_links so a link
added later inherits it. Iterating the sta's links also avoids a NULL
deref: a vif link may exist before its per-sta link_sta is set up.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 ++++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 01d7526dbfa9..3af433d1e608 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1087,6 +1087,10 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (link_sta->sta->tdls)
 		set_bit(MT_WCID_FLAG_TDLS_PEER, &mlink->wcid.flags);
 
+	/* links added later inherit the sta decap offload setting */
+	if (msta->decap_offload)
+		set_bit(MT_WCID_FLAG_HDR_TRANS, &mlink->wcid.flags);
+
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
@@ -1932,7 +1936,7 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	unsigned long valid = mvif->valid_links;
+	unsigned long valid;
 	u8 i;
 
 	if (!msta->vif)
@@ -1940,7 +1944,11 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 
 	mt792x_mutex_acquire(dev);
 
-	valid = ieee80211_vif_is_mld(vif) ? mvif->valid_links : BIT(0);
+	/* remember the setting, links added later inherit it */
+	msta->decap_offload = enabled;
+
+	/* iterate the sta's links, a vif link may not have a link_sta yet */
+	valid = ieee80211_vif_is_mld(vif) ? msta->valid_links : BIT(0);
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt792x_bss_conf *mconf;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 458f6f1fd6cd..96d4dfe8ee45 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -167,6 +167,7 @@ struct mt792x_sta {
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
+	bool decap_offload; /* remembered, applied to links added later */
 };
 
 DECLARE_EWMA(rssi, 10, 8);
-- 
2.45.2

