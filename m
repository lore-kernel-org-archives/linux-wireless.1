Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272067;
	b=FqNHrBva+FCJ7iu74T0jv3LIGFD/OvcDnpQHCbnVdlv6JrB+3IokHm6N8kFzrcE1e3rY
	 1DfMjjbu3LIAq8zZhjDZcJsMHuOO5rvgANiFqIaVVtUklfvvtQBA/RxTljtaqhC46zK8A
	 OsNaLZpcy5Nv7/ZZESh3CcS5gxzjwE+tigaWz0GTuNyEEut4sL2TgWdXka/YH4PEvRSfK
	 7MQj2K0WD7h4YhxaIXZlj4dGaAUudsbP2lwGlV5bZaCsYfzFMIrdaD+HMo3QehvS+d20L
	 RIFEyqEyYtKJ18maoBFhRR7It7j6iPzjy63wa/v9tidsIDd+GlP6chSUOOl3T8Omthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DJl08VWyabq8A8BQYB1KDXcJ3eTWY24vLICkVb/NUmg=;
	b=XpiR1qO386XaUBT01E/5Wcvd0+OQP1fUp/8icQxzmQyUx1IL3Xn8aeFOfB8/MupWwKO3
	 mz2fFitcUeXljhdn2bf4dMeAZJS+WVlLTTCPdZ1vKnxOh3VZPEC7e8jodDdJOZ2FK/tWK
	 UGivEZFpo6uzM/i/DV4X8X5+o45Hb12Wng3RQkCz8NGtRI0dNCjRxzbihBDj+fX47tm2P
	 YftWrk5GcZ7H+nyJWyLcquPLtG/QgBvi+9uhqBltP5/5EMBAKoleivwCkQAfoeShVBQPQ
	 jnHs1BL/Hmh9IGNm/aEwRqbrl1p6W66/ZwjZWgjPXqYqoAmHwZcGALMcK8Gh2G3cB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sH8AqO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtdYXQQK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C73606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8sH8AqO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtdYXQQK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jVYN1514410
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJl08VWyabq8A8BQYB1KDXcJ3eTWY24vLICkVb/NUmg=; b=F8sH8AqOFUl7knPs
	M+YrOxS7TXmiIDwa+ySql8ZJ+ryxWu64ISzyE93laV/QtJz8kf/ydcnaG67/4esA
	0BotEz5vpn1/xW7es//C2O7FJ2W9UX6ly2yGwrdXX6GMp/3GxIU2O7dtyb6MZC4o
	o/QsHWKdCdWIOMsKdLRZDp1+ZyKlUd9Q6Zm7qCAZiIFXPcYwYUCwSiagS3P8qggS
	pemYl6pWap4NOJcqXrp6ccPb7V+k71coMNoYKqBS0eU/QCwBSpCkWQGtpAdDzIY4
	yUYDd1xk5u0fRLxz//PgmsEE1W+k+3BWsQYrDYRQ8iTpnylb96dotGNNCuvEh56K
	E3dasA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjug4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:54:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3507461eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 16:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272064; x=1794876864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJl08VWyabq8A8BQYB1KDXcJ3eTWY24vLICkVb/NUmg=;
        b=RtdYXQQKQ7HVjQ3FAKiMm4hQpd6JZLnWtRlhPxaUQI5KAgkl7LsN+gJ+JPam3vGRGE
         u3xgXWOjSm41CblQIcSRpKoz/9k7ggVj2Sv4LKYUgP8taUTeRxtdtUsKJ0EdLvIHN6JZ
         RM8+zACIMe11AnrUmmmH6SLcwEXJ7v6yGnVTv5/Q++oLW3RUipSDjmDVd9rPNP1V2aXl
         Qu0kRqmmvDS9SROTCm0Wd4aB9t6RxJ+xxu/AfKeF/cb0KjOFKo/sZ2sA+oyk11lIg8pT
         KVYnnfxGnS5gh5qHCn44r/PDw0wmrAqb6m1Dgf6J+hYq5ouz9qgSNc16urSErk5E35qw
         6AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272064; x=1794876864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJl08VWyabq8A8BQYB1KDXcJ3eTWY24vLICkVb/NUmg=;
        b=isq/3pIGi1NE1p+0uhuPDgnmMsnSCenWZqNvHBASvcQJScLU7G6nyqooayzqFemlNN
         SOXgkczlZAlbwvLSWfxozTE/qepUZyoQJBpWMqD58n+m6x/GuxUlNsv4tDgZEMoP7bSt
         OicXL/3K+wA19aa0PHifP8YfEaiYBUsAAW2J1ad3ctBcOq1qyNtCQ2QeLlzMJNep0SP2
         88vU9VqUGsaUrZaaOJTf0c3Fn8gO7HDpUgSxjFCYMa6AFcdAVWpfEWzgCCnKZLy+c89g
         aCHU5ZTEOy2ju8Go9j1GZpWBuJGyUt2yTHxIApt3MDHSQI8uOKnKn0nWGI+v0oq3Y4nQ
         t3ew==
