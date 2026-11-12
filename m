Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490355;
	b=lTmTv6ihy8S5Rtp6MQSv9M8Iii/Cke9w4GnMkAZDeDTxv8Lg4IA1rDbWAU+Tm4Xfr7nz
	 zSmOlh2MNQ6ewdzs/5JecpYGhsf+E41AImJ1ulR5zAqrtB/T3hivjFhXzWsGc9UFd2gTb
	 2Gq2b/F6A5DIlUCpkGvreaAuNwBNVhXYPtXJwWPPABrwHxVARo5yXJQ5Be/cTPICQjj32
	 T3ofNrN8n0tgR8gDuNa0AkF/7o5xQzS5mV7m/MD8XaEb3qFvGyAcsW/nYhzQJaUCnpNey
	 rSSS2cuAtyefAEK/UpUmGyGW4cXl4v7lML/x07Ha+10ry65plJFnllAKXHgRHCBeiog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
	b=Zc8nwO2m8RaPkvkAXLj1a8o9IJFJCriMUyPhp8qClH6vM4jeIGtGJgDXYwPkLQmZ+XM9
	 8REiToWiWjCi6/tkU840EkVKwfl2PY1rCVPIXJ/jWOpFlBhLwP0Fn+zz9UaCxDmcW8OYL
	 kJUIXYV04c5Of7G/iXd2PuQFtKqbOpwuUIWZ0arwMseBACRyVDPTMRMX3127T71+jQiwm
	 PskU+8pEtKiI5naUxXpyjLbnvi2a+XZdnGjnWjKxceGOCnYEPA4t/Cod6m8/6UWysnKDW
	 QToH27LiP2WGy5rYsEVvvOrSvPASNivdbL8fFkZ2cdolvI2AuOHppUjujQuorUy5MLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F98606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6RvHYjN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5X6P+jh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oVhe2818498
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=; b=H6RvHYjNNjqOJOAi
	M4V6IlTSok0SApN/vq7rMc9JX615Ss4MbGhL5Hwrp8L9+CmiyJWMimzuAQ9ZLNhf
	mugRDTOTe6gQZTn34iVxh3Cg2g1BkNo790ZpN8ePlPZzUOq1IfmTIGV2POF/5dUX
	R+Ki7rRFpIFo4eCWbyPK7hpBp/Nh5hv5xLUKIC4aDpYXrimZo3rIroK8ByHilqS+
	UXNN+kR9MBE5rRIAkSIPNWzIbtvc4krm/uuFJk8OUb1/rAeMgcGiZwXL3n6GEOnj
	IuHVqT3BSaawMNEPcJB/6foUELfmvcGOwNq+BMCrfKQ39KWT8lyBZ52iYu+EhfpA
	/EMonA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e196g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:32:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999e001953bso3008448241.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490353; x=1795095153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=L5X6P+jhJ1RKuVyG85YpHcptVAQtIU0esAwNJmsdXPUKFNdSedOw4BaIrpEkhkCLR4
         0MggITV2x3OWGouZnvMnOMQBMPwLja2jq1DSVGAAtvNs/X6UGWFLR5t/Zcjf6choEzPO
         T5hTQwRsn8azfeqqedN7IrfXKZUJpxPFxqJHmJ3ro1uUPZrciu7gyVdGkFMNUBg7CijU
         eArnNw3+UhzY63rFtXn2/gkiZaQMfwvrjA5YZkUMrpVwpwpgG9IgXMG8kO1Hbj5E9V0h
         J1nALUKDozoylV1HY1Ru34bxX34I+lr2pOuSq4mRyv/sAuTwA6NFcuAEkCsnPysK7bGm
         0Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490353; x=1795095153;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9yXVJlvnIi0O3A1aADezHuY7eDDpasAZKPrrDv5azE=;
        b=agXZVVSQiK22UHQIYS7Y79tiu2/7ANqWJQ5I1ZkIKJScS5bnI23W0nBneHJmYKU0w+
         xL8iJw74TUCeJK1vVL6XEvKVTiEdxS33tOI2qS/vXiGllFVKKm0VHenzlnbKRovjBWsY
         wsPKLgo2c05W0P2EiUDFgvVgfLQWmsKe1w4NOtxknz2w4Zr+2frCHUeVyfj4MNmIrYO/
         B/MD3d3MOmudOxwlh5EK+6gaqu1St9m5q+/noCLqBpjCnM+AUIVc/b0nOehyDRqxp7LM
         yXQKhtbAnd1NEEORQrFcdnK+iv1qu8isAlrWiCe84FewuKO7Uaj9unXUg4k56p22UuOQ
         P2KQ==
X-Forwarded-Encrypted: i=1; AL+hErG2rCEOnILni+RlvOViuGEoWzcsRTU4kPC6YBmXDIMgm9V5bfsiwsl4J6DIWVwsat+1TFvAGihLwQ3HgsUpJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7sYKT86M1WRFcKWm+/ewSUy2/nkBScM0Gcy7SKElppRBys4L8
	EpVActTkq4Pk2n9bdo3IIm7e7fBbrktuS8VVezBqeV9C4Sh/7TWnOC2vB6x4q2obrIEd+bkDpXo
	0DzOWlZtK1Fbxcm00pJyKrWSe78kxvfy34t3hZdeTFTH0uLA+5nY9upqHhqjeKPgVK9sInA==
