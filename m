Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871167;
	b=SbjLnsNaONOihzBkZNLnvV1AdsNH4DfX3jQEI6lxyqOTE6hLpZqYAmM4gpgXZEctqyLC
	 xCJO3F2xw5gz89vp+KDk6XCg/yo5DebuXnRigTDoxnreskh0XS7IHleQP34PmgEAnRwjo
	 rFdgNZqP/WoCPDL6nPmQ07zM4gu9B6pOnUBqBdK0Trotw2TH+kidIKT9Nn6yxcxTVfv/r
	 +HbUG4tiOWZDGTynEF/pXEvBC7lbVmGHWnIzPnRNkb6mEdAHpdbKHKyTOr67U68FYbYit
	 TuOsS58jHuJvAj44+e8ceR3tp3b9hkZRKQpQ90n+3TM/bqAYYb2hmifhTmvw/Ehc/8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871167;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dnMGqC/uAs8OGW0ThQoQL0TgOxMk4iIWZPEfIJJx05w=;
	b=uItRROjCfVZ0QRe/K4od5D+UigFj++EAqs/xnwwK6yoUr6yZq07Tjyd5J/zYb+6HUnnG
	 9RVhymtwhn+Mg8UYlbe968pERfJwiouBzevrGFm6F2S8Lc+5+lJMMcA9u6Iy96lXL2Kxj
	 BElzJoKNVtxzEpIM4akvf1PoWH7ZpGCweH2wStJWoIdn456DE2rxGBlluXOErlLBOi2on
	 ZBROYYLwQyE0gSmKgfkVJ0nPwhcjZiyPr9VB6xQ/2dUGJb0uUlDuDQ8F0XUlT75kgUoKK
	 ZA59hYA3QkXXDQyABer1LQlXVSAjRJ2HnSpImyuX1zPDaoBsZhXbeHnItinQi54Clmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C3606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906C3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b98b2e47so758978a34.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871165; x=1795475965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnMGqC/uAs8OGW0ThQoQL0TgOxMk4iIWZPEfIJJx05w=;
        b=j0y5Wq20t79f3sqBMDGoGnycTFIB3jfpqic3x0HmW4OEOjmBQ+jBXwYVzqTrchXfC+
         /ZVAKXcOVyr0MnZs/7lYDP9uesUXrFFSoABoMKDwFgbb08wdJPPLdLkdwhShDiPtistW
         JgZ2pR3AaVW608mxzUsXtNynbC9a8E4i8KdtNs0GeIwM/VE+ogRa/dZoqRvByDPReFL9
         Xy2WSwsYgAjseLc+0m2KC+TUCETpYoPIt/kGneRkuHf61EASG+cYEuKg7j5xoU4Sl3Y4
         Pvio6QJzEZDTChxKB3zwA1kGi5vpiNiEp0kckyFkHX3N1KOy4nKwdiahOACZJx1MjBN2
         w2wQ==
X-Forwarded-Encrypted: i=1; AL+hErFnNsY8r3W+OLH+OIXacNv3Z7leHJWUyM6vBF5sVDh5nrAOTWsezCIUmEeB/BErSEyPPSeNKxMK0/o6Z9Q/ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z9O7crD92LtDeKqXaoOiZsTYlCupEDKIx+tUYecLN9eUJsqPmjT
	L8qo1vg1p4rS4GWZ9ja+xND3JKOrzUGHhsMk3NXyuek3ZY2YEz30fqJO
X-Gm-Gg: AYBFou2qlV7G4OfFY40AgmiDBlItTUZkHT5kVy0OoiwpqIiSFD3lNZrZNCvu5kpNmNJ
	09/mqzcrCu0oGp2S4f6qfZPW8qbcJxlTEE0Dzd+zsxb6tnIz4YdVWwwCNg3rLSEmijmUoLPeAoY
	fW18y2tlkqpjPom/SBwu47VYGB/LIU99Gjiu1DjAeX/NL4DlmGfMSDIQ8GqdIWBI6x2iZkAR2D0
	b2qTopODxE5klT4smruNxVu5mhrC98vCtL8knE9RDBM9aUfx0PD65RWz1/ozq49pP3mBtw4xZm4
	2wdJNecNQCj0sN/cl9HwAs6t8FMSVcP4X/2Ap9xITfbbnhMRN2EnYG0OxExT9gd90IUHWyQPNN7
	SK2WtEUMHn5lFv5QD0jvzN8vGQnBBk/IcRDMR4+9z5MoAeAz55eSwtNQ/vc2fJqYdp0KJVyaPix
	c0cjrhwfYWpjiaLmAWWnCBp7huRDaTKgfnvYXHHSqFT8xVlnDf5IBJIsUNK+wBfrJkNHL5A2JlR
	47eF2DvO8F+Sn2hb3nyg0/MHlTPvBG4E0o7zIghW/6GOTmfZXFfB7adgGWYVM2qBbJ4MV5KXrjL
	Y6MM02yr+0ZdgX0mBQGwaY0QZ6b+nNOWY9UfeW9IbHWN5IVLzURewM90or/c71YxH1CYEQHHjXE
	KMASRpD/p
