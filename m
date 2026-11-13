Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597737;
	b=gXceqDeIqWvaSeQ5EbMT/zlzsfz6wU8IyKDn2OlMh2FWWDG98uo2mi/3LaTjLtb/xgnY
	 ctztQ8OsEalPza3xzIxwYHD8h2HZrMGPsEeEj5enq1s9UsxqGsk+Qddqkr4dxxvSiGHOT
	 JlK7vktIsFijKw5tQIdMGs11V6pxwaTZXGT4IIqb4QllSym+MUy+jLJ6XHTvaF1pgnS9J
	 kOxZSpODtOTfrO8yyt3Jy4E7fxVOGqE59wIa8mIFzgI844Xfqm5kMtewDS4OChxmqfHUf
	 DavuDmln6yka3lceLpRyU4KsW5xJB8YWEnvFbmcMTLcUCQ6H3/8RifX0l8d6oTVc8bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
	b=cqZI9qMw5qxREC6P0rWASoQgs7rO7OYITjUq+1f0lAoFQE5L7A4x98LRwcXWsIYU5Il9
	 bh2TO2VsRAR7rdh7NI+2OTuJZjxljQ0+c0jNu9mv6t0BE+yshV2PxCbFVHtgoupqwz+oD
	 HlCE2ut8dSu4lY5mznRqQ6F1xLIqzh9aY4JzvU2Iz1x3B0R6lgIiPKhahNrjYYYHAR1EM
	 j4YcLtV7lPo8v/4vhzKY+STKWt1qxTMSxEaksDoXmfu9WuUnmHzPwcb/I7ZBvcT/4MHw5
	 vRrCs1s3somLWnCzSzvIdh+d5FyHt45yhdmL0g//eW/LHn0GEBQGEC6yztB0xgL2tsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBjRe5SY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKwRLjSc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442E606A8B1
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6442E606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBjRe5SY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKwRLjSc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1jc61085188
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=; b=FBjRe5SYyxOD4N/U
	P7eUDhFICQeWwjaPmB1pvkrxUWnFTSRatKYBSGLtgvYSm7vPdlX3ceLtX/SrQH4K
	uC5pd3j8LZrHFEUF8OkU3+oWcDW0HO97WSV0c0A5wv2t6TH59st3vWKr6lIz7ctt
	HDfrluAr8IFHp1ukF+/vuXQDbDQ0Z5vtdWLOdzZ7uFfRKQfuICxuwnsFHQtbrDCo
	zV7wNZgQ8vWYgL85NJ+lJ2/6wnZAdprwMbaOupuo8yIcRNbxs8pxSFh/QYxzS7y0
	P5ZgUuwv5CFnOhmlNKI8Y1fmKHegDDnF8RkSpm/iRqwIHP07gFXOdeVtFEucK9rU
	kz1j1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaavye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:22:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1656986eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 11:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794597736; x=1795202536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
        b=fKwRLjSc+iE0qqUnqvcfRTY+W9v7ZT2Kkyqx22djsqPt/2eXyRbgvf1xYx31xCmMQ9
         6O43BuqtOQLsL00wrbX92Yd/+t6vwT59cX0IJsR/SYnJaKbetQYFW6gjwiq81CGY0ta9
         XLnnMEyPZx/JtN51v4jaOnGP19LtPQ+EYrwzQA/oTVF+fR4hmHquYbPrln6VJClUpm+6
         RYsY5ncjpZPemCfPcjCDRCwdWampc4lrSCHOGB9dj6iOOrBqWmJeyNlpX4fQF/9+Qy/r
         u/XKH231KxEeQ6jx3Nhs9FVBGNx5nHaZSlga5z9j6xQS5fCZkgvHuWAoyOWyg/hviXUf
         ZUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597736; x=1795202536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHP5yxAAutvSocRfgN3P8TCXjra+3JI35BXBxMbDDFs=;
        b=m+phNiyv2ycgBSooxxc9h/z7Jidv59mxEdJhh6ooH7IkfVLQ+wecq4fl6wZJXjkiJN
         cbQtNCY9UlWNdJqGh3+fFserIRBsk1t0vIIuMpCRvcTlHwm+NGFNxJxLoqhRW+oK9W8x
         kMkJ4JkUZIajz3QtX+/oQOKLAOi+yyndmTCeLgUWcDoOPGX+fvPshB7W4aN24cIZHBjm
         hOZ6XCwoIp9zAClzCKPWj7v6hRVyR4w/rkC3U1ZO2CpQy1rFHdpKowBEsoJTMZRKZReS
         djC9RS6aFgv+nFcZ5TOQmftCB35xvhWLrrQ8khQovbJRzKcxgY+znEU3vyDOctSBe1R/
         9s2g==
