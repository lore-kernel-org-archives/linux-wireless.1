Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371112;
	b=uJQvb5Q+62qNr8jBJrx24OMRxongb+O3NbW3FIGAUdD9Ke352sefiKnXeTfZiozXJKPV
	 VeBPdKjqousCV9EEBYsq4vPq6tYS5IwjHXpbe0WL1GfU0oloHhUb+S1ewTUXyMiL4Nc+x
	 IVI0pou4G+CpGCY1yvUaWwIoIvaau1W3vACZg78VWic2v2/bnioq4OmGhGLJi96Wb4RPC
	 Jkda2cpLI5f6Fm+3M9FaicmRF1UO7k789+ckbN4lmz9LUu5QnE2wTGNk9Rbn8IPjV0xQM
	 DXL8g+BxF9n5qWoHcRnwGvdluRD0Vk38CI1yRYhp2aAWrgXlbToIHyq8jNjZLZhqCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
	b=AVX2ycujKYOsc2vIGK15bp1+mM7XfRzzK7vnJrZIm++4MTfnRNOxbcTTbv+H1eNjUiat
	 XYBfbopZyDZR5ocUEDMqLkbM/e5ai7BoJKU1virWJwsBPLE0i/ek3VgTc26if1YRlMmic
	 Teo04G8reJ+eMXBClNPYmE4tiQ9tKwH9lGpasjQJJKCe4Bh1J79Q8Wm/iaSo5k3ISHo35
	 qmKgROwtAWtxtVo1gcXaOH71nwyesEQxD/g1uhri49cRlcxdzz0EUN/ivbZ7uZFpx2dhf
	 a1jStUUbpX4W/4uX/ntv+BzkP3ylO1z30M6MQo/c9iyW6BgDqpKpwlGBPYPy1zK++Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SuKdxpk8;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198C60A3807
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9198C60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SuKdxpk8
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so427852766b.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371111; x=1795975911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=SuKdxpk8iNU8lt/p8Fs3RXd65JfVjS9b9Ti2KNsZAgMFiraZjOhStI0HYWR78WY5Kn
         mgQ85g3qhL2o4D7yiSF++ZEpx8oL9Wk6c8luhaJOhMvQlCzyllDWhnQp/miTTVtgXYSn
         J7T280wsKtXhlet3pI1okGsYUcYmY0SGU73lcdMglcCFhHnOhu2K7aQWsyt56k7YndCh
         lk5YQgEqytem4CTCtZxRao0TI35myyOj7jqNV+n96YS7HUtRVBC1P+3GohDfBpunANX6
         65c6Vsu4gIJsCZTMuoR5AR7SBOUfvqstUTfW6Bng9LfZh+XmTy7uCdc27fgjscHq9ar3
         50kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371111; x=1795975911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=kr15gRZ8XhI/gvCXZBNPl7snmUYl++sPLm2sFhCEHP0uzP+qQpVqU0Wyct3IqB4eCP
         mTC3rwLz5YkKe7Pp7r+QaAKL6gK5DDzE/LHrwFVcbLfVV+UbarXt87HRymd3m3+wfjt7
         JLVlE8XpTm3HSKSW7V8FqgMbMbqmZcqTc3/ZiNiq9d/XDxDqM/UdVkMphQ+pmTCFnxcU
         MHF56i2Z2NMoJmh49gcV9kD9Sfy5J6k5tWX1qG5ZWGeWFzebF8alHzpowCkWUdrtXI78
         KmptCLhp24nEus3cHgKH7EyqOGG3DYcU7LkLJY1Cs7ICzlKEONVgp1bBHgCf+2AP7Dxn
         DQyg==
X-Gm-Message-State: APuU4Z+Sn9I9pt8YV7nJCs3L0D+pYivScAgYF/ImkiXGERqqTr4+0hN1
	7QWwshzq/0CBs/9xZ+Bjxgij/94CZfRzxpSFf0Xv3AlSuSEMRQ+d5mP6+SeTtikGig==
