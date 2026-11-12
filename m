Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502338;
	b=EAcQQZm3GuCPGA95qveobEFZed8U+b4qflgGNyFRRg4hxFrFqFoUtcz8sNks/CIkogv+
	 PZpNyEeIJCosyNKi8vXsRi9Ehm2Fj6gQKDHfVYXIC7E6lkKZLNrLIwifVhASQQGDOpcdL
	 dh6cikc5c39TCdVOl828hxbOjpudxJKOLhbiEgkqPUbpds+BtT4AeWWsvGv9189aXO9t7
	 jw3J/h52d2eXXRJ79CtGE1yeSu6M07OUCyOayHNBQiwsXV30nJTCNJHkEZ+rsFFm3JVjp
	 Nkz6wZ1d4Tqlsp2xrcvlo4jkIsqDmfqoaFjQFv/dAvt+f3dfJg5Z8tMZHJ2vgrx1xYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
	b=IAQN5BMOuDBeQSTuYW6VbwGuvH/Js0atJpbsdcOHNJmpPPfvtEXJd/DD8Z+M6Xhhv8BS
	 1XZiH5nwmVW91ORN+SaX5eeJsqQFITnhdOLY+u3kw/NWKTScthRq/W/3hEVsawoCp3yH6
	 oc1OnIcPISoSMIL3oQJx5YeHL8plMT2sUOqf3KeQO31z8v/kyCt6WfvGJuRR7IOKOlMvI
	 NvNcefcmoaFJ8BJwQk3jWqMPhXyu0PCsUPT1tvZ8/2JTYy/KCb60xVIanvndn8nvrpuwn
	 sWLBiBkxKgiF4lym3bdN+qb/fprFf+Iwp7mTHsk9vUe/hBpMMEnSuANiNrjs3ceCIhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZOoSFz3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI5S2Xic;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB73606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZOoSFz3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI5S2Xic
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaP1I1593542
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=; b=YZOoSFz3iXFIfjv6
	YMzHKw1ZGWXkO4GIQ5jM0WQtfaEXpZiPi6ovvwAedgcsFCAWuhGGHli34laGTSGy
	1CInkkgEPmLWKOWgsXTlX3tvYHxxDbWitvoNQUKeI4WDVKRY5znTzxLSoB51gd9K
	9IscIbi10dvaGjK+JRGZ8oWy3r6VEX8dun1kAGh31RxHmw5d/l2N2rxSti0RwlS6
	cqH+G/UaJMSnVf1bAdlu0i717cNahkY2+qTYlgXvXGhDvprTTEFHyP3yjVk6UjPa
	7C5FyCBJlfww1lv/JG5OpWxDRG57x1Bxi4QM1vTsZQuLahWo1XnXbUiby/NXEReE
	i/B+uA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kt8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:52:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so4648944c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502337; x=1795107137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=AI5S2XicJlTEGIUwqvYhlk67qqus1NCsiwZVDsWkHWO6Z+jeww/Z3OfCdS9HWb11fV
         ecHIK7OdpcMLBAT6X6HlfD1lnUPv/6flYRHykdeXXGQTMZVYmuBTa4FU0tb3fp8AmYPg
         tH55b01mwiLBTTiJksN87K6oIrkzqTHr6w3Y9JVLHfBQQIonLX1CDIqqNCH24bdYX2pD
         pWFn/mtjtih3JxGHIgJd8mT89gGy4ZtXGpyT6hUYwhu08K9z37c5f0xu17F4Bj7aRfNu
         6DlxsYNMPwtvwtmsmFqjVKRKSHpaRpzTY1pQ+Sy/OkTP6T+Oxwy3v0oTEYLNKFc1xLM2
         W6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502337; x=1795107137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=B8dyv647d/AL7z0tVmsos0mp1EO0BeF94bVEkWRZu/YESPiQppokezHF9AMzL1PbK4
         uiLVT/X8dFycLq6B7i7hLZS8Hx9Wm6bg8AjQNbwIz+s9F6iX9nMvAtDGdVCVb2bZOuwD
         tLT/Unx5fjKI1fd/XXMDVXMl1S1cjey37T/w32BpIbw/COdgLvxfWN1p9KS+YVuvE7oQ
         wnD7Odze+fYk4vm1hYzbxugdhMb4zXQ4VBKRW9EBy6ZLfp3VfCqlXfrb8k0RGHQGXJqu
         b/0oXLv9GKsQR10lYZ+hAaCWagOMR/rcVaIRvw1b+hMsB2y/kY3rG5GPtL8cBo0u3D8S
         65ag==
X-Forwarded-Encrypted: i=1; AL+hErG8RqhiaXiwfDH8YKT3325MRIcGUWndhj1KfhT7eE+emR04T3TTOvFAh6DFZVbmuCocR70jnHhbQYKYK2LMsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wp1ksl4L5Z+hGw3f2pcCNywCTE8Et34YTu6jp0cKyJoE/K3Kv
	17fR0DqLKJlJY7FxLr39MD7x5J2WHvuv2V8hn8xzGl2FLhXYXWJ6ca2p2mzl2aOemaQlb+aRgDS
	f79zmnxzitmrYWzNbnY7+U1PHtHDkjvoAvN/HY3xwF5AN4uJwOu2uyt7tM+2wmpKjtIqa9A==
