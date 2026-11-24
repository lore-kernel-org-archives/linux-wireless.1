Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484478;
	b=Mtt20K3vYyC8kL4sbybT2CfdmUd/HcHLQjJTkl6ZrL1rMRobwC1nmZiLv5pH177hIYUb
	 jWN8lFm9l6jxh8exzZoLHjQ3SNPPjQaZofJe8HzbKpovY6iEw5H/HbfVULOv8c2uAccW2
	 NZ4lmHvvvkZj8ZvRr+8wAiVzrQudPYmKQmvL5VK9eO+zl3Mpr1zAawHlbaHPUiQpnP0Rf
	 eB1NLbojmtPDEZVdo0aCDI5dJPHRrMC8gJMVcZD/QdxIt0IR9pgHaEthVAJG2e3HMFuaD
	 3hYHd4K+dfkt+geSaLIJOEJci7HDu8gUGF3iS8E4Ogpxf3LL10E6jKCSLeiI1eXjQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484478;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AEPdrSonFnMm713LtxfgWTKetCF42gKUQZWQeqT3CgY=;
	b=h1mLJvIvgSO0KoHQxeSAJ6nTqtC0rH0qgteF3NgXaVq2z9dfL8XtD1qSSDxX3/4bLeYD
	 vd48xk7tHY1DdqaBqXuQH759+Y8NTAymptPGDWJYUKnVNtgwqSkqmTueekvJ4nriz3A3F
	 p4hqTxkWv3ipjM/ygwo1v4lShC9UCGn0oiJeAKSVkmRg0MvSj8rBzlsIvHB/baMk77t3t
	 uh0574dWRgnCzvwPp49hWEIuZKGELZRsgFxorlClALyggCGI4+gQFY+kgUxWZ09V2Rznx
	 WL2rBbGt7QOyYLfZczVL3FbX7LjYZq8+dokWpIgczG+MM9QIWQebF0F+gHJIAMizFlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luixo.me;
	spf=pass smtp.mailfrom=luixo.me;
	dkim=pass header.d=luixo.me header.i=@luixo.me header.a=rsa-sha256 header.s=protonmail3 header.b=siv+bPXC;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76152606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76152606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=luixo.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luixo.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luixo.me header.i=@luixo.me header.a=rsa-sha256 header.s=protonmail3 header.b=siv+bPXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luixo.me;
	s=protonmail3; t=1795484473; x=1795743673;
	bh=AEPdrSonFnMm713LtxfgWTKetCF42gKUQZWQeqT3CgY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=siv+bPXCrGItXu0b6pT1jsAhikxBRCe3ht0Ytm1cQOWxxjFjdiIJ3rqEkyujKpYHT
	 EIEKXIEEZbOfmeyRh9pSq0Dr5hFz8LSz2fSGaClIX25YMGZs+FalW0oiWA14RUItPb
	 3uXLGv/AgDtcQ+eVilIf5a7TdoQgyGbh9AAMn8ViqKpNwYaiXsvupQtZHt0EOUhHLp
	 zYZyyNz+L31bQjXP1B1Ty7qrzY18V1rUfBIn8/SP8alvBzNLL4Yy6OIixS1x/xsq0S
	 qqMNX2rGuMv92puxRRATpzhEeUR3QzHvhhsE4eCZUY+N/f3pArs8HprGspHHf768ke
	 I6Af3RZyPjt9w==
X-Pm-Submission-Id: 4jYQWW34Yyz1DDL2
From: Alexey Immoreev <luixo-public@luixo.me>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	julius@bairaktaris.de
Subject: [RFC PATCH] wifi: ath11k: use coherent DMA for destination rings
Date: Tue, 24 Nov 2026 01:40:57 +0000
Message-ID: <20261124014057.491428-1-luixo-public@luixo.me>
X-Mailer: git-send-email 2.53.0
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

ath11k zeroes cached REO destination and WBM release rings mapped as
DMA_FROM_DEVICE, then enables them without syncing them for the device.
The DMA API requires that initial sync and treats this DMA direction
as CPU read-only.

Use coherent DMA for allocation and free, and stop setting the cached
ring flag. Leave the unused cache code for a follow-up.

Keeping non-coherent cached rings would require DMA_BIDIRECTIONAL and a
device sync before enable. It would also require safe ownership at
cache-line granularity: two 32-byte WBM descriptors can share a 64-byte
line while the CPU owns one and hardware owns the other. Syncing one
descriptor at a time does not solve that. Coherent DMA avoids the
overlap but may cost CPU time where coherent mappings are uncached.

Signed-off-by: Alexey Immoreev <luixo-public@luixo.me>
---
Downstream IPQ5018 (RA82) testing saw three zero-status TX completions
with cached WBM rings and none with coherent WBM rings. The dp.c change
compiles on ARM32 and AArch64 with OpenWrt backports headers.

Patch 5/10 of https://patchwork.kernel.org/series/1219647/ changes
runtime CPU sync, not startup. This RFC disables the cached path that
the series optimizes. The performance impact is not yet measured.

OpenAI GPT-6.2 Sol drafted the patch and ran the host checks.
GPT-6.2 Astra independently reviewed the DMA issue.
I reviewed the email and patch and signed off on the contribution.

base-commit: 03b7c601b6e314115015a57061f5b377afe13190

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..f23c37370280 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -103,12 +103,8 @@
 	if (!ring->vaddr_unaligned)
 		return;
 
-	if (ring->cached)
-		dma_free_noncoherent(ab->dev, ring->size, ring->vaddr_unaligned,
-				     ring->paddr_unaligned, DMA_FROM_DEVICE);
-	else
-		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
-				  ring->paddr_unaligned);
+	dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
+			  ring->paddr_unaligned);
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -226,7 +222,6 @@
 	int entry_sz = ath11k_hal_srng_get_entrysize(ab, type);
 	int max_entries = ath11k_hal_srng_get_max_entries(ab, type);
 	int ret;
-	bool cached = false;
 
 	if (max_entries < 0 || entry_sz < 0)
 		return -EINVAL;
@@ -236,27 +231,9 @@
 
 	ring->size = (num_entries * entry_sz) + HAL_RING_BASE_ALIGN - 1;
 
-	if (ab->hw_params.alloc_cacheable_memory) {
-		/* Allocate the reo dst and tx completion rings from cacheable memory */
-		switch (type) {
-		case HAL_REO_DST:
-		case HAL_WBM2SW_RELEASE:
-			cached = true;
-			break;
-		default:
-			cached = false;
-		}
-	}
-
-	if (cached)
-		ring->vaddr_unaligned = dma_alloc_noncoherent(ab->dev, ring->size,
-							      &ring->paddr_unaligned,
-							      DMA_FROM_DEVICE,
-							      GFP_KERNEL);
-	else
-		ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
-							   &ring->paddr_unaligned,
-							   GFP_KERNEL);
+	ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
+						   &ring->paddr_unaligned,
+						   GFP_KERNEL);
 
 	if (!ring->vaddr_unaligned)
 		return -ENOMEM;
@@ -318,11 +295,6 @@
 		return -EINVAL;
 	}
 
-	if (cached) {
-		params.flags |= HAL_SRNG_FLAGS_CACHED;
-		ring->cached = 1;
-	}
-
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
 		ath11k_dp_srng_cleanup(ab, ring);
