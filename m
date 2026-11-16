Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871120;
	b=INOPeudy+XmlrKdRR9gVHOvI4hns3YzTSp1s9S3ydONF9XW34EJr6vj5wkB2WzDkEqrH
	 G3nGA1YjPmb5o2xinKvDq989HlSwgiTfqWC4l+6ia2YlbV+gAJsARjVk7AmdycUDpIOii
	 aLM8i19Jgua8HOx7XZ8llMsBuqMGu4utbNPcr8dWPO6R68QDHkZpYH4o8ripExrXDyAlA
	 tL+eei1ws1yybQtCx/Fqs8mxRLNnjoTReVFrTg0snYtIib9GXhPDq8IVn7W0Qk9NgvhAd
	 jtox8u4EOiQieceB+hatLIAROUkgyjEDxTHDo824XRdgmdgXKp5dbj02vq6Tc2gO5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871120;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5c3ewEuNavq3VRbHhbrC4PgRlgjF35/gUfe074TPTz8=;
	b=lFS1bSf0zePTM7z5Xu8VNxLzn+Bu+i/wN7PWRBavnLOqJg7HJNiOsnLxjNVeHhNwIT7W
	 vuwyb1QZHeRiBHjr1J8pIlmA6AhLFapsiYMl0DXu1+YcYkQXYy+a7wg5+bbvM/+b3I3ru
	 QMwmrjBxBDLF1i9CXt1SwrzqpsdewKySPld/3yTAu667sV4UQZ0XeLVTyMdKzjoAQZWxe
	 Tjiy6jCe6qM5ohoAplyUELGA2/6Gus8ng4RzO7e28ZRlmuvNhosXdBCZaSa9/+8t72nO8
	 a513aio2r7g8stfE60WBa7DWVkNvbQcabMTlXBJQM4RXWAxVbMlvMvTePpurAngjYUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751F606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5751F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-571eb508edaso856008b6e.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871119; x=1795475919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c3ewEuNavq3VRbHhbrC4PgRlgjF35/gUfe074TPTz8=;
        b=acyYRaQdqaVp4im//nJ8azdYSm1CzLE0Yz0tn9Rk5db6yjFq8uYSByswzzKKP3n+fe
         z/E+sd5gMVJkyd+Rf/AalSLat1C8+P4k5qAI6W93guruwNtGmsFREidy3GtahElbpeBR
         gz/vqxy/ItPpv3lf9CTg7EWX+psFZF2+dhHbVeHC1qPqAXVVIzWZtwv/Jp1hz85onYXj
         P/syygi3/oAq+GnMFvyyz/S6R9KaC/lZ5GnYRNmT8kitDqdHQXb+c6D91/2FFTe/9f2k
         8ow3Aey5TrijWu9Xq6pRNiWRH2gUqz/+R5GiOLPNCNeJSMB42H2viOAc9WnsOlVzytYq
         3uVA==
X-Forwarded-Encrypted: i=1; AL+hErGFuWLCoGQNVHz9ywwJ2CjSxJMPZLzh81bUuGh7jWbcGQJ8MfEqry/XcRqSxg/jNc0XZD0pgvLINzJOwKbYaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NNio8bVVbCEbGhV28PseY9Ll1X4/KR8Olx2H+Jl8N6EMUb15I
	wG3cRCOwD+fsCcatt+/UIGbdXqRDwLU4GQDvPJCYXL6rvnpmd7KX5ML0
