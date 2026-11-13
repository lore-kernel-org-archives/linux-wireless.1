Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594787;
	b=OctJPnfVkgdFP9OT0H1fcvNAJnRgBAwMrjax1hNmiP43tThA7elIBsfFZIKC6gHjXJl2
	 QeK7c2+znXrLADDPYFusyVIHToccfw2DKsEp1oLk0h5bEFpQ+8vNaS1mdIRmxIzIGxVsh
	 O8d0uCkYzM3wZQcWi43jetT68bQbANv/puoYiR3dL15ucjGuHD1EBlKn4D7VRXdCWe9Us
	 9hbpRGjiwc3jSQ4s28GES8LUknIgVjrTNpTBp4Jlzv3li/DYnVNPumZWD7Ji6NBMf4xMl
	 of8wGBJjx21KkP3TD8fUGr0MYsGk2H4Iu68ue2OTZXzaUHM7zu9YsKsvkMpJcr07/Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
	b=EF8PWzAb8g/As/5lMSF/tJBnz30qaJZqiUBul9oaTHRedP4yxYCJIKmTUlP8CBAWVoXJ
	 wu4ciqUIyweiJHhfGE8ABCHd619ms1SdP4INn2bN3QkQlJqE0utFmqNkxF/T9dz75sRUT
	 dgrkczp1QIkPUQeC/a5pyQ8D7awVtNRcoqbEkVE7gU1alDlJTyz+n6BAFMjwowZ/vUaA5
	 INCKYZf9Rf+LzQOzBxAlnF9ONOBdiGe/NC7cmR7Um3CqcKzcB90iZDJhPxMl7+Lo4OWKB
	 7FfkV0JDvvyXSX1VHJw0yvGGISes9CLioe4LnLX8HoUrauy2BfxH9IevRQQUBoVCqig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YRZyIDfK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/gDixv0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7110606A88A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7110606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YRZyIDfK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/gDixv0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR0ah074893
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=; b=YRZyIDfKqQQoEfwn
	WHoFxHopIowIaQ1yYaiHHxZPYbrEk3/GF/5rYmKTS6zPIR4JnhO1VcpOtkaioU0A
	i43V+/Z3BgKXV567tGlh/LZYEOEBZ3T7aD5s3siAtPujVzmuRx/hNzErNGGVIHrB
	UoxuMuT6QSJwQgI1KmDuAFQAF5X9XtuFUUc+uwhbYTAl1MEVoM8JkpHf8EZJU/kA
	TAR2/tRgApt7C1aA2ZPx2SIL32WoHMqEslM+Gro0LY22/uWiXhvVcoFJ6rZjjwCo
	pLP+ZM0Yf5b2+QCN9MAb0dWGwiV5h+wgXnFPV6j1joTTOQI1dCC4fnIF8+Sh3j/0
	DBmXfQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu11m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 18:33:06 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so556862c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594785; x=1795199585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
        b=A/gDixv0pGI4SAurXqQDN0OA7xe3YZ9G6RcD5b6MjyW9rWVhjfmbv9vHidbdE854c4
         XMzzJQWI2FDsTtcYy5ouJpW4pVmouJZCrBV4fmxZm3WpuXMpmZxKACAxM5Kr6O3vfaj5
         NsyJMkUoOg+5jBihmmbaOC7CAyCodqeRgnNA56NWqnJT9PLuQfSY8QksH6wQb+Hk326w
         vjBCqLIumh8TmKMDT8f6RA5Oweo0GyK1grg7QL/gukyX4uVl/66Lphbe4lAh371UZ5oH
         +IxEio2sZzd5xM3pN1apMjSNuUDCksQbgGSSWwzMv7xffIuSzPvUnJpao6CbAkU54RJ8
         jmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594785; x=1795199585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUv5114t+zriGrndIi1jj8Phxwq1uvGYapqkrY4UYI=;
        b=saVsC+5bGvbjoR4zYTIaJFLo0eBdE2Esi+HkurM1CaEAngNBfSYnUYIr4qAWXvC5ig
         6fmdXgZ1UZVGIlP2Ywi2ctWLxeFs/ss5VuyUJEKf4cGIA+amaUnNxtRFeLuifsv5PBFk
         4CDvs7YoZlNUrD0Ep4HYboVL39jNF5GGbpmom5vn7bGyMTIC/fOCZFfDcFbdACl7thM6
         4ug4nkkzb3UeI4cLV8vDAihrSf7+pjHlpXeBsogO3jidFIKtNc0PEUgXpM4A37bE1Pts
         It7bXXosIcE9SSnVqTSa/PjCpyFbenUi8sTjA7fCfEgChxrAyrI+k1znRObbPRJLA/Oj
         Gvfw==
