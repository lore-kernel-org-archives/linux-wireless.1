Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871128;
	b=jnWq+b6R6tWSzWB+PaoJStxjWP7TaZMvn5NFhOZPinae1rdCbLFvdr4ZCsOofYOaz7yH
	 KlS8YropDGz3wJSla7nUyX8oXSoO10MjufVZDps+VdLZl+4MuT1O/wBbVe1EYYoCY3rxR
	 pecAMxuwXQKjurcadxoxDjhLFADBiKp8fIN0KmGRohUPgv4MDHgNAe8jMWfuqVeIb3h8s
	 R+pAz/TMe6XkuV6rGrF0vwmIdj0qk0fhI8ja0OJcYRlWmUZTuAzcNpYZwKT2/ETiRU5iW
	 DbYPfoiDz/wb/XNJQBxHtP3NTsotw3oS+JByusCQKgJrI8vdIEiYZYZmTZpAITreb7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871128;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DownkYcYqpNvlsPHthmAF3y1JRd2IVBhq+1/JYtvBX4=;
	b=1C35lIDoqGMjTzEoXUbCUm5Qx8uXXHDjwH+hKofjdb35G4iPnAF+ZGKm1VUhKrPD4q2F
	 WmwO2nZ8PeUTHf2Z3ZE8uMP/amosLUaDuH1xG/IxSItUGNCGJOG5PsA3UeWnXvu9Iitjs
	 nfNJkKh61chuUJodh8Mo+hFRc7+7E6dbISRQCiFGyHqDdPGpxlXG3rlQoKaUOJ58I8/rj
	 cU3++JEWzPtud8u1rpqxVxbRXImSdT8RibHntkoogav9hFbjLbXOtaxowbIVFiVI9IEOj
	 Og0Yt5QQ6E7BV8kv2xA4LcMNJt9wHsvCpkObbJc47w3jhQ+LeaXh+3UmqXPyTbtFtpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537D606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B537D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-862b76e3c8cso787767a34.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871126; x=1795475926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DownkYcYqpNvlsPHthmAF3y1JRd2IVBhq+1/JYtvBX4=;
        b=B9A8VpqoGCs3xnnD3OjuB4mu2cDYHxXqUWqkPazC/0bQOncEVm7fAZ50G093LMDXzi
         9Zja+4YJgdGkXW9+FBDZ3hcOU9COAZn5RZP1JhbpzLXF8/8399hSKv2Nbj6Ct6vEMj+7
         1xpKjK7YT/HUNGatAl4sSXIb6Mo+JoOarTDjzwJVsPYnZLftpMKTJbNvmqHilAMeMRsB
         7bNaeSCcem9FKDz4CpRMJNr30Sf/g2s5YLzp7Iyw6CEiVoH52l33DlAvEAd7ezROZhPy
         D9iBzqEzWacsip9BkJPQ5WdxmPf2EzTspk8nKBCGHoILVNkzt8AWu5SuNUXFwqgIVmxy
         iZQA==
X-Forwarded-Encrypted: i=1; AL+hErG31nteC8DpOpaXwWvDl6rreafG26MaaqQxsAra6iEl1vSwdy5/UusaPAPv4DmpdS/asrnrZcYDyfZeJlMe3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9H/YKOuPqz470hQg/aSO0vvluIutOXEIa0NHUSe9YnihZvfB7/
	G7F0VG8cTybbrWcDqed9VN+1OVYUTyBDHn1E0zi2q/Kgq6kxaeWPLCMY
