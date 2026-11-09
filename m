Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260464;
	b=ynhS13y2xSOUgqAB77YBFF1xTL90ww+JJcwSI/csZcsENAFSSW2EFt/ncXTiLVe6fWLm
	 fyI13VtW7drSeb4pXiskxNPAA1wvPpK3AaqWQG02oRz1Kj/00PH6Jyy2XYHoaDJ9rcTiL
	 +LlBCHyKnkcMq7hyu5ED9BmZzqjwAiketyozao9mhOZB34bnvKnkW1raX3wwZn0zay0e3
	 4gMAhop9/aRa3J6V957Cy0jiW9tllvSjMv87t8LbAyshgsvlGObUtxFbtKpAAv3mosSUn
	 JvFvos9NSS0p1xwYsNnoPRamKD39NVz9tFs3tTqmGFmeaqA3IujUaEr8n27dg89AGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
	b=lillCcvYVi38DlAqcketrf+vFc56w37rI2jBNYmCrdCoIMsGgRNoVa75tUDNa1DVqw//
	 gwg3b/bITtI61xjsb3Fm5iRlSqK2HXmOw+Wy20B2AMPl/HVZti2smg4na/DNbcSrYTu7S
	 qZTgo+BDnT1ZvZgWDYQF+ZE6pUGGkltv13V6lkFN5l2aC6PfYSMEuLs+E9MYa6pG6vubO
	 hU+TBkwQjLltQCatquaBEmDdq4vnXh13jKhW4LBEP/CVX5jrXyNZo4sK1frksSl/i3I5g
	 UnpmAHnXrW2CHqx21uaR+ri/B7ts/xKh0AsZOu64scDbHnEFBsVPtsnO9MnoglXyWNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VwSCCpdb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1z8N54J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A47606A32A
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A47606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VwSCCpdb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A1z8N54J
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA1FC1392476
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 21:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=; b=VwSCCpdb+5zHIgyo
	+Bxe81Mk+uvMyazHf8ErYvn4v9fSiBZeM/u3UCJ+OSNqepR3/wr4818JrMIbzYcQ
	R+eJVaz2KZ4QJqLVbpV3so8+c5M/RsXcATSyJKan4wDotF19agsjLnbizjVRDTDG
	lD+pGm6BqHEZ91DYiC77+OdTDiE2/llrovvp6aoJXq37pbF76h4ldRhyFBw6Bd9g
	Cz+hG4GzVWGBfvxJuc81pVxtkoOB6zeg+G9LnNaYmJK4VPnhepfPN/SDgON7VHk1
	TdphtmBuwaGIsJHymSF0ehEi9gb5NzQEs0rLIfhRWb38u0unWhu7hBEpO5ulBSpg
	B+Ks2g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5t9eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 21:41:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so2132863eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260462; x=1794865262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=A1z8N54JZ6Yo78bfoVBK0cma7Tfx9J1YDKGp7dLTNj4GfhS8V0WTxt03FzjNrRErmE
         GAJLqHliNX4m66JpbCmGr6iKYjYfyhMyOSdbzebKHkjRYNvU2P9WIStdXbHhp6DzJgD2
         hfUL7FnFCgUxMQYLAkmGr2izrfQ19vcJ9f3TeBJgbO/XUVsKm0Is9WmPi6DkbDl5aA/n
         l9R4gZqaKx3ZAzbX947cE3y5PNvTvs1SpiGV1NIwA5/MtLA66MbEnZT1CHptY8bX0ABP
         7BjTdUSEt9tPEXuxLlXkX3HuNTuC6Wuc4KjkPe+QHseHOiZ0EarDOnVz6NOcNTY+HTim
         iJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260462; x=1794865262;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=J0B3ZDkIi8LmMlHrSaBWPPQ+gofO8lU7EGxm2iCHKQaOMZtRj8LDoPUdZ7Dbqd4Ufb
         EjeYzdaoi4TKy/F+ECbd39CnXF+gDov65hshCJXMx3FT4EAae21cAOgympZSZTjemVqe
         fgYbcrxgtK15V9aepmHYKW9+fNvGfXvMdkWJ1HqMlMZmrKx3bSA2kNwAQO1aDXHKi2ND
         Gyazg+DGHvQOI3etGFHFn3FiWEoW2mlW5i2R4k9LK9t/zCEBT3lrQFkP/eClvqX/fctJ
         vmjz57PeetNedkRRcewea5dACnrAqeLMmd+cev4F7APDk/KdxIL76zt7JU+AGGsKIuRw
         3xZg==
X-Gm-Message-State: APuU4Z8BWqOZDL6R23JulQhdWNgjXx9zxhbgH7zigzRyEeJxvRocGsoH
	2OSpayI8CAoTNF2e7dDYFB/ePQof43cPbbGbEFXVOcOiSF8t7KfxYX6BzCRnf0Mg/8q9szOIOJw
	bAptb2l3VcqbGpPlNY1XGwdmOfM1mR9kvBI5lsprS+7CmpDoDosD8MFXE3lt79Lb0PUw88g==
