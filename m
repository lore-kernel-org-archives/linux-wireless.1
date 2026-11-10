Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338839;
	b=nh96kDckyKo17A8CWeFI8AoVJw6bUfpNdMPFDvUFXwLK+C+EAIB0Z7681BnaGXIH8PX7
	 xjbtprX1arhjOL3buf178ey2F2UFfwEcAKP0fu4Kt5kUdCTzwWQ7j2aApKev+7Se8DoPq
	 bCDJ4Gq3ZU5crOsTnOWmmHSyDl1iHgL2yyPb9rXejAXgm8s2RA9QAemFxbjkLRnPsitsC
	 m1f/7pB9wlHlGa/v9Czz2nkhMDw3l1noMOV6hqclwz+Z7zczji2+EAf6Zl+xsx0RWXHcH
	 4UC7tuMlM4rCGUuWsjoyMgxRmkyVl7EDo85W54fAhVE+xsubbyQTun7w8T8UYmAcTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338839;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
	b=OycOVmw4YT5pRugZiUD0AyNfaJdY9mAY1vF7MYoG8bVSivmlPOW61m3bmA/BUhYBO3Yg
	 ABQnWP8q32nbIsSqUEiVCVGjgajIdWWV39tf981nFRsFd6zSuPOD31f+xRm+W6hFzNKJW
	 /FslMhpHzJESBLC+Ho6NQ9jHKV6H1553HCwp4QcF9KxQr+W7lAnJKVCAG8oO8P8kEeJXo
	 Fogq3TVgCsfOz4PqjwWMqfmXwFT7Fgzcte0TVQDyTKMgVRO1SqfnX3k/YBfwjUJH2OLWn
	 Q1rC41+emGYTrCF+WAJ7LvUvphTYIIXoYyuPjUugNN8bvxLJbMeEDF2WTFI6uvrOwqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JlnnVUq1;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033760A2619
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 19:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6033760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JlnnVUq1
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b179528d56so293014a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 11:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338839; x=1794943639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
        b=wnaBdNTDE6KHqx8nXvPq9FQ1/S74K0DD1eqYBnBRgDYQw4zKeWlB3ap4WhhNTGOrRU
         C9fzrA5WfnnitZQxie/NQqBpWGKrjg+cRNmxtM6gIQEcGw9pyi83m0EZhztwo09iYEXg
         HL6gTXVpC4Ln+SEMMIBM+Cd4h6KhkVIccWclGloWJmG3d2l7K8tJXsiFr/GxbX9FCpfE
         WmiU0lDo4mEWsGrVhnMX0GhW9TzxM2H9XjobMr0VJ+3t6Bj+VtchPpka/hXQ3CQyfFug
         xgnu6MLzr91DxSkh5iaM4DgatDTX+axYW+DeaaB8JXvB8jRRb59LSpngeHHSlcGpxqJE
         kePg==
X-Gm-Message-State: APuU4Z8eSLxodLnE5BV748Imn0djCgkefpCkFXMT3sn2/k4GUZSwvAAS
	ulf2ap26dbwOnCegn+vFHLv9EM+zh3WjU9iORhzttcFiXQrIcGnli2LLeKVoZCZH2IXM+LEZiwm
	f23nCwAirgeVx0WrOSUR9+e+TRlH1doizKcOdrnpYThnpdscQc6jWeB4z9M5fu0cHaEIVV/eKQW
	Re8m4LU8HD9pVKl/coG7auo4UfRK2mw0uvVQw7pSwtm0PsezDN0eAQQR8zAFKv2yipAa5wEQuE/
	O9NZJwtpONIDDUJxQSMZjeG1w==
