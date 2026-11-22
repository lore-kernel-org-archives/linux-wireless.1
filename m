Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371110;
	b=I6+l9n1PEwUjQUvvdxrNTVzGEihQTmYlnaG7TLM51dIuSpjdr0cMd7z5m3CF22QVbzxA
	 Uzz0sxRnpE7saDvFJEbKPAXY7wAXuIavy+TEdUq1R/Vhs90FHh16bAGgNz6wEPPA8Qawc
	 b3hRiGrNq8udNgfElHex4JROlhG/qidwSadYCoDr2vrZl2j7myrJc0pro0pH6LIo+o+oI
	 iM+DAWjv17Nd66pniHWzHryyDOr87D8y+YhPQLso9x/EA4O4+eI5aRV35Enb+KxCfuIiz
	 tXurtSifeje3qthPIEM5YYqIB8yYX4sXZ666nYRuaZeJP2zYRyAhJHOtPwo2q5+92QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
	b=B/iJZgKRtM7LdIv1ni55GHTVAwfWGr+jVjHsS+88QakGP5bOG4/a0HEEstdHasAXNgaN
	 JmQTiSFWQUl3CF+kKGA/dKyvLYHRQm60JTHtRQhJUH/damFWy0yVNy1CXCM+VZeJtImNG
	 0PLN7B48pZpTFBpFCveIQpEx/dWT0MUfMgBkTfR0R43jUiC+1SawA2FXOBJ4WxFVgbM/B
	 EL9h5bZ0hcsjifgU/R23r6UGCrNuKqIVIi5PER6kgjyDriCESBt0ehUX6KKxggSWSrMsc
	 Iai+fvunbWVC+evjip4jQOO+f5C1ysl94SO+37ERxtxWjn3BmxPfT+MBBClff5NasGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=P2BF8BbE;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B726606A6A9
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B726606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=P2BF8BbE
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c515369b627so203019366b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=P2BF8BbEr4Fus4fFKk+CbC5C0+w4m9qkCX7anjEBqS9boBEmAE1ITiNiUqKA43igVC
         4HMQ3Uny2BwhtSyZCqhz5um6WdbvZMbvzc+ZeFR6Zv2uLHcJhZn50FsR79OQrMzDUuv4
         yQxovLO/dptSaN354PiEJQe6FUNBQeSA1eKUYpUAayh+tkZEgfS6TD8EZTCGwvhHyqI8
         DBXzGX1dC0RI1P9Su8UnpAGIVRxvlQBvBiNckhHWWAo4SvGhFtIEHWSkupgQkCzkbxA2
         HW9JWRcO+eWBzYaAe+W3msrknu0NF//S9jd4ZMCMifsrm/tb8wDZt1/JUb8unCjsq2/k
         dhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=qi74MTy0Q+YalqHDGl9fZbvqXJjZlFm0YPu5Z8Rc+bsxd8gusgqAfaLAEPDA+Tm9mG
         OSjyrfymeMW+rDi8g0k0R4+Zlhvnv72tz1gJeGD0uhBGBYz5AY3hELuUk+Hf23Inf1Z2
         IYkzEXaRyreaa0NycJuu0c09tx8Zy1sImzG8mAyeyVfxNSRVvk2eWJbUNYWEsdQidvM3
         Pn1YtqXQ6BWNqCfSAmYGeLBxVz1E6ivAg1bcqWRh6PBEYhQw7RcWA+dr8i5xfrLcqP5m
         DnUht7fvk4MZeyUEy5lLUHrA9NPaU2HHgoubIp/XMyt+mkdldzY0raqloDtk54NMgXpo
         ZzrA==
X-Gm-Message-State: APuU4Z/GX38BZtpay8LXNVuxVwIQDZ1FDShLL/le4TqrvthOTg98jCzE
	KmKDN3DPi5xkrHfZ5vreHRjltREYwTNhFEG0t/PW3FZTEIRFRlsNoAJwnZcrtHo89g==
