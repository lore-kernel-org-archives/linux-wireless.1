Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005675;
	b=sQwPvKUxPRhOkTRmdz0G5jAV+9nkQVDQPvGD+pP453w+F9Syq0d1GhtYjYfFaE/Uyo98
	 pz2mWvTtgBtzKy+21/3THuvR/vLb6ZWy/JFTCvgZZOfx0ZUZmaDVoqT88/wGq8THq043D
	 9OrshYy70j4H2KMrw4701d/BCNhblpotCsgA40157OmBEcX9JczrzHYrUn37fH/o4PccK
	 VSWlv/iknJhJUMRRrBhZzc/uAJ3fmamNj7fuMvhR5dzyjiXRPHVaxvKh41cTUNcnjh2Pn
	 OSdxGxWjAtnsYpHKOBg4ICL9FgNEBVTE6dDytfsBV5Zvkw+5BioH9xu3rsl6jCIDPOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y8TwY36AOomBiTRxjmHL4nctbq5ILY0NPnM2M/EKOGo=;
	b=TVF58hUVOvgX3eZtfRX8ZNVaVPYXBNaB4sWlVuVsUljT8tLwPMeJZNkeVLELLbP8YrbK
	 AjNfGQRKfLktzQpHjdXhFaJrtc2zQFybYe4+CFo0uitglACrdh45n5Lb6xVT4hr9q+ddd
	 bbwD5mdp/3ZoX/ROxaiAkIp+dkFs49kIbNWLSND18cFj5j0qEW0EWdL9J7nowjlZSmNLJ
	 o9lmnft4hMK+K6SBSSl0jbANloPnbp5n2aTAL4rLuFH8UcgfIbRWrEGoS9dCoxiN/UwAn
	 1mT8WDVaS6U+thWtMcVDIYJ2NBr5q4tF9To/m1FG90dGtKWfz5hWB6u3EulNcvWKvAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZycmmEa2;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35160606A331
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35160606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZycmmEa2
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so517978f8f.3
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005674; x=1795610474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8TwY36AOomBiTRxjmHL4nctbq5ILY0NPnM2M/EKOGo=;
        b=ZycmmEa2vWqjOVPS3ygfY1N5GMW3YEqN1nfTHTItzTXG9angxEWE9lfZ6OOj8b+D1z
         2q3E0boHHP2syZaZoPRSEMGH1hmEdZN4d6++NChb93Dm95hmFEPj/J6GiydfJ1trH2lJ
         x2Ts98rbInAOu3ytjeTAcSulGWIK7kuN3HoDCILzhCRbhW8iWe956geSxv3FvAUyv5Ry
         YxRUnAFeFr95Rw6cwDswH/W9zANsnKVbkCuw2yZaNzVS099NLhXJlxdWnEMFYM6cWzYB
         UxJjcpZyLlhcW0masjmevysPnPwxhbVNJowA+vKZ7XsGmhe3ciA7wo7Nfln8SozqF06Z
         kSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005674; x=1795610474;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y8TwY36AOomBiTRxjmHL4nctbq5ILY0NPnM2M/EKOGo=;
        b=AW79I10WHpu64GwWrP9WIqN970lpULuY0ggISjGEhMOvWO7SyyiWDY6OZhhHtZbMw+
         6+gm8ziP7LFG0WrXwzu0NWg30//wrdzULiYY+hxCQsHsD5XrH/7Ele9T5FuZL8ap5FjZ
         tfTCTuVH6qGPf8A8+9QQDkFmEcItI8b5OYhHANmrVuKe5tFRDLSM8PbzNgLkfSBlPIG/
         4JjcYAkf0QhQEzRLkoFk+0njHk7tePe754hAJqwUbU7pK7zZT70/05/beFuwB5Ykw8q6
         Ey1c1bVBg4+/3hHPD8YbXYcsJggwrBZFSqdhdGOItu65U+cSQxiRKtcMTLIOfhpqMqPV
         5Geg==
