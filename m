Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593729;
	b=E+tIV5bKpL8guMbrasxiwx7xowQ1krlnzdbCrDhhpuKBQtbly2sUPvrK1k1B04QHNIoE
	 tucqoLV3YaoV8+wPbGF4fe7L5lljU93oU+B6w575LmK7ydONv82NYZQ21LGlkZ8otxgEX
	 Yrzm9X+vFFnCdYNzTc74/WdOGgN2QX1BNC5QOO5HQLn3cf/Hvxp+iisOfrPJoacWEvd9y
	 lsOAy8M3prnKn/MMjHMbfhiuLPNirBjddWLACONbeSYW/TKbRXpdv24dvM5xZGFvKB5nv
	 TbMXwryOD5mTnMpigKtH+5oH9FCtKEnAigktH/+A/LnMmo0wigFRAlHGXX0ee9c837Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
	b=mNYPGT9zKQMNpGtlcy+xQjEKPfQCSYf3PS2RQ86R3GHeOF8SX0PyG89GTQXt5EjBhSML
	 JaznDHwypxtCce5HDhnZFIOxtqxUsz52AvkiInPLtsIPpexOxxuzPxX490UnyBAZdZhV+
	 Yvw/O86TVPuRvu46FXANUdpK4+qdkNAjgGaPN+jD2nYp3K87XR3KeWgZATYvmiWwY0HoG
	 +jNtMVxEGtlXjp0MZO1D/u2kiwDjd32WgC6AIUwrBJZvAp6YoLOCXabL7AH4KJpjmmkOC
	 iNwgYJitdF52+TwKf0S4/XsNAy+23NbQByCO7CHhUX33AcYuUCFWrN4xX0C40BmhezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ErgGz/qh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SBeMxDfU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125D606A8A5
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E125D606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErgGz/qh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SBeMxDfU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRc221012697
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=; b=ErgGz/qh6LWMMUjL
	NwAWwp01bEJQK2CA4E9oSD0NTpTIZNl1UJqU4QvreJ/wLyM/DEeHANgf87XCz5g9
	3y0neXasGEcmFFVxTQlO/cZikASQgeOGJzPBWBPfMAqrLQacXZ7E5nZYdQ/lvZdK
	4iXjao13lqqfP2KPQ/TCWLu1PIs9BvhKZSPnCXGXZm4J1WjHQbjxcsgR/5jyXEXf
	cM/Adp0Fl0JeGs1oAqqi887bDSQoWJfveJH2FqJpJiRgD7HGV7t8qHDOJFohuqOH
	Obc+wGTLyGYgfMbKcpeRzx4qG0JMmBaT179lhzY4nzndE89gHTr9t2Vn/jGnWvrA
	v0ps2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmcxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:15:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso1059474a91.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794593727; x=1795198527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
        b=SBeMxDfU0QxU/LJyucC/J7Wld9mj/eh2aXbIndzTQ7IHqKw8pNOCbicYp03lWbdeYy
         mXGvSwrfLAvCJ1RKbgmYnE8N72rt5hxZZ9/TMXI5rPENpHHuRoXl4+yOSG+afo/YTE4q
         Mg08Rydvm3pJF4tlAxPV0HTCtQGAfiTHTSRz/3hhqM21Tg0rcMIpyLpSHWXKj98boKm+
         YRrEdyiX8OdIzIio2RYWY6EwvdpSKaXeJ8JMABGES+kkZ3brQMEm2tBkHbXC/lWfvMw8
         IUtcFN4hIaHiZPw8NzDf8Ud2l4vdVn3GGSry/CiYXZbCXtsuCx3+0fXgVKRqtf0NDLHl
         I42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593727; x=1795198527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecelQCLZk0Rx+ddmBVxE7/SPFjXtZowQDPKgrX+wKzM=;
        b=eTY1GVjWl8vKhc3KSa9wNwWkZsSLdk4XTLeAk98B5MrAeANtjf1mTWa+lsbrp+Z7zO
         w7GpaDUm0EbHe+ddaRUBcMbzTgikcdtvB5dU6l4A2GQt8Fhkhre6vcUeYgaiheNXvo7C
         XwgwnLajp6ShXU7wekrNSP6Aa5+dV71qRpydx3EOs0TXf37slwvdwsEUFCXPuVKwAwSX
         UZOr6Sun0RaQ2UME/I1oR1VKPZEEJQOuXQBDdLkC3vHtSke7Y0Vgdp628/xx623JYKxH
         Cvs/8JP1ycYwuRx+trnj7BN9+17A36kaoYWzBSmBqExdf0bShcuR2K2ZkM4z/dhTgOsS
         M1NA==
X-Gm-Message-State: APuU4Z8uIAtWBwhUXz4CfIs6Csd83WBqIVqm25GjSe4YcsRwQl0guC5o
	42RF1C2zcTQ5uL68ChmPz292lheYMpMHL4hYN6FJocFTgUMPY9SDrk5S7oR/SzdMANEMVkye7mR
	d/UwomQCsajPBuf//B8x9QZF18ljf5IBhds44kOOmZwQQZrmXqU6ASGwz1TasmhRcMkAI
