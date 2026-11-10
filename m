Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333394;
	b=LX2A01XyukbohF0xD3viDXU/BL+0c0PLU20vuf96Jt4V1Rg34dNQ+XJxUg1O6dWQGvNt
	 RwQ9FVKvPFRYvBb60CSSjLhxtJdCpp2jw+m284UKmnqpsdK1UJF0+5HgPhSIeSf9lz7Qy
	 EmNhikU3W2mUj5M2LT5Ib5OgzX7anYNxFeIAO5MC1EYHiNaf6yICwnI8U1DDfgzl00XsA
	 7bqdpd9GKv9oweHC5+LTDsEDXi71zY3BMsBU5tlY1xIfyRZDf9C6ojW1LG9EbjWT5tlzV
	 zTcyBFPaENaLU5V6njY99IshXqEFfIXHJtjvpdU1oJhPQYSRALnITQdEqrTYf9HP3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
	b=AgP0txGQHzLBnQz5C7wy+aXp+aUDKhf4RvbNomhz+9vDnHFXbcKnJw/SIPxkGzVFSV0t
	 MwjAjklFqncbAyUl2aUOVYb0ZC5UmIjy3dufGiFNphF9Y2zSmcKX9tHxbFBSY9CB4SaYS
	 jdqJyPA+FRZsb5Vrynlb8jwEbJgNE73xY4cnwGXkOWdR4QAbd59zojZSyLVhQrrhrzTYd
	 Bg94oGpOopRk6y1hEFqJs9xL+4fj2EWykZ5B+IOvWiUIm0bX9zEnHYH7sH9dBVnPg/Mfx
	 BQhy6xZEC0HJcQGaDacpTj0L/YfNiL+3nMJsXO2vUh0KqSEGY4JnQ8BS2Yy7oSp7U1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSWZn6aO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmab1KoT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01EF606C694
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01EF606C694
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSWZn6aO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmab1KoT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF08ik3376618
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=; b=lSWZn6aOLce+tvG3
	WgvAUUKkWfeSDc2aOw8DZAnZlOmoT/1P1xsn6I2RsYmtlPQj7OVcZAbZWUYnmT+2
	dpTYQB18HK+4vUO/BbL6MmLr9ugAplJ6OMa8jrHjuIAADR2JOlYFl7iSpv6BJrpL
	VqScEwwntSwSrW0yrsJjWjZUXuQ0nfobMOpv7nGLC5TUJEmuDZb8Ju814jHM2nIm
	oUcBs5XVI8xNXND+/Oq4wrFk38A4bAFwKCK4a09+p1x/wwykwxBqc5GIUdECnsnZ
	Jyw4gl9zoZHZYGsekG3RVxOeioQt+lYS1iULO6KpNKfjgpAuvsAPl4iicCFR1WQ5
	qggyBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84ahxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:56:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3732315eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333392; x=1794938192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=kmab1KoT+l9vG+osWCGvAlZP8IonuFgVVlG/l7bTCIiCII3CXnc7ed3C99+J9mD9eq
         0roUdcre6+v7lrKbSOfGU6VsIePLE7buJv1Fr+swxSaU7XghkUVmKoTk7SEMrbO596lV
         DiSZj9jTC5JYvJNCquftsruKt0hCRs6k5inzEVnqIqOmT7l9iQMYr5BW72jGMXQ24xd0
         McgtQvjk6eyJzD330iRmca3QvyWVaYQdrl+7QOjtp8vqqS5ngNPMIn/oCHhAqZ5lZD0H
         54tNFXOESsOq7dM7UT4PGXp0efHdpF7/jmSFa0TetJi5bAY6K2hDJN+8SQLSvFPLjnD9
         uPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333392; x=1794938192;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZUI5Qe+6KbAscqoiebvNwhOHw4y5pnZE9XdJ3jmNes=;
        b=go8lzHoxZRUytJrsk5Or3LARm9hOjf6LRlyZD7Ja6oB3S3xn1gx3FubGfMmK3IYwdW
         M7DCFj2ocYOrBvl5l0KdsJLqMg8ogFoMx1ncy4eZEj0cToKQfaZp6EUWq21p/ATkKAdJ
         fPazpyJQFLrigsek8Q9VPtHUyNvAfTBzcr4oBs7kJY6hU84OZFIh/KyCdFFsp3OjDZZx
         hGV7oDqNKl5qQ8gmLuIjaWFPJQwRyGFJu9E8p/G+4nmHMo4mv3CSCevGydscYZYbtcbO
         udix7R48s7TTdnWKbvvYnlTGPq5B2V0Fiue4TT4ArWumNCLEllXUHiQwXcAGMy0fz0xN
         CxZQ==