X-Gm-Message-State: APuU4Z/GXdOPIN6CdpkbyM3pbklz0UWQsbJD7xXnBOPmubDRKINrETVU
	QXw0kWhq5it/A/F0kBF376C9SYIhbTurIiVPjRcak0DYKY3eW5oc19wVkR17oK7dsDpXxWsk1/l
	grpPIPzwEaTqVM3OtU4edjAajQp09c3xV1BeOh4p7YIxC5pLzQMPA/3gnzFY2y4WywPhU
X-Gm-Gg: AYBFou1EqbD0BWchlivFHiQ6AE2/gEANa5wDkBiKTdzLpWaeQiy0/7ISBgfh3ELht4n
	RyyUWMp8377ncUv5Vhray08lsns2Te3emGF8kI/AwMUX/ij/1C44bjhhJ4zshDAE/WEUNx5lFP9
	m/Kg6FdCggouQCtOiR3rrhU5AfD7OfiM6xuX+gjbh6HcH1yYO/glPvaPmd29yBIm6iTVwE8GFKp
	BkeIylEBm0newfESTeUrIOtPK/prhYBDO4+MTyQRetc7ou9B/RlBhnUkHoNqG1g/XqrivfYWTBe
	9NBlNXMxBv7b+Jde6QtmsSTvnyZjBNx7RnDnWD9yGZsgHAqBS9DqaJIRXVTlsLml0SYrwF7x9wo
	5jvQQLK7hb/NC86SEXuOYpdWBp44ddDvUSYLN9w99YWwBXYUKwtLTLEoWMNdbIBWqysz5p5T5NN
	3WXgzdqicougzm9EAeIYRipXCqxWQ5UdsPXBbBBZ7ps/CwjQTRoCiLQJz2YtSzJ56QWw==
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr3048332c88.27.1794594785247;
        Fri, 13 Nov 2026 10:33:05 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr3048314c88.27.1794594784688;
        Fri, 13 Nov 2026 10:33:04 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm15122245c88.3.2026.11.13.10.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:33:04 -0800 (PST)
Message-ID: <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:03:01 +0530
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
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
 <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jyrw_-3BGCekutOY5mymP0IZIuhwJBy4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX5r1M8RRhEgtF
 KdXGwKY4TpDLmmWOTJ8FhgfQmu0qgyAdI6NBEirS94Habb7R/uzi+Q3jHjyNUyhXaK24RchF56j
 sACHN+gV1i0JbK34uZG4iWuHbPxZ+cfHrluTa8pR65wBACWnRpCOQMyJNvziqG5T013lKbGD4BN
 SI+0y4TtfmQOAXD0/yzMpEPO2W+TCznNxck3qi2RfeuVdFxkFrxnpGgT/DQuP0ShPnPD+TU3nkY
 xIhH4w335NtCUQ2RfKryKkagYlGNsSdeft6sMFYY5YJn3Rt3ckAoTxmHPlTE7Z+fJmECH5xeOw3
 9SDQrFYl5SBKMbur3ToAU7rAphoGYMaZcNKocdZ3NcPHx59ESPitmu37UqBCPzW9neP8WFp6YTp
 7AFxENhyLWvhesWSpH6grq5lPkpygfrP1WM/KVP7H1oKzz8iYaiB6mHAbypWieQ5hZZqaHjY2Pu
 PJgYtM2W/ZMDx2o+zAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfXw2AiMVDJIw7A
 +GeIyIcH0Co8hy/XhExnHVuSrHSi8nHZmdEbAdLQr3hJtlOQaptox7oOqy/0u0SN6lZdEn7x7TX
 X1/z0zX38JXpbFYdXrq8iHP3/lcoQSc=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af757e2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RSDq6vcL7OiZwIkGrs0A:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: jyrw_-3BGCekutOY5mymP0IZIuhwJBy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130073



On 11/11/2026 12:30 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * struct cfg80211_smd_get_ctx_pending - pending async GET_SMD_CTX request
>> + * @list: linkage on wireless_dev::smd_get_ctx_pending_list
>> + * @sta_addr: non-AP MLD address for which context was requested
>> + * @dev_tracker: tracker object for the netdev referenced
>> + */
>> +struct cfg80211_smd_get_ctx_pending {
>> +	struct list_head list;
>> +	u8 sta_addr[ETH_ALEN];
>> +	netdevice_tracker dev_tracker;
>> +};
> 
> This seems ridiculous, if userspace sets the interface down it might get
> a stale response, but you're writing dozens of lines of code just to
> avoid _that_?
> 
> Maybe also to avoid querying the same STA twice but if the firmware
> can't cope with it then it can still reject it (or the driver), is there
> really a good reason to have all this complexity to prevent it?
> 
> Tracing on the output path, on the other hand, would be useful?
> 

Just the sta_addr alone helps identifying back-to-back requests for the same
STA and it is rejected in nl80211 itself.

The netdev reference is held to prevent invalid accesses to wdev/dev while
reporting the context back to userspace as there are no locks in this path and
another core may be servicing a DEL_INTERFACE unsynchronized with this context
report. Since the collated context report comes from atomic contexts, we
wouldn't be able to take wiphy_lock.

> johannes

