Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596124;
	b=O2nxPby1g5WOTMZgYNeCqfi/uD2oJsyuYfcgdC5k6Dzi51xGBytNo2l5xVYrbePJVVqz
	 SJ/Unk6i6xe9aFeq8BJEgKEjDe/D1OFHr1qtr6EkkdfsR9TPwUm0pFf+xwC5bLR4Hpzwp
	 dSbl4J+1Cjy1oq55YIak2tOlkAyD20td3kqO+8uum524ob0FdxeOgrgpshmYCcy9Ri8My
	 HpKaErZujA8hyYi0pSu9j2/TqAFu1MYt2ONnGhv/VgLJLieFlhTT/7F2/j4wujbbUqGHK
	 ExleyRAoimwvPB9v+50xk8OofcADuaiM2s9c5+X4AN7N2klXnYi/W2viKx3Tv7oxznA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
	b=jwk+hBLyX8bWWN9mtd11T6Wo7JCRc58zIxqMhOVJpFjWf+5xrTmusYMzwn7luahgcN/D
	 Azr80AuK+vHLXvh+aR6SSWx1xueK0ut0IBfTMZHWAXlRs9pjp4KQ6lICED2/+cqaQkbv/
	 CEwqB8vyWpxB13dCSmBmDUpCc71WFyNcrsxgy7tOXYSvhm5pS1KZDL8Z8BI+D1zQnPg6w
	 huuJ3HaxOtuXK72i98KIjZGd6yF2sqtOe6KzR4dxQFn0WFgreJRG5grr2AzGWyJ4cg6jo
	 95bD3xpk3qLrSymAI7HTm3/sru8s3jMUw9tSMTwHRDUt3WeClUTRIHI09YkzwAtSC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWTyaMqm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46389606A337
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46389606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWTyaMqm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6k4552058
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=C+cBIRvSaqDUF3L4
	ReZv7t9bjfGKXoNLE7GVOKof3PhMZfKpDZeV5rcihTts1ZwGaWvLCUHIzGZOEmFs
	b18YgMlyzdJ7pCrMscmqer9313Kg1RozSqdaLJ4Qj0e7BmyJ+TZSBWh/TORi/YFI
	UjtGakuvm4GWxp7aUBMZIWroIb2atPMmpAIzyWbN2P769tGzfUZSKaF1i+pnLsLl
	IQmt79HNWULC4yGXZB4eWSupvNBufWY4DmmvhwpLdeYV4kkDPodUwEbbhiNGZdp/
	9Lr8SWUm1Uxe8MntKszFWGjiuLv0NdiaEdhFjz4Ugr02lDL3KxEhHJNTBxIVSgfQ
	VFpGTA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwccd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:55:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1941607eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596122; x=1795200922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=CWTyaMqmzK0bVdjoRMo46ftLqI+XZLEPfZwKW7d1q7oedE+ctWPGP0BPXeYdv7FYnI
         u9ehNOOnJJ+7LicB8EYgL7xtJP3Pu4UUyZOyQ82NyFZX2oXne+3CQIiR5AcQLw+7gny9
         BfS0qxz4AEEayISpyFeydg9p3+krj8x0xUy6xeYi/hKjdj3SoNbPisTYpgRoOaE0Eckk
         bbSM+tC1JCxvCpkiW23NbWPrFZrRWB/wlIEWPb0PBxUHYg589zKbtzEK8vYRfogJD7wu
         OZUPjuNQqdYFcrxwvh5Cz7RqnzcBqbuiD1MhcaAFg2AviPNKtyFjLwdwRT2fUDDZiMg5
         Q0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596122; x=1795200922;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=lEt4JT0IV2dqAE7N5Ver2MgaWO5GfSP28AaUi7fp1+YoxcduuwsNGz5qh6TSGGgXaW
         4PVxUY2tfJ0Pi6y7MVELpnvKMEQoOo3A2ysNFcKbRYHTfd3VKI/1YiLnJNzZkTGb3G1E
         cknAKX1GOzoP288Nho9izHj43rk40RNwI/dRSVtqcCjxORwo5nGOa1uO4E7E5RitvUhS
         L4p/H0P88x7ttNJ1+XmdeEXY2A/mcR9xXByOMr+GNg2XlmFnTtMuoIy2TvO4cvF+BTN0
         IWA34+C9tm4ROlc07/fg5hK2tmsSqE/WsfjfyS4ezgteqlKW/MiB+JjsmfbC0MAf7+4f
         LwRQ==