X-Gm-Gg: AYBFou3NxcgiBiLXgyEx8m2d9SOfFcwLrGGE5tunZWgOTY0foykxXyoltqWVBl9JAjd
	bjxlJhElNgy9qrFfJy3tXeGlS8i+sACpemcCWMqDe1wnW3iss4a6TFthgBwhA2+GEdlEDwCV16z
	16QbecAuUfWKTiDQv1cOcuCDIvil12L/0TIDVJm0bJZZpYy0kOagaYSnBQejKzGD+3FOtXK1r39
	6Bxmy8O93a2UFC244Krl3rB8MEGSoYo4ghDbEgX0klZwcnlpaXmsemcdeeSaFny9Sw3s/oRT6pA
	NRAiSJghhlBvQJQgX3yvbRNGmMfZFCAA50wL7wdlQ2ZXPrD0ti/sVC16SgDOSq8UGC5/7P5s7La
	JtnUJ0lPHPuVOwcYTNuenJ+ZaN15Iwh4N7K22FQYMd7HpnmeR8eofaZcYTGUAIOBLpve/T6GG8W
	Gk057RwjZuRFFcvQtozjEZ04WwPCY=
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571803eec.19.1794260462118;
        Mon, 09 Nov 2026 13:41:02 -0800 (PST)
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571765eec.19.1794260461408;
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:40:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for
 QCN6432
Message-Id: <179426045796.3811579.2501311030942871658.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:40:57 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX7VIBfoTtTaYd
 yft/IHj6LWAr4f/xc+YLJkzJGreSzXEqzwaNuCbqbMTI023auJXAntG1VFSXSVA7BsGFUPgfXz/
 LYG4pJP/ETKJHmmZZZt8Gm4NxJLVJos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX768pEr2olKP4
 5eU2wIDW0hKjXNDASNP0TlBtuaulbMjy23FkXvdD5pURcs5R9sVVRl7OcEuLQ3XXVzkLvsMTI2q
 Zs4kC6MGBqOCY3F5gpqhDb7W35swPL3LiV3CTD+l5JU31odwUawVsVbKrkT4suqteWo/HLqTlFR
 l4uuQu1Qi+m84g6nBqfSKautHlo4aTBCJayh/JDtx+VRT/xLgOQh8Ruue2ryfTAueB2aN4gHQwl
 e2LcS5TxoPxvRXcF16C0TiF80tGO8cgS13lGpNFmvMcX/3emMbXV2UMEu1AKv3ZQbru00CD/sfo
 DNuWKN6zPJAyfizXYpuSiNn65CUKUoDxDSINV+8lUxkO3nbSo8OnKWrdLfR5be8rqmAUF3wsYm8
 Fp/JBSqC79n45MNFaNUaU5iaak1kJQ7rjcLj1vmBU/BbywldN26okmghb0ph8pQuN7bqHh8JQ0B
 zBchty9eADN500VWhWQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af23dee cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oLphvwOYPl6AvyYkXNgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: p7drC0Yr2Ixl3ItfGRzFdP5Immv-2uWx
X-Proofpoint-GUID: p7drC0Yr2Ixl3ItfGRzFdP5Immv-2uWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090086


On Fri, 23 Oct 2026 12:31:03 +0530, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> [...]

Applied, thanks!

[01/17] dt-bindings: net: wireless: Add QCN6432
        commit: 42da6a0777de4ebd6a4841c324e6e53dca8a5850
[02/17] wifi: ath12k: Refactor PCI operations and MSI config structure
        commit: 7a694970c901406b2d308bd49cc6b62655795196
[03/17] wifi: ath12k: Add hardware parameter for QCN6432
        commit: 7b6c88854744df5b407b6e992cf105b8c73bee63
[04/17] wifi: ath12k: Add hardware ring mask for QCN6432
        commit: d4be9943adb7c04cea4f9a20c2b084be73acf15a
[05/17] wifi: ath12k: add hardware registers for QCN6432
        commit: 907079526eab4b5cce13d0521ce104e6a9f4019a
[06/17] wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
        commit: ea97a091f2462e05a6501a3bd352404d9590b274
[07/17] wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
        commit: 9b5a7ca569c98cca3e94eb8484d69d32df71ca00
[08/17] wifi: ath12k: Add hif operation support for QCN6432
        commit: 7f83e54fb9ebdc5cf2468b8f0c0fcacc4efdba0d
[09/17] wifi: ath12k: add support for unified data-region memory allocation
        commit: e67dbfad7a497ba62ebbd3be2d989f699cc3f7a5
[10/17] wifi: ath12k: move MSI config to pci.c
        commit: e40bb1f7504dccd2342c877ca605aa8f55f26833
[11/17] wifi: ath12k: Add platform MSI support for CE
        commit: b9bc9ef941bd40efa7503aa37b16bd515ea3b965
[12/17] wifi: ath12k: Enable MSI interrupt support for DP interrupt
        commit: 4efe1e0f689496268f74854515c0f211f5a579f1
[13/17] wifi: ath12k: use CMEM write for PPT on hybrid bus devices
        commit: 206da6eab6748d7989094c3babf320da60f9fa45
[14/17] wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
        commit: 3f5a096554996ace4bdba9b942600d2906a942b7
[15/17] wifi: ath12k: Derive QMI service instance ID per protection domain
        commit: 9b4353d61a6dbc4a9c72831df2379979311a7911
[16/17] wifi: ath12k: Resolve userPD ID per device
        commit: 4342c7914e4cb181051524b43a297fafc2f7a9c9
[17/17] wifi: ath12k: Add QCN6432 AHB support
        commit: ffa3eaf61775cb2239d22a138aafd2ba03374515

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

