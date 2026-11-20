Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138776;
	b=xZpp+Zt2WGMgtLe2ayX87TsCIqj7RVubk6z3/+7Mw10R2KraYNzP4ENaXYEzsVSYXDbm
	 0/q5AbqqQDS3FdhZr48ahCF6lQI4IvmcVXbEy9vN3VAdi5IItpAya1EUMxopJv9elDj+e
	 T95p3/tSSNWHY/OJ57DEqz6nAHSTrnuTgoi896k8EI1BblDkMd3xK7H682ykwCAVDv1fl
	 QZPUiMXcYEtDXOSLKkuRcXFW0T+9BlqoSZa4YKF6eEBuxCfZD501y0OO+p6JThV+xskIR
	 FKjACmSQnrELkSJxZkllydkdYoZ1FADghWzrvB+gRsYynbI4rDsZo4BP9bFDGWLexCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=;
	b=SWc9iQPPg7X2VOqFdpquntmjUqOyoPv7IfVz6T4/oDUFMIipaL833eVkuCljtRcvzx5w
	 5B9ktXeRO8YpL75TtBo6+6WAa+P4izEkpYgyZ2LgbxJppOEe6pP0cf1aEcJd0utGBuLAq
	 p2WohDA0QpDG4fqh7v2Wf/8KNO0Dy2h8Jw68V9Ptof2g5smTAxgI2J0iSYTjOa0eUdHFg
	 gjROSB7gdpeMw2oNmyitiDNcyYPaaIQYlUXBfGD9zdft9NeAhXHSADIXxcAvyToT7u2WU
	 IWqeVo6eL+34f9fHaq2gvubYBGRAb8W57+lDeyAtWy/VSddneImViP2IYd8kf16iavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8pEx7W3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jN7CF2D0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D65606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 01:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D65606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8pEx7W3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jN7CF2D0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G7s63295124
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 01:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=; b=S8pEx7W3GnOmBu3d
	jhtypC2AWFYJ6Ef6V8U27B7+QYMrnYJ2WzGN4KsA5G2jbo6GVeN/HS7aA2tNItO5
	h+HpS2vO/wS6bTBPWzpTrrnsYQV7cmQUGmhlvlJKLB0rBJ9HZFTkWlRbVKL8odZv
	pywiFPpN0OGU/ZCqK2CkKcNzBdC8vtuzIZ3SuVOLsqtjxzQQ5K2xDO+f/DcOtU7z
	vlTSFOzYKNyqkNH9JRR2jGRtisjAKchoLyMhpdpRqPUc5rg6vZboG/B+j/w05xbz
	o73i6c48Uw9OuP36EP15DLOQPgFgTuPPdAbOKiHQsqFZvP/57xGHGtnoRcLcY1bS
	HiuTgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghktg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 01:39:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso447846eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795138775; x=1795743575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=;
        b=jN7CF2D0zrjXJjxh33LV+P2KhwykjktETAYSdcXj91hD1iXG2I948Zkrvnz570dHhU
         bgi2g0rYpYsK1+6vXDhgH+h0CEC6YsW7HFARdjuJ4SfHrANC35/tU2WbvXJIr3opa/pv
         Ff0rO2k19XBpvOE1/243cjn5UDT+euflAVzeATb6V3ZD8t6k6o+HKKp/VJdKMZQlE8oT
         mBCJxUaW3n1eUp0MMVEUQKTSf6djHfYcL/t0q1tUu/Ef/qAkJ0H70j39kk2Syx4edSc3
         qFaZOzFcH+JbwB8emSTqqS04n1GenIxttVDfwXOxnU0YGtqguKOV0bYOZqatieWyqdeu
         XLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138775; x=1795743575;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/mFO/PVVkL9MEFeV3KCV40iBjqN7JJ79N9Bxo44vSI=;
        b=Hf/J2vqK7IszdUpLmDX82k4M+9oMKUx2JUKtmKv5cE4jniPOqBljPCPtjDqc22grjO
         PaI+l2LVPKZHdrxrTt+kqYh9HLm1ekBlnwhfBq73rI+nQY2jzQALaB5fVZLrQHB2YevJ
         RGAg3LG6Qk1zJCsiCLaxsYMordp0bm//xBgMO/P8OMKJvSarhRWKp+VhdYMC+mAmOt8r
         fqOla2uZPkcxFpN0zbE31wkE9dkjjhtGvhAQxCiLR61aExYU0fJTo1Qr69DREZ+F7C/h
         CCSFvc4o2E1vDzBu0Sz/sZzBXx6Rm9fdBgniySK0dnv+vnz57RW9twqLQmh6a/M1e2uN
         w6xA==
X-Forwarded-Encrypted: i=1; AL+hErE7PwqlirjetgwqjAlwoRXC3DbVVU2Ng4Dyme5B9i96gpQvvDP+ArCsTkDYnKjZGWqA2c3EgLgkH/XDIQwWbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PguWH8JXOErxxU4OsumjfsyXkyOGLB+tkc8pPTUTnb14Xh6sK
	VLtPVP/3At85K3Bqq+/kMxMdC06WzHH0l0QXOF9nvbW18fzhWweevdBoOuLS+x6G1A28v1Wjhne
	gDbzmY0Eh8U/613tDfmOsZdIreZH+MdMliF/KDm+cedZwEmjb0POOaGfNI8XHxNDR7B6FRR+0Va
	ownA==
