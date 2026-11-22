Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381528;
	b=yA2LyRoW4vcG7uKFEPqw/Gx+aUWdKgSfDQ6GrUvNLi662owncdjFVJ0BqB57HhJ17k5d
	 DgUMyMayCt7n5anU2byPtcFa1mI5RgSIxoPvMnY18zPWrSqN5oftNTPLal9gcMvLDwI1Q
	 FoXXZVX2BYy7mWnZrEr+/gmx0TibSeVSEplq0UqeTNU15MR4sh+ySK0pC4mR3x+vE7nrN
	 o6xxWwtOsvMzEZdKe6WlZpHmN/dUidwIIODlWvp1fmv5kpeT5IlBH/Vk/R9eUTWbGUlsa
	 zRKXyJzZmPmPE3lJsZoB4uZhKCxns5ApyjrCjFrUtUzKMdxs39VdrYyBsA9hoE3rMQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
	b=o7R+Wdz9lul2M2LeEJHIDKrJb4xCV+zdBQ8lWAQ4KSLIErB+5MoudPUeJ+NfhIPf7Evs
	 zYNerSTrykr6LsQt3GrbD80XSdAvaMEgWZdGZkqUmpppINt8ifcEccsM9TFVfqd40hxGK
	 xEB8dXK8+8f+NNm/oylc84D74QhExA55mytQEmSDpzcnaXemQmEFZnWeqYT1luqPG+fgQ
	 Dkj7RYPmSpGNA9YQXPXzHDbYoK2sRIDFZ15VXc3Re/uJqwPnQ8K7o+OhGmFqM9jO4HKIg
	 tp4OFWG/tXFVmLNHM/SvB+N0K+Xqa9AS87eHFYM4IPrLl+0873vzwxGBDmVtrNKZ3aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G6RiUEDv;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963DD606A33F
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963DD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G6RiUEDv
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a574bffso94214966b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381526; x=1795986326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=G6RiUEDvdQTRN+BzIk0ekEDP7Pa111u4DymCk+gQcRvNKohvG43LPeaRl+dcRDV9Uw
         dE543FvuQm11SXhN+32zgLf1sXnPcYv5LtMv6PNAGjvR7Fa7QE/F8AWdqqN1kJjZYsuz
         zDJPBsNzAzTB1nACci7/3iROuxb7zXycj1Ty9B5AfDU+lH+uMjAry0JsLwsx9RwHTbsS
         5xma+5M9ZMYk2WXJLLCmUmppMaKiMCJHulKLVvSA/YRgIoCGS4L2GTgkAQMvROREtPtn
         XTqIMq3pAc1h+zfgTO6V+mUlmXS0dqqkNBlOTlgws65JKWuiKCOBpm5yxxKvqiJF3viY
         o6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381526; x=1795986326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bkx2jlQcxYbAjWN1LA9t9bAHgweEVF16qJ99FDl9R4=;
        b=I1os0vaa6Nbc7H5MQejzF4saf4OtvnN+MEzQDjdav9YIDJnYndfcg7mDTX5W6ElxyI
         LeVYwmto4aeKgOgnfGL9t4f+XSmdGW78yjOB8iP971FDEgQNQZu+vaDzWD7TdLXG3u6b
         c8GU6dgjj/89UyjeK9CRKPe6PjDnsn2qN8cKO/6m1rRBKdMnmKGsb9zfNeqYFKR2IeEi
         iCRPDht9+crqkf3IdTPRKzl02KfFAO2BCT9xKKYW/Es4QKFslw9LXCfAIpo3VEU6L4ZY
         +C+oKcMOVkjxC2eplylCXxGEIYORDSW4ggeAiiJbo4dZdVOJQmFRKy6wOqYo/gD7Jfzq
         qpoA==
X-Gm-Message-State: APuU4Z+0J3XpVZICQe/8nRtn7Bvb0sRWqSw+Ztx6NtQlWDkCgEKQkHb3
	bS96+NjgjJRzmWQH4nBbjiufJfc8mo9RHXpG3aeUedKTx6zKhB0aiP1+DWBGpI9oNQ==
