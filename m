Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345785;
	b=SldFmtpIAZps4GFFU41ZHKGKVowJfNmSZ5AItDgmULGlb1LaTcYJFvnXYqqdnf5CZ+2j
	 8yYX79NIhX5A0yeDHxT7CVsu4e6LjclEzEI547JpHAku0iNtiNYSOgzQZDS0zyScWKkL7
	 eHM4x/4MQXCQdvLe0BrkoKAKbi6UDLg3mZkrNjm4gqqiHDX66LlrhglkD5lt1coHEB3s8
	 swv9ovRMI+USIXF6z6RKwLdYLmYOz43W5dzvzGUT1i6GuF5X88/PfPuZMedio2s/spoWV
	 NVWmjJGL7ZTsp6ToHsuMGtFuOpZ/gJJnOaRjY02zEnH2ZrzMUlKOAL12DJ6tvCPwPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345785;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=hDiLfLkVi2BJOFHCEI42KT0ixsZ7jOa65OfeACjeJko=;
	b=3+F0Fq8iMrwBJkg5wPgIBRrq0y9T960mW+RH3leE5xnM2t+nILM7bJuQg0UWCt+Asg2A
	 L4KO8E3TfIDiQQF8noJiFYOUTbdoveCh/flanT+1bWLdMYENdYTmGZxxxjX2gpwlj6ZXG
	 //3t4j6dbtxx2K2dxStRlrYvpy9nJij+Oyndk634KIwdWgOTjftCPtwX13oE49HqVjw2G
	 bE/VoOZPftIfd0ffgVbZbiarDmKzce8+MSB4XofTYGlT6GXzl9b7VnCE0O2SIYkq1ckei
	 01AuGJJ29U+SOIueo8erzNJM9625KyTNIxhx0jHPYw7lSlTPEF2g+9M4ZDGW/Vkr1xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIFn8aYN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4F606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIFn8aYN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADD31F000C4;
	Sun, 22 Nov 2026 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345785;
	bh=hDiLfLkVi2BJOFHCEI42KT0ixsZ7jOa65OfeACjeJko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LIFn8aYN/dt9xjsGkVCkqHecP4zc9h6t8cujdyOlgUUnvI1ycb6xa4ipu7SP2vxiX
	 e4iWqp22cF1CoIh9n0U880rxW4wsSCZCU1nyPBC8uemrl676AaPYC5fXi2RRStkuPg
	 VkLnYNFvMShcWoAA3jdDrh0temXrQgSaESHCnVpw18j+N58KWToQ7VVnWXJIRd/E3Q
	 mqZ2OjrxlJNzn8js3hUEOQO+4BEp0Pg0F4bIuwZgipKgjQ31L9C+0JHPIn1pD4gMyC
	 MROL4ADcwCWj0ZvSiQSteCnUDrYwbp2J0YF4OnhzZcHHN5a1vYEJwFBOcb7KxN08oa
	 GF4ot9kFJNDBQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 22 Nov 2026 12:09:14 +0100
Subject: [PATCH 1/2] wifi: mt76: npu: acquire queue lock running npu napi
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
Message-Id: <20261122-mt76-npu-fixes-v1-1-8d8876b91970@kernel.org>
References: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
In-Reply-To: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

The NPU RX NAPI path updates the ring indices (head/tail/queued) and the
pending reassembly state in mt76_npu_fill_rx_queue() and
mt76_npu_rx_process_entry() without taking q->lock, while the cleanup and
reset paths do. A NAPI poll racing with a queue reset/cleanup can
therefore corrupt the ring. Protect the ring bookkeeping with q->lock in
both helpers, and drop the lock before calling rx_skb() and
mt76_rx_poll_complete() since those can sleep.

Move the dma_idx update out of mt76_npu_rx_process_entry() into
mt76_npu_fill_rx_queue(), after the ring has been refilled, so slots are
handed back to the NPU only once they point to new buffers. Updating
dma_idx as soon as a frame is dequeued lets the NPU DMA into descriptors
that still reference buffers already passed up the stack (or still owned
by a partially reassembled frame), leading to memory corruption under RX
load. Add the missing write barrier before the dma_idx update so the new
descriptor addresses are visible to the NPU before it may reuse the
slots.

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 37 +++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index 3ca83985376d..fbefc86001ff 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -18,6 +18,8 @@ int mt76_npu_fill_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 {
 	int nframes = 0;
 
+	spin_lock_bh(&q->lock);
+
 	while (q->queued < q->ndesc - 1) {
 		struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
 		struct mt76_queue_entry *e = &q->entry[q->head];
@@ -40,6 +42,11 @@ int mt76_npu_fill_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		nframes++;
 	}
 
+	wmb();
+	Q_WRITE(q, dma_idx, q->tail);
+
+	spin_unlock_bh(&q->lock);
+
 	return nframes;
 }
 
@@ -70,9 +77,13 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 	enum mt76_rxq_id qid = napi - dev->napi;
 	struct mt76_queue *q = &dev->q_rx[qid];
 	struct airoha_npu_rx_dma_desc *desc = (void *)q->desc;
-	int nframes = q->pending;
+	int nframes, ret = 0;
+	struct sk_buff *skb;
 	u32 info = 0;
 
+	spin_lock_bh(&q->lock);
+
+	nframes = q->pending;
 	do {
 		struct mt76_queue_entry *e = &q->entry[q->tail];
 		u32 ctrl = READ_ONCE(desc[q->tail].ctrl);
@@ -80,12 +91,14 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 
 		if (!q->queued) {
 			q->pending = nframes;
-			return -EBUSY;
+			ret = -EBUSY;
+			goto error_unlock;
 		}
 
 		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, ctrl)) {
 			q->pending = nframes;
-			return -EBUSY;
+			ret = -EBUSY;
+			goto error_unlock;
 		}
 
 		dma_rmb();
@@ -102,8 +115,10 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 
 		if (!q->rx_head) {
 			q->rx_head = napi_build_skb(e->buf, q->buf_size);
-			if (!q->rx_head)
-				return -ENOMEM;
+			if (!q->rx_head) {
+				ret = -ENOMEM;
+				goto error_unlock;
+			}
 
 			__skb_put(q->rx_head, len);
 			skb_reset_mac_header(q->rx_head);
@@ -123,14 +138,20 @@ static int mt76_npu_rx_process_entry(struct napi_struct *napi)
 		q->queued--;
 	} while (--nframes > 0);
 
-	dev->drv->rx_skb(dev, qid, q->rx_head, &info);
-	mt76_rx_poll_complete(dev, qid, napi);
+	skb = q->rx_head;
 	q->rx_head = NULL;
 	q->pending = 0;
 
-	Q_WRITE(q, dma_idx, q->tail);
+	spin_unlock_bh(&q->lock);
+
+	dev->drv->rx_skb(dev, qid, skb, &info);
+	mt76_rx_poll_complete(dev, qid, napi);
 
 	return 0;
+
+error_unlock:
+	spin_unlock_bh(&q->lock);
+	return ret;
 }
 
 void mt76_npu_check_ppe(struct mt76_dev *dev, struct sk_buff *skb,

-- 
2.56.1

