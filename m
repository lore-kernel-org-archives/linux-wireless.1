Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010728;
	b=YeNRu3Z6TaFiczy2vu4GWG7wJFqjjH70Kv9RhAvNaI+UPNQY+yYzydszrv41OGHCU5Bt
	 A8hR2huuJtEkIaMXq48JuHyqj8uhM35/xhpqFr4CPhTuj19phsZLLcy5q1NyU5t3Lk+Qa
	 cFIwVdgZFBe1jO32e7Xhfw+0LSTgXBGA6hd3AoMbuR9XjwGJ4p8HASTcJRdyw3FBUxoNx
	 BdgDO1rVez15V9tEBz+ySUtQFOyWR/sXEW0oQMj5176Yx+53RfxzKyOp7MylpeTKJgHuJ
	 xUdeSy/tJNBIdODLAeaiYYan7f8dSq0lH5jEbMtuUE39/AhpSLaO30TKi5xdPpXOmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d3WU5p9Zp+lZu80e6qt6QGyePdZHCIUPKsse1kgtlcw=;
	b=DI54jgyYhD2lpayWqeDQg35XbiBEtTNXfo1/K6Km5Zbo3qlLQtbcMEiKELjB1L102B5t
	 0bDZ0MPrD6ZmZHNC+LJkXaqg2UQMdWfJTgZUbuWF5XuidVkw4b/r1WXj4Ci5Cwnhv1SMB
	 VCoI3Bwcm1rqxxmnEHi2CSJDJKZOOlcjHoMmDMPYNUGCy7/zQsCzJg8QGbWDvHqet1EHb
	 Kcg2uXzmgSE5sURWIzTOs/JCG4dg4t3i4F4s/HyMc0KMCBK73x00SikHd2KdQuZSzUDf1
	 qJzYXk4qj/I7JXy3XpAxXq88RMWJF0oHs7gN4DX9vKkPHMpjdx6rAxx0Em8D30xNXKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z6witZSG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlxLiE6l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071C60A260C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7071C60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z6witZSG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlxLiE6l
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQJhu633479
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3WU5p9Zp+lZu80e6qt6QGyePdZHCIUPKsse1kgtlcw=; b=Z6witZSGFHU9BqsU
	KaVJVdVd/2va3hNfq3e2ib7jHz7ZEi83tbjbkVAOPuBvSubq39uI4gbB8T6wu9Dd
	Feh/JM5PflER6zD1uC4pkMU6hi/U0UY1lzbcq7WUfO8MyRv47rRrtnZCzUSJM81M
	uzYqzxJ97uFXTF0qqcpliUUbi+k8+WVKcFRAtDDI3Q6wQ3cQ2jtit7IvcQTKa/xS
	CSHyqwtMGMEMXd3RaCrygDbrjK5wXTs/WtDIIPC7J1NoWfBGA37m8/Q5/3M1IQJO
	5XbaDthcEac+whsgEvgGSOBey94jyTVYrzI2CDIdEfObO+9e5qEn58BDSAMR2bSw
	o0dOtg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u925-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 14:05:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdacb64970bso681958a12.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795010727; x=1795615527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3WU5p9Zp+lZu80e6qt6QGyePdZHCIUPKsse1kgtlcw=;
        b=jlxLiE6lSpiRQu94PV3BWs1kEs+YTy8dzEQ1Jm39xFpS0er+PYlapZWQU1is07waB4
         gkUoswS4jV4Pfljsa5np+IxrTUVZTFHjYQ5x3MKg8gcMz+X4uIy+ydM+8udgIQX0Mqx8
         JjnlJ0zVwCVZzEAcxS1DF3UZmYGIPNjgTswZ12pr6e3rq2mephwoRfaHcWtw/Z5O5tfL
         gEb59U5HBx25VOi6q6BW4UGbqPqoe/NHMdpqCCuow9EesOwBOB5lh79012HFz4vbbNZd
         eBBCZwCq/loabClNx+nDRaz12aBfZzH9w/SDCltuX+HKDJjta7nIOJNvjC+t3N90NYk3
         k99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010727; x=1795615527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3WU5p9Zp+lZu80e6qt6QGyePdZHCIUPKsse1kgtlcw=;
        b=LE28RGGveR47FDclLQ4yKIzknaRHwz5zadtOCuymiXB/dESW/w/uWLKBVAycZTmFfa
         WUN2WldUBAdJju1IJxwTE+4MNoP8ifNcyoToaqNkZji45mG93bTAynxevX9D/ggXjkna
         ThJxdgX1xh4tEOUpIvGVup43nY4+xRjsXNrFcG9cYsu3mvUWjYb5lYUVCvKCmKrPkciF
         3FAwZ9lSBItnuWDqEIH0v2Ao7MSLum4lg5CW7DsrCr3+hUaK71FwHCJbknuSE+UUjAX2
         2GM9bfqhfU+2K6DdaKOLGV4oPUZxp8p7GlPJvt+T2WuAXYHresuhHuMa5+nCtQDb8XA3
         ueAQ==