X-Gm-Gg: AYBFou37iWtKsMt8bzvzeD8XO/VuaZs8LHmnyP+5XtgcPrrSuY4zAxlP5ec3ktxUzPm
	GDgeFcLYxZRvcg4t7wLP/du+AOyVOlqcJFHrF0FEY1HKd8AagPZXwoxmmtQs8jM9lKUVMMiFAJz
	ucLPvsTg5beGw0xDBo8kjtUAHga+piV9WdCvdhYngLMUWQAxz3yVPpcpeN0j/mSLLKr4VqNwkfW
	bYiAcds3FM5KW6BQEPY+AiWMw2QSWwIdRxeth1FdElqxGNe9Cl/dysh3Z19ecDDLhsHTKUVmg8E
	dBsCQ89uKmk91Jh33U8Q9+LzLiNz4G7Pq1JOso/lOAPSiCNvwBd+bbmViQT3U+V0tYY6N9WNKN1
	Nas3NvhTlB+DyUuC3MHNQrgqrR6OhJz4KokltKPmKNi7RA1TPt0WZcW+V8LWgzsLAIdHLK0oHtn
	xpDDWuoniRETUe4uR+6iMl8HJTv0YBJLWr8K5qJdzxardsH4UE+2T3VmY3JS0GP5WbfU9SMD5cW
	pa49lAssKIekvt7cI8HsFWyNI+d76SL2KEC8/bNp/qo3nueNdmqlUZ3vY1ue6vKnILysU2ZklTm
	c6HvRPxKEB0rkkgn4wdh9QrslpvY6HEWNM2IJUw6rKdVtqJ+BEdDJLIVqXLOR1DBSeHWmXwiUcL
	IGezmVlVr
X-Received: by 2002:a05:6809:27ce:b0:571:b166:3d5b with SMTP id 5614622812f47-571b1759fe9mr5401883b6e.56.1794871126364;
        Mon, 16 Nov 2026 15:18:46 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:44 -0800 (PST)
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
Subject: [PATCH v2 04/19] wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
Date: Mon, 16 Nov 2026 17:16:15 -0600
Message-ID: <20261116231630.1733906-5-sean.wang@kernel.org>
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

Wire up NAN/NAN_DATA group key installation on top of the MCU command
and per-peer WTBLs from prior commits:

 - NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL): lazy WTBL alloc via
   nan_rx_igtk_wcid; installed as NAN_KEY_TYPE_MC_MGMT_RX_KEY.
 - NAN_DATA RX GTK (keyidx 1-2, sta != NULL): lazy WTBL alloc via
   nan_rx_gtk_wcid; installed as NAN_KEY_TYPE_MC_RX_KEY.
 - NAN_DATA TX GTK: -EOPNOTSUPP; NDC ID unavailable at set_key time,
   keeping mac80211 in SW crypto until NDC-aware support lands.

mt7925_set_key() routes NAN/NAN_DATA vifs through mt7925_nan_set_key()
and blocks NAN_DATA group keys from reaching set_link_key, preventing
silent HW-offload of the unsupported TX GTK path.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  28 ++++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 155 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  16 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  42 ++++-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |   7 +
 5 files changed, 245 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 490507ce97cd..a258996a6aae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -491,6 +491,7 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 
 	if (vif->type == NL80211_IFTYPE_NAN)
 		dev->nan_vif = vif;
+
 out:
 	mt792x_mutex_release(dev);
 
@@ -825,6 +826,33 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct mt792x_link_sta *mlink;
 	int err;
 
+	/* Route NAN/NAN_DATA keys.
+	 *
+	 * mt7925_nan_set_key() owns every key that needs a dedicated WTBL and
+	 * returns -EOPNOTSUPP to signal "not mine, use the normal HW path".
+	 * Three cases legitimately reach the normal path:
+	 *
+	 *   NAN     + pairwise  (NM-TK):     set_link_key via NMI peer WTBL
+	 *   NAN_DATA + pairwise (ND-TK):     set_link_key via NDI peer WTBL
+	 *   NAN     + group     (TX IGTK/BIGTK): set_link_key via NAN iface WTBL
+	 *
+	 * NAN_DATA TX GTK is the one group key on NAN_DATA that nan_set_key
+	 * also declines (-EOPNOTSUPP) because NDC ID is unavailable at set_key
+	 * time.  It must NOT reach set_link_key: that function would succeed
+	 * and silently install the key on the interface WTBL, causing mac80211
+	 * to mark it as HW-offloaded and skip SW crypto.  Return -EOPNOTSUPP
+	 * so mac80211 uses SW encryption until TX GTK support is complete.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA) {
+		err = mt7925_nan_set_key(hw, cmd, vif, sta, key);
+		if (err != -EOPNOTSUPP)
+			return err;
+		/* Block NAN_DATA group keys from reaching set_link_key. */
+		if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+		    !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
+			return -EOPNOTSUPP;
+	}
+
 	/* The hardware does not support per-STA RX GTK, fallback
 	 * to software mode for these.
 	 */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 2c01dee27649..c1af0dc2315f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1469,3 +1469,158 @@ int mt792x_nan_map_sta_rec(struct mt76_dev *mdev,
 
 	return ret ?: -ENOMEM;
 }
