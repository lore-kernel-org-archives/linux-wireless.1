Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794565280;
	b=F6UQ0TTBePzWHGacngc1HWg9C3ECiM6UxvE2trI73QiUDDGUB5Uupj22ovvo3kKKk3MX
	 yjal6qouBuUq8SoIEI3KI+tqmPIWG5xM+tV5kk7EX6rAaH4kyTwRPWKwFbgoD4X6z1Dp4
	 vvcNMfG2Mep5MlI9Pp6tco6AGSNYEa8+kQcERDtZSoLEbXKA1SL4fJaheT3QweLgbn84p
	 YCJMqA4U9PsAH6CAYsPVnIx8Zb6n5tJEJCtSizGJiyWlZfyVCWTR1wBk5BApc8ChiKk8g
	 ET0gFasqIYv5I30BqeAHVU751ZFTC6ZXzIqr5XqEWXgkXcnSparIaI5bC6WoNattqxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
	b=ZbczmWmCmwi38uH/5FmBXfjAL8eVTkz7Iwpx/JhuOFOo3nUcLuUkpR1F+yQUV8PojG6t
	 XwL6fOSkbdEC2I/2KCX+P0kHbYtoK0WCxUkRXZL5rD6y+21VhMwZkR/KmkYTBcC+DgMqi
	 e/HhktbjwmURfIpdQYTyMBaLAx/+/XhyUXgcaxtMpUIpQR9fWKsVcYKW4cfA5+UgIvlQI
	 QCBTBANFy+9bmIYE5ee2d0kfMVgY/OtRrP359UvFc6EkZbH04Jy5epPZA2KTfxV0OltrX
	 Zv7hPbJ2zS/Qi4+u855/DlC/zus4JisjnZuyjFa4e4HMnPcmj0QuA+aFM42IwjtzoBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKCGmPkz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA72606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKCGmPkz
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adef977ad9so9206161fa.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794565278; cv=none;
        d=google.com; s=arc-20260327;
        b=TS/QRYdP4FTzs3GvX4c0P+YdQxuxVu+BfTe5m5oQkQ04F0VCVhjUtrE4sLSUZs/UQb
         CgusAJXApGhX/hvgaboaJ2kdhy2agt3oQPDv92SAm6f62r6XASfAcivx2VFqKQVhfPfu
         2pRdsRzTKt4L5lKJojxP3Pta5dB7Eqsg5kppJ66c/1NmXKQkXYqp2lhpR4MpGl5JZ3gr
         7K7/kgy6yw/cE7sYelNZGExKSocpiQFl0GxrB08EUn/t86+/imhucYY6IJJcBDD3BYyO
         o0SkjN0emJuxVuKk7u8btxgOr7VTUnJEyaZ/fRbQqqTHTIaHoUzW4i04IuetBMxtvGhF
         e2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        fh=qhSrQu1eTuWm1viNtRGg3vhosgY8l5GnwQOyAO3SnKY=;
        b=m/aMfJm/u7gs1h7+ImaT0Zescg4hmbJXf98+ioQAJJ84qBK3rb1ZZ58ZaiMCrmEoIE
         TFyOMBhTdt6W0zN6CUU74GtdRyKY0WS3dY3eMN9l2OIlf/Tn+z/thwf9sKk6AF8fOKyh
         qt9qnK1IgiIqvwvEuSufUCgcD2rHQ0mjq5UV8bAs4Uho1rUC6LXjviyi3uHf48S4Fs7c
         WNz52WOa1d3rsO+CePnougsXZBW34ZQrrY3m3GfeEUpHpGkwr+T/ActrrD3+a0nazVlf
         T3yVC94GGkKq8ks8jg/u+TFxdPQo3F3dbSJy1kMrPH2Ze63mWppI/X92Ap13OvfcSfJN
         ZG7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794565278; x=1795170078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=nKCGmPkzXvpE5XLYZbeDQsqnaIXMtEzwB+g01DeN7DZ2eZ6h2fTNIQlbV1skYKGQzj
         81bgrIZsWN6wXSAgisNVJit4fwNCel8QF4ft0i0MO+WKirBD6WxLEqO78MOwkP2PRnZq
         y8u4Vtao7xsYREOSBdvhftnkHM88u04mODuI+zR3dXc2Ql0zuxio4KJ435roZ8KgecpL
         v6VdsY9I3o1qsczES1TVsacvTIPRO9m1SwPQi3z+iWEVoQ5Y68g0+mQ+atLU8S9uOf5e
         1Qf3qYmkw4i/SopbeyMn5FrHyL2j+ajbFofs9phTgLCV2PGO8C50ouUosc15hODp9N/Y
         qaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565278; x=1795170078;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=aV9tNjzKjI40T+NdIUZU6CfFfLLsskvf3dKbOmcLEacYDkz75J/z7ueY7rKPxpS9aX
         uMob6UtasmpDTfV/R9ts2kXDGCF1XCsXfjLyfkTXaKWqBDVOxEOeIZR1sxEIEixhVJiJ
         dyEm9BsM9mnKeR/Xc7KvcDfLOYbyyGxArv0McEIccgBdNsYJYa9veL0o0AVBOAP2uSO1
         vgo1joWC6pQfnRx51Yr1t+ExcOD2eIWVaRJZFxPPEyA179W0JOoGvM1JKcwKE6W0PcLt
         4J+EJUHCWntw47a0oKk0IJ/uCu/civGimywB2vEIXN9vJBrYKQJR1yoqsImZl0y7M35R
         NaKw==