X-Received: by 2002:a05:6808:6d92:b0:573:f2e:2bee with SMTP id 5614622812f47-5730f2e30ffmr5217986b6e.37.1794871165392;
        Mon, 16 Nov 2026 15:19:25 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:24 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 10/19] wifi: mt76: mt7925: hold NAN mgmt TX to the discovery window
Date: Mon, 16 Nov 2026 17:16:21 -0600
Message-ID: <20261116231630.1733906-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

Host-initiated NAN management - SDF follow-ups and the frames that open
an NDP setup - rides the interface WTBL and airs the moment the host
hands it over. Until its NDL is confirmed a peer is only reliably awake
in the discovery window, so those frames regularly land while it is off
channel. The same WTBL carries the beacons and the multicast data that
must never be held, so gating that queue is not an option.

Create a dedicated STA and steer host management TX onto it, so the
firmware can hold that one queue outside the DW while the interface
WTBL keeps flowing. The driver hands the STA's WTBL index down with
NAN_UNI_CMD_DW_WTBL_IDX right after the STA record is added - the index
is the handle the firmware's queue pause works on, so no reserved
address is agreed on and the record's address is an arbitrary locally
administered one that never goes on air. A firmware that predates the
tag ignores it, and on a failed handoff the firmware's gate stays
disarmed, so management TX degrades to stock (ungated) behavior rather
than breaking NAN. The split is done per frame: multicast stays on the
interface WTBL, since a STA-type WTBL spends the full retry budget on an
unACKable multicast RA and one frame then eats a whole DW window, and
only unencrypted unicast - discovery and NDP setup - is held to the DW.
Secured frames belong to an established peer and keep its own WTBL and
key.

MT_TXQ_PSD reaches ALTX and escapes the pause, so the existing NAN
reroute is extended to cover this WTBL. The STA record is driven to the
associated state with its rate table configured; without either the
firmware buffers the queue or the hardware falls back to the lowest rate,
both of which show up as management frames failing after seconds. On
teardown the wcid is released only after pending TX status entries are
flushed, or the next status sweep dereferences them (KASAN use-after-free
via wpdma_reset -> mt76_tx_status_check).

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  11 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  11 ++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 174 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |   8 +
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   |  48 +++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   7 +
 drivers/net/wireless/mediatek/mt76/tx.c       |   2 +-
 8 files changed, 250 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index da135e76aabb..e11443529c16 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -397,6 +397,7 @@ struct mt76_wcid {
 	u8 sta:1;
 	u8 sta_disabled:1;
 	u8 amsdu:1;
+	u8 nan_dw:1;
 	u8 phy_idx:2;
 	u8 link_id:4;
 	bool link_valid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a902fdd441cd..7bd5e67c77cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2107,16 +2107,7 @@ mt7925_mcu_sta_state_v2_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			    struct ieee80211_vif *vif,
 			    u8 rcpi, u8 sta_state)
 {
-	struct sta_rec_state_v2 {
-		__le16 tag;
-		__le16 len;
-		u8 state;
-		u8 rsv[3];
-		__le32 flags;
-		u8 vht_opmode;
-		u8 action;
-		u8 rsv2[2];
-	} __packed * state;
+	struct sta_rec_state_v2 *state;
 	struct tlv *tlv;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_STATE, sizeof(*state));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..212c8caadd0c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -466,6 +466,17 @@ struct sta_rec_hdr_trans {
 	u8 rsv;
 } __packed;
 
