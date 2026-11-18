Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011577;
	b=Cw1Ctsh71llqLSlhxnT8kF4LCj2ShJBI8TjpEk4gVU8iz+rcOQMxeBKJk/u55qzx/7kA
	 DA8STn7y10l5kDp5fZurQjsejFnOLQe6PQcqsdy8SJAT93ExW1WxQXZHjMjV+JudKp9qW
	 m7l54qqhFIBRxAqUMaL7kjsWiFTSl5CKFRwGKGTIb7TyN5ImxQ4+eO7ofhwhwOH0agnia
	 LFHEdYSxs8te1zUhIDxfeEPZjpCz/xSTH0XJ0Pi8JbqR6UW/pd2YrTDdKNLwT4Tbxkecx
	 lrjTdeBLUMctBkqkXUZZLKM1TJ6QZeZW07A1/POcfiwb5wlX1/D/vI707kEcQOUL1Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
	b=WRhHX5ZD/EpFmq20ZPuGaXVGXpfSgNUeUki7oolAiI+WTwTelZ66alpYy/y893MWMbO2
	 BKzNFuFIdcchVU0B4yVIiJVvSgH0Z4lniJhr/Qa6mpWrBsKS4eNd7QEvF9FdRC+K25g9y
	 oTzHhr1SpPrw8/tQayqAKZouKXHxJJQOvbkEqtrqhPfjz7UbfDg2VCwaBO7TAa4xY3kSI
	 FXKX7RofYlXao3Tuueg2+F9gzajbbI0Fd0gkCp5LDLGwhlWrJpzFk95JCISsMsey/dLGW
	 YLkisXXkmgVD6XluHPEqD2PiYbVmRVJGF+I+ghlyCTe8RqTlnYvKWhVOs7PGhdOgtyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVgSq6Jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aieN2r3e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54191606A33E
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54191606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVgSq6Jt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aieN2r3e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEJZYi3541517
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=; b=lVgSq6Jtrip2ZE/Y
	YwKQAwHH6WI08Ogf/On9nuzf/6UNtxG2Xy57MpyVdooQ0bhCEofEyleyiFzIJq+R
	afUVFW32a8kigKXGvw+11wsyHjtmosfGUiXNKKs4O0ZeOntMnjYsuTW6rJv232TN
	Q2fIIh1k5XhBrJ45TMWq+pEG+I+luWR20ssuIFdwLhh7SpdrfJ59gVjScuum2+/N
	cFtw441iLA1EAyspXRstm5cM5U+53RDDxm6CeBTHGxKlT6iDIANs4urPDa6wJau1
	gC1qgZYQDGuO5P8pRrp4KljwtIp9ueYcFViM4pRwdRXMO7vWxn+HBsSk3SsDiUJk
	ohzY8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpc800m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:19:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso885885a91.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011576; x=1795616376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
        b=aieN2r3ejTrtTjbHQgRJIldzyOZpDxopo68gR4h6bdiDYpLX7dtDN4yyJ/fobuFVTw
         AqSSUenkq3XX0zWDOT8C076Zz9L6c9/gSp/pdmPelS25L8iuEVgQeiBaODwPeH32TfeC
         Hir/ZVLpHUZ25hFKNdrjH1rSKrKXfyVf2R43jY8QuPVBeRcdI2kiL9h5f4fe82cMcFn/
         9pppMIyHst7+9yfxrhncQk4c5x/2YaWKIQdeSsz1nwE53A5I0guKqfT+wTU6RYMEKum+
         5DZnVcqK4g8OkucMsgASADEsDDjRIvGpQ6N/028zO59/PpoOYI8zjDqbwX8v/tqq6i5H
         9Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011576; x=1795616376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
        b=FE1m3evvWvAtQy0AcBnnE2qg8k6g/J/h32Tf1UUkov7BD8LK5xe2h8lbJy/iHqn5ZZ
         rbMqWQTHA4kV8fGOwGXlUmN5/fV6XsWKDaamJ/K2djrnb19JjlR/rnTe9DGwYa5MqFlw
         uUvaxOUgbVFxRD/Q3MsxsmB5Z69kQu8rOBHiR+cZPr7i5DV7Q9wyfwXdOvbbMFUFvFNr
         E55Icbx75Rbo1EzWwkhQnD3uKd5fa1QYPJqhE3GAXKSMQdUk+LVPDT52gsEAR902vZTD
         fQ497457lktIpr3+xSgjxJ9PWW1nWQ8ywsI3yCOrDOjZqrXvxr9l7E+rHLvHF1+XiA6s
         gXuw==
X-Gm-Message-State: APuU4Z/qcwNwnGJYyvGxDt998pqTDJxXEY3MXkwybB5zwU11y34KPKcL
	2of8DPZLK6xIYWZyBln+eoMLESJoIZJd5Q0vybwjtgjra8FwEd3lJIzQRNnMp/Ii71mkHUIiAQu
	6i0S3HWcmv2KERrHOcR8Kp9gfScJgnngjubxtltdGNED1Xm62JxdgQqe9KN21L6OagAmbaGjSHZ
	Bz