X-Forwarded-Encrypted: i=1; AL+hErGOg9OjILVdgWHJ5jaGGcCtgEwkdxCVWUt6s9nBy8Xxpz0V/IUAMn2VF7uUKrmUiuXqf9h0YcjrioHxi76Vmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8obU/ND3GwybdWGz7YIvB2Eg8dXPt6bnUs3MHtqsCDcVcdvbn4
	E/3jBM3LUbFSbfijgJeNZsD4VahdQO52MeXwa22uV0499UkqJju6Z+vB
X-Gm-Gg: AZFdTZdRYv4VPBpbtfFZI5DJmoge7HFiTg+QRYooFnWrSRoEY0FUKng6NJhES6XqewO
	LTAJdv/4v4+T2OW7JcBqtfvWGkjoBNqcQKsic0BuMVx7qpDSIdh6t3gVy82i9xcVKlnGv09Ak5B
	MyndK+E8clPUsxCRznww9IFno9hWUJO2xtgR4kz3wFNAjGW3+yB2FBladHdLzTl16Uu0a8vNk6X
	Cr+JZj87H6AF7WJ/NRROA/SQBr/AlNxsYVGcEYoBrToIptfceqWW5efeaOZSdqFGi4mqYk5P49e
	RqcyqUul/2doJTiNTjhfG64uYBd2J8CBI9/9l4RoMLG7muQVw6aRbXeo98wtyhuZ3qveJDopjFO
	eOYDPeKCjBjdQO5GiCToTXmNr1Nb6DhDuqBsF6okQxzd2+cHncf2YvoL4W1fPPoGq5+RCH4nDTy
	vAb8kfwg1e75qHa0Z05cmSzbC/SHWdnCQdLPu2IZi6NmWGJvuqS2URD2nGGTTK6XQkIbFvLaoiQ
	c1WoZLznqHcUL8p/S1zRLwx51aaksBqKRXmH4MH01Wi0cmC8Dw3RrgaxoRrjBHaoqyghUIjxYcH
	4XSfar58E+KVAvz6qTpgpDLZBEWtTHF3HJ4zFbHMAAGZU9epsMoTRBdIH/mTAg==
X-Received: by 2002:adf:e00e:0:20b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-4a63bea56ecmr3996401f8f.38.1795005673545;
        Wed, 18 Nov 2026 04:41:13 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm4726658f8f.36.2026.11.18.04.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:41:13 -0800 (PST)
Message-ID: <08a6cf57-9c00-445d-bc91-9375e4ba2ef8@gmail.com>
Date: Wed, 18 Nov 2026 14:41:11 +0200
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
Subject: Re: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
To: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
 <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
Content-Language: en-US
In-Reply-To: <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2026 09:43, Ping-Ke Shih wrote:
> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
>> On 24/10/2026 01:57, Bitterblue Smith wrote:
>>>
>>> Theoretically rtlwifi supports WOWLAN, but it doesn't work for me with
>>> RTL8821AE or RTL8812AE. rtw88 doesn't support WOWLAN with these chips.
>>>
>>
>> Actually, this looks like my laptop's fault. I tried with RTL8822CE
>> and RTL8852BE, and they don't work either. The wifi card doesn't have
>> power while the laptop is suspended to RAM. There is no option for it in
>> the BIOS, either.
> 
> If you have an external PCIE adapter, it will be possible to connect
> an external power to keep WiFi working. (Note this might damage your
> laptop or WiFi card if connect extern power to wrong hardware pins)

I don't have anything external, but you gave me an idea.

I soldered two wires on the motherboard. One connects the M.2 slot to the
3.3V line which stays on in S3. The other connects the M.2 slot's PCIe
WAKE pin to the laptop's power button. Now the laptop wakes up when
I send the magic packet.

I'm not sure it's working 100% correctly. RTL8821AE (with rtw88),
RTL8822CE, and RTL8852BE all disconnect from the network after waking up.
Isn't it supposed to stay connected?
