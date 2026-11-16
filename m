Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824515;
	b=HdF3xf8YOuUjpLuPvc6V3ii5RRD9wysldJ097IEvIRfoIgxMl2JXUhQcIvh4inANmy5c
	 Cmo+YhASJERuDqjTtXfXtA3a636gnRXcMrtKKHJfg+2yFKCTuPraFsokXX1xbShjE4zck
	 A8pNmFobBtvZp575zPEgyt0raDyK+L0cMoev9xJF3UvmaX4Ky7VnT3PQFsFfw/wGMjyuC
	 cyo7oNqHPjUg9r2dHUQV5RDGa1LCau4QLC8Pt0c0Lido3h5amYvGBgjykuRwrm6dA/WCm
	 xa6mErF5P79U5pxM6IguNn7O2ZULJW9qSSP1ao075JOKjoYCwbtfP2A0fClHsot08pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
	b=DQLWdU1rkWzriKxNkDtWdK7jT6xfp+BXvIWsgk88ugoE/Gq6sUlllF+V2VBdliRqOqRK
	 y5JQDNF9VWJuGjcf7PwuYlm16jnV3kNQB8UpTwIK2GRb/qy5fxXTmpd0iUHIqFFxq9csX
	 qan9T172Y1W8PdZ1HQRtOymDVktEMJQCFBQcmCilh2bLHUgj5RZTew94pnol273QKa6Ms
	 x4hUFLirkCmyBHX3DxuBOpBvcRifqzqLFTCFo04L3tTOuySLv+QWVov2o9xsz9xfQ1Ned
	 dSFI1DMZTy8V1GCRik75KrG82UaEmAjMZC5griQ/aok+HNOxdoDPcy/CNfx/acYI2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJ5QXahE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKzhOXps;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B712606A33A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B712606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MJ5QXahE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKzhOXps
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA1rAZ273717
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=; b=MJ5QXahEYAMt0a67
	oo6Waf5Y5auXbiw9exfaKLioiKpisPhDxXH/W5YlpClyOUnPPjGbJPTOd8QGhneB
	7R1bg4+9+rW/DEu4ICMI0AK6351ir+nMHiux0NI/QHf6Tqf5cyxTMBon9ID3tf9+
	UhrxsrrJug1sWD3WmciQwAN0A7JvZxkxgo2/PQe0CiHRJwdl7cxg5+Pcw7C8c0SL
	jocUDdMJ9oTSqFpV5ugVdoGinG6cnS21hCs1zMTtdtpV4Y/eQZz2QKyBEqDzTR3B
	9hVzBpmJ5rQp9H9k6qMha5gbYAitQIWXufxt091Rt8VENt+3v2plcVTC2FzozWMK
	FTT7DA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgg2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:21:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so4496175a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824514; x=1795429314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
        b=GKzhOXpsGM64ys/MUqGVTbFSdT7IcOMBY6ElITsqKgdTWbMKunO+imsRWmdTV7gqaK
         4/JArFmGi87lPWXvAHeb1cFnKA3vb7mO7DZmvzfZ+1G7X1G5JsW+Yiw8OcQRT0ZCr7Eu
         tfKmnsW84TDWrGgMQ/vttGtFCuc/8d/F7mA/Sg/F+yMknvbhW0QrXEKdcFOqUmLNuiw2
         fwNMIU2Dx5Ctd9GsDecj0OU+Taa+3kK+/FMUeCxks3sY2330bWBEGWBH7I1eQm6bHPZe
         LDwWn/g0KrHBska7+WykDcqS7bwywfkqglwnahH+yIvXij/85ZZPXXAlmKJ8z0iUxwsY
         aksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824514; x=1795429314;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDf2zsMrdWvOlslTziqJ1SfqTfHM2JLlkjufHoKag2k=;
        b=O6KNVmqZh+wswfMwwMy5tIsbxLxKNS2DM4JAdc2rtqkW6Z4oz4N2k/sPGRuXz7WgQM
         7fpZARMpemaBa9aG80RgbQ9knedUHMjyM16ymdFPvwEj725qxdNxaBljzasy+UR9EADL
         0Qh3AwoVwbnfPdZTZjCCd0/VQnCod7PY+D8ByF8Ni9ANwrsyg4q6tAk970y5QbagrI9S
         KvNGGWnmZqBZWh5C4HJyY2CcYLyGNGs3Qd9dvnQZLsiL4vU5G7lDIPIE4EDXn7axw/17
         9nob7w7mnrOr1M0i+DqkNfQq+9GMuykqXaHNjE+73XAnpRRw6NNb8IAhW7f4nBCerinG
         uXEQ==
X-Gm-Message-State: APuU4Z+K/+cRy8AMuEC8ScFOmEZPvDQNrEQyZTZ7KzgHhd5hiWcmcUCg
	MqX32KmO+2jtCFrfV/NpVdnV/wJApSPw2UUzRpdVpxJZhjtsunxf0Cfe6ppfh8Kb8uk01gcmVt7
	Zp/VQU17uFdAtOfH0ho36RShBzFxnHNgyfzfCgYDDAUlxNpj0L/VCiiVBpFlH3jXf9/C6tJ7yd7
	6e
