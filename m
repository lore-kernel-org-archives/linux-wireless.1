Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878344;
	b=YhF6xw9x6ZN1YYQy14DLZ4D4AEYREkcmvmrIeZb/GSGA/Al+Vq5GqTen+FAez9Ll5PUy
	 cpEpdICQu/hbmHzZukCNOw5FSOmxZY0EryNOClYgsoyd79T3bLoQc1nZaBxJ6q6nHvZK7
	 +Xvxztrtdu+b41qfNXy7nKvDrs2DrPdbW7AzrEmCMGDvhiTasyBv4otxICpxnFu5emgwe
	 I+w2tFCtc1KDZR9U5G7ELk469TRdEad0pIxevIwEMLgyfL0psMPpStdj+v7dkmEkoDX60
	 0shpCKSMc3ahd53wqA+gOtNCHXuzfgOw8902E16QlST4hyZTzUTC7D2Q2JO8LVIAbdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
	b=O5pE0vruV5lLIIHTK6PtDQhjF/DCi2eAGPI2OKm+LsfDq6ZOSJvdvcpoxgyHx/bJXCgN
	 XdSDk3/5AjLtSCAf3AqmqAHqjgEzEGmyVOCHX9Dw4g2UoVhsmFsMSn8+1tld/2WNDX7JQ
	 WKOLmtPmUzJWmh3oUtYbr7CAOD/1JUDO6zOUsNxfFGxLPcRgRZSlpi8nvmfq40ej+aNzm
	 70iPYqT5lylNb57ECmwJm1HS0xHE4StCWcv/BGjMXX5i9veICZ6J6GRvRuGuOikB03+qE
	 Oa+es4I/SCHMDLbYY6Rf3ubivXKMQJdKUMdWwSz7ziE41oBgzrKnsIFFJlTj/mtUcAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A6606A329
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 01:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae3a5d440aso24273191fa.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 17:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794878342; cv=none;
        d=google.com; s=arc-20260327;
        b=qMcbIHI1/ECZ2G76bKKyEemEPFH7PESEQkNwmlTSmi9d7oKoN+PzG/ZAEhxeYvjWkf
         MXKeelXaao0gOne6eCh7OBekZjje8sSnjgFQ8VHYIuVsFSlueCSMGrtdOky6YJsQmT1G
         pp+aW6bRGqi+1IjLWSysp8cf0Yy5/uQK9lYMBQs38juHuOkLaY9QkT4k8IIxh3xj2/NB
         7mj1Q9t2vP3l7mUTgv0Zd7CiCz4D4adyu1fGNSyp7+EJiHn13d/8z+rBjXpSOll1jSJE
         BS3sohUN2m37eGVZttaEoc0SoIbHwJaqDGXuRsvYzQjZPV2ncEx7AaEvsSTS6c1Yy1oP
         YsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        fh=AjnQa0G0DRNBC7twqqAQacyeLH9A6saLJvSQUBpTJQY=;
        b=KqZGZKQ+/wg4C4m38oZiSDN6ytuvNGtWxAu538TXFb13kRkGGasLYc0tSh4I861541
         ty5DkaUWgJAepemVtGhAd+OThfiuzBbKPc5GzWvC1niaFJH84Yy0G8fu6Gf2DYP/y3F+
         lLoMg9GEX6rFI4CDgAg3hL5FtppLYcMXZj8Q/5/KsaV//mXWbyYdPM6VhAXEprdatpdF
         GLK7WeKV3/e+7bsubdWBjd0f8gTHt6cpHltzreXWcJSR1FRSOStAAJrCdZk05W886dlu
         AHLoCnFJXR0v1CmalkYhcpdNGrVz1BhBcPUHGlj02Zrd8s9Z5gbsBO3S9D4wxLbH/axG
         nA9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878342; x=1795483142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=x1sKZPNTBgI+oXYSIw4eVifpFiIzZkJlL4rlZLx3kOxRYR2UD5N33hRjLk3va6Vsrj
         M9A5MgvOKKavPDk9a3EXOmoKe/tmJ0kovYBdQCX9+eLE7X90MKvW1AMtuIb7sF+5akJd
         JJtuZGABTZhSN5r20zZx2JzH5t/DK8GNah2osDJvVVL8U+jE/pLKRX3DPNnA0qupZ+O1
         WPbReXb48AVxZRtZw2ExHTtIg2++XNad8/9TM6zOlytRNwQMEKZEO1lzJPotKKehBdV3
         JTkVviZDn6hP39W6ZoVO2lcMAU+nNuJvYeVX0uAe9Wo760P6h0fjCoY9xcbjJX71Eetr
         wBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878342; x=1795483142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=ik6lV1IykWNWI+IFf2zOL+PQpK9YV+vuPI9X/OLNUgRC391RHAqAKffXwAiOH+DIEJ
         9oMQqvnoUfKkSXDLLJY7eOM+gw+NS3sOMqHevL8LLWOFdlac2TEvL21dP9svYsvV9sx3
         lxh5bqMTYuAJVmywF4AQmoxlt++iHBDej4hmwZHeh45xiENghZeM46E7nSYfmdmVAI8B
         vxK6EfC6+TzU3784Cqa60yT9SQzi7ptLqyzROWh2zG6NhxiaHnzvqCVpk/hIuGLEyulG
         SlPgiVJzW/XeHLLmY0Fjng73oAUyI8jGwHXuzp/i0pITfvXfPJ95ZRBR0L8uKBRB52Jj
         W+nw==
