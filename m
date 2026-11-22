Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371143;
	b=dwafBMilPzstrzyr4hEPVl00NuDwTLQzHHunShCJ4mIF2GXSoGYkU4QoDg0UF7noSvpw
	 V+Ak0j9txw9pcLfRasRzILtG3F5uVNIhuRRBgJF0qUq/rv9UA+egl9IZnzWIU+UJ0f/C+
	 4khXF1CWrU/h6XbDjrU1xnqvBhydDwtoRA+brt/4zV/oqbxPRKX/zL1mo8SmeogIGB/Wk
	 y6PjClTXiff5NBNXOnf4aDDzXMrkEz/yLbEZw+v9zpIGvvk+LKNHO5LeRfE3TKm8v9xmV
	 0C2jPPa82BhtnGEJzZSucHAzrAB6hVgQ9zDSc4+8fLH6eNs/PE7PwZZqxXEatqbTxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GAq4IkIOet4Pk0GS2U/anQiFA+lR+8Je61Jyy7n2K/w=;
	b=lJ6lob/6EWBBcNl8RFfW8Bq5dCGmpf3ZmRfYxJIVfM1NY+yHXD3VkYrobvQdx0CmPLFv
	 tGQ9zGZ9e1O2AczZEZtH/p+AuE/XV4MCSit8erOC32MQBxQO875TDm/MA9BHJ7bzJDFi8
	 ue5R3e+7bpzD42n/cpvHs1mh7kUK99c6ItEnlgJFoemfqkpnPDROE2dfYd4dsb0+RphiP
	 5N20hhLS+ooJNeM1PGGfE8hk5JAt2xsEBI9LvpeW/H7XwvNfZMb8zgXmx/ivYYPvvkbfu
	 /h77qfLv6CK4oEVhpMe4sNEQ2NEJnk+LULNyHY3vrhHc7d+rv6OeJCyXZ24nH7QUyHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=H5BEZRBF;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985DF606A334
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985DF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=H5BEZRBF
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso2889600a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371141; x=1795975941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAq4IkIOet4Pk0GS2U/anQiFA+lR+8Je61Jyy7n2K/w=;
        b=H5BEZRBFT+OdKFNfXM/uAqjRb+jVSC73Wq89Fe4NH1/hwnKuz2/hovcjDL2mmFNM2A
         sPnOzN6viQnzAK7FseYSbLZjKdmaPL6ttKiDG4b1iux0bRplsz48CaVtTT5ytn7xXjHl
         7QHXHEQaebxMKfU5JOXOd3t/B/qcvO3lm8tR1hPVvx07Ul9hhcb3hIMRfb+qY0QcG1y0
         +gGqtYYTMWRGAiNdwAx1Oglf3lwnetQM59UqKVNx7ZA3Kion2oSs0brnPkzo1ZFQ3paH
         u4r8DZFxOgl19IE9LFGsvLHNttCXt3XaXtMesJO9NYtKANlhhFYBg2sBEeRSAL5mEY1u
         pMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371141; x=1795975941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAq4IkIOet4Pk0GS2U/anQiFA+lR+8Je61Jyy7n2K/w=;
        b=NBb9a4k+W0DANQ1jdqqhzKOGFcXnHuEVYpVA9Bw+gJMGKs16S2lp/j0JQ+Csm/RH9h
         HKQai/xERSPKDxUfFk+jCvPZZ1zz+MUr2e1blq3c/8n0UmWOZd1ImjI8k1SZg3SRRgz4
         8+HUBPoJbAEidssIafFlPlrqcjWQhoiy05QgISB+pAsy7JNaRylYV+ffb9n0tfa8kWhs
         ZfUiPHpHcGP1OUkQVKGka7WbM1kWyS121dcPRIptwnejMOG9dPVJgb/Q8RLIJ0MZ22h8
         sUNMytCjiHQoy0f8tAIgystWtL1y0pjAHbKn9CHqh7LK6gUvDw/ogl05lMeWebpEjSHL
         EtKA==
X-Forwarded-Encrypted: i=1; AL+hErHUzfT29fcP0X0D/BJaQlJr514xhvOVO4cCRi7QRZWMQ3NOVOWAjRHp1E40wlJqjEmRa7nsMH2DDrBHteIt1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+T8H5teGeNtQJcx1IDt5AbntR9OShur5CyLjz73jw/8z2yafeZ
	N02bIm6ACHuBfhLbw8BKqG5l0BDMzAjIjaVJ1oQzfD2jATqUlZMvlyG0fGLciMqEhg==
