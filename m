Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192299;
	b=ztpCgTI1+uf6z0BqJoheI5TOtSztl1kNSETLQea/g+41c6R+gQO9GsTcGmIpsNDC9ySH
	 un6SXKf6OQdGqFdEAIGx1UtcVWR/Z/H4BXNWTMQDJPWXkYDdhwCqwhCqa7/+zDSiMhkFz
	 LKqsBElhbwHJ93JIFjM4i2cmIFguaLM4aDr3+MeLAJyxz1TGb+Np+WYM1fKQp+uKeymYB
	 jPt7zHEWQrLcGTEKzGmzeR4J8HT+dGYB4P9D6Q9YwWbrvltaCzky0QlIsOjNmLi662LBI
	 hWJdfd1xQ1I7iG8GHfjh16UcqLRkmcknZJJ4MPksUg9yt4xXIxptm2TMiMh+YbDQ8pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
	b=O6qyE6I3OkiBS56/G3yu2YAyP9zIS+Had5c7UkuIovChBN71c/ISmbrKpd2XQVJrkX30
	 FkcENIMObFwaUIqaqEiD3XyYfc0Oik2NuAbfuPw/QLxtlTIGQJZtyapr2u5Fmyk5KhkGL
	 d89+LJ7LufN83OOPU8fithraBXuTN94H+Pmfbdx8i0u81ddyAJ1og2Vo3P2qkPh3BJXJ5
	 wxUHtWsxJommYMr0emqD6dr/k6ssOL6cNfmp98ouK4MGfwcCzV6FG/9D4tD7ZbB3tdMGl
	 mL89QQgwenT30baszZxwg79ufIEJW+vlAKMIqxCpj2JcVillEPuKrWcl8rGDr4y8Sgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ja9zjxov;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06E0606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 02:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ja9zjxov
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-70b875f6f1fso308646eaf.2
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 18:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192297; cv=none;
        d=google.com; s=arc-20260327;
        b=W8NYdZwf/j43EZSxxYTdXmBwIP2yMu3Z75QRKSICoJceycHvNYiGANeSwkGMTCEKe2
         uL2rSk03lRqQ/4fttKC5/KYJ4U9qcTuGLymdfqsIz0nmu0uOubqqyhpRzPqUUxQBakAH
         i1kgPAazuUPulalzuLzzBv/2mhSpXEtvQpjQvVlTAwO23eW60o8QGFWvoSwNwozU5n/E
         MZ6HvHgl/DfI7100zeunGiimhdpvbFlH3ztGFRg9ILD1X3ZSFzdWISTO1cKggvNTv4Z/
         G0hldil21S7PMY9YN/qSpibBpQAHU7GBDt70xE+6W92pUG5qL3o6oCfdLqGKj5RxD7zL
         fMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=TOacSMwb9xzLSUtk1mLfYH+FTdWrg1aW1XY/nRa69yV1LGWr1odupXgltiwtR8cHjS
         IU7sClLMDTO9c1DK6SnADqn0KNDEaQzw4lzukKqYfqy1+fbYxVUrycGR4wfa7ene7U10
         QxDRZ45YsA72GhWwpa4/ja0SIvVAqr6HwanKIG9DFQzCvaIQVU3N80CMTeY3Kljir2c9
         t37qmc8ZjEv2CwS9bnRlfb/qwhCR+ylbrhq98Q8iSoHcVovUng2EJxYmo5dKx+3+ynFi
         aUF7l2z+B14F/62wGbm2ELftTinCzGXHhlevqj21LNajmjRCoyCPegmAtP5CgfV9rjn+
         96rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192297; x=1794797097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        b=Ja9zjxov9lnZx50vVsHsgBa709LcSze4diLb+Xvc96qVi5N4M6dIdkmOP7wFrRAOJR
         jPRnS6BnA57LI0n4/AzyFmcieHVK91lKhr0GJaLL3RF9nJTETLaopDX50azV2Bm02c4s
         1giBZzLW+X2neWi1poGDe3F4sucnxFRYaRvp8yHqpb3PTyhxnsBN66mMwcefq7n3RfCL
         OlFC0pHeav0oaOvJfc3aU+41YUwNlymNKk8eFzA5Xu8UhJQugssHHFg8RihQdYSPBZTn
         mqRdUZoLkjqKOmIjIsikona5sEPTI5Lkm2R14y/vscEJEplAMZwkVc0V1Pe6jUItclA3
         wfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192297; x=1794797097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sM4ei3W2aqsjg/uQoN1lXIUJxYqbL4iaDT4uiaKbXMs=;
        b=BvnnBua1YLaKe4q/ingFH9b0nv5400P1AS/xHc39sYs4H6dwiw9qfcUUfNgz6Ux+07
         qN55gcwiQhGKaEZuyIPc/ldavPFfJxc4QAB1VCs0VZ2YUte6sCHPL8pyIc4vOrSDDxEW
         OjyV5xZvdfVhYJCkRp5zj4u3bAIrLE8DGIqmGMkUZOpXy1/Oigqtcd6+dB9xzmBdE4KQ
         p4MzvCrX6+WK7uxu9nn5+0v/SzHQIimDdEdp/28ftJI9WZ5dsdP623BiYO+r1FiLZP3s
         G2l/8hhpdh1vX/rHmLWCuXYXfSdjLeSTrjRcaVmR7JBaBbsOo04JBWRodeWQZYk4JLOo
         AFLw==
