Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441309;
	b=tnKn+VCoqt3CYz7AiaKLDtMr2KBSgF1+Q5irae2rIy1L9gsj7jdRMinTzvAUO4mC+gbB
	 OCSscnfLDpfJirAi7SRib8mo3PTg1Hpdndbsn4iZ241kkzNLxmLK44UGpotbwbLtocV74
	 S0qIt+HO5KsWeZoZuxKOCYzcEsK+vBMFOF7dmH/7Tgu6qVmZagpNlxgp9L7HY5kvyAclG
	 IJgNLzuvX1yj0Vj6BaEfNFWdQWjs7iCV4IZ6l2k4uLocqkgy6ATq8CnoHIiILDc79zpJX
	 zOWb2Nf7ozUxxhKH+/zF+flO8eiVojRxPVk2ztAYGo8+u7tfhElPm2uUDkpUmFysSWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=;
	b=weleVLBlJXiDjDCgqgJkpp0PBze4YdYHDv2OJPvF+i5ZssuC8WlvSRrCOjU8X+T8baES
	 SLbLTaIxK4vHE8ux8ZWjtT3LVwvCcRj7OQCDFCFGmAqlwPmoDnrFgHTvA/pZnQO4zXRD/
	 rnLKgLhW0Rb0g2P9eeEMHF1ikqK2OQc9plytZaA104NfDhHY1EA0ecyqPVfD/7u2BEeNZ
	 7KOiCgOxuhLQzwc1gwVWe/78vfFAVcURzCcbsyjI5r+sxtv7/Zx4HhLWcKtbnnzRcZnUi
	 IxJcQlFkf8rMNC9lGUC3jGC8njf57tnlAl2P9jR1+4TmNfoETQPD9CYRUHBC7YPN8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KZsqN54u;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00819606B530
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00819606B530
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KZsqN54u
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so4836277a12.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441307; x=1796046107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=;
        b=KZsqN54uIUV5KqzVpJdLqLSlFLeZ/4wBMv4DgbJG/D3Xow+hA9SX2YgN3NP+kVCuLP
         ptslrvf+J4XNUj4FI0kKTg4cxhrKnZANCTvnMziogfMOq95HXywXd+oatWK0qIu1TImN
         APOdih1RzcsWBMN6I6x4Yec/HlzRssVGvF1ht+8uwfh4nSOpY+mwpaD5iXg5htNb5gPU
         YDHqoIB1lqk6rS11DnT91RvWGijpPF9czveS/mfeOR3LzB62mEh0JrEUeq3dwTDbKNVf
         pc4A77OaA0oCGjZdBfQEnXIjtjH6TCdNatQdlvagSsE7Sq5MYJNVtRMhRQEa8cw8lcxi
         BX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441307; x=1796046107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+OoHnoKDSF1Cc8xTYrIE9l6WkpswTqQj7BBV45TBk=;
        b=PJ4zsLqn42x5swL4m2wai9AAJGLwzYKedLOCWSoLcziLEhlAQVbN9QW0Zj55rSFVhA
         wyA5jS/ZxODQo8sK/va8yOh4EkfTEAFQpEdFoL62ID04RGJc4FeRUvh8OfNrgY5wK0k6
         MiL/9Em2JiL7h7I51DSvh68vbsNZxdaymukNpOV0F85Xr4yzAFUakAAdWlSzLqp3XE3l
         rywCUg6sfnvr87pObBGTzfXifDh+EgKkYScO31zfbHHyjGcTeYM6BNTkSKsDjP90rJ5i
         0zze9D+zu+Sixr2NsZCqxHppWcKKVUL2vfTLejN3wJ2itx7lixXgOHoA8PKS9wap0AFE
         cX3g==
X-Forwarded-Encrypted: i=1; AL+hErHVg393nr0/34JfwM0nGa5IE4eoFJxVRIBbhA2D+RC3dhf+KL0aMb3+R1ZWNoIvs62XDGqFBZVc6Gx41EBxjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dZliVunREZZU3wS9LuYjmlmFSEZ4331vI4bskZrzIEH4y8fJZ
	lLUUviy+h2v7YLskl73mrKqgsfcfeMeSuYob0Js6M7sHnS9zTKXITQLSmP8s7csuzg==
