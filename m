Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021020;
	b=SSCJj03XKFjqClkQSyWW4X+5TkZvdbAcSZ/2G21MRalFzyIpoLyFPwnrxO0uBOrF1wgW
	 n/GzzMfQby6Dcg+Jw/rWjZSxJHgZe5tu5zyDHRpQOer6CtgLZpOGqr2FP8HHAh4ahvIAl
	 Bb0dznhEiqCJTzwGB8ovnMZKtJ65A1XR6TzBPkSvUne139eXGpgkRkseuAFEeK+Jb8eoL
	 BVHzIn/CizyIA4nIoU7Rv9qXvttCKNRJAYdDS1zV3Oa1EN2OLz5IqLf/2s1pMZ/cQATmS
	 5pEc4GdFmCHQOMvUri3i2nOLfdHgUBd/Ee3V9psSBuI2Syn8B0qDeZu/i5IyHNqxI/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mEcCpgZf8swuwE91sSdyb2WB76yoAO6OQlgPpzkghjw=;
	b=fzfVmWkz51Zh8oxJKIzC/BQIU4/rdefKN1TxQCez+87Pt/e6EhTVEt5NEDlMuWoiPTH0
	 SQxBY9zCST33hw3EgJhPElP8A52NiR/nwc8ewHkRzX4+HPOjtm8wvv3JU/TsrqNbyGPSj
	 zLsG9eYlvOmKoffjsMAoB0/UT365CKVyGzjMWf6+w2ZA25g90UVS+qNgCojdQO33IEYCm
	 A2oYOFfQV3eC82+LWes4wywN4ODzChzVTHMElaOqY5aRwF14/FGJuodnxxxv7hnO3Wlf0
	 GDxizRZJUY9A3grJBtSQHgbVv/DTkJaPvTsUKmpXx5B2xY5CnejwpiYM5hkAjMfO+fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFERX9CB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5J051oe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19C5606A32F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19C5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFERX9CB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W5J051oe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGNUcU3847917
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEcCpgZf8swuwE91sSdyb2WB76yoAO6OQlgPpzkghjw=; b=cFERX9CBS6HCitjI
	QIBR+Z/y9GjCtaMkPFhyE5PxbpDAv+DPW878AcRsRCOfNC2+DnwlAgPgD3M+gue6
	AMVLbTdZeez9G6590agdgK2GUAjLfDStMtrJpdtkHhGdQ5KIXAyf14f2do0ZFo6Z
	GKhI4/je1dMJ2LzKXB7oB72F1Qrj15/f2CZoFOb0xyJOOAQmevaTXILfVBKTMc91
	EPjTjMSTnvDQCsdwKdmKw2l6EFe0RGR6c85osQNhWbKnzEVh7QmwmB8Ow6yShjTq
	pvNStX6H6sf+Kqm9vNdlHMVJKJx2R2UoyUmkEsP0vEiP6e9EGsqKVkQbDAVHXv9J
	lqBpaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg04up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:56:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so219992285a.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021018; x=1795625818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEcCpgZf8swuwE91sSdyb2WB76yoAO6OQlgPpzkghjw=;
        b=W5J051oe8N93gir9D535VmaLxUqBJ7RsTXRXA79xNlxkKxUXJ8wkaKJhSuQIPOQlqE
         cpUCaElVm8KL0WueFpFkSSWR7supUJVxHp0YYL3qWMX26lasaPZ/wra0LcUpept/1gXv
         LFB1g/igJDyLu4rQ2Ph6eFFv/eKEgB4WwI0kzOytwRDXRU6JiIYu0sImY4NIjc/GW4HN
         73AiDLMw/KsXyEnOnXZiwvnxriR6oifuQEllYwotcxOMMFwTZOgvcPAf917ETexNMAqw
         GOVIaYH0vAFnEWkAXEUvaXKoRN0SyzwLidgCa0iv46VXP/NC8see+qlBTrr3bo6kVMfm
         qmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021018; x=1795625818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mEcCpgZf8swuwE91sSdyb2WB76yoAO6OQlgPpzkghjw=;
        b=dKi0ytRDzLgPnjwu+WGXl6wjGGlto9Ai8TjVEhmdGyxrrzfNEHduKBCkyYGFgS1Up1
         DrKkSbNuF6a18f2Gxtu2NrpWHO3vC1Uq/2PXVPjJO+saU196qNCUEwmkRrUwgIunddeM
         Sei98RBIuOURvMyFmUhGSLPP8nUlIl4RHrYtYA3CJq2lKnmQNwSaWSVlJdAujznx7XrK
         lgD2emLdpgEKrXo7bXYybtdR2JqcRWV8agg1qJpE4mGRPrmAdUBzs/QOPDwy9Y1k/ETw
         xCGcZZIsfqMY3Gn9iz0AV4qQm8GRx/HtJkTGuqsfqszuLUKk6S/ubsD84MhrauiEdYpl
         ZqJg==
X-Forwarded-Encrypted: i=1; AL+hErGo1a9ooZbB8EVHNw++5NGStQaSLYpa+Okykw/yo3yqczMGa1227awh+ovwaRkEWmysJkqZJyv47Y1s+wdGFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O1S4bKlGOb3czvcJEbX/J1+h8WOlN4cABzzsMRSVFRsQGFflY
	sKC9OKJYuO8F9H7auWEm8JJ5kEb19oOePOn2EzOdQs5V06USm5TgptgzNDClSV+hDkGuND/FEe+
	ehfUprWqxyixj7d6FxNTBXNbqpODhBY4Z55HT7WzeVMLpRaQlf+RGBejZvs/aUx81wUwdHQ==