X-Gm-Message-State: APuU4Z9ogiAk8RzjNiXLpN/FAd59NYB3nclndL/yFrz4M37EpJawW4mj
	loaevBY9zZsVEbf8KHsriIVMVTIopDYDIalzt6Fyn5YGwo/94bJLAlSaGPlkWmaBF1Sxzqrbk/0
	NSD0ha3XRVU1D7wIjcRTQ1fFtGBhV8/o=
X-Gm-Gg: AYBFou1OxT4k3B+iTZJh1KC23BkN2L/KxBWDxz9kppCB7hT1mK7E8N9MJyhigeyeBow
	x1mE8R9wgDJW1wXnEhWFX2QlOVmorP0rCR0JOmpK3zDLtN4H+T4MIw5wWgnHAbu5Do7SoS8ifm+
	CmJ4D+zYyR86cyx8VEnllUNeS5SXXZmFUU+090VTnQRQhFuVGuDt/K5w/UWjErqTcTUBjbpEVLT
	JeO08iprge+9Ae+8Eu9g+NytymbEmkqr6ag2njOmMPYB0HOnqgL3mgRQ2PpACaRzaeneu/nJJlU
	FqxsS2uoVyUkOArebXEauJI0xX8jlPTGbFBSNFTsMSeg10PRlvaY5Pjlr90CHxw13xhwmU9UshO
	WenKOg8cOGfazXHqd+oEPivTcef1QBDR6SRH3E+CGWNVhuWb8IsSij7V/X9TD6epKiBKd
X-Received: by 2002:a05:6820:5711:20b0:702:efc4:807d with SMTP id
 006d021491bc7-7170f2f48c0mr963288eaf.49.1794192297616; Sun, 08 Nov 2026
 18:44:57 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-6-hjf3108@gmail.com>
 <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
In-Reply-To: <8fbf3fbba7d94b55b7510a57ff376e8d@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 09:44:21 +0700
X-Gm-Features: AclHuK8bKOtdBlghNCWobQHbMdIwtiOlN7hof4nDKn4NvNui8UWphWLdfR8rlFs
Message-ID: <CABOQOSWLNQC3SHj1AUEQ8SmUAig-8xHGm=GO6w8EN-nSzy-7=Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware
 use all rates
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:56, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > The rate mask is chosen based on rssi_level, however rssi_level
> > is always 0,
>
> Should we fix it ?
The vendor driver for rtl8192du also doesn't do the rssi_level update
It is not compiled due to the #if 0
https://github.com/lwfinger/rtl8192du/blob/master/hal/rtl8192d_dm.c#L2624
Therefore, I'm not sure if it is okay to port it over.

> > since:
> > - for rtl8192de, call to rtl92d_dm_refresh_rate_adaptive_mask is
> >   commented out and function is not implemented
> > - for rtl8192du, it is also not called.
> >
> > This makes the branch always choose less than optimal allowed MCS rates.
> > Enable all the rates.
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 6.4    12.6
>
> How about the rate before/after? I think the highest rate will be similar
> or the same?
Highest rate will be similar, but I saw it using more intermediate rates.

> > RX 32.0   39.1
>
> You change many rate masks for different wireless modes, so please provide
> more experiments. Especially you need tests for a clean & noisy environments.
So this patch by itself is more of an RFC, and I might drop it in v2
if it changes
behaviour too much in different circumstances.

> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../wireless/realtek/rtlwifi/rtl8192d/hw_common.c    | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > index cfefbe86380fbc..0c921c049b5178 100644
> > --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
> > @@ -903,7 +903,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
> >                 else if (rssi_level == 2)
> >                         ratr_bitmap &= 0x00000ff0;
> >                 else
> > -                       ratr_bitmap &= 0x00000ff5;
> > +                       ratr_bitmap &= 0x00000fff;
>
> This mask means all 12 OFDM rates. I guess original design wants to select
> higher rate quickly.
> ...
> For N mode, it wants to jump to MCS rate quickly I guess.
That makes sense, I will leave it out for v2.

> >                 } else {
> >                         if (rtlphy->rf_type == RF_1T2R ||
> >                             rtlphy->rf_type == RF_1T1R) {
>
> [...]
>
>