X-Gm-Gg: AZFdTZfDlwkcMfCRF4nLbHMDIkcSEFxcUTbRTtLK8rrRlZtCFBpOP/YlNHyYbrZ4YJ+
	30NzLA+9NKYHqGUYs73gQ4abuf3Avmr3KJrMkZZSki61TmG1xhEVtTP42OgkYz5cCuThlas20bR
	5pOLTLP7sfc6mU1hBp36ozMpOELq0GDIblD8gFfvHvVEaLmLH0S2cLO+OmWjWdh8tT3BwfhWjxJ
	PQ2LZK7ICBp3eyBPt6WcmhAtbI8HBqoJAFPPZHH0ahvYtIvd8r60CFRBmKuQSbj/dSYLe8UeYni
	JBYrBd8YJmYm5Xh7qsOjKm158dVurh39lHf4kYLVGRYUoYD6JMXn+hozN+zS5L+RnmyvVez9iq7
	EBywIaV/P6X4s9DZ6PETuvtw/pD4Fw5DaFblsOiPFKjGGQsnDrutu3qGvcONh5f2vgyraVyyMaT
	OrFZagwquJdZJqMIv1Lc5Fw97JMiB6
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr1035493eec.31.1795138774702;
        Thu, 19 Nov 2026 17:39:34 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr1035470eec.31.1795138774025;
        Thu, 19 Nov 2026 17:39:34 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646632b9sm2577799eec.1.2026.11.19.17.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:39:33 -0800 (PST)
Message-ID: <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:39:32 -0800
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
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza
 <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
 <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfX92wQkBU8vYAi
 vwqY83k1zBJmlCR78LLBcwdBp+7p9ow2FBXJw1bzVV6/gMj4pSE72O/4Je5m//sZW5YR4bzDfQ0
 yQfW5vK6k2ulj/wNoH8AzkmXIIPoK0TJmRlH5nEFrf6tKlA7OU12YSPtU3LZRO011zy//U3FPcL
 s0N9oJh4f+PLG+EAHk/tkL/WhtRJAUOOKagAh1cKKrq3xczPmkDd2YTjUPhvlH9b6g0UIq0HR7F
 SlkxD3LpgQyaFKAL9kdqW7N0rOzKjNvBt6nDIk9XHxiGz05yh439FBSC/K73SMwmDXGnXKJKC+u
 uToiwdYmIawy3PaM+PvvXqbB41KphV0wwtcUIxLfzhBSDG4QCtKaaNI6p9Cx9VH51yZEUJGqU+2
 +aAdJ//uSrCiQYOlbnid8EnM/qRQszRq08yXmRkwMT1BHadDww8yYmgvTUhzjmfWXG+i20zeG/0
 tha8KbFG6lJbnkQlYYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNiBTYWx0ZWRfX8WNk2819Q5Lz
 W5WryxjCF6bvb044428IR28zMKFYnmRhJPI+dsg1ujEtIGOcWwesfIBvT5TGkgoZH2QBHPFiGVg
 p9JGIf9kY5kQ31O2Oc3IHk0N3NwckII=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6affa4d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=Ru5VwsRgSRo5wvMXhNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KLDCtJMGf4rxDSzpRnxNDdAkEG3oI_I6
X-Proofpoint-ORIG-GUID: KLDCtJMGf4rxDSzpRnxNDdAkEG3oI_I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200006

On 11/16/2026 6:46 AM, Loic Poulain wrote:
> On Mon, Nov 16, 2026 at 12:00 PM Nicolas Escande <nico.escande@gmail.com> wrote:
>>
>> On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
>> [...]
>>>
>>> The 100 ms timeout seems reasonable. However, will it actually help in
>>> your case? You mentioned that the failures are sporadic. If we happen
>>> to read the temperature at the "wrong" moment, is it likely that all
>>> three retry attempts will fail as well, or would it be better to wait
>>> a little longer before retrying the read?
>>>
>>> In other words, do we expect a short retry loop to be sufficient, or
>>> is the failure window long enough that spacing out the retries would
>>> improve the chances of success?
>>
>> So from my POV I believe the driver should not do any kind ok retry by itself.
>> No need to add complexity. We (ath10k thermal users) already had to cope with
>> read failures.
>>
>> So what I would do would is something along the lines:
>>   - if we fail the first 3 times we read the temperature, disable it permanently
>>   - past the first success, don't disable and report errors like before
>>   - lower timeout value as this holds a lock for a longtime to no gain
> 
> Sounds good.
> 
>>>
>>> Regards,
>>> Loic
>>
>>

Since the original was already sent up to Linus via the normal -rc process, I
submitted a revert that is making its way up (already in the wireless tree).
So a new implementation should be on top of the revert.

/jeff
