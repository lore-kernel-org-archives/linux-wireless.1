Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398423;
	b=QjcgXU6CkoErlikrGyoVN8kSSeGRoq1mbF9Ru0LrAId3yKEDy1IophPj8xbV4v2BrO6m
	 NTZvVVBD5kCF5itjK+N/DoRYA/k07kHCf7rcBfrjEwbYwVwP/Z0/YHAEMSlVI2rW0Y2sE
	 jgjLs2XQI+cHPOSJCVmf3h+wRN2wgD1wVjL+uDyrSGcQU0WH2lEvQrVYTn1sONZ+W0nWE
	 O+2EubXPSqLbaI6HJxLRYQSpexVdw/9W+HtD+ii7ba/1x6dKm6GT8a76LtjMmOImGfNvy
	 I9mbSNXd+ZaKljpkUX67TFrtslqOwpA0Q23OiBqMrORwJl3lbTdf0pWLhk9Ykxoofgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gxf/Q8EBGhjTpBMxS1U0BNMS9Fced+Y9IuDwDkdVCOM=;
	b=KDzNmwUql53iudlCJitkqQ89xQbHD1rcnoonfmLJy3/4t/Wi24WKwnEb3Y8pmoDgCLFE
	 X+5wsjdj3kvKa4NJUYS2EDZcG9yka5by2i1vfBYHECZ7y8gNFLL308Boeu3XI8fuPGvEz
	 l2PTcY8Sog5yd0IzcXNYeQU2qjSS5y8SXBnxSYnnb8eNXpfrS4sDmFPQuPhV9kKO1Yaxw
	 ONLbeiQ6h62ZJNk4rUj4IstRNJVfaRInBVXCC7Q3cDDauOwJCd6jkmur2aEXKcEpMhjU3
	 ZQxhEN+VRvi9XmnA0StkGQ63QyMgYOkc9PVuD1NvT3qj1rzHaVg7Udr2Xv4IYKbUXpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7pJPvdp;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378C6606A88F
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378C6606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7pJPvdp
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so37457625e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398421; x=1795003221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gxf/Q8EBGhjTpBMxS1U0BNMS9Fced+Y9IuDwDkdVCOM=;
        b=Z7pJPvdpADOPTRTb8bC7uA3Oa5eyskXoHNgarw1ZdIj5SzWc+bmdzgaVCdkORUDSFo
         6/Tbz8ky1zwiEtoAyN1ZQVeX/4i2/Tr+M9RCcWyJkrj+1RlHeJKpz6XTHpFxBFL+EDuN
         I1WiGtuYNA7Ztr679PRupvV1Kg6HAREmiivCtD1xCkffUpD3ad6iF4xiRZSCdDUzbDQf
         BLRbdT7wqB4o/hSJ1qif9VsIXMSEms22UjZZH+gzQwPRmncEe/dZYIc/k59GxYBacFr/
         YyvIADQCdt0nyZFQtv4e02ReF5zVxWLll0tcU9r9as/KQ4PHtlAj/SH9LDQtOXz2zMpM
         yxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398421; x=1795003221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gxf/Q8EBGhjTpBMxS1U0BNMS9Fced+Y9IuDwDkdVCOM=;
        b=KO3wCck14NykDeFrHalKa0d/Y783v3klD9Dxzy7QzlzYLHKB79bsEd6mAcT7tzwPXk
         YMjfcRXw9L/5XmzwR1lDGAvewiToF307SDkftOugFQPX4mJ0+qlNOo2KBS+hmrvyB9Rb
         MT4OwKO2ebLKZOD0/u4TJO5MqF9BpieP6kFGBN2FLqkOMVAbc7eh4OWisvELxkS6NGPL
         jzAV9x4sUrko+d5b1jDgQ2wF8cS9T/ZRCMwie24CJWci6HAcFRMV5Kp2xzrjYfiRx14a
         fu86KdLilYZyAvkRsyO9MFzxdu6doJxgszcGMYoKnZ24nHudFNbi3LX+3ugSdJZttg81
         Jo4A==
