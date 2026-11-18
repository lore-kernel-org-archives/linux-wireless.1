Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999125;
	b=o4g91ffmLWhCt3zcf0qmeEdlcAq0V19XZ1cPCt1jvkAIm+UzNgsxTxeovZWdz+a1Ywa+
	 ljbnAGBGbiC/G+W7gFa14JrQQH+JEUpLELLdSiEu/q+zJH348eJiIDyIdQtmCnspTZr7z
	 ej5urPJxUGvKfyflpCJn4xPkYoNXPyp00gkEqhnBVojI0JfT03T0Kr9qnsAQQWajJCcgC
	 cmuGQk4dqrDhw9mRIqaZdtEJ/bt71quTWJHbi1U/wLxalrC/6cdUKkB/vqDyMEGObhN/0
	 jcND9Y4V/KtiwRMrk+hcOEX4CwlsgSLgJ5Gasd1zb/mp1x1ly1fTj8BZ9Da+I3jefjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999125;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
	b=b4IEn7IECMz9Dh+Nx6QBWbgu4H0lsrZOuTXrMms4vzq/6jRP0RNEsnSF5H9pFajs9Poj
	 N5Nz8b0SqJPWYDvWk8rtT5o+U53ylYLa25eUERvkJtQBqWcAlqiUkoPkidt1wgOT4+QEe
	 Ocs9ezYpN9MAF8GOMCopxn+Jh4atvoS47Z7Ivoj1ZxArEB48mrkvcMHqcYrcCkcOxPwRy
	 KBQAZzFYrGIQ1MBZRRAgxS52DenFOhxDiGDYMa74e5ikY5Lnw1AE19rW9Bq56w37YK049
	 rZ6GZIICvBqWapszPRjEuvixHUUtONf0o8stSVhF+GipPHC7L1Y9BnE8WuZ/NI3GTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IqNDTQ05;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4C606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED4C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IqNDTQ05
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so599199a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999124; x=1795603924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=jlyVN+FCChH5ZL5VPP5eQ3u33SwdjWDxHzaZzbA3TwFMC15tQCu9p4zBlxMGIeECes
         H7LBKTXPo0soQUDobgcWYY4SlcaqoFRyCEriq64EWsw3Y0P+nyN+slQ4LlLJrfNCTeob
         50lI3i4OQeeRTZE0Gmwidq4QtVnAUvbBFzcAanjqK2oTvelgSXV7xMuZd00eHQqoEUJX
         pRbWGK68B2+whvD7Vr5jtfxt7NTsXXPuaERSSnNXqba3iVTzYOjwNPGPLHzYbfDs/MZ2
         54RhhCOHEXQZlxXJE4R8KEai0cffd8t4hzymhvz1PTTzLTo4vGpCa9IhP9AoD3yx6BGD
         t0wQ==
X-Gm-Message-State: APuU4Z+SG9nzsISgDxg7Y+fljcnadKFAInKdnC5ovFUnZ7vyC9vhyIMP
	Y9w3nKjlZK7Lc96hROvQGt46UeFmK+c2KBwKpz1zMgTEYSs9nLd6eCZACfA0PjYw1oG4kdCNVRO
	wj1kjsV9DWy1zG/V8s7CkBsIsv5oIu7q3NzNVd55IuvFDhXRyoxqS67lYa794i3ao0QGWMOAY5l
	mQraF1aDUAgLEzVGshFgQaeYtI2mY8XwQjntGRotX8kFdVBWsSQzNOWvnAAUAmX5Y73rOt9JIZp
	6ODOZRc2nJd/b18kfofxAvI+sEr
