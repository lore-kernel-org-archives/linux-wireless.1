Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441309;
	b=LIOIXhdrkft3707LLkPZQHLnmCfuHXSu6O6a0NwsWwRTU31VI+/2POprDMyHYMxIJqsm
	 kuBG7L1L9Ism7zLEJZemTPkiLNi7VbnE3ejigz2MS2ttannCKD0LeJvSP1xXg7YpR7Hc1
	 Z993LgYqzEa6FwiBSiTJesV+SE30TKPbsKDyt8Ldrs1xoGiran4H2x5M0Zd72zwyxH1zX
	 H6w/ICP+dZ1DhGsAH6F1HFIHHAdRSMFkrBYqjbXFtOcqUhp1ihE8V1vAQ31Z5z1fO330H
	 PdLdUlGPEti3Rfs5GwKzwCCqJ7kz0TxLaer9+gxraRLWmtSJqXEqu9ivBwh4c5ePOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
	b=GWgcCmgocFhox1TXK9GJQCWY4/S89ekHDCQTNWou0woImdKT7Poyad0LGHwquvNso+h8
	 jLHxurqViDmIB7XrHCAW9mdmPLtymN9tjhl3TIavFmW6NzFueNaePXmAwLPZji/im+n4t
	 YyK/Ied4Yy/jui0fi6bc+muJlgauy1Vc+cuwun220eNBKpPxB85/j124wXr8mdjK9dNl9
	 PH32AwaMsQIVvR65FCaB4WN5K+84LAI88/V29tgjqGTjEXLDfsPRUkKYflhz1PSAAlCJC
	 oa6GB3jwI/ijFgKsIgQ6fulBGZkakwnb+RMt4DYZ8/JWe04P0v28Fy4QUx1sKHzZ7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fVmopC5A;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67050606B51E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67050606B51E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=fVmopC5A
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5543437a12.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441307; x=1796046107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=fVmopC5Azv7G2zqhIkMkG48pulMJ8nqmwqWT8jou9lPde0nGHp+eKYvDALdohtChZz
         /+jUzZe+/Hjh9+F1OVnCJfjglbpb6Z8YaP7v3VTTkDZdiAGXYCwB2UcCIU+3S5y+B5+6
         bQn5rsWQLq3anrPZ8EWMKlm846VCCGLVTrzRdLZk902bGjNuPmNIg5JF4rx56YB8bemh
         a0wz2+S+paEVRLyGrsdXUNjRPH7VJlWBnuxXxm6CxciV9C5vX0BYJRk9YQb+7LS/kZ5k
         GTxANncZECW4Rde+hpp76PjixjaCIkz6frcjxAkY0Syx0EzfhTmeuxzBfY9ITNoj91X5
         bOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441307; x=1796046107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwwBBeDfE3bOmk9i9h8bqwu9NkavUmtOUddaayOfYs8=;
        b=Cho1LdkNXLeLbaq1SSTJLRL2zKldEhvjP6/75aZ7Qzf/978qdtoiDLrG51jzTR2eP3
         Wj8jPbMmafCtSFZEypQpaW03c2xSMlTg1eRnipRb02//Yo/YWQtgkhcSSSEUxtdl8LAP
         9pFqqfQoxuvb97GClNA7tZNEFcPIjbXFls5BtBDRNk3GHvnmehI3z487qauH8nF9ubyr
         6Ixdb3TIzrJ53T6RjGFmojEyHPq1RlrFRJSqQL9FfrcAtqOzytWiACpgggewydSp/BEI
         dJo0AmTzx6QBizLSzGK8f/b+Rwua6pAVos8Llx/pvBjPpCPw3yGw0Yn6Cq03fXZJKZHA
         6TdA==
X-Forwarded-Encrypted: i=1; AL+hErFhfv6Z76yqVSdMXeV56VLBqKvWnWX6riW+5RL3XaDERMv6V+Uf8tYP+qBan7jfPTOl4Rv0gsKvKxcTNvXIWw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EpHCr9veXjG8kvqyER+sLFvmTcFiiLIkYhxWg0keVGyALUyAb
	6D4gCRuNVdUPn3uHDe48hzXqwjXF5pbDZX1b3lixd2SY5aoFvrlPkm8Z0U2L14O0JA==
