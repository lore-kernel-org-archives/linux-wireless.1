Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189774;
	b=V5v6beJ9XpSEVB1k/vakVs3ocmEUPMuu6mUKoukPfk0OPVHlJsiNMRiU2Yn9iYYV9uOl
	 wRsDYZcEVternB9QGz0YrcNCwLUO0EjAyvQeYmiejWuyV1TVqxV83HFAcs7MzdrYgYG9T
	 80XbitEq+gYzv3DOQOqxeLkYOK1SGqYM1kFjUQdC/ir55Cir2k0YczJAjkXlmn1ydx/bM
	 rASMggKLmrbNO2WoQJu7SUZWFa3erRDm2b4k7rNFmM1AKwuU5zHfgS9B4jUyxrzywnJ4Z
	 i1urW/IwvjKem/U/f1D7SgrlfOBTmZ9Tho0bEOAm9eB1UlYpgUa0nKmMF7DdJNHDlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
	b=zlpkdX+QtSiEnnxSebfWaDBpuQRsuYURX9briJ92RNqMHjT4icjLOBQqPNFYEmXDmFkD
	 XIQ0i1X968UVL3U48AQiBhrku/ZjxHesailw06mtnDFMTdEzZchujHR3/cCWcvklW3KxQ
	 1KcPnnmvqVWUjn+7ysub+9LuPSBDqN6HQr7jnaT+diFczHUrREcctJbkPNNwnW5YCiZgo
	 aaFpGW+Kg8vN6h6MKjIWqTUocQA7eNpN2r6YFiySvz8w5MqrrN7Q6e3bGCZ1+FMIEJngi
	 t6qEpbbTqajKJcekrfy/qqDR0aK5mvXlmySstQkO0NHH/g1as8YrAJ1fnUYJ7AUURgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUYUEDMQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvY1dXsS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E2606A320
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 02:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUYUEDMQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvY1dXsS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Gs783503048
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 02:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=; b=PUYUEDMQqJeTQQse
	vhjkZkDVCHXfmDIDjn+etojLsomIMcUgP5qIr2wdExDl+coNYT0gle9FvsQuIj68
	a/g7b4qBHF9gmVHmFo5jpL5pmd8Gy72X8/sgs6GM84SDc7/Eh6hB3sgfKg3D6xXJ
	eHYed1pCPuQzUgICJiO9f4HKTodcWPH2Stg6daOYahYLJYKnPG69hWP/Fxs1cbTh
	sKa3+XpFHVIDVNCIsYOaHXQ2KopdH7kQLYpcjmrT2SgfkzRppyhLFEn/smbH0xXe
	7yujuGOZvszBjJ9nCZ0mX983a9iRoheTjSVMNUiPRvVEh8M1su8g5Vp6Jy/UgVgI
	PqNVtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm13wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 02:02:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so3899495ad.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 18:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794189772; x=1794794572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=VvY1dXsSNsNVq4oHjoM1baWEV4UJEr7A0uz+WrzVflQZULCjmVssCSAQp12/ax9qN3
         9Ep8ykB8DHPiRNNRQNY1XiHaZOo2kSGXDd1M1/AtxlohHhB0e2eTpSvtgCox9l5oJ9Ph
         neYYczqyVYaGguyC8IafAi+hcU/35vHScJ5su6Y/vrvkeDcJEPvUONUPJounqnSB6lEM
         /Bx9lopkPDSsv6PuSQPYijrlyVX6lr2sOr9XEOhLvsuPnmU84FqYstwhmlkQC2oaKQkX
         3XONQd8PFRqGwcdQ8bhRtF1Izh5KpH4LVQYKAHOppjb17OpDgFjJhSzB3yJACOO1rpnn
         utzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189772; x=1794794572;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKJNiJGcbpr8z6s4EliWO1wvSZdyW+jyuqQmPlvgA6Y=;
        b=MQKfCNQ86pXuyea297LMpLMOXVs8XWZLiWOmdMC1tWNNMZJ8aEtsghuMP//bSRvbWa
         7opb3oDqYl2f3Is6ad1mPK4Ud/NM7SF+71S2LDUFrdnOpwDE4l71sLvdx4kJtHMUPjsf
         Mabo3KAq5Qco6K+J6YU2/FNdhgtz7O8jKMFYN2bP21CFD3LblD2y4EOhfxW9XRw1W2n2
         WzebnmJ79hiCsHLUMze5LElbxxAMX5mAvuyRkfVXOdG2FcZuyE7m4vzNGUzmVmUoWS9F
         BFI2XIfssQAQbRlyskH68rnvxNijI7R+rPVJaYIbWhJBPup/JKMyqI2YucsGI3vDLVUh
         om9Q==
