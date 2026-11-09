Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202369;
	b=j52bBezdkORW/LvtEq8CnMMw6McaI9eIRLN9kcKADp1lmVJ7uArfQ6wpujItOqRCWjpW
	 rYGxs/xwVy6Hq1ve7U3YtFgA4/jSQapM6kzRdVx1b8p+pP01c/x6UWFI7fkLhkQEHcVoz
	 05Skdkf3CxDe/OW0G44uvkhd1xBkHuEWTH2xJlj8ves6hsdzoV7jPq2/RpH1/cjro/yBn
	 L3JZoknZ+gzeV6T1KWNI5jZ4n3Q3H3FGtP2gjHdA6AGI1b6lc8SAwNDB/PWGYe/7pgrHm
	 ZIbgI7B1opxS7Ws6eRGhRrxrU+Q4tzraSf6uAWtvrGK+5DffJw01pvgj3UsPSqpSS9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=;
	b=bK/ZlBWuVT9cWE3R4Q4z1C7lV0+w6lLnfojUOePr/pritk3QmI/mFN+cLzq/9U5nEQBo
	 a6XPXrkXhDMivVNaWXVhUoEVQgYSna0d84bep2afuxz7DiVywyC4XZ1yuVZTgoo5bb6QQ
	 i3d+goI4ITjAs03LHbzuKVt5OS0X65RChgEFJ8xfDjj2qHLPe/ZNvuOKrAyxltmYhRX+b
	 IGgmeh0jjUiUMBNsoLXxwOM5CefSyhjdglf4GA589xV/NTBdSqgX+Emp+1/lnImt2APPi
	 y5smfa4dKiIImGOWS6kG3qipvrRpJ7Iab75T6ufHkPdhJ2mMf71x7uFqv29bNMZJiiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LoC0ao/2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVBZzdxG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A2D606A323
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 05:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A2D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoC0ao/2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVBZzdxG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K4kT3222719
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 05:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=; b=LoC0ao/2P49Zffqq
	7MlqpXsryEyjvqrTu0UWpyNLuXwh5xrMvkTE6J0cyw0Jn/Phswp9NBq9BAJ2NNQs
	HI305aXlXqQtK4vDvjYenYT1nX02wKnJX0m27UIT+EvBXVAn3BoMRwc8wDlUnjMS
	NIH5aAcce26i6JeoSDf/ZbjmEe+OFt7IamN5trJ1zdcgjJEYybZyR0dGls9AR/j/
	xabF6kzUJydgoEtox/DVVK2OhD33hwQWsN81e4/3h80UTg2AYhfOFv6fdWO6jVWY
	Rf2nwSpCj9l0Oh9sW9sDVg3IMMsV0HOXJ5dVLXRwLuoHY0uiY/S0Pygc1m7kKfu0
	Fa6Uag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv734r29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 05:32:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so618550a91.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 21:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794202367; x=1794807167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=;
        b=IVBZzdxGkgcd0GXQbiSo9gdyzJfJtwDBz1lbqIpQgH7phQcAyqOYGHthRbit83Jc8D
         zSvc2fQKOC03K7s5qPAAZXIUy2cWipmEFPmvgVJcYCrSCZthbuBhZhWM0wopkzkCL0am
         KGncs55AEffKhLpm5FXL7TMDvZzf3Tdu5TuTk4IGnCMR8wQsU12C3scQoD/QIXl9siLb
         k4lucjamOqfAJo7lmTHTZog7LGChNvt/mNOmhJ7TjktkelLhJr5i3BpCA4ElNG05S6k4
         QTAdxTUyh9PoAmyJhWBMr4nNlxLGJjkrEEXOHbO7lHw5gO9Jj7Thar2yhIbhg+Tpennx
         9V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202367; x=1794807167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmqHuPAzZn1DNiHHKILm13x0Y5axH8HFFYvD/AHS9iI=;
        b=uJk+ONz7wAx8scMm1+Nafzsfc9HMAdwArLC6CjTFpruJ+fg2hG2s1DK1LqaUM98UCJ
         4GIh/U7nW1JVqTzj1JI6DrR93MsaXueAIVWxceXYPp8a2k5L4pk9lMBmLCjFwWQ1zBHe
         i06jKi5iBzuSdYRXLhVfUtOhW4oZRpWYe6xXlqVzo7YHM5ttLT3CtlrQqv4xRnNlVQS/
         ZeMznK0m29aRINvcSyUEE9ebfBVbhlHR8c5drBXta30L6QwxfKSum2lqtkaSD1lvlseV
         oWETUALEFQRxGvdXsqiQa9+6USe1DLHNKawqAUkH38u8VKaqaHnVQLGm8LVu0gmvzFpv
         8jGw==
