Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321399;
	b=H2LazWWzdGsPAe/ZCKwNBmpej4JPFxF1uEp2jSrKRuaq1CtwyB0MwEeph3vRBlxRxzCz
	 ljpA40rt6WW0+Nh9ZjLAc4cLncEKpKzDa53MrYc44vTNYz+hMlPGOI6DJRi+gLKkQETGP
	 M9E2zoT5nW1Az2ChtOjeRO2thMjIAOig/S0lgLJeu0mBXl78lWuKXp6xxbYydUcTJSRO7
	 R7iO6gHNkLsj+T5D0vyqCBSxH7sDpJi92Zvu0x5cVXcSHSApdAc8AfsXcTjyIucvNYhkV
	 mJK5H4diaiPEsKh/lHfqlvIDCqDaXtB2sVgUmNTuENdLN7qMyFqTCPsGmypXtJv3zHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
	b=Su7v8Msy4/kH0jWSDTUMaWouVU/U7v/yjTJWLDmH2u6jGqFiJOLOYGgMQM+YOJ9VVEWM
	 xdK38fxz3Wh0d8cWX4lU1QcV1P8ryJ/BGZfkspliKUiJxGXc/oy2ziI1+6UG9QhZbvUMI
	 dFFzNFsiiRp3667+s0XpphcwTjDzKHwRq529r+ZXkNOS8Tb/5M3wsUX+0DhEeED3czTTt
	 /Vwf+xnGbNXojxBh2ROKHR7kgeyRk5QgfiSbtELr+EtxYJBzgsMHA0ahbRJw0E6qYokTb
	 lDSGnBYx3GOf2PlzPyH0K4zZLiaejkUK7whBevkC3/yrgEy8ao+ziUefYCoWhsrypKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz+ivFZT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1C606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 14:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F1C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pz+ivFZT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490585eddfcso1645363f8f.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794321397; x=1794926197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
        b=Pz+ivFZTu5cafYZ/TV/v6NQLhQMOrajdpOQdyJO9UUbouYEHJN/LHPLbInUHZ02IFM
         KL7aHFdYURc5p5IGu7GInwBhFMMr5v4Mb1tII+e2j+LzoP8aDNQ6tyiPrijZZkukByiV
         X9trbqe3voo2TfCRm2riB6nV+PlpllS5pic8aRlsc32tn74dGja/dhThWdv8Vbq+jNUP
         HrCC5yZ2Z29/bkXDRGKk+ph/JCv8NUc6dk5l3nnNjExHpik2EKlUJ/KNd2vBjOuJff9r
         PhlbmkYVjuF3lmC2E/zBfQYiYVapZufMil9sEXCpUjgH3D9hGVXnM6DI1m04jaVrs+Wk
         no3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321397; x=1794926197;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1q9uCh2Ub/6jdRiey2I/jj9py/sllPqUb+7EdBZ/WM=;
        b=P6tuy/N3UoCa5TJ83nTwDCHkQMa5uHSoeSWS9s06BvNs+CNtF3ARJpW+8at5xelPHl
         NSBtWpXT84iiB9rHCiVrSsUIE0+5fK29VxglPz1OR7koCzAfabS2y755IcQm4Q29cExF
         hsdJD65y7+jGJmnjy87KFBO1Jdy1WdYx7XB9lbo4UA/Ykd5fDefiqppfhhGBkFico601
         wt8l5EKzw5Rw/HFNKdqEw2IjEP9Eq09uoBDxYxIzKugp6f1y4kGWtPk0KTIsyjLQ4woM
         Fa1RFKarrhnhhh6qiVcM4RGkI4WXcukYF8s/eTPO6Rn6r97TR5H4J1KaPXoMneoYpSZY
         G6UQ==
X-Gm-Message-State: APuU4Z/yFWXvnuT7+c4GItcOXxoEZw2OwRv3oItqYM1dqm6ZQ5H+V99V
	sPJSGPnH6HdVmHqOZSE46GSbehfL8uKOSoyYZhZEIO977frvqe5/CrTR
