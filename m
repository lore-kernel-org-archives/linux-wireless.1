Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371152;
	b=tt7aEsWB7X/YjSnN1WRYTlQT9Hk5haTMS5HJRdEtVBCyAiaFbzUgCcvBwCP+lnPITmPf
	 nMy46dja3zNYUiZk1MD/xV01457o0sGXTcd/Z4yyMvYS1v10AGFNNS34WMHJnWWAmvo93
	 mdwFJYM433HofMqx47mVQxAmmbWKfR3rplbKe40N06/2u9gCIbYLlTo/Fumq2G/v5ZKX1
	 RrczbK+DLEL7fA+GSIJz3XC1n8Elgb4dMt/2nKdu9EagMK9KdcQspYoA0kb9ojIfyKCVZ
	 mZNX8UCE/d0AipMjSeWBLj+KqsiqItjheIdvmW7IQ1L0fJ5BgIStojXfBm9KXaHL1Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
	b=IlLYskYDZ2t+DNC8AD4saIiD488MZkTykOY/S7+IC3TdJ6d8Zj49mYELPMP+1GrXBpUg
	 sBA1ELwNdJNJnIj3MrYYNqRu1fzzeO8/vOaYiY8vBSd9I+DME3L7zDSMR/HSmL95IeUay
	 NlVF/Eb6Bd8jCIxsHowqBNw/w5Z1AlOiCx2C5IHODV7YAPJ2YlQIV+umX9+rP1YLBMxxl
	 S88tlT+EeGQaEWjHi52kJe4BVrmSce07lH1l3Su/u5TWymgvOgOYZtw73GqshTdCT9SSa
	 dHSFWWcTVZZ+B+rw06ajeqFoSd1A0DRhSHruV67phDCbSnPwddlOGga6GRJ+6kK/bgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n55T4atq;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2D606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF2D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n55T4atq
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so3147543a12.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371149; x=1795975949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
        b=n55T4atq0RkqaxITMJ1n9Dv2RTjlzbtf5aBwf8j8k3A9cA5QS2DknjUkkx36MhIQ+0
         J94D9QeUOAbAMKLHCRWSDP5plHTb4+ZjRJ9Rvu1ot3LP3Nugx7Kh6nhfHsqU6qFc0dg8
         uKRzUpWbgKupK0CeMhuHVYiYe4jgNpOFxzibB0tdZFs47+G1ncAx/g4LXa19IZx+oYNK
         Uy4ar3o7XRW4bUZ5OeWAyPjZlurFACG4T0+kI48ac6eNaV7JupOrNTVsZn+xt4oZi/Xs
         ZtHTIJvnABHBYWM+4z9aHCYkz3dUAEoshGVVRqZR1OSxmk3BERzQd6KdzaFwwiz8XVkP
         EhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371149; x=1795975949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+9Vw6GD+kj8DkWaZDhjtYfJzZmDs1hAIA4ATrmqD4A=;
        b=O+CUnhG7toFjDeY9zVOuEN7xPCCmo69vWHL+5OH11HNl42glxxM2kKhEkjhJ1T//jK
         yWK5oNT5WVkHdFfzklPFScejs28r3wFzI9J0dVafe1itd59DuLf99YLeKeT4iZLrKsyf
         RQ805IKPJ1MQMB1/74m7Ggoza5o+5d5lh4v99SS1icBgX9OUtjDzY3wiIFqyE8NswmUp
         AWfg3eMd0BAIVEItfjuX086EBdBOV+INh6JiZibw7XPHFIR097GQp6VJYA113oHqHdKv
         clsRCo1HV72UTOcs88JLW9SHZ7uksmFZFN9sAdGLvuYs1yPL1c106KrjhrAxdM+8kw6e
         GqTA==
X-Forwarded-Encrypted: i=1; AL+hErEcrTWRCB0qJqieskSUw1vR+Oth5H7xfWnQR/5hwkV/SS6NYVMWfd9zqNAklwnljw9SRVvSMvmX8kZlTKW2rA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/vg2V/wOIe2T1OVpS3CfRQnhjmb+mLjFsAwu8hOz79m67oqXn
	DeYIOZfEAwTckzwHcxRZOr7Wg9wiIxt/Sncb8s891DcaUKkGNDu7hn52zMAvuAPdeQ==
