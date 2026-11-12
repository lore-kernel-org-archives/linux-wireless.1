Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470340;
	b=bkTVWrEaznwTjeJIiLLYmtKwKLMgr6blOBSXcizeUunl75swp1ETEQ+PCy7bIc9ajKWH
	 66zFM5TrP8bUNIGUsfrCy/btJbVJE/uGG+/1vHgSSI8ffJbI+PXmwwN0kShlm0UEHyl6n
	 /Ty6yew9sW02GsbEibTCq8BqUPrQZnaUzLEABJEXmDIRs95O9f9HWKDg/NXNgDMxSar4P
	 YnLdwZM7UwFioS5Ks5LvJ0ct4egAoBIdt4qXWRd6xbVBfnKMehaqjdRUR0S4nMlLsPOxc
	 EYq1mT5imo+mKI9Ogve28ICyGH97luhFS9zVU0/w0Ktv+R22+FZ6g+JqXa/oUSRhZvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DjO1xCtGqLcO9z2ZXququdx3x2Rqg4uwGboEOk41Znc=;
	b=RTedWkaSDOYI3913E7rnSOGVbw8FQAC01McC6K1UHTK3nM7io1v3ParWuA+PtGJk0hLF
	 R4L8Ff7wMMg1Sm5O1k8z7qJWK/JgT4KnlzEvMurqkdxsZBuPRudatYS+NZdUZEesgqD6+
	 FaXtpTK9W/InI31CcWFM2VOtAaff+AZyJla7DUwxKI6b+jJ2TFPKCbZj9s60GJIszUs9I
	 kw+/ptbRSaEgpLOnXRQodABy2jTI2z3QDc4WaY7tNWr3J5bk5AN9OoNvkIw93UEtZM6hC
	 GWNcZMG5abafSnAl72OoOBmgaKCc1m3XYL/b2h5UL3WFWqmHP0P5SQgP8U4P0VNzsmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FLTIOaX7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11DA606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FLTIOaX7
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso440544066b.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:58:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470338; cv=none;
        d=google.com; s=arc-20260327;
        b=s4P+XyspCigAOU4R2+dVMdGLVnXvKUGuw+pmBX7gF9xPDBFgPa1rGlm4X5rd6U/bty
         vxTwT+xaxe7tN2tCayMhZoGRrOCPARlt3G3al/WPsDoaJRDT1i1m5/mcnL049FdWUoHk
         B0eKAw/FwU36uDfHQ0kpOX+O6ixU9onWlr2K6V0kcALKDoSbCR86F3ErQB9xQk8Xc2i4
         26pe9WMW5/bkmLqBbHumMhyhI3JaUuJ/sK53bMaiEjDvUyeGzo4t9MOj1zTC83Sue/Vy
         HnZVCL7eGJXF7jZM3M6ge9FhKyCQLXBJO+HR3W9tpiyxF6AKX6QhSVjYUVepzBNuVEN0
         D9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DjO1xCtGqLcO9z2ZXququdx3x2Rqg4uwGboEOk41Znc=;
        fh=zFCB9yj6tbPtiNOgT9n/qK9LnQKfgtX1AWhCxXtoerY=;
        b=Hvj+QUTeVc+IWF5p80mkZBCwsLDAS08wZ+j8ROyLlypcxUR3r7XKgmryyF4/Tgo0E0
         8+ZKf0kRj3ELcTMmr01nJVRlDhWn2CHqltuG/nYZHGqvH8SSYZ7CDAd7aLZo1jsvCDbf
         V1yYbNqLz0hWgS6xs6/wKDQcLOispo+cY7/4YJL942MR9hvs1jiNeZUEa4Ql63ZHgZ97
         BamEtZmYqdDCWOGLsgEdK03ISCdRum4fYTVEi3jHFCK23ZmTq8Uw3N3K5hpvrTUlVAFd
         mQCqV60q5+IxYYBlgIRSZBSwJIlgUlRybailHqBLFnVCawXMGMkhgwi6YZGT1Ea+21D+
         z6+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794470338; x=1795075138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DjO1xCtGqLcO9z2ZXququdx3x2Rqg4uwGboEOk41Znc=;
        b=FLTIOaX76AB/oAyMwVRHKolKEoPLt3qPr5OJ8Q0reFkDxAM33Sn7Ae/FL80DTeXZjF
         cY/WKv1Yva2Tz9D8sNiGbBXlJ7krepn3JC3nbW6rDmOg1N3mFgI1PiIrijM5QhvEiDIr
         WQM3i2Y/1hxumhSc4mVBQ4rE0C0oN+5knk9Yd6CvFKwBpkzWNFYZ5yJQL/y1K6thonuh
         UYfAg1TN3O87tti4DZ1scy3aAFDQcx9Zsk/kW9QdaMPC4Ia6ssZAH5Y0y9htgdXhghSZ
         u4DJtDj7HZfSZ+yFroQT1T/QgAvBOKvcb2c2cLCDqwSjhRS3h4p3mTQ74s7rp68Lzlx8
         Hu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470338; x=1795075138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjO1xCtGqLcO9z2ZXququdx3x2Rqg4uwGboEOk41Znc=;
        b=skPGcsCgNRNHLS4o9CR4dZl/Swif7uil4z5+30cF51adARJrNCvA65I57YCyApxJXS
         HlE+JNTc4tX4CbX/dEYhIfS3fI2JWUwi0XyzqoXnDjTdDcJWPP65nlZgsuK3b9EBFncS
         jgHKTbnhal8vR3jXZXQRHW30iQilLmcG+ip2d+9EWUFug8YVf6jnljoT/8vnzsHRIxVP
         ZMzWyU/C1OMulSl4iGtjzDFmCwLf9SJ+vuQ65wnp/CWfUOYpqCRrYCO5Zy1Ipzcr3i+M
         zf+uk0//kvS2oHqhgbBtuMBMcxlZ0YOy13jmqI33Vro5iDNDrrYw5J8BLUFORPc+FxlU
         P0gA==