X-Gm-Gg: AYBFou10nYJdb8zDvpH12StzHlSPJ46oPN61yLO6anJWJdDXBhnBIvuU/LgLmPS3W6A
	gnhhGxv8lyuFQ0mAcwY6qgxgRs2tHEe3wCB+1igK3aCzjZ0zJbA2AxqkQVqJAWSmwDbCvkXOV/K
	a7AgOdZlepQHhLSoLVBmPHzfDAA0/XWcTmXwIxQN8eGJCKUGeqBsx+nuDK14xZmWSBzvs8/+eCk
	J2vKGgOgO/GkDwVKPRi4psaeK3w1CBvbVPdc8DueuQ0t/Wei9OLrcEVMjsB3aV1LC8TDKhVBwg0
	wKwknQuNYhOBbdoNBmR2+15L7z0q+dC6jJ75XBOtgfGOd5Erl5OdqMCUvTdnJTocouCkxz+ogB/
	Q0ojfVpfoom3Gl2AlltwHhNSAv3Q02c6f6vyG4y5pUeXgb9z16kSd0Vb36WVcCGtrhwK7wFrU3u
	S6XbvwQhqn6baNT1W5p8KQHJQ9tH0wFI2w8JEzM0/7sFvFeyde3ezuZRoFX7hPRv2ixWEYd6xMg
	9xuvp3CeMW6DsiyavCDB77x5uFV8ZRfqey2dBggYzVtHmo9dfQJY/WkHU/ckAEOPtDCAYp6t3e0
	glPhtlehhA1ZEdzzxGtmjCv0FWn0Lnms0ZrraUlM6hezArfv+E3Q+orvImQdXZ53F94d0nN2zBr
	SmMQ0QcIF
X-Received: by 2002:a05:6808:5092:b0:573:7a6b:f32c with SMTP id 5614622812f47-5737a6c0a74mr6031072b6e.50.1794871119170;
        Mon, 16 Nov 2026 15:18:39 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:37 -0800 (PST)
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
Subject: [PATCH v2 02/19] wifi: mt76: mt7925: implement NAN key management MCU command
Date: Mon, 16 Nov 2026 17:16:13 -0600
Message-ID: <20261116231630.1733906-3-sean.wang@kernel.org>
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

Add mt7925_nan_manage_key_cmd() and mt7925_nan_key_mgmt_tlv() to
install and remove NAN group and pairwise keys via
NAN_UNI_CMD_KEY_MANAGEMENT. The TLV builder covers all firmware key
types: NM-TK, ND-TK (unicast), TX/RX GTK (multicast data) and
TX/RX IGTK/BIGTK (multicast management).

Follows the same skb + mt76_connac_mcu_add_tlv() pattern as other NAN
commands (mt7925_nan_enable(), mt7925_nan_change_configure()) rather
than hand-assembling a packed struct, so it composes naturally with
the existing NAN command helpers.

Key material is grouped into struct mt7925_nan_key_info so callers
pass one pointer instead of five arguments; init/key_exist firmware
flags are hardcoded 1/0 since every real caller uses the same values.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 122 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  72 +++++++++++
 2 files changed, 194 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 39d56519bce4..2c01dee27649 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -787,6 +787,128 @@ int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable)
 	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
 }
 