X-Gm-Gg: AZFdTZcYAIKM65xDHUT/AiNEjluGTY/LzunOb5IPY2citup+gMMeTPCh6zpIt9i1zh0
	X8yDcX6E1QUN/WqyE2c/gfVNTxxbegOZKlX2oGz6sB6PItv966EVFHYzFZ9MYqRJtQIGz/Vsd5p
	yCoP77Syk6URQniOh7wXVRKQ0TYWp4ItWMQzBCZnSZDHxAjlj00NJxxytMPzLwl5BOMyc4QniAg
	IbWWfClrtGx/GTA5l2ShIbHvU5mvvch9wWc0K6ToHY+NQ63qGB2AyuEDKGD/opQ/00OULivTOyG
	i5kO6XsvXBJBuafZ9F7bnMbtOTKbTQioIv4em+usuT/v/kxFvP2G41vqI2o/w949RP31KN/HZRS
	h++3JRhjkGDTcifslsGHHcHDHBRqBc2SQyQAA1qYxMWhrAOaJu/QsY5Kevz81bBKYOVV4fCQB9s
	ZXpTG3etJ891kcs36l0CS9rjtQl1egMJTwDG9h0rfJS/uZtIjzmRIJ1wU8MrZWB37qPn9WcN5Dq
	GUIiLs87X9q1Gt+ev2QKPCIVaJBDDEFy+fJf1qq80W1KL01wS3SJIrH/1iUQYi8fy+YkGdFN1PH
	VLyTukaqQoFTknyg87vPcIdBX9rVf8v5oc9EIlTIDaEilFTjyKEW6+GvMt2d4/UBwur4Z67lmve
	foGRMPdbks3bIHQQJnna2T6TfkrQm7t2FW+k6JWJyf+cLXH/K598NYUEKk0h3z/GMzixjVRtRoL
	iIz8HbysTq3M1BuEJ09E0k4Ol22E7yhiChbYE9sq6jrWT2UScZjKKkeAyscFSCd07KxOxYy66NC
	jTt3yDAOQiAIEtr2+xHZgUzq+9swWotUv40/yvINM1gJmnNvdLJflUmHqs1cBnMot0amtSirLQw
	fyJ5+YqXk70qrv019Niq7l4JLR+MVJQd6Py50bhpIGlcbrcs1FWBE7hgul9K+qNUCfjiX0EP
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr5872445a12.41.1795371149157;
        Sun, 22 Nov 2026 10:12:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:28 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 8/9] wifi: ath11k: give an extension descriptor the number of its buffer id
Date: Sun, 22 Nov 2026 19:12:12 +0100
Message-ID: <20261122181213.1016590-9-julius@bairaktaris.de>
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

A TSO segment takes a buffer id from the id stack and an MSDU extension
descriptor from a second stack, and a table indexed by id records which
descriptor the id took. Its completion reads that table, then the payload
map of the descriptor, a 36 byte entry that crosses into a second cache
line for half of the descriptors. All of these were written when the batch
was queued and are cold when its completions come: in a profile of bridged
downlink at 900 Mbit/s (IPQ8074, one run), the instruction after the load
of the segment length from the map in ath11k_dp_tx_buf_put_id() takes
1.05 % of all samples, the instructions around the load of the payload
addresses 0.42 % and the comparison of the table entry 0.19 %.

