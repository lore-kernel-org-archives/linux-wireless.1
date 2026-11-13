Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557830;
	b=fvSC1OnJNP0wT83HqeJ3zWTPqRQ/3+GXK39zYNQaap860fTR+MbwNWQaeG3oc4UxHcDQ
	 y+s2x8xXNws7nnTbhcd8h9oTxC8pQ4nLxy53KQMLGSRYU5LT5zSZl5lgY0oN/ni0HuV6I
	 mAgxQtiOGmfKzAmlhaFayzeB55DAmDayS/urjPsPN+BFtuY52Mv+ALeKoO7ff4D2cNQoZ
	 f59RSi3SwRLsZDI4i+Jyx0Jm3EcqI+QWEXL4MODHTgKw3TQ6iBR6EAZAp/ZpFKF5+js8c
	 iIETEZhU6bdIBh16WiTOz8mQdKzP7ZIrw3nlQhdGY999SmkOVQ39b5AGnZx2P0JQpsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
	b=lINesLtTImZ4eFLyHAdql/AsQLnhKI7Dp78uLNHe8BNJkNDtM/Vd9WihjIN2q6tlJn+e
	 suOrI36PodoLfz5AS1u6c6ZPej9KLq3L8+nH4H2PWSkYkzkFTYL/jPr7cMwpjG8do9nmf
	 463HoEPrDrQy/t8Q14QlMU83mMeTG/w1zfYFsJ37/sIMyJrYmY3tw6P9jYb99YvaElGJh
	 F0DpfWOeKaYE8pCh1zMKg4Wlo9fimDwDnYedCyUt/WAUigPCBEuTKfhWoisoqOiByaAbe
	 9v9nzrubfLMams1OlyN3AR/mL+cX5ssqrgG1fj72gLb7A5Txc/Mm5DcSTod93g8v5Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZviSqqXp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB2606A32E
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CB2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZviSqqXp
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dde81a6820so840551eaf.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557829; cv=none;
        d=google.com; s=arc-20260327;
        b=DqPT1hi3cOfn3wxXcuULw+2KAAc7ZLTMtGRIZPenlo81KCnU6PicMKr38jhh8y1Z1V
         s/3kQ74cx56q1m0s/6WOKiivoMg2aNSrgeoq6FCbFjq3/sgBAN+v07OX3YkatVr3HIvn
         /0sn2zrTYSo9P1bw6qE4Dqa179YVi2BEd9BYq7DPjZ/xUqG8m2w2molBukXVx1fy4QgE
         TUdd1LZhoAs7ljxPOV0XVnscm2WR1oM78Z/msqOYBRckYDUwRevltJFAjyiruIpvNHiD
         sCYh677ua4OnYvXDO3DNN5BHJnpi2gy8mPlXY1ai/a2aff3UONwqAWDRmHQMbEVWNpc6
         i07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        fh=sYFMpcnQxqs/o6IOJjkdRqWWaJi4Portnkw2Y8bt5cM=;
        b=m+7fEVctxcw/dQLEsTLOJHr7CfeTbDj+xfPSWo1uZIUpfGselPOtFSVx5Zq/HsZtku
         AxQnKqjGxfBnkQNTy6EYOwdv+W3lrcBw2ygRl5XMxSAnk7dZSBItB/XIf5EqAJAdHJSV
         wPbYIn+7o6aRxuAHStgUWXD/WFXh3pkzBnjcbxmKHjkbnvDepD5rxiAKn2aK78mr2LvY
         jEVedu6UP02INzjVrkiL+qGDx8laY0LnsQH8JdC1OthfDHymtMse9/w18CklTuZDXqmC
         0ee6IXZHkPYnAi0x/MB09pLq5SfMP2U1AM9T+j+Z8PB1N42I2RARQz1pS7dtSMHLpcvy
         DsHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557829; x=1795162629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        b=ZviSqqXprtJkTwGcqDLbuEP9A7MkKflFXZVq5ryC7K+MsY2qTlYfz2wczPzfmIevmg
         Q6XxmuV9tFi30cN5q4ysSrTz4kc+oX100N0fqiyn4aoJ4rHGuI3j0+bNiv8nbC1hwNKe
         IyB6Qm3XuXNwSqlXxf3oeReTKv9fLg+Ng0PfAqdLRdVuC2bjwTyW1JxvPSKrCaIwRMg0
         xME+mjA7TdJPThdD+UAF4ikrVSr8+90GPNHYlKKN12k8ohALdVT67yXYrh/8W6Nx6E/h
         mOMB7eNLk2cpjbOhenSAnYDGvny+rNyOmRy3HMeCCKUMPk4Fo9+0rM0OdnFtCXVVOKqA
         5yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557829; x=1795162629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aa20yMC+qrPNN01+rXYcJyf/XAQhNrt1bJTIMLzFkc0=;
        b=bpukfHtaprf6P2nzIlQOteYbXt4xoAqbIjXkdUrnnVCzo7UsFTBDTcTiYn4Uh9InJ/
         /zewIVQazXdMPNGDCcWtJzUJ0YWr8h2Z+9h2SM5oca2/XgqJz1+LE/7xFAkIxmOtUroL
         b4zZmzIT8gdOk0cdlCtm3qN5OAdVgY8tyXrOPMmn/gYuWT6CWy64MDxQ/q1YYfz0h4nf
         +h6dT92Eh/b1yOSTSXwCqI3ziB5teRWPwartBplJW7HrHzmiX7K/T8fzWnb1csSKPG2j
         GORAce8JrZYn757uPTZBwShgWFWKvei8zza4/9wv3wL2ZsnUzxbm5iVB1+qPY0Y93SE2
         bpjQ==
