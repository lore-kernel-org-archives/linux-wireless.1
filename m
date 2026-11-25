Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625671;
	b=i+xbfAGkeqFoidAa2uMKQ5yoAovQYteabXJD+egbQtKdhp6yf7APVvPz7aG12WFftQkX
	 7sFzSV2/ub6a3Y99aZNXliPN573dQtHrU6vyOADHRxrjfR4bLwsshvUaAt1SMvJW/LV6W
	 9HHE52MCeGtxa5+/xBasPqrzel/irybiOy9mZxlEQm7gCMpur4PicYnJUpVXsXwbMGGHB
	 dgg1fOyHPnps8WXsRQsYFv9DjIfdGFGEdSfOMhuvZ8bXmJQiBIKda4RI0TagDPmUih9Te
	 fSEbjuHoFSJsYWleKoLLpTAzKk9duJXqTBOPj6cBN5yzAZ6ytvs/kOr3lMXQCsWkb0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aGk8wAfS7R1eyNshm0RicBAD911JxJNoMJ4VmyhbOCo=;
	b=cRs3g9G03fQUljVJGzz8eE/6rd9L6f8erD8FLLOLRJlafn6RUBdmDCVuYN6+rssQxQKn
	 hRR+xlnre/8IdBlHyd4lFKM1vQUrs4vlPeQwdINF3vuw1LSukfbhpdljj4HNjeVBOaK5v
	 ifnGHbGl5z6iLNP8RUPYxK9dY+yevmvul3UmtYuJ6Wr7r+RrCKmao8aLcwHajUeiluqwf
	 ymyO9mcmVqWJfAkZbSo4h3MgFZ/ix/UP2GntghAXvNgvM9dBJN33qMOCGPZKImPviWMOM
	 fim6vYQh9hveUk6r/Z1d9fNZCbVRaD3NuOH/Vk781eq8I1c8Od8lY6oHmrSsS1XYXjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mind.be;
	spf=pass smtp.mailfrom=essensium.com;
	dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=BpUIuiKB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1C606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 16:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mind.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=essensium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=BpUIuiKB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso47668865e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1795625668; x=1796230468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGk8wAfS7R1eyNshm0RicBAD911JxJNoMJ4VmyhbOCo=;
        b=BpUIuiKBHL5bSsFmwua8WTIqyZY3sBN4gTCNBZqhzvzSWNgFNcVw9UisPrRk2I/F0/
         Fa6m50iHXaFOducfP65OS3cLVVMbU5l5PrewYyG5X4A+/Pl6551mCuvEORnhxBmo/ylK
         CSwI9B5jUX9XDRtlf8+hs9iOuLUUVee5vEZ8UnpPENSqY2n3/k+86CXEkfH5VCdVoKaZ
         9XHpl9LG4l/egln3vx4OD1e4ZwbG9dIwjAwWOzN/idIbKN2muDF1nJAfsRWcKKKi18Cb
         lHwPuF+HSooB9XjJ7GcIA0U0oPeDs/suUGkSnhX1hKsPJJ6I937otmAUlj49fEDZKmE/
         1j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625668; x=1796230468;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGk8wAfS7R1eyNshm0RicBAD911JxJNoMJ4VmyhbOCo=;
        b=2PcsTHF+gX25sn4CbEBGr/5qUwzu+NVU+wPWj07RX1SJ48gm2mdufBrT24hikmCWao
         MVd2C7kL3tg6tO804EIkdBZcJWNL5/yx49t2cSYLNlFBK+sAAN+wUsqEWCdoNHOTyAQA
         +fe1sQWM5d0YyehNnPlmkbVBxQ3yx3G8F3isTya577zZI3GPgQ78JsNRYgb4cMSoVuT2
         ASecbYpiZzMnTgmekxUIswREcK3kC2IxV1pMCv/2rE7XO0KRxpNDeRvt4t05WIzC6dY/
         vMD7jwtrHXnt7mp78FPA/9mKX1GBevrUBeUqtosqIbr4HHTwSbKG5mpD6n+s63VtFnlW
         gXPg==
X-Gm-Message-State: APuU4Z/Z32f/nA9obcYifWSk8SAeXiCebP5VxZ6YAwkKW+P8e5kEPqJP
	zrJlFISOcY/xDFe8YmWq/h3wysB5MsmSZ/2QxLQRj6RxBLMGh90qSfnY5o7dEPLSi/2Ls+XXX6L
	AlB/MGUo=