X-Gm-Gg: AZFdTZfTqIgiIL+Jwom+w97+HxKLcytmgjlIkqBYuiNW/KRIHCge/1Zz1JUKR+QAIt3
	oBFErwPwQeCvDelzG68N7Dq/U4elqdhRTYmJjb9PtJmsYyBTGxL6SYuAZH+xVkji4od/D9Q6Htd
	bPQSlVoPMXaqTs3Qyv8sXFHrMYQO4Le8Xq9RcPNEwfwqsmuZw+4oS7h8v8Og3j1+K553cmna701
	deGqAQ/0BB/78r3DRHr2I1HiVWYNLlEoF2kJMJhtOZb3DNScoTm4mULNN0UGY5kkRfa4F4zQHC3
	tnnOj3GJHCtO3eOB1Qhya5mSPBoMaTPPifSWFwi9DAcqn/7f63JGd+bnKyy6WtEQVJunsaJj1G1
	RzguV5+ikOSFzK80mpmVQCKYuFeikg21oSSHaqQN12aEDNoAgIHYWS2ZHSvxvn8y+PNvu2W+PFC
	qDXgG0/M1nvTMuFAJ22XTyiUImEvkeQk35/+I2/Ax5cOsfLai2iXRdFPRYTCRUXKl/s6HvbkJfB
	lCistYcltlH05oET/Fkq7YohG67So3BRv1i/qVG1FgmaTDnco/BwDKjF/3iGm3T0HwSGUmFMJKm
	fYfWtgOzibYOhulVugpmZbSIyiub/Qpk5BTmIPO5Ix20xIWHR3lik5tAMjAE100y+bAKGgWMPjP
	BjmY/YlTOrpZTq4MLWdaAWuWO0aUg4Cd6AfM6LMDyYAbmP9wlODLleXGhj0jYbCJW62VlxUPUdv
	2qEVGS23Kgeysnv2iVh+fkyQurNH1GkV0XF6JvFzsfzA02HHpCwTFSLADFKzPAgXu07O8KaE+7O
	PeAnVeIS9JAuM1CDlX/kLwSsf/gQt0NYnG43bFe3OuNbpy86m0+iZg93uhE0n/2+oHSIiQu4hu+
	BdAbV+0U7Bx1OTTY2peCDipYnlL4B7LYO1lEzZwHvyqxI/pAgY0C8PxHOrDTwJH7YJbXYGY/
X-Received: by 2002:aa7:d819:0:b0:6b8:a703:8ffe with SMTP id 4fb4d7f45d1cf-6ba37c7ba68mr5099318a12.5.1795371140985;
        Sun, 22 Nov 2026 10:12:20 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:19 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 4/9] wifi: ath11k: replace the TX buffer IDR with a table
Date: Sun, 22 Nov 2026 19:12:08 +0100
Message-ID: <20261122181213.1016590-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

Every transmitted frame took a buffer id from an IDR when it was queued
and gave it back on completion. Keep the ids of each TCL ring in a table
indexed by id with a stack of the free ones, so both steps take constant
time. The id range stays the one the IDR handed out.
The recovery path that returns the frames a crashed firmware holds walks
the table as well.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

ath11k_dp_tx_idr_has_room() now reads the count of free ids, and the
num_txbuf counter it read until now goes away.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    |  30 ++++---
 drivers/net/wireless/ath/ath11k/dp.h    |  11 ++-
 drivers/net/wireless/ath/ath11k/dp_tx.c | 104 ++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c   |  20 +++--
 5 files changed, 115 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 833feb981cfc..e7eab9857f29 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1015,17 +1015,21 @@ void ath11k_dp_vdev_tx_attach(struct ath11k *ar, struct ath11k_vif *arvif)
 	ath11k_dp_update_vdev_search(arvif);
 }
 
-static int ath11k_dp_tx_pending_cleanup(int buf_id, void *skb, void *ctx)
+static void ath11k_dp_tx_pending_cleanup(struct ath11k_base *ab,
+					 struct dp_tx_ring *tx_ring)
 {
-	struct ath11k_base *ab = ctx;
-	struct sk_buff *msdu = skb;
+	struct sk_buff *msdu;
+	u32 id;
 
-	dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
-			 DMA_TO_DEVICE);
-
-	dev_kfree_skb_any(msdu);
+	for (id = 0; tx_ring->bufs && id < DP_TX_IDR_SIZE - 1; id++) {
+		msdu = tx_ring->bufs[id];
+		if (!msdu)
+			continue;
 
-	return 0;
+		dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr,
+				 msdu->len, DMA_TO_DEVICE);
+		dev_kfree_skb_any(msdu);
+	}
 }
 
 void ath11k_dp_free(struct ath11k_base *ab)