X-Gm-Gg: AYBFou27rP6tFu1bjPHUnyBPP539UGzbMot/D9AO+gDN1tmvuCuqIIOC2H5QsaGr2s/
	YUwVRoBbdY6o4QHFs5DJvDTOhvzFM2M5SCod3AyikVUs6NMvcHoF5/EGkIVhm4GEeiE/INVvkxE
	idVHDtRtuesLsNEH/ZVax/PAjf36mHWuwBiYzgQlH/xeQph4/i+fV+zyRZaCD52kMAqr37oCd3q
	/zXVGPjzFASsqv7JDrM2KENzpdoSm5iRt91jEHQ9300jCU7M4c+or16cesYMAWUp2nnYiNA3Iag
	REbx0QsLlY1OyrdOHgzxRm4ylT0X2RYOhyKr8dhpcZ0qJOARUFDNL9vuSZFa3zzG0Y2BOrVxfpq
	F71J2jRcqct20FueeHr4Ch1bDrbpy63sGcN1C/ijS8e5kq6Z2zoz1zAvag1g4BGvI7pyPOFWXsq
	FqCys/Oh0VowTOWr9GeNqQFPkHTt7U370p4xV3B37OjpenjNt5yfsj7yWVTt2S68hFv44X0N1tf
	SZug8lPT9URV8wjqB/cjpRt3cfduglUAmvYUGlm1KrW
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361242e0c.23.1794490352752;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
X-Received: by 2002:a05:6122:e153:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee1c4862d1mr2361193e0c.23.1794490352219;
        Thu, 12 Nov 2026 05:32:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6a4195sm339950666b.86.2026.11.12.05.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:32:31 -0800 (PST)
Message-ID: <6876daaa-1e9e-4f69-855f-53dfb2b8a7ee@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:32:30 +0100
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
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>, Dennis Gilmore <dennis@ausil.us>,
        kees@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, gustavoars@kernel.org,
        linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
        nuno.sa@analog.com, dlechner@baylibre.com, linux-spi@vger.kernel.org,
        miriam.rachel.korenblit@intel.com, linux-wireless@vger.kernel.org
References: <20261112025252.71375-1-dennis@ausil.us>
 <179448342405.66517.5463730214277229760.b4-review@b4>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX1anJsKe97vti
 ZZLeOXn4EJ3eCw1KN8wBIfsE+WUDYVp4T00KQKCsNa7/V8i2FQg4ZBLJ732HmBQbhDJZ70rnxLQ
 srwdyJW/hmaYkRsRdVKdvGSnqLguHFS1ojyWIes+yu23FctzJVy9OVd4Pu/F06i/4H68DKQUVr6
 E3JlY3vx6mK4EPl4RHrVv51doDKtdh/LL3QQ3TWBqWiftJphmVW8ud1hVgcujYIyzKNO1N3KM4U
 E2G550FlJg56ucKvys3fzafR7um8Fqd0NeKXj/Xoyj9ESo3yBjRrhtWg7jvWkOPxdD5MeS4dAtk
 PEtBUKS2Ooe5Kw8ludsxDchOC8JnFNPqLFRmUVdceb73Sx5BJM0UARkBQIIWjTxVKQiFNjO3ymB
 PhW4GnySlPTiJAOL0HCtovV+6JOVlACTUcE9+BeDjS6CkVzgop87Pc3GQ5IeFmCIupbbi1R+lRP
 0/450zJX6O8m0pXucaw==
X-Proofpoint-GUID: ox596iKX2I3NuIcJSUX3sHdkNZ3-Hwa_
X-Proofpoint-ORIG-GUID: ox596iKX2I3NuIcJSUX3sHdkNZ3-Hwa_
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5bff1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_62txuixjVeDG2zLGvAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX7BRjusn29a65
 rUaFOd4Wow0G0uBX0ZlJA3JFkeXGFyre/yI/5ppKSiO0J80xHih0GCef5lno4vdiQqKQvvENzkr
 ANwl9ZDGpX/gtnipjWU8Chkry2ke1wM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053

Hi Mark,

I was about to send a regression bug report for 7.4-rc2 but I first
checked the list to see if a fix was already available and I'm happy
to report that this fixes things for me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Also the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

On 12-Nov-26 12:37, Mark Brown wrote:
>> Since the conversion to devm_kzalloc_flex(), the allocator sets the
>> __counted_by() counter num_components to the allocated length
>> (num_cpus + num_codecs + num_platforms). This only happens when the
>> compiler supports __builtin_counted_by_ref() (GCC 16 here). With
>> older compilers the counter stays zero, as before.
> 
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

This applies cleanly on 7.4-rc2 and fixes a regression breaking
audio on a lot of different devices there.

If some form of this is already in ASoC-next, then that needs to be
send to Linux as a fix ASAP.



@Kees, have you seen Dennis' remark about the

