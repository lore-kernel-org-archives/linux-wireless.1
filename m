Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886544;
	b=bwWGd61QNeWkwkHDPHlo0wbKroLPUrBLBWhVZe3nE0GsL69R/LoVpNJMTQ/HHOqzRkMj
	 lN9/PDdZI9bBodKeu+c/Isu+rRZiM1n/cUEUoiEwOXI6c+Yq3Ey4P0Rfi/Nyd/gjYH+tJ
	 VXHpUQ9ZmJjw9d7mhWIGyDVnQxR1jGl3mTnlpK7DbJe4uxHtosWWHtxCIEaP6KPSlWHlM
	 RUUgO0rXbSsMUYwj5a4/WkglrLw/gGckg4Zdf3pttsooX7qTa1L9IPO9uoNlWb+IkpkPH
	 hUvtipuYpq0dLArA6oxIEb2kpAcNOGxolWOzNvqKqlSdQN6mSgZu/rFxVq0JvcyfiTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=;
	b=q7HBtc1A5tVJWZt3efE7Z/Sa3txT8Jl1DJS/O/EHzSgtktVJHUimvgiV3S7wXRh25dvs
	 KHlItWEZgRDct/zboj7QtqtmGfrGzd0Laz7znEhVET6T9IY2Eq2e3DsXcgVxcN92rNtFA
	 hxj2pFV0yrSJ/+bCLML4qnD6AHGzOJoohz1bAoF+olf7wubQdp9EU8qU8qqy2n+wNHxmD
	 9JYGDc+QXi65z2EiL6g7Tc6vfMAH4uTQBY4kwcszJtyMdzC/D9FxiV46KqyYgN+KYK1NQ
	 M9AWqvrtp1KzIx2OFiYQg9Rsr5WbqAWWE5yBBgLWdbC8O8fTnMAubnBr7zH55cxdHjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l9a5i+H5;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BAD606A688
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BAD606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l9a5i+H5
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d21051042so531727366b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886542; x=1796491342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=;
        b=l9a5i+H5pbj5J/xNRNLd4y9sXXKtgF0U5Os3zTsBbUTZRQA8nxEM2alA2o821ISN4C
         22m7rSNixXx9pirOGp5liZZv5rUQ1H6mtiGh+6udtpIq+aUg976VaTGHBfOPX7D6h2ew
         ob5uVnHS54qZmokrb7tq4Blb+WMXP+uwL2oCnVSWxouTWrJwINFihmeBaF4fR0YY6Vlm
         hAz752zh4nkyqnG09G+lcdjudO32iCa+elGF9tafkqf9+0JvlwnzBoYfbMecq/HjINC9
         yiemCXszWPuz/ZwhrJA8T5HNL36BYDtCEPM+yi/nhQQ/qO0taCDIJgxUaFrH0kjprWq0
         9VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886542; x=1796491342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=;
        b=reuvrkkWNJd+KfThfJxpKXslSuz3ob4M8CvnmzvvTJIgWuz9hSfHnpr9pwRCFtJdWZ
         LlPaYc3dI91D732eL2H7rL8Se1aCWu5jXk24AYSkVLBC5rDSgYJRhpkRm5qaCg3sRJ+j
         cyuxmUyh+6pd+E2bEC4kbpNYEzlJ5kMOrtfcPowSwfZL81wAVm0Z/J90Fw2iwwcsFH6J
         VIlAgpvU+876YF1ipXMvy2OQNKySCSNw/C8+vJJy/66W66LsoNEgFg56ZqpZnFepQ8o+
         UbSL59GEP52bt9u9QTMIEJJO/Ypnmv+hDivjudYKon1FfwvgVvVyaELK0EUdRMC6yPLw
         r2sQ==
X-Gm-Message-State: APuU4Z89mUnbM/+NV3/kS9kShzMY8x0TlLPslgssZ2AKUKDlSMbVp+T6
	GGequwE228LvgOUm+lFo1mTa0oa9Z7ZC6y06WraBAszdimLKODwraIzcvz1LyOy9Kw==
X-Gm-Gg: AZFdTZenOOlzX+HpR6gxicCeESwkh3KGr5P42QKmtb3GILFk6+VntjLSLjyXxGjjk4F
	OHL1sYYFpwn7/ocRpMjJR/4aH5CiU3NMUSQ6V04MnyTgU0qSLHmK8wziyug+SzLqBBujAaeIk8n
	AwZm7Z+iS8jVu2WGkdL6jE68i1XBy3ld3QbRXs8t4v/r6IURw/Yl/VxiNFTyvdhM6JsRy9jdHDP
	cHG+z6BSN1pzZDEunXIwaUlDlEUoIr5bGrmqgmL49zLCWiAimq2OkQl1vi2qGGZtYyLiMMFTt2y
	mEG+Vlek+7s9NwMhG6JwLqMKYl2luGMBycwnYjB3zI/ieAgWA57X2TkMAiT3mwx5WMDv9+Igp+l
	t3Wwdg8+GD+LJtfT7yJSfpzPym6qLMeB/xTG3xEvzwDrnmyvzEvOaHL8CDIOfEuyCmxQemrGffM
	5EWQUp98w9bVKaQCAEcOCVsPqE6tS4crY6lVjp6ATgBr/42GRNEpQ5iV+RDb+9D8JxMuK2dqr2l
	SzAIEHlCfUibfOwBDhZXgZGPZg3PqUo7jthoLEHipf0S7uMQpAAt729RDQvy+e/GyvQgKet1NUl
	JJ8Bo1L18eHH3dW8oACnz9NO3Iig3L5xl9wIN7obf9xThtBiRNgZRWLD4120mkQz0+4g/alK1kC
	4qxBJZXnPfmw3/+eW2+3Uu6TtGy6j0sauS+gBkArGkq1I3GhHOBihKd7Cp/fZqXTBGWsgKcTogV
	nDsfEirCt8sRAzic7IeCrPibrU8fEmHe7jCM7SH02V/craf/XJs6F1FP/9t/2UA6FqyO9dFn3Uk
	yN5rU0pGNKyOibugkbXCv33WooXYcLzmgn7fp3jKM0HGahteIsezLRiVWBIpMGD+crL0MgxBnxq
	kOFfoQLVJ74I77XblkqhtVtuS1VEnukRdSM=
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c513a5ec7cbmr1741325066b.8.1795886542475;
        Sat, 28 Nov 2026 09:22:22 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 3/6] wifi: ath11k: drop decapped frames with a source other than the station