X-Forwarded-Encrypted: i=1; AL+hErGbEVZ6Cao0vAkYWqHj7mRHmFjVBjzZXG0szkNam8qT0g3PSZ8nV6eMF4UtsWaUafld2tyFypoqs+I0++aREA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZFaCpi7TWw6Y2VZYZO7NuK19BFRyV3Uew0iWiP3wvBbw3mtxb
	afbA7nO6i/2S4yK061vJdnNNSRwpWUVmhHmBEn5rByT84pRH0EUypYoYtoV4U84Wd0Z1ns78aXN
	KlWs/n9RGRAIkeV+X43rfmd7lsNkZwc8KjeF1BIwBB40As8aha0Wg6wPCrHkkhHsqNhQ1L5/NNq
	pAQQ==
X-Gm-Gg: AYBFou2gcWDsCW4OcycVJHHmgjoqWRVUfWyX4zWE2asv47FEp64gQRCNNEazF0tBz0Q
	wFPGffGjpIm8PNulEA4uaS4W8lSd5bmaaR9VA1bh4ePnzJnadE18m4iRxHjqCnNhPfTO4lGgKmB
	3EoV8hMW6CtYMftxT7uNHHAJGr8opwgwe8BiianKsqc7pSqwmXW0PFakCRH3RmGEZwQL2IYms53
	a4BkeyW6wEleKF5OYCl3KUlQ7pMlvVscs7qoO8mHXSWGkrE/8HsGxByJiaZS8vA1PxrkSGhE6iE
	R2JTs4ab7KqNCmZbaASpjbASq9s23mBjn33wNO5LCNFfnvd8HlTpYiary0STNL5kOxBy1Qjs6cI
	aDm9bwW5/Yh9He96mrnk5rn9u5ebdpDuoSXXMiSvU//VQUjOwAHE+DtHzGJvB8IUU4OdWSHbqtm
	wzAJ7Tpuyz+r87K3Yq
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191970eec.25.1794596121588;
        Fri, 13 Nov 2026 10:55:21 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191946eec.25.1794596120993;
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17585787eec.20.2026.11.13.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Message-ID: <03e7af46-7fcd-445e-9210-395bbb8b5410@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:25:16 +0530
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
Subject: Re: [PATCH v2 0/2] wifi: ath: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75d1a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=_siAQXIdv8hbVOeHdhMA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: LttKkvang7dqkix9WBdMNCrPiynGdgpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX52YfMYg3ACHF
 /f5MqTTRb7jF3ocW81ZK2UbNHTF7i7+F0xfu4RKeqNef2bJmL+DTKNb32HKWgK5m6es/YjTgCbX
 FKfSei/Bc3dq7MOEWaRwggGfD5CLiMhQ8c/QCBe8S1ozeYELDIHD26wUqpntTaQ/8ijOVfjVlaF
 RZonqbUCrtbpDXhVIEuappuxBcsLdO68V6fYR/GZ33GPOwTIu/ET5cJle8Ldr82GeNPSBMva5tz
 OPTIJvQimAi0Xzf4tNt+Y1SWfBdc0mt6hCFTu5fAj97JxDTxYzcvNwBfmwHf978OUfzR5qX1Xnu
 G3CSRmuK+Y6MrmNJniVXt7AAAYu7O3kJM1j99nd0TxFZHqHrz5tAJ7EdMkchMm8Jd9MHuQXwr2N
 f/Eshafa9/XvV06EdWDHJDY/qzbybk2yIQe3ewYK3IfFnTA5v2tJZPmRKK/lzdVOJDHfmPx1Inp
 gJeazloRZobf8u2r5DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7BGnam7ItXQQ
 G/hJGhmsMKkILHVyrjLGHjHGVAjlqyRpar25OUic8v+NAk+k+pbBpFfRH3l9Acf19yIN2cufFNm
 m5cbBm2ERSKetTt0yTemT/odDwchYoY=
X-Proofpoint-GUID: LttKkvang7dqkix9WBdMNCrPiynGdgpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/10/2026 8:07 PM, Christopher Griffin via B4 Relay wrote:
> Rameshkumar suggested this while reviewing the PPE threshold bit-order
> fix [1]: the loop that copies a peer's PPE thresholds into the WMI
> layout shifts each bit in from the top, where it can put it in place.
> ath11k and ath12k carry the same loop, so one patch each. No functional
> change; the patches don't depend on the bit-order series.
> 
> Compile tested only (W=1, both drivers). A userspace copy of the old
> and the new loop gives the same output for every 6-bit value in every
> RU slot.
> 
> The patches, this letter and that test were written with Claude, an AI
> coding assistant.
> 
> [1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Dropped the paragraph about the equivalence test from both changelogs
>    (Rameshkumar).
> - Kept the one-line note on AI use in the changelogs:
>    Documentation/process/generated-content.rst asks for it in changelogs
>    and cover letters.
> - Rebased on ath-next.
> - Link to v1: https://patch.msgid.link/20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: simplify copying a peer's PPE thresholds
>        wifi: ath12k: simplify copying a peer's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
> change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
