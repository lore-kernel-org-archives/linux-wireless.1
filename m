Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441306;
	b=qjS4DqCwOXfqJy+eorrfZjnzxnAsBhZ04JkcvxnSd6mwPVmlperUCSiy+gw7WH9ttsHp
	 K3JnpIacSvtucDgUaxihI1W8WpRPurHRArunxgVFeKk2qKLGsqn7HL6A66TZnRtmSGEoe
	 YG5SBExOrnaco+yCgauXZftuWF4y0PfOWaStKDg5f1QJme5QPHB82NMjQ5IIz9yP7hzDz
	 VbepjCaocKoPCvu0FpFajkqE254AjKivLUmJsuAoA7nvv07unkD1EQxSaxPMXITTYKYce
	 Dgs9D/KYLHCpTnfz34zOwiB3jAnf/zX7T9s7D3d0Iz5o3rliO02Eaq3kFRWPVSML9YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=;
	b=g6vNoUdT7MNyuePpV/NS1jKNjdmRzz1/M1NuvlFJMQelWh0Z632VQyOtjpcBozyf6KST
	 91sW72hCGVcZYX1i23BpMq0VWCEcdQAiCs2Rzhbnho0FA0ffU3LHNavPb4jcap6izge13
	 NxeZ23PN4fRfxdd9QdpDzI3SEfv8jmFmZ8rKT62wuh6ZbX/zNYG7SuDLpvmD1saBqR5We
	 z9MkrL99g5njbT9XJ1AD3+npzQClzh5QZZWquuCrIfWyrFUPhv9lh7pCRLvvr1FYFTBjS
	 wN3tScMQ0gRxHldOsBI0Jx6sXvxMefhZiic5U+bd8LAUbnq9EH8jbqxNj9GwZmc1ezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vedlZEJD;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B660724DC
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9B660724DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vedlZEJD
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso4239411a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441304; x=1796046104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=;
        b=vedlZEJDJBodtWxUeg/jWiRTgRm5uc8ljdJG4T+8c3z3AuDjIj1EVrJi4dqU6vyXlb
         x2As1JpqaXhCvRfMdKZQfKo6e09pyysJbqjkhVY4yOkHq0LSP3PTWg01+bQkIFHNSQtI
         Au8fcBbYRxIqBMk7LYVi2ZO0+lmjQ5ImBCDfnCzL4mIDkJD2ATyn6OrJELU+dKo8qtrh
         7mQI2ODKpEw+TGbkCDknBSUjyrxtuqkbJzpo6qbYeeZ1dwiQSIQud36R3f/1rq7wSk/M
         bTHHSB88T0HS8/v/+izv7klWCIrPsLRUh0lBiQee90YMOXUvplhAKQtQ3JzdeXAWazjt
         y6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441304; x=1796046104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7hMrzIPAgJ6f2Qbdofo1UA4pTvmxZ23Wwx+U1tZCc4=;
        b=wpJO5Q3nXq1U7G06OE+qg33Xw2PMbPpgsBeqJGp9/WGV+vxact2q+wGIsP1NJ3K+eZ
         74y9CrIZd1gB3n4OfPnG8tAK+RYLe6IV6LV3rbYkkppR8SHrxBP/gLozxdNfbKqKNkoM
         xmyUqZqq7Z1ed1wH3ZTUdJiM8gQBurb7suCcAYcJQsR/DQLEka6Qt3ZEneu0KpYkPCgR
         ThyK5vHx8bnhxcI+TWqx8KvcTzCDkw3pOFvVXPVb5P5ALOT0OGiAUowRVgrMTYjW5mSj
         PiJj5cth9PxJJSiERqXQheqIvU+5vHddBG3HuQwkX88TsHyelVwrhQqf601Klr89rVsW
         UL8Q==
X-Forwarded-Encrypted: i=1; AL+hErGoPGi/WI5cIq5WrBDag72SJDIaIrEJYksV7ZmoWe9ymTDNYKnTv7aXOD7TSHd147/s3izOQXav0cXEDAfXEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Koe1ROfGz7MDuVmE8IGyJmiV9td1yoIcEDobmBWP9Eg6XU+HU
	Te5h/Gnx0weiqN8+n+Kz4i7qSuHNG5YELWBgBAzlffAK8d6qzCNz+EJTjgjkTjfLQQ==