X-Gm-Message-State: APuU4Z8zG/nA+a8UMVUUyEHwWEezuqjovtvYhPI+LXRBurKIJYTeheuE
	TywQODR+5U7hwoNd7WxPnMZnEXshHi+QxhvrCicnw+DQOBzX0e4xMuBseTUtSThocmwDtg1tVxA
	D/OIO2UxciXLFZrPeKSw56vaYUcwSlrzab1m9gV2BQoHFaLSY1zuhyJTS40GuTs8zsvbtlQ==
X-Gm-Gg: AYBFou3msXdtNDOXWdp9xuoWJlnO5O6moGAke8/ltR9QS5cSFF/ercdimTmzk+5EMFg
	9cqTgnpu9EX0S8dRlxqcC5YALaw09dnJ0F5rXshj5gWjhpTrO7WGiEGM6aW50oe3zqhNItTbBrP
	Di41rYveBZRIg5HB8mtPKOgsJkOdM4PZb5vFx1UfKkeg2AoCuAuUuuZWjh5eVepfV7Pliy1Gh+Q
	ddVKmvE5pHcuTdWrff9DT+FFDYrU4M23LAAtCrRkLkaaCkjV1DG3q+Ddneja0S8K18b6vbHzJBB
	0XQKlYt4MrhPab0jEa+KQqhj6HNiTCeBYIuehJPvLhfmy9h70c/GKOu/KTSXpmMTW+6MxFqiUWW
	/M01PdvT7DCQiVbFfY33sC6GLSopbjDUrAvgnH1xUraCGQNp/9i0k/p8Ey6rDT+xqeYS88Pv44w
	eiAnk=
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624565ad.12.1794189771838;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
X-Received: by 2002:a17:903:1b50:b0:2ed:21fb:e762 with SMTP id d9443c01a7336-2ed8373e282mr24624375ad.12.1794189771332;
        Sun, 08 Nov 2026 18:02:51 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e60b3sm6599565ad.26.2026.11.08.18.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 18:02:50 -0800 (PST)
Message-ID: <6f76f35b-0ef7-468a-934f-1c6426ca9760@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:02:46 +0800
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
Subject: Re: [PATCH] wifi: ath11k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath11k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX+yC2U9xHFIWp
 2+oM09tgNPKNILXzDNaQp9WjvUioId3fQUnBcnTxCt8mY7pva3wz9mJCLFHPXNKfzXa1qfkybCs
 XyW89CkDoddNNkn4U6Wd5/mWJyPgjrU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNyBTYWx0ZWRfX15FelZc6DzJX
 D8O5dZAW6435Pnu9peS5vpPWBLnfOGwj82N0lxbOR4z0mRHnp6AX+WXfrmPY1XkHO/Rj1V9YaWv
 ccbTH+dil47i/Ryta4bTr84DuPXE+X97/6dgd9wG/QjgJv1fhjrQ/YP+1+cxifqTgNIJ8q9GLUR
 gwr4sTkYSkAmVodO2M1Qx8IDJUWOFn55KwrFdbUPLRz243nsLpsO5LOUxuAQqyGnIJPuWQUpCBN
 8pDVX3LtBbbSnLVqmC0in6FLpJofpKd9lcR12clMJ/T5INyffyXJAJknT4Y/Ju/BzWBnBI1K3EI
 ogDgTZwS4imebkGtG1d0cHynz6Tq0fmoznou4BaTKJlMnSSCepcixstIzm2siE8Y74U1VdzwRIE
 H6SWlTmGcdcVIbQ9vP0A0+ghv/fRpobGxp69PN6H+GKxMuo8rwTIcromHxSLWmu/BET/u3Lm900
 zeho4O+xZEDf81Wukcg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af129cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Rv8SPUj7cjXdj5bJQ3UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _mjmpvlN1awcOum_DsIskJ2ICfr9HFQo
X-Proofpoint-ORIG-GUID: _mjmpvlN1awcOum_DsIskJ2ICfr9HFQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090007



On 11/4/2026 10:33 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: f7eb4b04ce6f ("ath11k: hal: create hw_srng_config dynamically")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>  drivers/net/wireless/ath/ath11k/hal.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 98bd9e3f0aae..8a4e5042d89a 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,7 +1351,7 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  	ret = ath11k_hal_alloc_cont_rdp(ab);
>  	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>  
>  	ret = ath11k_hal_alloc_cont_wrp(ab);
>  	if (ret)
> @@ -1363,7 +1363,9 @@ int ath11k_hal_srng_init(struct ath11k_base *ab)
>  
>  err_free_cont_rdp:
>  	ath11k_hal_free_cont_rdp(ab);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>  err_hal:
>  	return ret;
>  }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