X-Gm-Gg: AZFdTZc1tkp3gAIK1zehw9LFoXJLXnV1HaOJP82pc4o71UmPWR5+N9jZrFKD2/ttzih
	AamaP6ERHqqEcSG89DZoSFVq3039d807v3+mbBlpGbl4hSbD2SS1HwQj9NErvG5y2R66PdbQEl8
	nbAvJQLNs4ZQ6W7C92kGWflqyup+HP1hevV7UKFhs8ZhwrzcxhOYH09Pa1G36UccCOp2733mhm1
	4l3da+8zFsxGu0YcfRO/02pHLAouWpkhvSmSP2ENYXbBkyK+bbVBrG7LggekyIuQGCm7bmEWO2i
	Y7bzywv+XdzusNUnETm9iuMI9r4KJ6aDSXcz0LaLm9qTfzanr7SgVWiUFD353rbjUPI738boMFN
	PhOMnqjaRYjlnCsk2vE6ECfjiAzOeefgRkCnJouH7fO2jchVm+oxNbFJV/e7/LXXVv+3HGhlsNO
	qdwx9C3d5V6RyRfkSzSU59aB86KOL5c7BpcIFIE5qm6QtxTOzH0jttiCkdAQ5TJ164YIm2NOKN0
	uCoT5QYclwU61pLCBCiUFfNjswioIT2k+U5KtOAYnEQ2ek5ojYvELbVcGLWit7SIFWeG4b5b8Z3
	Xz8FIpm0eVlexgiSTLT5JWQTs5GeTQC+ft2pYuLE30P9HOuRzxp7OrDeKsk1IlypdJADwHwKuw7
	Gg0/AVmgJZxd/Evr2pjYF5AFEr2k0NJbRNYbLTRbj94kzyx6jwS5QFTdo440mP5G0bjoea6SqNf
	emjtyYjDPtxTXRNxO/zAYmCP3He5rFEhKBkIbpAfSxXDpNdDXsQuaEE4LI39Hjb7SDsz6l53mmf
	cg6aEZTodsrMEVSepZoOpU+n+WQfm+ZqDEEh2HmxAI4TK3YdH+607PqVRcx/jT2aMxAsF6c9qgY
	0Zv5hKl6YEIiRDtoaHYKZAwiBjlQRYccdMht711lqjNoqF0TeIaC0xZhmRyCE8D12Iq1GH4+ng=
	=
X-Received: by 2002:a17:907:c13:b0:c4c:c997:8711 with SMTP id a640c23a62f3a-c513ac67123mr760146366b.38.1795381525929;
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:25 -0800 (PST)
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
Subject: [PATCH ath-next 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sun, 22 Nov 2026 22:05:21 +0100
Message-ID: <20261122210525.2076058-3-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. icmp_rcv() then takes the checksum as verified, and a
UDP datagram whose fragments all carry CHECKSUM_UNNECESSARY keeps it
after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, and mark a frame CHECKSUM_UNNECESSARY only when it
is TCP or UDP, not a fragment, and its IP and TCP/UDP headers were
parsed.

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       |  8 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..003baf0d3ea0 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -732,6 +732,7 @@ struct hal_rx_desc_data {
 	    is_decrypted:1,
 	    ip_csum_fail:1,
 	    l4_csum_fail:1,
+	    l4_csum_checked:1,
 	    is_first_msdu:1,
 	    is_last_msdu:1,
 	    mesh_ctrl_present:1,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..4a57d89669ab 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,13 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment.
+	 */
+	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index f579fdfc7c1d..23a07ca5aaa9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -347,6 +347,16 @@ static bool ath12k_hal_rx_h_l4_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static bool ath12k_hal_rx_h_l4_csum_checked_qcc2072(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcc2072.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static bool ath12k_hal_rx_h_ip_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 {
 	return !!le32_get_bits(desc->u.qcc2072.msdu_end.info13,
@@ -421,6 +431,7 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcc2072(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index dd12b1684cf7..4f0a4daf7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -872,6 +872,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_qcn9274(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1042,6 +1053,7 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(rx_desc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index de6247aa3b2b..090ed78589a3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -485,6 +485,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_wcn7850(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.wcn7850.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 {
@@ -638,6 +649,7 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(rx_desc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(rx_desc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(rx_desc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(rx_desc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(rx_desc);
 }
-- 
2.53.0

