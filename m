Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995389;
	b=0YOZdVj9ZjsKLZHBftkgApdGM2gy56H9RXBYVAoUKEEVlRPIUAdkDXsQGiwEJet+38Ke
	 8PBHIq4vP8fD8STBmJIWG8ck2olom7UTzkYby53wHmqXoqFRqD9Lc/fHD6yAwb46ELxNK
	 7dg3DP1/yVdad3GnRz7PnadZmpUBXEAHdNoYYVA0rngh/n6iJwq+ewea5csQWy/SWWRAh
	 ks3piakBOKCsbPDF+CGQXGgm/AMgb4k5mkGchWfIqNbUqGpGgLOUZh26KzO9++DHoZPVi
	 CItSurawBP9xuA7wg/k2FR6jf+zr/gwtehsPuM7E+D7Ere6vnqO7hb/JJq2Wk575+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sEi3q7ZL+8EA/2NLVbh8SzpbG4KLmM9mhRXH7GqZVq8=;
	b=LdXgipLLBUtDURGBWdF/Atubpj9foTi+HbvVCNUzmBFVGz42whlLKhoKfjFFmkN3TV5S
	 ViLFWVolIplNIsXYq+qrQWkL3oXt9OodahedBVL5bwr/G29xJnvRtrJ9rexFvecTD131g
	 4IGnfSxAbNX2JrmpbKOLcV77gr9c0Fd4dVFowjghnher2MFQ38xVGOC3d+WAmlm+6AMmU
	 4yva1QbehinmIvFsFThsE5HHzmyaKHNw5yn3MiPnFWhhHwuoFn01kQn4g37MwKKOSRIKi
	 BZoFI0uRwYZOdn6tNLUubDFoe9d2hBCEzqk7ahMI8BbGgOfPuQsF5hDloAsjFlYUCAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y79vyyw+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB6606A330
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 20:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AB6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y79vyyw+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13231465e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 12:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995388; x=1794600188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEi3q7ZL+8EA/2NLVbh8SzpbG4KLmM9mhRXH7GqZVq8=;
        b=y79vyyw+ZKfQ2nW/bS/wstF4z1Y1VAwsX7vtPje4lgVhsJK2hSAmop/Vs2f86FFoGr
         PGAax4RUTkWiVP1RvTLr+nO7m1uFp4EJnX+P0ZPUMcCjywJyvALC5f9Pa1FYNHG5j0yC
         76GavBJ3NypgtHbEt1pdXyRviazXHCsGKFT1qq40fSi/XXErqgBs8p28Mza+CsuLsQJs
         QBHIOhDLPEZosjw0zG5a/Q0KFoltnQqBN0JtuFkEXnHRfXEWTBdiDEePrcXqq/1WmVLx
         +F1Z2EVCDOx2SIiPxNzrxaS2rkYf/Sv05/+J3Sh72rWl0UKmlfjQ6VzcWuPkhslX//Tp
         hqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995388; x=1794600188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEi3q7ZL+8EA/2NLVbh8SzpbG4KLmM9mhRXH7GqZVq8=;
        b=LFv0Vzxkgo5L7WLnINTe3g5l9KUjwtHlgaCuj5cTtNaprEx+RQaFijTKz4WqHJq3cc
         p4lOhjwlKvB7xfuPU+WOSNN3qOR5G+zdkOXnNSzKTKKlwcw275ZlUxrs3DFY1eTw7UYO
         7DyRQQpDcRTd86h8Nx84ref71UmGIWULkM/GLUo7bwQ+L6/z40DYUqc5ltYfofRsu6sE
         HnLbntcqNBn80UT/cW1Y30nzEK3eebOBs/vbAsqHQBWerRqjG3lK1uRs9ov5whZs+/N1
         QOD7M9YKnaeaR8SRz4LW+PHE4ijG+rfhq07UaspagJk8xinagipVCF0reXvbXKro0cej
         K5Vw==
X-Gm-Message-State: APuU4Z/0xdB/Zz0dUZRc/4frcGD8209SAIr+u5aXaXGb41k4ceF3Q5H8
	kJZT+i/4fxFXrFD3kItuAtyittjwolHRKbRk09egQeoQCbqXp4n7USbO2R++QwKB