X-Forwarded-Encrypted: i=1; AL+hErGn+2BzJLKA8tD8b2NPc2pEeP9MJM7chsJuskrckrk3p9sJ+a4arw5k7VOxeR3fzvKkdU1XwHnzB4OtPpEGCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uv9Jn7xIw7meh4iwtymw8W02LPbnveTcgn+GgflJZyBbrB9fN
	2mNQ4m5j0x4vzg85RxRv83tTRBInpBcjNxnmr0mkPv1NciAf+AimMT1s6HjzKbNljm2nvYasitA
	JIi4oKaHlARE0fcUYaAloiARyUu8fwmYw/OeNmVT3XFwuLlqqoke1BWkZMXVllH8FDyBENA==
X-Gm-Gg: AYBFou3m/L+/ciWjrAQiDSHnnxABKJzex3pyfVs+5xmxifqwlDLfJ2e/dw+lWkV3EcA
	VWlijee8XqxvikMVSNgIvfC/7614o213IYUq+IeAIPHlEiNZOMzs8uav9MpDqH8NFfaL/WXQ91v
	H8MhN8bWxpS5pkUCbXhaFNUC6j1N9ER81M+hf990FvObeqkFgIlW+6b4Kky7fwK2dBfmMkpv8HZ
	Aim+hy6+FBQSRHLeKYtFoavHToB0ALM44FSqbz7KV7OfzqVPadTzRSXmSjq0M/QTjZshR92ffJJ
	QES7YbHPjj5ZMqth3mAkzd4Aga7Hg4luBwwEksnLbqVS2MZy0p4U6tWme0+ZTtu3vY3tALkDsFO
	FG/AWL8+qdphJC9Z2Z4eNDUiJbCZy8oFdqKDRpGMzERn0CAUsJCKbhnzPd04dceX2pmFBftK92Q
	IikFEmkOC9dXntFHp7OSvQR2xf5UsqV2RHrLi9SZRXEDRRcQ==
X-Received: by 2002:a17:90b:4410:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b12d329650mr2967590a91.25.1794202366967;
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
X-Received: by 2002:a17:90b:4410:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b12d329650mr2967572a91.25.1794202366429;
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm3096629a91.3.2026.11.08.21.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:32:46 -0800 (PST)
Message-ID: <f927dd05-ccb5-4eee-b32a-a1f03aecae4c@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:32:41 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: rely on pskb_trim() to trim
 the received skb
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh
 <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
 <20261016-ath12k-rx-avoid-realloc-v1-2-0ce6cd99dd5f@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-2-0ce6cd99dd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfX65BF0tv1LpbC
 FrI1hrwxnD2SsvQlnV5nwh9AyVsxpHhIAs65Rf+zC2XmrquS3NSVMvbJsVqWSPwT9ATRqBAs47X
 ePnxKNL5LDlisW7YPaigVEY7vkBW9SfayaZMKo1i/RjPyjYg/J0Oyc8xC9hFKqC2LA1At/CqHuF
 81gvh/hlVP4j/H/5zp1OxT5Nc4naTGxtYKqLVeWqXi1UuqKn7cs/m9ZCglLPLszd5fGUOSwMqhU
 s18Y7vTYHTEiIrTaplsZrC+HF6I/Tnsdj/7CYnmDHEaVZupwH0ERWib10ZaJHrZc3gX/DV00oFj
 YS+DT7vrwQAejtvEXF5g5EARNPrplAd3zTCj4WxbN4egNCmoaPv19klhw7OT0gZFJqMvms8oYlE
 4KG12qZclw+0Ylc93KRcWdQXFN1Xv/mgbrpeHH+gsEzvASe672rubeL5luk7o1AeuckBCMWteTR
 yrJe+qR6cVr5hKfu6qA==