+
+/* Allocate a WTBL slot for a lazily-created per-peer NAN group key wcid.
+ * Mirrors mt76_wcid_alloc/init but wires the slot into the RCU wcid table and
+ * clears the hardware admission counter, matching what mt7925_mac_link_sta_add
+ * does for every normal per-link wcid.  Caller must hold dev->mt76.mutex; RCU
+ * publish is the final step so readers always see a fully initialised wcid.
+ */
+int mt7925_nan_wcid_alloc(struct mt792x_dev *dev, struct mt76_wcid *wcid)
+{
+	int idx;
+
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (idx < 0)
+		return -ENOSPC;
+
+	wcid->idx = idx;
+	wcid->tx_info |= MT_WCID_TX_INFO_SET;
+	mt76_wcid_init(wcid, 0);
+	mt7925_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	rcu_assign_pointer(dev->mt76.wcid[idx], wcid);
+
+	return 0;
+}
+
+/* NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL): lock first, then lazy alloc. */
+static int mt7925_nan_set_rx_igtk(struct mt792x_dev *dev,
+				  const u8 *local_addr, const u8 *peer_addr,
+				  struct mt792x_sta *msta,
+				  enum set_key_cmd cmd,
+				  struct ieee80211_key_conf *key)
+{
+	enum mt7925_nan_key_operation key_op;
+	u16 wtbl_idx;
+	int err;
+
+	mt792x_mutex_acquire(dev);
+
+	/* Lazy allocation of per-peer RX IGTK/BIGTK WTBL: mt76_wcid_alloc()
+	 * touches the shared wcid mask and mt7925_mac_wtbl_update() writes
+	 * hardware registers, so both need dev->mt76.mutex and a woken chip.
+	 */
+	if (msta->nan_rx_igtk_wcid.idx == MT792x_WCID_IDX_UNSET) {
+		if (cmd != SET_KEY) {
+			mt792x_mutex_release(dev);
+			return 0;
+		}
+		err = mt7925_nan_wcid_alloc(dev, &msta->nan_rx_igtk_wcid);
+		if (err) {
+			mt792x_mutex_release(dev);
+			return err;
+		}
+	}
+
+	key_op = (cmd == SET_KEY) ? NAN_KEY_OP_SET_KEY : NAN_KEY_OP_CLS_KEY;
+	wtbl_idx = msta->nan_rx_igtk_wcid.idx;
+
+	err = mt7925_nan_manage_key_cmd(dev, key_op, NAN_KEY_TYPE_MC_MGMT_RX_KEY,
+					wtbl_idx, local_addr, peer_addr,
+					&(struct mt7925_nan_key_info){
+						.algo_id = mt7925_mcu_get_cipher(key->cipher),
+						.key_id  = key->keyidx,
+						.key_len = key->keylen,
+						.key_data = key->key,
+					});
+	mt792x_mutex_release(dev);
+	return err;
+}
+
+/* NAN_DATA GTK (keyidx 1-2): lock first, then lazy alloc for RX; TX unsupported. */
+static int mt7925_nan_set_data_gtk(struct mt792x_dev *dev,
+				   struct ieee80211_sta *sta,
+				   struct mt792x_sta *msta,
+				   enum set_key_cmd cmd,
+				   struct ieee80211_key_conf *key)
+{
+	static const u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	enum mt7925_nan_key_operation key_op;
+	enum mt7925_nan_key_type key_type;
+	u8 *peer_addr, *local_addr;
+	u16 wtbl_idx;
+	int err;
+
+	mt792x_mutex_acquire(dev);
+
+	key_op = (cmd == SET_KEY) ? NAN_KEY_OP_SET_KEY : NAN_KEY_OP_CLS_KEY;
+
+	if (sta) {
+		/* RX GTK: per-peer dedicated WTBL */
+		peer_addr = sta->addr;
+		local_addr = (u8 *)bcast_addr;
+		key_type = NAN_KEY_TYPE_MC_RX_KEY;
+
+		/* Lazy allocation of per-peer RX GTK WTBL */
+		if (msta->nan_rx_gtk_wcid.idx == MT792x_WCID_IDX_UNSET) {
+			if (key_op != NAN_KEY_OP_SET_KEY) {
+				mt792x_mutex_release(dev);
+				return 0;
+			}
+			err = mt7925_nan_wcid_alloc(dev, &msta->nan_rx_gtk_wcid);
+			if (err) {
+				mt792x_mutex_release(dev);
+				return err;
+			}
+		}
+
+		wtbl_idx = msta->nan_rx_gtk_wcid.idx;
+	} else {
+		/* TX GTK: not supported yet.  Each NAN Data Cluster uses its own
+		 * TX GTK, but mac80211 does not pass an NDC ID at set_key time,
+		 * so the correct key cannot be selected.
+		 */
+		dev_warn(dev->mt76.dev,
+			 "nan: TX GTK not supported (missing NDC ID)\n");
+		mt792x_mutex_release(dev);
+		return -EOPNOTSUPP;
+	}
+
+	err = mt7925_nan_manage_key_cmd(dev, key_op, key_type, wtbl_idx,
+					local_addr, peer_addr,
+					&(struct mt7925_nan_key_info){
+						.algo_id = mt7925_mcu_get_cipher(key->cipher),
+						.key_id  = key->keyidx,
+						.key_len = key->keylen,
+						.key_data = key->key,
+					});
+	mt792x_mutex_release(dev);
+	return err;
+}
+
+int mt7925_nan_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+		       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       struct ieee80211_key_conf *key)
+{
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv : &mvif->sta;
+
+	/* NAN RX IGTK/BIGTK (keyidx 4-7, sta != NULL) */
+	if (vif->type == NL80211_IFTYPE_NAN && sta &&
+	    key->keyidx >= NAN_KEY_IDX_MGMT_INTEG_MIN &&
+	    key->keyidx <= NAN_KEY_IDX_MGMT_INTEG_MAX)
+		return mt7925_nan_set_rx_igtk(dev, vif->addr, sta->addr, msta,
+					      cmd, key);
+
+	/* NAN_DATA GTK (keyidx 1-2) */
+	if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+	    key->keyidx >= NAN_KEY_IDX_GTK_MIN &&
+	    key->keyidx <= NAN_KEY_IDX_GTK_MAX)
+		return mt7925_nan_set_data_gtk(dev, sta, msta, cmd, key);
+
+	/* Unicast keys (NM-TK, ND-TK) and NAN TX IGTK/BIGTK use the normal
+	 * hardware path via set_link_key.
+	 */
+	return -EOPNOTSUPP;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 190de376ef54..0dcd1eeaa92b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -128,6 +128,16 @@ enum mt7925_nan_key_type {
 #define WTBL_RESERVED_ENTRY	0xFFFF
 #define NAN_PACKET_NUMBER_LEN	6
 
+/* NAN key index ranges from the Wi-Fi NAN spec.  mac80211 passes keyidx
+ * straight from wpa_supplicant without interpretation, so the driver must
+ * define these boundaries itself -- no kernel-wide equivalent exists.
+ * Wi-Fi NAN spec 7.1.3.2 (GTKSA), 7.1.3.3 (IGTKSA), 7.1.3.4 (BIGTKSA).
+ */
+#define NAN_KEY_IDX_GTK_MIN		1	/* GTKSA:  key ID 1-2 */
+#define NAN_KEY_IDX_GTK_MAX		2
+#define NAN_KEY_IDX_MGMT_INTEG_MIN	4	/* IGTKSA (4-5) + BIGTKSA (6-7) */
+#define NAN_KEY_IDX_MGMT_INTEG_MAX	7
+
 /* bit indices into mt792x_dev->nan_deferred_pending, set from the atomic
  * MCU-event RX path and consumed by mt7925_nan_deferred_work()
  */
@@ -586,6 +596,12 @@ int mt7925_nan_manage_key_cmd(struct mt792x_dev *dev,
 			      const u8 *peer_addr,
 			      const struct mt7925_nan_key_info *key);
 
+int mt7925_nan_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
+		       struct ieee80211_vif *vif, struct ieee80211_sta *sta,
+		       struct ieee80211_key_conf *key);
+
+int mt7925_nan_wcid_alloc(struct mt792x_dev *dev, struct mt76_wcid *wcid);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 07004066e666..7ab84de262d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -155,9 +155,7 @@ struct mt792x_sta {
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
 
-	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed)
-	 * Note: TX GTK is interface-level, see mt792x_vif->nan_tx_gtk_table
-	 */
+	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed) */
 	struct mt76_wcid nan_rx_gtk_wcid;    /* NAN_DATA peer: RX GTK WTBL (per-peer) */
 	struct mt76_wcid nan_rx_igtk_wcid;   /* NAN peer: RX IGTK/BIGTK WTBL (per-peer) */
 };