X-Gm-Gg: AZFdTZc1MC/V1/mTNuE4kboIoeWjMGFjjEQrtm+AaQn+0zDoTkXh+eeL7driOWIVBE4
	gPSy82JIdzqW2hZ4C2DVZM3wxMgI9tVQjHHf/r6N8lokDHxtBKIBsFkJifBFZPez0crtKbSBdqp
	4UklxspASYYmMQ0mfqLMUc+1OQQBQGgaN4QmQkOi5R9VBpeYfc/wwt1GSFR6R7tTFQUslq2hJr/
	5KUjp7Lcd5Qf6Ryu7DLaddSpThHPQratREypuOi4qhisNDVN9yrYBxCScW30XeFUHa2kwoOB2cg
	dJlajrVFBO3GMUFcS9rrS5EliHYDidJNgfLpf5G3fON/kEaR7+fafhgp0zm4F+3k0zj2ZVgFdpA
	BISw2JXnRWHOCXuxtYHMeyEiv05ypAa9mNCyK79lmJPMbNQeKtmxFWUCYrI1CzVQv3DSGmsmrTK
	dRS4ZXrgULp7gPB6qq3khuQZ9u8EOuV2CTAaHqYDLWzDe/aJDOTxunfV6hfgL9ypAqs9AjSRNI/
	t1cztjzRQkZN46MuFIdcPNIxHpLG9v91oW7IzWOC4Dxw+P5CEDqGmnpYVEZ9HN1CyY7NeSS4g7j
	0/cJR0ByrwNNlidlNsM7/At5mQcrp1wY/wHV0LkKyTDjeuNW9buTS/FE3/uYAE9qC/+1qaCQ2I9
	KrCtaTtLNTi9Uj8WVhT9xrykQRYQhqLQCVcPDLuUSrp2K+A+1s34m3Qx1yh7v6EQjXe6Zwz4BDC
	2KChD6OyItjUQJ8Tx0kLifVPqFzw5asczmLj/oW5STDbJyeTbRK/IjiBFYuLJaTCcWNpbW5LGFH
	pQFSWUEzDUIRAFtJCPCEi8rReBCRWq9RpeSJehEfIrNMEB2I7j3ph29cbd+z5UinZq7/PT+QykA
	yZQClcnEujxs2QmuBWm+Bah9PioDg6nJaQ7yzdB+4DiKOOxAYjcHLOmXMTuzvJixM6wcS6tg
X-Received: by 2002:a17:906:3814:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c513ab497afmr548454966b.32.1795371108676;
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Sun, 22 Nov 2026 19:11:42 +0100
Message-ID: <20261122181145.1015729-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
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

A station at its airtime queue limit gets airtime back only when the
hardware completes its frames, but ath11k starts a round only from
wake_tx_queue, so the backlog waits for the next frame from the stack.
Start a round for each access category, taken from the frame's queue
mapping, that a reaped completion belonged to, whether the hardware or
the firmware released the frame.

TCP download from a wired host to one 1x1 VHT80 station, BE
aql_txq_limit 500/1000 us, 20 s, three interleaved runs per arm, sender
RTT:

                    Mbit/s              RTT mean ms   RTT max ms
  with this patch   94.5, 94.4, 94.6    68, 62, 67    126, 135, 121
  without           74.0, 78.5, 72.4    28, 27, 27     55,  40,  40

Without it the link idles between arrivals, which also lowers its RTT.
At the default limits both arms reach 88 to 95 Mbit/s.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 33 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  7 ++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 081e79d3759c5..0cdc0493f10d2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -286,7 +286,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    unsigned long *push)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -307,6 +308,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ar = ab->pdevs[mac_id].ar;
+	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -352,7 +355,8 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath11k_dp_htt_wbm_tx_status *ts)
+				 struct ath11k_dp_htt_wbm_tx_status *ts,
+				 unsigned long *push)
 {
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
@@ -375,6 +379,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	__set_bit(ar->pdev_idx * IEEE80211_NUM_ACS +
+		  skb_get_queue_mapping(msdu), push);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -426,7 +432,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 static void
 ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 				     void *desc, u8 mac_id,
-				     u32 msdu_id, struct dp_tx_ring *tx_ring)
+				     u32 msdu_id, struct dp_tx_ring *tx_ring,
+				     unsigned long *push)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {};
@@ -451,12 +458,12 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring, push);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -736,9 +743,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -782,7 +790,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			ath11k_dp_tx_process_htt_tx_complete(ab,
 							     (void *)tx_status,
 							     mac_id, msdu_id,
-							     tx_ring);
+							     tx_ring, &push);
 			continue;
 		}
 
@@ -798,12 +806,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station in that access category is waiting
+	 * on. The arrivals that would otherwise start a round are themselves
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
+		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
+					   i % IEEE80211_NUM_ACS);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 226e1417ffe74..4527ab6977d04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10156,6 +10156,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..b78a357b5472e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0