X-Gm-Gg: AZFdTZcxeZwRlmWQ4+CEBLGHcUizkPNRHqRzrY8tRj/T6ZxEBWTPBymQO7tB663oKZl
	eicGwaDkdc9PuPa/aeBLpzW1tQNmlaKuqP0UAo1TSs/MmEYFT6fvM2Og0FIKoWSfUir2QZAbvoy
	5N7sZQmyXf7M1+X8mmkD0Ix237AKwOdqBMc5tcVG2JHexs6yYftfitjJ+5k+4QNA4oX5uQd/IPt
	W4+CWn0neD34Ty7rZdFTFg3EYBwDI1BlVJILxMczyzvnxMTkXdjAZciEbrOTdfUALfzho+sIsQ3
	+iNL5+N0COA4Axq125LGeu6k1xH7KoX+8KpSqj31D5Z5cHvDelg+tU0cz6KiFq8MBzPsm3pRk7s
	jyG21M3POT6U0gfdrsT9Az5peSScjLxIYnRtDfv9UfwYIeV/feRDZnmPzemopVm17I/JfmjMdvq
	kE4fV0Gt9w6k6LRQm/suS6QUlAQPoWiVW0suiJAgl6qmX06rxG5nEnW8Bo7dasQIRI3Xctt6nTb
	I09zdCH0EjDBNaD3BoTaeTLZlGI8wXPfUmykAnhgHWxwiABbKMgNHEkS7qLS83sydMpASYIGbVX
	kKhGWA4DwpimMlO3xAyaaf7MdHkynMEL/xNXew==
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id 5b1f17b1804b1-4bb88816acemr404825165e9.22.1795625667941;
        Wed, 25 Nov 2026 08:54:27 -0800 (PST)
Received: from [192.168.178.32] ([212.233.51.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm32021799f8f.17.2026.11.25.08.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 08:54:27 -0800 (PST)
Message-ID: <82c360f0-eeaf-48e3-83f8-72dacf4877c5@mind.be>
Date: Wed, 25 Nov 2026 17:54:27 +0100
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
Subject: Re: [PATCH wireless v2] wifi: mac80211: limit assoc mode by AP when
 there is no auth data
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
References: <94c01af4b987ae7b04aab040d2683edc3262c35e.camel@sipsolutions.net>
 <20261022143943.1045238-1-raphael.melotte@mind.be>
 <3e2f80272a55cee22f52f1fae1f2eb6adb01695d.camel@sipsolutions.net>
Content-Language: en-US
From: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 ak+EAAUJDM0xRQAKCRDDTCsxdUfmrAq+B/9jCJC+OUOxt3t4W/Iorf6qbMWf2LyX9fnhCwfJ
 j4D2n9sZZZQzhQWvbgadZdfRigt6G0CXbQeomPRpSqjiI03ZK949++CXnaOY8eUkyO9a+LcK
 ldAg0Tnn6b8Ctzmz26Ad92fgjXHGApyWlA8eOdlJq7v2QitsETy2WfW/W+OUU83eDpdE6x9k
 xQKWiCoxYEpRqBYrKY5gFS7gMC2SzjBoscuY2XZHpdWeTWjgJkPyJrsAsgL1m2Tqr1YFp0Sr
 A5oZDtUbL1pr/ds7s4t/hpnjFlFaVFmOsb43MeXV8fb8SVYEzKzYKY5Tf6oRgwiWVR6QphOl
 V0oUMxLmLT+TifE0zjgEak+FQBIKKwYBBAGXVQEFAQEHQBGpVdJ784oGuZ9UHdNMBh+D3Wxx
 Tuhm2m4PM12o6UluAwEIB8LAfAQYAQgAJhYhBKMBkG8efCQckSPnasNMKzF1R+asBQJqT4VA
 AhsMBQkB4TOAAAoJEMNMKzF1R+as9sAH/0u4E/aKnSsc2k82/mWbgEVhVtPuKHxF5vwbWEz2
 CcPluDN2VruhYXaEMhn6iIGHaiajq4/6vytdJowQZ4s1vlP4Jea5/iuIJOvQo9pKI1V2/l3S
 Ji1o934tEkF6F4wV2tLiPW19Iq0Rtgi0hlrdQfw9Iqx4Y1L8zH7iXNHdHQdEkzdg9f6o6Vn+
 e8MaeJfN31TxQEJWyJjRYa0mlWOLwmlUz14EYNgnXhv/hKHdBdyJ/9f6HWn6ZBRHQiS3+Tx6
 kt2XcCDBF9w5QI2xoVTyCUchbN7vSiEx8H5vhl5Pwjf9Jzw5ts5XsCZnWZEAVCyNjTb+UwfO
 37Y2HGJAe9GA0kM=
In-Reply-To: <3e2f80272a55cee22f52f1fae1f2eb6adb01695d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 2:44 PM, Johannes Berg wrote:
 > ...
 >
> Why would this only be applicable to non-MLO?
> 
I've only encountered the connection failure with non-MLO, but 
theoretically it also applies to MLO I think.
I don't know if it can lead to any connection being rejected in that 
case though.

I can see two possibilities to cover MLO as well:

(1) Do the same prep_channel() call in the MLO per-link loop (before the 
EHT check and the HT/VHT lookup), and drop the later loop that computes 
the mode for the other links.

(2) Move the mode calculation and the HT/VHT lookup into one common loop 
after the MLO/non-MLO split, but that's a bigger change.

Do you have a preference, or should I send a v3 with (1)?


Kind regards,

Raphaël