X-Gm-Gg: AZFdTZdUY52d44oua0V2e+2ZKvP0n2SmKAFGTZSwt2R/mPjtBX0FcctgSYr0c8+aV9R
	rKbZPgGfwKb8VrAd1iWkCOodmXf22nEAFKSGneCGQdwoE2QKmEgQzwGpFkXPBho7XFB38CGS+bo
	SXwnLiJo+mhHRhWV0XxeAPde+U6lTPAYXU0p2u4QqGBj/+3YQLimWq3kxSPL2npMA42VTw48OgV
	W1WiO2yRaGf8hL1kk5LS/XOW/jpNbMUJO63jN8OoG6M3Q16+lSmSNbeIBcTvypG6GPwOshs94kJ
	5OSMJoAAcktqMaRG/yXUJ5kS2uzDkTHw2n2v2PPLWuUhBQV30vNUQwj79eIQDU8r7ds9+CvbYJ8
	tbWa/qAt3Xo2WXY+x3+KMlAQs42XXxma5Rvu8ICgJodUUzorhb7U82kK6uLuiD5mH0buISy7k65
	sv/aWX
X-Received: by 2002:a17:90b:2890:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b3d07b99a8mr2393321a91.32.1795011575913;
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
X-Received: by 2002:a17:90b:2890:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b3d07b99a8mr2393305a91.32.1795011575410;
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5327acb0sm113554a12.0.2026.11.18.06.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
Message-ID: <301ca6f3-fac5-4787-893e-3ee84e3a4413@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:49:31 +0530
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
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define API
 to notify SMD Drain completion
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
 <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
 <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
 <239873179ca828ef65d0dc715c5e1c5fd079c9cd.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <239873179ca828ef65d0dc715c5e1c5fd079c9cd.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afdb3f8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HgWVBUc_7rS3-GOyZhIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfXznsgG8emOJv3
 Rmf3tszK05mREUI+V8JQ4/WxHVT1AIm6WcnfBgbEGMmwbvXzXoaM/CDhCmG9KQtWnVx1zjXWL6D
 EweaqZdjXTB1OXBdP4IWOsv7eDrmlIt2SP51vJ37PNMKgBV9iA2u5qDbZGD15tbO6nCWXFpc4x8
 ORFefDYqEOLEefb3XYWS3WOoj+aLc422XhpKFWyGCyBzPZ45rUjtXXRt7awyvfXnvC/fQetmWJH
 gvGIO96ZVECmoJxDoaoXkwMWhcRqv4YfEpzk3qEZueVwAgxm8GVaQl20UT6dwCzQBZYsvglx8AP
 wCcfeQUE5iKPzXnH8e42Q8ML8+E9QyvSwhY1tby7v8dy0mwVoA0YKTdn+/IWpSvNQnl23dDCDRi
 eUVf5EHuzGKdgPrMrDFOKCdpvtAGsH58+NY5KTByY2yj7TG3Z9G7wMKNrfelJIwmwvV0QNpBcme
 Cn5pXj+9pb1CZac82YA==
X-Proofpoint-ORIG-GUID: 3C0Z2RhThelw5goSYJ7ZvK2c04JVyNLD
X-Proofpoint-GUID: 3C0Z2RhThelw5goSYJ7ZvK2c04JVyNLD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX7/Q85vd42R+y
 ase8Ylq5iuMdT3baLMHXXbUgAMKlYXAw2e/TKeRMSrCqRbeFARgRTQTJpfeDS63YAwjBaleUp+L
 Wn8WSAzZ2GLTxXsFFGT2erctfVAtg7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180056



On 11/16/2026 04:53 pm, Johannes Berg wrote:
> On Sat, 2026-11-14 at 00:08 +0530, Pooventhiran G wrote:
>>
>> On 11/11/2026 12:31 am, Johannes Berg wrote:
>>> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>>>
>>>> +/**
>>>> + * cfg80211_notify_smd_drain_completion - notify userspace about downlink drain
>>>> + *	early termination.
>>>> + * @wdev: wireless device corresponding to the AP MLD
>>>> + * @sta_addr: non-AP MLD address for which DL draining is being terminated
>>>> + *
>>>> + * Should be called under wiphy_lock.
>>>
>>> "Should" doesn't really work here (it's either must or not), but anyway,
>>> why, it's completely unnecessary?!
>>>
>>
>> wdev/dev access in nl80211_notify_smd_drain_completion is not protected again
>> and it might race with a DELETE_INTERFACE. But I think instead of mandating
>> wiphy_lock here, would it be okay if I changed it to use the wiphy_work_queue
>> to post this event which provides safe access?
> 
> Basically same comment as on patch 10. I don't see a reason to make it
> async under these circumstances, but it could obviously be atomic.
> 

Sure, Johannes.

> johannes

