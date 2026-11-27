Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760714;
	b=Sn/9QXuSkZJOobROW5XD/i+clE3H5NzfLYT0cH2yp6m1EDpoACbvloZSUJ3xDN5V6OdD
	 6nnhHEFOAEwoIWm+PQmWclpLOLjSCfzDET3YJEgFOe2SHYrFRjO5aGuR63zck7UAed16M
	 E2om8B2usGjLKs/xBfZThhiqSdBb8l/UOYdeV+Sdg0soYwf4Qxqs5vNGXcuV4kio462Y4
	 UuTv3GNN/7m16ubJwlmwUNo6BCeutvOQeBvy1xwtIvGUqmMhPeJNT3SGBjgwnpfIk9gxC
	 fIJuAcYWrsMBOPRdXK6EOf4pKlUMgFyCwPMjWCfCJfVX/rj7ebTqHodvzCfSKg0iX8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=;
	b=rnGyuChaGNQ+CfnJ8Fv5hW2B6UU2cj8aiCwLdFWrZqGBlJgtsOBxks19LZSrkyI/7Ho2
	 y6AzDD26vstpdcINwm9+6D2lAQp/BglG+jCjMlTtK7EGFerjdtXVVXgKd/1l1dd35424m
	 NKrFkW3Msw5ZZZL73IxtzwZo80ub84bnnL/FhsN1WV4Lnzp7EMdey3QiKLjVC81HcJio1
	 JO/gj6h1rGIpDusHgCG+F3yGESc8xfDLrXrNGks2mYKuA52uWWZ8T/JjQnmwHGhC4+a4C
	 6y3N6S6elTAKXnT/Es/Bqp3HLrtPpDL1yljnGZ5V7gfVHCpc1WESo1cO4Q+oSrAiuqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWJd4BIF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuOhQf0C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C721606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWJd4BIF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WuOhQf0C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR5hFc11012358
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=; b=jWJd4BIFD542LOMY
	LJuxB3vC7aM/CYM1DbYrWPcz2KiimXWoQpji++7n15+vLf+N/htCrgy2DFqRdxhy
	sBrXz70EnX5WmP7TNabFBO4QdhhmYwZbJUpYsy8gCvKToeaaTsCSR6/C1olYcZgZ
	2nQSjbDE8uT4qRq8FNG5pugWwq3m7R96sigYy1D1VZKFylmd7hIUPXrWlzVgOfaL
	r90GufLdy/HuIwjshShzx3HcvcWmpNJW4jWo7DlYzegXL0XzuWQzjgPZJ/jT930+
	lactU2spTxXAvQP3v4JDooLRDlnlB2QSKRPLc13hc/wQkQfiJ1tC55cTI1HHfoVH
	qZMP2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf9239h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:25:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41b099809so6580986a91.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795760712; x=1796365512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=;
        b=WuOhQf0CnmzMGaZX+muvecaUCYwE2XrxIT4nl8A9ulDQ4KjzcL7N2bsGjeKDihshZ2
         iKWwKpPNKDdjN64bmdFELcLF9tBON6Tbqo/kzQ9uLYywVoY0AtSfS7bQabyayW3HsKaP
         lWmDBJ0XMdgo/aznjQ7Z85TPhiWrfssnw3Al89EC4SHBJMVHfKOwbVi8F9m9i9XajfUw
         w9I4UId8QIXNdMv8F+THujLE8cuV/dsY6gU9LbJF/nNCiU3LEEziprGCww8RRZqK6piG
         dBR50KEoaxuGUjflEc6+ddh51owHqvET50+OT+lsx8weyLpH5/XCX2FeZfPWMXV7gI7V
         h/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760712; x=1796365512;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=;
        b=nj1v65wlrp0VJtfZz7oG3hmn/pXFXxawvPSKNbWdx8DNCvGsw7N2vyfwQ0LR8EKVxE
         KfpO3i56vvWqnEEVKM6j/UsoGnilhPAer9vDRx7619mx7RABjb2uZjlmjLMS6zOgfeSE
         Rp9Ul19ZmcfUdzA29pYm0JOo5G/fWkGMdvpDADM0g3DKCapw+loQ+kHOzNcAALuUe/MX
         4ZhT5nuFpSL6iATiLzfzumGw7zrPdq+IOPXMc/w/X00HNwG7fIYuBvGm+wRHi83zPl6Y
         2mq4z+jBw5kBzoI9MfDhE5Mf3J0k/p87mUheG8pv6t5w5ikXklxxNJdJ1pOBTH8GGa8q
         +tQA==
