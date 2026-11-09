Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794188966;
	b=IGXGOMdbXcIVrDxGPE3y0ZlUsxqeT33tH3oWlXBkywdLY10ZS+HuVIEe68XZUefRbuAN
	 ck8SucbeDUnCMqPTHcnCdOUdQjBUMoi0C/ZyusV8ahpwky4PALZrujIsWhhDWcxESLTon
	 A9vBWK3LS/oYTpns2C/2Ht733ISw78Al2QmfAAv/NHvL5L1VN9IE+a0ysOq5g6APwcpb0
	 VwGjLhVuPmv+ehTfoOCJWeA6h573W/KGwpu7hABEZx35q8KhJe17EpbCoON4p2Xrc9xUo
	 fb41AuDlFEIbkka+WBCYe9s1Ia9k4lWuGsw0tzcwgzlub2bYx+tiiyXkKBgklpnEvnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=;
	b=Gl2qfDPy/mLdaHmE4/bABUTZqC51iplA6WgmBRM6p55urfkjoR9li5f33u4/EFUo0kaO
	 C+Gi2msRvf4zu1LDJEdTCURpydD0hstj3byklXGmvHdcBaPffmr/XlnqgyF1YhDHkLn6V
	 LPxBq/Qied/iz9HQ4RimH+Ruxq5FKP461XufLOZvvQdEVtPCdLYULjBUaCPOrcG9b+VTU
	 qiH1o+ZBbSXmPQTk2VcBM65lXgBDdMbwnIJLzxZ3XGTnnX0dLcJYTOxlTGaMFmxlIGPRz
	 NundgjrYrPMnJ3BIg76MWCiKxmvSeLzBL+4QxH/a4O1fgGcNHunlFMUeZC55bZ68j9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWsdR478;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dsoZ+j8o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE985606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 01:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE985606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWsdR478;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dsoZ+j8o
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GsR32871653
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 01:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=; b=NWsdR478VNsccUNN
	3LcQbVWJAUT7+R4ZrflKI3xEiudD7i8mwmOYdtzQYb0r26htbPglmlUPNmDyZXNJ
	WNapA2jjxmxgJscQuawPpHJKiX/DyeKLgaei78GT+wPosdEkNHqv7r0fVMa9fPb3
	i+9NY+EzaEpCBRUlC4puNizzLHGs3apyr0/yXrp0s/9nO0MOkXHJmw3Rm2x0TxQl
	PzZSpbh35R/m1m3khBvpbHEHSIwOR+wJUVcyEIXoKIk+4M+Rq/s3FvLKMprFx3OS
	QenkNQkDaWpzJ9MTwsHPaaOvGLArxI9tJy+v5xfnD0suLMxW7IU2dCk1WSeSu+Bt
	qn3y1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnvnkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 01:49:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so385516a91.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 17:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794188963; x=1794793763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=;
        b=dsoZ+j8o3kMtWWVdza49JO3jCvq8E5+l+32g1qXml8sg3SvDjd7sPoZUb9UlGO12dU
         LS80DL7gFvvv5R6GM/BVgFIkDN7xtFAXiLhz5Cwfgy4FvWvs2l658SCJr3eiiR0Pxjwt
         a6otsqoMoTF1yVhpAKUqp+ow4Vx/pkdAzJte/eVZRbvW9Qc7eftaHfpLsUnr861ArQj3
         GLtn4cZbN7sVqyJUwnjCxc9mnwhDnhd5k0yJzKZZk2U4nPMUSOSNwVQFqKuuH+MpzcLz
         N+gHV3iTMFCUeFNJk0XJQNeQcIsc45XyekM3ThysoQNGi6mS8FHZDzePXxG4OdbCxytQ
         xLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794188963; x=1794793763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=;
        b=TOUpv0Yc6T3KUWfJebtR5rNYcPUjAngqaDWFHHCrH8KbZonBp0sMMaxq5CsP4vs6e2
         HGMiu3UZYCyf7/MKUjBkHpzexVsvJnUB3mEj1nWjFRXaCaFY0sItShNpfvvz7xMy0cK1
         9Vuqw63ztFRrOAnB76HZ5X9x06CV5TuKGOWialT5vcbVosDFGbbV5skbZfwz5qozdLyB
         ENLqBzZSDWw4NO6s/Dnb1qVfaZT7lkTcxuzPlsRfLdfXY9VhYb/EJfqWL/l/Lji6vhmA
         5dvRkp3SMyz/gQnnjltRLJENqyrAPC01vtvF1bQqJU2/7LnUpjF08rKep/rF8pfzO2sH
         5OLQ==
