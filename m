Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687780;
	b=VbVsB6TI4EEQMUx1n3Z/HB6aK+dci5ewWCT32L44cFAIp+pJMMYWa8+tOloaTEyFvXfz
	 fuUsgwnkaPi44qY2woM9KgQJaPwFOxL+04XU7sJXkW06De5aboP7ElsdoUZgUx/Jk3hM6
	 l1WU113+YLGrpRJn+U+AENOEfW/wGRY9nD7vjT5M8HE+J0uRrFZ9eDP3eBDUhf4fu4XuO
	 tpSH+ESFSWI7lLPEM8VG8LDJ2TIWy9PhPlqJo5YM7GejDnbUpYcpEdY2GNppOxIMPf1/b
	 Jzns4+uPWQg+XbyFpKOxbBllp8aN6+dNU2In6EQcXvrbE/6feRxtG7UQSXMITsq94Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=;
	b=mGBXsqGlpIa8BCOpaxKXg6Vh4KK7X1eIFHhsJU8qqjYP6xu1NnS2NKkqViiVNo2j4eTP
	 874+JfBhCMW0v/S5gBGj6iGfIUVy/Rwn/X1iC/M7SLxP8lHNoL9zcgmvSZUcBN1zbBfoI
	 nLoiqwxky89gsuieccKRWODxCrzq/sfg743PucMBs616gLUrMkAtt78W8iZ2TQcouVdVa
	 ighw9kYuI72hL2prWYq9jrSKsuVb63sYxgTamXtXCD5eYr706hmTlWjFWp9JU4o3b7Gj8
	 4zq6ra68US6eZuEPnJkmzjgjr9nuT7v+dzuuZ5qoEPqNiLW6wDs3AdylafjGY28Sfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kau4h5fE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eT2UlJCL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6C606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 20:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D6C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kau4h5fE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eT2UlJCL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpGqS621108
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 20:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=; b=kau4h5fEFH7eSMLn
	mJfml2RP1jaUypE7uZKKei3poLMqnjRjLp21DjJDSDWQi8cPjkdvM+JeyPd9H/4X
	WTqRe3l5jllIDlbzQ7HrXrIckdh1n6Tfu6XxCKnKSMGQpDYXUPDTpFiLnbArob+C
	oL9YaiceWOHfr5CEZjwAMrA088moWKb8q8GqudBFj8VmYLw5xN5s2E7S2EcXO4y5
	C6LMi9Lhuamkgn0jQKLJIILUoM5KjHqNj4T/UHCDEc+lncHo8HLLxLSYX/vl9FW/
	INHvT0k2hyWT/x/838AKjAK1fAe8sk6zd0aQc6RYCkr18hlnWQJb8dA66zrY5Yss
	hPOXGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqhntr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 20:22:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3346682eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 12:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794687779; x=1795292579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=;
        b=eT2UlJCLS9DjfYJIK75wmrlmBJfnQoVhjyAR1QYNNdrIS3JTQn2b9pXglaHJS/nszr
         RmCnyIPs1KgWVzRzi5O1eoQU836Bq0V5N72eypESFbhdCIiniGuG4VYC+BdIRYoZrEY8
         5WlpdAXt5UMFJ2s7QWzACoC2dQQBRkuuNby3X2ihusvbqbLIiSvGViIzvHgwQ7yWMXMd
         IQitYw/FUMt8mdbSZX8eHqm2gQc65YyBPJSpOb8O335a3Padra2+gIGLmVA6fm61P4Kb
         kspYNp46U0aaHEqUsfoVrsNXfguX4s0vNvhslt7080lls2tZ3v9Vxeaz+nvRT1E62Zjz
         l4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687779; x=1795292579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gh19ilZVJ3SurX2jL9t5jwRwJXCxBkfR2uqCXnVcRA=;
        b=1QANiaj5ks5SyzqpYUk3mqtwAi3DgjL/sPpDWKXf0L9pPMhgK9pA0rou0hKvH0c99w
         wLCkCmim07letGxK2CpH9C5BdlUp3k6S51KL3T0nX56smIOZC5tQo++7SVx5lmwNqz3Z
         ubTcCzo0yECIyrX8gs0KhbeXJAKDyk1pGBNSADw+0Y43qYDFUppCeAuUAHWfPc3TNGT8
         J2tLzYntfa1G1XXJ2vbrikfgwoiaFxYGWkOr0Tr50DvKdL1ivtqgP6TsZW2SbGxu0QTd
         X7Tr0lJTDiw9riCOPk3sLvpaUoRBBCe8DOtA46vSjpvs97jsQvAUFSq4qvntYYEZAelD
         CmbA==
