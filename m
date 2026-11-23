Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441306;
	b=LadjfpXOscbFjaFW2hBFZjNnNrvBoATESq1uUPbEpnCjug9BmXVkvB1Ze3nDLTfOXIA9
	 tiS5rzPlQBRi/xFgcmZpPH7eNArMho2UBsRjiTFGAF2TN4TtHh18WvTuZ7W8EEnFXv6oc
	 yuAWhSD0ul8Ite4abyuKlP7QJQo1NokD2bhPBf0CZviTUXrC6z4U51GZ7MlivjWQwtB1Q
	 qWM4LHGVh2mVYwYW/sLYZrmPT+ECbq2pDvTHxw3+C/zs082e0XBaIngHytyqsQcGDmcIV
	 SUxyp/5F1YKFZiRD6ssw6YVGo6wufTjb5ZUjjamVYq6VYNJKnzm+Zn/infsQlFC4bWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=;
	b=J5smAFDODRGEjCOav6OORHLD5vy3S7f4uABsU2gAiTR7SY4FddD+iBrk52WZQHVKFig7
	 7RyN+evcROFICwcmVH6NxayZDl6uLknEP8KyX0I83rs9uDnRU/mX622VMm/BetDVbTOrZ
	 Yg1GyUUjwVLVBfGE3/Z3Zl7kexZyduNCCMCwgFmkoD7nHW9UCdMDHGSVgv8lTAgaWE2s5
	 +PvUZes4KQAK5TVo2CxlU3bDiDbI7Ns72vVUPXlPP6LvOkIQMXUkrLYKQV01EIw31C9m8
	 +og4nlBaukUbcF9SgcCLehKhsrdWhQIXYAwMEVojs1cE6lw7bVtGOWKuVxz6hy9IO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iVDwr5J6;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396760724ED
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3396760724ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iVDwr5J6
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso4589046a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441304; x=1796046104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=;
        b=iVDwr5J6LAWlo3ns1CFFFZKFkoBL6Uzm4H+AxvKmdAEfL04oN06PAgWvrG2yvXHA86
         dRzfn224UEK3CCHrIIOWsjSvcy4WDhcvzttVN+YxX5q6SB40tOujsH+ab1eGycVWjLVL
         KhVVWUUgwHCXIE3Riw/I7I360ZSq+Nn+l4IiMaqU4xoZE0kQwjUiDv8TgBe1qBSb2CNk
         3Hs0WxE0OiBKLKLwktckFXjyNCaVYXLXDeYs0kEblTvMqcjdWLs4Uv28PPRbNfbZckdf
         AornlaLZ8EQFpgFItjbPmzzuIBFTAy4MwTFkupe/tJbgDia4rmG8te8GI/+oPE+jSSEC
         iG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441304; x=1796046104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MEsM5IzBbjIGBRXvKMxihftpdxum4eZahIiTlpBLrk=;
        b=bEUu2ztOWibpWlqRd3loKPNVojrlBIbARlVaC9NMaexUnbwtoVSPa5gy17lB1eTqhg
         bX9LhFWn8/KeSDzx04VOREf4eOhsknpvAMzJgcsKAeJMQyQ8aWv7aSpRSoUNTfxmHbFd
         Hx0zAhm386WDjagD2geuBTzxIcUvAyvjsC0WfZ5eKB5BeAkFPRjrKBOs2AO/wRDQx2nj
         mNg44ELEkJ+EmQJtw0tjG8/WBcI1/GVI3WrSd3Zw8JKRPNW93GY69syVoCdcFZxbVx2X
         e7r4O0uwcQZ0mT6Lr5UJ2AkZtvrBQ3r1W03xL/U/etM3vTTV5Qg1GxQpTW8jW4BeMAcW
         xh6A==
X-Forwarded-Encrypted: i=1; AL+hErGJIorfGCYhREjkVxZd9XybLZtOol7lcdPcmkxFvKOl10XzSTnwn2orvZHdraQCyUEvdfoDWgVH/KqpUljpbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zgy5QJ6RbXDTG2N02RK3+Wo87f/MP7F8F+JtbCiqWjCjkcMPh
	quEfOmgJ9iiOGcDj0oARRLI9Z4ZAVQgqq4d/0A8SjEk+haK6SUG60TBH4wAiIYMeUw==
