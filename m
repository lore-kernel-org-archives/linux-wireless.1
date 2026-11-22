Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381527;
	b=Xz8sNBG+Jchn3KVRS6XQeTo5vJl/lx5uUk4Lje7SnTo020LTVTrFe4PshOCoTTfiQIMR
	 tKWRUH6AZ9iGhrtx4AUmlozCebeRWkR/b3liYHvlBB6uHeRYSJJfzIg0OCt7Jv+kpwdot
	 T1Beybj2cCoQo4qNYJK/CLaTQAn/YF/0ywsoS5iCx8QtnIJcBIcfTc7U6r33id5/E8udt
	 Yu0jjVYkLzNJ72SHaS3PKf2rFNWnOJ1us/6HZIi0ZWdZj01JsAdj7C6gS3DFk1zo0FAsZ
	 BMLBzd4mp0i38WNYsF52WiS06CKMbWNh5rR8kIurKWj6QIeCTTgHWqMZo6L2Feva4Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=;
	b=1PQA+ovU3qhfOGdET3ugnYF3rI+oH2d83GHZ2Tph/9Gr4n15PQImBeAJ1dbMDsE0axX4
	 +BdGhw/G8QVjv24Ku0fEJrUHbzsYmlhJPIKATc2Y8OQw5+RQVcemDkwKVsN7dL2Q1hBtA
	 S9aKMXiUO5jrV5aX2+RCi0qtL021a6elrBZGBQ/zx2hCm+79KqgC4hqQKQERNVU72KCdB
	 OeYRy/L3XiOITm6b2Yw3N9z4dIFXi8ITTZr7qOVHfy3BzF8NbQcrPsdCAn4UNu8RSaag/
	 oT/4FhcqTNZerE9omr2AYHH51i4ff58xZk9rKqDCFwEhHyc1f7Ppo4dbApdRtJAcGDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Du66+Dr3;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB7606A31E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Du66+Dr3
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c511cdd5a82so296957766b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381525; x=1795986325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=;
        b=Du66+Dr31YODh1xxac6WxtH7UCWL3MdmkvI7bwmgDSlxVD26CeWR5XRzZkiKMwCiJT
         BQwn4eqRWrc+Q9S7wPvwbiN24Yb7yP0KyjhEylltWM9Rwp2AhWczJ/m87RVt1PFkcS/a
         O0qQ/r2mY3VtnG/EECyjOEZwVF8LLFPX8xCFhjS4b5HbL4nhsnFO9piRwibhxjuCMlO4
         fkHSKy6SShWntjcD+L5N+75FkzzR1OzQJD8jyyerHOOvXGLaEh/u1HtOLC+Jg4XdMNWM
         EO5r4PtJGk2l8D41ZJyHWusDSx3b6JpsMkgT18w2YtCiJ9kIM+y5IONJCBXMK3+xgpOB
         T7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381525; x=1795986325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=;
        b=TRg0U9gc2IsicSktBnScRyZ0ad3q1rvrhTujrTxa+0EgXzm55bP987Cs7gS/pWQWnh
         bqFGh8LS58WiQV2VeZjCEPwHfT4uOmHKmxXrICOaX2sFqiJCWrMMx3elSYr8RZZ/XDLn
         tGccny5/TwbiZVlI9umBUKAWG3AXkW4Ir1uMo/lzAIWMgf3Kc7NjUSw0ri0socvvNViU
         kliyvhNLDNmJPMZ2qXWce8O7YU++UV+udo5GqXQb2xN+S9pKQRWkHBjnN0bWL/hl+yzV
         ADqZjD9+mu2TIvbjDqT4o9khXGlj5BksL4iirjKxoeguC/yQGv77/mvm4dIFzI4oCNKZ
         DkZQ==
X-Gm-Message-State: APuU4Z9vIuOc8do2uRkZiy0S8jIg8RcDSyC9ioApRZ3dUz88JVeoyyD/
	ou4WHbxk3aKqR+5+mCZVYn4zd+4ozASX7c1+ne88VJetV17DY3UuOQJCNHP9kTEqgA==