X-Gm-Gg: AYBFou2U08U+OXzk9T/KCLyOGMVj/QWOPMwSBTc7XYVVVhlxMJZtrl+AUFhBKmWH0RY
	RQD/VYE3QhbMifNO3gkdJ+E2X8/mTf+A8ubp2yG+WhYvsOEFkFL8lqc24/x/3g2kAGx8cNIvbvh
	JkyzVaAcaZxS1AOpL4D48GCFDWzmRqQxIazqoSMIKUemqyXxKJXj0zCbmSnRHt29BKzWE++KqpD
	X2Bk2SCbOHGShS7YINaH3E9nZMMIp20gDmNfnbVdmqJHTiAvHJSTmA1LgiERdR74KgfEIUMwRif
	oufbzKMzOC53C2mz2Mdac4CWWZuKUHnw27Kl5IkBF5wyb2nw043v0SP7aOP3THLrWZGXHkEUeA3
	XGkK9VEATVF6Wns0pzAfUEINnKIG80B5RWArUAafHjZTcgekmTmYsojkmzNgLEFTpsiTO3KiCLj
	8JeCE1XzdN4MJw8Wr936Hr8IPzAWWPH59h
X-Received: by 2002:a05:620a:2856:b0:949:75de:b22b with SMTP id af79cd13be357-9499955654bmr493394985a.2.1795021017740;
        Wed, 18 Nov 2026 08:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:949:75de:b22b with SMTP id af79cd13be357-9499955654bmr493389885a.2.1795021016951;
        Wed, 18 Nov 2026 08:56:56 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm26089886d6.7.2026.11.18.08.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:56:56 -0800 (PST)
Message-ID: <674b5f1a-9a56-4e54-96bd-4fa98f8594ea@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 08:56:54 -0800
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
Subject: Re: pull-request: nxpwifi-next-20261106
To: Johannes Berg <johannes@sipsolutions.net>, jeff.chen_1@oss.nxp.com,
        linux-wireless@vger.kernel.org
References: <20261111013858.98465-1-jeff.chen_1@oss.nxp.com>
 <20261117134456.477898-1-jeff.chen_1@oss.nxp.com>
 <d654e38a45785b29bf79cb35929d706bad1ab909.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d654e38a45785b29bf79cb35929d706bad1ab909.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DG8DFJzHIz4Mdlt_-YJy40NVqjZAFGRF
X-Proofpoint-ORIG-GUID: DG8DFJzHIz4Mdlt_-YJy40NVqjZAFGRF
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdd8da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=L3lN_9fJCtXnEf95t2gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX2zKoFiqdoLt4
 xNB6ZZR4vZZ+O2tndtmebhucqWdcUDYipPbIsyHiR0w2lygoO4fqwkoVdfnlSaN8B3ybRR9wYS2
 Tq77LPwmPR1CNeYUcPBl4/CmFgwKTho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX+sXeHuXDTkBH
 83kSz1R5vKRbWo4REXOUWDn7s/D49DRAFR6wH8W+txJlCsLFk8+eJ+/X082T7NWzT84MCkf/905
 M9vEwnRXgFwsysIn59GM8qvae39Zqmo8spiBj6EINcDgY1sVbu+Je410dcacbDYhpyuviU/VPuj
 vDIvLCgudxg8L1xz0VzCrJbDML/LntCngmaiBIerGvqPWFsOwgvaWpsHL/qcux3MWTxCLw0Oys0
 7Oxgv0TKjwuFi3Up0RVZuLlLwlx13ho1f1vt9pDm7KoL47QxAcGO4m5RFLW6OUNpwLmBQi03AmM
 sL82O8VXjyL1RVfD4ZXYidNm+dahQ7BML882t7WLhnS2Kqm5P9DZlBLDI+PajCtr3kVV/uk1Phy
 +aadO0FbQ4r0rGdsEigVXdX35HSU+3Jw7Q2fRzemkPexhm0Dnp2JrYyGNV1zXCVUPNeAhfA9QvM
 b9j4Pvo9MLCdFTsKVjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067

On 11/17/2026 6:06 AM, Johannes Berg wrote:
> On Tue, 2026-11-17 at 21:44 +0800, jeff.chen_1@oss.nxp.com wrote:
>> From: Jeff Chen <jeff.chen_1@oss.nxp.com>
>>
>> On Wed, Nov 11, 2026 at 09:38:58 AM +0800, jeff.chen_1@oss.nxp.com wrote:
>>> Hi Johannes,
>>>
>>> Please pull the following nxpwifi updates for Linux v7.5.
>>> This series adds P2P support for nxpwifi.
>>> Resending the pull request.
>>>
>>> Thanks,
>>> Jeff
>>
>> Hi Johannes,
>>
>> Just following up on this pull request.
>> Please let me know if there are any concerns or if any changes are needed.
> 
> Don't think so, but also haven't looked much yet ;-)
> 
> I've just had my own pull request in flight, which only just settled,
> and I might wait until Friday(-ish) until it all settles with Linus
> before I pull anything new.
Good, I'm about to submit a -next PR of my own.

/jeff
