Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871193;
	b=ckCdoRNgew9HKQC+V+y9W1FQrhA/5pm+WiP+cDEvi1wVduEEpFZhkKB/FV328rVfdh6O
	 rnTgminaaHL3aHaNtCibdIChU5DWtCZBg0vav377szpl7OXOcKoAKSrVtZkESI2UNkcal
	 NJPU2vtmEUW1fTlicsl9brtUEkM4cm3gWE+NpccrcM2zDCQsnY/QYw5sRJU6fH1YjqR8n
	 0rkfeGgs+wABzY1RHahkTLVKpIDo1C9N0/pmgTkpJOwKfwcfIOaIim0tYWj1id9gCM1VF
	 ntrkBPSaV0fUhokjtp5oKe+Mo/IaenseHWzuDpgRr0kqc5udECY0OMsIhvIcpSYCESw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871193;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vYYiOFzTjYSCr6Fp7dl2UeRPDz2kE3dHsqu4/v2K5CA=;
	b=eMKCS0Mda1V/bXwW2LF0MuDy2FJpfr3dnEUFj4ENY8TmYwoDH0I/pU7hj/lLW+iOeCEn
	 /Defj/6KqWM+xoElAztacLhNJ41wSBQJvZ05LG4TyyktrNk32q4vShV9IpKBEOOwSo/8o
	 t2Hb86ndMZoC7Rv816jRcjmExzorj7mpTDJqqHpd0SE53hKBR5jbtlfHk07c70iJSEbTm
	 BHW4Rm/rjCpuKqqvr1fp4HBx24w5UTtABn4IMVNVJ2UNvG7mr6IdVQBzlo8bQ8gIAsy0C
	 xLsaV0ExzXpqcwQ281h/a3rBxbgRG6RKC6H8ZJ0rdaxNloPwqVWctyGchSWqU2GTYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043D606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7043D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53ec2cc397aso2845470b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871192; x=1795475992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYYiOFzTjYSCr6Fp7dl2UeRPDz2kE3dHsqu4/v2K5CA=;
        b=cImpxKFa4fCQ8FUA8lQBLuIPCQgt68/6ebJrybA8b1P8imVSmZHEBz01KwSa+bfYHg
         Tq7FpgZkayfs9n9DLLu0YoKMPUGk232+RMHuV2KvNO5dmCniqL0M+/3i2KmFiNWfpY1t
         nAY2KGO7C+P7pD8Ogqtaq9y7scpF8ukLHlPySE661SnJrIIgiXMhChcKxvORrG+eAGlQ
         afDgksKJqot4K8LB/hzBdAlY2Nan5wr8g6DcZsj/C5FyoROxCtCA1C8ArQlfayauvc7v
         0inmigv+xVRaDPvOFTjr1Hi5FP7hUNIF8ybKCvXmgFXjMUYU9V+9C8dGauLt0P1X0kdg
         ZgvQ==
X-Forwarded-Encrypted: i=1; AL+hErHEPoFAzJA0oFavvLNnrIy8ujOLcjpIoNeLl1vqs3sF8KEXqWi4YcLnNk5fU6kvVVlLDWFq4tBWvsFObGvHmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/skzJqirCytSjf2WvVRLPYcHbNOs8nOaCk7p4shZ/2fK9BwDOT
	6cslx/tRmrLQBJe63QCi5Ic9NjVidVvJJSamKVDVbNZbkvw+KkCjpSeW
X-Gm-Gg: AYBFou1dKkIGCqZRHoSteKTHSPhOOdFTu2kqs9jU81VF5vOH3mp2Yc08xttO6sBT+aS
	ihFMeNx8S8znvX19sdSgXnZeHUiA5Mov++uBY7Nf2w1VIYuxCEnS5Igo/+vHhkrmE5sv9jLhFth
	1CGyEZCYoaytNA01PQ4FlDxpQFnKAUoZUqEyw7BdgXblpGKgm4swL7uK5j+xDEAfaWwRwP3oVID
	6wkpicq7RKDHwlk3WR0FLqLA9PZaGVmb+wS0EmvTSHgghXBM/YRiu1xmWvEfh5/QTIYYaYinj31
	cgL9dtbMLCCBRsOjvnJhPazoQC2UynxPXXev3F6ZfaoOD9qQPiPTt0K6cF9L1J44n944anXlfjY
	eJR3e4YmMOnpDt4Gv5k03+98PPOVTQyTnX3D7wLOGMnWh78sMSwngOLMmcE/GLtirg5mI5LsVWk
	+GZHpnPbiR8ggQMhWoDkTtc3knLKIPYiwKFAxQCM7aRc/4XD28tuHinLqZMR1ujUAwv7pVX4czA
	TJZzZ9IQ1uV3TcVAmPjsep9jg0yj/LhedWzmvVaQ/wKRHEqxx4jecFjUlL7FHXVbvO55Ha2sjek
	GZqfCNwQRYugyr1PVZVGQgvGp/QRTa9Ehcv5/aYApbsxFkQs6Yn/cNa5K/rrP25S4cPZRP4whzS
	4Js8x+PjaIg==
X-Received: by 2002:a05:6808:5094:b0:4d6:90d3:e189 with SMTP id 5614622812f47-56e645e3178mr12285184b6e.50.1794871192310;
        Mon, 16 Nov 2026 15:19:52 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:50 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 15/19] wifi: mt76: mt7925: disable only the RX NAPI instances that exist
Date: Mon, 16 Nov 2026 17:16:26 -0600
Message-ID: <20261116231630.1733906-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925e_mac_reset() picks the RX NAPI instances to disable from the
interrupt masks, but the instances themselves are created per allocated
RX queue by mt76_dma_init(). On mt7925 the two do not agree: the tx-done
ring is only described by the mt7928 DMA layout, so q_rx[MT_RXQ_MCU_WA]
is never allocated and never gets a NAPI, while mt7925_irq_map still
carries rx.wm2_complete_mask.

A MAC reset therefore calls napi_disable() on an instance whose
net_device pointer is NULL. The fault happens inside napi_disable()
while the reset work holds the RTNL, so networking goes down with it and
the machine is left answering ping with no usable userspace; only a
power cycle recovers it. Repeated NAN data path setup and teardown hits
this reliably on a busy channel, where MAC resets are frequent.

Iterate the RX queues instead, the same way the restore path further
down re-enables them, so only instances that were actually added are
touched.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 7f6da681b4a4..6189615d6604 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -132,12 +132,19 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	mt76_txq_schedule_all(&dev->mphy);
 
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	if (irq_map->rx.data_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MAIN]);
-	if (irq_map->rx.wm_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
-	if (irq_map->rx.wm2_complete_mask)
-		napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+
+	/*
+	 * Disable the RX NAPI instances that were actually created. They are
+	 * added per allocated RX queue by mt76_dma_init(), while the interrupt
+	 * masks describe what the hardware is able to raise - on mt7925 the
+	 * tx-done queue is never allocated (only mt7928 defines that ring), so
+	 * its NAPI has no net_device and napi_disable() faults on it while
+	 * holding the RTNL, wedging the whole machine. Iterate the queues, the
+	 * same way the restore path below re-enables them.
+	 */
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
+
 	if (irq_map->tx.all_complete_mask)
 		napi_disable(&dev->mt76.tx_napi);
 
-- 
2.43.0

