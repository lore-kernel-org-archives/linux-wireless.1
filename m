Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923043;
	b=aDuKTn4jDaD3F7Py0Hk69JRuwrJyUtAtpo+Qeu0pMhXuXMPYKFo/QW12ckRZ5PCx+7kO
	 /rci+5/i8t56yPUcHn3r/aK8I5y/ZY87O3uOhzJ8N5sjzjuA20ufwz+WNbOJfXlXQrzor
	 5H2TlqD3Ckdpb6wrADT0w7vPHozJQ2sWqmBVtvlbRDgOm0xh32U+eZgndi5lyQZf0QQSK
	 ePRyF9/w9SAcf3VYxLT9L3XdTVXJFEKpET9/5SuPYlnEiknjwQFi3Uwlowis6vRRYVwOW
	 GdcKYCdI/MRdanTeNtIVajbKlYSwJZHW4/MfZ16h6jDljsmOEObRSWDPuYtKsRoyQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923043;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=FdxODg1OMTh/8tBb7F6uXhtrvD4su2QPV2YIScAzIgc=;
	b=Z+D8wWuyisPZaDyt3ObVihwE5dLPaJydYhbY3wViG/23kAmntlwd6JcfIV8CPtVIKX0B
	 LvUct19NVqS74lAT/5hiK+7uVXWU96IY1XfDLxx0k/5fZvZldIyIuyoe2eOQ9wbckbjmE
	 xAFOa4ls45tD3Ehx+X9W7ZFf7BVtsWPIZWMSri+qJQWELlJ4bmDqytH0YaUh3mVn0icSY
	 elVemFk3mDqlJ0pWwdlEA6e1nm/+MZZeD+qmmlPfgVvaFW0EswURvR3Gd5HPU9yboL5y7
	 qvLwxGj18owRK6v71Ru2P90x/luZGPBhy5G5wwcRFMi7HONNOOIrVa3BdsNG0seG+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="or/4GnPd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F195606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=or/4GnPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FAA1F000C7;
	Tue, 17 Nov 2026 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794923043;
	bh=FdxODg1OMTh/8tBb7F6uXhtrvD4su2QPV2YIScAzIgc=;
	h=From:Date:Subject:To:Cc;
	b=or/4GnPdwHONLlVzympVxTs8huLooc3V1L30zxsdLm9ellfTnb7vtTDTsPjzUTikC
	 X5jvOveJ8wAmPuRs/bcdELbioSKnhKbXB5zrtD9a/ItHs/xJxTKKI/0aKXQm/zX3Lv
	 eg4k0F0GDahDkYz3xNLzlLFCVILLbZH6TlrnJe9UaeHcDmfBANA5ExfskzW6I1WOhH
	 2+W5KZ4WRPbCfOSUiYP/4suBP+1yHn1ZUiIbmQJA8W13O51RHXIaRoH8ttnIV3Pu+y
	 Pfy2fRxHK7PEcITyiHKiwEjcp4dm+7Jo7s+RJSI8RgBnb4gCW3c21HVZNpKNNUsxnR
	 de5w/M746HJ0Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 17 Nov 2026 14:43:46 +0100
Subject: [PATCH] wifi: mt76: npu: fix RX packet reassembly across NAPI
 polls
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt76-npu-fixes-v1-1-11bf744747f2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtoDBS6SrQQnWoWmWhFIN09a
 fn4/AqFs3CBUVXIfEuRIzZQp8BvLq6MEppB99oQkcX9tAZjunCRhwtysNr7gYwzDtqUMv+hPdP
 8vh+P5c51YAAAAA==
X-Change-ID: 20261117-mt76-npu-fixes-ed72cc316a6a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Florian Maurer <fmaurer@disroot.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

mt76_npu_dequeue() builds an skb from the descriptors that make up a
single NPU RX packet. When a packet spans multiple descriptors and not
all of them are ready yet, the function frees the partially built skb
and returns NULL without advancing q->tail. The descriptors already
consumed are then processed again on the next NAPI poll, even though
their buffers have already been handed to the skb and recycled, leading
to a use-after-free/double-free and possible memory corruption.

Rework RX processing to keep the partially built skb and the number of
outstanding fragments across polls: store the skb in q->rx_head and the
remaining fragment count in the new q->pending field. The new
mt76_npu_rx_process_entry() consumes a whole packet, resuming a
previously started one if needed, and advances q->tail for every
consumed descriptor. Only fully received packets are passed up the
stack.