X-Gm-Gg: AZFdTZdBiKG2fwfNi3l18SX7dJIuK4L1nTSBwBDdSlfb5ot4bYFRyca5QAkHC+8vrL1
	PqRs1OiAwP2282RqQbCs9p4tIkSYkNsgyKNsuRnIw8SWXa/kuwxSadlxTYf1SLV3+JpcYPq4EaF
	EufKbF4Z5LIO7AxaTzlL/3Y6rRU+i1evCUXDwSs7df/65zOjrD+PEotAZmgjc/7y6+81fZ3Vefu
	mUULJ80U+9dXVgJ6NzyfViV1iGu7Qe6FquJ45qOUt7Jqw6ThlvAJZcuQfPaKmO+THbBHY8hC/Bj
	lDOGHRWIC3zQkoGDaK/7AmEZwjMa9Q2qS3Vgd65nZS65xd/ztidN2CLTo4u7E6qB/qPCc/t27ew
	SNg+PFYdwAl9CLbWwV73Ad4jKkLso4yUcpOHHjc8cOOvlSaGfDu3H+IAQLt73d0paq0fU5pYznJ
	NzB5Yz3PbOnsNlpv9s64syMbloNN2F/2ZxFGntcBAkxeRvZx1rUnZtO8zWcZ2h8y9AvWcxw609o
	0eKJhn4QdyELpwc+721K51Rl763zswzIvA7imGvVUTxJ/XHyUDAX7oWot9SuvBCh6wKnp4/HdaN
	nbmBUv0KEvDW/n8uWYCCef9z8he3GP49BajJHscyP0lmUTblNlHgmiUWX5XqmvKKt/IW857iogk
	VxIpcjGc1MAAXE0XlewC/dxzuefFizwKD1LIsaWhxV/4wecQIyYOqnrnh38srdUYcCp4H6wEjNY
	k0qBVUWIphmQDrl/WnID6yQHOeM1j8pxFZUxIDE0GSwHqxkswFLDknEaJMe0d9sYLA0bnmK2Y4+
	StWROHJdG+e9bKcl5kF4dtIn83bL9xt7mavqmLGxgBDeHylNEE+In1CcbJSRulo5hkfNHblAPgY
	9/xEzU+gfRcWablGrof4SsNfCJZcsunjcVy+XlS/kV93wPdtMzH6jsuKb4UHxWDYz8OpZozKcQ=
	=
X-Received: by 2002:a05:6402:540a:b0:6ba:90f9:16ef with SMTP id 4fb4d7f45d1cf-6ba90f94aa4mr3423695a12.10.1795441303837;
        Mon, 23 Nov 2026 05:41:43 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:43 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 05/10] wifi: ath11k: sync a cached ring's new entries once per head read
Date: Mon, 23 Nov 2026 14:41:32 +0100
Message-ID: <20261123134137.718575-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
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

The REO destination and TX completion rings are cacheable on the chips
with alloc_cacheable_memory (IPQ8074, IPQ6018, QCN9074, IPQ5018). The CPU
takes each entry from the device with a dma_sync_single_for_cpu() of its
32 bytes when the entry before it is handed out, and prefetches it then.
That is a call into the DMA layer and a cache invalidation with its
barrier for every frame received and every frame completed, and a
prefetch issued a few dozen instructions before the load: in a profile
of bridged downlink at 900 Mbit/s (IPQ8074, one run) the instruction
after the first load of a completion entry in
ath11k_dp_tx_completion_handler() takes 0.70 % of all samples.

Invalidate the entries where they become the CPU's, when a read of the
head pointer moves cached_hp: the whole range from the old head to the
new one, in one call or two where it wraps, in access_begin and in
ath11k_hal_srng_dst_num_free(), the two places that move it. An entry is
read only below cached_hp, so each is invalidated once after the device
wrote it, and a line the CPU loaded earlier, by a prefetch or
speculatively, is discarded before its entries are read: the guarantee
the per-entry sync gave. The range is clamped to the ring. Prefetch the
entries two cache lines ahead, which may run past the head: such a line
is discarded again when the head exposes it.