X-Gm-Message-State: APuU4Z/BiFS3hB2kLDxHS7mUPZF/uAJgJPSvF7rYyBuplGSFtkRGxnVO
	yGCuqMcrqcox7zUA6NQPlDQiRg+pb090j7pAHSVc2IqZ4c1FY5DGhrLQxz5Z8b2+auqhuSL/PJv
	0enOzPBIkM3MwwJzuaI283JnPae78TdAQutvp1t1Min9yuteqciQi+gXCS4HYca1JUFrHprLiv7
	ck4Q==
X-Gm-Gg: AYBFou1u0uE7FqGKI2P8dKLa1hTruNqn6yQpS3O+X8LcKmPzFaMvZ8pwfCmawDMKJfC
	T4Vo5k31vqXOdCQa89adRBJZIo2R745oTzlBYIKUUmPjRAEUQpUxFpm1QjzNFPIO9RAQfiQIK2u
	5Da1axMTAzt7Bx9GdureFvU8bAYAtWursTGT18hv3jxs+XOwgKFHc5uLMeTHMok9rCnhpst9wPj
	AeB+eN+iPaIv4Hd5lpAHax7HIkLOkoQKH7QUjzV/eveiygvHLlizbXHel7TlTYsI97xmm1jtQTX
	ruvFRQUJIhxYvB67hs/BLg0PV/R2c5EuWarhqECq/QRWiEs+uUBUy7ZLTe5xzXjQUwsTIosSLkQ
	GrfFjuHm/+ohfxVjaWBJKyo3hizMbx6esjFYK6H+/dNbt8aB2aQRlAAZV+FYOCHrld53Q4zcOCW
	b3nN6gFssusg9+WpjkOXbYr6+GpV7s
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr6611954eec.25.1794687778411;
        Sat, 14 Nov 2026 12:22:58 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr6611923eec.25.1794687777595;
        Sat, 14 Nov 2026 12:22:57 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm33215643eec.21.2026.11.14.12.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 12:22:56 -0800 (PST)
Message-ID: <92d632b3-3aee-4786-9c89-b106b66a32ac@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:22:55 -0800
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
Subject: Re: [PATCH ath-current v3] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jZCYgLhK4XopkHLdbIpQ1Ia-fFjtiXDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA4MSBTYWx0ZWRfX6xvijgVUuZkg
 N251TQ+kUkYY8u5cvtwio8NsELaweMdJ5PvIf2I9mrPCseHN0384YhBq4nTtsqxyKyydNAgj/LK
 5mOrsu3L3uFI4pbWjbr5OOUSzdWDcV1dhlKq3I7NigLdSHgKrbZr05625YmWN+ADgNEdt7DHde9
 h1m24xufVfczyT+IvWvQt2KJhNXLhGlM+1oOo6o2vtaes9npIGYz/G2qHI6sz8wZrRn4Y/frM1C
 YZWLk9pCSP5iyTEvvAsKLPYzBYTa9FBgZGJf9xMQnhU1T7M9OxOkGhiYdbG6KpofWL/IzWkJEOP
 6CBJNiV1zjo5/HzCGW3DmdN6ur4LJexZJZQPE6mxuMurCjb+0EouP7henbA7bwViKE6QAW+mEOE
 ofaBKtv6zUOrhjyd485jBDSJbVEx7ghYxjQaBJAy2gCZrGirlbGbUtmJ/EoprZf7LO5m6z3vAQi
 yWpFogsccdWgwtkvSaA==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af8c323 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2LnXmgUbajm_jcWkuQEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: jZCYgLhK4XopkHLdbIpQ1Ia-fFjtiXDG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA4MSBTYWx0ZWRfX+TP9bEiKBYOl
 UCTJ/RV1Tk68xDaNlhtVQtH5daD9OmFE6l2xFDzMq84AjIdKtyI1t0LgBvnkkLWqUImr3wHD2Us
 8FAsfwdqvVXidowhk5znu5DE6d1ftnM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140081

On 10/23/2026 9:49 AM, Lorenzo Bianconi wrote:
> Defragmented MPDUs that are re-injected into the REO are mapped with
> DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
> DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
> map direction, so this violates the contract.
> 
> The mapping actually spans both directions, since the host has written
> the buffer before the REO reads it and the buffer is read back by the
> host afterwards, so DMA_BIDIRECTIONAL is the correct choice.
> 
> Add a common ath12k_dp_unmap_rx_buf() helper that selects
> DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
> ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
> in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
> with DMA_BIDIRECTIONAL consistently.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
>   ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
> - Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com
> 
> Changes in v2:
> - Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
> - Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
> ---
>  drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
>  drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
>  drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
>  drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++------------------
>  6 files changed, 31 insertions(+), 48 deletions(-)
This conflicts with recently added:
febe1f8cbccc ("wifi: ath12k: avoid double DMA unmap of held monitor RX buffers")

Please rebase.

/jeff