Release any pending skb in mt76_npu_queue_cleanup() and add the missing
DMA read barrier before accessing the descriptor length and info.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Tested-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h |  1 +
 drivers/net/wireless/mediatek/mt76/npu.c  | 88 ++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9e851dea71d9..f52a0e2246be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -249,6 +249,7 @@ struct mt76_queue {
 	int ndesc;
 	int queued;
 	int buf_size;
+	int pending;
 	bool stopped;
 	bool blocked;
 
diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index c4c7c0af6321..3ca83985376d 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -56,61 +56,81 @@ void mt76_npu_queue_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 	}
+	if (q->rx_head) {
+		dev_kfree_skb(q->rx_head);
+		q->rx_head = NULL;
+		q->pending = 0;
+	}
 	spin_unlock_bh(&q->lock);
 }
 
-static struct sk_buff *mt76_npu_dequeue(struct mt76_dev *dev,
-					struct mt76_queue *q,
-					u32 *info)
+static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 {
+	struct mt76_dev *dev = mt76_priv(napi->dev);
+	enum mt76_rxq_id qid = napi - dev->napi;
+	struct mt76_queue *q = &dev->q_rx[qid];
 	struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
-	int i, nframes, index = q->tail;
-	struct sk_buff *skb = NULL;
+	int nframes = q->pending;
+	u32 info = 0;
+
+	do {
+		struct mt76_queue_entry *e = &q->entry[q->tail];
+		u32 ctrl = READ_ONCE(desc[q->tail].ctrl);
+		int len;
 
-	nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
-	nframes = max_t(int, nframes, 1);
+		if (!q->queued) {
+			q->pending = nframes;
+			return -EBUSY;
+		}
 
-	for (i = 0; i < nframes; i++) {
-		struct mt76_queue_entry *e = &q->entry[index];
-		int len = FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK,
-				    desc[index].ctrl);
+		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
+			q->pending = nframes;
+			return -EBUSY;
+		}
 
-		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl)) {
-			dev_kfree_skb(skb);
-			return NULL;
+		dma_rmb();
+		len = FIELD_GET(NPU_RX_DMA_DESC_CUR_LEN_MASK, ctrl);
+		info = desc[q->tail].info;
+		if (nframes == q->pending && !nframes) {
+			nframes = FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, info);
+			nframes = max_t(int, nframes, 1);
 		}
 
 		dma_sync_single_for_cpu(dev->dma_dev, e->dma_addr[0],
 					e->dma_len[0],
 					page_pool_get_dma_dir(q->page_pool));
 
-		if (!skb) {
-			skb = napi_build_skb(e->buf, q->buf_size);
-			if (!skb)
-				return NULL;
+		if (!q->rx_head) {
+			q->rx_head = napi_build_skb(e->buf, q->buf_size);
+			if (!q->rx_head)
+				return -ENOMEM;
 
-			__skb_put(skb, len);
-			skb_reset_mac_header(skb);
-			skb_mark_for_recycle(skb);
+			__skb_put(q->rx_head, len);
+			skb_reset_mac_header(q->rx_head);
+			skb_mark_for_recycle(q->rx_head);
 		} else {
-			struct skb_shared_info *shinfo = skb_shinfo(skb);
+			struct skb_shared_info *shinfo = skb_shinfo(q->rx_head);
 			struct page *page = virt_to_head_page(e->buf);
 			int nr_frags = shinfo->nr_frags;
 
 			if (nr_frags < ARRAY_SIZE(shinfo->frags))
-				skb_add_rx_frag(skb, nr_frags, page,
+				skb_add_rx_frag(q->rx_head, nr_frags, page,
 						e->buf - page_address(page),
 						len, q->buf_size);
 		}
 
-		*info = desc[index].info;
-		index = (index + 1) % q->ndesc;
-	}
-	q->tail = index;
-	q->queued -= i;
+		q->tail = (q->tail + 1) % q->ndesc;
+		q->queued--;
+	} while (--nframes > 0);
+
+	dev->drv->rx_skb(dev, qid, q->rx_head, &info);
+	mt76_rx_poll_complete(dev, qid, napi);
+	q->rx_head = NULL;
+	q->pending = 0;
+
 	Q_WRITE(q, dma_idx, q->tail);
 
-	return skb;
+	return 0;
 }
 
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,
@@ -155,18 +175,10 @@ static int mt76_npu_rx_poll(struct napi_struct *napi, int budget)
 		goto out;
 
 	while (done < budget) {
-		struct sk_buff *skb;
-		u32 info = 0;
-
-		skb = mt76_npu_dequeue(dev, &dev->q_rx[qid], &info);
-		if (!skb)
+		if (mt76_npu_rx_process_entry(napi))
 			break;
-
-		dev->drv->rx_skb(dev, qid, skb, &info);
-		mt76_rx_poll_complete(dev, qid, napi);
 		done++;
 	}
-
 	mt76_npu_fill_rx_queue(dev, &dev->q_rx[qid]);
 out:
 	if (done < budget && napi_complete(napi))

---
base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
change-id: 20261117-mt76-npu-fixes-ed72cc316a6a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>

