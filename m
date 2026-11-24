Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509793;
	b=0k9Gx9yuLPtc8wTWsRsGNoTtN2f7kO2Hs0ldnRQ7bEl2fZsldXk9j1/kN3rpETor09cW
	 uYPHSQXWbs+G217yYtq2xThtRscM+YVfyxalvv+PiqUjGo9nu9tVFDQdJBkF8klkok3v7
	 hrAWJ3JyVMM2vDYUoDP/OWAGiah639/qUnCKF/xCSPv+f8xHwxglhNQuztUzrZnyKgcIH
	 vvGhMcDAW6JUiIprzBExN+kTW/LjRd0xUIfS4pLbAIt3ELAhPjZTSdPinrpZZoE5/c5N7
	 NBLM/SWgmR1Sa4PUEz/SOaqkMzfhTagdTXz70tA0BxwBdqG3uL5IFh6qGFOk1sQc70g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509793;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3imTHwnV7xt7WH1GGl6/TRUmG638htICWP4LDAiKgnI=;
	b=2D52gw3M87Wif+Itb7pDgycuyDce+nO4I4Lf7Xp2eXr0cRgPWxzSTdBod9We7k+fejAD
	 1AZTURkIbCbQVIubCBoSun/702z8ci+zqm5Thaj7xZB02eFweLdPoGcc+IfMfYJ2+jKWc
	 nTfzLfup4LmhlGauoxNrqkEQ837R3hpBvcRdg7Tdmc+kGJ2OueHfsOE7Qphh9nL9kfTRb
	 YXH7ErJzW5SL5G+ghwpC804bG6d9wtF9u25zLU67KswVn4vUVl+VU0hSbD4XxJrWvo4gG
	 FaGG4hk6/ro8pAnLY+UJDzdyqWVvjR/8FnyO+L3TLj2x0HNNJ/crp6b/J5pN5Y347wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="TsUOfW/q";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48966606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48966606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=TsUOfW/q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3imTHwnV7xt7WH1GGl6/TRUmG638htICWP4LDAiKgnI=; b=TsUOfW/qdwPvdsixju69FcDz+D
	S8fSROtdzqowSMr4SUwgAgSw1K5FWyXhlTychEUcY388Q9qle/yoKLHQB7Ppp8ZKtjx/UqOd8qsGc
	QyYSK776uCCvmlfO4QmpU/xF3e2oA2s4+8ejo2EfUW79uz3CXNEZwmDJZcu/S4qTL9UE=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7L-007dJf-22
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/20] wifi: mt76: fail an MCU command started during an MCU reset
Date: Tue, 24 Nov 2026 09:42:52 +0100
Message-ID: <20261124084309.1981968-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

While MT76_MCU_RESET is set, mt76_dma_tx_queue_skb_raw() drops a
command with the error of a full ring or a failed DMA mapping. The SDIO
path queues the command, reports success and skips it. The USB path
sends it. The caller thus cannot tell such a command from one whose
answer the reset cut off.

Do not send a command that starts while the bit is set. Return an error
that no other step of the send gives. The interrupt path can set the
bit after this test. Return the same error from the raw TX of the DMA
path for that case.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 6 ++++--
 drivers/net/wireless/mediatek/mt76/mcu.c | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 8c0403820299..f5203f39e6b1 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -637,8 +637,10 @@ mt76_dma_tx_queue_skb_raw(struct mt76_dev *dev, struct mt76_queue *q,
 	struct mt76_queue_buf buf = {};
 	dma_addr_t addr;
 
-	if (test_bit(MT76_MCU_RESET, &dev->phy.state))
-		goto error;
+	if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
+		dev_kfree_skb(skb);
+		return -ESHUTDOWN;
+	}
 
 	if (q->queued + 1 >= q->ndesc - 1)
 		goto error;
diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 7149b2f7aafd..e19fd1bbd911 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -91,6 +91,12 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 		goto out;
 	}
 
+	if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
+		orig_skb = skb;
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+
 	if (dev->mcu_ops->mcu_skb_prepare_msg) {
 		orig_skb = skb;
 		ret = dev->mcu_ops->mcu_skb_prepare_msg(dev, skb, cmd, &seq);
-- 
2.47.3