X-Gm-Gg: AZFdTZfJaZlAZC6T7K79iqzCwjbhahhQFnanWKrIEyltWttE98mCBtZqjDAEXRlRXaZ
	IdhcCglkJeA1xgP6pDMWw+D1D+KKg+n5IRabwCgzpZXThisArvmX49Qn042Eb572hFUs6wq7w9t
	/ftETOR1BbHBXsfwIUSGkM33+CApMsrx5CBDUvp2TO8UySVv1WYo9/tNtaPcKDPvcN5Knz5AjDl
	Qt5es0/b3SdIcj/Ye7timw07vOQwXAPFnB9pnTWmyB+Cu05aMFpaWn/20hFSQveJGxak6Ben3jl
	zsxUA838BhxmZDq0Mq5eHq7GkB9Svx1gjn9MBMHZK5LWZBPhPQlZJCdnfroFZFULpjbhwrxVAGt
	HJBFuIDzm5NcDzAjP64hv51kH8YXAAgN/C737hOCcrpj7gA/Ttp9NHKCsdfbNj0OhAYyYhUzGEY
	ywEsuAZejeR81RbI5EinzpPfeNvatd/BjVgoQpO6VR9jM/VFhlzyR1O/fiVH2iNVl5IVIti7E4M
	wLIttnMol6XfB5m7rX7tv53NdWT5Nqlvcx7omihfoavvKOwgGeiXt1MlTZM9/n/ruP2oj3RViQc
	PHaAaU8m/IzhZcN3ODXv7X0D7LWKdT/CLzVEwnDj3d0ux+MQ/O5OevVP4RYiQcS5hIaf/YTbA/N
	17qXWbSDp/8pCMiQdADKNRsomu1OUfNqJjGuyGswc2XV9DsSSLorJ/xasYtEDqJeSL9cJ7hVn1c
	L2KTJZqLSiS+UvrC9tlI7nJ4h6SKv/BGRSR6BNY5hPUU4MZgxEIOjReyTkMIBKnTcYoOyjJdrR4
	QSZgkO86t3aSKktbaiPwjO35Km9VSIE+lp5dJy0fNoXdL1iJVyi7wxHuS/D/BZ8ac4vZuXfrsMj
	JSV24nofQB4K4B4PUuF4TYtCtxxp98RggELouh6xcsvMlKnU5ClPtbguMA3QZbvP4Scicw+HaBN
	NL1Vl87Wq2tNEikNIgvY=
X-Received: by 2002:a05:6402:1f07:b0:6b6:e808:9711 with SMTP id 4fb4d7f45d1cf-6ba37eae2f5mr7555038a12.29.1795441304531;
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
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
Subject: [PATCH ath-next v1 06/10] wifi: ath11k: prefetch the buffers of the REO entries ahead of their reap
Date: Mon, 23 Nov 2026 14:41:33 +0100
Message-ID: <20261123134137.718575-7-julius@bairaktaris.de>
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

The REO reap loads, for each frame, the buffer table entry its cookie
names, then the sk_buff the entry holds, and after the reap the
processing of the frame loads the descriptor TLVs and headers the device
wrote. Each is a cache miss, taken one after the other: the table entry
and the sk_buff were written when the buffer was posted and are cold when
the frame comes back, and the frame's lines were just invalidated. In a
profile of bridged uplink at 900 Mbit/s (IPQ8074, one run) the
instruction after the table load in ath11k_dp_process_rx() takes 0.72 %
of all samples, the ones after the first sk_buff loads in
ath11k_dp_rx_unmap_buf() 2.26 %, after the attention load in
ath11k_dp_rx_h_attn_mpdu_err() 1.10 %, after the source address load in
ath11k_dp_rx_h_mpdu() 1.01 % and after the load of the data pointer in
ath11k_dp_rx_process_msdu() 1.05 %.

On a cached REO ring the entries ahead and their cookies are already in
the cache, so start these loads early: as each entry is reaped, prefetch
the table entry of the one after the next and the four lines of the next
one's sk_buff, whose table entry the entry before prefetched; once a
frame is handed to the CPU, prefetch the first three lines of its
descriptor and the first two lines of the frame behind it.
ath11k_hal_srng_dst_peek_ahead() returns an entry below the head pointer
read last. The table is read for an address only, without its lock: a
buffer the table no longer holds costs a prefetch to nothing. Rings in
coherent memory, where each entry read is a read from uncached memory,
are left as they are.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 93 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hal.c   | 27 +++++++
 drivers/net/wireless/ath/ath11k/hal.h   |  1 +
 3 files changed, 121 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b027b76ea3f3..e8226b2b832c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2919,6 +2919,92 @@ static void ath11k_dp_rx_process_received_packets(struct ath11k_base *ab,
 	}
 }
 
