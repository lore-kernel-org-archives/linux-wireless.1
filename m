Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840375;
	b=1CRHTv2WUkfl1LZl2ymlYRqw38c9a3WIQl7J4GeQ/kNgUa8bai6h74PjyqdjJYebhhMd
	 q8LkRDwVsH/LZwc6HxVIWq/oKdwfcCIB4NH7p1/MFk6b1nDAKTuErT9i8ZEvFz2QgvouF
	 8KQ1UP2gx4hebdG0qif1nZ9kKHpNt37mKx8P+xPIxAXm3mgzJNjd9shm1u1o2i6uUx7TM
	 JMC/1goy3F3NuEhV3Zo1BZsNcoUv6QfOky5CfNseJi1lUcFcWzVWi3zrobP/sLDaRJdtd
	 0Z0Fx4O63uRTHtxb8S4pp7Zxj9RLWHCGXYw7PGebhrjStptLDny4ADzXVTLO+r0M9OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
	b=dq8bGgS6S8RfLQ+ZwB3kLnx4C3cBDl4Cq04658CT/hTya06vESnydV0+j7fMJxw2uFEG
	 5+VR0S2VxCELDsptxpv7SfZZhqEWOtXdBpylYZpwCMcYZUkjKUY7GvtrpOlFB5bATOJQj
	 dkptCIFR0zgbexvI+gU2FU15MkUtNyjxlrulHnzSzDdFJZZzOW0n7XndHm5s+VDjsUhuB
	 7f27aCyKJzWImQn7/8209DSztUIwdw/THfAIIvIWF493bPuS3/pinWl7QT6ZQ0iZVztRr
	 ayKbdlujV3sIb2Xto//oeBhpeBeG6NTnHi+zYh1TB+4HO+qhgCorFz8BE3U1o1pvsQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hd6XboY8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDGpVOkp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFE606A890
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CFE606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hd6XboY8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDGpVOkp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrwMe3360852
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=; b=hd6XboY8GrHfN+W8
	1R6YTv14o2lXNY/6r8RsIzVsezjRtNaA2JQetf+xrxp5zQT7Up5CbvoWxQFL4N8X
	rp6kzGDfF6q3OBcWGDmYdYY0yITaSzX73+8OEaDwdCg45VBv7F2jE44R5JZYoUHz
	+Co0Y9w4aYawO5JRZ6KQtYR5+z8ruVm7HcgjhgzbOhuBCx9yqB43TUVDLwPZ9G9W
	1ZEgJl/vYdcSD+hMxGsB4nsucRvSRC8YVpBXuhFai5ugjtcF4CdBZe0UDmNze3Zq
	ZtRUiPvbWUY982FFXfNXkGRggGs0XslKqc+jnvwg07EoMGjV1NcXYOhAvBIDs61T
	dv1imQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f80jwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:46:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so243480485a.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840373; cv=none;
        d=google.com; s=arc-20260327;
        b=HHg1zklv8K7qRN+jO9nbiS/OWMMDrpGlgfdaokdpXlXzYhYHgUTSXtEpdsjYcnZoKx
         ywsD89TCil9Q3Hgzt9/7mvC+wdTfkpFsdS1PulfT5rJkBl9Kgb8VTXTp+fuUZFvjQa+k
         SFpXqm8/0kDz38zwt3JXcJ8dsngHIaSoGgf3aEotnmm5eKIaTGiqctaWn79VAdIgWfZb
         ANmm1TEKT+JYspsiFg1RS10Ic7q7EF8BXh6BvIIFX4SbxLOJrg2N+EcIgD+V6Ux1M+03
         gsUF03e3l+eprZpozuNKOmfNlPurAcNJH+3DbA98Wglx97s2K4F4r5OdXDneij5e/jZc
         t8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        fh=YwTIbBPMEC++vReD0phRIasGB1Tsg++tl8cjL0DygN4=;
        b=mSUE8QPhdvqCtEMkRmZ6hPogejq5DdGmpE+lotYHzp5SowWYYx/NySMBB0TPNMBoe8
         Q+xTArtwmybberYIHwiV2X8vY40BJLKxKZESG2Tfo5IN24Q0f7e0YeYIu2MTvcfqcs+J
         pJLg06jWtravdjEQoxZRCODaCsn3/85kJsmno3JVAewSbBaOkYvAEYepFUVn50JwKNBs
         YYFvPF9jBpaixYnpyU4QWAx7MadztCX+yRqv2XOYv5beJx0JL1LfSfBv/jvEtqpOSJtH
         jPSSyTTWPpCyrmxzDmlHjK4K9HqxUCSE6L4a3JCuXy9Kxs0GZcsF0eDT0euo95Tmlou/
         B/HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794840373; x=1795445173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        b=NDGpVOkpNLm9P4ZO4yK9BPVyMwl4xI27abM/wrKjULcTcagY1JaPVV/GcyESwPVDnz
         hBCUklTbkvZUAEFKuv7GcMuRzxPWFMs8YtpvJclJmLRRy3OB1dzN9jH6gT+DrW4SBXkF
         x+XQ5qy3u0ynUyZkfb3Z85wV8Ae7VyehuS7yrzX3xV231ajVNUU1WzCtCRmTPjYxJ1nT
         2PzrU/38yhi69ac/mDvnlN0eig9bvmYA60Z44Tlne76Z/VMRQTaYBAxFrO3mdjSseIZj
         XM3Vb4nbxSfToKJU0LsL5TbpOHEQwKzk1sPkM+jX+FjvuQE9zhg3Y6aYcPmXAeY6bOvv
         3jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840373; x=1795445173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NM3Ak3wfSZk2i1/FvSKMNPRaY9ybJQQNp5lYcYVHEfE=;
        b=FlzRagzX46czw+RQb7STFl4yIBhq8R5N/h65F0G5En0IBo8Kupzdziay4EiinSarYd
         2ZNGbkAE8B8gTiDZtp2j04l4ia6CcSSvHoG5StyviXrUKN6HaSrqkVdYu5v2oFgiHgyR
         /jRqiLLCmm6nRFA0fbGsrOJTeFK97oK1irNtTZYPn9nDQAAvdEr7abm1rqPM7PQZnudN
         05lhJz5AoKVKCZPg3iEdHjpjs4x0CztJUyf7g8jDpKgso7CVCl8xRRlfduYsdRk2CK8h
         rqiS91+vkw9G/1gKr9Wp5QPooo8IMLoOa+5vbXgJiSwgF3jFVX3wzzSrR8QKdOnTZCOm
         rACw==
