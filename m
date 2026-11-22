Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371109;
	b=Ep1f4ELpwhxhyXqWELW5Y6jb5256aDk/hF82qZpErCljK0sn4rOMkFahKfb+1LnsUDmo
	 /G62l9i6jJ6t1/siVIuoawvT9ODYR0Mkkyfe9NfESMttV3Rhuni4HOko6Spqfnni2DLAU
	 gW6InUCl09CmBnemvPNPo7NSTwHR3FVsxY+sM5rnX3XqmKNOLquShyAOBnMmCJ1ujWIxg
	 9AacxoytF7OcRCkbPw4+rtC/anbkrFMYyAxtfXkmVkvRu+CKi0P1RucbBfGVa7c7uAhyB
	 gBAKJzjmHuj3J/F2yHWPJ93i3oPWAJr9eoI8gDc5YzWQGGRaT3+LeIj9N23UCO0EPHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
	b=kNqASmxRQ+eUZpK075ufK+Z6Pjk0y75M9FAWpUclYVD27GPHyNE3i2zwRwPKD5t9DYS6
	 UDyV0VDp5ugBSfmzppOhybsHlF2U/xAqTUi16DXDOO7wM21098BZ+DMQbQJjhqdaNasCF
	 nBvHQz10IaVDiyAS1dLDBlBBol+vaBVwZQAZsNaybfPtTNfqZxAxwXPT0TQxXACY40foz
	 Iu8JLP1oWy81Iv/LuYdf/M+xf0eInJmIFiFGFMwUSWDy/6sDAugpd0sqP+9mjEiFc+ktE
	 a9usfR6wTPN2P5/q/9rknKXcg0TCx/D6CDiTwiOqhMmBuuhmglPtyLtTN37qZpV8zCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W3S7r0ZL;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573A606A699
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6573A606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W3S7r0ZL
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50a4a2132cso355403166b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371108; x=1795975908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=W3S7r0ZL9dqoJ9GdxjtfUkgrLFyhI2d1ijPq4lFDYz7vE7lZTPG9E0eXWmbK0oBR7D
         lt/KFbJRtDxGFk9IY3HKWdf+NVvro+4CK4ZOjjL0CHMzOI2vfHdpMV5kU/2U2lBcmY5t
         /09rPEu84COQxAJh+JSzZUo9DHxtFZGPyFJcwASghsnA9wX7lOzcjhIAe2W83z81fZDM
         ZsObyz5jhynHuNQFNQQKVK2ys46iNT+FHNcf5tdMHto4LYNPb48P2ArO/TMfrZSUSOEI
         hDSnlBcudvMpGQOGQKHgrpKS5hGVB9dhTE3CRAypSre3Dq+BLAXhgnL3Yedsma4P0VYh
         U21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371108; x=1795975908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHmt/1DGc6z6bOlU+pcZZ2IuvF/j7mYPG2xCczPpUEo=;
        b=NBgudyl2HfDSlRLHls/8rMQObx2dFMleXuAr1OHE3MNHY6/w0uehrLisi+MDBJkfP8
         CXRqTmbX76Q0W7EDl4p85jSptdqG8bPRcOnDoRL3nQw6CA8DmjeESF3zS6DJsYTwmIMh
         p72iaONCWhDI+E4BjhI2Y9ezKJliBEPYVAK2odRo+gD0AsbNKtkXMpkK+5e0U9SwvjvV
         qaFJQTGTjMXybaAD5cqspEf4GDRVe4ePEGbMFxnkYEAlxIVW2eYlxAeTzKihF6k8KNzx
         j1jN4S3jg0xuS5BOzDDmvHrbLd80O6feJUcwVt4cw6ODkw/k7cNhWkwOk+nuYpDQVs6a
         fpkA==
X-Gm-Message-State: APuU4Z/zpYHzLWc7IU4Cf/tVhJhv6bgjVBrl0ouh8/pPcOYsOgplHesQ
	VsbzR0G/jX/Bh/nA++8HxB7sbdFEWVSSaHf3k/QX6XnAbgF9wj1PG29tRdMryjOZaw==
