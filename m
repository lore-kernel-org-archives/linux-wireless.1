Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293647;
	b=S6911wsht7Bau+RyMnKv0rH2RYqrTmhNqJFOps7ni03kFxRIfaMyf93x+UCdlovecf6m
	 2Ba/8VInkwKtPvjC4Pzp0sQicOJsF2sHUR7c+gMRTk5ODuCd760ly9M4cFadjpe2cymrw
	 5r6x4UStsiHLFLJROfrXPUB++VrqLjdkT4AUfMZamP5D05MNex+d0wGy7lEC2jRDl18xY
	 5xsYG1sz+twjKKf8YZLRxTGaMx8sQHzJANVipcmMjOuyuc2wBhY9HXwidls9Q+tmcylLx
	 0Av7zEvR02QDHEPrIX0F+eA7m5fEdYedcI+n16P21AQ44vqeG1eT2XGpGQe786S3UzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
	b=ZZZ8yn33PZ5D4RJEreI9M8gqPGsO5xxuCDvswa7bYX17JZFwksOgFHPFbFFf8jgLVYDS
	 kdPLBRswQIjcYqGD380j/OCgUkiD+3/oWmdCNm37JwG7vd2i/pDrIcmzVNasBoF0kHpJS
	 KDZ+5GqelGKa/45Fk+tYwF+Gi6CY/es5ryJM+7egAa7HEjkea9RkMIzYWM29dEQQ47mdX
	 ISzVDCThxbyxRaVSWOvHn1L5rUaTN2sHbPoUDaL/js9TIv6hJ8WFXxnG54pyV7hMjze5e
	 fdN/fjecop6QXSRgY+vXiUnShfE5hrvKleHcf+1WIM0SduKwLvGvU3ip8bN9Gj842Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bZITptod;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcH3WKTP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C0606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bZITptod;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcH3WKTP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2Gq1207398
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=; b=bZITptod6jUXEZTV
	RTmKSWH3iXK9ZY4xekxOzuhI4YdAh/46NictV+MLlFRS9mrGrjymC7KF5JGhkiLt
	D0sEPYUBt8o3X7sfWn7MlhyDoy40HOoXcxpRZN7FE0FIuu0/656KXs905NeatLVY
	Q8fVVXFhPurDlVTY4dCyM4EkdS+BZ9GlDdlehG8nwsKszfTmr4xkUML5ZYoU9b88
	/fhOm/iXPFmsPeubTUE8WBesvcI9eBH7vU0CFtpAsKk+hDNKt9o95bs3wsnjeNcV
	uBCHmbzdnAnnEpN69u4O2OaQ/3/FtMMv3w7zT+g0OtodHEkG6FdO7CuQIDCJcTy3
	bx8pOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhwpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:54:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so1638053eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293645; x=1794898445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=GcH3WKTPUYP34bxKsoLz+3BdTriu9D4A/OqAo7rCXtqcgDKv75uNaPyqDDPUDpUxfU
         ojVRHxM3Vw6GWQ/AxrzMI/z84kyqCvYUPp3X88iR4kRLFWrZbVlX9kzBMxSJSBHSfJF9
         5Zpfpw86evBKTiHWG67oSa8ZDRtGaoj5JXUph/fkfwaFo3eDe4T4Wp18FP9vzrYhdj+t
         Hrw2Kf6Z+G8CwB0O697+JQVPtIY940J/hXwB+I3aAi9Kbhd1Hiiw+Xk2seRUXgtwfoCL
         Rbzx2QoQYUBpmxAF8+VtYgcz9YKRg+irdhZbJwWxYeDNFSNR1GtClrPWwGw0nacCkhMI
         7+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293645; x=1794898445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfP3mHj6UreH2UmWP/6El04+4RtDHZBRlHJch/l84Kk=;
        b=eKo8wUhOmRbty0u3Czm332SUiH5MBozoy/5W0mWw8mCpq7qOMGc0ID0WSiLbuX1jX+
         LjI2Xh+xXw21MztGlfyTvXq0V+kYV1AtkdsqAJwGwlS4Sz6cbMCUoESbcnJ/z9oFcdV5
         en2oeoxmktPFLcJq1kDH7kleRkpN2tF6kjtegKsdKifsJCB6ja1aACr4X66ObjPL2qQy
         8TyPtZsfYB2M5ESZLjJ7gkcbJc8+ZtLdsZhZESZF9Eh930CW36PUkfGMmo4BrGNEBk/l
         XNoZ2YJx+lFhjfEg6iyyeHgvbkqFoM3YjrT7y11YppCGIl2OkX/KYzXpS4WpkIDi18y/
         kixw==
