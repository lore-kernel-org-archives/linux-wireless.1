Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871191;
	b=cICYWQdAah+34Dx9i6ZUG8hCu4+RKEwaDKxwsR+xfp//+8MEl0eT6zMVqcIOpbIUUN46
	 FFEM3zWVazGyJ4vh2z7kayzWaMS8MhUHwQYpUJHSmxNjFxqq/vwbn3slXhGPkoms9mc0j
	 uVXInhAGawf4DnjwpaCVqKWW2lLu++BvMvH8i5BLSEckg/zw7/K/paKFuIWkJD5dtvV/6
	 nTvI8y9uJvmM7K38oPj8Cg1QzSA7EGMI7HSYra4w+jSz0BUniZmz6vcbhm1P7l66+c9/x
	 BM4/nES6md/bOHMvZIgvseOyYFLrDau8pzHYrSzF8SenxFV5Gy/+HMlvpTzzGJMu8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ovD5H6S5jQwSZumZQjn/7Elyf6SaJFCwpBEMaO/7ZD0=;
	b=AL/fEdW6n8/D/s6nyx4fR1/4CMGKsa6+WeiwafiJ6g/7GKpXKAicP3KCnNO81jIjIysJ
	 9/VMiHZkM+uVCDQQoXCetdtU64G0p9QIvN+qBHZH5dIeHFV4RUswih/vgiirjWKZv4LMo
	 2299mT6fbL7fwVwg4YNGKinyI0P4Aky9RLRko6l8TPVSHEdgaJmJI82t9NqA9e2/iYLEW
	 n8RZ7h3F7iMLBDHNNT3lhM9/XYoNUqgSFtinkm12nn3omVwaiAY24cFiPXeA838uFTVNf
	 Qzp7l4AGDHGIaxSBXd7EH1UI35Prr/iY4YGLK7y+w1yrMG0KoCkPnmgkJ/y7v/3MA2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAC606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f14642adb4so2943499b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871189; x=1795475989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovD5H6S5jQwSZumZQjn/7Elyf6SaJFCwpBEMaO/7ZD0=;
        b=EWdfzSMj8uTHMMEXZxpuH+uXSTiET9mtiirIszW+nTOtCbg7O2Y6vPvyhA31v/DZf1
         9zM901DOulcqfMcztf+P1vbnTEW4HD1knV4MdyalK8DIo9fqblsE5yhimCSHcjOrlNhh
         mzbnCu5q+YfWqHmg4wuVh+fdthVDjtNrtmrfRVyWRKHCVOfUqURx203EU76PgKA5tVf6
         DhPIwNyFW8jAOawdQyFx8aCVXfVPoQLdZmS96wVPzYEySZXZUF2qeL4BKWZjdEgFayxY
         A8lNmf13NvZvTweVJ//xJOYgIxeVazfEcJLVfv8dE8eeY+E4j7BJgDnMkb/fmn2kYdsb
         W7ug==
X-Forwarded-Encrypted: i=1; AL+hErGdCWwL2bELwQbo3M74dpLHiLVM8SQjbnuN97cNQUmV0VvIffl0JjFVuXy9K6hmRitl3XrxGQJAJMB3cdvcnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ymRZnQZmA581OrIU+avsrrV8WXIkLsCQciBI3qZv9MbNmCVsY
	6w9GcdKY5Hmzsy4kAe+bWbvQ5NoMyqQUwa/ecDKnJ0qykK2dyQNCDJDm
X-Gm-Gg: AYBFou2gp2UzBUUShGpya3jy37AGoozOILUuqAOEkvFRNu0cvmW5cDdBVy3n+cUmWeR
	ha+3NTWEbFj/i6uTQKz+q5hf3GmK0+BuSUxlwHJzY9kArbKLANPSSekESKnlg+haa5iYgIKBaO3
	/FoAHzOm9QbGX1xwxMtG7Oui5pgLBP/1LPCOjBUQfKDPy0JOAEolWjYc+pl0OnBSZGjkzlVIrbO
	L2KE40HQUnR1cLX/IxaqP8CaWIuAjCHsfJC5nXSxeYTz9Vv4JxLWnXalD6t3nw+xblmcbwZyiBv
	weDSUI/VnMI1h6nBi05r1x/QqhmO383D+lowG2rINek2YFs8QAVUUAo/5VyokuIQUtcr2mN1gBd
	ZVObYIbsFARssOj3xhMs4l3L1/86QO+Bxgz/uZue6W5xfXB8ZiMPtDxtiLmkRcNDSt8ZrNTnjso
	YyD/Hts/RA5kRrhlgXPVlO+q+fnTpc8MSp8wxlBx6cH8r2iCozeyvcZXiK9RjhUQyHLXs8GpYGc
	Jc+rhNiec6NINyclLvmaNWMI9MLWvPcKgWZnZZ6pPGuDw5rQNOMm5Om1OgN8uI40B9ViuTm7ipZ
	BYthA/4DLam0z7EXYWseuP6nKhfBBC/S07qkFa2hlT5KAZK5veuIHKMfry/6jG2eq5lsJJc30c6
	coGRHiZZd