+struct sta_rec_state_v2 {
+	__le16 tag;
+	__le16 len;
+	u8 state;
+	u8 rsv[3];
+	__le32 flags;
+	u8 vht_opmode;
+	u8 action;
+	u8 rsv2[2];
+} __packed;
+
 struct sta_rec_mld {
 	__le16 tag;
 	__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index c1af0dc2315f..2d6760c50fc5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -4,6 +4,7 @@
 #include <asm/byteorder.h>
 #include <linux/bitfield.h>
 #include <linux/errno.h>
+#include <linux/etherdevice.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
 #include <linux/string.h>
@@ -326,6 +327,167 @@ mt7925_nan_seed_link_sta(struct mt792x_dev *dev,
 	return nan_ctx;
 }
 
+/* Hand the DW-WTBL STA's WTBL index down to the firmware, which gates the
+ * queue by index alone - no address has to be agreed on. Until the index
+ * arrives the firmware's gate stays disarmed, so a failure here degrades
+ * to stock (ungated) management TX rather than breaking NAN.
+ */
+static int mt7925_nan_set_dw_wtbl_idx(struct mt792x_dev *dev, u16 wlan_idx)
+{
+	struct {
+		u8 rsv[4];
+		struct mt7925_nan_dw_wtbl_idx_tlv tlv;
+	} cmd = {
+		.tlv = {
+			.tag = cpu_to_le16(NAN_UNI_CMD_DW_WTBL_IDX),
+			.len = cpu_to_le16(sizeof(struct mt7925_nan_dw_wtbl_idx_tlv)),
+			.wlan_idx = cpu_to_le16(wlan_idx),
+		},
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(NAN), &cmd,
+				 sizeof(cmd), true);
+}
+
+/* Create the DW-WTBL STA and steer host mgmt TX onto it. The firmware is
+ * handed its WTBL index and holds that queue outside the DW, so unicast
+ * discovery only airs when every synced peer is awake. Best-effort: on
+ * failure the stock path keeps mgmt on the interface WTBL.
+ */
+static void mt7925_nan_dw_wcid_setup(struct mt792x_dev *dev,
+				     struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = &mvif->bss_conf;
+	struct mt76_wcid *own = &mvif->sta.deflink.wcid;
+	struct sta_rec_basic *basic;
+	struct mt76_txq *mtxq;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+	int idx, ret;
+
+	if (mvif->nan_dw_wcid.idx > 0 &&
+	    mvif->nan_dw_wcid.idx < MT792x_WTBL_STA)
+		return;
+
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (idx < 0)
+		goto err;
+
+	mvif->nan_dw_wcid.idx = idx;
+	mvif->nan_dw_wcid.phy_idx = own->phy_idx;
+	mvif->nan_dw_wcid.nan_dw = 1;
+	mvif->nan_dw_wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	mt76_wcid_init(&mvif->nan_dw_wcid, mconf->mt76.band_idx);
+	mt7925_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mconf->mt76,
+					      &mvif->nan_dw_wcid,
+					      MT7925_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		goto err_free;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_BASIC, sizeof(*basic));
+	basic = (struct sta_rec_basic *)tlv;
+	basic->conn_type = cpu_to_le32(CONNECTION_NAN);
+	basic->conn_state = CONN_STATE_PORT_SECURE;
+	basic->extra_info = cpu_to_le16(EXTRA_INFO_VER | EXTRA_INFO_NEW);
+	/* The record needs an address but nothing ever matches on it: frame
+	 * headers carry the real NMI/peer addresses and the firmware gates the
+	 * queue by WTBL index. Any locally administered address will do.
+	 */
+	eth_random_addr(basic->peer_addr);
+
+	/* A bare STA_REC leaves the WTBL rate table unconfigured and HW
+	 * unicast from it crawls (multi-second delivery). Give it the NAN
+	 * base rates: OFDM+ERP, no CCK.
+	 */
+	{
+		struct sta_rec_phy *phy;
+		struct sta_rec_ra_info *ra_info;
+
+		tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
+		phy = (struct sta_rec_phy *)tlv;
+		phy->phy_type = PHY_TYPE_BIT_OFDM | PHY_TYPE_BIT_ERP;
+		phy->basic_rate = cpu_to_le16(0x150);
+
+		tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA,
+					      sizeof(*ra_info));
+		ra_info = (struct sta_rec_ra_info *)tlv;
+		ra_info->legacy = cpu_to_le16(FIELD_PREP(RA_LEGACY_OFDM, 0xff));
+	}
+
+	/* Drive the record to the associated state: firmware buffers TX for
+	 * a STA that never left the initial state, which shows up as NAFs
+	 * sitting in the queue for seconds and then failing.
+	 */
+	{
+		struct sta_rec_state_v2 *state;
+
+		tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_STATE,
+					      sizeof(*state));
+		state = (struct sta_rec_state_v2 *)tlv;
+		state->state = MT76_STA_INFO_STATE_ASSOC;
+	}
+
+	ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				    MCU_UNI_CMD(STA_REC_UPDATE), true);
+	if (ret)
+		goto err_free;
+
+	rcu_assign_pointer(dev->mt76.wcid[idx], &mvif->nan_dw_wcid);
+
+	/* Arm the firmware's DW gate for this WTBL index; on failure the gate
+	 * stays disarmed and management TX degrades to stock (ungated).
+	 */
+	ret = mt7925_nan_set_dw_wtbl_idx(dev, idx);
+	if (ret)
+		dev_warn(dev->mt76.dev,
+			 "NAN: DW-WTBL index handoff failed (%d)\n", ret);
+
+	if (vif->txq_mgmt) {
+		mtxq = (struct mt76_txq *)vif->txq_mgmt->drv_priv;
+		mtxq->wcid = idx;
+	}
+
+	dev_info(dev->mt76.dev, "NAN DW-WTBL up: wcid=%d\n", idx);
+	return;
+
+err_free:
+	mt76_wcid_cleanup(&dev->mt76, &mvif->nan_dw_wcid);
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+	mvif->nan_dw_wcid.idx = 0;
+err:
+	dev_warn(dev->mt76.dev, "NAN DW-WTBL setup failed, stock mgmt path\n");
+}
+
+/* Rebind host mgmt TX to the interface WTBL and drop the DW-WTBL STA.
+ * The firmware frees the STA record (and force-releases the gate) as
+ * part of NAN disable, so only the driver-side wcid is torn down here.
+ */
+static void mt7925_nan_dw_wcid_release(struct mt792x_dev *dev,
+				       struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt76_txq *mtxq;
+	int idx = mvif->nan_dw_wcid.idx;
+
+	if (idx <= 0 || idx >= MT792x_WTBL_STA)
+		return;
+
+	if (vif->txq_mgmt) {
+		mtxq = (struct mt76_txq *)vif->txq_mgmt->drv_priv;
+		mtxq->wcid = mvif->sta.deflink.wcid.idx;
+	}
+
+	/* Flush TX-status entries still tracked on this wcid before it goes. */
+	mt76_tx_status_check(&dev->mt76, true);
+	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
+	mt76_wcid_cleanup(&dev->mt76, &mvif->nan_dw_wcid);
+	mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+	mvif->nan_dw_wcid.idx = 0;
+}
+
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf)
@@ -335,6 +497,7 @@ int mt7925_nan_enable(struct ieee80211_vif *vif,
 	struct mt7925_nan_common_hdr *hdr;
 	struct mt7925_nan_enable_req_tlv *req;
 	struct sk_buff *skb;
+	int ret;
 
 	if (!vif || !dev || !conf)
 		return -EINVAL;
@@ -374,7 +537,13 @@ int mt7925_nan_enable(struct ieee80211_vif *vif,
 
 	mt7925_nan_update_conf(mvif, conf);
 
-	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+	ret = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+	if (ret)
+		return ret;
+
+	mt7925_nan_dw_wcid_setup(dev, vif);
+
+	return 0;
 }
 
 int mt7925_nan_disable(struct ieee80211_vif *vif, struct mt792x_dev *dev)
@@ -394,6 +563,9 @@ int mt7925_nan_disable(struct ieee80211_vif *vif, struct mt792x_dev *dev)
 	if (!dev)
 		return -EINVAL;
 
+	if (vif)
+		mt7925_nan_dw_wcid_release(dev, vif);
+
 	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nan_cmd, sizeof(nan_cmd), true);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 0dcd1eeaa92b..165cf21b787b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -93,6 +93,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_SET_SYNC_RSSI		= 39,
 	NAN_UNI_CMD_SET_CLUSTER_ID		= 40,
 	NAN_UNI_CMD_KEY_MANAGEMENT		= 53,
