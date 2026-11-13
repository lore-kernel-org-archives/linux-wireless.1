Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581532;
	b=SVailHZGiSrFBElUqe0rvz3IAf7E1nRVonxAFlLPSBVER+kIRw7WlYxntxk8KRl4BR9N
	 t6jQhhHqSTGCLoUbyElpyDe0pHtlufO9YWEGiQMiLLiVzaCHPLFougR6WnDtI1tHA7LCn
	 FJoQe212H6zNyjMwqUHeFBO72qd0gtubcy1r7pb3IfmYEKLMMoNS0jfGpDEsoPAWI5483
	 e2reud4WP8yjWlXZfvXZNvcHiV8W4RxzdHSllIH4DQG96oPbUXNuYOPUwJ7tz4uXpTaUm
	 QdCwXqjx8EOADh45BwRvwhDhncNzCbUUza43CW6kP/a+4u0+Dqt4m/xpc0ALMNx+Wnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=;
	b=H+W6JvbMSgCOHVy6YXJYXz/a6vbWdkQpJvtb919GFkcnWyiooeBR2y8Xq6/euSAXGnNR
	 hmseNdRMXR5Nk13WatLDw45SQWVePE+TjP8nTaYHGpDDvA2PyQwFMp/D//4nD1ZZuRv6R
	 LljbMrszNm/MxulV3/fYrZUNHIweqAXWFzzBYkEl6NoV1JGHmISHypwYGe5sF7osWXjub
	 YblR1bOAIAHsqnQIydodJEhbOkWLNE+ha7OWcRN1vhVtE9yjjxr0jyYebC+Rk/aLjTUNT
	 uOosGgSoU1PkbhpRWQQgZc7k+KuSKaF5X+glr/0Q64n8AUuVXgW9x2o8wRpAk7RX5Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkwM4jnG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XksOxHep;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E062606A337
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E062606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkwM4jnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XksOxHep
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbWL2139138
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=; b=SkwM4jnGz1l25aDj
	u6mEmUBjfUuGcZiKXWcaSQp7cvHSxPzyzWDYmGCYNRsoaCDv7G0jJftkCHJibKsb
	TjcGbbjpsZMpgFyQ8+b+bEhV2hqnC8unFCMegfQYthtcK0P4XikhxHwraAdeQpdc
	QpOEFNtVc0tffbWCXk23HDT6S509GYI5Y8UZyLzGu3DSG2g/oDHhn940i1ShscaG
	YiCQ6broAihJPh45ESJBqzDcXfGQz35HL1pcInD2sLap8i5paKrkJeVaB/AVV6BO
	LxN1VBpEf/0hgaolBLrlc16cZeU6knnBd0zjVsBDp/Ioy0lErOB9gIFfxRtod7EG
	Bnfxtg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9q5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 14:52:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso110089241.3
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581530; x=1795186330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=;
        b=XksOxHeprx05SjA+j1t/N4fUW9Ruk9arr4ndFihhyM+NUIvWr7B7VcBxWnVdM4nxyy
         ykJn/DEn68YnOyixi3elG8gpYgMMw1VHq9PFmt5XjKD2FzZZzoVA2V/67q3j1IOY97Y+
         qVzhHwh6kz8B0qsFEgYe1BvBWy6FH44Zd7dsWG5527R2LowGBQjSRg/fyDpSpM4+qM+Z
         bOCypry+2ePNWXn6LxsiMkWNEhcz3cE4j4pBoijlGm+t380571pC3MgwQpoVfGwPkipj
         rAALEV3aSXIa9/mjIOo2TWDJ39Zw2hoUEoHMciA71APIw1VKARfxcSwSlfjVVmPGbAgJ
         S5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581530; x=1795186330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxL+WodpVWg29CSTzzs/MTzCYiWhhWEtVhmrBGaOtyk=;
        b=dvQZHup9kj1raYUVtkdiQupG74EBYK2D/guI8cW1vt1ZvBDjtFPv0FNK9sY+KTm6GJ
         PXjf32ENdsfe+/pNMZIdkqlj9O3af1pLj44XjbZolfxSzrrTXg9/3LoNDE6VFG5iVIGE
         e7nelkHneLIpjGY/x32f+fUl88SprxsgRZWJyKq7JjUEw7ykl8HCeDt1m+n7/tSzkzEU
         6hDExCoA9R+1sO6MOhX2wBIgC7B22tnlpV1TNhZFb1JSms9tMtjQT55RnFWEE0X6UVFY
         pRjgays4BoMUtdq60rwh8cDkdfHGF2jA4tXzVf8mz0m97DtjzYmat2xdj4V5QRjml6TJ
         r7TA==
