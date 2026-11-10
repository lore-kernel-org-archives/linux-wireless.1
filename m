Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280423;
	b=k0Yx5ZYLlMGJNjtNu4Q0unam2Xrr9NIZkxAZT5kC2cu89vr/24ZI+eGWkLpB4HKBCzYK
	 Io/9YY1vZlSTVk5TPA+A6XlFepHO26M1IWrsix/ik6vZ6x5OukFZwsYJYi0l681/zFyDi
	 Mcu0kvUKFLcazbMyP/FEogAgUD4w4YzmtB+snankRVnTduMOCjZh3R39QATdLYCi65xHf
	 eHwqtfHimZwlDkKH+prrCuztDKZWpJ+XyUPGgXObuxFRA7g3lF3jWec2dRIvSPsAE9vsR
	 B5mJpHVW7R6sNrzpJHuImwckvJNCy8bYMZAyjGkFx0lrKEKSDqEbbx5MpZr/Js7pNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280423;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=IuKU3+chqCFwUQVl26cUdfzsRFANDcdm51UBlZHH+rw=;
	b=HiJVeXyySCZvK2DpH8bkCCFfOswy+JL5Qd1xCVzmYN2T4XGvfJbfAb6P2hg4O8+WKZ5U
	 dJ3eToqL3nuLdzlv7LGq9xBnI2n/nT0J3V2bJSlzmXWRXdUqgywIjfGyKNjSxftg3yPZm
	 nxfIwQl4SUaY9HnwboIDK8dDCIFENvenzAFhJr1FYvRKVHVqQhdnW8GcX1bw+Rtjh6Lz2
	 vn5LpH7bE9bkP39NMN2n1LxaOXHKVpCbzWEme6PiRiOBtuc68BuC0sXvVrBUr+NSvU9uf
	 vNVHh13XcVWPGhUIEe+yhtoLe/AVtZwW2qZJLh5G0ySd2wZUAcziAQmQOa9ihKslqZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="nGFtcw/V";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE5606E624
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBE5606E624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=nGFtcw/V
X-UUID: b89bb490dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IuKU3+chqCFwUQVl26cUdfzsRFANDcdm51UBlZHH+rw=;
	b=nGFtcw/Vc5k+K4h2BItKkGCQ+0DKlnWkr+NpNXFl0pldzw5Vop1fOlu2sGF3DbR5zFY+JCaEyST17erhIPmSuTJrK/x5O5Kymyw2suU8Z2wcEazffjWLjNtYrIRoTQoWSvXgYs27Kwv61EPN2Ng43aPjt9B24yST2jeYIMiUa2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:99d7d24f-6757-4ff1-9567-fd3e6441053e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:1c2b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b89bb490dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1377553987; Tue, 10 Nov 2026 11:13:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:36 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 27/28] wifi: mt76: mt7925: clear the MLD BSS tag on deactivate
Date: Tue, 10 Nov 2026 11:12:43 +0800
Message-ID: <20261110031244.369014-28-emery.hsin@mediatek.com>
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

Add an enable flag to mt7925_mcu_bss_mld_tlv(). On deactivate clear
the MLD fields, otherwise the firmware keeps the hybrid-MLO OM remap
and the deflink's TX OWN_MAC stays mapped to a dead MLO primary OMAC
after reconnect.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d02242870115..588328a01dc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3263,7 +3263,7 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
-		       struct ieee80211_bss_conf *link_conf)
+		       struct ieee80211_bss_conf *link_conf, bool enable)
 {
 	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
@@ -3275,10 +3275,14 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	bool is_hybrid;
 	bool is_supported_ap = false;
 
-	is_mld = ieee80211_vif_is_mld(link_conf->vif) ||
-		 (hweight16(mvif->valid_links) > 1);
+	/* On deactivate clear the MLD classification. Otherwise the FW
+	 * keeps the hybrid-MLO OM remap and the deflink's TX OWN_MAC stays
+	 * mapped to a dead MLO primary OMAC after reconnect.
+	 */
+	is_mld = enable && (ieee80211_vif_is_mld(link_conf->vif) ||
+			    (hweight16(mvif->valid_links) > 1));
 	/* three links means hybrid MLO */
-	is_hybrid = hweight16(mvif->valid_links) >= 3 &&
+	is_hybrid = enable && hweight16(mvif->valid_links) >= 3 &&
 		    (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_HYBRID_EN));
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
@@ -3450,7 +3454,7 @@ int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf, enable);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
-- 
2.45.2