X-Forwarded-Encrypted: i=1; AL+hErFeT543bmPPk2IUZnnNyMmZmGpPBpukCW4ELCFU8rUchYF5TUAB7dxylZ4GXjZX6Wb67dUeHglfPFGpU1cplA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I1PKMJC9X499jlQojZL2TXcnVnaKf4wSrAxuGrat13unqJGT3
	wqWDCJDFC4s8tfZdIojpjqKT8gYYAgjchdUnlyjevIn2REKzCr5RqCDsy9unRxh+d+frYiuZ8io
	W7FcmVvLGDy+AikybTDjuXNdE23tQ0OEgdsjK2h1nye6X/i5gnMD3QAojOJlIeZeZAyN6VA==
X-Gm-Gg: AYBFou3fP1U8Gpa+1CnCV4hCcrXjx0wUClUndYkNKJoKrPAcn8VAyM+tHccEIgcb04a
	rBi5zlyvYb+XcecwPhhh4TgENqtpUndtYb8pC+Nk0K0UPDj2P1EisXVm1pULrdLeGrnrA9KqJDP
	A3gYa6wT3t+ex8DLKqgRL3EDJV1URhYMk8FNyxUt5Q+vhP3ZbjsBP10zi59DI/DQOcxf2HiDcqt
	+2XZh3MDTg/ldsM25/ac/ZmGRUZichUjzWUsy+N6yKlH96KGBZx87seoH/L+y5PnnGpKb+JP2tn
	V93xxd/3H5AQu7Gv33BVD/AadW9dUc1Ae9scMKgExaY1ip0eNO4SYXEVkEb5bBNq0k6ZvgqE/sA
	RLMfZUPU5I2VrLLc4dMapX7x/fJUIe6nR5tfoOZ3AeZjDsY7SAhLfvYzQhulP4wGDxqr7kor0fW
	wgwpnyM5QyFQo2y0Tbcp/vgeEmTlYb4g==
X-Received: by 2002:a05:7300:a8d:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-3751f56033dmr1173653eec.24.1794272064086;
        Mon, 09 Nov 2026 16:54:24 -0800 (PST)
X-Received: by 2002:a05:7300:a8d:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-3751f56033dmr1173612eec.24.1794272063183;
        Mon, 09 Nov 2026 16:54:23 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm3368388eec.18.2026.11.09.16.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:54:21 -0800 (PST)
Message-ID: <3d4bff5b-5169-4b4a-9391-12bf9a03722a@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:54:20 -0800
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
Subject: Re: [PATCH 1/1] ath6kl: synchronize scan request completion
To: Vishal Gupta <vishal.gupta_1@philips.com>, linux-wireless@vger.kernel.org
Cc: Uwe Schnick <uwe.schnick@philips.com>
References: <20261026131631.1229744-1-vishal.gupta_1@philips.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261026131631.1229744-1-vishal.gupta_1@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfX5oxL/dSF8xYR
 J+9d/nciUS9BMi1MDhCK3Ai4YnazJqZpngXNN83aYnwD8lnXM3cF3uZNskvNFsYsraUvdJos4d3
 7E327qFaGyEvnbfseNHg6z1cB0DpqJk=
X-Proofpoint-GUID: lZGAKWzOgsECdsig2hiPwRAaMI5v6AL6
X-Proofpoint-ORIG-GUID: lZGAKWzOgsECdsig2hiPwRAaMI5v6AL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMyBTYWx0ZWRfX0FPooWrPF1jf
 1lqLSNH15eC9xo/NEfvGmQ/0BFKmjZ4uSCdVYR5kbaY/v7vLf00RpUPanhFmyVaIJEvDUs01Gz6
 +vS8aoxaYhk7WqKZARCVb1CS/NhFWELvE0SQnns8fjqei4E+DniOYyH+CpVPWRtk9zq0lHp96E7
 XFV7ydoXYCtWYK48TS3RUSuDeC50tmlZv2AkM8KuZKy4AuYeY5lpnA8tAGELBGIzOgS4AG9sG/h
 cih5PXxCnBka903K6AD2TZBAKlJVpTW70Q7R6J3fXa84fhduHLljAuIfi1cTZ7DTqhBYCWWOqwM
 AvBbf5z79pwpmqlLnqh2t50Wtqxf9geSlOBtEi2rZCK+OYCttwNAT+I1NU4ur3si/mYPruIj0ol
 jTGW4AJ/Mz5SkZkBS91DLQuNpbzq2xsXY5FbqwNud74zt/iQlbAArOrRGB53JiEsC4T6iwLTIWc
 2pVNiFBVlzLg/0zfltg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af26b41 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5lX_Y-y2AAAA:8 a=ltUBTqPhgTtLf43SruYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100003

On 10/26/2026 6:16 AM, Vishal Gupta wrote:
> Protect vif->scan_req with a spinlock to serialize scan submission,
> completion, disconnect, and interface-stop paths. This prevents scan
> completion and abort handling from notifying cfg80211 more than once
> or accessing a cleared scan request. Without synchronization, one
> thread can set scan_req to NULL while another dereferences it, causing
> a kernel panic.
> 
> Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
> Signed-off-by: Uwe Schnick <uwe.schnick@philips.com>

Who is Uwe?
The person sending the e-mail should be the last Signed-off-by

