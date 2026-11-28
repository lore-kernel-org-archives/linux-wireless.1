Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886541;
	b=IuCET1TZCOAKU//oLYA2M9Xo2CFbUe+3z71UD8u7fZiVjL5R4WioJjH/T+dDx9SLyHU2
	 xpq2d6pp9c+7OAuY4zXRRskmSAj2SGl/XZi5r1zClDjy7AGoXIB3Xv2RbNB++Ir5KHuT6
	 YGOkYCFESJseileS6aG1XDSVMBPQth78JOeaEiQsMKb7u3eDqVZGw3MvQ2O3sWT6rvsOu
	 PiEnUFvqmrBG7gx1vBk6jQ2EEFPugce8v7ww032ejVf05SUWW57dL0ridfQ3T45Evz14/
	 TCr1h24Go7fK/uk8oOodNJM/Ar6x3spbIt5VR1HozVBeb4oRh5B7CWAkB4NavdyORUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=;
	b=Rhfq8X2aWViN3gWUe8NjaBKOp5n8jqohj1Fc+bMxGd1N2A27qmDTyh6n9WOiOEoOxrQs
	 ERUNT49DEDKVZeXIJm+YN0VmqjwBsFsvcsdDc1eicg3Zsb43jBZfMELR8VnQEWE6Xoe5C
	 /+Q8HaqO9wSle+nTg3MBD07TuEAhsijGVA2/LShXYImBsRyV3w8/1f8+rjWZvw9Y/g5WE
	 046aMDFloHViNed7TvmVwIN/jlG1KoW98+pBc6OZqRuhs06eM+Y1Bmixg3vwSEt+srFdH
	 m8JotSsuAhYPnhOMkwPZvhjBNr8zK7f74ctQV95UpLSkzl70Q35uXiCMZvH1UKIpXNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lITEmCh8;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C76606A32C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C76606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lITEmCh8
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1453007466b.2
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886539; x=1796491339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=;
        b=lITEmCh8pHHnC+eIkwULu5N652sB/ojCMaNJc6Q8+hKbgaAZwBsRYcjKqVN3+9Ykax
         CBcGbil2X1939gHAc++aqcBLbvFzyhlwPDpdmcLfXrtJqcCdAbq7kpAv7iJfb+rhkkks
         5U9/MfLbwwAZPHYe0HdFXRVSPw3YEjWUfQztsTaRx9Z6wwNPrheySGjQnPrBK93wapJl
         dHaXaqgXeq9KOck6kDNDheDraxlFly4HywNfb91KbXItDYJ4tNY/bMBJdQKWgr8ccT5l
         u217iEDxQWLpwfI0AumLfgHL+bevzKig8Bha5XLutL9QdUJkFTS+FZQ2nOOPoeycjxy2
         QZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886539; x=1796491339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPspllEpba4GJzDMv8SswcqcP0cPwF7UGnWVw7zSJFI=;
        b=VnF6QstR6jiW7+y5sAu0bN8+5jZubavFIgi2AUoRpITqp74jSc9+OJO1u6RH7jsgXZ
         JL6tspI8ZDWvPqTTD2zEGcyL1yGC4FPpUefF9n7usP+xcjAyqWC63U0HzK1br9tVuV01
         Zt2lKqyfnFPt9IgLDNAc9O55DjAxfkn38CUav2OS1ihcpExoF/k1wtII2NYtBiebf9lC
         UMBh5Caw9D3TNaCKt232VlDLjbdmOUrdfYOGupdf0DBi695Fy76600o3144g67uQn2yk
         IgnXGwRrnocEUOX38pDtPm9EYJw/kmnegLVwWTbuCFRT16+jDnENTHcSRHNvFJWa96ym
         ydPg==
X-Gm-Message-State: APuU4Z+r7uG5q3XAV71aSmS9RCziWVy/+euONgk9vFmIUZdbZQh26nHn
	rTEtgNTpQtaZwxpNfN1ZyIvqpqhSRnXV+CB5+efQ4bgjMlcU6MQMgLffoXAqujN3wg==
X-Gm-Gg: AZFdTZfR0COXXAaRDfGjLWWi33UbVfu8/K5+H8fmQdjY4Z4OUYqyyogBx/2+MPmxePY
	jveyS+KLDNFfeifN2ltLWhJM7B7Xz9EUdRbtmamHHdF1igJ2OfpZqncXF3M/ujfmb3POVvc8ofC
	Xs7FPPzU/LzJrnbgWK0VDqS5RPH/fy+bbJeyp3eWvjdLQtfhq+Eu6eE9WwceP1LDhEJALpo90yH
	NkRbUfeslwo43YovngfImXsRdjlKf5VR+/3V4kD9aopQXo55fFzQIdtcop8Ll0r/pOVTGfBmtKP
	6uXAy76rbfnkZ2u28D0A5lNtxIoBgF5f8dVHiHiuiRYbMrEW3/PF6C2pjUJFj9WegZy1bL1PeyS
	1bd0I2CQyHO/l+nyd1jaa8ldxqGxdSnGid6cyCtZcnLs/oqIhkPlXwktLM2uG4dc/vyVuXinjmG
	tS0FaVjf/kuL1CnDA+MileLxe6+K2CXFf1dJtLRnudHeu6frbetic2MUM0zLC68xAtkJ7I4XarB
	MtKroFzsSFcChp4VeeZur+mW0ZABacByP98wxqWLlnZhFZpeoTW2EuHtQzbDIoQyuXwQlzZIvTw
	mrxipJIIDpyfONLsQ3l3Us4bQmSISQdkrV/vLNMdBUWxONyWu/xE6zYH5fk76ryiFe0PQWuhDv4
	HlMAz7SUMPW1JlJrLJBP3hUB8sXfwylD9BoS3gfZ7AdZkKDMzf2BfHAADLcYdYdoCjgDhSR2swg
	+pdfCJEnNdSSiG4B2e/pwtb521JiFyZ9f8MaVEzaTRdJ1Ac8rJN0BtSFAN1V4xX+843lyFLwbeA
	QEe+2WeNER1LgfVVQcjV+paVqk9lHlYieDB9gF785Jq4OUkGgIwfQwsOY2D4u+VRP1UcAixzKra
	N7pOv6x28RNJ/w==
