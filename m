Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371106;
	b=d/nFWATYylbqH2DcapjoHQM9ObG7bFrd8g+tKCkBayA6E2K26b8XArmSUAqEKpTsbmrk
	 PTuG2Nruu2ojpc+fX0NjctwZvQW9SrGgq7rmwRSSppecDWFKlKyrMyKQIp8g6b4Svf23p
	 uT2ewjBc8dZe3lDurdKsbJBKCFbYizI1s95lwFqp4O7d7PNP/dBxahQlF52YOjUrVr1Al
	 a/zoS6kqe7DLwzLk0MxUvVUBoz/yT5cRgTUCOIPJqbThYygg5wPIQMhrpy+HwiBS5MVLB
	 79AWK9NV75c9UZmU9EZHwsdQP98/kG2uSWMz/3Omxy7EHF5QMeid2V5o5/Ok+5DNKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=;
	b=A9dQuhdxHtlPRtLMpkWnG1eUD8hyZl86PaJlcEX0Fkg1kXqeDARZBOecxCjg9XDvU6ik
	 5NdLyhSQ3a8cTSPwt5uHQXN2SxHi6/YiTh5rHBMcQ10iefb7p1pdozC3Dd1znTGrMq18N
	 6mJQ2l6WXsOltBypHNyBzBJ+BkQZeXUMMNHEZiC21jNvu2+2LRRA3PhXUmW+pkCEAxeN4
	 UZO+QLNJHdHG9biLF0opbUn/L55RPpK75KXQE0kbCUpLJTkiYuCPIYCqCPjtWibKFKdkS
	 MKJxHRXvOtRRTQby9wvd5OYKVPN7oX69e/Sf3hAvd1bZJssHpdYyocHXR/EfuVJwwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dpWb6Z7x;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614AB606A332
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dpWb6Z7x
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5154989984so254349066b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371105; x=1795975905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=;
        b=dpWb6Z7x0O3luLpFip3n2Xv7A6xU//4IHw9SylRlNviVUdKJeNJf1L+kyjAnmngVI5
         WC9svjqB9AviyNCcMF0Ef1qYsUAqgfM8+7vNFP3AAqWkusAoHVwEWrzYrt+sp0K+PBf9
         2NxnyL/50MQ6vssJ+1VDiTVVmJ4Zbe6dWg1O4t4Fh4BFJUuvI8nGGKTOdDvfNHJ0Np/G
         8I/ZqILWPQDVlwSSl3kV58ssCrN6QTq7d7+4bDfKhWvLNqnHVM5W8/7+C49QBBZsUppl
         X6isDfaPUvyyQzvI2D6zKwBslQW96Sj7Q+ZTPHoak8nSwHcaX/A4pekCT0U7HftD2yre
         o3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371105; x=1795975905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=;
        b=j4K/3fvTiijC9zgRcbu9QAHxOJHhcL7QOsooBPEQXy5p/dZbJbuhbvzZcT9qDKfcFS
         zGAqkO7LdBJram5OeUtl0mgUz3DgZny1Zn53XmxSjuk58pTQcAlZfOKSdwy9u5C5Vl8C
         +1/6Od0+BupnPC/qjNa6k+xuAn0W4qN6l92OeC4mGDwa0iVH06XPlbKRTckcHheC5IYV
         FQiHMeo6D/cgPIrRIVAB9C0SgYktSJ3GSbgqyviOlJpLumkk1kBAMFe20KvlGP9zSI3e
         TEg2+Dr2UDynhm6WSWAgwMTSy4WgI3WvfkA4Pp0gMWAhj3cP6/2KuMSiA/M7Y+i6kMWA
         SiiQ==
X-Gm-Message-State: APuU4Z95N1pU97cah2N3aPE4LTnlf49igI48KidkUVWhAS0BEmhRcWn2
	y1HCmDW/8ZsRRdEJXd8EUZV1d7mAt63p5KlihJ7dvJ8cri8aoExOtX07POj7RUpz5w==