X-Received: by 2002:a05:6808:6d82:b0:573:1dfa:f0c2 with SMTP id 5614622812f47-5731dfaf630mr5362400b6e.29.1794871188866;
        Mon, 16 Nov 2026 15:19:48 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:47 -0800 (PST)
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
Subject: [PATCH v2 14/19] wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap state
Date: Mon, 16 Nov 2026 17:16:25 -0600
Message-ID: <20261116231630.1733906-15-sean.wang@kernel.org>
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

Unencrypted unicast NAN management is held to the discovery window on the
DW-WTBL, because a peer whose NDL is not yet confirmed is only reliably
awake there. That is the right call while nothing is known about the
peer, but it stays in force for the whole session, and the DW is a narrow
place to live: it opens for 16 ms every 512 ms and is shared with the
discovery queue, so roughly four transmit opportunities exist inside the
two seconds a Data Path Response has to complete. Under load the
handshake loses that race. Routing the same frames through the peer STA
WTBL was what made NDP setup reliable with a partial availability bitmap
in the first place, since the firmware then paces them by the committed
window instead of bursting blindly.

Neither placement is right on its own: the peer WTBL is only usable once
the firmware actually holds that peer's committed bitmap. A peer station
existing in mac80211 does not imply that - until the CRB download lands,
the peer's availability gate has no slots to open and a frame steered
there parks behind the pause until the session is torn down.

Track the committed state per peer. mt7925_nan_fill_crb_committed()
returns the number of committed slots it programmed, and
mt7925_nan_update_crb_tlv() latches whether that count was non-zero into
nan_sched.has_commit; the allocation rollback in
mt792x_nan_set_peer_schedule() and the peer record removal in
mt792x_nan_set_peer_rec() clear it again. Frames to a peer holding a
committed bitmap keep that peer's WTBL and are served in the slots it
has promised to be awake for; frames to a peer without one, and frames
with no station resolved, keep riding the DW-WTBL. Secured frames are
untouched and keep their own WTBL and key.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 30 +++++++++++----
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   | 37 +++++++------------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 0fe8ae6c0d26..aa030dca7e01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1336,14 +1336,14 @@ static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
 	return 0;
 }
 
-static void
+static u32
 mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
 			      struct ieee80211_nan_peer_sched *sched)
 {
-	u32 m, slot;
+	u32 m, slot, total = 0;
 
 	if (!sched)
-		return;
+		return 0;
 
 	for (m = 0; m < CFG80211_NAN_MAX_PEER_MAPS &&
 	     m < NAN_TIMELINE_MGMT_SIZE; m++) {
@@ -1369,10 +1369,14 @@ mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
 			if (!ch || !ch->chanctx_conf)
 				continue;
 
+			total++;
+
 			for (dw = 0; dw < NAN_TOTAL_DW; dw++)
 				tl->avail_map[dw] |= cpu_to_le32(BIT(slot));
 		}
 	}
+
+	return total;
 }
 
 static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
@@ -1397,9 +1401,10 @@ static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
 	crb_tlv->is_use_ranging = false;
 	crb_tlv->comm_ndc_ctrl.is_valid = false;
 
-	mt7925_nan_fill_crb_committed(crb_tlv, sta->nan_sched);
-
-	return 0;
+	/* Returns the number of committed slots programmed; the caller latches
+	 * has_commit only once the command has actually reached firmware.
+	 */
+	return mt7925_nan_fill_crb_committed(crb_tlv, sta->nan_sched);
 }
 
 static int
@@ -1442,6 +1447,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 	struct mt792x_nan *nan;
 	struct mt76_dev *mdev;
 	struct sk_buff *skb;