+/*
+ * The refill buffer table entry a REO entry names, or NULL for a cookie that
+ * names none.
+ */
+static struct sk_buff **
+ath11k_dp_rx_reo_buf_slot(struct ath11k_base *ab,
+			  const struct hal_reo_dest_ring *desc)
+{
+	u32 cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+			       desc->buf_addr_info.info1);
+	u32 buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID, cookie);
+	u32 mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
+	struct dp_rxdma_ring *rx_ring;
+	struct ath11k *ar;
+
+	if (!buf_id || mac_id >= ab->num_radios)
+		return NULL;
+
+	ar = ab->pdevs[mac_id].ar;
+	if (!ar)
+		return NULL;
+
+	rx_ring = &ar->dp.rx_refill_buf_ring;
+	if (buf_id >= rx_ring->num_ids)
+		return NULL;
+
+	return &rx_ring->bufs[buf_id];
+}
+
+/*
+ * Starts the loads of the reap of the next REO entries, which are cold by
+ * the time the frames come back: the buffer table entry of the entry after
+ * the next one, and the sk_buff of the next one, whose table entry the reap
+ * before prefetched. Only an address is read from the table, without its
+ * lock: a buffer it no longer holds costs a prefetch to nothing.
+ */
+static void ath11k_dp_rx_reo_prefetch(struct ath11k_base *ab,
+				      struct hal_srng *srng)
+{
+	struct sk_buff **slot;
+	struct sk_buff *skb;
+	void *desc;
+
+	desc = ath11k_hal_srng_dst_peek_ahead(srng, 1);
+	if (desc) {
+		slot = ath11k_dp_rx_reo_buf_slot(ab, desc);
+		if (slot)
+			prefetch(slot);
+	}
+
+	desc = ath11k_hal_srng_dst_peek_ahead(srng, 0);
+	if (!desc)
+		return;
+
+	slot = ath11k_dp_rx_reo_buf_slot(ab, desc);
+	if (!slot)
+		return;
+
+	skb = READ_ONCE(*slot);
+	if (skb) {
+		prefetchw(skb);
+		prefetchw((u8 *)skb + L1_CACHE_BYTES);
+		prefetchw((u8 *)skb + 2 * L1_CACHE_BYTES);
+		prefetchw((u8 *)skb + 3 * L1_CACHE_BYTES);
+	}
+}
+
+/*
+ * Starts the loads of the descriptor TLVs and the headers of a frame the
+ * device has handed back, which its processing reads once the reap is done:
+ * the first three lines of the descriptor, where its end, attention and start
+ * TLVs begin, and the first two lines past it. A line past what the device
+ * wrote is not read.
+ */
+static void ath11k_dp_rx_prefetch_frame(struct ath11k_base *ab,
+					struct sk_buff *msdu)
+{
+	u8 *data = msdu->data, *hdr = data + ab->hw_params.hal_desc_sz;
+
+	prefetch(data);
+	prefetch(data + L1_CACHE_BYTES);
+	prefetch(data + 2 * L1_CACHE_BYTES);
+	prefetch(hdr);
+	prefetch(hdr + L1_CACHE_BYTES);
+}
+
 int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			 struct napi_struct *napi, int budget)
 {
@@ -2936,12 +3022,14 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	struct hal_reo_dest_ring *desc;
 	enum hal_reo_dest_ring_push_reason push_reason;
 	u32 cookie;
+	bool cached;
 	int i;
 
 	for (i = 0; i < MAX_RADIOS; i++)
 		__skb_queue_head_init(&msdu_list[i]);
 
 	srng = &ab->hal.srng_list[dp->reo_dst_ring[ring_id].ring_id];
+	cached = srng->flags & HAL_SRNG_FLAGS_CACHED;
 
 	spin_lock_bh(&srng->lock);
 
@@ -2951,6 +3039,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
+		if (cached)
+			ath11k_dp_rx_reo_prefetch(ab, srng);
+
 		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
 				   desc->buf_addr_info.info1);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
@@ -2976,6 +3067,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
+		if (cached)
+			ath11k_dp_rx_prefetch_frame(ab, msdu);
 
 		num_buffs_reaped[mac_id]++;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index e5c35647a136..fffecc077eac 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -627,6 +627,33 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
+/**
+ * ath11k_hal_srng_dst_peek_ahead() - an entry of a destination ring past the next
+ * @srng: the ring, whose lock the caller holds
+ * @n: how many entries past the one ath11k_hal_srng_dst_get_next_entry()
+ *	returns next
+ *
+ * Return: the entry, or NULL when the head pointer read last does not
+ * reach it.
+ */
+u32 *ath11k_hal_srng_dst_peek_ahead(struct hal_srng *srng, u32 n)
+{
+	u32 tp = srng->u.dst_ring.tp, hp = srng->u.dst_ring.cached_hp;
+	u32 avail, off = n * srng->entry_size;
+
+	lockdep_assert_held(&srng->lock);
+
+	avail = hp >= tp ? hp - tp : srng->ring_size - tp + hp;
+	if (off >= avail)
+		return NULL;
+
+	tp += off;
+	if (tp >= srng->ring_size)
+		tp -= srng->ring_size;
+
+	return srng->ring_base_vaddr + tp;
+}
+
 /*
  * Hands the CPU the entries of a cached destination ring from word @from up
  * to word @to, which the head pointer the caller just read shows the device
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 82603a389bb9..45ac2391abd8 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -944,6 +944,7 @@ void ath11k_hal_srng_get_params(struct ath11k_base *ab, struct hal_srng *srng,
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng);
 u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
+u32 *ath11k_hal_srng_dst_peek_ahead(struct hal_srng *srng, u32 n);
 int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
 				 bool sync_hw_ptr);
 u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);
-- 
2.53.0