Reserve the ids below DP_TX_EXT_DESC_NUM for the extension descriptors,
id n for descriptor n, handed out from the descriptor stack, and the others
for frames sent from one buffer. The id then names its descriptor: the
table goes, together with its write at queue time and its read and reset
at completion. End the payload pieces of a map at the first of length 0,
which no mapped piece has, instead of a count, so the map is 32 bytes and,
aligned to that, never crosses a cache line. Frames sent from one buffer
keep 30719 ids, where they shared 32767 with the segments before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 21 +++---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 95 ++++++++++++-------------
 2 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 1bdf2f564dac..e47949ed7c4a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -88,15 +88,18 @@ struct dp_rxdma_ring {
  * or more.
  */
 #define ATH11K_DP_TX_TSO_MAX_SEGS	64
-#define ATH11K_DP_TX_NO_EXT		0xffff
 
+/*
+ * The payload mappings of an extension descriptor, which end at the first
+ * piece of length 0 or after the last one, and the frame the descriptor
+ * makes, headers included. 32 bytes, so that the map of a completion is one
+ * cache line.
+ */
 struct ath11k_dp_tx_ext_map {
 	u32 dma[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
 	u16 len[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
-	/* the frame this descriptor makes, headers included */
 	u16 seg_len;
-	u8 num;
-};
+} __aligned(32);
 
 /* What a buffer id held when it was released */
 struct ath11k_dp_tx_seg {
@@ -116,16 +119,18 @@ struct dp_tx_ring {
 	u32 num_free;
 	/*
 	 * MSDU extension descriptors for TSO segments, placed by
-	 * ath11k_dp_tx_ext_off(), the payload mappings of each, the
-	 * descriptor each buffer id uses, and the ones not in use
+	 * ath11k_dp_tx_ext_off(), and the payload mappings of each. The
+	 * buffer ids below ext_ids are those of the extension descriptor of
+	 * the same number and are handed out from ext_free, the others from
+	 * free_ids.
 	 */
 	struct hal_tx_msdu_ext *ext;
 	dma_addr_t ext_paddr;
 	struct ath11k_dp_tx_ext_map *ext_map;
-	u16 *ext_slot;
 	u16 *ext_free;
 	u32 ext_num_free;
-	/* Protects bufs, free_ids, ext_slot and ext_free */
+	u32 ext_ids;
+	/* Protects bufs, free_ids and ext_free */
 	spinlock_t tx_idr_lock;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 6d950afb90f1..089696bff4c8 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -114,8 +114,10 @@ static size_t ath11k_dp_tx_ext_off(unsigned int slot)
 
 /*
  * The ids a ring hands out, as a table indexed by id with a stack of the free
- * ones: the completion's cookie names the buffer directly. Callers of the id
- * helpers hold tx_idr_lock.
+ * ones: the completion's cookie names the buffer directly. The ids below
+ * ext_ids are those of the extension descriptors and have a stack of their
+ * own, so that a completion finds the descriptor of its id without a table.
+ * Callers of the id helpers hold tx_idr_lock.
  */
 int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
@@ -125,9 +127,9 @@ int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 				 GFP_KERNEL);
 	tx_ring->free_ids = kvcalloc(DP_TX_IDR_SIZE - 1,
 				     sizeof(*tx_ring->free_ids), GFP_KERNEL);
-	tx_ring->ext_slot = kvmalloc_array(DP_TX_IDR_SIZE - 1,
-					   sizeof(*tx_ring->ext_slot),
-					   GFP_KERNEL);
+	BUILD_BUG_ON(sizeof(struct ath11k_dp_tx_ext_map) != 32);
+	BUILD_BUG_ON(DP_TX_EXT_DESC_NUM + 1 >= DP_TX_IDR_SIZE);
+
 	if (ab->hw_params.tx_tso) {
 		tx_ring->ext = dma_alloc_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
 						  &tx_ring->ext_paddr,
@@ -139,24 +141,22 @@ int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 					     sizeof(*tx_ring->ext_free),
 					     GFP_KERNEL);
 	}
-	if (!tx_ring->bufs || !tx_ring->free_ids || !tx_ring->ext_slot ||
+	if (!tx_ring->bufs || !tx_ring->free_ids ||
 	    (ab->hw_params.tx_tso &&
 	     (!tx_ring->ext || !tx_ring->ext_map || !tx_ring->ext_free))) {
 		ath11k_dp_tx_bufs_free(ab, tx_ring);
 		return -ENOMEM;
 	}
 
-	memset(tx_ring->ext_slot, 0xff,
-	       (DP_TX_IDR_SIZE - 1) * sizeof(*tx_ring->ext_slot));
+	tx_ring->ext_ids = tx_ring->ext_free ? DP_TX_EXT_DESC_NUM : 0;
 
 	tx_ring->num_free = 0;
-	for (id = DP_TX_IDR_SIZE - 1; id--;)
+	for (id = DP_TX_IDR_SIZE - 1; id-- > tx_ring->ext_ids;)
 		tx_ring->free_ids[tx_ring->num_free++] = id;
 
 	tx_ring->ext_num_free = 0;
-	if (tx_ring->ext_free)
-		for (id = DP_TX_EXT_DESC_NUM; id--;)
-			tx_ring->ext_free[tx_ring->ext_num_free++] = id;
+	for (id = tx_ring->ext_ids; id--;)
+		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
 	return 0;
 }
@@ -165,7 +165,6 @@ void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
 	kvfree(tx_ring->bufs);
 	kvfree(tx_ring->free_ids);
-	kvfree(tx_ring->ext_slot);
 	if (tx_ring->ext)
 		dma_free_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
 				  tx_ring->ext, tx_ring->ext_paddr);
@@ -173,12 +172,12 @@ void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 	kvfree(tx_ring->ext_free);
 	tx_ring->bufs = NULL;
 	tx_ring->free_ids = NULL;
-	tx_ring->ext_slot = NULL;
 	tx_ring->ext = NULL;
 	tx_ring->ext_map = NULL;
 	tx_ring->ext_free = NULL;
 	tx_ring->num_free = 0;
 	tx_ring->ext_num_free = 0;
+	tx_ring->ext_ids = 0;
 }
 
 static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
