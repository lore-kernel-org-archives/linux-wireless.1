Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944663;
	b=3DGs0FcXMxUeWnWxK++6Q9RMiUk8cfCjSZ4yAwPEqGhO+6E+pMvb8bDwOG3Mt+5Vsz51
	 hlJ5g9IT+YWeouOyBBSZQat/hOgF6PcGQbPZ3V0MZwB7v0SpMArtvnnLG2TvL4/XZwqQG
	 bhi3Qxq37Uuo2VjcD8nddI72RlC6/6AuvPbsXNCFurcc7wQvo0OpybiGaakrP8Fz2eAbW
	 bjGjv/gCYKwLVkpmS9fnY/wA1vDFBY3aHdYI3MrRp2SGX3q0pENeSrfMznSO5pA1iwRcJ
	 LMnh0nFSM2NMCHIvTLf9KbaN4uXxWVAK6Jj2YuMffPaT0qLkMpgV9kCSHCs9W5JTPBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944663;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
	b=TppfKrVXwVo21jww3e5boMEBEUZikW95PokdAmPBuppa8iH98H1nhwLpx3kNH0rMCs9n
	 JAultHqyV8Ntubx2XvAsGBm7KWsjPXElALXYQrhhscyMvImyWL6Ia1hAIn8kmjJ2tAEku
	 Mg6GMuuijSmenjyKa2Pc81w9FGkKTuW5tRdEiuP13i4bTvSy4b3gUyjUCMfu3Ki0+Hhjy
	 ISIEZJ2G1YBngYYI3tM3mOHECIYB22rmY36Xe7wlrpeuzqu4lpe+AqbW36kFSx/jhf48o
	 mKaEK4aQ/hdUaYY57m677dkjvoE4jqN/VSb1iparvePcSN3rBWN5I4HsHIFM5Li28QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e1frChzq;
	arc=none smtp.remote-ip=209.85.221.226
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C41F606A33E
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C41F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e1frChzq
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so64933e0c.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944661; x=1795549461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=KyCCvmLVyrtkl1A9cmmDDzDyVTK6DDbSSfIpt6CFkydT+x1X745dJh2JlNy7iy7Jyq
         KjHNR8iKDUvwpjPPQVGLvTYTZC003/RkPPxTgPUploWFDhhsqpr12GEHsii5pe33yRVo
         lC4CLgrl8ypmpXP5vVDFnOUK21IGblCazebZgL/8TIG8U1VRCIjDx94dfZA+CriR0a3B
         1fBnSjwaIhY1dqKThN1syR2kkcdvDTg8ZQKMADWf8b6xBSbM+UfNqlXVqhvC+TviYLC5
         i+dUc9vqCSx6KrnU4tkd9Z0CuWlJdwNRDaAh6y9YMv/iYxrTH4C7+E5L367/BwlrzRjF
         PWCQ==
X-Forwarded-Encrypted: i=1; AL+hErEW91hZzlenaFwkazs/HllEIBPcRVTG3CXwAN4zibRFyVEi6W/f7fa4nusV5MKdzbFKeWTE0He2BdilJ1GHWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z95MoMCPoEnL6Gnjfj8uuoHu4nmQrJv8qp26a9IZNtXEUYqx0+E
	FLG0FTCsDfYyi1V4BgUV1CqtWkzJgYkMfZad2K/anSggJND1WIisrK8rzvqwx19r2VQpDcfpSHK
	oIgMffrxXPUBz/MhKi8A8ZBpMBxUNU+6PyDkKyGHXF8MXeS0GCFJDacXKgn6pYhYsbVa88azVd5
	OqyuGX233xfuwoMdPFazMug1425iiPguYg1d+ce+o3OHd2sGinbMwgT32ZzKLOl4nZw0XNYj1dw
	0Aycp5cRsMeO8dmmKIgkny0DTc9