X-Gm-Message-State: APuU4Z8ftd9PsP/Uhr3E56LtLnDSx0LMnv57tRueUJOwjBDFO1iw9g6B
	UPzz5jFbU72LFp7OoBc/NIcVBmu0emne1AOLoQwa/rZ8YLnl4bzUgWO2+6w3E0gPTK2e1fOYf6R
	qNkro0XELUk/yxb6dYQR7k2HGXBV2eO9w7fJZnqhdvGLZU4T3ccSd4i5Tez0O7bI9pTaX
X-Gm-Gg: AZFdTZfDJlhrR3nVi3Jr3Rsbte+z1R8V0+aqZUNh5yRv2nGg9qFkPi4ibGIzWZeYD19
	zVWp1Yqlypv/BsvHWzF8VqABvTSTA2SMYwvqRBOefCtRpW12mUj9LSBsSjlDVd0nhtEylUScE34
	BpZw6mIWvrBCJ9dcfDd/Jcsq9Clznixsf4527ftBRdFqXGUoyiQjrC5QLivHq0I0D0KcbROTNNT
	/bDKWtiT9pwHa+wvTxvghSiZ3ePaNmRwcQtT4osAPz7JQsi+ODLUQQMwReZwnlJOGvmMOijYoPO
	toHWApwAdm5AMWYxXjrbTrEF9vGegfUr77A0URLl+nYDG0mtJofYTqMRR7+pNJn8HQM8iPHzVNJ
	t1yYpUDx8nwtlZiCvzunYIlB7P92q1lX/7yi+uOqIKMjMr8tXPNLOLIkIB3SkSOPAjI+I+Nk907
	MPVxxN
X-Received: by 2002:a17:90b:1b02:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b3d07e380dmr2356441a91.58.1795010726758;
        Wed, 18 Nov 2026 06:05:26 -0800 (PST)
X-Received: by 2002:a17:90b:1b02:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b3d07e380dmr2356402a91.58.1795010726153;
        Wed, 18 Nov 2026 06:05:26 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3af4a70c7sm9155735a91.6.2026.11.18.06.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:05:25 -0800 (PST)
Message-ID: <5164fc4a-76fc-430b-ad36-fe66fe22219a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:35:22 +0530
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
Subject: Re: [PATCH wireless-next v4 04/21] wifi: cfg80211: define layouts for
 SMD BSS Transition context
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
 <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
 <b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com>
 <c9ffcbff38996a38c293105d8db526673e572acc.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <c9ffcbff38996a38c293105d8db526673e572acc.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdb0a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=U4uCuaDbl1fCOeKYLT4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: CwBhxsN4o6um3jJxD3ijT6FXUeKTLYyc
X-Proofpoint-ORIG-GUID: CwBhxsN4o6um3jJxD3ijT6FXUeKTLYyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX+0NqiYwgO5yX
 YVC0lJeVLHnju+WAHc2/4NAGMxF3s11od2GqqDSqRzzdVV3o8E0pTt57zSaYuutK0lIuilrq4Gy
 IU6n6oXgZjZvxJHUkCxXmqEMLRVfOIYrmicPzjLrsmDlAnqJ36TJ38hXtjFxA7nHQu1zvuOHCJG
 MAygp0lNSX1KXwxoUgUgl57wxLiNAmBhsrWy75B1i0HfFu0ybI0vP+Cdg5w0tFxm5JzzBbLWRS5
 xdCks8QKwH7aLG2fI0MZDycQc9frWVHwMk1q3iG/bX4MKvgnaZXyeRNGNpRuddW6hILuSMKdDKV
 Rd2ExIQwmxBw3uMNiseP0j6Or/L6fwWpvtgYGtOMSLslG04kgZTwmxzHUTWkyuRVXLs0a0hhdAY
 B4mfaShsZy7W1IqnmYLjyHsoGvOL+rWHpRT3fNpMn1eUGbAL4w5JVMe41ZYjjXjwnA8Wd8wGkLP
 IMNidMy8CBdeK1VmIUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX7C92xf57rZ1s
 LldA0O/HFZqxiLTcGeMo0JjZCoP926PVbR8ATw+QyDw7Ve1KZy6xd6Z0K1oAm6/PhkMCO7lyh/B
 iDqmoHtJB0Z7k5ojg4R3ZeBt1+UI3ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180055