Date: Sat, 28 Nov 2026 18:22:17 +0100
Message-ID: <20261128172220.922376-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
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

With Ethernet decap (frame_mode=2), ath11k hands mac80211 the Ethernet
source address of a decapped MSDU without comparing it with the address
of the station that sent it. ieee80211_rx_8023() delivers the frame
under that source, and for EAPOL and decrypted group frames
ath11k_dp_rx_h_undecap_eth() writes it into the 802.11 header it
rebuilds. mac80211 compares the source with the station only for the
A-MSDU subframes it deaggregates itself (check_sa in
__ieee80211_rx_h_amsdu()).

On IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460, the firmware passes
the fourth address of a 4-address data frame through as the Ethernet
source, also from a station the AP has not set up for 4-address use. A
station associated to the AP can therefore turn on 4-address mode on
its own side and send frames under any source address, and a bridge on
the AP learns that address on the Wi-Fi port. An ath10k station sent
200 broadcasts with a forged source this way, and all 200 reached the
AP's bridge.

On an AP vdev, drop an Ethernet II frame from a peer that does not use
four addresses when its source is not the peer's address. Frames of a
4-address station keep their path, as do frames on a station vdev,
whose sources are the hosts behind the access point.
ath11k_dp_rx_h_mpdu() looks the peer up under base_lock already; it now
returns an error for such a frame and both callers free it. ath12k
already hands such 4-address frames to mac80211 as 802.11 frames
(ath12k_dp_rx_h_undecap()), and mac80211 drops them on an AP interface.

Found by an LLM review (Claude) of the code; the trigger above was
then reproduced on hardware.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 58 ++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a2c359cc8e92..516856c531a9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2291,13 +2291,47 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
 	return peer;
 }
 
-static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
-				struct sk_buff *msdu,
-				struct hal_rx_desc *rx_desc,
-				struct ieee80211_rx_status *rx_status)
+/*
+ * With Ethernet decap the hardware takes the source address from the frame,
+ * for a four-address frame from address 4, which a station can send although
+ * the access point did not set it up for four addresses, and mac80211's 802.3
+ * path and ath11k_dp_rx_h_undecap_eth() take it as the address of the station.
+ * An access point takes no other source from a station that does not use four
+ * addresses.
+ */
+static bool ath11k_dp_rx_h_eth_sa_valid(struct ath11k_base *ab,
+					struct ath11k_peer *peer,
+					struct hal_rx_desc *rx_desc,
+					struct sk_buff *msdu)
+{
+	struct ath11k_sta *arsta;
+	struct ethhdr *eth;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc) !=
+	    DP_RX_DECAP_TYPE_ETHERNET2_DIX || !peer->sta)
+		return true;
+
+	arsta = ath11k_sta_to_arsta(peer->sta);
+	if (arsta->arvif->vdev_type != WMI_VDEV_TYPE_AP || arsta->use_4addr_set)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->addr);
+}
+
+static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
+			       struct sk_buff *msdu,
+			       struct hal_rx_desc *rx_desc,
+			       struct ieee80211_rx_status *rx_status)
 {
 	bool  fill_crypto_hdr;
 	enum hal_encrypt_type enctype;
+	bool sa_valid = true;
 	bool is_decrypted = false;
 	struct ath11k_skb_rxcb *rxcb;
 	struct ieee80211_hdr *hdr;
@@ -2322,11 +2356,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			enctype = peer->sec_type_grp;
 		else
 			enctype = peer->sec_type;
+		sa_valid = ath11k_dp_rx_h_eth_sa_valid(ar->ab, peer, rx_desc,
+						       msdu);
 	} else {
 		enctype = ath11k_dp_rx_h_mpdu_start_enctype(ar->ab, rx_desc);
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
 
+	if (!sa_valid)
+		return -EINVAL;
+
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rx_desc);
 	err_bitmap = ath11k_dp_rx_h_attn_mpdu_err(rx_attention);
 	if (enctype != HAL_ENCRYPT_TYPE_OPEN && !err_bitmap)
@@ -2360,13 +2399,15 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			       enctype, rx_status, is_decrypted);
 
 	if (!is_decrypted || fill_crypto_hdr)
-		return;
+		return 0;
 
 	if (ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rx_desc) !=
 	    DP_RX_DECAP_TYPE_ETHERNET2_DIX) {
 		hdr = (void *)msdu->data;
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 	}
+
+	return 0;
 }
 
 static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
@@ -2664,7 +2705,9 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
-	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	ret = ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	if (ret)
+		goto free_out;
 
 	rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -4056,7 +4099,8 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
-	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
+	if (ath11k_dp_rx_h_mpdu(ar, msdu, desc, status))
+		return -EINVAL;
 
 	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
 
-- 
2.53.0