X-Forwarded-Encrypted: i=1; AL+hErHqrj7wzNz7Vrwpzr1doCNChzKgJRHsTkmEGGM59nkQ1nNKD+vXsRleXNRKMBLRFJh5X1rrnqHlGZ1c1zjHPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+G4jbc8NtixoGwfAUI5mT77Zn0sWS4zXW3fSycecdBF6Ar/+wZ
	AlLcYtl1m7QwG2NiSIMizhO7NyrjxutYXObQyUw1CbB20ZsWL6zDxF9X5GtopxncECsQlkt3kVC
	BVNZtm5A2dYm3bd1dx3VcGDhK8MbbCpxIbVwhe85Nr43YqUPlgDzP+9hfUJVCvl2iN8YEIZvazs
	d5Rw==
X-Gm-Gg: AYBFou23Kdke4UD/JkkCvj8DFIlFhK8t2crSqusS5gMZRhr7JPKZhH8VmksUzuWhVA9
	tLzmvqF19l19jA62yMuHrVZFkM5DkRDiSVdQekrz9rF8JSedC6oDnZxu4U4gFHb7MlIQAJLloMZ
	1mmBHWR7qbJb2+jwCWLXqheW1/CU38egSgcXM6q4w0gQAA41+aALFXdQBIFB0OJQqHJbYnuGNr6
	Y8wPRUswtUPMdwHaThXBlYfF83cPhvnpEoEEleMuaARQhJoKnNO5l76CpSzODdg/dCejtwvPA4v
	Wm6pArqvAfFZ1W/QnOQwIm2KGvInQxLTayAqn9eX7xK7ATVXNCauT86I1D6APA6p2TSlSwkuukg
	5dJZI1JgXfi2C8UaxEk3vFdeaOIme270PkP1H5AKH9eptD1jqAm0EWiBMMN6Iv+cd0ZcdJxKd1L
	CA1EDVG7xiACbC0g==
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124985eec.7.1794293645063;
        Mon, 09 Nov 2026 22:54:05 -0800 (PST)
X-Received: by 2002:a05:7300:6811:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-3751ef7fa4cmr2124940eec.7.1794293644375;
        Mon, 09 Nov 2026 22:54:04 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm5190187eec.14.2026.11.09.22.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:54:03 -0800 (PST)
Message-ID: <e269da8d-f3dd-461b-93c5-ff4c81843918@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:23:59 +0530
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
Subject: Re: [PATCH 1/2] wifi: ath11k: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
 <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KWSt8rVuC-D2VqJ8Ip8g7LpXYy00tgel
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfX4THR+3vEV9Hu
 SZiGg+jE+qnnDXXnDCXpvsvFnojmJOgnlpgvk+xTzwq3ltlHYwb6PFpBhUy53TwfA1ddvPEvcaG
 nYzH4orp+C1vY/EwcU0uUFIUBjtvU1k=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bf8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=_icPHbadw2IDH2Vg5WwA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: KWSt8rVuC-D2VqJ8Ip8g7LpXYy00tgel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNyBTYWx0ZWRfX7lQTtTYga3f8
 qZY6hWiGsrrbQ1rubgojcdzero0TlTU7tsNPO4Y5BaYihg0XItgdwb7UhE93322Xq4kU6HRIyCX
 0q4rBf1REPcjqH6b3BpDV4+inwhGstCNGDPx97zVaybCTMG8xJUOj0/RiWDk1pfua1p6psDJtTN
 FX0eJhs4pQ6nocBNs6vexdL0waXIzo7La7OZorm7YkU20cFFNpvlftnQnVYWXTOUo14R64eCoXd
 BfNKHUcrW2FUBz1zBgCrti8lGB7cglK6BeNX8IIBTKIzCxFL4ByEZacqZbtG3qYR3MhT0eDM82A
 iIwRLpVnHK6W7ShZUGYfjtMpjeQplex4969gs7iyX8Zv0UCMECzg4VaoioM46PmakSLh7SmfBoG
 2+9V5aulQBcAkrqR+LPixNJrenAO6vB/bBdIuTDSqu431nU3De0s4CMZp2d1PkGshQRBGtsRndR
 9RbEA8btgZtHQPiqaxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100027

On 11/7/2026 12:18 AM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> ath11k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
> capabilities into the WMI layout one bit at a time, shifting it in from
> the top: val >>= 1, then the new bit at bit 5, six times over. After the
> sixth bit, bit i of the field sits at bit i of val, so put it there
> directly.
> 
> No functional change: a userspace copy of both loops gives the same
> ppet16_ppet8_ru3_ru0 for every 6-bit value in every RU slot and for 2.5
> million random threshold fields. Compile-tested with W=1.
> 

this information seems to be unnecessary as its obvious from code.

> The change, this message and the test were written with Claude, an AI
> coding assistant.
> 

This might also be not needed as per latest guidelines.


> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..d7ae9e8747233 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2496,9 +2496,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
>   				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
>   					continue;
>   				for (i = 0; i < 6; i++) {
> -					val >>= 1;
>   					val |= ((he_cap->ppe_thres[bit / 8] >>
> -						 (bit % 8)) & 0x1) << 5;
> +						 (bit % 8)) & 0x1) << i;
>   					bit++;
>   				}
>   				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
> 

both comments apply to ath12k patch as well

-- 
Ramesh