X-Gm-Gg: AZFdTZc40HD4CUo2TfsTYZkmfqcN3aHHvJHVEoexdxIj5s3OJwyUINcypiXPO3y1TPv
	CrVHq6jqWCmObzJkxDyUwAapp9DmzvEiGZjRHZzfD291TOP2+pUvOi31WmcXHuPZUYsJkBba07+
	iHhNJEP9lzId3ZvE3gAFuysrbIu7OQKWE8A6FT/gGzVRleD/yDdcOMTvJjgrxYLOigDD0al00lK
	AN3ejAGz12B1OWAyuCI92OiIfD5fx5684JDiHxl/sm0F7PZxMhFZSKGvMMhJpqmwg20Nyla0xKA
	hhfMDnNQT3gdBaR2pRaJ1fCTyDuWpM+pdRXCyUhkLPB3b5HiD5PAQjofPI4nI8kSc9yyWJyafmx
	toUvH1CzQIGIOrCFWRFFz9G13dyNeYSwPnIJyArKY6Bmhp0JMGCMe2tGCeQXeZ/VEsCL0gooZhI
	Lx2WCFXffdKqHSylN2VZardHa6tCMwIjF7rnWg5+wzaqA3mh+0Yhvo4J9OmYteVYTQ0rb42AHN0
	DwURWCPKZJQUtOlyQzzNQXIsh79VEzZjdYnw4Id97skM7u5pcF08eoT+B+kEITFMFE//ibXzwrF
	TdPipFlsRpHgBAtgFb+FtihJHn3/xBmzNiZjjnNRv28WAZ1qQwLA1HKAgsDwpl7FuDj8fScXyKj
	JTx6Vq3MYAH8JVvDf9hF0mDJ6mhcV0uipcggS4YKVQ34ZzS5JbEizkZhRH3zwtL0UAFuU7UYWVX
	Q0B0r/fUGfTG5MOvn/BYVREwkLjNts3U4AYFTqLBWJeLC2uNf3Mei9Q+TPXnSO8ah2sRsVANa2/
	FVrAZQZmgmE6curUHdMi3XWuFPs5UIm48iXAsTQFxtatAvToiioEoF60EXPfdFkMWWDl6T7CZmS
	N5ymGdWUpHXhOahqBz+DU5GSxQnSZJa8OY8JurVMx01F7HOuShxA/2ngrc35kb4DjqV7uO2zUTc
	U+PXyy46PwVYsPD3rIAA=
X-Received: by 2002:a05:6402:1cc3:b0:6b8:7816:8735 with SMTP id 4fb4d7f45d1cf-6ba37cc09f1mr7420178a12.3.1795441307436;
        Mon, 23 Nov 2026 05:41:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:47 -0800 (PST)
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
Subject: [PATCH ath-next v1 09/10] wifi: ath11k: hand the CPU only the part of a REO buffer the device wrote
Date: Mon, 23 Nov 2026 14:41:36 +0100
Message-ID: <20261123134137.718575-10-julius@bairaktaris.de>
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

The REO reap takes each page pool buffer back from the device with a
dma_sync_single_for_cpu() over the whole buffer, 2048 bytes, while the
device wrote the descriptor, the L3 padding and the MSDU, whose length
the REO entry carries. A TCP acknowledgment, which is what a station
sends back on downlink, takes 453 bytes of it on IPQ8074 (384 of
descriptor, at most 3 of padding, 66 of frame): on a non-coherent system
the invalidation walks 32 cache lines where 8 hold what the device wrote.

Take back the descriptor, the largest padding of the two padding fields
and the MSDU length of the entry. The buffers of an MSDU that spans
several, the one with the continuation bit and the ones after it on the
ring, are taken whole as before; whether the last entry reaped had the
bit is kept per ring, so a chain split between two polls is still seen.
The length taken is recorded in the frame's control block, and
ath11k_dp_rx_process_msdu() takes back the rest, up to the length the
descriptor gives, before it reads the frame, should that be longer than
the entry's: the CPU never reads a byte of the buffer it has not
invalidated after the device wrote it. A line past what was taken back
is not read and may hold a stale copy; the page pool syncs the whole
page for the device before the device gets it again, and the reap of its
next frame invalidates what that frame covers.

