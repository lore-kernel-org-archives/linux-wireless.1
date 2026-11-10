Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280426;
	b=tpQ6v+Kt0EEz8MbSjzI4iA28Ratt986sjFhMSDnGwjgU5HEy9WLxY1G+Dpau/J028qGg
	 nWcngvpuDgIBiSclYcp+42SB0bY8kbs5Vh3M4V0puWna4ZVUo9wb0O2ZWRPCUdm8qt4pi
	 6vN3fSYpB4ajvrZccjfwO0FCFs+3NuDhKbfZ5x6pcPhf6s72UJ31/1tjN2yPEqLgYGAWD
	 bG5Uw8AK1nNc1YJLenoRobkzvvCtfqRxb3Zc0SH6plM8vAq8UPqv+h9eoJvjzZHwCak9/
	 QSbxPZMLQ8SemuJu5Xl2e7ndnthXg0M6z4SYrloHASWAlhj7saOJd4lSAOPp4k+yyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280426;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=jPVQr6YtlDWx3ztJPZeZP/NBjG2B5rsqO/uSPpAuXOE=;
	b=gvfN3pfj9ykdVfGt2FExhsYn6IpDTzHlR50s50LGcGcyygoTwm+xyvu2uADr0dySmY/J
	 w09SAbgJ2kW5QIjYR7q39PHRk+Kr6qOqr1uQqXIjF5efOR+woRDz61h9L0N3Iz9psrESE
	 MOosUfiGi4CSaWAXmWwtBcnD01rD55Kz7qTpFIXziyZf2SyEdZT2a7xkvfUerC+/ZBsul
	 8sobEtglvPg/pXf0DooVHrqlL8K5Wxa0Q1ZG1GuXvbmrJZKvlxunUc6/sbp2XGIMXBgnM
	 t+1aStiWVhbNPT5YwxBU5brh9GJ6F/uurm/PnhRD40D8FbdbZyL0T7mpX+4qjLqOPGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XRfjIctw;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5DC606A90A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5DC606A90A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=XRfjIctw
X-UUID: b87baaf6dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jPVQr6YtlDWx3ztJPZeZP/NBjG2B5rsqO/uSPpAuXOE=;
	b=XRfjIctwRJ571tuZwwRoxCv7TdkEBuGyU7c8rDdkTbNChN01qrqtzE7NmnaKledioCS1oU4E5wL77AaxkmS6xGloaw+xUtPVZ/fEzOq+Wv7aNs+DKe/NNVdOg1pAM3WV7IxLOBQ9WeQ3PqEXPvdqlI26lhaudcrSKo3EvYtet24=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4951c88e-1a73-4d65-84de-5cb800499aaa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f2af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b87baaf6dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1101800360; Tue, 10 Nov 2026 11:13:37 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH 25/28] wifi: mt76: mt7925: apply FW-reported MLO link state
Date: Tue, 10 Nov 2026 11:12:41 +0800
Message-ID: <20261110031244.369014-26-emery.hsin@mediatek.com>
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

Handle the UNI STAREC event (0x0f) carrying the MLO link-state TLV
(tag 0x27) and fold the reported ACTIVE/INACTIVE state into
vif->active_links via ieee80211_set_active_links_async().

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 93 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    | 23 +++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 5 files changed, 121 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 2acaae9830fb..5c27285542ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1098,6 +1098,7 @@ enum {
 	MCU_UNI_EVENT_BSS_BEACON_LOSS = 0x0c,
 	MCU_UNI_EVENT_PS_SYNC = 0x0d,
 	MCU_UNI_EVENT_SCAN_DONE = 0x0e,
+	MCU_UNI_EVENT_STAREC = 0x0f,
 	MCU_UNI_EVENT_RDD_REPORT = 0x11,
 	MCU_UNI_EVENT_SAP = 0x1c,
 	MCU_UNI_EVENT_ROC = 0x27,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 00244a650464..2b1346044c5a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -484,6 +484,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->sta.vif = mvif;
 	mvif->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
+	mvif->delay_inactive_links = U16_MAX;
 	mvif->valid_links = 0;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink,
@@ -1889,6 +1890,7 @@ void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	}
 
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
+	mvif->delay_inactive_links = U16_MAX;
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_remove);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b502f93166e5..2c2ab85180c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -805,6 +805,96 @@ mt7925_mcu_handle_mbmc_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 }
 