X-Forwarded-Encrypted: i=1; AL+hErEwSOpBtfcYNPQglPyEHRw6XNpOYX/2jIbKOQ+KlXVlw6vThggMz5IBYAsFrEZLnQI1m6cloPRB8zD8CPb2rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jOy63d4rf+xyrqIiqsTgqm+9IjEWu4Kvs/vxgrvQ9IPt80DSk
	2tWmYPnEVFIAi+RNqwzFotc/FdJKBODjtxigQucOpFEMBuof9nmKFIyBl5eHCjp5WyHpkbf6Ml2
	mxG+xkw/++W4HomCvP+QWcWv5t20mq/OWhR0/brB3FB5sVGuDCPfXKXMjKLBe5S+LOdE1Q8avs7
	M59WKwSlznZ1JgQlI2Tw/S7KacQOdG3mthJHto3hYnMDvi
X-Gm-Gg: AYBFou1YHi6mzHoX8WfHAufcmxtNXkOtI/yS3P/ASnnUaFz5LkJVpT3dRIT5xPPqLQQ
	lfFqMvK2bRI/8jLAMh1xBY5i2u0COSBi9xFvf0sTgnpofGUz6kd/H1lYwWq+I7xwLQPPcHS21md
	ApIROSSNgq3PDXXGeW4o6lHfyOEFJ6xsWQsX1yGAwq1g/bItezvf05MdX3xYCIac1fom1BR0Zw9
	E4XG2y3UI687pird9vD/BsiMS/lGcA0QBNiJ1kY1KEX8j8lPTCAJ3oxgTeqOnj364A95eO9J8M=
