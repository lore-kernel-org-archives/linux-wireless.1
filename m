Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378148;
	b=2MbyvaTUjY+KCFg34ZzxOEBeXFNZ21LAQIhviW9pF205IONfP1FKme9hwwTaEOxcq3OD
	 yT/Cyzk1S0vzpPgMgN6rqidDrXwPNB6GgdHeaGzXVL2Dmd3AUjN4DlvaKnxJHePBxddlg
	 9E0FHFrr047C4wiPWgpcTyU00R0tEcsduoGfnhnpOaP+Ak7JgMij4g0FvU5abJrk0oFr1
	 yYjVuOoY2ZLzDzJb+xWlsuSUtgf90zoGjhFXBYVaxUcktCErU3cjDK4wRW/QOHinwvXkE
	 wxpHA8pHUEeWTDtG/lXL/FDG1VygLIktCHDerKwLkCqIpu23t6pIzJeseokuptY5G3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378148;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
	b=fwk5sGeSmbpzWVDpTDFCd+2JCX70I+Ie7mfCDL7GoNRaa3XYHELuKE57UaIS26J+kr4B
	 U/oi8HPWjyWQSOAIs53XtSFU41yqs2d1HvnEaK+tkzsgvxguSZjLdWxo08uIm8TaJe0Kw
	 CVyuKjzJlgt9VGM2KT0MJMmLE2IvPWw74vrR6XCevSHjuqbs0WepPhj7TZae76H37pG0h
	 LKW46SbXl+6aoOuCgbU7WmLgpRy022tlG3MsILinVLSzkDUQpoZPs9vihSd8wK70P8LVT
	 xG9GMPrRBjIyq31RpQo0y1F1REvgu+YTbI/+TcXPdCL3baIXdORFpwKiUwIFDROSyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PtDyBzu9;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9D606A31D
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D9D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PtDyBzu9
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1065515a91.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378142; x=1795982942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
        b=w8tFWjJV5R5o8wvxuvDVOPikH9iIlNoORWCZBT3jXmWwDF+pjfTicmSPVLz4jFSxg/
         iGRHQJ2CwzgZwkyD4sKjq8uDTosHATkMuUv1NTa+K7rCGZb/xeEShGNpNkgoxjUrFT2U
         yo3PmNpW6TV1gL2yGReo0d//dwQ2FnRB7h3B4TR5nOfDcOfb4SSLjdWwlzE42IdemL6n
         RU8l/2kCSrXriOtr8WnBp4ZelvoL4YKL1iIi3KJu+JveYtZi6QTomv+vFC1Zo/xPPfnz
         IX9nncr2F4MwmPy7SEv4Q8aHWyEmQCd79kD2TYVszfYNMp8QruHjOh7CyHLOj8kMS6cL
         lM1Q==
X-Gm-Message-State: APuU4Z+C+aqCUcCCDkyCWQgF+vTALpsIMcLxoHcHxp2usotp0CEQeZqh
	jlUC2wCQTjjYPuQiJutttGXyLe8zHild3471TgKEFKQjzRtHDR1ew0OUj2JsruMAmyxnliKyMPZ
	YEJMVKnYVr+JXCP4BoS+2yBLb2U0H7iFrsFdMWgmBzcoVDqvGda7U5uE0LLZWLG7q8i6M0Ok/IJ
	bTkjiQqJaNYZcVUrRSPhsOPgG5VBPf7kxkcLhXUW+HZbhR9bfv8j9UT5x0M3ZfaANghkjI9Gn2H
	9w0g/JvbpeHEAlIgo8HJqUZ2Ydq
X-Gm-Gg: AZFdTZcibCXXrEKLwshX+TU1meyMJZW5igEQe5eHxvGpRx0ZLvTN84zsjPmkjiGZZaC
	2PqpitJNQjyoiKtEd5MNAeWamXM7M6WGMT8bMfz5gQhwSsXi6XyG3pAjrN/T4GP4OYJFm/4DOkl
	XkUpGiCxvEHRwA14MN1CthbjPVh1ZaDOGQ6A2c+qDyCwB3+21Xz/gzYGqS14KOQhDLLOOpiu05m
	hwDrcwOTX9rkWJ2kqXCXKzON7Z6S7l6bN3ncCZbhDbK/QdRYXzYonZpLEasjofPAgTvqR1aPbXE
	qx+acmO+rjSGnlFzNb4Ng6oY5vKvZsNdlplDcSLYWe28UpwBnNqb7+2HDCcQu5D/gRnZmZUrkaT
	hH3WYeeXV9Y7T6hdgp3c6I89vH4VtcaOPnI9/eKMSRLEIMX1zjkwYXlD6I5/wLstRuSd18QZGc1
	F31KyUjDJXBlfupU4JXAPKrbdHjz4BglLcXKHkq5M=
