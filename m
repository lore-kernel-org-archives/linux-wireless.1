Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423716;
	b=3J22i4B5RNU9UnwuGXyP3yj+7YVpV4WqXmeaAg3Jb2h8nXKPLswrNfOvbz+AORsxvAak
	 mOkHvAhvch5r94bRXbAjylfuR7y6x2ADaKXUS0lYcKpIaklJHvgEypl5v2RV/pQNtWneo
	 q+NpwX8mS8+Mjt8HOQjIZ+zUCGVm7XkIfAzpCoU8DuL5iLadkgGq17JXB56/+q1QiLl3N
	 sWkSIDW8jI4nGMcwbRrRuRbvKsMOLHHYvBfqvd2K6suguGRCOE5WOwkULChJHmoX/n9JP
	 qsByAIMpjOlrDhOkg4KpFaOmhFnmNdIfxYvHKTRWU4/ub8hLw7dI4uStK0JR1cfQthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423716;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MbNcJHOj00id1osbolDcU0scLbh+L9kbGhwDW8R8ez4=;
	b=sFyHPpTFUdUCjAbuNeKGw3MD2xFmH+yrZz9cvHIHNPlxTsG67mfDDMpild/4PP22fyXc
	 450BA87NzALw8fYT4rLMsmQ6AKeX4rXSO9t+kvdIEsW0y9fR4Syneg9DJIFGuZf5QpD9/
	 QVFOa0Mo9qGUu9sDyOZXNICLVRGkJRUawQ2+Duh9GW3grZtxR/Z82//QMDVzsYzaZPX8G
	 Xx6eS+2T0lLS0KLLLT6+ex+3/Ba2KfPsdNFPcITmdYRrVzb0ZFUdCzr4/Zo6JZs8I7y4P
	 I2nk22ZfJxLRhfQ8a+/E/zpq3KGacsNHVUBW0MHIe01NoqFHxsdshf1Qe/6q2OPfoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1BeBVtC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05280606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1BeBVtC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF471F00A00
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423715;
	bh=MbNcJHOj00id1osbolDcU0scLbh+L9kbGhwDW8R8ez4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=A1BeBVtCkuGRt4woxLxRqKpOM75XEnQvE44Fa76mtH4V0+8tzTbeeZ9lXic02mzjD
	 mJYIu15VzJbrFvmGgxZxWPqbnSMzrftqKACuYdxhedqWFypklrI7HcTRTxdUGZ+yob
	 3d867pPcXoG3RKkNAdf1sD6PVegvEYc0cucGtb8O07l/pqGeQ+dsjjMDjRIFYsBJBQ
	 tvhtSyBMk4LHpLvTyJI8HaTuUOR6uC3IwF4qFnYqmvTqvWUH7qwv900CXKpu0zSrXT
	 JiAnpnz25dXBumFKdzUXprBuaV88ywXQ/VmUWwRP8ts5LnmzD9JlIwyFUCtAGxk7BA
	 PWcbggGLatpRg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so23039121fa.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:48:35 -0800 (PST)
X-Gm-Message-State: APuU4Z93NePwbGgnLuj0Femt0oGHIFY4u2yYr6mrv2pvCInqCDZwolFI
	MdgRad5FZUKHBJNUgdgVneO90oOGBvnwqTOFChL4hsfjJbM85d2NVlJAaD8g2QIj1xTq+wytLIy
	mPYRS+qCjEDDFcsNIu65++ZAtvGXj2NA=
X-Received: by 2002:a05:651c:a167:b0:3a9:c840:10ee with SMTP id
 38308e7fff4ca-3ae7f9a129cmr30229011fa.5.1795423713857; Mon, 23 Nov 2026
 00:48:33 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com>