+/* Apply the link state reported by firmware to the vif active links. */
+static void
+mt7925_mcu_starec_link_state(struct mt792x_dev *dev, u16 wlan_idx,
+			     struct mt7925_starec_mlo_link_state_tlv *state)
+{
+	struct mt792x_link_sta *mlink;
+	struct ieee80211_vif *vif;
+	struct mt792x_vif *mvif;
+	struct mt792x_sta *msta;
+	u16 old_links, new_links;
+	struct mt76_wcid *wcid;
+	u8 link_id;
+
+	rcu_read_lock();
+
+	wcid = mt76_wcid_ptr(dev, wlan_idx);
+	if (!wcid || !wcid->sta)
+		goto out;
+
+	mlink = container_of(wcid, struct mt792x_link_sta, wcid);
+	msta = mlink->sta;
+	if (!msta || !msta->vif)
+		goto out;
+
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	if (!ieee80211_vif_is_mld(vif))
+		goto out;
+
+	mvif = (struct mt792x_vif *)vif->drv_priv;
+	link_id = wcid->link_id;
+	old_links = vif->active_links;
+
+	if (state->link_state == MT7925_MLO_LINK_STATE_ACTIVE) {
+		new_links = old_links | BIT(link_id);
+		mvif->delay_inactive_links |= BIT(link_id);
+	} else {
+		new_links = old_links & ~BIT(link_id);
+	}
+
+	/* Links held back from being deactivated, so a back-to-back
+	 * INACTIVE+ACTIVE pair does not briefly leave the vif linkless.
+	 * Never ask for an empty set: mac80211 drops such a request and the
+	 * vif would stay out of sync with the firmware.
+	 */
+	if (!new_links || !(new_links & mvif->delay_inactive_links)) {
+		mvif->delay_inactive_links &= ~BIT(link_id);
+	} else if (new_links != old_links) {
+		new_links &= mvif->delay_inactive_links;
+		mvif->delay_inactive_links = U16_MAX;
+		ieee80211_set_active_links_async(vif, new_links);
+	}
+
+out:
+	rcu_read_unlock();
+}
+
+static void
+mt7925_mcu_starec_event(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	struct mt7925_uni_starec_event *event;
+	struct tlv *tlv;
+	u16 wlan_idx;
+	u32 tlv_len;
+
+	if (skb->len < sizeof(struct mt7925_mcu_rxd) + sizeof(event->hdr))
+		return;
+
+	skb_pull(skb, sizeof(struct mt7925_mcu_rxd));
+	event = (struct mt7925_uni_starec_event *)skb->data;
+	wlan_idx = le16_to_cpu(event->hdr.wlan_idx);
+
+	tlv = (struct tlv *)event->tlv;
+	tlv_len = skb->len - sizeof(event->hdr);
+
+	mt7925_for_each_tlv(tlv, tlv_len) {
+		switch (le16_to_cpu(tlv->tag)) {
+		case MT7925_STAREC_TAG_MLO_LINK_STATE:
+			if (le16_to_cpu(tlv->len) <
+			    sizeof(struct mt7925_starec_mlo_link_state_tlv))
+				break;
+
+			mt7925_mcu_starec_link_state(dev, wlan_idx,
+						     (void *)tlv);
+			break;
+		default:
+			break;
+		}
+	}
+}
+
 static void
 mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 				    struct sk_buff *skb)
@@ -841,6 +931,9 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 	case MCU_UNI_EVENT_BSS_IS_ABSENCE:
 		mt7925_p2p_mcu_bss_is_absence_event(dev, skb);
 		break;
+	case MCU_UNI_EVENT_STAREC:
+		mt7925_mcu_starec_event(dev, skb);
+		break;
 	case MCU_UNI_EVENT_RSSI_MONITOR:
 		mt7925_mcu_rssi_monitor_event(dev, skb);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index d829eb9686c7..5a46a6a45e0c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -133,6 +133,29 @@ struct mt7925_uni_beacon_loss_event {
 	struct mt7925_beacon_loss_tlv beacon_loss;
 } __packed;
 
+/* STAREC event: MLO link state */
+#define MT7925_STAREC_TAG_MLO_LINK_STATE	0x27
+
+/* link_state values */
+#define MT7925_MLO_LINK_STATE_ACTIVE		0
+#define MT7925_MLO_LINK_STATE_INACTIVE		1
+
+struct mt7925_starec_mlo_link_state_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 link_state;
+	u8 reason;
+	u8 pad[2];
+} __packed;
+
+struct mt7925_uni_starec_event {
+	struct {
+		__le16 wlan_idx;
+		u8 pad[2];
+	} __packed hdr;
+	u8 tlv[];
+} __packed;
+
 struct mt7925_uni_rssi_monitor_event {
 		__le16 tag;
 		__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 96d4dfe8ee45..f1a0a296ae0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -220,6 +220,8 @@ struct mt792x_vif {
 	struct mt792x_phy *phy;
 	bool roc_join_held; /* join ROC kept until the STA is authorized */
 	u16 valid_links;
+	/* Links held back from being deactivated, U16_MAX when none is held. */
+	u16 delay_inactive_links;
 	u8 deflink_id;
 	enum mt792x_mlo_pm_state mlo_pm_state;
 
-- 
2.45.2