X-Forwarded-Encrypted: i=1; AL+hErFjKjnozn2qwO3AQ9BlP4vDEZBPFP9pvKS3k2BYQuND7K94ncOiG+wAvNvnANMVS467rmwaXV4C25aBFYPpvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9C+hf3X1sRicUbHDMiTuGlovM5bv0svAFO0hY9DrjScsq9Zche
	sFOLz8kBLv7lQbzuUE41Vg3nLW2d3JMVwOLNhvfem5newk3OsqErMUssWFcDglk+ONXu2VjwLqp
	b9+Fps4POrgmS7+OWehK/iLnc05a2kcPj13u/E/sxr15q8RbujtPVH8RBMZOiULg2dxQYeQ==
X-Gm-Gg: AYBFou3mXDzXbAktTK6SiTdNx/L+9Piri4upyLXA/PpvZUxVvP+erLodLKqB52v98ZA
	KTHwVhHafByMv/q5zdybk8csuAdenfYvzbuNoWHfcgichmVpzWbkiAl5kG5XCMH30AxJopD0Uvy
	qpcFBhcrYg54Pr2PqgmrRkI/PC3C/UeKd4pxOWV8JROpEeWMgk/mRFSIasbl8Z2XH3OM5ZSnPd0
	pWCHnsdyZCFREmgkTR5fAKYy/6BlbzSxNC2uWr21ICN8nlPpyCD+eTwgl7whKA9WQp6D9YNSxBJ
	pNkyjqqpmrCJspMX/Pkx6NnOoHHUcCHan74cG4uioNJeC8KzM3PA/A+uWyzq/bjV2DpFJqKSBNm
	e1+FV/vbOtR1iwQM6upoYRLIQtXtIdMeSO0YaG6tVODcwQiwHxXPgoVtm3B1tuw==
X-Received: by 2002:a05:6102:84c8:b0:7d0:6db8:dc43 with SMTP id ada2fe7eead31-7d64d76fcbbmr516597137.24.1794581529895;
        Fri, 13 Nov 2026 06:52:09 -0800 (PST)
X-Received: by 2002:a05:6102:84c8:b0:7d0:6db8:dc43 with SMTP id ada2fe7eead31-7d64d76fcbbmr516587137.24.1794581529205;
        Fri, 13 Nov 2026 06:52:09 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e294420sm151359195e9.9.2026.11.13.06.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:07 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:45 +0100
Subject: [PATCH ath-next v2 4/4] wifi: ath12k: use ieee80211_rx_list() to
 deliver packets to mac80211
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-4-46d186f8688b@oss.qualcomm.com>
References: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
In-Reply-To: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX7qkPLe8K6L3K
 lJaz8NcH4Nq30xX50GE38qwnfWICGHD4wKfGPatDUeuKAqfbVwGniX/RNmYQzZ07WNW6qLWfX+2
 dPaaOnO6Eulx4w8M6C9VwTb4A1EAa8synDHCIagqrQfZzm7xco9SgTx5p3B4FPTxP+wUqA63mkh
 UInzPp9EhvnhiTkqSP7AO89/kgxhqwTsx9Ur1MordKHvxSVuz+LD5VnNO35jMgJO+KaooOQTd/D
 JhCfw2M0k0NW3UO/3dhlnzvoBr6Z2iWHotCXL8YlbPdNw0No91ALagSwAMic2UIfUnLZmzSvIp6
 zF1zOt8k++huuBXiaWZ8T0CWxKdNoTh0G6IgiguH8E/zF+494NJ5bZVcy7BHEWINKwKp1rBWtXl
 iwev6nfFjq6I3C+t/PWv8cxIdg6ta7x5/eEzjQr1LF9ji4rpOwQGLGmbPSmmd8R9qib7LIc0I2R
 pzAAjs2F8hCWAxMbTAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfXyTHNSZ188OaH
 +62nBHNwmq0cnYAYPt8bk6QKytYq3V0uBbIEYHldRMtO9LwmKS3wVyVjyAmsNPVEcrB36CELNQa
 M6Yp4Da0m0n54hL0lIX2Slad7Wspcy8=
X-Proofpoint-ORIG-GUID: EVV1-u-symEdCwyFwBH1ZzhL_SoagM-W
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af7241a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6kEX7mH1gwqfXXxvQscA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: EVV1-u-symEdCwyFwBH1ZzhL_SoagM-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059

Currently the regular rx path hands MSDUs to mac80211 one by one through
ieee80211_rx_napi(), and MSDUs spread over multiple rx buffers
(MSDU_CONTINUATION) are first linearized by
ath12k_wifi7_dp_rx_msdu_coalesce(), which may require a
pskb_expand_head() reallocation.