X-Forwarded-Encrypted: i=1; AL+hErHJgf9dHiJb4WHJnnU0GG3WRyuytmCU3RlOi7U8jZvN6BT4mCsKMtd5gX90GsLC+xSmSSEr6uU1aPT4eGraAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cLxnFLp1UoQchXqxwWYIwMjEJJUVBrgDR6Vy9V0ftzM4lbtkR
	j5MG6uNoc0j233W6NEkh1nvxoT0pYbWaSWh3H74u7u26JQU3HhE6K5Z9lg5FFBe1kAFFL9F3Dto
	EQyj8hejKkSmn4gQNQkWIlJcET3imQL4=
X-Gm-Gg: AYBFou1CaD/jyffZr9TF4ijoJLopKLYU32/odEgrDX3QVrXbMQlsPplx/r8MRr4ZSWy
	+16/xE/z2lJzsEcKPBsnV9yMW6FdAD5XSt4gdFT2TsUnyS9yEeltqui6yiWgotUu8W90P/xyS5+
	4QYxN+BmncIFaus8Qkm5jq8tg9cF+JI0t3hXMm8zlmS0OrNmYFgexvsFRdePN4l3GqsVyJlzdt1
	L7dKT1jNW2U+HbMiQ7bsG/X3cKHqI6eRc7tBFgaLH6OId+mtxhP0kUacr+bzm3RQKehXouXT45j
	NOlau2Dis3iyWUBVDe9aXRVGtykdj2TgsmzySN8B/QhAZahBMztFWRRVGnxlVuXaoJv0qUzmuuk
	fcMq/GV7RKOozn0257FffhHZaFKU7OaUs7wRPZUdPAsp9/LJTQkEtNGSFtKsXnU7RkHw91Dyxhm
	m78gSu36tz1WEBn+Dhu9DUa3UuMMGXimb+tyrH1Hzxr3ervN4kwXk4
X-Received: by 2002:a05:6820:a088:b0:716:cd2c:e47b with SMTP id
 006d021491bc7-71ab5158f87mr921510eaf.87.1794557828952; Fri, 13 Nov 2026
 00:17:08 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com>
 <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
In-Reply-To: <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:16:33 +0800
X-Gm-Features: AclHuK_1culTos-u-oxy_J93zKZtmhjiPq-ZDs1VYWKqmzaPC9GedZ23IH9qJrs
Message-ID: <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 5/5] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:10, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the patch. One small question below.
>
> On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > index c8008cf43d..c8f5cdf31c 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>
> [ ... ]
>
> > +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> > +{
> > +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
> > +
> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
> > +                 ((8192 << factor) - 1) | BIT(31));
> > +}
>
> What does BIT(31) do here? I see the vendor driver sets it too, so I
> think it is right, but a define in reg.h or a short comment would make
> it easier to follow. The same goes for rtw8821a_set_ampdu_factor().
I reviewed it again and saw it, so I added it to be at parity with the
vendor code.

> Best regards,
> Luka Gejak