X-Gm-Gg: AYBFou2PsCriAUtGfifNaA89HxsUrxrbIZceNVg/EpKfEW7kMY33EhpkjNbu1gKS+VN
	lCT+cpXRTfjzeupE8q1Bqkl9nEunhvVLkptewq+h6k5e1BkUDfqsvVRcTmah7breVW9bxIUfk+a
	veqII0iu4naPvYmnrT7r0UkJV6pdhFcs/Te88pKN6/aTAS2Jud2aIvpfpX8FdIzDrerK2t1HP5a
	EbLGL1TzWeVtQ8Yd8rEeoNBLNr98PsNm6DB/CN/Rt8dTFEC51bIM5i3gP1j9VJal0+3HHxOk21j
	GdUAYpWxCLxl0T8W0nUPPdaDcXyAXxIpMM7oOEi+RU23g3QxXDFmXId62xoyTgarnf1hZJUoNJh
	F+p36Mtv0Btc4c00N9ZquXlDbcisHuOH2ifUJe6sUaHuo8wIiO0a4jbLpcc9gjPGerxG5iC48oE
	/zwOYXLImFR3FAv5yfz6e1SMEdNj3QkNTYTw+g9gc=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr3678229a91.34.1794338838699;
        Tue, 10 Nov 2026 11:27:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182916a77sm36157a91.0.2026.11.10.11.27.17
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:27:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5462944eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 11:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794338836; x=1794943636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGtSveCQEvAEo8vEbw0oolMScwgHZwQg56T6xGM7xJQ=;
        b=JlnnVUq1vA0/yOnIL/SmpVymyoGc06mLud/rxFEJ8pqlnt4JqPyQ4c3Ddx6Kdm+VmM
         ACokt5eG9Dx4+YY55ToX5N5GcpXVgaUMtTgrttEE+59w2sMVR8VkJHQw8ORgV+/ZgEqx
         rE5GKet+DCOF/LCkkvobd3/MtqxeQZW6wR7uI=
X-Received: by 2002:a05:7301:e01:b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-37686e2efb2mr449299eec.41.1794338835391;
        Tue, 10 Nov 2026 11:27:15 -0800 (PST)
X-Received: by 2002:a05:7301:e01:b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-37686e2efb2mr449187eec.41.1794338834273;
        Tue, 10 Nov 2026 11:27:14 -0800 (PST)
Received: from [10.229.42.90] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm9953171eec.17.2026.11.10.11.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:27:13 -0800 (PST)
Message-ID: <936ee9c7-a59a-425b-870b-8e8fcfcf9eec@broadcom.com>
Date: Tue, 10 Nov 2026 20:27:09 +0100
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
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Ragul Balaji <ragulbaby@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg
 <johannes@sipsolutions.net>, brcm80211@lists.linux.dev
References: <20261026053633.361454-1-ragulbaby@gmail.com>
 <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
 <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/11/2026 18:01, Ragul Balaji wrote:
> On Sun, Nov 8, 2026 at 1:55 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 26/10/2026 06:36, Ragul Balaji wrote:
>>> This series adds support for the following 802.11n USB adapters:
>>> - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
>>> - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
>>>
>>>
>>> The protocol was inferred from USB captures of the vendor's
>>> Windows driver, cross referenced with code from brcmsmac, brcmfmac and b43.
>>> The code which are copied almost as-is from the referenced drivers
>>> are indicated in the comments of the code
>>>
>>> The driver supports:
>>>
>>> - station, P2P client and monitor interfaces
>>> - HT20 and HT40, A-MPDU and A-MSDU transmission
>>> - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
>>> - hardware CCMP with management frame protection
>>> - the LEDs and the WPS button
>>>
>>> Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
>>> TKIP/WEP can be added in later patches
>> This is really old cruft and it is a different driver architecture.
>> Within Broadcom we called it BMAC and when we upstreamed the brcm80211
>> drivers this architecture was already going to be abandoned. The term
>> BMAC is also found in brcmsmac code base so it is easy to see where the
>> split was made for the RPC interface.
>>
>> Generally speaking I am a strong believer of reuse, but this series is
>> touching the other drivers more than I like. I would rather split it in
>> two series so we can apply the patches touching the existing drivers
>> first and assure that there are no regressions. Then add the "new" BMAC
>> driver.
> Ok that makes sense. we will split it up into brcmfmac, brcmsmac and
> the driver files.
> Qn for you: should we rename this to "brcmbmac" or is this current name fine?

It does feel more aligned with the other drivers to use brcmbmac, but on 
the other hand what's in a name. Personally I would go with brcmbmac, 
but I can go either way.

Regards,
Arend
