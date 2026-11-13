Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595614;
	b=KrDPw/4HwHHpyEGMTcRPWdWQ5c1QGeqVl8QRaG0DjTPEDQgFhUXOsm7Va2WqI6xiXI4p
	 AI00M4rduFt9cg6t9aKODpFxbyQ1Pg/SpIoq6QtrLn43DjamrlHT02tKyhty2mRzaaLfH
	 Nydhd8iApSqOPjU3Hir7uLEDh2Y9Kz5ZQoWjKV23DKNUukF116w4zVBMuFab+X0vitjYq
	 k4iBhaJ8jzPgymvs3MkNHxCS8CDxMmmX9yPzHgn3MiJy/SaKhyoVfCJPu2IAdWzFAZbua
	 EmMC9fLMrZOG7A+nqZCR8ZVm3KgB4WDSVMbuR7orOo/IpT7dRO65YYH/9f417eP9RlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
	b=sRLpoZG5kj8zqkmHJ1mzGaZ8KBRN5FAPrMpt2nf5LCELHRCCqI3wYnuRZ6exR3EcDxgA
	 fLpsnACLmrguvHklPN1W2hNv4ZiJSg7min6vuh7fKCPX+plO0DeTh2vgGhhNve36iKjip
	 WLFIkLixjIgnoB4M6VNA6pyhZN11K9r4e9KZY+jc/9A8Go93QGmzGm6tZImqR0ePSWKJc
	 A2aLgCHqhVuzqnELn5KHfAnrp/8Y5lL2N+N/8AtOu1cx+/cA02G9VRkkQkBl/zNAC9WR4
	 LUyhdmpn1Q+y9udU1ND3LDe7C7wUUjGcGyKbC5kYEAiAcvsCygslnF0gxL/oI8fF+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjXQ8iLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGCpD1b7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DF606A32E
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977DF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjXQ8iLw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGCpD1b7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6j7552058
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=; b=OjXQ8iLwKb2S8LVw
	F+cjhGVRixVci/FNEaTftvthjBNd/xONf4XxhS2Xd0qgJPH5KL4YbML1t5O94SEs
	FlJSmAqJz6vgKuwkwPCn1P7Tb3pMX7I5A4L2Y6BSnHG6tajKFG9t33gBtyAbMuLR
	qGIPmpu6CkpXYALFrf49TKvToyJr6DF0sRZ9E9RYvN5sZosJPsXkDj223Kco78Me
	cZsfPhmx2An2cVnvZj6X3ErjpRQizeshpgc760p+gn+mFwh0rj/5N97MQzQbxfh0
	kxsooryBQgmAbYkCgjLeMj+HQ0fYph6eRKBBtmUlutvzEN2mIWhKg0dYWEV8dBtJ
	JS7kaw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcb8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:46:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso3661290c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595611; x=1795200411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
        b=HGCpD1b7Ne00z+qYU59BHvsqwHygKP2JUZM4mU7Xpj9BlsXwsYtp0q60wXsrHe0CFb
         fk4c7izB26YkCdy0zd6qljvoo/luxvJBW4lO6hQkOPxGnOUiP5MiREwCvY5fF2NBNEzZ
         ZKFAJ2bmHw72Ob7uHGNaNJOxma/8fbSylV/lVi6SWDPFCynORYPrEDqouQhNK7gKqJso
         Bb4Nh5MJYtwgrG4dsaddgZJwwT2QxmbmDq7+yQ/pf50L5MVcWOGloEkPOl8YLVw1RqVv
         6x+97M1DJdjLR5AMViawQrysHqGlax2m74kjndAc6DEntosBbOQml6xSPUwiqfAPSque
         TqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595611; x=1795200411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PinDE2prX+DRkMjrh0ahpCgqYmCGeGokw4kYm/6NWsk=;
        b=NLtveQGdzyXirIOxKOb5l9vPJusw1eRHpwvB7CIai2FgF8MOxdCdkMK6ls5G0nLNid
         hMyeBhX0ElOfb47JgxhT8OurMkB7lXgLrU/7ezxVDbBPG8HSAxa3XwcVodeBh2HeYNow
         RAb6717KMqAnWy7BYNxeVeBNpas/4oo0/MIjUL/dVnj5Bl3xsBldCA+S9oQpHe1XCR0F
         2bt3rm1BFEXEMyVIRBqw6ztXL8sUqY1IVmBl2jIQh6KAY2xSuPtOBiB4RImNWjs94sHA
         WbR7x1MhLI9CByM/42sCEp38GwYy0JyQOI85L/ULV/2rDEYn7N/5e2Hat9vpvJiYq3RU
         4W7A==
X-Gm-Message-State: APuU4Z/YWwOFvUYxH7zjxL+hvIO0vuRML11KnIHbjawXfqTT8kSMOD7I
	mcu1FgrF2VHIYceT2fHkdsLYgas/tLB2eIw0A6n3M7r9VAC3H8zMtshfQRyoOOxHcwQ6GG4fgKs
	5GUB6grHsBuMA9es7IHHLC9/7WnvERp4rUFAtQRtITuQRh2K6EWcH6reECf6njw6ls2RwvQ4K16
	G1