X-Gm-Gg: AYBFou13uRbm3pbh+HiabTa4my9PQmXoaYp33i8VelcuCYhnACLH67vPGsooIOieDyy
	EMZVDE8NEuT/fq+YLXuR/jXRp9MQJ8ODWIgLOO/c4I8/KznYwQdgeAOE4Ve2su8OIljJit96Lv6
	y03NqJ5/VMRgXqIn4t+Cydj5ZzNJtuh4OryHzY87LbWiGZHnRALNTEx10ZlLWk+8gkYoSmCTBXA
	Zb78wj2lzTvwJ5IGWWhgvnYqRK9K/rmSo6cQQHicRpjLk3LS2FB5RZ8wCu/bulZmqnHA4mYYXqN
	+kHZWxHo7HBVKhok5kDvjekUvN3A065PWa+urThWzEtrY6Gf0sWF+seqKeob+T23CvK9RL6Rl0L
	KM9d/6FfSOpjWx1VSjhJtVyD9japTUvY/gbX8cMTr7o2VCxZRmLg+mbBh/rID4aSJL5UxCUqG3q
	4yvUvX5GCcEm5gUODs14eEnZdM9V1v
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100806c88.28.1794502336688;
        Thu, 12 Nov 2026 08:52:16 -0800 (PST)
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100700c88.28.1794502333270;
        Thu, 12 Nov 2026 08:52:13 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm315435c88.0.2026.11.12.08.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:52:12 -0800 (PST)
Message-ID: <a9f1d17f-afa7-4715-b57a-882b1fe4a41e@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 08:52:11 -0800
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
Subject: Re: [PATCH 2/2] wifi: ath12k: add GENERIC_MSI_IRQ dependency
To: Arnd Bergmann <arnd@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261112092642.1144415-1-arnd@kernel.org>
 <20261112092642.1144415-2-arnd@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261112092642.1144415-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX6bCG58jniHTS
 ix8QeYbhMMy3awdd89Q48RZNAlqI+z51IrIdkAak6+dbVU9O1BCil9JQI7/ViSfFco9eJpeNGX2
 0huc9kVnQ/HeOAQ3oeyj9Owe2DKYOho=
X-Proofpoint-GUID: YPsfcRBllMiJJr8_1L-lCyfCdFt6yLPi
X-Proofpoint-ORIG-GUID: YPsfcRBllMiJJr8_1L-lCyfCdFt6yLPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX3cEFGR+X5UF+
 /sq4JG33NSg292Qb/E8EekfPsgjYUp4QTOx1MQFAq2zLYTS8ORE6BPrKtSCVGo/w+hyVLTVDOTI
 zSEpOq/aQXbrpLQst4A6k+qi3Jlg1SnX2Ydur25zees2R8I7zD4UTJPzle4+XWcy6jOYkUwvp+x
 3nuAeVugv37FxejQK7F3ke2S9fDs5PKtBZkelKudjCWyQvbjZsDbV7JgoWHWNwcuVDTFcqEsyB0
 6Qivz5Hu3SXLFsy907fy80yxsfg1jSBWLrqSUhT5dbhaCIk/FTskhArA4Vis2rptjZhJTA01E4J
 qYg60E9cB024Q2FRwv2cRtVkFdu/9zNqR5Gsd5uO49R1t9S3fnMLvu4Bu8tRCoizpHICex5Hmap
 QpiAs1v4AXjBiMmQe5CaM1ezWZzON342fVDyWep9z3JYkTohk71ttcgw4tEoZD1IIG3WkudDQ1I
 I2VbIMYu1zn6tPe10GA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5eec1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=m_PdI6EMpLEBZp9qn34A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120067

On 11/12/2026 1:26 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform_device_msi_init_and_alloc_irqs() interface can be disabled
> based on the configuration, though it is usually enabled. Without it,
> the driver now fails to build:
> 
> drivers/net/wireless/ath/ath12k/pcic.c: In function 'ath12k_pcic_config_irq':
> drivers/net/wireless/ath/ath12k/pcic.c:387:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Wimplicit-function-declaration]
>   387 |         ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/pcic.c:424:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Wimplicit-function-declaration]
>   424 |         platform_device_msi_free_irqs_all(&pdev->dev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a Kconfig dependency for it.
> 
> Fixes: b9bc9ef941bd ("wifi: ath12k: Add platform MSI support for CE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Note that this patch applied cleanly on top of another Kconfig
> fix that I sent a while ago that is also still required,
> see
> https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4e8a301f2081..ed93ff36fbe2 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,6 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	depends on QCOM_RPROC_COMMON=y || ATH12K=m
> +	depends on GENERIC_MSI_IRQ
>  	select QCOM_MDT_LOADER
>  	select QCOM_PAS
>  	help

Perhaps because I picked up the original of the 1st patch 'b4 ty' didn't thank
for this patch, but it has been picked up in my ath-next branch

/jeff