A buffer of its own, without a page pool, is unmapped whole as before.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  2 +
 drivers/net/wireless/ath/ath11k/dp.h    |  4 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 71 +++++++++++++++++++++++--
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 4eb40e674c14..6b05b2e4d926 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -142,6 +142,8 @@ struct ath11k_skb_rxcb {
 	u8 tid;
 	u16 peer_id;
 	u16 seq_no;
+	/* the bytes of the buffer from its start that the CPU took back */
+	u16 sync_len;
 	struct ieee80211_sta *sta;
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 5e973c337cb2..861cf65c5218 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -234,6 +234,8 @@ struct ath11k_pdev_dp {
 #define DP_RX_BUFFER_SIZE	2048
 #define	DP_RX_BUFFER_SIZE_LITE  1024
 #define DP_RX_BUFFER_ALIGN_SIZE	128
+/* The most L3 header padding the msdu_end TLV of any chip gives */
+#define DP_RX_L3_PAD_MAX	3
 #define DP_RX_PP_ORDER		1
 #define DP_RX_PP_FRAG_SIZE	ALIGN(SKB_HEAD_ALIGN(DP_RX_BUFFER_SIZE), \
 				      DP_RX_BUFFER_ALIGN_SIZE)
@@ -279,6 +281,8 @@ struct ath11k_dp {
 	struct dp_srng reo_cmd_ring;
 	struct dp_srng reo_status_ring;
 	struct dp_srng reo_dst_ring[DP_REO_DST_RING_MAX];
+	/* the last entry reaped from the ring had the continuation bit */
+	bool reo_dst_cont[DP_REO_DST_RING_MAX];
 	struct dp_tx_ring tx_ring[DP_TCL_NUM_RING_MAX];
 	struct hal_wbm_idle_scatter_list scatter_list[DP_IDLE_SCATTER_BUFS_MAX];
 	struct list_head reo_cmd_list;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index dd5bc35581f7..313a39f15781 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -410,17 +410,59 @@ static bool ath11k_dp_rx_buf_is_pp(struct sk_buff *skb)
 	return skb->pp_recycle && skb->head_frag;
 }
 
-static void ath11k_dp_rx_unmap_buf(struct ath11k_base *ab, struct sk_buff *skb,
-				   enum dma_data_direction dir)
+/*
+ * Hands a receive buffer back to the CPU: of a page pool buffer the first
+ * @want bytes, or all of it for a @want of 0 or past its end, and records
+ * how much in sync_len. A buffer of its own is unmapped whole.
+ */
+static void ath11k_dp_rx_unmap_buf_len(struct ath11k_base *ab,
+				       struct sk_buff *skb,
+				       enum dma_data_direction dir,
+				       unsigned int want)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(skb);
 	unsigned int len = skb->len + skb_tailroom(skb);
 
-	if (ath11k_dp_rx_buf_is_pp(skb))
+	BUILD_BUG_ON(FIELD_MAX(RX_MSDU_END_INFO2_L3_HDR_PADDING) >
+		     DP_RX_L3_PAD_MAX);
+	BUILD_BUG_ON(FIELD_MAX(RX_MSDU_END_INFO4_L3_HDR_PADDING) >
+		     DP_RX_L3_PAD_MAX);
+
+	if (ath11k_dp_rx_buf_is_pp(skb)) {
+		if (want && want < len)
+			len = want;
 		dma_sync_single_for_cpu(ab->dev, rxcb->paddr, len,
 					DMA_BIDIRECTIONAL);
-	else
+	} else {
 		dma_unmap_single(ab->dev, rxcb->paddr, len, dir);
+	}
+	rxcb->sync_len = len;
+}
+
+static void ath11k_dp_rx_unmap_buf(struct ath11k_base *ab, struct sk_buff *skb,
+				   enum dma_data_direction dir)
+{
+	ath11k_dp_rx_unmap_buf_len(ab, skb, dir, 0);
+}
+
+/*
+ * Takes back from the device the bytes of @msdu past those it took at the
+ * reap, up to @need, for a frame whose descriptor says it is longer than
+ * its REO entry did.
+ */
+static void ath11k_dp_rx_sync_more(struct ath11k_base *ab, struct sk_buff *msdu,
+				   unsigned int need)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	unsigned int len = msdu->len + skb_tailroom(msdu);
+
+	need = min(need, len);
+	if (likely(need <= rxcb->sync_len))
+		return;
+
+	dma_sync_single_for_cpu(ab->dev, rxcb->paddr + rxcb->sync_len,
+				need - rxcb->sync_len, DMA_BIDIRECTIONAL);
+	rxcb->sync_len = need;
 }
 
 static dma_addr_t ath11k_dp_rx_pp_dma_addr(struct sk_buff *skb)
@@ -2870,6 +2912,8 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 					sizeof(struct hal_rx_desc));
 			goto free_out;
 		}
+		ath11k_dp_rx_sync_more(ab, msdu, hal_rx_desc_sz + l3_pad_bytes +
+				       msdu_len);
 		skb_put(msdu, hal_rx_desc_sz + l3_pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3_pad_bytes);
 	} else {
@@ -3027,6 +3071,8 @@ static void ath11k_dp_rx_prefetch_frame(struct ath11k_base *ab,
 int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
+	unsigned int want;
+	u32 info0;
 	struct ath11k_dp *dp = &ab->dp;
 	struct dp_rxdma_ring *rx_ring;
 	int num_buffs_reaped[MAX_RADIOS] = {};
@@ -3067,6 +3113,21 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
 
+		/*
+		 * The device wrote the descriptor, the padding and the MSDU
+		 * of the length the entry gives. A buffer of an MSDU that
+		 * spans several, which follows one with the continuation bit
+		 * or has it, is taken whole.
+		 */
+		info0 = desc->rx_msdu_info.info0;
+		want = ab->hw_params.hal_desc_sz + DP_RX_L3_PAD_MAX +
+		       FIELD_GET(RX_MSDU_DESC_INFO0_MSDU_LENGTH, info0);
+		if (dp->reo_dst_cont[ring_id] ||
+		    (info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION))
+			want = 0;
+		dp->reo_dst_cont[ring_id] =
+			!!(info0 & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
+
 		if (unlikely(buf_id == 0))
 			continue;
 
@@ -3086,7 +3147,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		spin_unlock(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
-		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
+		ath11k_dp_rx_unmap_buf_len(ab, msdu, DMA_FROM_DEVICE, want);
 		if (cached)
 			ath11k_dp_rx_prefetch_frame(ab, msdu);
 
-- 
2.53.0