Rework the receive path to collect processed frames on a list and
deliver them to mac80211 as a batch with ieee80211_rx_list(), feeding
the result to napi_gro_receive() once the received packets have been
processed. Delivering frames in batches improves the icache footprint
and lets GRO process more frames together.

While at it, drop the linearization for multi-buffer MSDUs: chain the
continuation buffers on the head skb with frag_list and deliver a single
(possibly non-linear) skb per MSDU, running the per-frame processing
(h_ppdu, h_mpdu, link station lookup and rx_status copy) only on the
head.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 257 +++++++++++++-------------
 1 file changed, 126 insertions(+), 131 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index f151f7de5554..c51faac4eb20 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -441,114 +441,28 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	return 0;
 }
 
-static int ath12k_wifi7_dp_rx_msdu_coalesce(struct ath12k_hal *hal,
-					    struct sk_buff_head *msdu_list,
-					    struct sk_buff *first, struct sk_buff *last,
-					    u8 l3pad_bytes, int msdu_len,
-					    struct hal_rx_desc_data *rx_info)
-{
-	struct sk_buff *skb;
-	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(first);
-	int buf_first_hdr_len, buf_first_len;
-	struct hal_rx_desc *ldesc;
-	int space_extra, rem_len, buf_len;
-	u32 hal_rx_desc_sz = hal->hal_desc_sz;
-	bool is_continuation;
-
-	/* As the msdu is spread across multiple rx buffers,
-	 * find the offset to the start of msdu for computing
-	 * the length of the msdu in the first buffer.
-	 */
-	buf_first_hdr_len = hal_rx_desc_sz + l3pad_bytes;
-	buf_first_len = DP_RX_BUFFER_SIZE - buf_first_hdr_len;
-
-	if (WARN_ON_ONCE(msdu_len <= buf_first_len)) {
-		skb_put(first, buf_first_hdr_len + msdu_len);
-		skb_pull(first, buf_first_hdr_len);
-		return 0;
-	}
-
-	ldesc = (struct hal_rx_desc *)last->data;
-	rxcb->is_first_msdu = rx_info->is_first_msdu;
-	rxcb->is_last_msdu = rx_info->is_last_msdu;
-
-	/* MSDU spans over multiple buffers because the length of the MSDU
-	 * exceeds DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE. So assume the data
-	 * in the first buf is of length DP_RX_BUFFER_SIZE - HAL_RX_DESC_SIZE.
-	 */
-	skb_put(first, DP_RX_BUFFER_SIZE);
-	skb_pull(first, buf_first_hdr_len);
-
-	/* When an MSDU spread over multiple buffers MSDU_END
-	 * tlvs are valid only in the last buffer. Copy those tlvs.
-	 */
-	ath12k_dp_rx_desc_end_tlv_copy(hal, rxcb->rx_desc, ldesc);
-
-	space_extra = msdu_len - (buf_first_len + skb_tailroom(first));
-	if (space_extra > 0 &&
-	    (pskb_expand_head(first, 0, space_extra, GFP_ATOMIC) < 0)) {
-		/* Free up all buffers of the MSDU */
-		while ((skb = __skb_dequeue(msdu_list)) != NULL) {
-			rxcb = ATH12K_SKB_RXCB(skb);
-			if (!rxcb->is_continuation) {
-				dev_kfree_skb_any(skb);
-				break;
-			}
-			dev_kfree_skb_any(skb);
-		}
-		return -ENOMEM;
-	}
-
-	rem_len = msdu_len - buf_first_len;
-	while ((skb = __skb_dequeue(msdu_list)) != NULL && rem_len > 0) {
-		rxcb = ATH12K_SKB_RXCB(skb);
-		is_continuation = rxcb->is_continuation;
-		if (is_continuation)
-			buf_len = DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
-		else
-			buf_len = rem_len;
-
-		if (buf_len > (DP_RX_BUFFER_SIZE - hal_rx_desc_sz)) {
-			WARN_ON_ONCE(1);
-			dev_kfree_skb_any(skb);
-			return -EINVAL;
-		}
-
-		skb_put(skb, buf_len + hal_rx_desc_sz);
-		skb_pull(skb, hal_rx_desc_sz);
-		skb_copy_from_linear_data(skb, skb_put(first, buf_len),
-					  buf_len);
-		dev_kfree_skb_any(skb);
-
-		rem_len -= buf_len;
-		if (!is_continuation)
-			break;
-	}
-
-	return 0;
-}
-
 static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
 					   struct sk_buff *msdu,
 					   struct sk_buff_head *msdu_list,