X-Gm-Gg: AZFdTZdWDypFl96Oe4o+Akb0L3DZU6du/qUqGts/6qgmi8CrTLv9rhhYZWe5mrqvgrr
	7vytt35SJU6fh6YyBIAedZK54FqmMR/yPgao0YY4z6y9XdRqLRP1bJ5dCbuivnxor/ULQ15dVsl
	pZ5t9//q/HZWtXkVZCFprn7/l+J6gUIgcFcmbnp1h9jX/yTQtRYh2TgzOPenRW/I+/rttK2A1wa
	WFw79CnSbk7Tyn46wNx7r7bUoyPb1OvJqgWHDZ9DolKulet6tZJPWqPhe1VxJZz6RQbCwypSxhi
	1Vpqg3fWvotVvWEANgX3AE/gkcEtlOzWHVQQwDmB3Qrh9mDr+mFnmuQLBniodJfnRQpJaiCDMjD
	0MoRPSbWcYdhgIwDDiu43GvyR8hUMtjU3+XSlohi0eaUH9AB8WLv7NmoJU0VLdiJiYQ++iStQjt
	GWlGpceBgwRZBbFbfzgETjQEW5oQDuUcM5UxCon2SsMXfr/UmBq56m4ieM+LcfQUKABVq7O9roF
	qQZ+yC+TW8uu6IUkMQpt1OxE8PMfch0QEkj+fRe5gws5jIb/naN3CFUSKYPWC/gbX9CRsZW+Zzy
	Qdcb5QkuntE0ekPwNQ0Eaye03ainNSGAUA2Oc7n9QbAVaDg/ytkWe/HDTFrbBUtKJZw834DYGnT
	i7kBAd7NgbD6xl4Owaf5OgeFdZvV/13dNPYlorERX77PSvb1+sPmwy+14aPZQe3f+KROg0K+7HL
	45Mtwn+jU8eNgoI9YB9osVAmV309E8ccstnhAubEstZQNhv7hULt3HbiJ0WCmn2XV4x4VOieqZd
	Y7AnQzkX7+O/49kQbtQRVg3uxshOvDPWvC82/fqEn7/t0Vx1U7kJJK+UudSTEYXPKKKcRGxU8jX
	wZJn9VvQKGUCve72TES+cgnVvibgfwSWLhlJE/vt+Ukoh6d3ScFwmvrapnUXAd2M5SuOSbsV
X-Received: by 2002:a17:907:ea8e:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c513aadb22dmr721786766b.22.1795371107843;
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:47 -0800 (PST)
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
Subject: [PATCH ath-next v6 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Sun, 22 Nov 2026 19:11:41 +0100
Message-ID: <20261122181145.1015729-6-julius@bairaktaris.de>
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

The wake_tx_queue handler serves only the txq mac80211 passes it, so
there is no deficit round robin between stations. Run the round in the
driver: walk the access category's active txqs with
ieee80211_next_txq() and drain each through the TCL ring check until the
airtime queue limit binds or the queue empties. A full ring ends the
round, since all txqs of a round share it. Each round holds a
per-category lock, as in ath10k, because mac80211 forbids concurrent
rounds on one category and the next patch also starts rounds from tx
completion. The design was proposed for ath11k in [1].

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..40895d276de5f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -709,6 +709,11 @@ struct ath11k {
 	 */
 	spinlock_t data_lock;
 
+	/* serialises one scheduling round per access category against the
+	 * other contexts that drive it
+	 */
+	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index eca16a151d068..226e1417ffe74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10078,13 +10078,12 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
-					struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
 		.sta = txq->sta,
 	};
-	struct ath11k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
@@ -10097,6 +10096,10 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
 	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
+	 * selection ends where that limit binds or the queue empties. A full
+	 * TCL ring ends the whole round.
+	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
@@ -10110,7 +10113,7 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		if (num_free == 0) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			break;
+			return -ENOSPC;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,6 +10126,34 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
 	}
+
+	return 0;
+}
+
+static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
+{
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_txq *txq;
+
+	spin_lock_bh(&ar->txq_lock[ac]);
+
+	ieee80211_txq_schedule_start(hw, ac);
+	while ((txq = ieee80211_next_txq(hw, ac))) {
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
+		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
+	}
+	ieee80211_txq_schedule_end(hw, ac);
+
+	spin_unlock_bh(&ar->txq_lock[ac]);
+}
+
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
 static const struct ieee80211_ops ath11k_ops = {
@@ -10817,7 +10848,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10851,6 +10882,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
+
+		for (j = 0; j < IEEE80211_NUM_ACS; j++)
+			spin_lock_init(&ar->txq_lock[j]);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0

