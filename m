Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131621;
	b=5V6EZoPhg0/JW3O+4UtSr4/zpOf2dWJpYH/qX9DNkx6Qes64HzAp0mSWACf8IZCrAMuf
	 XkRpB1bltAtEuEGDo28iaIg0Jhdh4YJ7BIJNBFRpSP2Mk7Rjj7qXm8iS8N7uJoLIp3lzE
	 Yih0LRqrWSEjQ+AFF/onXx2NTXCEtHXuj5HzIvGeyiEi8vUtDZdTp2VVQRG0/t+I4M9xB
	 /exwPs9B1Uz9vu/bVCWvBANm+R/JOqL5GCP1t9bw/t9DjoH4eQTaEc1vADG27gZrgVlmX
	 aJMMGCHKflEwPlPoW+8DhNGjKi3LRBdynbExremA8rHbWbH0jzUT666ZjOjqxc1DsVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
	b=YbPBIijsjHxms2YAbzlUIhA7f/l/MLOBUgN8d056PW4/tTstkZfjzUruMldUu3Cq2sED
	 1S+IA8trDpFthnM21m78FKXleC3t4NFyKnRdcSeG6zOWmX2K4qrgpRpHKopoqxZSY/Wu/
	 maX/Wuuc3kOOWMJpa4fe2JcZ9m9+gpJwLUB/sgYpWGBPtetNx8BjC7lU1xxkp7HZ9EKBA
	 FE0CLuKH9GN166645xCeS9Oty/9spXrkh5o/oxSuunO1zHiUuvwXiZM5+op+ujkecSWX0
	 HNzGPYP5LKGpqyfrNol2rH0CBl1GHk2RPNpZXziKFWIGv7ObX8YvEn35K0yh3Uln1yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LrSy9a3N;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B89606A326
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 23:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B89606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LrSy9a3N
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944a0eso304529c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795131620; x=1795736420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
        b=LrSy9a3NaoomosxPTFIlpShr2EwluSs1obYlE120idTnP+lnvSdwC8hexjIT8zAK2d
         YzbeCiQVTKtQJTU0YRo23uvVK9s+t32NI3p2WWeiXo7YQS1PFtcOEQStd5POd4VQgWxl
         GXJYC+zXkswSNKvnPbppox6jDLAxG0LylOvscMy56M+53p8wB/iJUbIdk/7DMZruHClS
         uPG/XVVI9tnm5IFEJ7ywZHnFgBKWC9L6Mpx4FVOlBgZqu4aaHWmuco99LKXTs+XgL64o
         e8tBUd40+X75xBjPToTDLuGj4UpDzbn4Xb3I5tPtPAjv0nDurLLjJ9G3CneS5pM4DoJl
         TklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131620; x=1795736420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
        b=TmYS3+5vJOCWzDz0eJUbVGs0hSncZvFPA+1CiZBX5UlJiEX2KMjkBs9p54Sre6m+AV
         UHtod61Nsg5CAJkIUSwgjEK00B57/NKqB4soetuM+ie4NR1waoxJ7hjsgDob9sIC0p0h
         fMbAJtNcioPIfrslv71yANWXfvNhHdeoD9ds2DkRH5CYv/g/+Qf2w6euKuMUMZ5EEPhU
         eovLJnqgY9/PdArssreksVhId6+nGH7+HL4YtcNd2HHCSU0ZlnK4cNpn3tE1eOkHpVPQ
         1FmjEH+029rrys27c8BOgSDKSFfSqINXuNcuSA58lqdLYUq7BFbiqJFfdFsVpCZK+xH5
         4r4w==
X-Forwarded-Encrypted: i=1; AL+hErGoauvA8NRl1FNx7/eiSLHGIuTn/PYFqJ8c+28uodmwcV7b3LRllevIMsWGHe//eD2uIVZOeC8fjWB45SQG9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gysl4s2GwCW5Mh1oQSoCh0r1VtTg/7bGO/OuDdrcg/hjYbJdZ
	kjBesdkKMv51D85UD7v4lA7S5MYGjrW3yN0d49AhNKT78ESfoS0tzWYX7lpU2/WBl44=
X-Gm-Gg: AYBFou2QT3TBPZKLdqPVhkXjdkFZ1k13AOghcGA8wqb2VLzApjCW4C7SGYRee+st4QZ
	rtc8TH3ZXL01UjfRqmHghhYCjmOpj5hARtFmNmZfXlr5R0CC2OHefQgQJJreWBJ4GfxkAn085QP
	E7in5B9Fmohyu8hTky+FEA+cl6kr8qZ2FQa5g4swvp5FlsulXbkRM6k3uMgHQRkRI8Oem277nV5
	63BVvJdUh2kD43zwa6YNnJJfoZXsrtzovGG/noPCvK5PiN4GPIYBj3ZmxqKFnq+BTGfJBZQwB3u
	UuxkdacDG9olgB80Dy5jDFjsuGh8m7tghZm+TIj3hHsvTCAg600qY5KvIIfEC+NQR99+H9PnPMF
	aP1U2TQlhCIXKrqpeYx+KoF1SUokyIvUKo3fKrJ9fq+B0sqnwOvA2EqQGA/A7Lf9TxluwgLghrD
	2yVDbeOSC8IQjc3tdz0u4xhpvUTClV1gQzk3HTc0BuXo7/EEOIhziYDeHQbmFA2s3Rr+ws3oEus
	6DFNsTSVx/YRuFzmVwCtGN3ZgiMk7aZ4Vxudmqbs9JgZcxikg6ZYlh2/D8GHWPF5R7cAKMOylrN
	d2Zx1UvgmebRzQzkRm4JDiyPD4VVNqxquFKaqP/Ck8LhO1svsoGfJM4wnoR8KvQ2UUNnTI91SMg
	clY2dWd0oiYKKUGtDeZwaqLd16A==
X-Received: by 2002:a05:701b:240b:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5568b38b3mr1021228c88.14.1795131619590;
        Thu, 19 Nov 2026 15:40:19 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm1828018eec.16.2026.11.19.15.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:40:19 -0800 (PST)
Date: Fri, 20 Nov 2026 10:40:15 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, 13057616121@163.com
Subject: Re: [PATCH 1/2] wifi: mm81x: clamp command-response copy to the
 received skb length
Message-ID: <pqir2s7da6p4rjj2bqdrjbgdfgrpgyowhpxwj3qnv72fjl2gof@ooe2zsoehufj>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>

> Cc: stable@vger.kernel.org

Really ? Is this _that_ critical?

pw-bot: cr