-					   struct hal_rx_desc_data *rx_info)
+					   struct hal_rx_desc_data *rx_info,
+					   struct list_head *list)
 {
-	struct ath12k_dp *dp = dp_pdev->dp;
+	struct ieee80211_rx_status *rx_status = IEEE80211_SKB_RXCB(msdu);
+	struct ieee80211_rx_status *status = rx_info->rx_status;
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
+	struct sk_buff *last_buf, *frag_list = NULL;
+	struct ieee80211_link_sta *link_sta = NULL;
 	struct hal_rx_desc *rx_desc, *lrx_desc;
-	struct ath12k_skb_rxcb *rxcb;
-	struct sk_buff *last_buf;
+	int ret, msdu_len, rx_desc_headroom;
+	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_hal *hal = dp->hal;
-	u8 l3_pad_bytes;
-	u16 msdu_len;
-	int ret;
-	u32 hal_rx_desc_sz = hal->hal_desc_sz;
+	struct ath12k_dp_peer *peer;
 
 	last_buf = ath12k_dp_rx_get_msdu_last_buf(msdu_list, msdu);
 	if (!last_buf) {
 		ath12k_warn(dp->ab,
 			    "No valid Rx buffer to access MSDU_END tlv\n");
-		ret = -EIO;
-		goto free_out;
+		return -EIO;
 	}
 
 	rx_desc = (struct hal_rx_desc *)msdu->data;
@@ -557,56 +471,131 @@ static int ath12k_wifi7_dp_rx_process_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_dp_extract_rx_desc_data(hal, rx_info, rx_desc, lrx_desc);
 	if (!rx_info->msdu_done) {
 		ath12k_warn(dp->ab, "msdu_done bit in msdu_end is not set\n");
-		ret = -EIO;
-		goto free_out;
+		return -EIO;
 	}
 
-	rxcb = ATH12K_SKB_RXCB(msdu);
 	rxcb->rx_desc = rx_desc;
+	rxcb->is_first_msdu = rx_info->is_first_msdu;
+	rxcb->is_last_msdu = rx_info->is_last_msdu;
 	msdu_len = rx_info->msdu_len;
-	l3_pad_bytes = rx_info->l3_pad_bytes;
+	rx_desc_headroom = hal->hal_desc_sz + rx_info->l3_pad_bytes;
+	/* When an MSDU spread over multiple buffers MSDU_END
+	 * tlvs are valid only in the last buffer. Copy those tlvs.
+	 */
+	if (rxcb->is_continuation)
+		ath12k_dp_rx_desc_end_tlv_copy(hal, rxcb->rx_desc, lrx_desc);
 
 	if (rxcb->is_frag) {
-		skb_pull(msdu, hal_rx_desc_sz);
-	} else if (!rxcb->is_continuation) {
-		if ((msdu_len + hal_rx_desc_sz) > DP_RX_BUFFER_SIZE) {
-			ret = -EINVAL;
-			ath12k_warn(dp->ab, "invalid msdu len %u\n", msdu_len);
-			ath12k_dbg_dump(dp->ab, ATH12K_DBG_DATA, NULL, "", rx_desc,
-					sizeof(*rx_desc));
-			goto free_out;
-		}
-		skb_put(msdu, hal_rx_desc_sz + l3_pad_bytes + msdu_len);
-		skb_pull(msdu, hal_rx_desc_sz + l3_pad_bytes);
+		skb_pull(msdu, hal->hal_desc_sz);
 	} else {
-		ret = ath12k_wifi7_dp_rx_msdu_coalesce(hal, msdu_list,
-						       msdu, last_buf,
-						       l3_pad_bytes, msdu_len,
-						       rx_info);
-		if (ret) {
-			ath12k_warn(dp->ab,
-				    "failed to coalesce msdu rx buffer%d\n", ret);
-			goto free_out;
+		if (!rxcb->is_continuation &&
+		    msdu_len + hal->hal_desc_sz > DP_RX_BUFFER_SIZE) {
+			ath12k_warn(dp->ab, "invalid msdu len %u\n", msdu_len);
+			ath12k_dbg_dump(dp->ab, ATH12K_DBG_DATA, NULL, "",
+					rx_desc, sizeof(*rx_desc));
+			return -EINVAL;
 		}
+
+		if (!rxcb->is_continuation ||
+		    msdu_len <= DP_RX_BUFFER_SIZE - rx_desc_headroom)
+			skb_put(msdu, rx_desc_headroom + msdu_len);
+		else
+			skb_put(msdu, DP_RX_BUFFER_SIZE);
+		skb_pull(msdu, rx_desc_headroom);
 	}
 
-	if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
-							     rx_info))) {
-		ret = -EINVAL;
-		goto free_out;
+	if (!rxcb->is_frag && rxcb->is_continuation) {
+		unsigned int frag_len = 0, truesize = 0;
+		struct sk_buff *skb, *last_frag;
+
+		/* The MSDU is spread across multiple rx buffers */
+		msdu_len -= (DP_RX_BUFFER_SIZE - rx_desc_headroom);
+
+		while (msdu_len > 0) {
+			struct ath12k_skb_rxcb *cb;
+			int len;
+
+			skb = __skb_dequeue(msdu_list);
+			if (!skb) {
+				WARN_ON_ONCE(msdu_len > 0);
+				goto free_frag_list;
+			}
+
+			cb = ATH12K_SKB_RXCB(skb);
+			if (cb->is_continuation)
+				len = DP_RX_BUFFER_SIZE - hal->hal_desc_sz;
+			else
+				len = msdu_len;
+
+			if (len > DP_RX_BUFFER_SIZE - hal->hal_desc_sz) {
+				dev_kfree_skb_any(skb);
+				goto free_frag_list;
+			}
+
+			skb_put(skb, len + hal->hal_desc_sz);
+			skb_pull(skb, hal->hal_desc_sz);
+
+			if (!frag_list)
+				frag_list = skb;
+			else
+				last_frag->next = skb;
+
+			skb->next = NULL;
+			last_frag = skb;
+
+			msdu_len -= len;
+			frag_len += skb->len;
+			truesize += skb->truesize;
+			if (!cb->is_continuation)
+				break;
+		}
+
+		if (frag_list) {
+			skb_shinfo(msdu)->frag_list = frag_list;
+			msdu->data_len = frag_len;
+			msdu->len += frag_len;
+			msdu->truesize += truesize;
+			msdu->next = NULL;
+		}
 	}
 
+	if (!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu, rx_info))
+		return -EINVAL;
+
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
 	ret = ath12k_wifi7_dp_rx_h_mpdu(dp_pdev, msdu, rx_info);
 	if (ret)