X-Gm-Gg: AZFdTZebIRmNqVQ6AT0ReYIJk4Jzu9evPUa6BkKUEdsG+GE3XWBXuTe3rt47URRXYwi
	XhTaOErUrZ80hD4rT4DF98XT+iHHgcmwdW/kMc8+S2OXwzUUPS7gIh3mrfyadE6mq1ffnGRGMAM
	mpDDFW2Y72Qm/d2SraxF3vQI1o0eCSabK1Tb/iq3hdIP0JSoam7C4FX1kxO1lFy/VRk1QNb7bIg
	3+yAJdSDZ1N9EKdLstwg67x0RsQPOj6kCyqEfX4GU8j/KTCiqMPwauueD/AzAGErDDyLcz27wps
	F8EF02fzCWcBrPEYwbkqt7fzZG1MxLi92InaGfu5YMsGOm9wHOQrNaLHAwl/iexU5Febj5Ubg+u
	rNu22KnEs5gDId2ErtAXggFepIoUf6MCcQYy9iLiNP13OfaA9dg1EfnglegLtiOwi94DJP/Bkwg
	EypV2szdxgujV0jQK1XK9Oxbf/Wa5AYz2XYvIlRbwuYVoQf/OWhvz7AkAM7Q+PK9ZP35mIdiMi+
	MlJQdxQPHuvnzuMawaMcoy1WhacTXKcX9VTWuNKWAiMFDw6LFDH8u5o5MjAE4yKX9rpvrQ8SpYs
	RCco53kS5VrdFRCN2DrUYlOWJsHg7MHuA0EhjUA0XsV1Yf3UbKcfn/4XvtO6oXRISsIh9uO4Zws
	dQByNuYxl09cEhrMTtk4b5nYMgwz9QU+NN+dgKTy1HwdypRaPM0JvNXNo5n6fksxkV/J2iZ5YB/
	ByBCIuAhgsvpyTtlO/UbnLse81hwtqGgyaLn2HqjmS5sSoreHCTjetE2/X+HXgZATVa1plOMHms
	A83qAO1P2WVX4e+BYF3DooUphsb2v9GyTqWFlvdnHE6BiFPvrBfbpgcB1S2Ek+Sd5HSTVo5+5g6
	zantfuHAn37E0uOUe9BvmZhJZLZZf172iynupnnldB2W5FF+pTl5KDY8NMp/oNwJjSWL+aY5
X-Received: by 2002:a17:906:9fd0:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c513a52b574mr686313966b.3.1795371111072;
        Sun, 22 Nov 2026 10:11:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:50 -0800 (PST)
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
Subject: [PATCH ath-next v6 9/9] wifi: ath11k: budget the tx completion handler
Date: Sun, 22 Nov 2026 19:11:45 +0100
Message-ID: <20261122181145.1015729-10-julius@bairaktaris.de>
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

ath11k_dp_tx_completion_handler() reaps the whole release ring, and
ath11k_dp_service_srng() charges none of it against the NAPI budget,
unlike the receive handlers. Since the handler now ends in a scheduling
round, a full ring gets one round for all of it. Reap at most the budget
per poll and return the count, so a round runs once per budget of
completions; NAPI polls again at once for the rest.

BE aql_txq_limit 500/1000 us, three interleaved runs per arm: both arms
reach 94.4 to 94.8 Mbit/s, and the sender retransmits 4, 6 and 8
segments with this patch against 8, 644 and 296 without.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 615384a4bb75e..833feb981cfc0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -783,8 +783,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
-		    ab->hw_params.ring_mask->tx[grp_id])
-			ath11k_dp_tx_completion_handler(ab, i);
+		    ab->hw_params.ring_mask->tx[grp_id]) {
+			work_done =
+				ath11k_dp_tx_completion_handler(ab, i, budget);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 1c4cb98f89292..5c3ddc8aad41b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -765,7 +765,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -775,6 +776,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -803,10 +805,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (done < budget &&
+	       ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
+		done++;
 		tx_ring->tx_status_tail =
 			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
@@ -864,6 +869,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index f82df5d2f6033..760251c68b933 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,7 +22,8 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
-- 
2.53.0