+static int
+mt7925_nan_key_mgmt_tlv(struct sk_buff *skb,
+			enum mt7925_nan_key_operation key_op,
+			enum mt7925_nan_key_type key_type,
+			u16 wtbl_entry,
+			const u8 *local_addr,
+			const u8 *peer_addr,
+			const struct mt7925_nan_key_info *key)
+{
+	struct mt7925_nan_key_mgmt_tlv *key_mgmt_tlv = NULL;
+	struct tlv *tlv = NULL;
+
+	if (!skb)
+		return -EINVAL;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_KEY_MANAGEMENT,
+				      sizeof(struct mt7925_nan_key_mgmt_tlv));
+	if (!tlv)
+		return -ENOMEM;
+
+	key_mgmt_tlv = (struct mt7925_nan_key_mgmt_tlv *)tlv;
+	key_mgmt_tlv->op = (u8)key_op;
+	key_mgmt_tlv->key_type = (u8)key_type;
+	key_mgmt_tlv->wtbl_idx = cpu_to_le16(wtbl_entry);
+	key_mgmt_tlv->init = 1;
+	key_mgmt_tlv->key_exist = 0;
+	key_mgmt_tlv->is_nmi_tk = 0;
+
+	memcpy(key_mgmt_tlv->local_addr, local_addr, ETH_ALEN);
+	memcpy(key_mgmt_tlv->peer_addr, peer_addr, ETH_ALEN);
+
+	switch (key_type) {
+	case NAN_KEY_TYPE_NMI_CXT_MGMT_KEY:
+		key_mgmt_tlv->nmi_key_idx = 0;
+		key_mgmt_tlv->is_nmi_tk = true;
+		break;
+	case NAN_KEY_TYPE_MC_TX_KEY:
+	case NAN_KEY_TYPE_MC_MGMT_TX_KEY:
+		/* TX GTK/IGTK/BIGTK: NDI-indexed slot; NDC ID not yet tracked */
+		key_mgmt_tlv->ndi_idx = 0;
+		break;
+	case NAN_KEY_TYPE_MC_RX_KEY:
+	case NAN_KEY_TYPE_MC_MGMT_RX_KEY:
+		key_mgmt_tlv->mc_rx_idx = (u8)wtbl_entry;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (key_op == NAN_KEY_OP_SET_KEY) {
+		key_mgmt_tlv->algorithm_id = key->algo_id;
+		key_mgmt_tlv->key_id = key->key_id;
+		key_mgmt_tlv->key_len = key->key_len;
+
+		if (key_type == NAN_KEY_TYPE_MC_MGMT_RX_KEY && key->pn) {
+			memcpy(key_mgmt_tlv->key_rsc, key->pn,
+			       min_t(size_t, NAN_PACKET_NUMBER_LEN,
+				     sizeof(key_mgmt_tlv->key_rsc)));
+		}
+
+		if (key->key_data) {
+			memcpy(key_mgmt_tlv->key_material, key->key_data,
+			       min_t(size_t, key->key_len,
+				     sizeof(key_mgmt_tlv->key_material)));
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * mt7925_nan_manage_key_cmd - Install/remove a NAN group or pairwise key
+ * @dev: mt792x device pointer
+ * @key_op: NAN_KEY_OP_SET_KEY or NAN_KEY_OP_CLS_KEY
+ * @key_type: which NAN key slot this targets (enum mt7925_nan_key_type)
+ * @wtbl_entry: WTBL index the key is bound to (WTBL_RESERVED_ENTRY invalid)
+ * @local_addr: local MAC address for this key context
+ * @peer_addr: peer MAC address for this key context
+ * @key: key material; key->key_data required for NAN_KEY_OP_SET_KEY
+ *
+ * There are no other callers yet; NAN group key installation added by a
+ * later change calls into this single command path.
+ */
+int
+mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
+			  enum mt7925_nan_key_operation key_op,
+			  enum mt7925_nan_key_type key_type,
+			  u16 wtbl_entry,
+			  const u8 *local_addr,
+			  const u8 *peer_addr,
+			  const struct mt7925_nan_key_info *key)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	struct mt7925_nan_common_hdr *hdr = NULL;
+	struct sk_buff *skb = NULL;
+	int ret;
+
+	if (!key || !local_addr || !peer_addr ||
+	    key_type >= NAN_KEY_TYPE_NUM ||
+	    wtbl_entry == WTBL_RESERVED_ENTRY ||
+	    (key_op == NAN_KEY_OP_SET_KEY && !key->key_data))
+		return -EINVAL;
+
+	skb = mt76_mcu_msg_alloc(mdev, NULL,
+				 sizeof(struct mt7925_nan_common_hdr) +
+				 sizeof(struct mt7925_nan_key_mgmt_tlv));
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct mt7925_nan_common_hdr *)skb_put(skb, sizeof(*hdr));
+	memset(hdr, 0, sizeof(*hdr));
+
+	ret = mt7925_nan_key_mgmt_tlv(skb, key_op, key_type, wtbl_entry,
+				      local_addr, peer_addr, key);
+	if (ret) {
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+}
+
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 6979f0347d77..190de376ef54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -110,6 +110,24 @@ enum nan_disc_event_type {
 	NAN_EVENT_ID_JOINED_CLUSTER		= 2,
 };
 
+enum mt7925_nan_key_operation {
+	NAN_KEY_OP_SET_KEY,
+	NAN_KEY_OP_CLS_KEY,
+};
+
+enum mt7925_nan_key_type {
+	NAN_KEY_TYPE_NMI_CXT_MGMT_KEY,	/* NM-TK: NAN Management pairwise key */
+	NAN_KEY_TYPE_ND_TK,		/* ND-TK: NAN Data pairwise key */
+	NAN_KEY_TYPE_MC_TX_KEY,		/* TX GTK (multicast data) */
+	NAN_KEY_TYPE_MC_RX_KEY,		/* RX GTK (multicast data) */
+	NAN_KEY_TYPE_MC_MGMT_TX_KEY,	/* TX IGTK/BIGTK (multicast mgmt) */
+	NAN_KEY_TYPE_MC_MGMT_RX_KEY,	/* RX IGTK/BIGTK (multicast mgmt) */
+	NAN_KEY_TYPE_NUM,
+};
+
+#define WTBL_RESERVED_ENTRY	0xFFFF
+#define NAN_PACKET_NUMBER_LEN	6
+
 /* bit indices into mt792x_dev->nan_deferred_pending, set from the atomic
  * MCU-event RX path and consumed by mt7925_nan_deferred_work()
  */
@@ -479,6 +497,35 @@ struct mt7925_nan_update_phy_setting_tlv {
 	struct mt7925_nan_phy_setting phy_5g;
 } __packed __aligned(4);
 
+struct mt7925_nan_key_mgmt_tlv {
+	__le16 tag;
+	__le16 len;
+
+	u8 op;			/* enum mt7925_nan_key_operation */
+	u8 key_type;		/* enum mt7925_nan_key_type */
+	__le16 wtbl_idx;
+	u8 init;
+	u8 key_exist;
+	u8 is_nmi_tk;
+	u8 reserved0;
+
+	u8 local_addr[ETH_ALEN];
+	u8 peer_addr[ETH_ALEN];
+
+	union {
+		u8 nmi_key_idx;
+		u8 ndi_idx;
+		u8 mc_rx_idx;
+	};
+	u8 algorithm_id;
+	u8 key_id;
+	u8 key_len;
+
+	u8 key_rsc[NAN_PACKET_NUMBER_LEN];
+	u8 reserved1[2];
+	u8 key_material[32];
+} __packed __aligned(4);
+
 /* NAN Low Power Control Command */
 struct mt7925_nan_lowpower_ctrl_tlv {
 	__le16 tag;
@@ -514,6 +561,31 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
 int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable);
 
+/**
+ * struct mt7925_nan_key_info - key material for mt7925_nan_manage_key_cmd
+ * @algo_id:  firmware cipher algorithm ID (from mt7925_mcu_get_cipher())
+ * @key_id:   key index (1-2 for GTK, 4-7 for IGTK/BIGTK)
+ * @key_len:  key material length in bytes (16 or 32)
+ * @key_data: key bytes; must be non-NULL for SET_KEY operations
+ * @pn:       6-byte packet number / RSC; only used for MC_MGMT_RX_KEY,
+ *            pass NULL for all other key types
+ */
+struct mt7925_nan_key_info {
+	u8 algo_id;
+	u8 key_id;
+	u8 key_len;
+	const u8 *key_data;
+	const u8 *pn;
+};
+
+int mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
+			      enum mt7925_nan_key_operation key_op,
+			      enum mt7925_nan_key_type key_type,
+			      u16 wtbl_entry,
+			      const u8 *local_addr,
+			      const u8 *peer_addr,
+			      const struct mt7925_nan_key_info *key);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
-- 
2.43.0