X-Gm-Message-State: APuU4Z+Ir7NxqJYWD53sSWI+6ebNelkHdZWsN7SusJSqxAxeoDClUVro
	tLpzeJj/WGNoI5M6bO31+At2RJvrmWcPzP29dRodTGSqPppiYJyWDIiP0JOG45pU9kkLGW82maK
	cMLqrLMK+fo4DZbfqhB9U2ulKQzYauxsHxr6X1d87rs7bqJiWuw6ASmkuaI6rs5ZqNzXGwA==
X-Gm-Gg: AZFdTZcT0A/fGMeeQHPdgVPZiJwXxwfBPT5VS7Ry4+Dq2t6asD8/HBcsvlLIdadtxbq
	NpfEpeXb7zzT58nKNYUlZuXG/3H+Bhicvgnw0QeAMH0vrT3+WKgwtv6cRmaSSka0/Wvu0O7JSrC
	/2Hdk6XCqGkbyzyLQ2DU4rDtEFAAbPd1kPlT9w17RrF0QxXpNBJILI8gy7EiMFaKysKPW5ARySJ
	Ct71KeY6dbTp70lKcfWzkosHRmBzv7aPy09U+ciIbivT6GlzoNlBGoJibkqhlKfTcHdYUQB1NWt
	AGXdpq3hJ21FG42Wne7VDHqP0pH0a5E17g88wYr7eeS3lMdGlwqyxHQemn0/Qqv8oOEC+KvRc6n
	OneieTJjZyyoUPoulunynk/y5SrgYhmHRZwgerUjRkMOJR+/AkBPuW8YNdJFdccg5tpA57ciVH/
	ogTuBuARzyKvBFYlzKppumDryAHjVNMPRK8NlcsK0QCkSjow==
X-Received: by 2002:a17:90b:5109:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b41c9bc501mr21090146a91.64.1795760711887;
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
X-Received: by 2002:a17:90b:5109:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b41c9bc501mr21090125a91.64.1795760711366;
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm39077410a91.16.2026.11.26.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
Message-ID: <7eae8786-75fb-44ea-8d69-6669470beed8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:25:08 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: Use bare functions for
 ath12k_hw_params::wmi_init
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DVpeamfjPDkDdvAzDRbJpj5zEtf-Bm2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfX/wSytXPabWCa
 379OtsOTS0k1rBjPCs5qQorPA4OkedVlZ/nOk5tM2KLnPqUKN6RGzUmGi0276qINRbJ1sTFe5aA
 2tMMDEannc63qAmcowL5BLkuEH5/obtv3q3W0LBh/KB8O+4Caj5ZWx28XdYj/n2C68Oa8oNhMC9
 W1xzzzw2tvk2Kl3OiMTY1sUDz2MB4DSGFwip2bgwp63XPShq8Sz+Ri6B4y6J5AfUuboaGj5O8JT
 sUXQk/X65BtQYtyr0oE+aDOr22Ci69PCjKrREHfqkvpbNyztSwTJ7uUR/XSOJ3ZpV/7dlOI3iO0
 qeQycTKx2Uxst17gDBIw0ecQ8Tt/RHrUmswfHpolTopbzNd2JL7vfsBeG3HhJwWLc0gheN7610h
 05+tj3TogKyasR/rSjfyTFcUchxKAW33xCnscs7foMyPqDUoiAbqwWaxvj9TLezV/g1PKPWvBZV
 TZC4AHQx2JJmmVhZiVA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b092248 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IXfxRFBqj_madRA9-PEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfXwp7d9KMhbNCM
 IGUgoDPE1wSfZSzD1YvHNYaHyORH54SyFKTpcbK4i7yx7inRLGLIcsdwrxe+ouQIFtRSXdMAmFT
 4qG67+/QTPfqoE9Xn18UAUWoVYU43zg=
X-Proofpoint-GUID: DVpeamfjPDkDdvAzDRbJpj5zEtf-Bm2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270025



On 11/25/2026 9:44 AM, Jeff Johnson wrote:
> Currently there is an inconsistency among ath12k_hw_params::wmi_init
> initializers, with some using bare function pointers and some using the &
> operator. Normalize them to use bare function pointer syntax without the &
> operator, consistent with other function pointer assignments in the array.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> Issue flagged by Claude Haiku 4.5 during code review, and fixed by the same
> model. Fix reviewed and validated by me.
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 48a2f6da16ef..16896118d2f4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -743,7 +743,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		.num_tcl_banks = 48,
>  		.max_tx_ring = 4,
>  
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> @@ -933,7 +933,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  
>  		.mhi_config = NULL,
>  
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> @@ -1023,7 +1023,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		.num_tcl_banks = 48,
>  		.max_tx_ring = 4,
>  		.mhi_config = NULL,
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> 
> ---
> base-commit: e2d74a4def28e220ad582d17c27e7597690e601e
> change-id: 20261111-ath12k-wmi_init_param-6005e644793f
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

