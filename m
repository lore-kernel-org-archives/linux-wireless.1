Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938510;
	b=j6x+o+KDkub9IrEpf3GEzOs9q2hGsLvGfo5iegx6wQ1PesrzE9BdQufatTePVcbsIQ9B
	 U9szV5QloQjUBzhjfE1wttcnXnXsMYS6/8gZ7OmYGDEo32RfSf/bKlnftrZMPBTaE9WCj
	 y9A+0vUImr4uRzK3T35qxK8r59FcIhk96KFYZYdkz9w2fJFlTYey9f+of7hDB4iUO73nl
	 zM5kqM7qzfJJ2hAK1qxMrB5oLq7/F/6rE505qYNXx+1eZKB13RZbDyJu+IQ/NBxgA0nZN
	 LoTSv5W7XpMFaLOyDX1soZN+1CHKzNIZtZg04cqjg3ww9GYB7/fARQEsRF5DeUOd3vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938510;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nnnhZ2q1d+BKRNNYy0U6GyA/u4sBibEs6354pxLQ4Zc=;
	b=eNgivYcxu/PO2L1RKSXneGV0xwaxP765VAA/AwGJGGfGgFo1tRpLWeuqWrdHtZAqeSWz
	 /yexeSoCi+he5YBvhFzn14WXwuQFxdYzkPMrm+9LLgQCvFrVf7gX1UAM6QUNhDtJATzmu
	 Ul3fmdBpn6xjEc25V3oI+TMqFlohfEJGYGn2a5yvnN/nskjGQ3BcRy6M0Fo0GZEhrm2tT
	 L0l1LR8lOz4bAXYsse6vsP8RKfF69i+3c1G3dbW+YndlNFQTQTmpUrvWQHQt0xJUZzJbU
	 spCwNMCenjCn9B0ryESqCN28UBse3gnK6pTBdbSPl0BmbjBxFZ6puZKxH6gTeiGW3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=BCVcXps4;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39034606A332
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39034606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=BCVcXps4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nnnhZ2q1d+BKRNNYy0U6GyA/u4sBibEs6354pxLQ4Zc=; b=BCVcXps4Lgec9qTsUde3PdkXKe
	V4YZmd8kGOKrFDzZVWajUL+KV1u5vEjLzcszVmq7UHIQS+eMhhvhhWtbb3wBSeTiXPsTxE/FkbUXs
	dKfmk92R3lzlzWbAggT/zfJNHWh1Y10bPyDDQaVgeeDvmTxn+cNNqHke8qYpvXvV1lOk=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-2h
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:42 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/19] wifi: mt76: delete only the RX NAPIs that were added
Date: Tue, 17 Nov 2026 19:01:20 +0100
Message-ID: <20261117180134.2940930-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt76_dma_cleanup() calls netif_napi_del() for every RX queue, also for
the WED RRO queues of mt7996, which get no NAPI while WED is active.
__netif_napi_del() then locks the NULL netdev of that NAPI, and rmmod
of mt7996e with WED crashes.

Delete only the RX NAPIs that have a netdev.

Fixes: 6b470f36616e ("wifi: mt76: Fix memory leak destroying device")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index a67880a9281c..8c0403820299 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1217,7 +1217,8 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
 
-		netif_napi_del(&dev->napi[i]);
+		if (dev->napi[i].dev)
+			netif_napi_del(&dev->napi[i]);
 		mt76_dma_rx_cleanup(dev, q);
 
 		page_pool_destroy(q->page_pool);
-- 
2.47.3