@@ -1042,9 +1046,8 @@ void ath11k_dp_free(struct ath11k_base *ab)
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
-		idr_for_each(&dp->tx_ring[i].txbuf_idr,
-			     ath11k_dp_tx_pending_cleanup, ab);
-		idr_destroy(&dp->tx_ring[i].txbuf_idr);
+		ath11k_dp_tx_pending_cleanup(ab, &dp->tx_ring[i]);
+		ath11k_dp_tx_bufs_free(&dp->tx_ring[i]);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
 		kfree(dp->tx_ring[i].tx_status);
 		dp->tx_ring[i].tx_status = NULL;
@@ -1093,8 +1096,9 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
-		idr_init(&dp->tx_ring[i].txbuf_idr);
-		atomic_set(&dp->tx_ring[i].num_txbuf, 0);
+		ret = ath11k_dp_tx_bufs_init(&dp->tx_ring[i]);
+		if (ret)
+			goto fail_cmn_srng_cleanup;
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
 		spin_lock_init(&dp->tx_ring[i].wake_tx_lock);
 		dp->tx_ring[i].tcl_data_ring_id = i;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index bf7439e8b37d..f3dcba777a34 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -84,13 +84,12 @@ struct dp_tx_ring {
 	u8 tcl_data_ring_id;
 	struct dp_srng tcl_data_ring;
 	struct dp_srng tcl_comp_ring;
-	struct idr txbuf_idr;
-	/* Protects txbuf_idr; num_txbuf changes with it and is read without */
+	/* Buffers by the id their descriptor carries, and the ids not in use */
+	struct sk_buff **bufs;
+	u32 *free_ids;
+	u32 num_free;
+	/* Protects bufs and free_ids */
 	spinlock_t tx_idr_lock;
-	/* MSDU ids in use, one per frame between ath11k_dp_tx() and its
-	 * completion
-	 */
-	atomic_t num_txbuf;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
 	struct hal_wbm_release_ring *tx_status;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index bd5edab32a1f..feeaba575966 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -79,33 +79,88 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 	}
 }
 
