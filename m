Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011271;
	b=f6g2+F0u5rx8MAlIVMJTM4Ua6kPK1SBMIDj8vO2E3t6l8Ei1RfEzsBcOM9qVp5/ihq7c
	 OzcUAHDVGrMf+FbqAdj8FAT1Gh3r2zBEmhyYuX+3QEjxroiwzAZRtzcPqrCvB1Rmk94Zs
	 8KbKR4p+O4hzJ16tRj8tVy77gWh7wtEqjLeVRwFn4cUqwbQ/O67f5ISt+RQE2TBaY45HQ
	 qm9HSWEhNngmrop1AuzgU7DaZ1sUBAhZJxtTZPN1aPDOSON1vwYteVJRkl1wAzsaJLPsl
	 nooDbX36FH56+2lMGtH5YQf4km9u9sKFU4cbkqtN2NVCZvluPjjYzLq3TZiSQ2XldWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
	b=HJkiVI1q+jBMdQ3XBWZOz/AuGlrsmmWEnh/CupYr8cT9QvnEtN8k1HVlP5yA+WBo6aaW
	 506J7zg47Yxhqg6SNYu5HeZ1QjSMZPl6PhCmt0fPpi9f+vLYCAkyO8SvE3jOX5Z3JKD5e
	 7yZEbml7mzNkZa9YIVbdMrIoUxHezfFDWfOrPK1no9o0/OZU/ttSOrEfBS4oXXAtQxZGU
	 Re0UtxUAhfqHHRPWmh+R5vWEtWpwBrGcoX2B9P8b6mz824vhBZKnK8eh4PSzISx8WcGQa
	 SzAAjlT9ibVW2nMoLZWPppe/ioK4wjD5/dOkLnDRA4gdy9qCuv0druZqJyFSXjNuRfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyeF9kPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ef/RDZBT";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C3606A335
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04C3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyeF9kPR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ef/RDZBT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQaBP3447955
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=; b=PyeF9kPRokm4hd0a
	yL9/xm8wqeuvHgfZhFeorssTrGMnBrUiV8ryEioZ89gPk/n1s8lGO2sb0zlqDCSl
	S0JLTQRuf0C3Y0Ti2mgFT0wHhfnsEtTjZ7q0dJcLsK0VM0wWtQY03TxHlsOkuDhp
	Mzu6H4GqLqT15+ZpynA3z/5lgqWRs4Yaxv2nakClqa7qvJp4xEZi/3Y2hLbQNSad
	xtkXCGvnof0YJu22dgSD/HpkyjP7fwQZWcdzdi+GEbHRuaWzC11F7euLgA5MFjZH
	zHPaIj5ZRh1Zjmh8+cpdnzHDHfmkNIIYhlqTGtipMGEocKk8Ln//GmcGTcWOhUHQ
	6MeWUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8kc4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:14:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so12786525ad.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011268; x=1795616068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
        b=ef/RDZBTD7uE9VSfwclXF84QQ6NwY4SOA7BRNNlurDUJISaa1sjVOgWpg+7zUXrK3A
         A0wt/wIbo/Tug0i5woezdithZb4Z6sg3bPNRMIrVPSdIQs97GVD6latloUpRi4TBv+0C
         B8+u4f/16LdLJdaBy/B70ihvOV7Okq13i9zH4/MgdrTrwOZ61FEDtjO9fK6EJTYcWBhd
         f51lIgpfKeBxahgwcvIazXirXrtCFN+9cD+sgeVBWPbcU86zUAbYZJPbjcHq205wvKcQ
         KCqwj/tlC+BzX6cTfLr5ugrIFo8zjTpixWDhBM+NMtcyRgCA+Yhp7QWWchFH5wYEHRG5
         t2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011268; x=1795616068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qu1Ojo5jxOyr+2B6xkqhugnW3S4XuYBiVbuObW8sOk=;
        b=Zoce9YWDTdSrEucpWbKEJqzsFEKrdKFoYIAEVSWEoTYI02/63l4YSeOIRqDsRWTuO8
         cd5fZM9SqcGHI4hYWUEGGzLR9CrjJgP2Yo5cYj1wioCmsaB6i/mq4Nwas2EREcta3l47
         M/0CjpI1eThDkFR960cNQm3jYokWhzbh88/ZjmasiADqfI1nZu2uhEIqmgnMfZ9ip3AS
         cJmsAxQz49+UXXAFpRTcyBLil10zTuPtjBihK6aUYxdMyV2mtdSQAjKNgqVOlAFQPulJ
         X8cThzNjvWvlwpmHlrU583fZ1+KxXxzL3OBxUZwPuk3BAcBAinkLjmpvow1+aSRJN14F
         uf2A==