X-Gm-Gg: AYBFou38Tkv52LqU/pxOcrd8pvlB3qVY2eISRqnBheRgrv0oAFrW9/PaszSs4fy5Ief
	EjaPxbprwLLfCHOcVzoQb7IX12IpKfPig/NfaCKvG3JoCKcGl96IA435aR2hmR5DNk5kD5jD3Q9
	gM9fp3Pz67DwhuijR3ZTxdmPdM5i1vbACxDFa7fnX7F1L8y+nOvCKuRiC0DSon0wFFpGOHaXiO8
	M/Y93+1JIQhS+KNBJcGRV7oorjB68KzzmSsIEVEN7l1mUIyJHcaofdDXBlbng/li3H/teNwS8LV
	TljB3OMb/2DIRm9YCXwZ3dEN0zc14GqUQbKdZAcWzXFRQjO8A9sxQxoS9aVTBABy0fUAf/L3S8X
	vMVxJYK4ZrmG/WBAG9ZWNFBBMhUT4GwVCGA+peRxm2WUmR1hZ85Zhmp5BczO4GrO3RnjlkQ/Xmc
	NhY4b9x9J6CZ3uaYm4iQOrV9szLEli4aaQfqMZITI6WSuTC43y0fKCfLfs2KU8d2xnl7p/X6xLl
	NMoH1Ra/ojFK38IJfNSO7Gi0GXGypR5YjN8FMC4hCQ5tNoyDPMYer+K9R9FF5pptiFeHAs5VW8z
	L1nVf4UThZn79jd2QbZRDixQfXy/fErCWNi3IoU9
X-Received: by 2002:a05:6000:29c9:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-4982ecf6aebmr3458602f8f.18.1794321397525;
        Tue, 10 Nov 2026 06:36:37 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm5319955f8f.36.2026.11.10.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:36:37 -0800 (PST)
Message-ID: <45407e4f-9009-4f0b-a9a8-58b7052d25a1@gmail.com>
Date: Tue, 10 Nov 2026 16:36:35 +0200
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
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next v2 6/7] wifi: rtw88: 88xxa: adapt channel sensing
 to receiver gain
To: Luka Gejak <luka.gejak@linux.dev>, Ho Jie Feng <hjf3108@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-7-hjf3108@gmail.com>
 <4ada79186cd882a6d3344c43579e5addc4d4e644@linux.dev>
 <3bd7d396-bb54-41bc-890a-bfeab90dca3a@gmail.com>
 <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
Content-Language: en-US
In-Reply-To: <1d7fe388a84ba7a078efbf1972869d63cb8234ea@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 22:27, Luka Gejak wrote:
> November 6, 2026 at 8:46 PM, "Bitterblue Smith" <rtl8821cerfe2@gmail.com> wrote:
> 
>>
>> On 06/11/2026 19:34, Luka Gejak wrote:
>>
>>>
> 
> [ ... ]
> 
>>>  
>>>  Bitterblue, did you turn EDCCA off through the edcca_enable debugfs file?
>>>
>> Yes, that's what I did.
>>
> 
> Thanks for the answer. So I think EDCCA itself is fine with this patch,
> and it is the lower thresholds of the adaptivity mode that keep the
> firmware from leaving LPS.
> 
> To me this looks a lot like b0435910e47d ("wifi: rtw88: 8822b: Relax
> ETSI EDCCA threshold on 2.4 GHz"). There an RTL8812BU running as a 2.4
> GHz AP wasn't seen in scans and failed to get TX reports under the
> ETSI threshold, mostly because of energy from the adapter's own USB 3
> link. The fix was to use the normal threshold on 2.4 GHz under ETSI,
> capped for EN 300 328. Your network is on channel 13, so that would fit.
> 
> The 8812au vendor drivers don't use the adaptivity thresholds by default
> either. Both v5.6.4.2 and 8812au-20210820 build with
> 
>         CONFIG_RTW_ADAPTIVITY_EN = disable
> 
> and as far as I can see phydm_adaptivity() then stays on the normal
> (mode2) thresholds.
> 
> Jie Feng, maybe doing the same as 8822b would work for v3, the normal
> thresholds on 2.4 GHz under ETSI and the adaptivity ones for 5 GHz and
> JP. Bitterblue, is the adapter on a USB 3 port, and do you see the LPS
> failures on 5 GHz as well?
> 

It's in a USB 2 port. I am seeing the LPS failures on 5 GHz too.
Channel 100, 80 MHz wide.

> Best regards,
> Luka Gejak