On 11/16/2026 04:24 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 23:45 +0530, Pooventhiran G wrote:
>>
>> On 11/11/2026 12:09 am, Johannes Berg wrote:
>>> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>>> IEEE P802.11bn/D2.0
>>>>
>>>
>>> It probably didn't change here, but there's D2.1 :)
>>>
>>
>> From the looks of it, D2.1 doesn't seem to modify the context layout but Dual
>> BA :)
>>
>>>> +#define IEEE80211_SMD_CTX_MAX_PN_LEN 16
>>>
>>> Huh?
>>>
>>
>> There is no cfg80211-equivalent for IEEE80211_MAX_PN_LEN as defined in mac80211.
> 
> We could move it, but I was much more questioning the *value*.
> 

Got it. 16-byte was kept because of the (wildcard) max value. But yes, doesn't
make sense here, I will change it to the standard size.

>>>> + * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max 1023)
>>>
>>> It's probably literally in this spec this way, but I see absolutely no
>>> reason to split it up like that (with ext_buffer_size) in what's
>>> effectively an internal API?!
>>>
>>
>> Buffer size was sent this way so that hostapd can directly use that to report
>> the DL BA Info and UL BA Info in the ST Preparation Response frame (Figure
>> 9-aa53 — Extended BA Parameters Info field format).
>>
>> I can combine these into one single @buffer_size and let hostapd split it for
>> preparing the OTA frame (as it is only needed there) but would still need to
>> send ext_no_frag and extfrag_level as part of the context. Would it be okay?
> 
> Oh I was just thinking of why you were splitting the buffer size in
> internal APIs that way - much simpler to just have a single u16 (since
> we don't have C23 yet) value?
> 

Sure, Johannes.

>>>> +/**
>>>> + * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
>>>> + *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
>>>> + *
>>>> + * @dl_sn_valid: if downlink (DL) SN Transfer is requested or not
>>>> + * @ul_sn_valid: if uplink (UL) SN Transfer is requested or not
>>>
>>> Hmm. It might make more sense to invert that like in the frames?
>>>
>>
>> Sure, will reorder this as UL, DL.
> 
> Oh I didn't mean the _order_, I don't even know what the order was, I
> meant _invert_, i.e. "no_dl_sn_transfer" or something? That's how it's
> in the frames, IIRC.
> 

Got it. Since it used to be a BITMAP, I visualized it as some sort of a
presence bitmap. Now that it has become valid bits, I can align the name with
spec text.

>>>> + * @pn_valid: if PN is transferred or not
>>>
>>> This being false is not a thing (any more)?
>>>
>>
>> PN is still defined to be transferred in the Prep context (at least as per
>> D2.0 37.16.9). Even if drivers choose to send this in the Exec context, it may
>> not be present in both Prep and Exec contexts? Should we make it so that PN is
>> transferred in both?
> 
> Oh ... no strong opinion, but the documentation literally says "is
> transferred or not" and ... there's no "isn't transferred" option in the
> spec (any more).
> 

Got it, will keep PN as an optional data in the context (because it might be
sent in one of Prep or Exec contexts) and update the doc properly.

>>
>>>> + * @ba_params_valid: if BlockAck parameters are transferred or not
>>>> + * @mgmt_tid_valid: if management information is transferred or not.
>>>> + *	@{d,u}l.mgmt_sn and @ul.mgmt_pn are still bounded by @{d,u}l_sn_valid
>>>> + *	and @pn_valid fields.
>>>> + * @pn_len: Length of PN in bytes; varies by cipher type
>>>> + *	(e.g. CCMP (6), GCMP-256 (16))
>>>
>>> ??
>>>
>>
>> Especially while filling in the data in nl80211 to report to userspace or when
>> we parse the SET_SMD_CTX from userspace, this eliminates the dependency on
>> key_conf to derive the length from the cipher type. But is the preference here
>> exactly that?
> 
> No, see above, what's with 16-byte PNs, there's no such thing.
> 
> johannes

