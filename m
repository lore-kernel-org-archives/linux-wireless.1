Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=xGCKZM34fpIS0MYiYJVC1LSi8jxZnMIfYmApXjdXAE4K5QrprAPu2rfwpQmJaYVq1O8w
	 iSjPZRy9jXTiuicf9mH75+4wC3F/WGFCJoOkARUunRS4yK2gy/I/4lM+jI8dZQtC2Nixs
	 2QyKUUJ0HeTlssT68JbOvlD32yh88W6mbJkoIzjw13Pew0qYRUC43o8FZ7H89fQhcMudc
	 DKTdsT8+JatVqcQ9S2WxJDWwXepumJ5IKqSmNXDFrSekkAXBtBrSvAZgSesqVfKRjL+wX
	 L8RZDifItrtRVx+iYoJOBVz1quyY92h4nZ7uavh8pwLUT3rkTUd4AuSE6D8Vq0jOxZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3o/Dn+GJXLRD0GXMRa2v6s37DmY+c1PhC6mIWxCWUE=;
	b=yNnTT61oCXXiNqJcY2+vBQ0mFyJK30A2yj68xhJHr3yOoUBa6XFMoZ5fD1jZvVxqLlCc
	 wIEQfQHJxUHoR5UI7TaGPYhYbxpQ4aB2qF5LZVjVn1hxG8/CkhWo4ZtUlN1D8tUMypbjX
	 g7flS5eULlBMkNyKU0+AJLbdSJuW8j4bhRTO73T8ip96iLJRqH70nOSLqKSEzvNIC+UDT
	 ApVTlv8IdVnfotBDMXvpp9akOQXbcjV9L7qb//ol2ozP3a8T3jWYl5+5UyOBtq12JO1Tu
	 XyZmGiqviDndxF9WxjSGwUAgCm1J5DerAHjVygd54dgve34UmjmWxEGp52D2Lmnl1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=PWh8Yift;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C460A2618
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81C460A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=PWh8Yift
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J3o/Dn+GJXLRD0GXMRa2v6s37DmY+c1PhC6mIWxCWUE=; b=PWh8Yiftm2DTx7mEN16+ucNwuS
	OEnFDw8JIJp3A5i/QsQu9rnrWodysd2rP5lWKh6CPmLz2oRDA5eHPxD8YimpRSsCzfiHvfLT/LMXN
	O9QQRxUmUB095QY6abhDbbJj4F1ER3ZI++9uM9IXbarpq0j8DAQZRVvtUDIZ0cg1yUy4=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-1l
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/20] wifi: mt76: mt7925: remove mt7925_mcu_del_dev()
Date: Thu, 19 Nov 2026 13:43:49 +0100
Message-ID: <20261119124352.1842164-17-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

At the removal of a station of an MLD interface, mt7925_mcu_del_dev()
activates the BSS of the default link again, with the connection type
and the station and broadcast indexes at 0, and sets the interface
address on its omac. For the AP station of an MLO connection, the
firmware holds no BSS or DEV entry of any link at that point, and it
refuses the BSS update at each disconnection. For a TDLS peer and for a
client of an AP MLD, the command rewrites the BSS and the DEV entry of
the default link, which the interface still uses.

Remove mt7925_mcu_del_dev(). Since commit 8f9e5807671e ("wifi: mt76:
mt7925: restore the legacy BSS after MLO teardown"),
mt7925_change_vif_links() adds the legacy BSS with the interface
address when mac80211 removes the last link, after the AP station.

Fixes: 0ebb60da8416 ("wifi: mt76: mt7925: adjust rm BSS flow to prevent next connection failure")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  6 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 56 -------------------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 -
 3 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0e26bfa75143..d7b359930b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1640,13 +1640,11 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		rcu_read_unlock();
 	}
 
-	if (ieee80211_vif_is_mld(vif)) {
+	if (ieee80211_vif_is_mld(vif))
 		mt7925_mac_sta_remove_links(dev, vif, sta, msta->valid_links);
-		mt7925_mcu_del_dev(mdev, vif);
-	} else {
+	else
 		mt7925_mac_link_sta_remove(mdev, vif, &sta->deflink,
 					   &msta->deflink);
-	}
 
 	if (vif->type == NL80211_IFTYPE_STATION) {
 		mvif->wep_sta = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cc7a020c14ab..2bf68476408b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3210,62 +3210,6 @@ int mt7925_mcu_set_timing(struct mt792x_phy *phy,
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
index 212c8caadd0c..fe40873e6107 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -741,8 +741,6 @@ int mt7925_mcu_sched_scan_req(struct mt76_phy *phy,
 int mt7925_mcu_sched_scan_enable(struct mt76_phy *phy,
 				 struct ieee80211_vif *vif,
 				 bool enable);
-void mt7925_mcu_del_dev(struct mt76_dev *mdev,
-			struct ieee80211_vif *vif);
 int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_chanctx_conf *ctx,
 			    struct ieee80211_bss_conf *link_conf,
-- 
2.47.3

