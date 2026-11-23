Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423104;
	b=0do4E+npM+rz1HKGArmSVHB+Yk8F29g+ariQYO4d97IDFynikuWovyAO8X0qkhZgGjt4
	 IeQjcmoPyDpw+8Z1Nx8Penl4UeukZEbjb1XHjPpZQ/C42v1t2yHZ3OBPhoiXfbAOZ95JR
	 EeZ/MOF9m+XHglOudt8/Xf4mWGY2A3rL/PJRpdbs9cnTskGXyZ8e0wtzTQ0aEOuWYkL6K
	 g1CK5BITbSNXxMqmZ4Tfj+y6S2k5t8z/I3Wh9nH9GsnRaGQLD/nIYi8QV+EO5GTI/rLE2
	 QQewBKFwaZxJy3iGLDlLMsX1ZKHOPjZ0Bwz4NpOuHtpJKDPgXn4zFUCnfChkBiITMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423104;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=olsXRWb2mJ7alyZvuOZMo0SuIvMzdv85vW212okoksM=;
	b=Ozdc7sTCT21e74ObpN/6cqV1Nqy8JgHfwnZp3bPYqjRi/lvLE2qRcKyn5jq09khx1EaY
	 fXbz94Psa5+5iU+7K5n/bT+bTSrelDD3QGTVct7RmdExtDOAPN1cj4dU0pwFrR4B+gzrA
	 5ftChq4wvoUGlmVUIbkmbveZvfRFxuHuoBwOz5Z1FVeRxzzOltNo5nERRZ22EJ5pW0UbA
	 fSUuHdh1iuzB0/ssrCJWs0CTtN4iPEpyDCvj7MPa8uIsja2c5cyM7k962Vsx/KAVSqvXu
	 mEerPjBvum0ew9H7tI0BmVhedFDuFf7vrKwY3El5pytxvgy1tIZdA7WC2qFweN/GBCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNsRHqFr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D619606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNsRHqFr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFFB1F000C6
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423104;
	bh=olsXRWb2mJ7alyZvuOZMo0SuIvMzdv85vW212okoksM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=jNsRHqFrwpVJ5pa0h+vkOLJCrJd3VzNadiI5uMKOD+UJoUzByZlneH1ozBfPQjEJr
	 nF4uuxQevHqZ1O0jK63Q3XS7STMtYeGbqk6ZLmYnkQdCV/CNyfkCnuRQuRavo8CCg8
	 2Tq37Um1pshYzVbF3FGG0zDjIm7I88Yubsm0pNCo4XS6/22N5ZKjmG13yMgtIF1xP1
	 +TazNqN8iEfxCgjX6pjyCVZ3t2KI9MGC4rkRvlk8/W7F4FKUziLHwLyhCOLyCPnipS
	 nlWl+2IYpVDK1DRfOdTvGCkS4phMhbFR53BpL1QirTKfdGQ2pJzyWTgpVfgbVagHM5
	 Hqjm4IqO2IWnA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acef9307c7so23619981fa.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:38:24 -0800 (PST)
X-Gm-Message-State: APuU4Z/SnovPqkILDXhQkWiEyOVY0uLElmCbYHog4Bn16YvOLHczcdZC
	z0Oy2MChLWlw1nldFY9VnNjcx9v9H1naYnPAsYm66LEej7KmvVVliezNr08VSHAQ0cDZhuOkqOo
	C6oZl89IT1gmPnBirAkYet/ri8BUYNt8=
X-Received: by 2002:a2e:a98b:0:b0:3ac:dd62:754d with SMTP id
 38308e7fff4ca-3ae7fa550a8mr26835181fa.17.1795423102935; Mon, 23 Nov 2026
 00:38:22 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com>