X-Gm-Gg: AZFdTZfhpGtbJKi1P9yvpbJS6RyTNCMFsRb3NYhgK4HKD90Abu2qOf6Aivs71pZFUTL
	OdJuym1UNNSrLdfBDXUwL15C5Qrg/shWRtzXB3+VjE0G7iLALobEcIyGYLLHNDwXSTWa9CC8D4K
	RgtinSgWuCcmrbHV9ZXGStSKAckDCMWnSArtOTW2I3+GnGi3wE818BAlO8vr4A0cxjKROBDLJN8
	RKspXbiAeNjJpywEBiVHeeasF5TFnfQGKJtM9sXGHXQr9D7GS6vLUKV2GxXXSdVw2OfSSX/9LOT
	9b/wz6+QxtWwnoatuYx49398AWsz0NTRMD7+Tg58pyr1kv8DLF72LCRGl66nT+NK8+NNj36ljB3
	FTMKwavJyf83yRgSQ0HWLW4WTA+qZ9nvt7khgjaeoKac4yYyjXmogC+neywOrYkNlo6RjOUZhcD
	QTArQ+3/BkKvXsXe9fSECLo/5pT/5btbnflc2/zKkBakDv3wOYP/2NlKkKZ6YaeMccAEqn34UQo
	M80O3EdIuzXQOaFl9mll2+np3Ge8jVonAvg2ykGHCToCOlHr9njaKzXVFBaldnGAhaTt6s4Sa0n
	T+CYSt42538vRu1kS+IZIws2xEvzNfkD1Ca3OieJllyxlXMUxoRf+ETUFfWqqc83oRG7+tA+qvY
	OEPnJwJ/zD5mack+khFttDg67+1pqUbBwsJFWAnB8YWp6Aqu3LSPI+giYprkp0Umd7gNH+ODXeL
	I+eZU1k+rFdWmbfpINIOdU/xsQSFe8RZDDvzXSp2q/w2i+O3QkcFn9wPBGuJbZRwB1e9c3zuQhC
	lUpXwitpSfXrDXiZwNPSVAbqzLeO222+LdHyxYn8QMmyv6cY6AXs5v44TAJ7bB/zirmAFVjMtsa
	+zsBW70vL4n5xy9uafR3Rj2728W9C/7x14vYA+EB4J7eW0AuAjUBDYbXCmbQGKXMBD5xkv97ho8
	9fVJpT8gFuPZKAwrzgJY=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id 4fb4d7f45d1cf-6ba37ea6d00mr8878197a12.33.1795441306709;
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:46 -0800 (PST)
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
Subject: [PATCH ath-next v1 08/10] wifi: ath11k: take the refill buffer lock without a second BH disable
Date: Mon, 23 Nov 2026 14:41:35 +0100
Message-ID: <20261123134137.718575-9-julius@bairaktaris.de>
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

The REO reap and the refill take the buffer table lock of the refill
ring once per frame with spin_lock_bh(), inside their hold of the ring
lock, which they take with spin_lock_bh() and which keeps bottom halves
off for the whole loop. Each unlock then goes through
__local_bh_enable_ip() for nothing: in a profile of bridged uplink at
900 Mbit/s (IPQ8074, one run) the instruction after that call in
ath11k_dp_rxbufs_replenish() takes 0.43 % of all samples and the one in
ath11k_dp_process_rx() 0.13 %, and __local_bh_enable_ip() itself 1.23 %
from all its callers.

Take the table lock with spin_lock() in these two loops and in the
refill's error path, which all run under the ring lock. The other holders
of the table lock still disable bottom halves themselves, and none takes
it from hard interrupt context.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ff09463d829f..dd5bc35581f7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -513,9 +513,10 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 				goto fail_free_skb;
 		}
 
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		buf_id = ath11k_dp_rx_buf_get_id(rx_ring, skb);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
@@ -540,9 +541,9 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 	return req_entries - num_remain;
 
 fail_idr_remove:
-	spin_lock_bh(&rx_ring->bufs_lock);
+	spin_lock(&rx_ring->bufs_lock);
 	ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-	spin_unlock_bh(&rx_ring->bufs_lock);
+	spin_unlock(&rx_ring->bufs_lock);
 fail_dma_unmap:
 	if (!rx_ring->page_pool)
 		dma_unmap_single(ab->dev, paddr, skb->len + skb_tailroom(skb),
@@ -3071,17 +3072,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
-		spin_lock_bh(&rx_ring->bufs_lock);
+		/* bottom halves are off with the ring lock */
+		spin_lock(&rx_ring->bufs_lock);
 		msdu = ath11k_dp_rx_buf_lookup(rx_ring, buf_id);
 		if (unlikely(!msdu)) {
 			ath11k_warn(ab, "frame rx with invalid buf_id %d\n",
 				    buf_id);
-			spin_unlock_bh(&rx_ring->bufs_lock);
+			spin_unlock(&rx_ring->bufs_lock);
 			continue;
 		}
 
 		ath11k_dp_rx_buf_put_id(rx_ring, buf_id);
-		spin_unlock_bh(&rx_ring->bufs_lock);
+		spin_unlock(&rx_ring->bufs_lock);
 
 		rxcb = ATH11K_SKB_RXCB(msdu);
 		ath11k_dp_rx_unmap_buf(ab, msdu, DMA_FROM_DEVICE);
-- 
2.53.0