X-Received: by 2002:a17:906:c29a:b0:c4c:bff4:200c with SMTP id a640c23a62f3a-c513a893bc3mr1652561466b.32.1795886539042;
        Sat, 28 Nov 2026 09:22:19 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:18 -0800 (PST)
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
Subject: [PATCH ath-next v2 1/6] wifi: ath11k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:15 +0100
Message-ID: <20261128172220.922376-2-julius@bairaktaris.de>
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

ath11k_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the attention TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, and a TCP or UDP frame whose headers it did not
parse within the first 256 bytes. An IP fragment carries only part of
the datagram its checksum covers.

The descriptor also describes only the MSDU the hardware received. A
frame that ath11k_dp_rx_h_defrag() reassembles from 802.11 fragments
keeps the descriptor of its first fragment, of which only the MSDU
length is rewritten, so the flags say nothing about the payload of the
later fragments. With raw decap (frame_mode=0 or crypto_mode=1) an
A-MSDU reaches mac80211 as one MPDU; when it spans several RX buffers
and ath11k_dp_rx_msdu_coalesce() moves it into a larger buffer,
ieee80211_amsdu_to_8023s() hands that skb, ip_summed included, to the
last subframe.

The stack then skips the checks it would make: icmp_rcv() takes the
checksum as verified, and reassembly keeps CHECKSUM_UNNECESSARY when
every fragment carries it, so a UDP datagram that arrives in IP
fragments is never checked. By the code this holds for every ath11k
chip and frame mode and for any frame an associated peer sends.

The MSDU start TLV carries the flags that say what the hardware parsed:
TCP, UDP, IP fragment, and whether the fixed IP header and the TCP/UDP
header were parsed. Mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, and both headers were parsed, and never for
a reassembled 802.11 frame or a raw A-MSDU;
ath10k_htt_rx_get_csum_state() already leaves a frame that is neither
TCP nor UDP to the stack. The flags sit in a different descriptor
layout on each chip family, so add a hw_ops accessor for the MSDU start
word that holds them.

Found by an LLM review (Claude) of the code.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments and a raw
A-MSDU to the stack (Sashiko); discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 61 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/hw.c    | 22 +++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..a2c359cc8e92 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1860,18 +1860,75 @@ static struct sk_buff *ath11k_dp_rx_get_msdu_last_buf(struct sk_buff_head *msdu_
 	return NULL;
 }
 
+static bool ath11k_dp_rx_h_is_raw_amsdu(struct ath11k_base *ab,
+					struct sk_buff *msdu)
+{
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ab, rxcb->rx_desc) !=
+	    DP_RX_DECAP_TYPE_RAW)
+		return false;
+
+	/*
+	 * Neither an MPDU the hardware delivered as several MSDUs nor a frame
+	 * too short to tell is taken as a single MSDU.
+	 */
+	if (!rxcb->is_first_msdu || !rxcb->is_last_msdu)
+		return true;
+
+	if (msdu->len < sizeof(hdr->frame_control))
+		return true;
+
+	if (!ieee80211_is_data_qos(hdr->frame_control))
+		return false;
+
+	if (msdu->len < ieee80211_hdrlen(hdr->frame_control))
+		return true;
+
+	return *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_A_MSDU_PRESENT;
+}
+
 static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	struct rx_attention *rx_attention;
 	bool ip_csum_fail, l4_csum_fail;
+	u32 info2;
 
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rxcb->rx_desc);
 	ip_csum_fail = ath11k_dp_rx_h_attn_ip_cksum_fail(rx_attention);
 	l4_csum_fail = ath11k_dp_rx_h_attn_l4_cksum_fail(rx_attention);
+	info2 = ar->ab->hw_params.hw_ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
+
+	msdu->ip_summed = CHECKSUM_NONE;
+
+	/*
+	 * The descriptor describes one MSDU as the hardware received it. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, and mac80211 splits a raw A-MSDU into subframes the
+	 * descriptor does not describe one by one.
+	 */
+	if (rxcb->is_frag || ath11k_dp_rx_h_is_raw_amsdu(ar->ab, msdu))
+		return;
+
+	if (ip_csum_fail || l4_csum_fail)
+		return;
+
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check. It checks the
+	 * TCP or UDP checksum of a frame whose IP and TCP/UDP headers it
+	 * parsed; an IP fragment does not carry the whole datagram the
+	 * checksum covers.
+	 */
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
 
-	msdu->ip_summed = (ip_csum_fail || l4_csum_fail) ?
-			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
+	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..096366b85849 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -272,6 +272,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -449,6 +454,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -626,6 +636,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.info2);
+}
+
 static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -914,6 +929,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -954,6 +970,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -994,6 +1011,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1034,6 +1052,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1074,6 +1093,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_wcn6855_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1114,6 +1134,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1155,6 +1176,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..8725e119707b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -249,6 +249,7 @@ struct ath11k_hw_ops {
 	u32 (*rx_desc_get_encrypt_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0