X-Gm-Message-State: APuU4Z/G2B0WUZiiH2Zmlvh2Hyew4FxwULXZ2FmFGOoNd4/pUqeP87C+
	RtLhObF+Q377CGPbpPMJG+q1DDEFFl9JfJg/TbHXaK8UpzTci6AOvHzIUMwOqRGWBo4h+3g6fWY
	KbZV1te9GeFj044Q6+bNE5XuC3GxTVFHZ0L1AiFbg11WPrRdcXZ/EJEFVrTw92dllQY2f
X-Gm-Gg: AYBFou0veIo4XVFNjOVTpLS5Xrq+HndTcw8jheOtdGy+4OaNqlYojlnFkq4IBz9peRb
	qY2cctxkEe785ls4HHM3nrhSHStgY/jTzxy4w75S0VUdL+3+7KLGycQAKLQWelwP6xlBb7svomU
	YNoFChC7GaPGiweqMoUwc5H3fDuVA8QjLwYh5U6wFZJKNHofjhUKap3FQx7AyQCYDiiJMAuj2gr
	bmBTYbagKBGGHyglk+xtfVi9k38escpig5UiZMEvAPyXLR0LOla7Lsdv0eX2PDD+CaGsSqyV2sa
	j7SZZtSWijoOT+hPM/XGLca53l4PXXCzvO45aXnU6bML4R2hhj6GzAiaOiRhtlOJ94OKQ9RPQL+
	t9um6ky9AwFxI+EH/rVO8IKRvEtlSw+vpNLA2G3LfeOVhkGAfwzrOG7kqllfEDozWEOT1MMu5LI
	u41FE/3Av4JQxSlDhw+qznrHtogVcZGn8Lfnn+PpKvpz7bccW5eJGN8wCLHw6h3H/hjQ==
X-Received: by 2002:a05:7300:4348:b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-379675fea05mr4094545eec.24.1794597735823;
        Fri, 13 Nov 2026 11:22:15 -0800 (PST)
X-Received: by 2002:a05:7300:4348:b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-379675fea05mr4094516eec.24.1794597735084;
        Fri, 13 Nov 2026 11:22:15 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm9722897eec.13.2026.11.13.11.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:22:14 -0800 (PST)
Message-ID: <7fb6c4da-e49b-47a0-9287-9f8823795343@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:52:11 +0530
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
Subject: Re: [PATCH wireless-next v4 20/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_GET_SMD_CTX
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-20-62e39487f51a@oss.qualcomm.com>
 <9ee5e8e45152b4f50b3cc6f583bf3a2c6a49a10e.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <9ee5e8e45152b4f50b3cc6f583bf3a2c6a49a10e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7AByrRAjkcpoN_CdkcxTz6thLBmVWSix
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX+XvQgKStu5bc
 D6LK/g+M3sb6ZiINGhOHX/KFtNpv2+3oPD5CpnRT2P9CuLOdnCwWtBq4Tcp7AD87yuc27IHSFVS
 tvAIypwGskH3aOtrs6UHzOJr909/f9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NyBTYWx0ZWRfX5LKMn48aHSeH
 spiKDko8DblDLXenZDteDrcjIrXT/vv9C/sxo2oVBDzvdOv7sRYA4tzQXrMRa8RO78fNMS7teTE
 uABYH7uHiXYSYmYcu6y3k99mi0L8hlcWDmAGAhaaV1dGv+eLSCMCFdQ0wRK2eYRrTUUlqS2tRBP
 Zg6rvRk8A0QqMvZZfaYmNNTo9+K1RMSp0S7IYNjimfp35/diFG8jVNBsfZWry//CMXsrMYml8mA
 b5COXbJ6Y1d8I1ObaUELVfElUfWLBvFYj2c89NsgRmpM2kt8Tut3J0dRQeBgr/z86IIZe29tURy
 D+ak+jMbbN1YBU1kB3sI3nBcCNa2wkc8XBzUn1x8EAkILFAbFxTrEiRsB1SjCYML4eGxD5uUdgS
 CzxAlI9vgKnf3OzWgDWkHCCsSg14UCyzV+Ku7DMyqdlwWnC0UzyRDaSItpdPeknwHyu2Qq+AoFt
 xZcjRpbXqsOMdWvNVbQ==
X-Proofpoint-ORIG-GUID: 7AByrRAjkcpoN_CdkcxTz6thLBmVWSix
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af76368 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=kVEt3fy9zV6AwbBmwgkA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130077



On 11/11/2026 02:17 am, Johannes Berg wrote:
> 
>> +void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
>> +				const u8 *sta_addr,
>> +				struct cfg80211_smd_transition_info *st_info);
> 
> Given that we have ieee80211_vif_to_wdev(), this doesn't really need to
> be an exported function, maybe it doesn't need to exist at all, but I
> guess an inline could be justified.
> 

I will clean up the ieee80211 layer wrapper as it does not do much other than
vif -> wdev.

> johannes

