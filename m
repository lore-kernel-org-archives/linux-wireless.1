Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886543;
	b=QkXOr/SdFRQeFA/bBtEV72NcX0kshrt1wkeYsVIR2SyiZsOfnuUSkqUQQk+EU2TdaFIc
	 vNyjAI2hYMpCsRkIujDNVMjcjiuiAKnqxHksVLup6e9vfiFQ84N5ewnJNy/qkL7yCYaCS
	 s9xw4L3JqiZULHMHd7RCeA371IUiLmCZ43UMfZ6v1NENmYZ2VXm2cKMKni9dpOcuO2m1l
	 vY6M56QcAZU9YP4jb/5JbK64Hbp6ojTwH3yzmD7WrH5tI6dZ/d1x4g3recO4lr24zVtoZ
	 FU87VC9oPsHR0lVcySXVsMYblz24sSj2amyJTb3sxr/xwKWL1ws36q9Vp2z/8UyVrdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
	b=CyHClmB2L3v1oI3IfcunBSDBLPAU/jVwaP7UAFHPN53xKj7FrMGIDvF53eSpAOnG10X7
	 KCjdgKOroyxJVJ9Z+O+OfVaMKhPnfCunV90UrtcWvoeLfKexCuR3ivxuaclE2biN+AkEn
	 zyuKZtzGT1WcckJyBju1gctTK+IUrI9qUALX11edR0oR3luw1B2DtjpU6KyN6EjanlVmc
	 tJBYqBWVYnMg5to7uloGvkMW78c+QvvWuJhzIEi7oeaC/04Pynfyn9+JGqxToZam96FFK
	 9xkXoNKzSNLfygaw8vrhJzi2lAv/NAoIjWyil1c5di6IQrWJnFTmIn81sMMFlCRPQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PewXpDOj;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C0606A681
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197C0606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=PewXpDOj
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c51d158acc6so296175266b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886541; x=1796491341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=PewXpDOjitUdcvBrWs9aCx8Tt9K7nFsi4CTgWFSUl8yKBOC9jEHQ/pVBcRKQh6tFCd
         1vREtC0TmD3iKJYPZPcfF1qbNQBLj2hCOGbc9FjQVw8ZZ9kb0J6Xoi9a9RhzYIheV+t3
         3414swGbu/Y8Hafk87lwyWrgcFScLNnpcLHXA/KLfv/3IeMDHiwJttdm67YbnKh1XA7w
         /d7lGfPY1C+hXLQrQsutGk4cnnvObF4lJMsQ72ZkoTSHgsMH/XXhUwkzqkasmJVzc63A
         eR5ZMPlNPpdxxD+tYamUg8f9cUCflWREV2B66cznvkn9LxVua5KE+5EvkBfHv3ItJHkM
         vSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886541; x=1796491341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=HU75MDTIFq/I44TDc1SwPNio//vb23lXSrIzujV1FCVGdsR4sIScYIfKQcZXvuQEEx
         xunzd+GedsRJ5bei8zZs1pxUiPUBrhXF99u27T8rxRRXVNAMN1cNwEvG8T8La9ZnAAMg
         J8KaADpOTnGLYiOnoW/SD0pYftB6rLP1uFQ4xMWgAEOzcofoN9KHysiUHVTFe6S988vo
         fpNU1W6kRnmfyz6Uu9EqadqI4KsxaMsjgRMt/Hl2UkD6BqbMV3TkdPxTLqDXgreF0Pd5
         ZvI68l10qFlaf9K56p5yrYL38XlD5QTtlz2l/Xp/sn57y9oS8PDv2YOvrAYDTckdsQ5y
         l20A==
X-Gm-Message-State: APuU4Z/OPD2yvSCGMhkzI2thZ48eUhuG1c7ReNo93ixR+0dVwgEgDy81
	7QejcBJRP+ZtCmsR/EYoIK+G48izYdEKvWCFnbiozKq9IzlfQF4gE/3OBFv8B8jXag==