In-Reply-To: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 16:38:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WJg8hR8eoqqbV=n-0qPVE5ARBG3mKU3+sR4nDmp_btw@mail.gmail.com>
X-Gm-Features: Aa3M54rw8DU2heO0ApwbPBuztkO0RFtLTwf07gI6P_fCHDM9IZ-pHgQkG53m6j0
Message-ID: <CAGb2v64WJg8hR8eoqqbV=n-0qPVE5ARBG3mKU3+sR4nDmp_btw@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Belarus (BY)
To: RFAREAS Support <support@rfareas.com>
Cc: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:14=E2=80=AFAM RFAREAS Support <support@rfareas.co=
m> wrote:
>
> From: Valery Belousov <support@rfareas.com>
>
> The BY entry has no source and allows 5490-5710 MHz at 27 dBm, which
> is not permitted for licence-exempt use in Belarus.
>
> Licence-exempt Wi-Fi is set out in Resolution No. 9 of the Ministry
> of Communications and Informatization of 1 July 2013, the list of radio
> equipment operated without a frequency assignment permit. Items 7 and 8
> were replaced by Resolution No. 13 of 29 August 2016; Resolution No. 1
> of 10 January 2018 changed "output power" in item 7 to "e.i.r.p.".
> All three acts are published on the National Legal Internet Portal
> pravo.by.
>
> Limits as stated in the resolution:
>   item 7, 2400-2483.5 MHz: 100 mW e.i.r.p.
>   item 8, 5150-5350 MHz and 5650-5725 MHz: 200 mW e.i.r.p.
> Both items: IEEE 802.11 equipment installed inside buildings,
> structures and vehicles, not using antennas installed outside them.
>
> Changes:
>  * 2.4 GHz: 2400-2483.5 MHz, 100 mW, NO-OUTDOOR.
>  * 5150-5350 MHz: 200 mW (was 20 dBm), NO-OUTDOOR; DFS is kept for
>    5250-5350 MHz.

Assuming the DFS requirement comes from ITU-R Resolution 229 /
ETSI EN 301 893, then the TPC requirement also applies, and since
Linux does not support TPC, the -3 dBm reduction should be applied
for 5250-5350 MHz.

Could you check?


Thanks
ChenYu

>  * Replace 5490-5710 MHz with 5650-5725 MHz, 200 mW, NO-OUTDOOR, DFS.
>    The band is 75 MHz wide, so the maximum bandwidth is 40 MHz.
>  * Add the sources.
>
> Item 18, added by Resolution No. 2 of 24 January 2019, also lists
> 5785-5875 MHz, but only for use in Minsk during the II European Games
> 2019, so it is not included.
>
> Signed-off-by: Valery Belousov <support@rfareas.com>
> ---
> Found while cross-checking wireless-regdb against the national acts for t=
he
> RFAREAS Wi-Fi regulatory map (https://rfareas.com/blog/tools/wifimap/).
>
>  db.txt | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/db.txt b/db.txt
> index 43dc0b3..e416c54 100644
> --- a/db.txt
> +++ b/db.txt
> @@ -386,11 +386,21 @@ country BW: DFS-ETSI
>         (5470 - 5725 @ 160), (250 mW), DFS
>         (5725 - 5850 @ 80), (24), DFS
>
> +# Source:
> +# Resolution of the Ministry of Communications and Informatization No. 9
> +# of 1 July 2013 (radio equipment operated without a frequency assignmen=
t
> +# permit), items 7 and 8, as amended by Resolution No. 13 of 29 August 2=
016
> +# and Resolution No. 1 of 10 January 2018:
> +# https://pravo.by/document/?guid=3D3961&p0=3DW21327720
> +# https://pravo.by/document/?guid=3D3961&p0=3DW21631260
> +# https://pravo.by/document/?guid=3D3961&p0=3DW21832737
> +# Both items allow use only inside buildings, structures and vehicles,
> +# without antennas outside them.
>  country BY: DFS-ETSI
> -       (2402 - 2482 @ 40), (20)
> -       (5170 - 5250 @ 80), (20), AUTO-BW
> -       (5250 - 5330 @ 80), (20), DFS, AUTO-BW
> -       (5490 - 5710 @ 160), (27), DFS
> +       (2400 - 2483.5 @ 40), (100 mW), NO-OUTDOOR
> +       (5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
> +       (5250 - 5350 @ 80), (200 mW), NO-OUTDOOR, DFS, AUTO-BW
> +       (5650 - 5725 @ 40), (200 mW), NO-OUTDOOR, DFS
>
>  country BZ: DFS-JP
>         (2402 - 2482 @ 40), (30)
> --
> 2.43.0
>