X-Forwarded-Encrypted: i=1; AL+hErHgym0n4TMQmahbYnYNq47GPCldYzLCQ12p9/n1MZTvST0NHzO9mkarO50BSK/3ZYlhgdzWgf0W4shyZ82NBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nx4gM32VzOEh54bOd1kDQnXgdqh5xOjAohS7zkiog6Zpz0lVp
	5Ku54bUb3qLIbmNWmeBZ8JbM09IleaUKM2tey8Kyo1l/EynVjHc8QiqgpaLPANFgpaIhF/skhJB
	wkUAnzts13uzBuDepK5ILsSNlJ4T+s+Q=
X-Gm-Gg: AYBFou2fatAMmBwj0sTwkvGG8z1GZYTns7QfZFbBR0zNIRALHIqIxDhbPPLUtsCGJiN
	3tYavfLEIV7/bNwtgUOKJFyg9g/nzkyKm/evXLOpRSJmVJ3Sn6NrbkCkcqYcHkzr9za5lnKaskZ
	zRQzm1JECZfoahw/wchOe3TnVSG5Ykz8WHDOqjyOa67CzsEiaPFeViHsN6/Ss2I9r3riR4oEwB1
	/n1KAAygcIwhCN4sgYOVQUVHzyVt04u9Hup+rTKyTni32D1jYXuLgPyYac3XNWtT3vMbkOtpVEP
	XMNR5xZxc5XgDXlxeOdBU4q/J6aDwpf0hu79o1vuwzT/mrKZbCRNKuJC0wky1e9uus/XImkQ9Sg
	pgBitqO9HCSyZtlvXbNWtOxxX1Ps0kAJiG+eWvIVGkbMoTZOZ/Da6DELBCQMVfCu/Vu7v
X-Received: by 2002:a05:651c:b26:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ae2b52ecbemr7965161fa.24.1794565278183; Fri, 13 Nov 2026
 02:21:18 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ruben Pedrosa <rubenpedrosa993@gmail.com>
Date: Fri, 13 Nov 2026 10:21:06 +0000
X-Gm-Features: AclHuK_25jkOvz0nSARx5Boy1NO9Hrp_-HSBPcW6fvmunFBU0BNcj_ZBBVnqIUg
Message-ID: <CAJx0sk_pH2iHGYjGjSwg_ODJCPjjh=ogEdun-u6kh8V6KxcDKw@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: use smaller DP rings on low-memory syste
To: eduard.hart@etik.com, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on a second TP-Link RE700X (EU v1.0, IPQ5018 + QCN6122,
256 MiB RAM), OpenWrt main 30a23ae45160 with this patch applied.
Running as a wired AP with clients on both 2.4 GHz and 5 GHz; both
radios stay up, no OOM, and settings persist across reboot.

Tested-by: Ruben Pedrosa <rubenpedrosa993@gmail.com>