X-Gm-Gg: AZFdTZfhppnaxw1Kyp9HwAYEHx/GXfI1MYU6ie8+EBG+B4Nw6kucozPCMbNxU1e+1Ky
	5a+wMxYbAo5JAoY+9IO888bIAcmYosNv0Ltj8D7J+cEo8G12AH17PxDHYS/qRu/qhOaXX8avISU
	glRUqffMsF4KJzoYK6wV+4YEqML2tAu1O0l0kCdFJhnyp44BwcEHvRVY+xwpbMWDpCDimJuMn5G
	1LpZTq1gIh/z6r09vk0VcxkI/+X9SW8NABHIXpKPcsxzui8Vzs5Gx4nC/xRHBuWCbJEXtLrhWhk
	T3Nv9dg4Hn178W/bmGRrO0Y0OgZ6dglpJ23H7od3J+sxQa4U34xwRAM9SiDVVoPx5I2mfTIWE87
	x7OFcLSVDAE/6xozA6X7CqhPI8G/3mF2svk3ryBOJhGL3DUdj5srIz7ZXLIWLxnvy17XmoZw8of
	rW1S9E/v+2FoItnotV04b7Uo8l6VyQkHrQg6y9+i8t/ZwvHwwwQuB4x5b/BZ5nwJhdyX3pHeLx0
	uo/jIFAnH91l5e4lxmBEAMsV6qsUp+3vm3qm5I4sAfR6orLGIodrqpIu2Kkoptqn7gBPKgj0XBf
	JWwL1nKn7+Mv4Dt1Yh5Kdh7+wZN/YXDgXw20uvHfPf6kov8OJc9lp3U1IvmRDx8y3LX5I7VSjK8
	E6MFel5z3BojfItFrjYGXXniP04/DL6aLOh7B6BLNEZl4uc3TiIG1m5W73UaWq5P2xKF7mZ98tC
	JLxvxhx0erUK8xBPj/sik2I7/TxkZYBMxFXyYs57izdm286xhOW1kX329kBa0tc+3Ib7eJm3ppS
	FO3hHRSP8HlEImH4oB5QPV0vECgO3qQwGfAFnD/qKF8tJxZDxZrpDckBl/WkUD6siVeCHJQJ1Ph
	ZdBXqGc/wy9eUw==
X-Received: by 2002:a17:906:365a:b0:c46:50c6:f737 with SMTP id a640c23a62f3a-c513a88d971mr1837729166b.31.1795886541449;
        Sat, 28 Nov 2026 09:22:21 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:20 -0800 (PST)
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
Subject: [PATCH ath-next v2 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:16 +0100
Message-ID: <20261128172220.922376-3-julius@bairaktaris.de>
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

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. A frame that ath12k_wifi7_dp_rx_h_defrag() reassembles
from 802.11 fragments keeps the descriptor of its first fragment, of
which only the MSDU length is rewritten, so its flags say nothing about
the payload of the later fragments. icmp_rcv() then takes the checksum
as verified, and a UDP datagram whose IP fragments all carry
CHECKSUM_UNNECESSARY keeps it after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, from the last buffer of the MSDU like the other
MSDU end fields, and mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, its IP and TCP/UDP headers were parsed, and
it was not reassembled from 802.11 fragments. Unlike ath11k, ath12k
needs no case for a raw A-MSDU: nothing in the driver sets
ATH12K_FLAG_RAW_MODE.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments to the stack
(Sashiko, on 1/6); read l4_csum_checked from the last buffer, like the
other MSDU end fields since commit 1e678e37ff13; discovery line
reworded.

 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

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
index 473887ed4bb1..fa591a03ecef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,16 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, which does not describe the later ones.
+	 */
+	msdu->ip_summed = (ATH12K_SKB_RXCB(msdu)->is_frag ||
+			   rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..10a8e3e78fdf 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..659d74a85764 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..6e103f49bb9f 100644
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
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(ldesc);
 }
-- 
2.53.0

