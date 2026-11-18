Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043349;
	b=xyVbujr+tsuUR6YuHfAeWO3O83xDFdgAxYoVYEtYdoYX4/a0fC/YMsfjDyTYgjpIvMZw
	 RsWl/WJlOaJSq7kBylBdnmVzCeQTwRPRSMUIoOc/6oDcOObTJPQz0semgZ+NX9aU1zy/X
	 U/SQVhRcoBSRKCyZ9Rrt9Heeuc/V9OYmIYyz2C93f3OU1wgVTB4O57h7O6kLNmQ1mQGyO
	 fr8I38JAGuSezRjXGPQi7tHlez2dVaWgMljzeThZRDLoXiUGqWHw2PzIM89AbGUGwqTDi
	 OphH7i4pWPsupAZZ32DBYxmAF0Q3ij6+HGMesAewH1LFk4jcXi5ek0I8fzuBW1X2Z3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
	b=G8esst0MmLFuosWVBglsKqPusuN23bRtr6LBSWIkt489VaKySpc9WO/Wnd7s1Yu9dG4R
	 hv7zaFSa1BjXZblO2/Mqqpe8OMoohM3XxvYOUzSxjm68fBG+aYm8jT94Jr53v6EXt5Zr9
	 JKx0AwahCA0Xc9BajvGOOSIHrrkyZ+8mS+8f0boEFiF7EwEZxCzdCe+pUUkVITNmprn2y
	 Um9JSIm24GIzzFJoFh1WNOHq1nyy+FyxVwLG04sUSDloydBavaleF6W16thSHhkOe8RZ5
	 ObQhzlEHBUQ29ssaCukFFR+xywUY8634EdYo8RWJI8Rvinvm0uoNGr9pYUi05qVrxqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5CTr3cC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7WqHvEh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAA606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5CTr3cC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7WqHvEh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILE4f32370061
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=; b=c5CTr3cCu2FYKStr
	IDAWiyoLLMlGs24hDExVv86kk3CTt5p5KvWMs6lghByCC7bjG/bjxH0hoC5ylIxc
	8O3xw1vQO6LH6zH69oTlj8JZERWSIrYRRTUDHZFwgLeg45JWgy0RzTrI87TsjvTf
	kitnkjRvBXooTU6nkvJGEpSPLZR1EcG7Kq4qCaprDsq+fh5xBxOJYe36x5MWj6Qe
	eNj2byYDGTF1l5ofcP8dYVfKgTftmntsyeyJYkB1ZYRZvvPYoTTnhT3LunxNJxz3
	KL9v+lbjkDMTqMUVqshdMGY1PnkvLMt84/AatdpiUPNYsaizsJ6/zw0xwdi2CY44
	+LmwgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrt905-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:09:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so316504eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043346; x=1795648146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=E7WqHvEhoQLJp2mj+TW3B9uWF3q51qpnXX71DPokgmDOwNjFG1chmdH/CmTv5fquve
         QbEQpxgekNzfkZ4oMkvBb3IIu1IHOPjqcVgqz1UOxs6EhkBtP0gaRVNM6VinZMdxvt3F
         5oEMyW0ZzlWxlbrLVSgdi4XRdPLryg0d3SNzqN0cMuSegEydBNCmG3APrgogcaWwHJRR
         +Ondfhss8+CkpiumFa32s2FYAchB8SckYgLglHPDVfTdkQ4q4zFLAQ9KLaNujci800BG
         2hhROjmaPdeq6NFVSZRT7xK23OLkJZlE6dU5OQTS8PrTE4encKsq54rCMct8j+OjgPRC
         QDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043346; x=1795648146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=Ai4AybFrL21zVnSYr1OHXJbUAqRausCpXeOpOcXpd26V+cb6OLkS2lRM6CfNPrWTb2
         QCN1j7RQhPySacIArQe1WNzhQDYl6mneT5y7/XP1ERefvU/fu/Hn3DH7qK6YYUtxiMvR
         UHHRB5nlk2oy5D96YXBVyBqvvmQGkD0EGsiXyQdHlBUFAgavZbJGfKnEw6q46b19e8sZ
         zGRKkxbFntkvWl6mh/sLINVYHFNcMOU2lGY4nyp8s8kfxEldeZBVUT9Lu8QB6usS4kWi
         4JITnqmQpRktCmmAS4K9OfqmoYa1Z1IhtXj8HCkwemzeqRBpRw6mt5EJf1euo0hZezJR
         XS8g==
X-Forwarded-Encrypted: i=1; AL+hErENm0uufqjpzXbLnJobX+oQKs85o+l7CH52C+HdteIHqyaEu4r5OGoktyWWF4iq7n11ZFKhHhnom+EmNeJYLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0YWHRl6/kd5rtT+kIB6zR/9yFIcpUAWVUtJDEQ38di06RckwC
	BFU2SMWYgqWkn4xWa6VDdLC7LC+24cE/WO6yZ5zyPWMH5HsKRsiE5LU7/3/Wa/gx7fT7LPMvMsx
	Epyll1dBQjhrNmoln2sXNDElnr9KW92g4kEtCC0zJQ8F3q+P/pqeTuzi8axB6q9ZeU0kvysdBFQ
	SJKg==
