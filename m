Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522541;
	b=mz+UzMUwwqix9w/SRK+HykNDCpSr0g71gVeKJyPIKzU+GLO7WzG6uY1G0jl8/U/sIn3Y
	 HLy/7CT5lIXVniQqhb6Gg84dgiXOJmSNustOW0go5knG7BCmEqwiNYjNMWTw3132LQeK8
	 PWFDLG0ihFO1do+/gdvdDwzndXSKLTS2L9YADpXFn8Dv+vH3Isu/wPYleHA9F1Lh5x6Ug
	 h190ymSIlUPVDbAYacmL0qxwQfifKtJ3FBZ0g9Aaf8TaW5+sl1PxTlFUd0NAs/RNanRYM
	 b8vYYun2dud8bRaVvvwnZxa3AD8T+93d+zWJoUdAHSfQE3sKuE/KGhlOsXCIs4otpUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
	b=PeCDw5rpSEO3owzBhQqMdJrpDk+w28x2ZOmQE0ruV2ux6jBZH/jTABrd3k+pY3ny2fZw
	 QCgWC9HZYgMyNRolwD2nDE88vWbeFTQr4ZPW59DNx2sKRFaBlL1cIuZPEEvyFw/KkhzXm
	 pSKWE0D+Yh1vepgmyJ16FuhaOV9QCOBJ3tPOehqqZtHAUkuWWY3XI/MJ7NiyJgfLDUdpz
	 xqhLv9Eju4BVHAqzA7ywHdeZXrGrLfJ1d5tgTNP3XGoeCN2ABh+aOll8ar0yHhx0nw0Av
	 twaXEK8isdzy8mpIS6tNbTzyqlypNOZ58AZM4/JE1VWmNy52omywrjPSQQp2mn+WVNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV9hfC1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC2606A322
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV9hfC1A
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4bd734cf350so2310989fac.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 04:15:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522540; cv=none;
        d=google.com; s=arc-20260327;
        b=Lpb+eH2IwPm0ThehYHaAqWkQK0fE+unXfu8aDoyvqpQPlVC4Lwr1B0g0pXMaVp6r6u
         WfCWDCoDoiVF0/a0AbXF3hSAGHcMcRq5ivnyG/xLp3IAYqMBw39rabtMXO2kDBJCH7zw
         6c2Tf7oCYFkpzue+adv7Pd5A4hg7lfhwfUVzVim944q+W52fap6aitMecvIIJTesiyNe
         D8nj0nZJd020QzNzekpXz6pP95lLSXmY19WXfGZCPLHyBPfUOz46xe5OLjxjyzSQOXxf
         HLiqEbNG59BL6lZseGtx/Fa2hJ3k/SSmoO5kt7pOJsRFCwa8FNxULeMListIJ7xH2ciQ
         hnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=TkvDQij78VlktLy/69Oz2FvhDB0iubs2ANia64/tyS5u7AJQTmpzyxJUnW+KV7p51B
         yWrtFJHtIRLP7NSD2HtUEgSSe2DgA0z6s9b3U9CHM1y3VGIHiw6b8EuuUgFY+PAylruP
         AHeinHCSQAX11CF82UtDw0glYFAzsFON4fOVeNGcCqU48QGQfOqWl0yBaxYfPKa6qRr+
         T6CmDjXR/ngt+8jzr7/OWmbhwrvTuFNEBhlxtUChsxZUT1eE1qkFxGrghnDA8cU90GQ/
         UvWAw32VgbFtRd8OK4mecr+41e/NmYDWfgnoOcS6t6csWMeyhriulix6ANwwMVZfVH7j
         Q9SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795522540; x=1796127340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        b=GV9hfC1ATehJeDyuy1y/EFzduija5SmT4Uqp96QhyNOyhPHgaGQx1VSVxNVSVLN6DY
         yrK878YgC5QWDRKZBIEyLETPrWmBxYFlwaIpHbZUmO8f42fqN2lMqmpzMp7ezbvgqEty
         sAxgEgcUqTMeJ6MgY+zvk9KyhN3HlBdakJjHarafmJSO6uYnqt/GnXWKft1nhXKI5auL
         jUnuwQlbp4dJu99/q4hUyECs8X28+2heHkXW/wSb8VBqDGdoCa7I0iV6iHL9PoWDDUJt
         arZqZnLvNzl1/lSFuWpQSWDpPC+HbYyQISeckNzQJmnD13Mee3nvRXuBnWGl/Xqzv+qE
         7NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522540; x=1796127340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4KRBu8O1MrYd6R3hgRbpX15IJA5uu4rOWX5aVGMfOg=;
        b=e+yhxAEVGyl+Z90zFDB2RY/QKlPE0DrwWaBU81RGZ6oGSdha7axfba9C+7WIwgEoPa
         Es3eXayFwkFd+o+I1uTDS20Lh/WNZN+SBPXRiuXc+/G6GDv9XvqMCLpdcp6VBBQViDNP
         UNVG2JPH5IHEQPDcrRoEYLyduI9qZAjeYfOnuo7DcKJF5uWloYD1lREIjd0dLwUQhzGS
         6XaTxMyX5mnuBGXwp3pdn5qSMm+uTDr2nS+g7kJ1bSMbYUC/0EJEHP6tfLMi6rwrPim3
         bnE8miLiSO8gBDBHxPrNwnIu7cETELU+8+TYGfzDmJD2343oOT4hgbni2loiDEA95/OV
         /ZZw==