X-Gm-Message-State: APuU4Z9rBLcR2ZXRoAeCG3VFNqScQryTZxFMPr3VoxAbMr7KkEV2k0VD
	f1m0/2NA9Y301uj1U+p3zPmAsQhF0suuRnh8rC5oQJ1Y6yHFzspxXeIQGfv5pst2K8jqlOyiNTw
	osQ7dMouw2vZWuQIXbdoGz8PMqUXgRpCRxuRmptGasbjhr0BX8Ti/GrjPcASM59cUVheuxrp2m2
	5y
X-Gm-Gg: AZFdTZevG5HYGTO07bxORz5geRYFqV1FXJmDLNO1AjEYHyTmMSAjGCo+fz3+U0wB8sJ
	FycRCftOmTE6cDx1d2iq0vKshyCy0g98xfUIndVflUOPaEG3nyUKQQOBLSD2uTCdfiiPV4KoDnS
	ARmxky8SoO9wlmJQ3d6Hyj6hj3oFmd1O8t33Sh5vOnm6/fN5orvPa7vjNbHb0bMfQj8IIFINhXI
	T2XPgqw0+c47JEtf4JVOZc02uRm4cr27aHV/0XF/tSvdaWHaFQUIZddwznKLBmYpP0RM8XxSJwF
	/JOxqqyXRYkOKmOr4v1r4ZWH275NghIBse6kG7PizS1Dsttrb6vQq/LQlQORAOQMMOE5Lz6BuJP
	hUH+0WUXJdMsQeHyDYl0XPlgUYCQEZPG2GSObaqAflxH/dctASqpqak//YD4KcnZzTHrAERoxO9
	coYxm4
X-Received: by 2002:a17:902:db02:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2eff754bf1bmr27413635ad.56.1795011268348;
        Wed, 18 Nov 2026 06:14:28 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2eff754bf1bmr27413405ad.56.1795011267851;
        Wed, 18 Nov 2026 06:14:27 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm14313315ad.46.2026.11.18.06.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:14:27 -0800 (PST)
Message-ID: <4dd84a48-2728-4120-8d08-363666323bce@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:44:24 +0530
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
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
 <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
 <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
 <0ebac9768c0294b8ecfc8729447dee94ec0b7c84.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <0ebac9768c0294b8ecfc8729447dee94ec0b7c84.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -8xkcYlbjV5k89VcytWZkjdCQGFFnh5y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX49WAwgs8pCtX
 V6p8m2HgTrZyxEAYaNHjOsCOObfftIjkVeGrY1ICE1Lz3Jf4Os9VuXOD0F5kp36oMRjzSDuYOHt
 8WjNdyx0rliq+hnoKA21+fQagorb73Y=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afdb2c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ax4AIyTa-rlpZmfnBJkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX18DqkVPZc0J7
 K5lUyP1XfIUT06PfIlmqdyBFOjsRV57HbGa+qeuYBGPo+88S163VCqupeZqBMuljT1VkQ3vyCLz
 fHl00lEsFzBd3C95LOR3qt0woczjA8ZkCRrENX1a+hQdb2A6dmqzt8ZWNQisE2z1hTu6QtoVVmC
 gWzaBVz7q6WSVuPnF3iUumMrrho/HxfmhVpB3VnZz5LJ2vqqLecl6BOAnkURll2TAQN31aSFq60
 IsiGvhFpDj4CfvOzHSMIGHIx2XhVN2Et7i/d6XYj6c9zEOKYCiRvDKbmscDdknblaRIGwPo5Ngy
 q4VSqbRLtRGPmULwq9rQGRaF5WqncUkcCuOqR1uCixlXbmNISpB3By9JCG3K8hBScrCpIOs+xo5
 ky6n2yydFBcpzHkc3xgg1nKaMMTgSuYDizrrAIpTJvA7Zro/X2zLasRfrzzebDkE3cvV7RfQNkJ
 I5KO9ei+EgA8hqKBxew==
X-Proofpoint-ORIG-GUID: -8xkcYlbjV5k89VcytWZkjdCQGFFnh5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:43 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 23:24 +0530, Pooventhiran G wrote:
>>
>> There were similar changes done for array of values for
>> NL80211_ATTR_CNTDWN_OFFS_BEACON, NL80211_ATTR_SCAN_FREQUENCIES, etc., So, this
>> approach was done here to make sure that each SN in the array was u16 as
>> expected. If there _is_ a way to add policies for the iterator-based nesting
>> of such values that you could point me to, I will change accordingly.
>>
>> [1] =>
>>
>> struct nla_policy sn_policy[8] = {
>> 	[0] = { .type = NLA_U16 },
>> 	[1] = { .type = NLA_U16 },
>> 	...
>> 	[7] = { .type = NLA_U16 },
>> }
>>
> 
> Wait, I thought you _had_ a policy for this? Sorry! I also thought we
> had a macro for such policies, but ... I guess not?
> 
> There's a preference for using a single attribute multiple times to get
> an array, in part for this reason, but we've never done that really in
> nl80211. Maybe see how that'd be?
> 

Sure, I will try that way (one point is that doing so will require an explicit
TID attribute that I would add to the context attribute space).

> johannes