@@ -190,6 +188,44 @@ struct mt792x_nan_conf {
 	bool enable_dw_notification;
 };
 
+/*
+ * NAN WTBL layout (mt7925)
+ *
+ * TX scope -- determined by who shares the encrypting key:
+ *
+ *   mvif->sta.deflink.wcid          [NAN vif, interface-level]
+ *     TX IGTK/BIGTK: multicast management TX.  Shared by all NMI peers;
+ *     installed via the normal hardware key path (set_key fallback).
+ *
+ *   mvif->sta.deflink.wcid          [NAN_DATA vif, interface-level]
+ *     TX GTK: multicast data TX.
+ *     NOTE: all peers in the same NAN Data Cluster share one TX GTK, and
+ *     different NDCs use independent keys, so this really wants one WTBL
+ *     per NDC.  set_key returns -EOPNOTSUPP instead: mac80211 does not
+ *     pass an NDC ID, so the right key cannot be picked.
+ *
+ * RX scope -- always per-peer because each sender has its own key:
+ *
+ *   msta->deflink.wcid              [NMI or NDI peer, peer-level]
+ *     NM-TK (NMI unicast) or ND-TK (NDI unicast).
+ *
+ *   msta->nan_rx_gtk_wcid           [NDI peer under NAN_DATA vif, peer-level]
+ *     RX GTK: multicast data RX.  Keyidx 1-2; allocated lazily in set_key.
+ *
+ *   msta->nan_rx_igtk_wcid          [NMI peer under NAN vif, peer-level]
+ *     RX IGTK/BIGTK: multicast management RX.  Keyidx 4-7; allocated
+ *     lazily in set_key.
+ *
+ * Example -- 2 peers, full security:
+ *   1  NAN vif WTBL                 TX IGTK/BIGTK
+ *   1  NAN_DATA vif WTBL            TX GTK
+ *   2  NMI peer WTBLs               NM-TK (one per peer)
+ *   2  NDI peer WTBLs               ND-TK (one per peer)
+ *   2  RX GTK WTBLs                 nan_rx_gtk_wcid, one per NDI peer
+ *   2  RX IGTK/BIGTK WTBLs          nan_rx_igtk_wcid, one per NMI peer
+ *  = 10 WTBLs total
+ */
+
 struct mt792x_nan {
 	struct mt792x_nan_conf conf;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 1965e9de7099..472333ac1a62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -828,6 +828,13 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 		wiphy->nan_capa.max_channel_switch_time = 12;
 		wiphy->nan_capa.dev_capabilities = NAN_DEV_CAPA_EXT_KEY_ID_SUPPORTED;
 		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SECURE_NAN);
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION);
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_PROTECTION_CLIENT);
+		/* Per-peer group key WTBL needed for NAN RX IGTK/BIGTK delivery:
+		 * ieee80211_key_enable_hw_accel() drops per-STA group keys unless
+		 * this flag is set or the vif is NAN_DATA.
+		 */
+		ieee80211_hw_set(hw, SUPPORTS_PER_STA_GTK);
 	}
 
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
-- 
2.43.0