X-Received: by 2002:a05:620a:1a13:b0:93f:2ba5:1704 with SMTP id af79cd13be357-9494ba7e346mr1832092185a.18.1794840372712;
        Mon, 16 Nov 2026 06:46:12 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:93f:2ba5:1704 with SMTP id
 af79cd13be357-9494ba7e346mr1832087385a.18.1794840372056; Mon, 16 Nov 2026
 06:46:12 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com> <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com> <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
In-Reply-To: <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:46:01 +0100
X-Gm-Features: AclHuK9AXwhceuz5CpVpwtm5hqf07xKgpRDq2FyVkMqagy0x7kOAlsgw0DMOrRs
Message-ID: <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfXxV0quTXwisCv
 XKw82gOD6newpEZGje6X2vEEtNcqPbXgPP7s/zx/8kYFwgyu9xMxm1vgWq3MPaniahSuTSTRb9g
 I4mK07PMImpqhV2bliqzfqhut4ALpMJzFCLOwwfnDK1zFnvc5QJQb/VkX1FbdmZxuAzfy8jMNPg
 IVXRQ/kajoLBObLXh7dGnuo8+XqrDhmn8gQYfWrVVGv79FHIXwcY6A6P2vm/7P5An/+pouUDAMR
 lGf3pRQEOdo0NQmMJOlyas0cFKClD/1i9isox4wQ0iJfyWr8aJSy5ENNJwM93+77s3xf/Yt1QHJ
 RMWaMnMpDukez4lEX+LWZnjieWYlJoVLp5TbFibADrrRnZqnYFqQnq6knYCBtejjYjO4/CbTj1o
 oRDr8yT0RwjeCOjq5bkqTMJAJCvvwAluh44Yc0tdTiZcHxXIGOlHYfNZK+5bu48WwBL+A7UY891
 4c3kdObqCgPiNAklskw==
X-Proofpoint-GUID: suDLfGS3xKQqSrcLv2bHsQIYs-_334BB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OCBTYWx0ZWRfX0w+ndEblcchd
 U2VQxIb6LauU5yqAgjzZmsoErSxKNHZ5NJh5pNyot8l+dox2avbC9SkTCNo2JaYVW9ry3KHZmzv
 Pw+Z6vw5u3zyQGZQpObAu4HwNkrae/w=
X-Proofpoint-ORIG-GUID: suDLfGS3xKQqSrcLv2bHsQIYs-_334BB
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb1735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=l_ARHrBAzVvinj3qGIMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160058

On Mon, Nov 16, 2026 at 12:00=E2=80=AFPM Nicolas Escande <nico.escande@gmai=
l.com> wrote:
>
> On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
> [...]
> >
> > The 100 ms timeout seems reasonable. However, will it actually help in
> > your case? You mentioned that the failures are sporadic. If we happen
> > to read the temperature at the "wrong" moment, is it likely that all
> > three retry attempts will fail as well, or would it be better to wait
> > a little longer before retrying the read?
> >
> > In other words, do we expect a short retry loop to be sufficient, or
> > is the failure window long enough that spacing out the retries would
> > improve the chances of success?
>
> So from my POV I believe the driver should not do any kind ok retry by it=
self.
> No need to add complexity. We (ath10k thermal users) already had to cope =
with
> read failures.
>
> So what I would do would is something along the lines:
>   - if we fail the first 3 times we read the temperature, disable it perm=
anently
>   - past the first success, don't disable and report errors like before
>   - lower timeout value as this holds a lock for a longtime to no gain

Sounds good.

> >
> > Regards,
> > Loic
>
>