-		goto free_out;
+		return ret;
+
+	peer = ath12k_dp_peer_find_by_peerid(dp_pdev, rxcb->peer_id);
+	if (peer) {
+		struct ieee80211_sta *sta = peer->sta;
+
+		if (sta && sta->valid_links) {
+			int link_id = peer->link_id_map[rxcb->drv_link_id];
 
-	rx_info->rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
+			link_sta = rcu_dereference(sta->link[link_id]);
+		} else if (sta) {
+			link_sta = &sta->deflink;
+		}
+	}
+
+	status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
+	*rx_status = *status;
+
+	ieee80211_rx_list(ath12k_pdev_dp_to_hw(dp_pdev), link_sta, msdu, list);
 
 	return 0;
 
-free_out:
-	return ret;
+free_frag_list:
+	while (frag_list) {
+		struct sk_buff *skb = frag_list;
+
+		frag_list = frag_list->next;
+		dev_kfree_skb_any(skb);
+	}
+
+	return -EINVAL;
 }
 
 static void
@@ -618,8 +607,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_hw_group *ag = dp->ag;
 	struct ath12k_dp_hw_group *dp_hw_grp = &ag->dp_hw_grp;
 	struct ieee80211_rx_status rx_status = {};
+	struct sk_buff *msdu, *skb, *tmp;
 	struct ath12k_skb_rxcb *rxcb;
-	struct sk_buff *msdu;
 	struct ath12k *ar;
 	struct ath12k_pdev_dp *dp_pdev;
 	struct ath12k_hw_link *hw_links = ag->hw_links;
@@ -627,6 +616,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
 	u8 drv_link_id, pdev_idx, device_id;
+	LIST_HEAD(list);
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -662,7 +652,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			continue;
 		}
 
-		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list, &rx_info);
+		ret = ath12k_wifi7_dp_rx_process_msdu(dp_pdev, msdu, msdu_list,
+						      &rx_info, &list);
 		if (ret) {
 			ath12k_dbg(dp->ab, ATH12K_DBG_DATA,
 				   "Unable to process msdu %d", ret);
@@ -673,7 +664,11 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			dp->device_stats.sent_to_stack[ring_id][partner_dp->device_id]++;
 		else
 			WARN_ON_ONCE(1);
-		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
+	}
+
+	list_for_each_entry_safe(skb, tmp, &list, list) {
+		skb_list_del_init(skb);
+		napi_gro_receive(napi, skb);
 	}
 
 	rcu_read_unlock();

-- 
2.56.0