@@ -198,10 +197,11 @@ static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
 static void ath11k_dp_tx_tso_unmap(struct device *dev,
 				   struct ath11k_dp_tx_ext_map *map)
 {
-	while (map->num--)
-		dma_unmap_page(dev, map->dma[map->num], map->len[map->num],
-			       DMA_TO_DEVICE);
-	map->num = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(map->len) && map->len[i]; i++)
+		dma_unmap_page(dev, map->dma[i], map->len[i], DMA_TO_DEVICE);
+	map->len[0] = 0;
 }
 
 /*
@@ -215,8 +215,8 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 					bool *more,
 					struct ath11k_dp_tx_seg *seg)
 {
+	struct ath11k_dp_tx_ext_map *map;
 	struct sk_buff *skb;
-	u16 slot;
 
 	*more = false;
 	if (seg) {
@@ -232,18 +232,18 @@ struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
 		return NULL;
 
 	tx_ring->bufs[id] = NULL;
-	tx_ring->free_ids[tx_ring->num_free++] = id;
 
 	if (seg)
 		seg->skb = skb;
 
-	slot = tx_ring->ext_slot[id];
-	if (unlikely(slot != ATH11K_DP_TX_NO_EXT)) {
+	if (id >= tx_ring->ext_ids) {
+		tx_ring->free_ids[tx_ring->num_free++] = id;
+	} else {
+		map = &tx_ring->ext_map[id];
 		if (seg)
-			seg->len = tx_ring->ext_map[slot].seg_len;
-		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slot]);
-		tx_ring->ext_free[tx_ring->ext_num_free++] = slot;
-		tx_ring->ext_slot[id] = ATH11K_DP_TX_NO_EXT;
+			seg->len = map->seg_len;
+		ath11k_dp_tx_tso_unmap(ab->dev, map);
+		tx_ring->ext_free[tx_ring->ext_num_free++] = id;
 
 		if (!skb_unref(skb)) {
 			*more = true;
@@ -507,10 +507,11 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 				unsigned int len)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
-	unsigned int avail, take;
+	unsigned int avail, take, num = 0;
 	dma_addr_t dma;
 
-	map->num = 0;
+	/* every piece mapped has a length, so the first 0 ends them */
+	memset(map->len, 0, sizeof(map->len));
 	while (len) {
 		if (!*piece)
 			avail = skb_headlen(skb) - *off;
@@ -523,7 +524,7 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 			*off = 0;
 			continue;
 		}
-		if (map->num == HAL_TX_MSDU_EXT_NUM_BUFS - 1)
+		if (num == ARRAY_SIZE(map->len))
 			return -E2BIG;
 
 		take = min(avail, len);
@@ -538,11 +539,11 @@ static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
 		if (dma_mapping_error(dev, dma))
 			return -ENOMEM;
 