X-Gm-Gg: AZFdTZcskX45gzoHzjDONhGXz/hlshZrC45Piklm6bR3TFRO80GMxnmxmUsRv0WNMDS
	5I/MwZUM7xygVeIFr+q7fAEEkqdMshUeV7IfS3kcCqF6A+YNzPVoPYEntCdj+ydUYKi0+DLpfmc
	wfRubkba8UgWndquAxuFAn2Iz3XBWQ3yQQHem8rBOst+H/9MTHgIJGetngjIXLAlGmyR4ZcWx1Q
	TBSB/OlBmybyt24ZDvz886BI80Et8wlhowZFtDCIeF/X6bHptKIvMvVf3BGPE4gsUi+EzvLTHvV
	1NII6+FeROi3ndaKYH3yiMurb9dwe9xx68ol6OXIhZQGdmgw8pCL7bOZ/V+fKKEoaMVwCd7jsNi
	pay+9A1qjOU9RCXi/oSN+ffNTGo299c5pTwPSPQesAql501nT2id3JUSOCr4anWG2oY5MeEmvMs
	gwOfzzcD61w+1Ch+tEBjzGzVAgAAL6VJsMo29b0VDUwb44lTqUST/NAYbl67c+Lnj2eJq3zIX47
	H9JUEpuLtYnjYlLvs+D2+evXYvERecbnlLB4HWKkn8GlngX7twSi4lOAOy/HI7/6MXSwncIW3GG
	q9JR/SKNiJEpJ1hBX8uDp453nyh5GfHdnmvohrP7y7fFW/I5Xyj0N5VO4J+S6VBZCH9VSUUNveF
	Iwyooscv0f08ULp1DmpYdQjq3JNAwNNTneXhuANx0U6cJSgYDRQILP1rqAmhIdSuyh3rZhjZKqL
	9BockL8XB0kAE08UdK4/73wow1n88pIqhWLv3dhq/V04dF+GFInSYZ4udYqc1o1lpb+3THzifwY
	P3WAZwGBkl4/1QQC7wZvDCwJ4nkL8ypjsTgh9+mfJscrXT5YgqaPd64sXabOuWHz1e4gZ6Fr32a
	zp4YO6AJd+rZt5cQV+aTRu8muOSokftRDuOHjRtbL+2WWHl74JBNqeTSkR3UalIrBJFLTEyVtg=
	=
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr529622866b.30.1795381524970;
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
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
Subject: [PATCH ath-next 1/6] wifi: ath11k: only trust the RX checksum of a frame the hardware checked
Date: Sun, 22 Nov 2026 22:05:20 +0100
Message-ID: <20261122210525.2076058-2-julius@bairaktaris.de>
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

ath11k_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the attention TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, and a TCP or UDP frame whose headers it did not
parse within the first 256 bytes. An IP fragment carries only part of
the datagram its checksum covers.

The stack then skips the checks it would make: icmp_rcv() takes the
checksum as verified, and reassembly keeps CHECKSUM_UNNECESSARY when
every fragment carries it, so a UDP datagram that arrives in fragments
is never checked. By the code this holds for every ath11k chip and frame
mode and
for any frame an associated peer sends.

The MSDU start TLV carries the flags that say what the hardware parsed:
TCP, UDP, IP fragment, and whether the fixed IP header and the TCP/UDP
header were parsed. Mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, and both headers were parsed;
ath10k_htt_rx_get_csum_state() already leaves a frame that is neither
TCP nor UDP to the stack. The flags sit in a different descriptor
layout on each chip family, so add a hw_ops accessor for the MSDU start
word that holds them.

Found by reading the code with an AI review tool.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 23 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.c    | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..93425ee02774 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1865,13 +1865,32 @@ static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	struct rx_attention *rx_attention;
 	bool ip_csum_fail, l4_csum_fail;
+	u32 info2;
 
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rxcb->rx_desc);
 	ip_csum_fail = ath11k_dp_rx_h_attn_ip_cksum_fail(rx_attention);
 	l4_csum_fail = ath11k_dp_rx_h_attn_l4_cksum_fail(rx_attention);
+	info2 = ar->ab->hw_params.hw_ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
 
-	msdu->ip_summed = (ip_csum_fail || l4_csum_fail) ?
-			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
+	msdu->ip_summed = CHECKSUM_NONE;
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
+
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