X-Gm-Gg: AZFdTZeY2DO7n33KWAJnNY/Gvkul3yu5Qo7IOyOQCIGeQbbIweAodZ3i7d5aJ1KDczy
	/fPZBDim/1v2y0CFrEJoCrCSftUVtNV3+UxLcC6D2rE9ZXej6EQT2iTWGEFDIzJJ4pX87L0Gjo2
	dOOsXmp5TMOsKLbuM7dHzqdnKf+dQrgtZabnn69Qzne1NbJyyFsr/3zQV30gKm1U4nRH22c68xV
	PDosHsOteKeK7+1FBIKgpDpwccz1lYn5F0ciN5nWir7sLNn+jKGQXYlWPgqda/X+trU0Qvel5Ik
	FPJStXp1GzmHwP8GXI78pdnc814UzVxxDVuLeodTE2Lp7AX7TPg20ydf30g0LqaoWwheNAoE28I
	PkGtK4iQFntrNaGV3UePzga+7Okds0WAy1XQSqswLOnhD4iGbGCVBJ1FdBg388LAGXEY8zK9KNM
	XgNNx1C3ZRX1oVwCP4tiQCWI/GfMJqNN4mphbqqk3FIyx31OLbesy86CMzxFRmDsBpm26ubYkeZ
	wBXg3K+pVFLt+llJs1u7+h/FH32R5BPpxZCBaxY2iW3dBX52XqxOXUHGAfthS6JuMRQCVO4XGAg
	/OurLq6eFlOZXweDO8Tcz9765MT4CAJSFEy2TwGClEnpi5AA05icFCVp27Li03/1UuSQbLWMFhU
	wsB2DkQrdfNRoiJCq7OTCXHuXYJmEr69ZGPK1LhU4ZnOmy+WJmDWmJoeJvYnONSM1+GjMaW1TP3
	96aahUSJ5JkxFXIr2q+zpCYBwNKaA6IlJCDfrGaCWFuQB/ZMNBZplEI7g3slj/NBp/A+hu7ZMRa
	HOW9bJfDKRHSm1Iz1y9t07Tk4eQVA4Tle23AT+p9Q+PgeAEP8k8FLIq7OjwpsHWYesDa94U+w2p
	cvNUDx6FpW1Qyw7UsnYVNmWvA20+2E/AUZ+3OzT1Y0AGddBkJqQQRNtWbwRS/djRYqamYZ2i
X-Received: by 2002:a17:906:3388:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c513a5ec801mr604533666b.14.1795371104720;
        Sun, 22 Nov 2026 10:11:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:44 -0800 (PST)
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
Subject: [PATCH ath-next v6 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Sun, 22 Nov 2026 19:11:37 +0100
Message-ID: <20261122181145.1015729-2-julius@bairaktaris.de>
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

ath11k_dp_tx_free_txbuf(), reached for the HTT REINJ and INSPECT
statuses, frees the frame with dev_kfree_skb_any(), unlike every other
tx completion path in dp_tx.c, and so does ath11k_dp_free() for the
frames in flight when firmware recovery tears the rings down. This leaks
the tx status clone and idr entry mac80211 keeps for a frame whose
socket asked for status, as commit 29d15589f084 ("wifi: ath11k: Cleanup
mac80211 references on failure during tx_complete") fixed on three
sibling paths. With NL80211_EXT_FEATURE_AQL, set by the next patch, it
also keeps the frame's airtime charge, which ieee80211_restart_hw() does
not reset, and an access category at its limit is never scheduled again.

Free the REINJ and INSPECT frame with ieee80211_free_txskb(), and return
the frames in flight to mac80211 in ath11k_core_reconfigure_on_crash()
before ath11k_dp_free(), which also runs at teardown after the radios
are freed. Neither HTT status occurred on the hardware below, and the
recovery path was not exercised; both changes are by inspection.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c | 39 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..34cfdedea6adb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2341,6 +2341,7 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
 
+	ath11k_dp_tx_free_pending(ab);
 	ath11k_dp_free(ab);
 	ath11k_hal_srng_clear(ab);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 083aca8ff355b..0e3b4e836001f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -305,13 +305,50 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	skb_cb = ATH11K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
 
 	ar = ab->pdevs[mac_id].ar;
+	ieee80211_free_txskb(ar->hw, msdu);
+
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }
 
+/**
+ * ath11k_dp_tx_free_pending() - return the frames a crashed firmware holds
+ * @ab: device being recovered
+ *
+ * The radios outlive the firmware restart, and mac80211 keeps the tx status
+ * and the airtime charge of each frame until the driver returns it.
+ */
+void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
+{
+	struct ath11k_skb_cb *skb_cb;
+	struct sk_buff_head pending;
+	struct dp_tx_ring *tx_ring;
+	struct sk_buff *msdu;
+	int i, msdu_id;
+
+	__skb_queue_head_init(&pending);
+
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
+		tx_ring = &ab->dp.tx_ring[i];
+
+		spin_lock_bh(&tx_ring->tx_idr_lock);
+		idr_for_each_entry(&tx_ring->txbuf_idr, msdu, msdu_id) {
+			idr_remove(&tx_ring->txbuf_idr, msdu_id);
+			__skb_queue_tail(&pending, msdu);
+		}
+		spin_unlock_bh(&tx_ring->tx_idr_lock);
+	}
+
+	while ((msdu = __skb_dequeue(&pending))) {
+		skb_cb = ATH11K_SKB_CB(msdu);
+		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
+				 DMA_TO_DEVICE);
+		ieee80211_free_txskb(skb_cb->ar->hw, msdu);
+	}
+}
+
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e012..9a26de411e83a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,7 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
 void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
 			      struct ath11k_hal_reo_cmd *cmd,
-- 
2.53.0