X-Gm-Gg: AZFdTZccZo1ktN0RTAnXbgQcs00fqqm/vuNsXwQIY5UYca1BjTtfaeHbgnb59gQTFsa
	Dd44w0f5ypeoEE8jH6CPXO8ubpwZBuHQ2e6UcVAZr2nCXhEYb22IYrrvN48OrH8Ez0nTNVUlxyd
	EdPjQycOe2LJ3eMX+Ja+eMFM2LSWLcPUPwx+zhWk/RFIPH9z2FMz2b1L5Ntn2iAKA/WGxA6q3iD
	bogyWlvPw4czfWUnANViouJAfy245NtNy0DaDZbYcWdugZ7NOLYtwICWnU1XW8J8gWYofyzWCcF
	AVjeIewfZp2iYlsyhSpLQof/wU/4GdV7UPk/Eo+aAHhithYzmAmAXG0vDyYNWgQ+mvcWWNNDlxn
	+G8HObQNFvvtKouFjxsQxKUDyc1vOu+CU3f77chwa4H25N3VPw5B2OQJ4msT8+NtLrj5uAlA0Y+
	POqqTOoI6/MFn6YYtsdDrwkL9KZEA9lU9IrLfQC6k=
X-Received: by 2002:a17:90b:2fc8:b0:3b0:9e2c:9b60 with SMTP id 98e67ed59e1d1-3b3d07a210cmr2096342a91.21.1794999124219;
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d41c1b5esm641636a91.3.2026.11.18.02.52.03
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55b9c13273dso14424231cf.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999123; x=1795603923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE7v7dHvmS75LoRvG3gK/6EpuUCCumSYtyu9zFwPn9E=;
        b=IqNDTQ05FJIptEe9YxBZgFuRv5PC+iqEKRyGoZsSOEgEaauyQ/TS84C9wCaPX98Lc7
         I6l7hqEbu9rQKC/9eTln/pva6P/49+yIiCdUKGAirt1C8bdrQoaXC+f2r2DCDgmEk6DB
         Alk58Pm5ImE1jnT5kc7DmNuGnvAsQoRqOYKBc=
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115741cf.25.1794999122903;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:5b8c:b0:536:5004:6347 with SMTP id d75a77b69052e-55d5a57e275mr32115451cf.25.1794999122352;
        Wed, 18 Nov 2026 02:52:02 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907bb80sm19852041cf.17.2026.11.18.02.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:52:01 -0800 (PST)
Message-ID: <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Date: Wed, 18 Nov 2026 11:52:01 +0100
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
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Aditya Garg <gargaditya08@live.com>, Andre Eikmeyer <dev@deq.rocks>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/11/2026 15:28, Aditya Garg wrote:
> Hi Arend
> 
>> I really have no idea how to deal with this series. AWDL is not part of the IEEE 802.11 so I can imagine the kernel wireless subsystem does not care to support this. From driver perspective I am not keen on supporting this upstream either. My limited understanding of AWDL was that it was Apple's variant of TDLS (802.11z).
>>
>> So what does AWDL provide to user-space and could the same be accomplished by TDLS? From the explanation above it seems AWDL provides more knobs to user-space, but not sure whether the awdl%d interface is merely a control interface or actually passing data through it (patch 5 implies it does). If my memory does not fail me then adding vendor commands is generally pushed back.
>>
>> Regards,
>> Arend
> 
> There has been a lot of Apple specific code in the kernel, be it HID, DRM, EFI etc. So why not a small bit of code in brcmfmac. We have never faced complaints from those maintainers in getting code upstreamed which is different from the standards, but is needed for the hardware to work. While the concern of unable the understand the code is valid, I believe the author can be questioned to clear doubts before upstreaming. Getting code rejected just because of inability to maintain is heartbreaking when people work hard to make something good. Also the patches are just for Apple Macs, and not for supporting AirDrop on random hardware, so it shouldn't be that difficult to maintain.

You are reading stuff between the lines that are not there. My concern 
was mostly related to the new vendor commands. The vendor commands are 
out of favor as it was used to avoid defining an generic nl80211 command 
and thus avoid true collaboration in building a device independent 
wireless subsystem. In brcmfmac we currently have one vendor command 
which allows user-space to interact directly with firmware for debugging 
purposes.

Also AWDL support is not about making the hardware work. It is a 
software feature providing the transport layer for AirDrop (and 
apparently t2-drop). I would say the same experience could be provided 
with another transport layer, eg. by using NAN or P2P. I get that 
downstream users are happy with the AirDrop-like experience, but that 
does not make it a must-have in upstream linux.

Regards,
Arend