X-Gm-Message-State: APuU4Z/RTy27StrgIYXzkf5xpm8LqrLJQK1ayb1cUPyvyhKZLCO6NdQw
	dWek+d1p7ag1sS7nbYXPKngpTQNsycIfeJL/Y6TryIcHax0VTiXjVCcCnlrmau48D5noNAoGPZU
	fIVA26VlgEChfeDHW8sBy9inEiBHIfaRTqpuYeKh9yRAHPOsoHvxNZolHDFjQfriNF1pp4w==
X-Gm-Gg: AYBFou3Z5P/Iar++R+86hNYtHkBkLuPyvhYrpX5M9ThJUBQLSR7Tm5q5kkNcJQx2Cc9
	fLeTOHkybW+rcRvVJ7ZR+pTrPtE+2oCeMdculEjyDJ3dXMR3A3Mxa0+F8ctFxgkoWQVeCzCFXer
	PG+VKEurDzA1g90W55Rs5b39ocwrhl5YVt//m67a/eB87up6inKbnfVpT+b9El1XVKlfLtUTsJt
	uQmL+vLxHbo4mliKTjzqdq+pV3FEK+h2HtCSh61TbSz9fcFXhKpe68s9B/eUVyTmOPjoWrLfiWG
	twgoLDZZALvZnfBU6aRPvfv9xFyU6wy+vcVeo27z786HKEg7uSOrF4s09Zl9+pWZ9dgrB7PceFc
	9uVecFAUB/WV00fP6f3caW+NTFHeQKbrNiWv6YzofkfWBjR/kl+nEGbpFSTzivtG7CJLkOOBuOh
	ZHtv8=
X-Received: by 2002:a17:90b:3889:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b12d5c3df6mr1800176a91.40.1794188963455;
        Sun, 08 Nov 2026 17:49:23 -0800 (PST)
X-Received: by 2002:a17:90b:3889:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b12d5c3df6mr1800152a91.40.1794188962934;
        Sun, 08 Nov 2026 17:49:22 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc487e05sm5296034a91.1.2026.11.08.17.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:49:22 -0800 (PST)
Message-ID: <aab38321-5a63-44f6-90ca-f63be35aaa5d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:49:19 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: remove duplicate ucast_ra_only
 assignment in dp_peer_create
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y7_RoFNxpRnqbkFvjhg0bb1Eeyv3TKdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNiBTYWx0ZWRfX8n8Xot8S3etg
 tZtLvmnuLZXVd8KeoaeX/mZ+zkPXyFWwV0uGTLL+k6xFN0R4U7oAq8KHrZTPPdttJCUGuukIfrO
 02QN/WQIrFaOYL26/AgYxO0lr9nbuWeg+ktcnhDCHgnZJis5AotcL+ohI3Qg416Takgo9l6Bvov
 ys1UtdVcvvh43OEtGPJ2vzJbQA4lZ2nA+2zeMaBPRyiuuK8iz76G8kOKdBZn6q2iMnkmj2Rw0+H
 WsCjBHSvdEt6RX1FHbkV8cXr9XiYVvVo7qdnulATtToXqg17tAMY8zBvDf5W+DXoo6k+x1Unkj+
 kmPq7y7VRZJgbpfgP6eupdB4xzjfuz+LahyXDE2dek5vNyVI6DY/l/3auRNyaFxu18Goap4vJjM
 WRd+364/6pu48apUPzmjjryDu3P23OAQCoc00BBqmE96JeBw3dMIcn3kHTM+bXoWkL3sxTLXGVa
 DV+t748R7bQ9qzmTrvA==
X-Proofpoint-ORIG-GUID: y7_RoFNxpRnqbkFvjhg0bb1Eeyv3TKdC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNiBTYWx0ZWRfX2N0SAJrt2c1f
 3cCjHwA9mk0faaONmx4X8kq532LrcK6X080MsXcwH4/JETPmID+stpHWYHDDB189pb7/CGk+HUF
 8iSXNnLjhTnnJQs4yExN76P3ZPArBp8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af126a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-Mx7KV1jT1rGfaPvk4kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090006



On 11/6/2026 7:10 PM, Aishwarya R wrote:
> dp_peer->ucast_ra_only is assigned twice from params->ucast_ra_only
> in ath12k_dp_peer_create(). Remove the redundant second assignment.
> 
> No functional change.
> 
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_peer.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index bb5341b4251a..c9075883f976 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -486,7 +486,6 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
>  
>  	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
>  	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
> -	dp_peer->ucast_ra_only = params->ucast_ra_only;
>  
>  	spin_lock_bh(&dp_hw->peer_lock);
> 
> base-commit: b9acb873d035fccc8824164246535ea6fc95c71a 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
