Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490462;
	b=4eXUOiCa8IoICr6fxpHqUQ7mP41USzXK3iUyLQX6hXecGb/gi4sxV3OkrqE988INYc3E
	 QmGocmto72iHE0eKRHf129qxvNzVlPjB9Sa09q/mW+Xu30JAttuk/uLIaHnTHQ7VM0c+2
	 UXsC4RSFjV04teDF5Li54nr+maQYQPRCbPmxwGR9Asz0WmuFEo1tL/16byUdE16lVqfM7
	 pKXapGNIC7wMrZnaZSEe8nQchRFm4d87buswGKAqgBsnNHvbumvK8nltPHAaK4EcfvuPf
	 7mqNfosVtGn7DCZ6uKNsrqAGBUkxGmGRH5YAQ/iXOT/4dCl7g/9BPGdhsBuBrK1gT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
	b=fko0zCfCHwPATy3BeeJ0dz1fA2Ik4L2VaQloeSvJKm4WnPfhiQ9bmibV0CYfUBaQsYQQ
	 81CHhnxlT3EKjyEcQ1oTBy3/6aX5eseDZ+c9Eeav147KkRNudMsw1Q8GXtOmY4SmgG1dW
	 xSpnzmoVqcazj5FzeD96TbIp5t7Zapxog6CZPlz5jJHdmLrWtdOTmNk61tCDL2pUIQSAX
	 MBVI8Ni52xCFYUXAd/e5C6cgdfd/s3/umSxxFrome4u/r6l6/PE5GZA5//O7zojrftHMp
	 gwupzaQh4D4z+qiXPFcgtWTqvTzXfFeRYLqCzK9UhNKDWn86MDVTGai45X0Xd4to9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHsGRD7C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5jfqXnb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF646606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF646606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHsGRD7C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5jfqXnb
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9HSeD4092370
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=; b=hHsGRD7CIheVre2s
	LWP8gjwXgsLt5YhSb8KdPblO0CHJxMoTwEJlliXeohBUyt9bGYvN5fGTChs5iPiS
	6azkvQnMhe7LRyYNcqCZmOhbrLctwwy8iaqRXher5tl5L3Sp4z7bOY4+ar1fBG89
	C3sz4TXbCcUpd4Rnv88Nlc9boMpjcLGZ33AJbW5oYafE0HD2Z2ojpNlFJKQCLXyJ
	MSRib5HXQa7yqSUWkuGy6kyEYnTX9Fg5BE1sAtHEU9KwaWLPba1IM8pUvNJt/SBP
	m5f0x0MZD2RAp5ztCgoj+cN2tcxAA1YwbYVnrw9HmcE4ojEfJh6RHXJwdui7UsBF
	Xjg4kA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k14d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:34:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so529111185a.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490460; x=1795095260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
        b=I5jfqXnbAu+K5yIZKbvly4xkMmcd+toykRbvoCSRapj5x7z51HZTGvchLU7DY5JlYn
         GO027vlJ2p/OF99J42MLzJjegyOw51yxnm5hlK60NZ5/ROyoJ5shI23iM5QI3oxYzm34
         CBBlNQxGVu+vzj+oHHpemo68g65fIjyV/mfi0/tQVc/KAjN3yBeAWyl8fiQDFIa3iCz2
         pa23+/oy9mxsUk2UrKhJ9ewCwz64MuGmWxKkak6DdjoxWsa4POTORGJ6XQg/vSsx36L9
         AFtXhBkse29ziyqrk1Ps9KVBDP1EnJ4Aa59GG1T1l8C92qRNGfP9Qcl3DN89zpYm+F31
         BfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490460; x=1795095260;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS0b8nEt88g1wfp0LivrvP9tCkFoNKaIyooh0vFsgK4=;
        b=PZU211OsakzlHbAdSY3Ri9LerpHZblb49BDioGz3CBkyhlnmdnwaEHlunCOnHTPmFg
         M9//xc+YCd0LN9oCngyxHmCui2CZoYvXgEt6pz9V4OhNzK7fO3dn98ZmSA0HzdR83upT
         RVOYn+NC7vy0+0hlBeUcw0zBjVHpApcy36uhAdNv7lggLm6tnb1Ck2SwFr6Bgz/NhcSE
         EB+9PUXBHYAS18RisGZYiodenhQbD41Jog5qrx3X1pwVWKK8Kg8GzcA/M8epEWkFNx77
         2ft74pYeeqZFet71sWRCmdWqmcT29mHInQPkJPf+TnkUVO0XYW8EbR79pQQZObx3YcR2
         KrBw==
X-Forwarded-Encrypted: i=1; AL+hErHfTFfW9U06T5Z9k/f1muoRowNE1DyUE4p/I5MLYcKKT8Qo0jbo7gYg87udZrRIxW3KR6v/tQH+p+Cvhpirbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8K5fX+qHqKPA37b85i8oEa0y7h5MTlLp7tWA2uRhlRwdWu8UBH
	DtNixGJwp+QhPv2CqfONCIoP3TuEGgPbYQhhPgtKuWF+r2zxOpGNjlZEk3qxxtwBKl+p3qsc7Iu
	E4StNXz4j/fAmZsFy+uef8H02b5lrQn5fGhNSd4WYN31tRdyhFg+xSWL87OYsx8OHZr2xOg==
