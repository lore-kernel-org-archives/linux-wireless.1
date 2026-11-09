Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236441;
	b=A7xip3vab5bOh9QhYyTKH4WpgcIqrTAxQJKSmamU4YW8GD3xYo07Hmd+bO3Q4kK0ukMT
	 e+Pnw0kz03kbOjH9B1ChXE8DC1spxoTnJ5mR6+adH2+5IJ8jmkNnOwoib98zF1mxS7u0m
	 TScyTv/3Xh2q2Az+ECzIYwBfDegl9kjDSDNpuNkPhrlErXYw62eas4JpO0rv/6zv+8+03
	 O0YIYP0CqTwxrPFxsuIM5Oe8g4emyMiNaE6w/U8z9VKGSxTN6lLkNoYTa2bFdHjhXt4Ea
	 +vw6xarskyrhPcRAqWu0gtiaqEVTScngZ3ObRxyWi6LKW6tqX8kkdpV80TcAhNV/mHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
	b=pPPjjoKUfpFx0nYcFeviWSvtu6iY+jfqggNSXkG76CX5Qu6m1mXtgUhKD3MIgR1jSBCc
	 udiNh0xPbRqq45qEUPMKaowGTf0RLWitsRsTu0CdzFXshKNm+xG9AkOv2vRh10JSmE/sw
	 Sfhaz+AC6l7Ww37/e5lw9TfgacZrOiTlqaFJ8M8YMvt/BC9+brkYPKRvUIQfrhEc7uCcB
	 01MCk2IcPfFvb6eFIwJJrrtt5e5qAarYer3HXqqr7PyV7jFbDtj3KzU7YwF61WQGvbYl0
	 tHNypxY6C5gBVzPuqr9Q5uqf+7OpThhZpxBl0GA/ohm5EJQILHo6TliIsvVHoTKqOig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UF1Seq3E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A7606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 15:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UF1Seq3E
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEs0E336367
	for <linux-wireless@vger.kernel.org>; Mon, 9 Nov 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=; b=NctNdtZcMYdvTKdT
	/9OUZD/qmpDdrtC/gm7Dhj1O5TpiNZw9NlN9CRpWh3eB7qlyBIIHgLN+sV1rX8zV
	MJzpTe48JkfeUiRyNCyeteqMHnGAAmhCVGAcYKVhen+Of+oCYTinBibwY2M9FPft
	ijncgMxHX//+t5JRbYO0jkXtW0w5IsTGj1KhEDkQyuqaI7dZquDM/lOU1itfcVsw
	T/GB8ImYwPcIAiES1xdoHvcwF3faS24kVpURJinjg2emlZdk91+COykXUDXO7vQk
	r26J9x2Xpz+2YLx+kpeEdVFQy01oaWh95rIFUMdp3VLt8BJaS/mbouLk2o8GnBXT
	B1y2FA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rtba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 15:00:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso535762a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236428; x=1794841228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=UF1Seq3EcUn8nFb7fvChEz0YBuWONDZO9NkUySnJiOUkPMAIlcI9vLuuqMB3iq6dm1
         lvIFkwYAuw4pBfenTFR4GEawPPwK4KjlgiqId2HxrHNF4Z0KslUSETBMjIlns3/PHrdV
         dwNoRSrW5vfi8b2BaJRSmQFLfp+ILOtHlZef0OuY3OSzMaxYTCETZ+QWsFYhKEfQEi8M
         XrciqyDdoIk6WubXseeb+JN3vCGyKO7Qlb512bwna5PXmAlA+sR4pbpyuVZXkquYyp6k
         z9k3E9kd62dUpJHjnRm2M/3y+RD1E1UzdWgshhvR4vEUdnHm1or1lp8syV6gQmpZJk9v
         Slpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236428; x=1794841228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=joCz36jVtqbiGcrCFE+rZwqCt/zQ0K4e9wZgFRBX922K+I6IYrRG/lpAE0edPXF9Hv
         RrgAnXmylX3TJ/stsOZNIcsbg1UVlYGpg0euMi8n8EclJ8qx3Ps+NWQy7xqNIxST2yjz
         rG55ZMQpIkGCG1rMXAbDtpb4Qc/77Rtp+23gV9EI9he7bL+2FwMFjP5b1udb28T1efCj
         J7+15xddhz4/v0j27yVK1oF/FaNaR8+/Kqui24n/7TYBW4kNdG8Leac0WwvGOO/APrzd
         bJ1YYUcZaQdlnKDbw4OHzW4eYKI3QKi9lgi/Npiqg5VNUiD4TpjOfU1jv2LDD8P3QEBP
         z/4A==