X-Proofpoint-ORIG-GUID: XBPbVN5Ak4qPkbC4LrD_bVZrDkI0yoBf
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af15aff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GHdboaX_DFjh2CRH6W4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfX985iVgEsQeIS
 kgYqOX0sHQ9LJw4eniRxb4PjM2D3TZKHVWGah+55jFAFE+iZhjj2Z4jNLCK8G7MWi2NNg/NIQtc
 q78GsRIoDgxwY2VGUYEznDXf+3kagYE=
X-Proofpoint-GUID: XBPbVN5Ak4qPkbC4LrD_bVZrDkI0yoBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090021



On 10/16/2026 11:16 PM, Lorenzo Bianconi wrote:
> Prepare the RX path for handling non-linear SKBs introduced by the
> following RX batching change.
> 
> pskb_trim() can fail when trimming shared fragments, so propagate errors
> from ath12k_dp_rx_h_undecap() and drop the affected frame instead of
> delivering it with an untrimmed FCS, MIC, or ICV trailer.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 48 ++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 40b8da34268f..4f37ef12e40f 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1010,6 +1010,7 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	struct ieee80211_hdr *hdr;
>  	size_t hdr_len;
>  	size_t crypto_len;
> +	int err;
>  
>  	if (!rxcb->is_first_msdu ||
>  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
> @@ -1020,7 +1021,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	if (msdu->len < FCS_LEN)
>  		return -EINVAL;
>  
> -	skb_trim(msdu, msdu->len - FCS_LEN);
> +	err = pskb_trim(msdu, msdu->len - FCS_LEN);
> +	if (err)
> +		return err;
>  
>  	if (!decrypted)
>  		return 0;
> @@ -1029,28 +1032,47 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  
>  	/* Tail */
>  	if (status->flag & RX_FLAG_IV_STRIPPED) {
> -		skb_trim(msdu, msdu->len -
> -			 ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		err = pskb_trim(msdu,
> +				msdu->len -
> +				ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		if (err)
> +			return err;
>  
> -		skb_trim(msdu, msdu->len -
> -			 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		err = pskb_trim(msdu,
> +				msdu->len -
> +				ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		if (err)
> +			return err;
>  	} else {
>  		/* MIC */
> -		if (status->flag & RX_FLAG_MIC_STRIPPED)
> -			skb_trim(msdu, msdu->len -
> -				 ath12k_dp_rx_crypto_mic_len(dp, enctype));
> +		if (status->flag & RX_FLAG_MIC_STRIPPED) {
> +			err = pskb_trim(msdu,
> +					msdu->len -
> +					ath12k_dp_rx_crypto_mic_len(dp,
> +								    enctype));
> +			if (err)
> +				return err;
> +		}
>  
>  		/* ICV */
> -		if (status->flag & RX_FLAG_ICV_STRIPPED)
> -			skb_trim(msdu, msdu->len -
> -				 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
> +		if (status->flag & RX_FLAG_ICV_STRIPPED) {
> +			err = pskb_trim(msdu,
> +					msdu->len -
> +					ath12k_dp_rx_crypto_icv_len(dp_pdev,
> +								    enctype));
> +			if (err)
> +				return err;
> +		}
>  	}
>  
>  	/* MMIC */
>  	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
>  	    !ieee80211_has_morefrags(hdr->frame_control) &&
> -	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
> -		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
> +	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
> +		err = pskb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);

Both IEEE80211_CCMP_MIC_LEN and MICHAEL_MIC_LEN are 8, and MICHAEL_MIC_LEN seems the right
name here, but it is unrelated to the pskb_trim() conversion. Better to mention it in the
commit log or move it to a separate patch?

> +		if (err)
> +			return err;
> +	}
>  
>  	/* Head */
>  	if (status->flag & RX_FLAG_IV_STRIPPED) {
> 

