Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430200;
	b=pDUMzr49cFDLJjPIHRutPbUX6s94PZPeb0s2IniAYOTsNv40ZrrRekUTiI6GkOR2y4iX
	 AxFmVTbL1DQZ7+VLh2I5+F2tLf4ldTjzX09dOirVknFLD5wn3YJJmQ0CyPUKYwEpwhYvz
	 ZMra7BoeOWMUU1K5VJsZuTdmKqQzfwk1CafDuDEPlD+KQcROlL8plOlA0awD3JQBN5hlP
	 WVX1DUP9GcFnPl+bKdrKJIQxEdhj7JWliKSC7az1xrK4av1cunMa/t1nGz6vsN384W2lp
	 dAl6cF1iD2faVT9Jercg/lv8VqcUb8f1jyTRnAXrY2czOQojIvHjbJ2QNtx3wMCixwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qw28T8t+ff+Z/zCKzYXhZUH5CcecZHlkPRnB3UPOsk4=;
	b=OQbX7FLS7XgIYreqQkOXDICpPKoBdJSAfcsKVjKnbT6MMgdCK1K9gXWVLd6xy3mwYH0i
	 29SWHyaG5XuyW2f53IRq7Vk6c+evN5/iYkosyNC6ORc9CaV72TxSuT+3mwHnkZR6BHBF+
	 RzFeRgGdXI3ZJa5hn0n6aNbZMAwrjZhbjIXzMPHEBlsWhcHteb0eqn5uTse/p9j50OQR8
	 mfzIhOwu7m+uSVbHqIcMc1AEcdL5t/DhEZIjvrBsvHDlrQ/A1E4yJN1cYMcHFTbD9wZAr
	 uBz5ogU64Phs3Q5qnOMbiQRha1vyZ+Jrl+s5N73rmRU6HxeqKtEWnjiJrmyG/1NQR/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFOgkA2e;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E2606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2E2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFOgkA2e
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso36243765e9.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430198; x=1796034998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw28T8t+ff+Z/zCKzYXhZUH5CcecZHlkPRnB3UPOsk4=;
        b=NFOgkA2eptIZOJ+8DenF3ly0vHBap1jZDIZWkYLFGnCbXH3Ke2pOtj/p4/dXGbMqoI
         S2Tj1eqcTL7y0+mCvPKH4F2ayg1hJVt19X69GaCXBpjHVpskLmzlVYeLfd/yxg6Mbg9u
         c+158iEQUtjlqifzhfD22EoFViGntvU94wTXjWyRi46Q4H4iTm/oPTcC+atW2Rbb+vBE
         Syvc4ey9ecjzOKe+aZsK721+KpSZ77UnL0MSOEq9oAp3LI5MOtUfDTvbSBqF+19cTlWD
         x4UF0TH7G6tfCN/aWFA8J1Pbtzi3iHf87gi/TUHN2Oi5ffmdWE4gbS4BqjKGbBmV+ap1
         ERlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430198; x=1796034998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qw28T8t+ff+Z/zCKzYXhZUH5CcecZHlkPRnB3UPOsk4=;
        b=1kjPDfugasqVnRZsGSflGUeodOrhb7mcCTWxaS0dJmt0N223mcILnr6NWGrlfhqpk1
         BPr/tBhliSHAqFg2rEyYf1u0BtpLY40Up1eqTEsguxWmJl8pFmma78OOYY/Bg2UYWiWm
         DQtVPbZ6PxEuemilyvhySVdYKf1OgTmqdP5F56cFWCnygBzC0F30fFrB1wyymXieq8yX
         ktpwRn/FI7yKLBchDQzQB7NusTMI6ndFjldHwPY9n+nkIs75u5Mc21mS/uwDSYSdg09t
         0NCLlMuo8lh23rc1zY91EIQxnavjm7sqZTMLcZ8pRGadUIndMcT76k6sUeNfJoEUWupK
         4zEQ==
X-Gm-Message-State: APuU4Z+N8V2IDXpwOJck/2ra5ndz+K3bF+HNycgVjPodVmC8BBqMOe65
	4h6wL0dwf5Z55QHkYrN90ctDFRSiLrDJDXuMJflEr/7Wj6lxvFSq1HNo7Ca56A==
X-Gm-Gg: AZFdTZfA/b+y2/MyZKl53heJo31pgzONnwvddepJUtwCRnvLdiepbFdoGebq2Or2o5K
	XBr5w7vmJZFTreZpphiZg8IHfKedUl3Bh/vvBH+C48yAnmaX1pyLYj1NoONt1mtb9z6byTPsIfz
	KXFoUs3eIzmsYRdfOssLGIBt+fxTkK1YyWJ7Mr+Zubg1Uj5N9gRY5wc3HBd+yXlqfFSxWn5Bo+j
	9SzIFeZ83sT7xWem/BLLQgfkEwfC0Ky9GaZM64WNo5kLNE0Zm6DnMJNfff9PJBiFZeqytw3ph9o
	WWIHrY6mj4ZxMwP5Vrr1KFT1185ShoxtyII2CUu55dFqHULiKjpvums3bFyZ0AhypblNDzwX8El
	2rLIm4Hcf7FWm3w0kwqSevMNQvYHkD0glycVHNNHtV8s03bIhicAFQUjze+Ps4VYzQXP16MXJ23
	lyJ6M/fle90ANIhmdyiB55yT7C0Cw74yvONwTAQ+69DldT39ijJckwC54Y7INkMGG6LWgz+fw1f
	/6wOfR0KsB3i5f5C0Jb5oigjKa1S8Em2+MdAcsf/2/i3dfTPOtSkJrbg41mssMgnHE0mwv/yu4R
	+fxJUY622oGc6I39omZYRV0E4ObzguQr0NQWlLzCDh2mpM0d64NMLQgpIjDsAJQf+QzfNpc/UjC
	LtkzZ3mMPKOl5CKi8ub6Mw+hpV3eHdMNYcoCLrPzeAkrbo62PcX4iDC2/nWOO1QJ6AqtttuP5NO
	deJrpITaKWoM8VKYOJNIaV9xC06i0MBA4HqNx8/JZuYEE7/HEXtuEvUw==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr238955325e9.14.1795430198205;
        Mon, 23 Nov 2026 02:36:38 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-20fd-ec9f-e3f8-60d4.ipv6.o2.cz. [2a00:1028:8388:a84e:20fd:ec9f:e3f8:60d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm290800605e9.9.2026.11.23.02.36.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 02:36:37 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH rtw-next] wifi: rtw89: debug: fix diag_mac crash
Date: Mon, 23 Nov 2026 11:36:36 +0100
Message-ID: <20261123103636.50732-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <1f89e4c0724449fcb77ab321c3115972@realtek.com>
References: <20261123001225.13076-1-pepe.schlehofer@gmail.com> <1f89e4c0724449fcb77ab321c3115972@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping-Ke Shih <pkshih@realtek.com> wrote:
> > -       char *p = buf, *end = buf + bufsz, *p_rewind;
> > +       char *p = buf, *end = buf + bufsz, *p_rewind = NULL;
>
> With fixes of prev_{seq, sheet}, is it still needed to set p_rewind = NULL?
> (Though it is harmless).

No, it is not needed. prev_seq is still 0 when the first rule that is
not ignored comes, so that rule always takes the branch that sets
p_rewind. Either its seq is 0, or it differs from prev_seq.

I will send v2 without it. It ran on the RTL8922AU with three diag_mac
reads and traffic after them.