X-Received: by 2002:a17:90b:17cd:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b41c8fe346mr8398802a91.27.1795378142020;
        Sun, 22 Nov 2026 12:09:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm7943362a91.7.2026.11.22.12.09.01
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso2679381c88.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378140; x=1795982940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
        b=PtDyBzu9q/pTHMeMXE8peI8UEK07iI3v8t+WNlIkQO9kXFw6k+7OYNgLFdofWxBgsE
         Xf7fgo09Y2ZvHfZ7XUZTMgIndXSCO+hCICgItiZG3z/PtTzMMfMj6KSQrWjPbMebThuk
         dOdyzMFpFitWEXbjwajE7BdsE8vY0Uu1L7IeE=
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr8092090c88.1.1795378139975;
        Sun, 22 Nov 2026 12:08:59 -0800 (PST)
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr8092063c88.1.1795378139246;
        Sun, 22 Nov 2026 12:08:59 -0800 (PST)
Received: from [10.229.42.90] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm22632889c88.1.2026.11.22.12.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:08:58 -0800 (PST)
Message-ID: <68def4e1-3429-45eb-b025-dd0fa10cb58c@broadcom.com>
Date: Sun, 22 Nov 2026 21:08:55 +0100
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
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <gargaditya08@live.com>, Andre Eikmeyer <dev@deq.rocks>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
 <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Content-Language: en-US
In-Reply-To: <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/11/2026 11:52, Arend van Spriel wrote:
> On 11/11/2026 15:28, Aditya Garg wrote:
>> Hi Arend
>>
>>> I really have no idea how to deal with this series. AWDL is not part 
>>> of the IEEE 802.11 so I can imagine the kernel wireless subsystem 
>>> does not care to support this. From driver perspective I am not keen 
>>> on supporting this upstream either. My limited understanding of AWDL 
>>> was that it was Apple's variant of TDLS (802.11z).
>>>
>>> So what does AWDL provide to user-space and could the same be 
>>> accomplished by TDLS? From the explanation above it seems AWDL 
>>> provides more knobs to user-space, but not sure whether the awdl%d 
>>> interface is merely a control interface or actually passing data 
>>> through it (patch 5 implies it does). If my memory does not fail me 
>>> then adding vendor commands is generally pushed back.
>>>
>>> Regards,
>>> Arend
>>
>> There has been a lot of Apple specific code in the kernel, be it HID, 
>> DRM, EFI etc. So why not a small bit of code in brcmfmac. We have 
>> never faced complaints from those maintainers in getting code 
>> upstreamed which is different from the standards, but is needed for 
>> the hardware to work. While the concern of unable the understand the 
>> code is valid, I believe the author can be questioned to clear doubts 
>> before upstreaming. Getting code rejected just because of inability to 
>> maintain is heartbreaking when people work hard to make something 
>> good. Also the patches are just for Apple Macs, and not for supporting 
>> AirDrop on random hardware, so it shouldn't be that difficult to 
>> maintain.
> 
> You are reading stuff between the lines that are not there. My concern 
> was mostly related to the new vendor commands. The vendor commands are 
> out of favor as it was used to avoid defining an generic nl80211 command 
> and thus avoid true collaboration in building a device independent 
> wireless subsystem. In brcmfmac we currently have one vendor command 
> which allows user-space to interact directly with firmware for debugging 
> purposes.
> 
> Also AWDL support is not about making the hardware work. It is a 
> software feature providing the transport layer for AirDrop (and 
> apparently t2-drop). I would say the same experience could be provided 
> with another transport layer, eg. by using NAN or P2P. I get that 
> downstream users are happy with the AirDrop-like experience, but that 
> does not make it a must-have in upstream linux.
This has taken a bit longer to decide what to do with it. Adding support 
for AWDL for some Apple wireless devices does not feel like the 
collaborative work that makes my heart skip a few beats in excitement. A 
vendor agnostic solution would have it racing.

I had a short discussion with Johannes and in general vendor commands 
are banned. However, for this feature we do not want to push for a 
solution with nl80211 commands. Hence I have review the AWDL series. 
Patch 1 was already rejected because of a similar fix that was already 
applied to wireless-next. So a v2 is needed. The patches 4, 6 and 7 need 
changes. patches 2, 3 and 5 may carry the Acked-by into v2 as they look 
fine to me.

Regards,
Arend