-/* The caller holds tx_ring->tx_idr_lock. */
-static struct sk_buff *ath11k_dp_tx_idr_remove(struct dp_tx_ring *tx_ring,
-					       int msdu_id)
+/*
+ * The ids a ring hands out, as a table indexed by id with a stack of the free
+ * ones: the completion's cookie names the buffer directly. Callers of the id
+ * helpers hold tx_idr_lock.
+ */
+int ath11k_dp_tx_bufs_init(struct dp_tx_ring *tx_ring)
 {
-	struct sk_buff *msdu;
+	u32 id;
+
+	tx_ring->bufs = kvcalloc(DP_TX_IDR_SIZE - 1, sizeof(*tx_ring->bufs),
+				 GFP_KERNEL);
+	tx_ring->free_ids = kvcalloc(DP_TX_IDR_SIZE - 1,
+				     sizeof(*tx_ring->free_ids), GFP_KERNEL);
+	if (!tx_ring->bufs || !tx_ring->free_ids) {
+		ath11k_dp_tx_bufs_free(tx_ring);
+		return -ENOMEM;
+	}
+
+	tx_ring->num_free = 0;
+	for (id = DP_TX_IDR_SIZE - 1; id--;)
+		tx_ring->free_ids[tx_ring->num_free++] = id;
+
+	return 0;
+}
+
+void ath11k_dp_tx_bufs_free(struct dp_tx_ring *tx_ring)
+{
+	kvfree(tx_ring->bufs);
+	kvfree(tx_ring->free_ids);
+	tx_ring->bufs = NULL;
+	tx_ring->free_ids = NULL;
+	tx_ring->num_free = 0;
+}
+
+static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
+				   struct sk_buff *skb)
+{
+	u32 id;
+
+	if (unlikely(!tx_ring->num_free))
+		return -ENOSPC;
+
+	id = tx_ring->free_ids[--tx_ring->num_free];
+	tx_ring->bufs[id] = skb;
+
+	return id;
+}
+
+static struct sk_buff *ath11k_dp_tx_buf_put_id(struct dp_tx_ring *tx_ring,
+					       u32 id)
+{
+	struct sk_buff *skb;
+
+	if (unlikely(id >= DP_TX_IDR_SIZE - 1))
+		return NULL;
+
+	skb = tx_ring->bufs[id];
+	if (unlikely(!skb))
+		return NULL;
 
-	msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
-	if (msdu)
-		atomic_dec(&tx_ring->num_txbuf);
+	tx_ring->bufs[id] = NULL;
+	tx_ring->free_ids[tx_ring->num_free++] = id;
 
-	return msdu;
+	return skb;
 }
 
 /**
  * ath11k_dp_tx_idr_has_room() - tell whether ath11k_dp_tx() can take a frame
  * @tx_ring: the ring the frame would go to first
  *
- * ath11k_dp_tx() allocates the frame's MSDU id from the ring's idr, which
- * holds DP_TX_IDR_SIZE - 1 ids and frees one when the frame completes. A
- * caller that takes a frame from mac80211 only to have it refused for a full
- * idr loses the frame, so it checks first.
+ * ath11k_dp_tx() takes the frame's MSDU id from the ring's free ids, of which
+ * there are DP_TX_IDR_SIZE - 1, and the frame's completion returns it. A caller
+ * that takes a frame from mac80211 only to have it refused for want of an id
+ * loses the frame, so it checks first. The count is read without tx_idr_lock:
+ * an id taken in between costs that one frame, as before the check.
  *
- * Return: true if the idr has an id free.
+ * Return: true if an id is free.
  */
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
 {
-	return atomic_read(&tx_ring->num_txbuf) < DP_TX_IDR_SIZE - 1;
+	/* Read without tx_idr_lock: a stale count costs at most one frame. */
+	return data_race(tx_ring->num_free) != 0;
 }
 
 /*
@@ -158,10 +213,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	tx_ring = &dp->tx_ring[ti.ring_id];
 
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	ret = idr_alloc(&tx_ring->txbuf_idr, skb, 0,
-			DP_TX_IDR_SIZE - 1, GFP_ATOMIC);
-	if (likely(ret >= 0))
-		atomic_inc(&tx_ring->num_txbuf);
+	ret = ath11k_dp_tx_buf_get_id(tx_ring, skb);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
@@ -320,7 +372,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_remove_idr:
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	ath11k_dp_tx_idr_remove(tx_ring,
+	ath11k_dp_tx_buf_put_id(tx_ring,
 				FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
@@ -340,7 +392,7 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	struct ath11k_skb_cb *skb_cb;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
+	msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -383,9 +435,11 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 		tx_ring = &ab->dp.tx_ring[i];
 
 		spin_lock_bh(&tx_ring->tx_idr_lock);
-		idr_for_each_entry(&tx_ring->txbuf_idr, msdu, msdu_id) {
-			ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
-			__skb_queue_tail(&pending, msdu);
+		for (msdu_id = 0; tx_ring->bufs && msdu_id < DP_TX_IDR_SIZE - 1;
+		     msdu_id++) {
+			msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
+			if (msdu)
+				__skb_queue_tail(&pending, msdu);
 		}
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
 	}
@@ -412,7 +466,7 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ath11k_peer *peer;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = ath11k_dp_tx_idr_remove(tx_ring, ts->msdu_id);
+	msdu = ath11k_dp_tx_buf_put_id(tx_ring, ts->msdu_id);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
@@ -862,7 +916,7 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 		}
 
 		spin_lock(&tx_ring->tx_idr_lock);
-		msdu = ath11k_dp_tx_idr_remove(tx_ring, msdu_id);
+		msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 380e35e354f5..50b6178ceb38 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,8 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
+int ath11k_dp_tx_bufs_init(struct dp_tx_ring *tx_ring);
+void ath11k_dp_tx_bufs_free(struct dp_tx_ring *tx_ring);
 int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 				    int budget);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0af4f2fe27bb..513559585371 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7361,15 +7361,20 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static int ath11k_mac_vif_unref(int buf_id, void *skb, void *ctx)
+static void ath11k_mac_vif_unref(struct dp_tx_ring *tx_ring,
+				 struct ieee80211_vif *vif)
 {
-	struct ieee80211_vif *vif = ctx;
-	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
+	struct ath11k_skb_cb *skb_cb;
+	u32 id;
 
-	if (skb_cb->vif == vif)
-		skb_cb->vif = NULL;
+	for (id = 0; id < DP_TX_IDR_SIZE - 1; id++) {
+		if (!tx_ring->bufs[id])
+			continue;
 
-	return 0;
+		skb_cb = ATH11K_SKB_CB(tx_ring->bufs[id]);
+		if (skb_cb->vif == vif)
+			skb_cb->vif = NULL;
+	}
 }
 
 static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
@@ -7434,8 +7439,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
-		idr_for_each(&ab->dp.tx_ring[i].txbuf_idr,
-			     ath11k_mac_vif_unref, vif);
+		ath11k_mac_vif_unref(&ab->dp.tx_ring[i], vif);
 		spin_unlock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
 	}
 
-- 
2.53.0