X-Gm-Message-State: APuU4Z+CC+8/cA9DVhArhwM5gi1zDrhjjjXfqxZLWbQVJhOS0Q5tv80y
	c7jj+1JuozX/bwWP+9EiCFRiuu2I2zEfVWi+kKBNCwmkp0LCFZdCowyRouoNK/t6vhIN3n6OQlT
	yYwsdLCdM/rXqqa/1vRLb3x7eOB+Ig3lnl13Vg+C1wCkVjso4yr8nxMzBjwSOLwfEqKytxw==
X-Gm-Gg: AYBFou1F9dPEMyLFlajRQ4PP6nGGk1kXslmSiAd77/fQLQK9RZsMELlQpAhkznsD4Zy
	u5p0mIROJDc3rjGbE3LcN4Z3Z6ythA4J5i2EHcyWo4SMcplY+0mhcqP13/prDsxDNUhzupXiBbK
	L8ANPWAzc6ok61OxIdvkEuRWakNiUPobsl2XDlfkmhyCdmzMGIk/qP2DH8VCXvJV6DpF0I1d7aR
	AK7y9BHXvRksF5YVoWdF4AZMBsBZiwjCd5ZSNZVh0ec1tRaBVyfppYneEXPnbZPFIquhbuHoV14
	gO16d5mxkd6jkzCEQ+K9v5xQc3nDVEkl8RidZmtjPdlS0fECU1dg8YBF5/gnCwg+ManPntpPh/1
	Nz0YGW+daIOX8VNvs1E1N96+nbNQYwTjPkHwqKL/8FF99a8atLfmeGdVS99PpHMU78sMphFdHFZ
	D9+9QCI2t4NOL5af/7Cbd9r+bKpwkFjhg=
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48200775ad.42.1794236427769;
        Mon, 09 Nov 2026 07:00:27 -0800 (PST)
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48197085ad.42.1794236424114;
        Mon, 09 Nov 2026 07:00:24 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8173a8b2sm12837335ad.67.2026.11.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:00:23 -0800 (PST)
Message-ID: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:00:21 -0800
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
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX4+tRIPxAovCI
 trPmjHfVdZmYsnXuOrOAXHgZFfeZpxJHEY8BVd6/i47fiZ5K5yR7fmXe8f7bNyZ8QPFQygx3dSS
 lmNLCrT3YiHcmms582YFOWDT/S8ddiU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX5Rhqfyg32DoO
 ooAUPsGtpS0E0o+0GLLGQgudHpWfskERTYHV2ecdA33ZcM8rPUfOXBDoXCb1NzqWMz0B8zJYDLK
 1lIRyyeBKr+tCPnsDpfYSgLI0SeH3HuZdQfaxJgk4bMei1gotk82VLf54Dyf95iVJpj/iDKQ6M6
 oHn9LpIvd/vDnsrTY12NIrIkTzqcrFZr915WTNgMOIGPe+asnUohn0AZyJD3R/yyjs2xfiTFnqU
 klpmyLlG+FbkviWtG33FKLnCBeQ82qbD2oeb8gx5fyZhuJfqIUR8BTyU/11EsarioHiYx/Dm7Ra
 TbmWjJfIuPk3i6Zp6gO6Zy1w4OANcWE5lwVgzam/nwMpSs8bkgAb8XPBA0n5BlFUopEpzU088HV
 fHK1BxHmePP8wJ4/SoQTas0r1fN6N1OLnkgrj2Ly5B/jscOF+0OcOhwOv5cqnMBRnuu+pD55cI4
 x3kCrJNoHJMp8EV6C5A==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1e00c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=mvyCH3EIRwqJGMeifaAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SUdZ4rjy-JbNgGItx_BwwjYW5RJKGbCu
X-Proofpoint-GUID: SUdZ4rjy-JbNgGItx_BwwjYW5RJKGbCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/3/2026 2:29 AM, Wentao Liang wrote:
> ath11k_core_get_rproc() looks up the target remoteproc with
> rproc_get_by_phandle(), which takes a device reference and a reference on
> the remoteproc driver's module.  The resulting pointer is stored in
> ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
> tears down the firmware resources, and the probe error paths after the
> lookup jump to err_core_free without dropping the reference either.
> rproc_shutdown() does not release it, it only drops the power reference.
> 
> Release the reference when the AHB resources are freed and on the probe
> error path, so that repeated bind/unbind cycles no longer accumulate
> remoteproc references and the remoteproc module can be unloaded again.
> 
> Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

+workflows

I am no longer accepting patches from this e-mail address.

Go away or use a separate e-mail address per person working on this project,
with that person actually responding to review feedback and adhering to the
Linux kernel etiquette.

/jeff