X-Gm-Message-State: APuU4Z+IhvpDRwHBd1uqN8YUJCKb4KJywHlLHN/kh9+/4XVCSS0vV4/E
	Iy/Q2x8D9P8obP8fGBbYStVWE396vVqhBWH45ToLDTZ+zH6bTMVpzhkcFSvUj9E3Q8sNioxeCPn
	G505u485L0gVyBcvoXsFphb22MY7hjbwFHM4kSAEVaifJ7mhUEWGZtPfF
X-Gm-Gg: AYBFou3eHcucVfmBQR9yxhYUf52PZRrtxqCjwWQvEoTCMkcZspiK/OSCkkdFVEQZ7+F
	3/W0ZcjrIZXKUxHqSCj60lcUYJxgAUzXe0JKbjAIYgLDn/78N583Ier1pcYkhjS9hU8kNmalaSy
	gCgGiZKNkFfmMlXK63s0Q1ZwIhdbMiZ2VdhAh0E+CYZIMuShqrXbrChdQasCVaxXxz9p+N81Jd/
	NSZd/tS3mkrkrDT4m89C2TImzVUPIFJfey0OZcKl3+xkHyWwpH8UMdzaFH6FoxXy/bTGqNFP5Ya
	nO9y8LKm27syYMDmTbHp3ourXg+i7LcgIpdmY3p263aptpawe5QGm+JXddOeX2Pgq3/NqEVoEN1
	H0KNTeBSOmeJteMmowKWw07IIzoIaxF0u6QrrLQ/b
X-Received: by 2002:a17:907:3fa2:b0:c4c:999e:e6f1 with SMTP id
 a640c23a62f3a-c5066d986f1mr308946866b.46.1794470338177; Wed, 11 Nov 2026
 23:58:58 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108131723.206533-1-spam@acio.nl> <d1d88bf5d1ef461dbb55988f906892b5@realtek.com>
In-Reply-To: <d1d88bf5d1ef461dbb55988f906892b5@realtek.com>
From: "V. S." <spam@acio.nl>
Date: Thu, 12 Nov 2026 08:58:47 +0100
X-Gm-Features: AclHuK-vu5vCPqcQNQ4zlV3CBPi5PRK_nrQM2nr_g8nVcHUSEhW62-nFSSm4dG4
Message-ID: <CAJKtVVb1kXLProWk1gNjcTNLFx-Q-79XQmyf8FhKnJKPozEL5Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtw89: do RA association again when the
 station RSSI is known
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. I tested this on RTL8912AU in AP mode. With init_rate_lv in
the RA update only, the rate stays at VHT-MCS 2 and 20 MHz. The
firmware uses init_rate_lv only together with upd_all. Thus, v2 also
sets upd_all one time, when the level changes from 0 to a known level.
Then the rate goes to VHT-MCS 5 to 9 at 80 MHz.

v2: https://lore.kernel.org/linux-wireless/20261112075622.32785-1-spam@acio=
.nl/

