Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743955;
	b=NlKHBToxbNxryr+ldAWY4Ia/K7FumlbiuQcDxHynklVMwtZi2Te4NXM4StQADiOFZepa
	 8BBbMEKP+nnwWY+m/U6n1mOAAObs+TzTxZMDo/GUS7sP8j0RV5Iva5TJL5uHiY0aCRjC2
	 Nua34HzjPfhmQuvf4Quh/LCdxCgk6pevUUhHbLgX3z0rw5m4Mb6F45dkVU1UwYXjt+5Si
	 tvAdxUtdWWG+USsKogJxzwTkMWNiHEAXXgdAYbhoKgBxei+ScUGPI/BVXNL/ZVDZ1wGac
	 sYLfRN5/s8AJAMcPXYcpfcqz+33D13z+Qc6cRM+CdyCsFGm7fwnKm0G5oT1/69VpIgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kNxO3/2YO6D4BTHHdBPH+lZ0ORyE8BnWz+iTpXHyzdo=;
	b=FVCP5Xg+Xtw42ei+EvR4thQlkuedmWeYOfZM41/W14owX/dcqSfMybLhOgOpBdixE4qE
	 ojppZflqhxZRvkK20B9bxRvzMk3Yrb+oQSxecva2vNyXVdZOm9zqci6b1MQ8gv2ZY74wt
	 0JUuCp5rZ7Csc7ZiJ9rS422AXh0uUK2fBZXax5/iAUh+X8yCmRqjwCigSbgIFTiRETu70
	 hUHStx47dsKoLVkEZS9jPpCdODx+iK31N5ToIYE4HlDCNo0AuYeDCiIWYXxjTgk9b4E6H
	 fN0EHGzhbXT6jEpk+U3QSiBJGcGS+H+/4YD3LAOsp4lT3wMzqVM0+JAvgIOz6BmCuEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MyYbXawC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A903606A323
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 11:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A903606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MyYbXawC
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4994790a12.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743952; cv=none;
        d=google.com; s=arc-20260327;
        b=l5fW7nYEIfa/zklOXQ6FaXXPOaWlgSGqb84vE2k57bjPvM6sfznRrWK5rvNyPfjGV4
         ZxsSbxMEnHylvh28fC/yiq1mAnNqNpk11+oNjn/jCCLe2YuG70hRqE71+UNXaeoKtFIX
         DlboLjpqv3a8TAVCvs+4zj87ZsOg/q9q/Hsnztu58vQv2MJr8ML9pPdF3x/v3TuCw7ng
         FVTiqojzsgh0nrkKjOPhQWPsvUSJ894+tJA7qQR9IFbCyx2hpBQZ/MepLxBl5X1DTsal
         E1r7BFWD4e2ZhKjAav800GY2XEx2P/LP5wkLHfpaRFr9hJ0kInNi7sgV2EmvrEDyLNNh
         UHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kNxO3/2YO6D4BTHHdBPH+lZ0ORyE8BnWz+iTpXHyzdo=;
        fh=zFCB9yj6tbPtiNOgT9n/qK9LnQKfgtX1AWhCxXtoerY=;
        b=g7K1exXr6CnH2xybmPIk6kIrO9zgluPE394y4G1qH52W2zpS5zIHiWr1z2q1s2ojWm
         7Y6I3V/SpnyQHN68P8+Q5Q7W79WKN/Ak7aeCoZnEtXLCP901C5K+TiOjuU3FDwL3eEal
         ECl0jhgTzeXvD6OFKSHhBXRi597uKMxmdUm2CDczjzKhMA8rJpLirX+v9RcYfhYJeKdd
         f4hkt79zv89TZdYUciUsoGbDdcgizYjjYH8XilPhZ0LT9e2P1sb9gY1sEh0Zc7LrBpfT
         kT2yRJh+j+E3aLdBgf3po9Z8K4VnisDTmVymwu9gz2O3PCFH29Y24YlPzOhm5jVeEpV6
         uh/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794743952; x=1795348752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kNxO3/2YO6D4BTHHdBPH+lZ0ORyE8BnWz+iTpXHyzdo=;
        b=MyYbXawCBPehEveYxlanqmql53uAE2gG2KI5Cm9klAURYliKa4eeAE0Zu0XvUOp9mc
         DVPf8GwjBiTz3b1vRz9i3hzfKwYcxGNelDFVoNwBtKBK8rJqM9KL29rvneJk9T3u3Lzd
         ZXRfxctRO6SmTgIumE2HjSiEXqC9ysmbr1PkuYZBvqVB0WATNS/Gv7YRgrKgEgUMhHXf
         oCxuFxqQ12kKmlQdjArTEgStfEtgcBxjOBnzLIsJAP/7jRfhraBuWfJ5VnTkm/Cxvvr2
         liFQ+rx8TR9A/Vn1ait7eTR9VKk+zz6AP3vSxU39Fh5fJ9r953khu3PskrKoxPcrD9B7
         1OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743952; x=1795348752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNxO3/2YO6D4BTHHdBPH+lZ0ORyE8BnWz+iTpXHyzdo=;
        b=uAm1e63c//Hjk5VV6ubi2Hw7wNOr0AkdBb2m8y9lVgHRyxb9x1b3pWzZjLkzfjy7GU
         oYllA6OsTapA/j3Nylt6WwoXk+fRhQcO+WzqEIDzdR2RDJYlULFMyWQZ12Z+OcrCPvEP
         38ZxnrvymcMXJ5y01gLrKismEkw+9o4OB5aAnqoR4O7WnZIAEjby2dcn/ONMxW+Ots0o
         8jyNaqn3NTbINPABrTMJ1bM3ifWYYnTYjSFBdvCcAa+LS8YyT8nE+DEoiaAOA0CWgH8h
         vfE2HbMOcOauDAcB47kLIU+dDosjCOTIRzUEatyvq9o99lyM48Y3RvQT9owHb60o8nhE
         dISA==
