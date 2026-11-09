Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202376;
	b=KIfN3WUykChP8Ky+Cf7h+tSWiw86oFHJKRjlZeTT/JspmV6qPt6Ze9C9dEHLuYT75A9e
	 e1FKFOZ+igrqMlkMI98IHMRL44BSznSdGjDmSaMXG3zd6oTLRPlLyI0/rQlbN/xwk+MxP
	 6kpGTJrZ/kIuBZIFbnGaHuLqLaGTVBGb/EtzgaM5/nsvX2iHmI1UlExlCTcXd8ulJXf9K
	 BrER2j+WilrKOCn3WbxdgkijqUmCOFqntHc/e0pIYh1D4Hby1Rj1M1LeL8Uo5zij3iOaE
	 t9PPYO9nUwN5UFFQHSziuCPq9AEJdnRKIX5ccunn8UVBCjJEOFHlboceoLob7DnS4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=;
	b=lBeuCf97nERMhbh82Imq1tR8LmkdT3DQr2OWAbCHVK+iD+VFJnwfHx7rfEfhaYIaTt0b
	 C2fEuTsw6ST6rWyL3B8GyXHMyer//ENz0aC6ajl2YjE8bwo0MeT24sRdoErvZSWMX0mAe
	 M9RWxupEfnt2f5sNoXt9Ogbq7wZYwGHkzJIAItLmE41XtB3a4gyrdTA33+h4cIztkEW1z
	 JVCayHcaMdlniIfq28AfZJDQbYS4dzhGfgHWMyLMvbAKZ9ItQvVlvtoAcT8GmWpHEAurZ
	 mQPWBkJ51UD+wvDbJxfP2Vl8XKgtQ+1lYG59FWxR6OY9T7EoopnIjYmPMYiVkUXCQHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPDMlJYS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAg2ByrU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EB606A333
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 05:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173EB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPDMlJYS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAg2ByrU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93Jv4p042058
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 05:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=; b=nPDMlJYSrPzrtjMg
	ZKcDjQ7BK/zqx0h+4G2JZ4BMluWz3Z70q18ZhWx+QvzFZkIk5NNdQLnLE9T0a9Qe
	sFDwNsoLLh9nI6BVVCBzmZDb2BaKsXhBm7qBm/PK+UghJeTJ8Vkjzd3s5Puu7/HL
	qY+l06rROO9RmshsI9QhUkl6Ikml/Y389uKVnMCkINU6tPVAzzsool6PGU6gUf6o
	IbYMYnpfpu2xTdkeob5ZAB685OSmu/Spb6Vrbdn5a809TNuyyYEGYH2SF7XNeWBn
	M7QScER98AMfHF5Wh3tCPlAQK7yUj6EClTeuj79aLGhYgtmCO7JZBRuG4wdH20jw
	UnNA0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf54c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 05:32:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so463504a91.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 21:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794202375; x=1794807175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=;
        b=VAg2ByrU/5NWbpUmMc6UU5gcEhZgiTT1EY3M9NTokB9SkuozdZwSDKG0nVAMAyPJGu
         a1K1oGR2C346GX8HPYKv/LlMaZqHrlgcrOGnIrLIXE2NUX9KXuVm6oNfEyZpFkaApulg
         xv6+o7F4fmv1axTSiLEeMV7xCZNTfyEXzWPJVkEDsP313Q5UcLFaWTA6GP94f89/KVqY
         WbTgAEqJqsQci4dyTyYGdKCVk8EUqvlpt/HSP4Jp77uoR9Gdt+oE6Hhnaa640FH4E641
         Y7A9tCHo2v1L487vHAqssliFR9yJs+8fpvHwI0FTn7eElbeQB0cmKGAJW39PnbMxqFwr
         EoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202375; x=1794807175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7RRgfA21WlV7i8D7fmlmt9kQAOg5FueD4hA6+UfHgE=;
        b=t+ughTAfhQr/euBIQe4e+FIRMB/sgNf2SZC02Crr8M/RARd+zijhv0jBPbf/18ylo1
         b/ZjpUdmXMk41lHq0OCel8daEq5M+6XI/EJqYDxWR2QQReTd+uUNieAufuP5O8HaMNu5
         AEewAhe/fIXz8sK5rKKE21fjW4UmUReOUkMWDXAF9ObjxIdDQg39do8IBSXELFMVMAZY
         TDYtfFPqzlnM9RbFl+CJmq4sB0Y11JmR/K387sW1f2Wd7KaHpWTiN0ppiTAyEYDlnxjh
         nS9SutP/tJauSlco/NmfrT8FSFo2IelRBafTDlKx9IA3EiLYRnMKeP9PuRn2CiZSYy/g
         iKxA==
X-Forwarded-Encrypted: i=1; AL+hErF+qF1a4HDMsPhcwyOH/sXptrpaBz4NU74DyLcwnYKBInTvs5CO9DeDdcbACRYz+Uplo5jsqMX+fDGFRUdyzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dOOevw441iJEMoPT7U27asc+YOgsyTm4sJOrbNzWc//EKF7/P
	+GzpXShujBt520hKbKA5iel0EoJ2pWp7XGAy8tJL69wju5V3h3RpQL++YzUwRJyCFRfayu/eoyA
	OMM1zNqAuTPhtBTfeXMcmLEtf4SjGqlxsKTD3byJnXtI6nvgpQr3pnyPUFTjiSUT9G9PovA==