On Wed, Nov 11, 2026 at 4:22=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> acio <spam@acio.nl> wrote:
> > From: Vincent Schurink <spam@acio.nl>
> >
> > When a station associates to an AP, the AP does not know the RSSI of
> > the station yet. Thus, rtw89_phy_ra_assoc() sends init_rate_lv 0 to the
> > firmware. With this value, the firmware RA of RTL8922A uses 20 MHz and
> > VHT-MCS 2 for the station. The firmware RA does not try a higher rate,
> > also when the PER is 0. On an 80 MHz AP, the TCP throughput to the
> > station stays at approximately 35 Mbit/s.
> >
> > Set a flag when the RSSI is not known at the RA association. When the
> > RSSI is known, the periodic RA update does the RA association again.
> >
> > Tested on RTL8912AU (RTL8922A, USB) in AP mode with hostapd 2.10 and
> > VHT 80 MHz. The client is an Intel Meteor Lake CNVi (iwlwifi) at
> > -45 dBm.
> > Before: TX rate VHT-MCS 2 at 20 MHz, TCP 35 Mbit/s.
> > After: TX rate VHT-MCS 7 to 9 at 80 MHz, TCP 186 to 320 Mbit/s.
> >
> > Signed-off-by: Vincent Schurink <spam@acio.nl>
> > ---
> >  drivers/net/wireless/realtek/rtw89/core.h |  1 +
> >  drivers/net/wireless/realtek/rtw89/phy.c  | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wi=
reless/realtek/rtw89/core.h
> > index 0d893b992a4..ca5f2aced33 100644
> > --- a/drivers/net/wireless/realtek/rtw89/core.h
> > +++ b/drivers/net/wireless/realtek/rtw89/core.h
> > @@ -4711,6 +4711,7 @@ struct rtw89_sta_link {
> >         struct rtw89_vif_link *rtwvif_link;
> >         struct rtw89_ra_info ra;
> >         struct rtw89_ra_report ra_report;
> > +       bool ra_rssi_unknown;
> >         int max_agg_wait;
> >         u8 prev_rssi;
> >         struct ewma_rssi avg_rssi;
> > diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wir=
eless/realtek/rtw89/phy.c
> > index 795920b899d..96660b781a5 100644
> > --- a/drivers/net/wireless/realtek/rtw89/phy.c
> > +++ b/drivers/net/wireless/realtek/rtw89/phy.c
> > @@ -717,6 +717,19 @@ void rtw89_phy_rate_pattern_vif(struct rtw89_dev *=
rtwdev,
> >  static void rtw89_phy_ra_update_sta_iter(void *data, struct ieee80211_=
sta *sta)
> >  {
> >         struct rtw89_dev *rtwdev =3D (struct rtw89_dev *)data;
> > +       struct rtw89_sta *rtwsta =3D sta_to_rtwsta(sta);
> > +       struct rtw89_sta_link *rtwsta_link;
> > +       unsigned int link_id;
> > +       u8 rssi;
> > +
> > +       rtw89_sta_for_each_link(rtwsta, rtwsta_link, link_id) {
> > +               if (!rtwsta_link->ra_rssi_unknown)
> > +                       continue;
> > +
> > +               rssi =3D ewma_rssi_read(&rtwsta_link->avg_rssi) >> RSSI=
_FACTOR;
> > +               if (rssi > 1)
> > +                       rtw89_phy_ra_assoc(rtwdev, rtwsta_link);
>
> Can we move rssi logic to an individual function and call it to update
> ra->init_rate_lv?
>
>         if (rssi > 40)
>                 ra->init_rate_lv =3D 1;
>         else if (rssi > 20)
>                 ra->init_rate_lv =3D 2;
>         else if (rssi > 1)
>                 ra->init_rate_lv =3D 3;
>         else
>                 ra->init_rate_lv =3D 0;
>
> The rtw89_phy_ra_update_sta() will call rtw89_fw_h2c_ra() to send H2C com=
mand.
>
>
> > +       }
> >
> >         rtw89_phy_ra_update_sta(rtwdev, sta, IEEE80211_RC_SUPP_RATES_CH=
ANGED);
> >  }
> > @@ -755,6 +768,7 @@ void rtw89_phy_ra_assoc(struct rtw89_dev *rtwdev, s=
truct rtw89_sta_link *rtwsta_
> >                 ra->init_rate_lv =3D 3;
> >         else
> >                 ra->init_rate_lv =3D 0;
> > +       rtwsta_link->ra_rssi_unknown =3D rssi <=3D 1;
> >         ra->upd_all =3D 1;
> >         rtw89_debug(rtwdev, RTW89_DBG_RA,
> >                     "ra assoc: macid =3D %d, mode =3D %d, bw =3D %d, ns=
s =3D %d, lv =3D %d",
> > --
> > 2.53.0
>