X-Gm-Message-State: APuU4Z94+PdBjSyRv9q6jews4GoIlc13mGWXptRHf5SXls3bCTbWbpOr
	6B2xt5pkvWtpsnukIN/EJ9R8jMc8KQApStrzNfTetEDUhhjycarKloPJ4ICTS2Tg5fezqMb5WnP
	2BAGhnIlxavOvwJim/GjYUMyTs8s9jR4=
X-Gm-Gg: AZFdTZc24fNOUjOphp+BqNAFGWo7w4mpSneDbyE0kZcSP/rfLfLkZWM4ShZWafU3PVq
	VNrx3BJ7Z7wvb2dF5w7S7Shy+srk+JTQ8r89F8hFJx3kttGh6xFGlWLLRcWSzDU7HVd3x1I0yoT
	lqQu8uARZSYu5WRDQ9r2KlztWogf2mmZX2MjirSm/WqB3tKUf+AOpzYLx5QtVsfpZMNHJi4DEY+
	L5mKFCZ5xMxdF+5UHlWmu+uG9FMoK7oTpa5YkICHFBV89E0/fbPOtg53XYcs0pqlcTAv3NybaI3
	sGDueKEuCUdbUhx51Q+zeIw4IZ6CZOyxeARlGeQ6YpMfqswTThqltxdib+2WtNjvu86/p+5i6FV
	YjuNEdboRJMzaPFuZzNf01ZPjadZM3xHDC8plw2i/HngZlwT7yfkpdTziONOVJI1fnlOG4cLnbq
	9RZB45iZ3LuQE7W6BqwzoujpVQ7UCDmUc=
X-Received: by 2002:a05:6870:1685:b0:4ad:5651:c0b4 with SMTP id
 586e51a60fabf-4bc84f1b6bemr12609810fac.48.1795522540016; Tue, 24 Nov 2026
 04:15:40 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120113116.153232-1-hjf3108@gmail.com> <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com> <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
 <ecad59dfc02941058452cad1889523ce@realtek.com>
In-Reply-To: <ecad59dfc02941058452cad1889523ce@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 24 Nov 2026 20:15:03 +0800
X-Gm-Features: Aa3M54rumIugBHapPMkYtKNTcW3pXPGQaBW-5e4HlxHknoEWfQ-UL4AU1PcySf8
Message-ID: <CABOQOSVEG0+WvX04swuVAbUFG=Ga0HTcBJjzpaXB_eKZRwE35g@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 08:59, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Jie Feng <hjf3108@gmail.com> wrote:
> > On Sun, 22 Nov 2026 at 11:28, Ping-Ke Shih <pkshih@realtek.com> wrote:
> > >
> > >
> > > Ho Jie Feng <hjf3108@gmail.com> wrote:
> > > > rtl_tx_status() starts a TX BA session for any QoS null data frames,
> > > > so these polls start a session even though they do not carry data.
> > > > That costs an ADDBA exchange.
> > >
> > > Will ieee80211_is_data_qos() be more suitable?
> >
> > ieee80211_is_data_qos() only tests the QoS bit (0x80), which is also set
> > for QoS null (0xC0), so the BA session would still be started.
>
> How about ieee80211_is_data_qos() && ieee80211_is_data_present() ?

ieee80211_is_data_qos() is already checked in rtl_tx_status():
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/wireless/realtek/rtlwifi/rc.c#L234

> >
> > > >
> > > > Check ieee80211_is_data_present() instead, so only frames that carry
> > > > data start a BA session.
> > >
> > >