X-Gm-Gg: AYBFou1WW1Z3WsZrCRs75oxRKkrXVg7Lw6uUcmU0BppnvBFbof268rnrKccsAwPpknU
	AaEwqMYcKjfSd6FoOmM/xIGfb56ozNrUWXt+tYlOrWRYsu1NMj5KULvfreeIyCg8hiFW4fY83lJ
	6WJ91R2bW+2fT5LjKiaMmdDlqu1YKTwfqxtLNwJp8bOWz0g9aCYmQTfUT1GGMKW7WZIYCz2ZdMk
	UkGwpgES5HdfXKtEFfQRujHORm1HLMyNKA0oBBo03b5aVVYzqK65Jit8ZeXlkjNJxPMFtzCXkOo
	xTAUJ3hktsK/vtN247yij3tECAiEaOOu5+Z1KuCaZnQC9wvn2p8UP0Bfn7ax94DOc5gGW32ESUq
	FG5/ocfJ7ixb82a9lBGpcoO5ePoU80TFlCHWTMnoYkJ8wfVOm5zoygBZKUxVq+EbbzPv0qVInhX
	ZDdabocu0wK1Wp6Db6eFbfNAgwjK9S
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241219c88.3.1795043346045;
        Wed, 18 Nov 2026 15:09:06 -0800 (PST)
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241195c88.3.1795043345438;
        Wed, 18 Nov 2026 15:09:05 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm9253095c88.4.2026.11.18.15.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:09:04 -0800 (PST)
Message-ID: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:09:03 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261118052116.3901761-1-lcy8047@gmail.com>
 <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX5OeWqjf+D8LB
 lcH4fDnalqJjaDxz1mvqn3ISSbvBQ0j5nmC7JMT2wVTYuwZC+NLc919cVMDBD9zHSZrcHLnwBG+
 iPRW4mFpjiqbMU4yWsko4ND4zhb5VBzuYuwOZO1Ke2txh/zb9cBBpjt3lLbaMlm+/zXCDneI23a
 3QQK4UeySE+7keJUKyQGcNRBUiG4KhWyocttyoqmDmq0+oe7TzCCo5J+p8b6XpsgooiHIz7KuKA
 JUXOHtsBvYv77S1uAi/Flw5658mtUdhHSkqfTPg2YTiOt7y7wOZ0FALRQtbwalVpinvEY7TJPH4
 pKzqWl63sVbqSh1imXrNehCKaBlWj5NGGlCYz6ZRXAjlbIUHZFTIbl12lbQwPjwily0sSHdidq3
 pZQjIk2ubUNSu9PQygX4kLSU6hUHCrZuDyv+1xTDCILwl6xuSOAT1OxMGyK4M0I82oFIeZeAYfy
 QER3e4KzA1L3Md9yF3g==
X-Proofpoint-GUID: rIk7YLQezIwI15CA8Cwqq44zgBqn1Hm3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfXxJ9le1e2xI/o
 YsIqCkGEHiiHyepda0tnhgh+9pbQr/Lw+PFYdzTHOttoN04k5x19BFCLCwB7jzatnqXoZg7qlTk
 lReUJTHeNw6sPl7PAkoTpzXeHBVud1c=
X-Proofpoint-ORIG-GUID: rIk7YLQezIwI15CA8Cwqq44zgBqn1Hm3
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe3013 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=W5knxR3aJgrXDdnN61YA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180085

On 11/18/2026 1:56 PM, Changyul Lee wrote:
> Hi Loic,
> 
> Thanks for the review.
> 
> On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
>> The above message looks too verbose and confusing for a somewhat
>> simple issue. Maybe this should be split properly in two fixes.
> 
> I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
> allocates an msdu_id in htt->pending_tx, but leaves the entry there
> if ath10k_htc_send_hl() fails.
> 
> I also noticed that the same error path doesn't drop the extra skb
> reference taken by skb_get(), so I included both fixes in v1. I think
> I could have explained this more clearly when covering both fixes
> together. Sorry for the confusion.
> 
>> If this is a fix you should not target 'ath-next'.
>> Two fixes tag looks weird, what are you fixin exactly?
> 
> I Cc'd Wentao Liang because he had already posted a patch for the skb
> reference leak [1], but I left that explanation out of v1. Would it be
> okay if I sent a v2 that only fixes the msdu_id leak?
> 
> [1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/
FWIW I've rejected all patches from vulab@iscas.ac.cn since multiple folks
were using the same e-mail address which is contrary to the DCO. So I'm
waiting to see if there is a repost with an individualized e-mail address.

But I also don't want multiple fixes in a single patch because then it
complicates backporting to stable kernels (unless both of the patches being
fixed were originally part of the same kernel or both predate v5.10).

/jeff
