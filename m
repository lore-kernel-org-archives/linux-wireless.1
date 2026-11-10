Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280424;
	b=pbheLEJUvJWkFXnV2lIa+K8z5cq2xPu5KiNik+/twTIFbhoAgNCPIXKNCpIPs0JvS0aY
	 FdT+E/MFJy3JsNxSYH7WRlGkS8GM1yAKUhn6xD+aJkhY8jcpBbdPtBzDyiF6+SEke5oLj
	 voUiPmJqLz57jQQp/BMYjtPbXuJD9clu4k0srUaG2sylvKFCVLQrVoW9eoDrZD6XqhGze
	 hHxJASHrevAn30o9BLJxWq6RbI4pe+yI2xkEB2cPAXXVUPnZZvS/rKulmwQZTJ1GZv77A
	 FO8WbPJNorTr8TC8wiyCBRVXZUD0h4U2WpQHsXmP4PhiQarZSfsjczX8LjffYmq5Zew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280424;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=gfBjn7V58vsH0PrcY9yeUWUQHzWPMVpSYFvaanr8Fl0=;
	b=Oaxs+cuWbWAJYz026ZqVg2hRXVqd+xHxlRkjHRvHouoNiLG4PWZAfWmnwMxBV9+zgoF5
	 Fh5mQJpAfp5zruhH9EPvZudvFZmNTuoKKIX3Fqivog3ath5ACWWqSAwWn4wIA/4fSuhc1
	 tfuuRtjkyCocuRa6U2iXE8H1fGy3TRPv+i5btYV39u+rhaffP7omDNesJbsR8lusNlNso
	 nZpAuTLgZiVdjMRi3NR4JSOE8wGpDeB8jhfjlEUkvcEw/Tau/gMGOLykyapASoUlR9JgQ
	 mCgk6TLuGrhpzGB56Cr3ZRqgp/e8I4Rg2Qddri3KpLZqmipkct3E6hl5qJAMEX3DNew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=J41PAbsw;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1C606E63D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A1C606E63D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=J41PAbsw
X-UUID: b8613ce8dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gfBjn7V58vsH0PrcY9yeUWUQHzWPMVpSYFvaanr8Fl0=;
	b=J41PAbswibVST1TQ9PfjLkq8UKUklk5yq0bPCvhZgY209L5R+CKVRM00Whxt1JSS9dZvqXKi5JbOOP6IAVKeNxcZbjy3iGM6Ornk1J1FxHbeXPwlT2dS4M+Ql415dJbLT0tMKtBude+L4rcE6j8UjMIrnB/kMolVL2kOHtqh4Ds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9b610f2b-ff55-4da5-bb97-181961e09581,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:152b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8613ce8dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 619048846; Tue, 10 Nov 2026 11:13:37 +0800
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
Subject: [PATCH 24/28] wifi: mt76: mt7925: skip re-adding the primary MLD BSS_INFO in chanctx ops
Date: Tue, 10 Nov 2026 11:12:40 +0800
Message-ID: <20261110031244.369014-25-emery.hsin@mediatek.com>
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

The primary link BSS_INFO is already sent from the sta add, assoc and
remove paths and from mt7925_mac_set_links(), so the chanctx ops no
longer resend it for an MLD station.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c    | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1192a01006bd..00244a650464 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2914,7 +2914,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
-	struct ieee80211_bss_conf *pri_link_conf;
 	struct mt792x_bss_conf *mconf;
 	u8 band_idx;
 
@@ -2922,12 +2921,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
-		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
-
-		if (vif->type == NL80211_IFTYPE_STATION &&
-		    mconf == &mvif->bss_conf)
-			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
-						NULL, true);
 	} else {
 		mconf = &mvif->bss_conf;
 
@@ -2961,16 +2954,10 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	if (ieee80211_vif_is_mld(vif)) {
+	if (ieee80211_vif_is_mld(vif))
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
-
-		if (vif->type == NL80211_IFTYPE_STATION &&
-		    mconf == &mvif->bss_conf)
-			mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
-						NULL, false);
-	} else {
+	else
 		mconf = &mvif->bss_conf;
-	}
 
 	mctx->bss_conf = NULL;
 	mconf->mt76.ctx = NULL;
-- 
2.45.2

