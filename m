Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280421;
	b=u5QGWszZvLpj2ciE6PgqCoFEXQdOBq52vGPqHpJOw3o1kHDE+dodo47tzEqQyQTUcLAo
	 TCL3OlTve8gwtZ1mR2UacRJeFmraAubHQCMYPJqcksqwI8Eb850Rv88ETipgHG8Kf7tB8
	 iiYtpz/U2T/I0yIznJZP9odeoT6PtMVI7JjHPUE8drAHZS9fYkGQckgd+YemwxsU/OR2A
	 jn6wBkTFVR71alYRN7eiGlysx5ybBfGkohEPOag0EPD7a3xlUt7cawQ9XCnCO9xDun2gI
	 Z388qvEX+wyMZAmKCxRxGh6zVsIzBYxYM5Y6zao4eOkthPFbQsGXFwTK2y3PFcaOlQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280421;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=Zf2VZ93Zqi5hlJQQVJeksW4j9pVqkbWH8lcTWAcUOVk=;
	b=qQFIlSROz5fF4HLAJSSdLHFHHhftR8ScU47H1RWJiNoNlhPBVCNn5aDX+G0OEeKHHTM1
	 C6c/XTYgGcJW5w9dq7yPlep26xWC9RgBl25Yn+N8/Yk8d9QT0XFKGEE7BY3xwjQHFtpMA
	 NLWFACVn4K9iBHqIU2JA0Im4jsmdgTGvbp8HyNTBhBterzomlTpKmA6yVEIdLyzCT7San
	 rjFR+OZkL/t0UXo/lcNfbS6LAcMgk2Mjl1n+fcJVTRK88sTb8Qrr1VKVYVP0ypy8Cvlrt
	 RXh0qDvsxjMlHmsahspkcfvLVvv9R1IlV20kac1EXFF5bMH9myP+mOktQoBB7Vo4Riw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hTpnodpp;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFD606E60F
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DFD606E60F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hTpnodpp
X-UUID: b6e3b2cedcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Zf2VZ93Zqi5hlJQQVJeksW4j9pVqkbWH8lcTWAcUOVk=;
	b=hTpnodppzmjVQV/64Olgm7GBAqY+oSEqZdFLhzoWvpogtXrfYf9+VHdbuC2RTg3amnlYc+fBi79OlS5YCA3xO9jiaMMQTsdpf3/f/7cZqZG1VnL0pTB0zS9JFD99525czwjHTk7YctG0GJabzPMGeUhkCIvOzVqf7fwiBexD+IM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:86ed0562-e037-4d99-8be7-62de07ffc139,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:211ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6e3b2cedcb411f1b1788b6acf885367-20261110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 473527420; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:33 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 09/28] wifi: mt76: mt7925: deactivate the DEV and BSS on disconnect
Date: Tue, 10 Nov 2026 11:12:25 +0800
Message-ID: <20261110031244.369014-10-emery.hsin@mediatek.com>
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

On disconnect the BSS is marked disconnected but stays active, so the
firmware keeps its old band binding and a later connection can get the
stale band. Also deactivate the DEV and BSS and reset the band to auto.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 25 +++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 56 -------------------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 -
 3 files changed, 21 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 62018d17745c..4889d3bfe08d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1401,15 +1401,30 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 		struct mt792x_bss_conf *mconf;
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
 
-		if (ieee80211_vif_is_mld(vif))
-			mt792x_mac_link_bss_remove(dev, mconf, mlink);
-		else
+		/* reset to auto band so the deactivate drops the band binding */
+		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+
+		if (ieee80211_vif_is_mld(vif)) {
+			/* Sub-links are removed. The primary link is kept for
+			 * reconnect but deactivated in firmware.
+			 */
+			if (mconf != &mvif->bss_conf)
+				mt792x_mac_link_bss_remove(dev, mconf, mlink);
+			else
+				mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+							  &mlink->wcid, false);
+		} else {
+			/* deactivate DEV and BSS, re-activated on the next connect */
 			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 						link_sta, false);
+			mt792x_mcu_set_dev_active(dev, link_conf, mconf,
+						  &mlink->wcid, false);
+		}
 	}
 
 	spin_lock_bh(&mdev->sta_poll_lock);
@@ -1457,6 +1472,9 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 
 		mconf = mt792x_link_conf_to_mconf(link_conf);
 
+		/* reset to auto band before the disconnect command */
+		mconf->mt76.band_idx = MT792x_BAND_AUTO;
+
 		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx, link_conf,
 					link_sta, false);
 	}
@@ -1529,7 +1547,6 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mt7925_mac_sta_remove_links(dev, vif, sta, msta->valid_links);
-		mt7925_mcu_del_dev(mdev, vif);
 	} else {
 		mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink,
 					   &msta->deflink);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b16a3c3122a1..557f8d3dea12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3185,62 +3185,6 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
 				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
-void mt7925_mcu_del_dev(struct mt76_dev *mdev,
-			struct ieee80211_vif *vif)
-{
-	struct mt76_vif_link *mvif = (struct mt76_vif_link *)vif->drv_priv;
-	struct {
-		struct {
-			u8 omac_idx;
-			u8 band_idx;
-			__le16 pad;
-		} __packed hdr;
-		struct req_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 active;
-			u8 link_idx; /* hw link idx */
-			u8 omac_addr[ETH_ALEN];
-		} __packed tlv;
-	} dev_req = {
-		.tlv = {
-			.tag = cpu_to_le16(DEV_INFO_ACTIVE),
-			.len = cpu_to_le16(sizeof(struct req_tlv)),
-			.active = true,
-		},
-	};
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt76_connac_bss_basic_tlv basic;
-	} basic_req = {
-		.basic = {
-			.tag = cpu_to_le16(UNI_BSS_INFO_BASIC),
-			.len = cpu_to_le16(sizeof(struct mt76_connac_bss_basic_tlv)),
-			.active = true,
-			.conn_state = 1,
-		},
-	};
-
-	dev_req.hdr.omac_idx = mvif->omac_idx;
-	dev_req.hdr.band_idx = mvif->band_idx;
-
-	basic_req.hdr.bss_idx = mvif->idx;
-	basic_req.basic.omac_idx = mvif->omac_idx;
-	basic_req.basic.band_idx = mvif->band_idx;
-	basic_req.basic.link_idx = mvif->link_idx;
-
-	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(BSS_INFO_UPDATE),
-			  &basic_req, sizeof(basic_req), true);
-
-	/* recovery omac address for the legacy interface */
-	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
-	mt76_mcu_send_msg(mdev, MCU_UNI_CMD(DEV_INFO_UPDATE),
-			  &dev_req, sizeof(dev_req), true);
-}
-
 int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 				struct ieee80211_chanctx_conf *ctx,
 				struct ieee80211_bss_conf *link_conf,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..4a6a1226a317 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -730,8 +730,6 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 int mt7925_mcu_sched_scan_enable(struct mt76_phy *phy,
 				 struct ieee80211_vif *vif,
 				 bool enable);
-void mt7925_mcu_del_dev(struct mt76_dev *mdev,
-			struct ieee80211_vif *vif);
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_bss_conf *link_conf,
-- 
2.45.2