X-Forwarded-Encrypted: i=1; AL+hErG3DbuhY1+wR9Ch1BBJCacqbLL0s+PzIO8Sera7kVP2nSaWWJqTjlDOHpuqi/UHoD8Gx1WwFL37cjPDn8Q+Xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bXjwrfqhhx/BUHppLIZIOJoUahR7QESk8ph2S2NE1AydrEuB2
	b2OlBXiXSNnTDX+DYLynVflrD0KR/wCTQNy/hD8zXaEkFHTSDGQrF6S/xmCuPgRMz5ibYQl/6XI
	wocxUJ3pAZoIaUD3YGE1aWKWAAfzKYdE=
X-Gm-Gg: AYBFou1GuA5RrHV3Jj8AOi1CSf5DuMPt1LT4feQOe0iEAY55YsPEOdatvJbgpWisVR2
	cZUO2/iff25ZUaBMmocJ3wwKAhse2ovuj8OCEsK6N+lHaduWK1onCOQN9svD/icmQt5Dvqr1MGL
	Yza1NQwvoH4GxjXP2xxo/L7wwdH+BnHphuSE1PWs7xU5t04FWWIy/8is1VKxf1WTkVEipw4G23U
	9AcHwzv2aCZHKXc1ignvFAKpwjVwRBMb/uCaTBogM8IHrjca1tdy/bEIeZx2pAIrhnWgE2ounkF
	FFFy6ldGEsmZ/XOuo++CbijlTPZyc+4B7wGCHWI3TPaqy47czCA3Nn0LIzQ9WswcxdrL+Mu59w4
	wyJxAJ+KT80fPX1IuQ30wZwoelbPuXY8F0ltWKbjhNzZnAqJ+yJJHbLa9TbYvh9mwCny2387Svr
	MuI/T6zOgdBqdMGd2L3Jw9VSe9SQ==
X-Received: by 2002:a05:651c:41cf:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ae2b4f0263mr32473621fa.15.1794878341861; Mon, 16 Nov 2026
 17:19:01 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260311194531.70441-1-festevam@gmail.com> <177344689795.3706356.13043407533958417879.robh@kernel.org>
In-Reply-To: <177344689795.3706356.13043407533958417879.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 22:18:48 -0300
X-Gm-Features: AclHuK85a0wTDwYZkXytyVwys37e_78s3w7QVgGrJmJ9qPzFcQX4mkAQjyHnXmo
Message-ID: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length constraints
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: briannorris@chromium.org, conor+dt@kernel.org, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org, 
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Mar 13, 2026 at 9:08=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerr=
y
> > platform. The commit message explicitly notes that "the length can vary
> > between hw versions", as documented in the original text binding.
> >
> > The current YAML schema enforces fixed maximum lengths for calibration
> > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.d=
ts.
> >
> > Relax the constraints for the two properties that have
> > variable-length data in this platform by adding minItems based on the
> > actual data used in the downstream kernel:
> >
> > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dt=
s)
> > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > rk3288-veyron-jerry.dts)
> >
> > The original maxItems values are preserved as upper bounds to maintain
> > validation for other platforms while accommodating this specific
> > hardware variant.
> >
> > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.t=
xt to yaml format")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you pick this one, please?