X-Forwarded-Encrypted: i=1; AL+hErGPE6wRg5fLgr8UXzEe4dSw62bzJk5i35/vP2C5wJnfghH2eEoKCnRsTkMhwnxy/4dnjwShJyX3caqfyS5eQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+p2JA194hz9gw6/QIdHl5iXEqwoctK5C4zoFEJ28f9x0Gh4BtA
	P0PEoDA+siqLKGWa1N+XGW3W64LW0QDABHWVX1/MusCeZj2oR1kaVpgG
X-Gm-Gg: AYBFou3D/cy1UkdVAHjcl9SE7XmHbFK+twuuO7tzxbYQ40+79mOPfUmxA8QXQso1Pyl
	aOvamt4p9HoYT961Wp1D3eCPumJOigthZF9aECXfQYVlpKknzsl9wzu+Gpenwlk42roQtU3/y/m
	asU7IrVBo7T5wKY4d9insDAN5/fKsHdPX+zNP6zCayigSiJoI27RTwIkpYH44y20ogHq6IulmdY
	1S4rmD4ulJiuBsT1qTUHbuz2LXkCUtq4lpmxtfapaifOosMD95Adw+8FbNWzpMNrNrF611ydJU8
	rDpaIM21RSIfrghvzJcenKfNpXoDehm7C4vbph9xKFyKVJoHV7Ae61I5waupqjRB/xlouE8prrZ
	U8mHhbAMRg8yQhepvyg0FsQMicjLTMycHQpVvdVouzmJBIdYJbweJcP5JIztGosnc9h7Xm1ZQ1s
	M/kAwJIdEOVzZEjRB9mZ/DX2A6uU0e3pxPdpp/ULbEU+ZIVrcvuY7rs9GS5h30MQMO9kS8yxC6K
	71l1mi5zKM1cGrGtvG+pPOD79+9ZrRwlXQxtAfnDRocsMbQzCItCZ+jkASWBAxd9P8Y9lkh5nkq
	349YgQst2F2BRdrCHc/DbuisKzP9+n0udT3v0dA=
X-Received: by 2002:a05:600c:6a83:b0:4ba:7a0:7b67 with SMTP id 5b1f17b1804b1-4ba08de8981mr36674045e9.3.1794398421189;
        Wed, 11 Nov 2026 04:00:21 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm11113425f8f.12.2026.11.11.04.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:00:20 -0800 (PST)
Message-ID: <3eb642b4-a3cb-4b21-9dbd-aa6880593b57@gmail.com>
Date: Wed, 11 Nov 2026 14:00:19 +0200
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
Subject: Re: rtw89_8852bte (RTL8852BE-VT): recurring SER
 0x1000/0x4000/0x1001/0x1002 on fw 0.29.122.1/.2; question on
 rtw8852bt_fw-1.bin
To: Ping-Ke Shih <pkshih@realtek.com>, Chris Vitalos <cvitalos@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <CADp4rm+GmTjCoFXvT8WpiLNohnREqfR9z78PfH1m2rxs00jMUQ@mail.gmail.com>
 <703ebc52e1d544e590874df041b4d979@realtek.com>
 <ef843858-be07-49b3-9505-3ce08dbd28d2@gmail.com>
 <b8df608ab1e141388d663734fc631a02@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <b8df608ab1e141388d663734fc631a02@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 02:57, Ping-Ke Shih wrote:
> 
> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
>> Someone else ran into the same problem (I think) and captured four
>> crashes with your patch. dmesg output is attached. 
> 
> I'd like to confirm the problem you encountered was also connection
> becomes not usable? 

The user says there is no other problem, just the crashes.

I forgot to link the report earlier:

https://github.com/morrownr/rtw89/issues/98#issuecomment-6726071832