X-Gm-Gg: AYBFou3cIfHbnZKIEjy/vez57Ed/s5HrkCtzfpa4vEiPYOi/U3yFIPNgPiZRcx01Pxl
	gWYAm1LEyC2gAjFDg4AWXiHUnqpvHA+9B+GOE/INk1Cl4xIU4B9i5rKaWT5Ehm69zfFMJ5ZfBsT
	fQ8lIWGRR/Vu58xVVxr4vBu0WuesSKC2eWlfdHQyLv5A74uiMCy7N9D3JNfov0/tiaptpNstVZm
	LQ+3Zcm/lYfV0sErcyHMpIvWNK5gSInjFyFhS+W8sSaaSjepdO8LpDPR5KMcN74ZIXp72mkkqGa
	RcoPvjkHtp4tBveF9ZmoKx3YH2Z/ickS/Ck7kIJxcRuBG/1cPEd7cgXWcPYsfMYwUFuV8/MSrcJ
	oBJgPqMaVTSKjknrTc5BxE1+pnMUKIe/2tF0m+eNsmMD7oHHHqibA5BTn52tJFToyJKGzdesXxJ
	7t4mZnJOJSkiysgRPOo04LFQFJiSDlvuISmymiBEFWlt1/e+Wqx6c6bBJfG4nRI1swzQ==
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr2819843a91.42.1794593727308;
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr2819816a91.42.1794593726740;
        Fri, 13 Nov 2026 10:15:26 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm5287617a91.17.2026.11.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:15:26 -0800 (PST)
Message-ID: <b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:45:22 +0530
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
Subject: Re: [PATCH wireless-next v4 04/21] wifi: cfg80211: define layouts for
 SMD BSS Transition context
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
 <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX/GIbgRuh3Wy/
 eGjFsyoPUZ0IAoiQuqLWsKJoSTKLUFHB9I/pW82yqsI0nXLMAt5SOA/nv4y0uCBQbt/lIc3hYcP
 Ff/QPdgD77gqDoH4hnKv8Px2aomr9tw=
X-Proofpoint-ORIG-GUID: 6Ki9t_bucurTeu79AcumtPf4EkheSmOx
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af753c0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OXx-bYV50MqqfosbHk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX3sRn8ry6p+7M
 NPvjvPJ+ary4VscRf0y+5B3pdQPNMH4Dp8jxALdSdmkbMtdil8ggd3sqrHHPx4/w/30+B5UI8ZK
 o0vUd7+AYzO1ZPDBFmao8Hu+UNxsE458FQuFM2updJY8Y88vFTDMjCfa8BLOrk4aY8ai9lCc3jz
 LM6rdg97YCVwGAPOW7VV/2jziKvNnJLxH9U9yPEEzhZAkbRQSm8TDwbIaySsjwvPT8DMOmmDc9G
 AL+uq9gmCkOpdF+zHfXxiTSHStrktGd4fL03ilhRjJXxyuX7uGOKTIbZcD1CnXH8ZvnbIbvA1F/
 l999QGg7JPMvkfHRMhr0Xjka6t1LjF/iXeoxd0jnspdOkxROJ3Gg4qjAZ233bVUhP1k9Af3ckl7
 SGceJSfAtlgPQ/xQrG+58zgHV9Z/z7pPbl3jI+VcdvAUoip4aagKINczvyC8O8XMAEnZykMQvVb
 Dz/TRRu0KIcD+BMfQ/A==
X-Proofpoint-GUID: 6Ki9t_bucurTeu79AcumtPf4EkheSmOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130072



On 11/11/2026 12:09 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> IEEE P802.11bn/D2.0
>>
> 
> It probably didn't change here, but there's D2.1 :)
> 

From the looks of it, D2.1 doesn't seem to modify the context layout but Dual
BA :)

>> +#define IEEE80211_SMD_CTX_MAX_PN_LEN 16
> 
> Huh?
> 

There is no cfg80211-equivalent for IEEE80211_MAX_PN_LEN as defined in mac80211.

>> +/**
>> + * struct ieee80211_smd_ctx_ba - BlockAck parameters for DL and UL
>> + *
>> + * @amsdu_supported: Peer's capability to support A-MSDU within A-MPDU.
>> + * @ba_policy: BlockAck policy (0 = delayed BlockAck, 1 = immediate BlockAck)
>> + * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max 1023)
> 
> It's probably literally in this spec this way, but I see absolutely no
> reason to split it up like that (with ext_buffer_size) in what's
> effectively an internal API?!
> 

Buffer size was sent this way so that hostapd can directly use that to report
the DL BA Info and UL BA Info in the ST Preparation Response frame (Figure
9-aa53 — Extended BA Parameters Info field format).

I can combine these into one single @buffer_size and let hostapd split it for
preparing the OTA frame (as it is only needed there) but would still need to
send ext_no_frag and extfrag_level as part of the context. Would it be okay?

>> +/**
>> + * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
>> + *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
>> + *
>> + * @dl_sn_valid: if downlink (DL) SN Transfer is requested or not
>> + * @ul_sn_valid: if uplink (UL) SN Transfer is requested or not
> 
> Hmm. It might make more sense to invert that like in the frames?
> 

Sure, will reorder this as UL, DL.

>> + * @pn_valid: if PN is transferred or not
> 
> This being false is not a thing (any more)?
> 

PN is still defined to be transferred in the Prep context (at least as per
D2.0 37.16.9). Even if drivers choose to send this in the Exec context, it may
not be present in both Prep and Exec contexts? Should we make it so that PN is
transferred in both?

>> + * @ba_params_valid: if BlockAck parameters are transferred or not
>> + * @mgmt_tid_valid: if management information is transferred or not.
>> + *	@{d,u}l.mgmt_sn and @ul.mgmt_pn are still bounded by @{d,u}l_sn_valid
>> + *	and @pn_valid fields.
>> + * @pn_len: Length of PN in bytes; varies by cipher type
>> + *	(e.g. CCMP (6), GCMP-256 (16))
> 
> ??
> 

Especially while filling in the data in nl80211 to report to userspace or when
we parse the SET_SMD_CTX from userspace, this eliminates the dependency on
key_conf to derive the length from the cipher type. But is the preference here
exactly that?

> johannes