X-Gm-Gg: AYBFou3rQ/GntDUy7vHLH/2QXtEwM5Us2axe2lsbcJkHfMx/519XVoyOKU7cTAAr0+e
	2vU4x2EFeFsUjpskg99foP4CfmfZg2lYXuYG7Ye1pLfjKyr5Px0fKkq6WFEnt1186Fb1tlVTDaa
	nc23+40EgMJo+N95v3wrUAz3yAAdcPXtllp/O7y7WXvX1Q93uX7NMYmKMpmW/SlTizLDwEaOKev
	wzBTJwKQpa4gbpa9ncTazMNzXd+EPWNAWm9SoVlSol2z2AwsZECC8soiRbaFxcHrcp5wTH0A/YO
	hELksDR9muZuq5MVVdmbdONfGIe/ZO3M2aQGSWPbOuR8HpShDdn8VVfaCq79BqHMmZAnwv+d2er
	vjkJwjHrIYrTeAgPnj+TVVO+LtT8jDrBui7tZ+9dPVpArr+rni31dQX20ZrNsairKCMhUrVq0Sj
	wmzqLfHEDTl0xicScscuwgf4gbOll5uFPgmpnOeQqUCI9JFg==
X-Received: by 2002:a17:90b:164c:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b12d41927dmr3188502a91.18.1794202374505;
        Sun, 08 Nov 2026 21:32:54 -0800 (PST)
X-Received: by 2002:a17:90b:164c:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b12d41927dmr3188478a91.18.1794202373940;
        Sun, 08 Nov 2026 21:32:53 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b139d0a166sm3096629a91.3.2026.11.08.21.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:32:53 -0800 (PST)
Message-ID: <4ae460ec-fe87-44e4-a6d2-e1d7f6391fba@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:32:50 +0800
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
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: validate RX frame length
 before undecapsulation
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
 <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-1-0ce6cd99dd5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfX5vRUEAJgXxHf
 v0hezWELWxBal1YMhZ+M/Xcl3xvzBOlIBNtxmxoKAVuNmFpnRuaywxgkw29QwKr6GAVARTfHqcd
 /Aw/I4emgcSxWrtIWURVl2fgeTMPHxM=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af15b07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7h9L7HgKJt0xFB7aMYkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 2qw4oBROZ0ekXh3tNOptZ4uQw5HXF5l6
X-Proofpoint-ORIG-GUID: 2qw4oBROZ0ekXh3tNOptZ4uQw5HXF5l6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMSBTYWx0ZWRfXyeI8VwN6Vz9l
 LvTHSpX7BC3iKdMugrGlkPJWu+wKTbTZG+vmVXfUb8t6eZ2gE0MrpE0sKA6B51SwKWi7BWWGA51
 pZkBpFDUKjkYSIfWmyaHIcVANa9qhanWJiK7V8aRg1ujdkWNSQ6Thw9gly1CY+D2WvIZydez8Or
 9IsyJRrpMDXpiyrCibUpY2lHV/9MM+Ggs1nnaFd8h7KC0gvzF40EZ+4fbe9Y5v5akMpQyALieT8
 ZMjg0BAPYaaE27cNcjRE+BUkd3BjQ+Aij5CDM+zEotqYPApUtAyWlcZO7qs1pqi2v++ojtNmfNP
 TysJ/rZawuJoCqOV64V3iKciy9N9jbDyOyu8d7QdZEX56CcT5hBbZojluI4j4e2zDfiZvddrIEH
 2eTP3ciBBAfmOaR3uIlVby/lRQITDfvFhxq47SmiL8KCR3ZJHxTSO7ySKVFI8cvclmXErTHvX+9
 ZsXA5K4cXb/6eOomugw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090021



On 10/16/2026 11:16 PM, Lorenzo Bianconi wrote:
> Reject truncated raw frames before removing the FCS trailer. Without this
> check, subtracting FCS_LEN from a shorter skb underflows and leaves the

skb_trim() has the check itself, so there will be no underflow?

> FCS untrimmed.
> 
> Also verify that the frame contains enough data for the 802.11 header and
> the crypto header before moving the header to make room for the crypto
> parameters.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c       | 46 ++++++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 +++---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 22 +++++++++----
>  3 files changed, 51 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 36be543b7c50..40b8da34268f 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct ath12k_pdev_dp *dp_pdev,
>  	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
>  }
>  
> -static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> -				       struct sk_buff *msdu,
> -				       enum hal_encrypt_type enctype,
> -				       struct ieee80211_rx_status *status,
> -				       bool decrypted)
> +static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
> +				      struct sk_buff *msdu,
> +				      enum hal_encrypt_type enctype,
> +				      struct ieee80211_rx_status *status,
> +				      bool decrypted)
>  {
>  	struct ath12k_dp *dp = dp_pdev->dp;
>  	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
> @@ -1014,13 +1014,16 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
>  	if (!rxcb->is_first_msdu ||
>  	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
>  		WARN_ON_ONCE(1);
> -		return;
> +		return 0;
>  	}
>  
> +	if (msdu->len < FCS_LEN)
> +		return -EINVAL;
> +

every later trim in this function has the same problem: msdu->len minus the MIC, ICV or
MMIC length is not checked either. should we add check for them as well?

>  	skb_trim(msdu, msdu->len - FCS_LEN);
>  
>  	if (!decrypted)
> -		return;
> +		return 0;
>  
>  	hdr = (void *)msdu->data;
>  

[...]