X-Gm-Gg: AYBFou0gz8vECLDBZTRri9YCFQsL41rZG216H6rZf/ato3o5+YpeQuEKl2hNkP6vyhi
	M3u86RCBv6oUGq/7du6Q0iHOarSQazu7l0qYborbD7IdgpqjnX9kb82FOADC02j0IP+tNOYlwxL
	u+l3NLMxSupbyDF2OA8kM6TMCFfHRJPAB1oaspycTXiABHULN8lK7YwTURy37tBQhOFrZuIDeth
	87GP7HaEPCMUkwGBjf15GzsYMyXkiyrK/+mN09jyIFLy6S+OY5bBPS8OQRJZ4oEJPeQs70kenNV
	QvX/q5yORruSJffoDyuh2+4njQixU1IWuplHX3/CQ+JqJg2O5paNp/F2DGtbRgk7Ny3vv82GVt+
	w7zaBrP19YvX4KxI1i9WDJDt0zCWzQIxwoxIdxvordXhx8h4omQXSFluPRVdq3XCj7D10y6uYAM
	cWmEK5AT8TuRnn52+g2UoS4hUve3rZF3/lt9Emjy5BNI3yoZnTF0LmFzMngfdhw5x64jk2oUfhF
	URx4DbvJF2d2QhsL304YFGRxsmW2n6I27z2AYeWFs7TcOR3IHnWUQ1eIGSGULTw+JoXl2nDrfNW
	6X09aizg3VA40ZTvy+BKOEGhnl1DjIlmKR1W
X-Received: by 2002:a05:600c:1d1d:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4b6e0171346mr59778415e9.29.1793995388000;
        Fri, 06 Nov 2026 12:03:08 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm3705225e9.13.2026.11.06.12.03.06
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 12:03:07 -0800 (PST)
Message-ID: <05823fa0-08a8-4805-86c8-8f74af8f1a95@gmail.com>
Date: Fri, 6 Nov 2026 22:03:05 +0200
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
Subject: Re: [PATCH rtw-next v2 5/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: linux-wireless@vger.kernel.org
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-6-hjf3108@gmail.com>
 <2df200abb7d9b07abf8883fcc06f4a7b0d3591c5@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <2df200abb7d9b07abf8883fcc06f4a7b0d3591c5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 19:27, Luka Gejak wrote:
> Hi Jie Feng,
> 
> A few small comments below.
> 
> October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:
> 
>> diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
>> index d0c1fb65be9563c5fc29a7d18a1c9e8589730b10..69998c0d7c1f851bb30d2702233d62e14b305bf0 100644
>> --- a/drivers/net/wireless/realtek/rtw88/phy.c
>> +++ b/drivers/net/wireless/realtek/rtw88/phy.c
>> @@ -687,13 +687,14 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
>>       struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
>>       struct rtw_dm_info *dm_info = &rtwdev->dm_info;
>>       struct rtw_cfo_track *cfo = &dm_info->cfo_track;
>> +     u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);
> 
> This and the same line in rtw_phy_cfo_xcap_track() are in core code that
> every chip uses. As far as I can see the limit is only there for 8814a,
> which has four paths but reports a CFO tail only for A and B. A short
> comment saying so would help, otherwise the 2 looks arbitrary.
> 
> The commit message could mention this core change too, together with
> the CFO tracking for 8814a that this patch adds.
> 
> [ ... ]
> 
>> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>> index 87253fffe78cd6f5b58a325eef42b58b968e2d46..851d198f76f3b10d5ba77c7e07e4be9d7fd54e4b 100644
>> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>> @@ -279,6 +279,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map)
>>       efuse->crystal_cap = map->xtal_k;
>>       if (efuse->crystal_cap == 0xff)
>>               efuse->crystal_cap = 0x20;
>> +     efuse->crystal_cap &= 0x3F;
> 
> [ ... ]
> 
>> +     rtw88xxa_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap & 0x3F);
> 
> With the mask in rtw88xxa_read_efuse() the & 0x3F here isn't needed
> anymore.
> 
> The 6 bit limit now shows up as 0x3F or 0x3f in five places across
> rtw88xxa.c and rtw8814a.c. Maybe a define in rtw88xxa.h, which
> rtw8814a.c includes too, similar to XCAP_MASK in rtw8822c.h.
> 

This is the limit for every supported chip except RTL8822C. It can
go somewhere in the core files.
> Best regards,
> Luka Gejak