X-Gm-Message-State: APuU4Z+IjVWFDPOq1ZewDyAJ7ZDAoTbgSDqWRe02kAAvmlcZE2DxOQF/
	mLZfYdmqwWnsawvAofQWEVJRV2BosayXgIl9G6rH6sqRx7mSeJ0cQnTxqyOz900kw41OxFIAxBm
	+N22Em5EW6PBYZDq7defm7skBG2zYVGf5h7RTYAJM
X-Gm-Gg: AYBFou3wrjS7RAx647vJLMJgZ57zWGh4rNv1h6D4Jr2EAmyz2qUTWwlqP1bbcgLyA6s
	YPy+/ynxC6gHND9Nk2FJiZ8UhuurNV4SezzT6+BTmb2EJEOLeyH1GRUEXUYjK7oR/ZD2RWdJaPM
	VekpFee57pdmdZlhEtNLio4r/kbjcDWdKeyQkQe3CCI5Wz4r7mYyLwv1prjZ942w+5PN01YABhw
	bhfSPgR4yX8FYljuQaPu8oPJv2MLPHgIDYDoYsoBIlGsvPbBtWI4ciHArU1XdREtme8613T2tzU
	jZbAV+M9p0sHJ+ZXH/Uz/34npM6czQQUYsqOYsxMinktv4FIoF+P/MWP3+4nGMPOmNo2BUzQV4U
	4e92K+Q8S8nmJb0PXBoCQeZKwhVkAo9NGliO4fyPJ
X-Received: by 2002:a05:6402:4248:10b0:6b4:1eed:b9f2 with SMTP id
 4fb4d7f45d1cf-6b7c0c542c7mr4482141a12.10.1794743951698; Sun, 15 Nov 2026
 03:59:11 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113080731.30155-1-spam@acio.nl> <4985719de8b5439e8484384ed52033e1@realtek.com>
 <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com> <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com>
In-Reply-To: <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com>
From: "V. S." <spam@acio.nl>
Date: Sun, 15 Nov 2026 12:59:00 +0100
X-Gm-Features: AclHuK_aXFpxmhQAevyxqk3kCqxTAv_YWD_7zLu5OW4bZiOavDlWREjELXC3jJQ
Message-ID: <CAJKtVVa6n++Uhy7z58d-Wbb3oGnTHz+bHt07_Akp7FPn6F2qYA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping-Ke Shih <pkshih@realtek.com> wrote:
> How about memset(ra, 0, offsetof(typeof(*ra), rssi_unknown)) ?

Good idea. I did this for v4. Then the RA update does not need the
local variable, and it clears the flag after it uses the flag.

> /* driver helpers (not clear by rtw89_phy_ra_sta_update()) */
>
> > + bool rssi_unknown:1;

One change from your proposal: rssi_unknown must be a plain bool, not
a bit-field. offsetof() cannot be used on a bit-field. With
"bool rssi_unknown:1;", gcc stops with the error "attempt to take
address of bit-field structure member". I also wrote "not cleared"
in the comment.

Also, with this memset the order of the fields is important for
future changes. rssi_unknown is the boundary of the memset:
- A new field for the H2C command must be above rssi_unknown. If it is
  below, rtw89_phy_ra_sta_update() does not clear it, and the RA update
  sends an old value.
- A new driver helper must be below rssi_unknown. If it is above, the
  memset clears it every 2 seconds.
