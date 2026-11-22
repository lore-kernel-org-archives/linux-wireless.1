Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345788;
	b=p9I9yqi5CuXRs9nHV45ogSpEXM7R4HjnVnCkehS90daZ/cY6Ez8ymTWopTndLAFNBiVL
	 jCjl+DBXBgIZq3KhJMLV7k++Rxy5GlHmnj4EX0XgHO7U/I1ru1aiLABYvMBGkJ0yXCWc8
	 681znPTaRTvapuZDVFEcUjHIt1IsV+GOHhp89H4V+XuzG1nx69kY/fwLBJdJE5F2Vge4G
	 sj92/GkSr4NtRWo4nAxHPjjH3Uul71ZmGpMLqUIGQoJkix7V/TCgHD5Tnbt6Ll3KpznSW
	 z2Hw3ostxGNKk3vok7Cdby4dLHks9oIXRBOHZGtuoq1BcZwXbHduj11K0GG9HU30dLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345788;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=iPkAHXq9kHCijdQVDkRSkzsGpRx+BYkqVu4mfSObAl8=;
	b=kqnaqM+41gMc8TFFar294xqBhCjuSovyZtCAp1ups5eIvRoaDQUaTl/cNcVJKU0ZFizz
	 S6b2nyyMl8Up0yZD97augI60ibLg5bf/aeJz3pjRL/Fs8wOmjwOWTi38VTifGkrDgKx1/
	 nFUuRJF/EYG0Od0RM+R4MIaUAry8020/CWYu6co/I/CJlpgPNMfx7lQFQ9hNo1OJEAwWW
	 3Vh3CJysTbemfeatj3iRuNpZFnMJk+dAsV0BdpaN+sg7Tc2TFAQxqrEs1Zz2mKrBHqqf7
	 kuKCkizUMemBgvDGw3lDYwXTBiDz7GUom/vcH4mLh+MoRXDtrsX+g+fO9JelDVNOkKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqTCOIYg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EA606A331
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqTCOIYg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243761F000C4;
	Sun, 22 Nov 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345787;
	bh=iPkAHXq9kHCijdQVDkRSkzsGpRx+BYkqVu4mfSObAl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VqTCOIYgkK547wymhySSSZvHC4hs+M6RaQ8W2SQOfPA2sEPCTV13YpsJ0xvzFLBwq
	 N5YCqWTBnbHjaziO0MFCT6dK89c6siP0/XuNRLrFdFIYfy7pWpMbdAx2mLmb7HYuP9
	 OYp3Zd9Xgdb38yC+HYdwMslpxb2bcy3i5g+U3O/a5cIQdyAHfSB5br2+CsQUGQnXTW
	 VL7eO77kynrpRf7S7efC6GykbDoNl1PK7kJl9Ns1gaQ7/NFdLmA+neCrqseyIO3EY7
	 Fp0lyJ17PCaGS/pQh3N/clk6QLi8o9b8/Rm8CRP2qXe0ZZtTTiPMemSo4fMj1QjWmT
	 WWiE4/Xxwpd0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 22 Nov 2026 12:09:15 +0100
Subject: [PATCH 2/2] wifi: mt76: npu: do not run mt76_npu_queue_cleanup()
 for not allocated queues
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
Message-Id: <20261122-mt76-npu-fixes-v1-2-8d8876b91970@kernel.org>
References: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
In-Reply-To: <20261122-mt76-npu-fixes-v1-0-8d8876b91970@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

mt76_npu_deinit() unconditionally calls mt76_npu_queue_cleanup() on the
NPU RX queues, even when the NPU is not active and the queues were never
allocated. In that case q->lock was never initialized by
mt76_dma_alloc_queue() and mt76_npu_queue_cleanup() takes a zeroed,
uninitialized spinlock. This is caught by CONFIG_DEBUG_SPINLOCK ("bad
magic") and lockdep, and is reachable on any mt76 device once
CONFIG_MT76_NPU is enabled, not just on NPU-capable ones.

Only call mt76_npu_queue_cleanup() when the queue was actually allocated,
i.e. when ndesc is set, matching the check already present in
mt76_dma_rx_cleanup(). Since mt76_dma_alloc_queue() initializes q->lock
before setting ndesc, a non-zero ndesc guarantees the lock is valid.

Run the cleanup while still holding dev->mutex so it is serialized with
the rest of the NPU teardown, keeping the dev->mutex -> q->lock order used
by mt76_npu_rx_queue_init().

Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/npu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index fbefc86001ff..af5bc3da26ab 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -554,8 +554,10 @@ void mt76_npu_deinit(struct mt76_dev *dev)
 	if (ppe_dev)
 		airoha_ppe_put_dev(ppe_dev);
 
-	mutex_unlock(&dev->mutex);
+	if (dev->q_rx[MT_RXQ_NPU0].ndesc)
+		mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU0]);
+	if (dev->q_rx[MT_RXQ_NPU1].ndesc)
+		mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU1]);
 
-	mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU0]);
-	mt76_npu_queue_cleanup(dev, &dev->q_rx[MT_RXQ_NPU1]);
+	mutex_unlock(&dev->mutex);
 }

-- 
2.56.1