+	int committed;
 	int ret;
 
 	if (!dev || !sta)
@@ -1480,7 +1486,8 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 		}
 	}
 
-	if (mt7925_nan_update_crb_tlv(skb, sta, msta)) {
+	committed = mt7925_nan_update_crb_tlv(skb, sta, msta);
+	if (committed < 0) {
 		ret = -ENOMEM;
 		goto free_skb;
 	}
@@ -1493,6 +1500,13 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 	if (ret && idx_allocated)
 		goto clear_idx;
 
+	/* Latch only now: firmware holds this peer's committed bitmap, so its
+	 * availability gate has slots to open and unencrypted NAF may be
+	 * steered at the peer WTBL. Cleared when the CRB is torn down.
+	 */
+	if (!ret)
+		msta->nan_sched.has_commit = committed > 0;
+
 	return ret;
 
 free_skb:
@@ -1503,6 +1517,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 clear_idx:
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return ret;
 }
@@ -1566,6 +1581,7 @@ int mt792x_nan_set_peer_rec(struct mt76_dev *mdev,
 
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index eb07abfef209..7f6da681b4a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -33,16 +33,15 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	 * full retry budget on an unACKable multicast RA, so one frame eats a
 	 * whole DW window and the publish SDF queue backlogs.
 	 *
-	 * Unencrypted unicast to a peer we have no station for is first
-	 * contact (SDF, NDP request): the DW is the only rendezvous, so it
-	 * goes on the DW-WTBL and waits for it.
-	 *
-	 * Once its schedule is known - the peer station exists, which is also
-	 * when firmware holds its committed bitmap - the frame belongs on that
-	 * station instead. Firmware then airs it inside the peer's own
-	 * committed slots, where the peer is awake and the medium is not the
-	 * DW pile-up, and follows the FAW onto whatever channel the window
-	 * actually uses rather than being pinned to the DW channel.
+	 * Unencrypted unicast is handshake traffic (SDF follow-up, NDP
+	 * request/response, pairing bootstrap). Until firmware holds the
+	 * peer's committed bitmap its availability gate has nothing to open,
+	 * so a frame steered at the peer WTBL would park behind the BY_NAN
+	 * pause; such frames ride the DW-WTBL, which firmware unpauses every
+	 * DW - the one rendezvous both peers must be awake for. Once the CRB
+	 * download latches has_commit, the frame keeps the peer's own WTBL
+	 * and firmware serves it in the committed slots, which a 2-second
+	 * handshake deadline needs (the DW alone offers only ~4 shots).
 	 *
 	 * Secured frames belong to an established peer and keep its own WTBL
 	 * and key.
@@ -52,24 +51,16 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		struct mt792x_vif *mvif = (void *)vif->drv_priv;
 		bool mcast = is_multicast_ether_addr(hdr->addr1);
 
+		struct mt792x_sta *peer = (!mcast && sta) ?
+			(struct mt792x_sta *)sta->drv_priv : NULL;
+
 		if (mcast && wcid == &mvif->nan_dw_wcid) {
 			wcid = &mvif->sta.deflink.wcid;
 		} else if (!mcast && !key &&
+			   !(peer && peer->nan_sched.has_commit) &&
 			   mvif->nan_dw_wcid.idx &&
 			   mvif->nan_dw_wcid.idx < MT792x_WTBL_STA) {
-			struct ieee80211_sta *psta;
-			struct mt792x_sta *pmsta;
-
-			rcu_read_lock();
-			psta = ieee80211_find_sta(vif, hdr->addr1);
-			pmsta = psta ? (struct mt792x_sta *)psta->drv_priv :
-				       NULL;
-
-			if (pmsta && pmsta->deflink.wcid.idx)
-				wcid = &pmsta->deflink.wcid;
-			else
-				wcid = &mvif->nan_dw_wcid;
-			rcu_read_unlock();
+			wcid = &mvif->nan_dw_wcid;
 		}
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index c46b88467193..586352f4b1d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -134,6 +134,7 @@ struct mt792x_sta_nan_sched {
 	u16 committed_dw;
 	u32 sch_idx;
 	bool idx_assigned;
+	bool has_commit;	/* last CRB carried a non-empty committed map */
 	unsigned long ndp_ctx_bitmap;
 	bool ndp_ctx_assigned;
 	u8 ndp_ctx_id;		/* assigned NDP context ID (for NDI sta) */
-- 
2.43.0