In-Reply-To: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 16:48:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v65sW+JADcdONnBPm0dUA+=LopxMP6Xai54xiJxxqg2Q4A@mail.gmail.com>
X-Gm-Features: Aa3M54pIcOh_aFnPVOYhCAVPrFPu1FeCqJgWJe9f6x9VDdfLRO7waY23ZUVQhmw
Message-ID: <CAGb2v65sW+JADcdONnBPm0dUA+=LopxMP6Xai54xiJxxqg2Q4A@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Kazakhstan (KZ)
To: RFAREAS Support <support@rfareas.com>
Cc: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:13=E2=80=AFAM RFAREAS Support <support@rfareas.co=
m> wrote:
>
> From: Valery Belousov <support@rfareas.com>
>
> The KZ entry cites the 2015 versions of the Rules for the assignment
> of frequency bands (Order No. 34 of 21 January 2015). Item 24 "WAS/RLAN"
> of Annex 1 to these Rules, the list of radio equipment that may be
> operated without a permit, was replaced by Order No. 564/NK of the
> Ministry of Digital Development, Innovation and Aerospace Industry of
> 19 September 2024 (registered with the Ministry of Justice under
> No. 35100 on 23 September 2024, in force ten days after its first
> official publication). The consolidated text of the Rules on the
> official legal portal adilet.zan.kz contains the same item.
>
> Limits as stated in item 24 (all e.i.r.p.):
>   2400-2483.5 MHz: 100 mW, 10 mW/MHz for wideband modulations
>   5150-5350 MHz:   200 mW, 10 mW/MHz, indoor use only
>   5470-5725 MHz:   100 mW, 10 mW/MHz, indoor use only
>   5725-5850 MHz:   100 mW, 10 mW/MHz, indoor use only
>   5925-6425 MHz:   200 mW, 10 mW/MHz, indoor use only
>   57-66 GHz:       40 dBm, 13 dBm/MHz mean, indoor use only
>
> Changes:
>  * 5250-5350 MHz: raise the limit from 20 dBm (100 mW) to 200 mW;
>    the item gives 200 mW for the whole 5150-5350 MHz range.
>  * 57-66 GHz: add NO-OUTDOOR ("only for use inside a building").
>  * Update the source links to the current consolidated Rules and the
>    amending order, using https.
>
> The other rules already match the item. The item does not mention
> DFS; the existing DFS flags are kept. The power spectral density
> limits cannot be expressed in db.txt.
>
> Signed-off-by: Valery Belousov <support@rfareas.com>
> ---
> Found while cross-checking wireless-regdb against the national acts for t=
he
> RFAREAS Wi-Fi regulatory map (https://rfareas.com/blog/tools/wifimap/).
>
>  db.txt | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/db.txt b/db.txt
> index 43dc0b3..3eb02d2 100644
> --- a/db.txt
> +++ b/db.txt
> @@ -1194,16 +1194,21 @@ country KY: DFS-FCC
>         (57000 - 71000 @ 2160), (40)
>
>  # Source:
> -# http://adilet.zan.kz/rus/docs/V1500010730
> -# http://adilet.zan.kz/rus/docs/V1500010375
> +# Rules for the assignment of frequency bands ... (Order No. 34 of
> +# 21 January 2015), Annex 1 (radio equipment that needs no permit),
> +# item 24 "WAS/RLAN", as amended by Order No. 564/NK of 19 September 202=
4:
> +# https://adilet.zan.kz/rus/docs/V1500010730
> +# https://adilet.zan.kz/rus/docs/V2400035100
> +# Table of frequency band allocations (Order No. 22 of 20 January 2015):
> +# https://adilet.zan.kz/rus/docs/V1500010375
>  country KZ: DFS-ETSI
>         (2400 - 2483.5 @ 40), (100 mW)
>         (5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
> -       (5250 - 5350 @ 80), (20), NO-OUTDOOR, DFS, AUTO-BW
> +       (5250 - 5350 @ 80), (200 mW), NO-OUTDOOR, DFS, AUTO-BW

TPC is required for this band. The allocation table has a footnote saying
that ITU-R Resolution 229 is to be followed. This requires both DFS and
TPC for 5250-5350 MHz.

Without TPC, the limit is reduced by 3 dBm, or halved. Hence 20 dBm here
is correct.

>         (5470 - 5725 @ 160), (100 mW), NO-OUTDOOR, DFS
>         (5725 - 5850 @ 80), (100 mW), NO-OUTDOOR
>         (5925 - 6425 @ 320), (200 mW), NO-OUTDOOR
> -       (57000 - 66000 @ 2160), (40)
> +       (57000 - 66000 @ 2160), (40), NO-OUTDOOR
>
>  country LB: DFS-FCC
>         (2402 - 2482 @ 40), (20)
> --
> 2.43.0
>