-		map->dma[map->num] = dma;
-		map->len[map->num] = take;
-		map->num++;
-		ext->buf[map->num].addr_lo = lower_32_bits(dma);
-		ext->buf[map->num].info =
+		map->dma[num] = dma;
+		map->len[num] = take;
+		num++;
+		ext->buf[num].addr_lo = lower_32_bits(dma);
+		ext->buf[num].info =
 			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_ADDR_HI,
 				   upper_32_bits(dma)) |
 			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_LEN, take);
@@ -658,7 +659,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	struct hal_tx_info ti = {};
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
-	u16 ids[ATH11K_DP_TX_TSO_MAX_SEGS], slots[ATH11K_DP_TX_TSO_MAX_SEGS];
+	u16 ids[ATH11K_DP_TX_TSO_MAX_SEGS];
 	u32 seq = 0, flags = 0, ip_id = 0;
 	dma_addr_t hdr_dma;
 	struct tcphdr *th;
@@ -730,15 +731,15 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	tcl_ring = &ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	if (tx_ring->num_free < n || tx_ring->ext_num_free < n) {
+	if (tx_ring->ext_num_free < n) {
 		spin_unlock_bh(&tx_ring->tx_idr_lock);
 		return -EAGAIN;
 	}
+	/* the id of a segment is the number of its extension descriptor */
 	for (i = 0; i < n; i++) {
-		slots[i] = tx_ring->ext_free[--tx_ring->ext_num_free];
-		ids[i] = ath11k_dp_tx_buf_get_id(tx_ring, skb);
-		tx_ring->ext_slot[ids[i]] = slots[i];
-		tx_ring->ext_map[slots[i]].num = 0;
+		ids[i] = tx_ring->ext_free[--tx_ring->ext_num_free];
+		tx_ring->bufs[ids[i]] = skb;
+		tx_ring->ext_map[ids[i]].len[0] = 0;
 	}
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
@@ -765,8 +766,8 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 	left = skb->len - off;
 	for (i = 0; i < n; i++) {
 		struct hal_tx_msdu_ext *ext = (void *)tx_ring->ext +
-					      ath11k_dp_tx_ext_off(slots[i]);
-		struct ath11k_dp_tx_ext_map *map = &tx_ring->ext_map[slots[i]];
+					      ath11k_dp_tx_ext_off(ids[i]);
+		struct ath11k_dp_tx_ext_map *map = &tx_ring->ext_map[ids[i]];
 		unsigned int len = tso ? min(left, mss) : left;
 		u32 seg_flags = flags;
 
@@ -861,7 +862,7 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 			     FIELD_PREP(DP_TX_DESC_ID_POOL_ID,
 					skb_get_queue_mapping(skb) &
 					(ATH11K_HW_MAX_QUEUES - 1));
-		ti.paddr = tx_ring->ext_paddr + ath11k_dp_tx_ext_off(slots[i]);
+		ti.paddr = tx_ring->ext_paddr + ath11k_dp_tx_ext_off(ids[i]);
 		/* the command follows the TLV header of the ring entry */
 		desc = ath11k_hal_srng_src_get_next_entry(ab, tcl_ring);
 		ath11k_hal_tx_cmd_desc_setup(ab, desc + sizeof(struct hal_tlv_hdr),
@@ -890,18 +891,16 @@ static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_unmap:
 	for (j = 0; j < i; j++)
-		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slots[j]]);
+		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[ids[j]]);
 	dma_unmap_single(ab->dev, hdr_dma, skb_headlen(skb), DMA_TO_DEVICE);
 fail_put:
 	if (pad)
 		ath11k_dp_tx_ext_unpad(skb, hdr_len, pad);
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	for (j = n; j--;) {
-		/* no reference was taken yet: release the id and slot only */
+		/* no reference was taken yet: release the id only */
 		tx_ring->bufs[ids[j]] = NULL;
-		tx_ring->free_ids[tx_ring->num_free++] = ids[j];
-		tx_ring->ext_slot[ids[j]] = ATH11K_DP_TX_NO_EXT;
-		tx_ring->ext_free[tx_ring->ext_num_free++] = slots[j];
+		tx_ring->ext_free[tx_ring->ext_num_free++] = ids[j];
 	}
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
-- 
2.53.0