X-Gm-Gg: AYBFou3MZQnoe95MgYk0LCLAzEXmrBOyGUM1+8WzEipdXhKLd4BhZEqx54pIibk1HHG
	sQx5L5BaKeh+DS0bTF+Mt7quQFkExnppTxWEeGjOkjvV7avprpyq8TAqhmi0cS789nIkpZK+jiA
	D1ACux9pUnwq0AaWKGG/Ekf81IcnrTfF8oxb0xnqlXWgCRMjhlkBqlRvsIVV0oeLsfQdwZsO+U8
	ZWWYwL/5eZ4s1Yc844PSQ9cu5BeXoLbLVLEsEQl3ALtT0mFn6CYxdOZHpdc2Hkq23qJKUwoZ2Sp
	oT+eU01wJ0wIf/nWhnZu0jkxr8lU4EhXkaW8I2iDY8kNKMikXuAH1rQhqTzDOgQBBSfyLAOuDvW
	VR+hYQV4csgJ8Ct8kgx2PClkbkQa2TEHzZntyP2dZA7cbNf527eSRpWaTCbS4TNVSpWO5XZ0yp4
	BWfYPB3UPSLYBGqU8F3arV8TDS9eLS+89AudMjGrz183ykq92Dq6PAwd7JZS4bExoAszD2WguXy
	OyN1SMuUiS+PdWTHDtk3AzVTGu/BOIrbrLM3izsny5w
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr607631085a.3.1794490460202;
        Thu, 12 Nov 2026 05:34:20 -0800 (PST)
X-Received: by 2002:a05:620a:a01b:b0:948:d833:1bee with SMTP id af79cd13be357-948d83321camr607626985a.3.1794490459701;
        Thu, 12 Nov 2026 05:34:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a67ab93sm341707766b.77.2026.11.12.05.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:34:18 -0800 (PST)
Message-ID: <f55dddf1-d745-471a-8001-8f9e5768d97d@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:34:17 +0100
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX7YZpOzNJcGIj
 ZdVKKn8N5vh3z33pQHGPkJ91c1smCJVeBMKR3y3uOkZZnanFjj+L6gattplmJ36PICRyi/zt82n
 uN38viA2a0lbeGRbbplxB8zQTOURqGQ=
X-Proofpoint-GUID: i1jUy19Zkd-ATG12LA0ypXj9FXgQo0dN
X-Proofpoint-ORIG-GUID: i1jUy19Zkd-ATG12LA0ypXj9FXgQo0dN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX1EGKhpsTTNxW
 WteV5DyLALoDpxySdqU1sUztH6+U9eFVxhsbDbu5D9WcTUW5U9FlID85cOEplbj6EA2JtUVjV9D
 xxueGcm/xRF6GHq922l1+VIsAjTT9CEN9JEhNIWp/xsKnYYniJh1B1GbZbbLkAEmZ4nSnI+ZlNN
 6pC9wNw6F+Ks4J0y0Cp87Biu3a7Hl+drgJRCqCo3wQ4F9fucD4dkdZh+E6YWwdYfUgF+2dZo1i6
 9wakDdDZKBDrSLsRGDtDPKbxTdpoQ4FGbGJiSfGaiyb/EQlKsWB6bz6KrcxhY5EsU0NKDvBSgH3
 oX5VxRl/VDEtETy1mlxKrpmvkU+ZYZ6k/ozF6ZXeehX6Pe/4tFV2pheB7ENDAhoAH8wZPu8x/re
 qy1S5bbHG/YDeiCMeBsPqHTISZaUPgNAd7lV2qNfU1EDv8Vecf9xA7fbOMN3srAOfkiK4NedjWu
 BnF8Ckm9CXdxyh8ey+Q==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c05d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dp6IbyjqBwS_WhlRAgoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120053

Hi Mark,

I was about to send a regression bug report for 7.4-rc2 but I first
checked the list to see if a fix was already available and I'm happy
to report that this fixes things for me:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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

Regards,

Hans

p.s.

@Kees, have you seen Dennis' remark about the same problem with
devm_kzalloc_flex() changing the semantics with the num-components
counter now no longer being initialized to zero in at least 2 other
places? :

"""
Kees, the same pattern (a *_flex() allocation followed by code that uses
the counter as a fill index starting from zero) looks to be present in
two places converted by 69050f8d6d07 ("treewide: Replace kmalloc with
kmalloc_obj for non-scalar types"). I have only read the code for these.
I have no hardware for either and have not reproduced them, so please
treat them as possible issues rather than confirmed bugs:

 - drivers/spi/spi-axi-spi-engine.c: spi_engine_optimize_message()
   allocates p with kzalloc_flex(*p, instructions, p_dry.length + 1),
   which presets p->length, and spi_engine_compile_message() then
   appends with p->length++ through spi_engine_program_add_cmd().

 - drivers/net/wireless/intel/iwlwifi/mld/d3.c:
   iwl_mld_process_netdetect_res() allocates netdetect_info with
   kzalloc_flex(..., matches, n_matches), presetting n_matches, and
   iwl_mld_set_netdetect_info() stores at matches[n_matches] and then
   increments it. The per-match kzalloc_flex(..., channels, n_channels)
   has the same issue with match->n_channels.
"""