+	NAN_UNI_CMD_DW_WTBL_IDX			= 55,
 };
 
 enum nan_uni_event_tag {
@@ -380,6 +381,13 @@ struct mt7925_nan_nmi_addr_tlv {
 	u8 nmi_addr[ETH_ALEN];
 } __packed __aligned(4);
 
+struct mt7925_nan_dw_wtbl_idx_tlv {
+	__le16 tag;
+	__le16 len;
+	__le16 wlan_idx;
+	u8 reserved[2];
+} __packed __aligned(4);
+
 struct mt7925_nan_avail_ctrl_tlv {
 	__le16 tag;
 	__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index bc8f741e9426..eb07abfef209 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -14,6 +14,8 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
 	struct ieee80211_key_conf *key = info->control.hw_key;
+	struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
+	struct ieee80211_vif *vif = info->control.vif;
 	struct mt76_connac_hw_txp *txp;
 	struct mt76_txwi_cache *t;
 	int id, pid;
@@ -25,6 +27,52 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (!wcid)
 		wcid = &dev->mt76.global_wcid;
 
+	/* Split NAN mgmt TX per frame, by what is known about the destination.
+	 *
+	 * Multicast must not ride the DW-WTBL STA: a STA-type WTBL spends the
+	 * full retry budget on an unACKable multicast RA, so one frame eats a
+	 * whole DW window and the publish SDF queue backlogs.
+	 *
+	 * Unencrypted unicast to a peer we have no station for is first
+	 * contact (SDF, NDP request): the DW is the only rendezvous, so it
+	 * goes on the DW-WTBL and waits for it.
+	 *
+	 * Once its schedule is known - the peer station exists, which is also
+	 * when firmware holds its committed bitmap - the frame belongs on that
+	 * station instead. Firmware then airs it inside the peer's own
+	 * committed slots, where the peer is awake and the medium is not the
+	 * DW pile-up, and follows the FAW onto whatever channel the window
+	 * actually uses rather than being pinned to the DW channel.
+	 *
+	 * Secured frames belong to an established peer and keep its own WTBL
+	 * and key.
+	 */
+	if (vif && vif->type == NL80211_IFTYPE_NAN &&
+	    ieee80211_is_mgmt(hdr->frame_control)) {
+		struct mt792x_vif *mvif = (void *)vif->drv_priv;
+		bool mcast = is_multicast_ether_addr(hdr->addr1);
+
+		if (mcast && wcid == &mvif->nan_dw_wcid) {
+			wcid = &mvif->sta.deflink.wcid;
+		} else if (!mcast && !key &&
+			   mvif->nan_dw_wcid.idx &&
+			   mvif->nan_dw_wcid.idx < MT792x_WTBL_STA) {
+			struct ieee80211_sta *psta;
+			struct mt792x_sta *pmsta;
+
+			rcu_read_lock();
+			psta = ieee80211_find_sta(vif, hdr->addr1);
+			pmsta = psta ? (struct mt792x_sta *)psta->drv_priv :
+				       NULL;
+
+			if (pmsta && pmsta->deflink.wcid.idx)
+				wcid = &pmsta->deflink.wcid;
+			else
+				wcid = &mvif->nan_dw_wcid;
+			rcu_read_unlock();
+		}
+	}
+
 	t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
 	t->skb = tx_info->skb;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 7ab84de262d3..78901585d784 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -261,6 +261,13 @@ struct mt792x_vif {
 	struct timer_list csa_timer;
 
 	struct mt792x_nan nan;
+
+	/* NAN DW-WTBL: driver-created STA the firmware gates to the DW;
+	 * host mgmt TX (SDF / pre-NDP NAF) is steered onto it so the BMC
+	 * WTBL carries multicast data only and is never paused for it.
+	 * idx == 0 or >= MT792x_WTBL_STA means not set up.
+	 */
+	struct mt76_wcid nan_dw_wcid;
 };
 
 struct mt792x_phy {
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 0cb27aaff19b..08b04f092a0b 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -718,7 +718,7 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		 * which escapes the per-peer STA_PAUSE availability gating
 		 * and transmits regardless of the peer's committed bitmap.
 		 */
-		if (qid == MT_TXQ_PSD && wcid->sta &&
+		if (qid == MT_TXQ_PSD && (wcid->sta || wcid->nan_dw) &&
 		    info->control.vif &&
 		    (info->control.vif->type == NL80211_IFTYPE_NAN ||
 		     info->control.vif->type == NL80211_IFTYPE_NAN_DATA) &&
-- 
2.43.0