X-Gm-Gg: AYBFou2GdhX7dceS0W8v33t+5SGfmUzMUV1vC4LOxyNAfkAfmO82JtQEtGNb/kfKjkq
	f77/E+zhoIIEmhKItjg/x9h4c33U34fKD17jRDEisY4qXNIcbgoE/cW+nmkQKjpMrrX0u3vxv/F
	cfzvxGEZ7Z8jvD9n6qlnAL+XMKD1A1W/fAFWuFtQ9lrvE4TTWWMsn3pq0VSQJkvD7YWFMB7PuEJ
	GYoMwe1xBrQmdwcylXe8QB1geNPxFhmxjCzREhkR5oJyjdS6CUNxUIO33v2JDsCNAN7aDjOMIOU
	nfEaMAlbjaajjfUCn1peSBb1c0osxexa6fzF6TsrsQ/Jt+qM32gI+Jrztw/OltzK0jDAx8gKGSR
	jg42m/rSTIQIg1QphdMYrs9RjFBiHLWeVWPBcilfReu1t2njiNHcxLxu4iLMdCTcNj5yuNMxIZu
	p9EaRF6CH3z4ud8cJzF/I3oB8EpQtRgAJRmmKRrRBvzQ4B4lZOhJF1+8gFFdf+1+rr8g==
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr3358953c88.28.1794595611344;
        Fri, 13 Nov 2026 10:46:51 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr3358935c88.28.1794595610777;
        Fri, 13 Nov 2026 10:46:50 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm8484709c88.6.2026.11.13.10.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:46:50 -0800 (PST)
Message-ID: <c0589fa7-3a15-4f33-adf7-743d56f13daf@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:16:47 +0530
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
Subject: Re: [PATCH wireless-next v4 13/21] wifi: mac80211: apply SMD BSS
 Transition STA sub-states
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-13-62e39487f51a@oss.qualcomm.com>
 <f4164ec832b8dab5da90ddccc527ddcae74a44c3.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <f4164ec832b8dab5da90ddccc527ddcae74a44c3.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75b1c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=09HMBOQARD8bikJQYYUA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: CRjzIfLdckpw_uYTrUMeVDA5Q7qReE4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX2663mjpgONL0
 sCcs9vbU0B81DKIQZyBq8XNxSbQyajmtfNFpvy9fq7DKixhO4kD+JNbTB6fggJah/cE1nlfogVW
 WifmWEEmVtFUEVPPqOQAo4a9hDGuDdWb+kKyzMuvYgs+BadTztQJWK+njduQeop5rlpC88D8EQy
 7Cd6FcUd0BFw0HgDOr7N52qnkvOfWgF4l7NlcXuhhgWQFbrK2uKQ9PqxNmDR7R7amdi2Tvhxq8j
 vIQcCQcnGhkl/O3m2nd10cbawQidvxLYzgAA7f/LpdsrNG+jWiQYYxQni0vZtA/zY9W1oZOwaxy
 L6NXteAu/gI22ldudNlcpjI1c01ySAvtCC0RntZITw13BgE1ptkc29Mn/obipJYcMWB0ahS5UHE
 mFO2C01wyLCuYIUBiYXW2DLpdspVn7B6ZuzFyoB2HNDIgg7wvL8B4fuZ47G61tZpwd/JtS9+f0m
 PB+sjR45GAggUPg9hEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX6xa5ObSJCvmG
 X22IJMNwNVjmyqly9/0kNWVYw5KaHlMgBBFhCRzZQBYM/lSIymbBmkdn3OYbVWIjL4CB6+uXlBs
 BO24JcRvoWEzeP7yi9ZVRBcSFzAdIvE=
X-Proofpoint-GUID: CRjzIfLdckpw_uYTrUMeVDA5Q7qReE4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074



On 11/11/2026 01:59 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +static int sta_apply_smd_state_flags(struct sta_info *sta,
>> +				     u32 mask, u32 set)
>> +{
>> +	bool smd_prep_target, smd_exec_current, smd_dl_drain;
>> +	u32 expected_mask = BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
>> +			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
>> +			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
>> +	u32 smd_flags;
>> +
>> +	if (!(mask & expected_mask))
>> +		return 0;
> 
> Not sure I'd call that "expected", it's more like "relevant" (for this
> function)?

I will rename this.

> 
>> +	smd_flags = mask & expected_mask & set;
>> +	if (WARN_ON(hweight32(smd_flags) > 1))
>> +		return -EINVAL;
> 
> WARN? Isn't that potentially reachable from userspace?
> 

I will remove WARN_ON, there is only one call stack.

>> +	smd_prep_target =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_PREP_TARGET));
>> +	smd_exec_current =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT));
>> +	smd_dl_drain =
>> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_DL_DRAIN));
> 
> bool, so you don't need the !!
> 

I will clean this up.

>> +
>> +	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED) &&
>> +	    (smd_exec_current || smd_dl_drain))
>> +		return -EINVAL;
>> +
>> +	if (smd_prep_target) {
>> +		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
>> +		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
>> +		set_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
> 
> might be better to set then clear?
> 

Sure, will change it.

>> +	/*
>> +	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
>> +	 * subclause 11.3.1).
>> +	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
>> +	 */
>> +	if (test_sta_flag(sta, WLAN_STA_SMD)) {
>> +		ret = sta_apply_smd_state_flags(sta, mask, set);
> 
> Sounds more like an LLM invention than a useful comment ...
> 

Sorry about this redundant comment. I will remove it.

> It'd be good to know why any of this was needed I guess.
> 

ath12k driver and firmware needs notification for these states to handle data
continuity and filtering such as to stop DL, etc.,

> johannes