ath11k_hal_srng_dst_num_free() now reads the head with READ_ONCE() and
orders the entry reads after it with dma_rmb(), as access_begin does.
Rings in coherent memory are not touched.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/hal.c | 86 ++++++++++++++++++---------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 98bd9e3f0aae..e5c35647a136 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -627,34 +627,54 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
-static u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
-					      struct hal_srng *srng, dma_addr_t *paddr)
+/*
+ * Hands the CPU the entries of a cached destination ring from word @from up
+ * to word @to, which the head pointer the caller just read shows the device
+ * has written. Every entry the ring hands out passes through here once, after
+ * the head pointer that exposed it was read, so a line of the ring that the
+ * CPU loaded before, by a prefetch or speculatively, is discarded before it is
+ * read. The range is clamped to the ring, whatever the head pointer holds.
+ */
+static void ath11k_hal_srng_dst_sync(struct ath11k_base *ab,
+				     struct hal_srng *srng, u32 from, u32 to)
 {
-	lockdep_assert_held(&srng->lock);
+	u32 size = srng->ring_size;
 
-	if (srng->u.dst_ring.tp != srng->u.dst_ring.cached_hp) {
-		*paddr = srng->ring_base_paddr +
-			  sizeof(*srng->ring_base_vaddr) * srng->u.dst_ring.tp;
-		return srng->ring_base_vaddr + srng->u.dst_ring.tp;
-	}
+	if (!(srng->flags & HAL_SRNG_FLAGS_CACHED) || from >= size)
+		return;
 
-	return NULL;
+	to = min(to, size);
+	if (to < from) {
+		dma_sync_single_for_cpu(ab->dev, srng->ring_base_paddr +
+					from * sizeof(u32),
+					(size - from) * sizeof(u32),
+					DMA_FROM_DEVICE);
+		from = 0;
+	}
+	if (to > from)
+		dma_sync_single_for_cpu(ab->dev, srng->ring_base_paddr +
+					from * sizeof(u32),
+					(to - from) * sizeof(u32),
+					DMA_FROM_DEVICE);
 }
 
-static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
-					  struct hal_srng *srng)
+/*
+ * Starts the load of the entries @lines cache lines past word @tp of a cached
+ * ring. A line past the head pointer is discarded again by
+ * ath11k_hal_srng_dst_sync() before its entries are read.
+ */
+static void ath11k_hal_srng_dst_prefetch(struct hal_srng *srng, u32 tp,
+					 u32 lines)
 {
-	dma_addr_t desc_paddr;
-	u32 *desc;
+	u32 ahead = tp + lines * L1_CACHE_BYTES / sizeof(u32);
 
-	/* prefetch only if desc is available */
-	desc = ath11k_hal_srng_dst_peek_with_dma(ab, srng, &desc_paddr);
-	if (likely(desc)) {
-		dma_sync_single_for_cpu(ab->dev, desc_paddr,
-					(srng->entry_size * sizeof(u32)),
-					DMA_FROM_DEVICE);
-		prefetch(desc);
-	}
+	if (!(srng->flags & HAL_SRNG_FLAGS_CACHED))
+		return;
+
+	if (ahead >= srng->ring_size)
+		ahead -= srng->ring_size;
+	if (ahead < srng->ring_size)
+		prefetch(srng->ring_base_vaddr + ahead);
 }
 
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
@@ -675,9 +695,7 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 	if (srng->u.dst_ring.tp == srng->ring_size)
 		srng->u.dst_ring.tp = 0;
 
-	/* Try to prefetch the next descriptor in the ring */
-	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
-		ath11k_hal_srng_prefetch_desc(ab, srng);
+	ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 2);
 
 	return desc;
 }
@@ -692,8 +710,15 @@ int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 	tp = srng->u.dst_ring.tp;
 
 	if (sync_hw_ptr) {
-		hp = *srng->u.dst_ring.hp_addr;
-		srng->u.dst_ring.cached_hp = hp;
+		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
+		if (hp != srng->u.dst_ring.cached_hp) {
+			u32 old = srng->u.dst_ring.cached_hp;
+
+			srng->u.dst_ring.cached_hp = hp;
+			/* the entries are read after the head pointer */
+			dma_rmb();
+			ath11k_hal_srng_dst_sync(ab, srng, old, hp);
+		}
 	} else {
 		hp = srng->u.dst_ring.cached_hp;
 	}
@@ -835,16 +860,19 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
 
 		if (hp != srng->u.dst_ring.cached_hp) {
+			u32 old = srng->u.dst_ring.cached_hp;
+
 			srng->u.dst_ring.cached_hp = hp;
 			/* Make sure descriptor is read after the head
 			 * pointer.
 			 */
 			dma_rmb();
+			ath11k_hal_srng_dst_sync(ab, srng, old, hp);
 		}
 
-		/* Try to prefetch the next descriptor in the ring */
-		if (srng->flags & HAL_SRNG_FLAGS_CACHED)
-			ath11k_hal_srng_prefetch_desc(ab, srng);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 0);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 1);
+		ath11k_hal_srng_dst_prefetch(srng, srng->u.dst_ring.tp, 2);
 	}
 }
 
-- 
2.53.0