X-Gm-Gg: AYBFou2qZ2VErPrISSoH5zTNDOzM4756k21xMe5g2KWCMPCp7OaxUwbTq3e4tiX1QJ/
	F7Fi4SY0qVmKvh2cHvK7Wge6F4eTCayLlihXhRR7XWH3TGrP6DDAHHE6jgNI9TBTZgYkxO0g11h
	mwX3vN+BqwgVIkkmZsvr2ZcsBhSeI+m9OZGpVfr6D1WLD1/Srr9fqQRzZEz8Y6v3XQiQyUOth1t
	ghmVaBQfzulS8F5YbvgCP4v+CqCCseCL9STF7djFBlXkV8nzl8to/ZONr070AeCu+K8rpB9UYQ7
	ZgmASDU0Iy+3bEmczjvPvsnN9s096xpi6ke1ZsUZJBK1Zf5I4r3RRD4Lk2O1Ox6j9hQzm3uCqBl
	4dZ1QOaXA9XFy0CLWHVSunpPfAr6tK0ruzX1Zb5qn9P3r4Mf1sY376rJ/syMIPdMauAdMe0rUzD
	GVrcPzCxUdpIUiZ9ECm7AkiiIVi8luo/2S8WeV9V0=
X-Received: by 2002:a05:6102:e08:b0:7ce:8505:9848 with SMTP id ada2fe7eead31-7d6ba4bb6d9mr9503137.31.1794944661006;
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e4a4bd023sm53794241.4.2026.11.17.11.44.20
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c504b52eed3so6606966b.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944659; x=1795549459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=e1frChzqTMz18PJyDJgNMGYe0iujmsPgXMjke5c5qFLcK7NqhbWU/47zeMRICMJemW
         gs/fFGGcm7F9S728xChjDTIzRk71wXNeBJTFiZo7kDPeBqqU4If5DRwcJZhKLTGr33aS
         eOQtoQQGPhx7dmhWVdk9nFzJFfl9g13jooxQM=
X-Forwarded-Encrypted: i=1; AL+hErEaN1tn1HlO4Ll2XSgt1banUGK2tktKtVHpJ+FD58AOBgpLrEhEeLByrcmX/8IOUVzabuOcUHoKiQ4CBBMGtg==@vger.kernel.org
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29023966b.15.1794944659458;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29020766b.15.1794944659038;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca0d085sm15771766b.13.2026.11.17.11.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:18 -0800 (PST)
Message-ID: <7d5eabc5-5876-4ee7-8a82-0bd3a47c733a@broadcom.com>
Date: Tue, 17 Nov 2026 20:44:18 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host
 on Apple chips
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
 <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:49, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
>>> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
>>> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
>>> then pass the PSK to the driver and leave the AP side of the 4-way
>>> handshake to the firmware. On the BCM4364 that handshake never
>>> completes.
>>>
>>> [...]
>>>
>>> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
>>> runs the handshake.
>>
>> [...]
>>
>>> ---
>>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>>> 1 file changed, 14 insertions(+)
>>
>>> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>>>                     BIT(BRCMF_FEAT_WOWL_GTK);
>>>         }
>>>     }
>>> +    /* The Apple firmware for these chips lists "idauth", but in AP mode
>>> +     * its authenticator never completes the 4-way handshake and the
>>> +     * station is dropped after about 8 s. Leave the handshake to the host.
>>> +     */
>>> +    switch (drvr->bus_if->chip) {
>>> +    case BRCM_CC_4355_CHIP_ID:
>>> +    case BRCM_CC_4364_CHIP_ID:
>>> +    case BRCM_CC_4377_CHIP_ID:
>>> +        ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>>     /* MBSS does not work for all chips */
>>>     switch (drvr->bus_if->chip) {
>>
>> The commit message and the test report only cover BCM4364 and BCM4377,
>> but the code also clears FWAUTH for BCM4355. Where does that come from?
>> Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
>> or justify it.
> 
> 4355 is also a Mac specific chip found in MacBookAir8,1 and 8,2. I'm actually surprised you forgot about that especially when there was a whole issue when Cypress named their chip firmware wrongly as 4355.

Getting older and a bit senile I guess :-p Still it pops up here in the 
patch without mentioning it in the commit message so my question still 
stands. Also are there any logs made while debugging this issue? Having 
firmware console logging enabled might be useful to get a clue what is 
holding the firmware from completing the handshake.

Regards,
Arend
