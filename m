Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381530;
	b=166ddHvxwHxVcaojPOjcqNeo4UwglX83t4BebROYzrHdu11lm+U37J25LWl5rTxfU6ba
	 NlZLy4aRLhrP0HPKzlxvo9KRz6JycppWcgbmpttBCv03qZMFsY/Igg5lpW9fuUCC0VAma
	 MjpqId4ZQigbwHxD5YZ8HklNyDBULa7gG7JeLU038HjPQUnWCMB4Eh+wu6e2bKGv2RME5
	 0IGtBH21PerRU2+sztOre2Q455HX4pHnI7YxJH4lAO9M2UpMPadMbfqr8tbwOAEEGeiB5
	 FG2G8MIS1i0D46rWC83cgIQiPUm0EFQPkVDwjKhcLMe8aRfx3ZUrD/8SwR7ejFSZnhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
	b=rA3DkPdQyAVZZ7xiwx1gdfFchBXqDXBaivs8PY8evQZp8ZyXh8iVcwTFvq2zSaq0KiIh
	 tnpcvjFSAnlZZOsiFwifGXgoDoUt9N5mlNh3VsFu6ejX08NGAgmna7grgsx5rfbhsErjg
	 FCk0i0HumULGsHstxavVH0J24ULyxNSwI0VKUNaxKoBKhoP4TRF2VOkRkq5ceqWCnet6g
	 upO9HqaIlrRD88zwyu94eKKFXyurl02OSkci91frMInlKkAkzJdzRo9Dd3XdHS0ZWQIws
	 mdLJyiYzFhs2P2alCRuC1FLQUaHxbFcx3ShmCIKDXhMQCyHHrinLxUUtxBBYY7zkRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="ef/YRhQe";
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20137606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20137606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ef/YRhQe
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso370141566b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381528; x=1795986328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=ef/YRhQe4fH6qtohzizg3tjYWYtnyYk9jYtGYBtDz7R1uZ1XXw+dgCyZxvBEnGTENt
         mIJIPyZMcPa3efgAAZApuXgZH0+L6aQeQ78bmBNLGKOTm2FOQfQq+5orq6G2EiSDgH64
         mUwXD2RY/lAvvEixd6wYgk/JO7QUfOJyuEbihCg00xSXmL1g2WmWpvzV9Bp5M9OdYGy6
         L68FltfbK4hRyqCZ5fFkb5I1aYIGrEfbu1OiLYhrzndabk80Ss7GIaonrmjYfG5NUkYl
         1id1rteV7xI/jPqX9A2cc03FgYzeP3fObTomgkfseVNTVD6ufcnn4q9cEAnL8D7H6/3F
         rbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381528; x=1795986328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=f6BBdzvVelioIpw4SXnjsohwTGUsiSKfKxxVSgMZY0dx1Z9+IndLUV6fQZB0PZfess
         tZuBf5bWNU/lFmWUQIkQ4DIdMUnArWxM5YlnDMgEWSVzSBIya/O//wf2lvD7dQu1YTom
         1c9zR/WBHrqh6Beal0lkvWcj6z2FGL5rR2SZLeYwaaEM3NGWEIcpz9qD4MG5mU4vT8eL
         yJFkGUJG6brJvoTkaGA1bizR0SCLYxjIUfC45poD0CVn/TvfqmD58F+fCN6yxOWfz1lK
         hDvXAKn/0Kn20b+oZRDIeSaxAZ921+cpruH94QtyF4AmYVneZfGEz5rrD0Fik3Izzchx
         eCUw==
X-Gm-Message-State: APuU4Z/hxGP2h5EkLPe+7pzEdsfm8c+uvv52VaYgo2nTerVzU08f8CcR
	Xp0QOcobydZRDWI7KOPJZ8I0H777ffMbQADdTUbSi9yv1JzZSnWt6pq1H7GRZ9xQsg==
X-Gm-Gg: AZFdTZfeMy57yBqMGPBe7WalG3vzq2R1c+GZxZ24boUh87js7ES2rdQ5RHQY88gwqyE
	q4VLA+agCURWwMt64qwn9LBvj6UmBO+jSR6EP6tZ624QPEg8SxvRn0QAx8I+0o5v3AWH+BLQoP6
	fNu0HB8cKQdb873qrw/9ydmODLifxai/H5YFv22oV/u1LkS4+yIJpCqrrab1BB+7HC11L+bNOpY
	XUuc/QcouRBUl7NKwTff3IW3GlX/puVNn5YR+eztgkuGB4t1FoScN1CzQSa7AAAlOL8hli+w6IL
	G53cX16q2zWyOpNoh6miWJJxuBNkRIXrPDiMRJ5BbwHmk/upIiSEYFjBYjAuX5QzsHmPEkmSg44
	AF7m26LndkI2WF/ziXKukKLwNezHdQcG43JOZg+oTwYFAWSPKKA0j4bU1vS8PYe2j/WRmo8wkwK
	kNF+W+lV7d38P4fSVaaoLAytfxFmAAt729LR4eDyotNdo85tpWn2mrvVZLxYXiyLDXsW1CCr3zr
	UIlfvLf/iUh/S+NlVUf7Qdc7Y/7lQ/HE55ij1yvRVRO0+qwbLm9YNSpugiI0THYZv1q6I17thZ1
	reoicMssPFdanamxaalj89DPx6Jet9mbs3IItf9EL1gJF5TBj94pMF36L6g3LQaCThoyHLe0AZ+
	g5/XtNY1jL4u6vVkYpMH4SlvNf13/59OnLseK+h/IoVin1kqHNb5c8SjYh0tt7RxpMLAAx9UNFe
	qEKZbvKJgsDSs3/sCPfLrGTNr89AuAXdMsIwYEbxgWG6nxaNbCofTUdk9ed4FNv+S2zW+kvWBC+
	NjVFwSM39PFnwWHYuaAOr1+C126d4aJkVRdlVXJNsnoOnqDn9oCx/OkE9LBV3oLcr6X0muVEd81
	kV2a6LnggEJIcFoJ3X1Q+sV0bDsaws2H1kyrZDjAa0U/UdxZWVlRzk4abhRjI0k6rnCq7M1baA=
	=
X-Received: by 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr509115366b.1.1795381528414;
        Sun, 22 Nov 2026 13:05:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:27 -0800 (PST)
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
Subject: [PATCH ath-next 3/6] wifi: ath11k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:05:22 +0100
Message-ID: <20261122210525.2076058-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
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

Found by reading the code with an AI review tool; the trigger above was
then reproduced on hardware.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 58 ++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 93425ee02774..f8c08b8b6b08 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2253,13 +2253,47 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
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
@@ -2284,11 +2318,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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
@@ -2322,13 +2361,15 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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
@@ -2626,7 +2667,9 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
-	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	ret = ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	if (ret)
+		goto free_out;
 
 	rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -4018,7 +4061,8 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
-	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
+	if (ath11k_dp_rx_h_mpdu(ar, msdu, desc, status))
+		return -EINVAL;
 
 	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
 
-- 
2.53.0