X-Forwarded-Encrypted: i=1; AL+hErES7Zq71MF5Li2axvtg4qoR0abRi8nyR8L0J1umFG0OS92AseH8NNSri1DZqVbVNj44ImwabmAKBLQhYNKT7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zlf6fALAWLPRcKWxaqece2zsVcObJFMR4244VplZ60xNjKM0j
	5ycHdJV1USQFBENvk3s+ONKKaT1fWX2u9QfmCTxuDS0eias0GHd0cMMM/xdx2KCQqdYqVJgwaWF
	ykp9CkXaIpc0udgbOi/wUVWmMv26meW3p2cpXvT9KzDB5KFK3i9RV6bkrH6u1YYlHEez1IA==
X-Gm-Gg: AYBFou0g0tvYmV4xbT0/2JPjXJRdb2Gx/S/ZbrQJfIbc1YiX0cAJjMIF4cbUt4LPxiw
	HUyhgk+uewkDnJts0PiNWNtp7RdUmmLUzblgFF+fxHb+abnhtADE8uGRnk8EmAL93vbDArFm81+
	tnD2tS2ZjYXBxElMVZUzSD5aB0f/9NV1dyGYyx/NZvj5BoqcWMXK2v1zQ2qw+6h457qambizpud
	PiCnX2hJcRCMB+ORXC+teQEly555adaVawxd/u8xPiRVfaaMGAgSSn/Y4e4+DxluJWHkhZ5OmyH
	mfmbSyvvEq5B36Io6dgGWFG/uCSXpXk4U8eYqhr8MMxTE43bi/V6wTVegtDK6hJBLEs9Xq251JS
	svX3wdoJlUafN8Rq3eOJ34Ll5M8aFQdOg4DC6DMAz8cBaLxivT0hGFa+kjsQDUO322vHh7xaLGb
	Y=
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31641eec.36.1794333391516;
        Tue, 10 Nov 2026 09:56:31 -0800 (PST)
X-Received: by 2002:a05:7301:e22:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-37686c3af76mr31586eec.36.1794333390890;
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Received: from [10.0.0.50] ([76.133.89.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm9766790eec.26.2026.11.10.09.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:56:30 -0800 (PST)
Message-ID: <7e7b67ac-7d7d-4769-be74-c064241d5426@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:56:29 -0800
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
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzbfRiC4nc1qJ
 ANLcL7c6tAg6Vdq+8G87wVMv+3XQ0dIw5wncYzJI2EjXt+BL0OyLcfTEzMh8j8xLnSrbJp2TXxu
 InK3XIJEywajSINJJ8Y0S4MEiyeK4klIKUCVJfaEDoB0vaWJscaRTYhUvRjzgUYDnouyBvoLj+A
 dHy4+9qsxg1mgUQSWK0jFmU/HIZWfCDL/mCGo2lRh+vo49AI/5yBWLKPWcc9yWIUhhBZlMfXrrK
 4zF7bjJLtctQTPuWHEJknoI68BTvnhhZDS/w9V6zZ9z/OMW/Bs9Jvz8YRx28r3VhaJIVDPajwAK
 FfnFIPN3W1AN98sUuKqviR8B1S/0kvLyYs/OJLXWzlRbQAE/yVFBwpdwtWKdLLpQxuojVKeU/4e
 0G6Bor9oWIefLWxB1raSy+QqE+Z1UV/cwBQYEfz4Xk6Aj3L3nDZqM0eY/YAnzPhksB+IqSljy5z
 wE4ligbqo234jxM1m5A==
X-Proofpoint-GUID: g5QpHHAYuBMDzowpbC_BxTtjAJKKfkbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX0tW+LVobCQ0j
 oxXGx2JzVZEn5G8puTK7R+s0sFlA2j283Zl+N1DMGhV6z+BptjcE3PaA6rBJ9JjokKLoHBurBM/
 0kNLTtAwYyxVmh4fbj5g+8Jaxk9mShM=
X-Proofpoint-ORIG-GUID: g5QpHHAYuBMDzowpbC_BxTtjAJKKfkbd
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af35ad0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=6LbA7P6A7bvUEkAB8wivVw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=iW0bIAoc0toShNrrW9YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

On 11/10/2026 2:34 AM, Wentao Liang wrote:
> Hi Jeff,
> 
> I'm sorry for taking so long to reply and for the confusion and extra
> work caused by sending patches from a shared address and failing to
> follow up on review feedback.
> 
> To keep the existing discussions clear, I'll continue to reply from
> vulab@iscas.ac.cn under my own name in the threads for patches I
> submitted. I will not send any new patches or revisions.
> 
> For context on this submission, static analysis flagged the candidate,
> and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
> preparing the fix.
> 
> Again, I'm sorry for the confusion and the extra work this caused.
> 
> Wentao

I am not going to accept any patches from vulab@iscas.ac.cn since the git
commit history shows that has been (ab)used by multiple folks in their SOBs,
and hence IMO violates the DCO:
    Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
    Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
    Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
    Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
    Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

If you want to contribute to the drivers I maintain, submit your patches with
an e-mail address that is unique to you. I have already rejected all patches
from vulab@iscas.ac.cn assigned to me in patchwork.kernel.org.

/jeff