X-Gm-Gg: AZFdTZee9v9O2CAO5h6A0QJGXY0aZkJr81umssSwKZtjlkbufNdGy1R2nN6sxpq7pno
	bShs56Iz/Hfa9h0nwQftEOGQ229umHJ7eYYZpJ4e9izYYLSM8ImPLI+coGKgkxZN+m1SgCvnzs0
	+iRgK6afhpS87BLqnUAQVOW+Yv0lXI1xUasNVlssMNVMeFiswOlUE9fPM8xEUuq9uwvu1AOvMgk
	wWLgoDBXb95ZlK34VhnJJSgRQNMj3aTu2MADDPFEt871+655al75nzNAkysMOz0w94sIwFHEvNp
	nFZtvijExXa6GlysbAmFqpz9zh/+0NMjbKLCLsfM5w1x+Qx1kkDeYW2pEYkBVnt02Lep+3Lrv6l
	glCQ14zA2fmHHKzbmO1H9zTSmD0+A56Cs6GwrVSKyLFyUVyOeLP6wbe8FsLd678iaO4GYFSZ/Fd
	EeAzAdMG57NoRp5mLwtgOvUazi/kYKD9GvmpPQ58jWA7n3TcRw90tkYLfZT5FVOTmo
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr11058971a91.36.1794824513863;
        Mon, 16 Nov 2026 02:21:53 -0800 (PST)
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr11058946a91.36.1794824513302;
        Mon, 16 Nov 2026 02:21:53 -0800 (PST)
Received: from [10.50.36.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b39fb9a3sm8808509a91.3.2026.11.16.02.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:21:52 -0800 (PST)
Message-ID: <aeb887e0-48c3-40d7-8e93-951231dd2ed0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:51:50 +0530
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
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Subject: Re: [PATCH wireless-next v4 03/21] wifi: nl80211: add SMD BSS
 Transition sub-state STA flags
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
 <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
Content-Language: en-US
In-Reply-To: <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX6sg3Y/E3as4o
 N4K9EQ/iO1ZZWov5zdAxYUiRTaKk2j0KlWTYXwjR/WcR/ydpy3uDy72ChFImYSlclrwGbFlAnMf
 JO7E+Gju9IjW7uCYroQRyBE6qHAKe10=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afad942 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p4CsnxLYdRdR-_IEqH0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PbBUHxEkrtgwKZ79XGV18AoxzK8BgKxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfXwmNJ+Mjm6+qs
 6a3zfnWtzNapcYatO9VSseqD8l4LWmAaW90H2QEO414oaz2d16mp6mZ1GViU1/GF4UXmGV7fcty
 g+KjB7XEMAXdZyCHdvGqCbwSl2VddD2lmG9MH6TpO1BQuU+CsySUgOI3V/H0Kpho83uXptF0bgj
 URrvpcXNFgGf8XnVUl40BCxk/hFtI9ZYeBxI3e3FZYvQGdciDRJwu7exC0T1D3+KwSYjDoq3aUO
 gQzJB+ZDizepT5AwlozhV518OZMKD3kNoJ6MhotbLdsaShdbbB80YDwJrhCbAmJPWaZLC8JO1o7
 MvELInS6ubUs1jyn4lxfqtkabk8wGpcQbqur94zrwCygICT/ccrI53Ja7czkvWwx1np3jLWD9S+
 0MrkQuW/qlRFD/Fk7WlN8L5EOtg440m1WdFqa2TbhYaJ76nf3L3FxRArkyRRtnPLBdLmHhjAN6m
 e9Sh1QQZV8shzaQjkrQ==
X-Proofpoint-GUID: PbBUHxEkrtgwKZ79XGV18AoxzK8BgKxj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160041



On 11/10/2026 11:57 pm, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>> IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
>> state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
>> associated SMD-ME are in state 4 and an SMD BSS Transition is
>> in progress.
>>
>> Add the corresponding nl80211 STA flags to track the state changes:
>>  - NL80211_STA_FLAG_SMD_PREP_TARGET - State 4a: non-AP MLD is prepared
>>    with target AP MLD
>>  - NL80211_STA_FLAG_SMD_EXEC_CURRENT - State 4b: ST execution active on
>>    current AP MLD
>>
> I think the current/target nomenclature here is strange - this API
> pertains only to a single AP MLD, so it's never involved with the
> target?
> 
> What you need to know is 4a on the target, and 4b/4c on the current AP
> MLD. But the nomenclature doesn't really translate to that since we only
> look at one of them, only know implicitly which whether a given
> interface is the current or target?
> 

Understood. I will remove CURRENT/TARGET from the name.

>>  - NL80211_STA_FLAG_SMD_DL_DRAIN - State 4c: DL draining period
> 
> 
> I'd also get rid of the "SMD" part here - it's less about the SMD but
> about SMD Transition (i.e. ST), so I think I'd rather call this
> ST_PREPARED, ST_EXECUTING and ST_DL_DRAIN.>

I will replace SMD with ST throughout the series.

> I'm also not sure why you need to distinguish between the latter two at
> all, hostapd is going to send the ST execution response and immediately
> transition to DL drain (4c) or back to 4 anyway?
> 

The 4b/4c differentiation is needed to resolve frame filtering (especially UL
data) since the requirements differ between these two states. There will be
some time here between the reception of ST Exec Request (set 4b, communicate
with the target AP MLD, and get the confirmation back) and sending the ST Exec
Response to the non-AP STA MLD.

> johannes