The comment marks this boundary. Tell me if you want a stronger
comment, for example "keep driver helpers below this line".

This is the v4 change:

--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ struct rtw89_ra_info {
  u8 macid_msb:2;
  u8 band:2; /* enum rtw89_band */
  u8 is_new_dbgreg:1;
+ /* driver helpers (not cleared by rtw89_phy_ra_sta_update()) */
+ bool rssi_unknown;
 };

--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ static void rtw89_phy_ra_sta_update(struct rtw89_dev *rtwdev,
- memset(ra, 0, sizeof(*ra));
+ memset(ra, 0, offsetof(typeof(*ra), rssi_unknown));
@@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
  rcu_read_unlock();

+ ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+ if (ra->rssi_unknown && ra->init_rate_lv) {
+ ra->upd_all =3D 1;
+ ra->rssi_unknown =3D false;
+ }
  if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
  ra->upd_mask =3D 1;
@@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct
rtw89_sta_link *rtwsta_link)
  ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
+ ra->rssi_unknown =3D !ra->init_rate_lv;
  ra->upd_all =3D 1;

Only rtw89_phy_ra_assoc() and rtw89_phy_ra_update_sta_link() call
rtw89_phy_ra_sta_update(). A new station starts with a zeroed
rtw89_sta, and rtw89_phy_ra_assoc() sets the flag again for each
association.

I tested this on RTL8912AU in AP mode. The client is at -56 to
-59 dBm, and each connection sends TCP for 60 s. 8 of 8 connections
use 80 MHz (VHT 1SS MCS 9 or 2SS MCS 5 to 7), 341 to 428 Mbit/s. PMF
still works.

If this is OK for you, I will send v4 with "Suggested-by: Ping-Ke Shih".

On Sun, Nov 15, 2026 at 4:05=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> V. S. <spam@acio.nl> wrote:
> > Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > Not only RSSI 0 but RSSI 1 can fall into this case, but I think it is=
 harmless.
> >
> > Agreed.
> >
> > > How about put into ra-> instead of rtwsta_link-> ?
> > >
> > > Please put it on bottom with a comment like below, because the struct=
 rtw89_ra_info
> > > is a copy of H2C command (at initial version).
> >
> > OK. One point before I send v4: rtw89_phy_ra_sta_update() starts with
> > memset(ra, 0, sizeof(*ra)).
>
> I forgot this point.
>
> How about memset(ra, 0, offsetof(typeof(*ra), rssi_unknown)) ?
>
> And, additional comment ... (see below)
>
> > The RA update calls it every 2 seconds, so
> > the memset clears the flag before the RA update can read it. Thus, the
> > RA update must keep the flag in a local variable before the call. This
> > is my proposal for v4:
> >
> > --- a/drivers/net/wireless/realtek/rtw89/core.h
> > +++ b/drivers/net/wireless/realtek/rtw89/core.h
> > @@ struct rtw89_ra_info {
> >   u8 macid_msb:2;
> >   u8 band:2; /* enum rtw89_band */
> >   u8 is_new_dbgreg:1;
> > + /* driver helpers */
>
> /* driver helpers (not clear by rtw89_phy_ra_sta_update()) */
>
> > + bool rssi_unknown:1;
> >  };
> >
> > --- a/drivers/net/wireless/realtek/rtw89/phy.c
> > +++ b/drivers/net/wireless/realtek/rtw89/phy.c
> > @@ void rtw89_phy_ra_update_sta_link(struct rtw89_dev *rtwdev,
> >   struct rtw89_ra_info *ra =3D &rtwsta_link->ra;
> > + bool rssi_unknown =3D ra->rssi_unknown;
> >   struct ieee80211_link_sta *link_sta;
> > @@
> >   rcu_read_unlock();
> >
> > + ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
> > + if (rssi_unknown && ra->init_rate_lv)
> > + ra->upd_all =3D 1;
> > + else
> > + ra->rssi_unknown =3D rssi_unknown;
> >   if (changed & IEEE80211_RC_SUPP_RATES_CHANGED)
> >   ra->upd_mask =3D 1;
> > @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, struct
> > rtw89_sta_link *rtwsta_link)
> >   ra->init_rate_lv =3D rtw89_phy_ra_get_init_rate_lv(rtwsta_link);
> > + ra->rssi_unknown =3D !ra->init_rate_lv;
> >   ra->upd_all =3D 1;
> >
> > Another option is to keep the flag in struct rtw89_sta_link, as in v3.
> > Then the memset does not clear it, and the RA update does not need the
> > local variable. Which one do you prefer? I will test the change on
> > RTL8912AU before I send v4.
>
> Please check my opinion. If that is not good, maybe we can reconsider v3.
>
