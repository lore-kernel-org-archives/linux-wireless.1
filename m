Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425510;
	b=auavD00XYAapGXmwy1GV2uH2WIivrZTiW0tVq6tN4Lw7lbZRvPktzWjFJwK85aC2Q1VN
	 PscsM+aCaE0YfgRYYZI8fQJuOQY0WBxD+DWq4csN+dGikgfsn2fYV6HQm0FJsM+5pNd7i
	 M0N0cDtHWy+MBwgRfrhj/mqvnwnkBAv3VA3zwACWKb8QWp2Lm0JiwK96NeKslT7xh1YsL
	 Z+UOGcNu0hhQNJt00eemm2U33rQqgjvq6UrHT+EtPvs8RNyId+QQIgcchllXJz6kCFPTf
	 WL7HhUh7MdoVDUCA8lD2mKXBWcsrnHzVVmRuzKSKzAKQOaw4D2UEKWfA0F5jApgbYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425510;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HwOXkLb5QykPXQC5MbpC4OgTE05cElAsD+vrDCINNyo=;
	b=jGtFvube1Jb01F6F3ivHI8Thd85sVEoqrPygYLEF7+Lq3ymUABrb/WV6emM5gp4SwKnm
	 c3QleR4fdAbUzg4bYTRXOfDknT6uyzt85C5yycpfDY81AusH+9nkT6XGeespgmwtZ5KBs
	 KmIvuU9Xr/LpT18I6ts9mv6Yn26TBeK8ADALu+rTVG8596vuxXZzlQYhdpZAfigrEFlBO
	 SB9Y3wba4CUIufBCi/z064yqPIAwu1NH/8bZqIXsTsOwelzijtog6DJtEOGKgWz3CTq2b
	 EQ9ThziRRTc+wTVvo1Z6zQvR4eR0RKVcxR8dmo1CoAhFhDlNjTpJM6IFdT6s3XavYdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C8pSt/+3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522AF606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8pSt/+3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AB01F0089E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425509;
	bh=HwOXkLb5QykPXQC5MbpC4OgTE05cElAsD+vrDCINNyo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=C8pSt/+3fIe09YyE7VhKqceLTSl5/6mta8+iS3gcEv8Qv/EArRkRMof1G5KhcKwjj
	 vfO2bCkI0w8tX7fa66YjBnoADGYM5bbLErTUljIrqjNjbwFKj7tZxnmIGAszMzopp9
	 gAmws+uPoqDjJZW0fTtrbwe9U15XsRxDs7YwsHEmeTTYV7XQdYNUKu0SwmRrcnD/W0
	 VV0wxkL/bY5M5LuD9Ehvc1zk05xqV1OIv1AFtztHMONJ3gt6pf5aPmfV1UYETLxwz8
	 1KHciLB5rXTfuQtvh2y6QliPZOfOyqbKoOYXwSdZKw83SFew4Dw2jQ45Tj5o28H9Ac
	 t9DC2E9dQ6m5Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adff684a52so24591651fa.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 01:18:29 -0800 (PST)
X-Gm-Message-State: APuU4Z8978vYWPyx7n52x5YgHsiBqnLSLEWRGp0O23abTZvsn2jK6HHH
	nM1QdqHnkTfVdlyEbNRG1TNszcuaM+82E36q/hvgW8K1SYRi1iYopDfB/10pfNhbTmntwVMShuA
	5CJsz24BY3ddNu9EHEEzTzX37R04ogOk=
X-Received: by 2002:a05:651c:a186:b0:3ac:dc93:c80a with SMTP id
 38308e7fff4ca-3ae7f7cbe04mr25345591fa.0.1795425508169; Mon, 23 Nov 2026
 01:18:28 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d390d8a7db9bf2ec0a920dc8e95aa551@purelymail.com>
In-Reply-To: <d390d8a7db9bf2ec0a920dc8e95aa551@purelymail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 17:18:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65SU9V8pkvxgOmsEfwTUDKMyDqypEUiZgkF5SKdGREh6w@mail.gmail.com>
X-Gm-Features: Aa3M54quQJIjGBxYIVuc528_lKM4eXMBVWA2nludE7CUjW_ksQEqw3HPC-O5XU0
Message-ID: <CAGb2v65SU9V8pkvxgOmsEfwTUDKMyDqypEUiZgkF5SKdGREh6w@mail.gmail.com>
Subject: Re: [RFC PATCH v2] wireless-regdb: Update regulatory rules for Chile (CL)
To: plabin@plabin.cl
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com, 
	wireless-regdb <wireless-regdb@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 11:45=E2=80=AFAM <plabin@plabin.cl> wrote:
>
> Update the regulatory rules for Chile (CL) based on SUBTEL
> (Undersecretary
> of Telecommunications) Resoluci=C3=B3n Exenta N=C2=B0 1.247 published on =
July 10,
> 2026, which establishes the consolidated and refundido text of
> Resoluci=C3=B3n
> Exenta N=C2=B0 1.985 (Norma T=C3=A9cnica de Equipos de Alcance Reducido).
>
> Source:
> https://www.bcn.cl/leychile/navegar?idNorma=3D1225920
>
> Key changes:
> - Change DFS region from DFS-JP to DFS-FCC: SUBTEL regulations align
>    with ITU Region 2 / FCC standards rather than Japanese MIC rules.
> - 2.4 GHz band: Align boundaries to 2400-2483.5 MHz (Article 1, j.1)
>    and update EIRP power limit from 20 dBm to 30 dBm (1 W).
> - 5150-5250 MHz: Align lower boundary to 5150 MHz, update EIRP power
>    limit to 30 dBm (1 W), and add NO-OUTDOOR as Article 1, literal j
>    strictly restricts operation in this band to indoor enclosures.
> - 5250-5350 MHz: Align upper boundary from 5330 to 5350 MHz and update
>    EIRP power limit to 30 dBm (1 W) with DFS (Article 1, j.1).
> - 5470-5725 MHz: Add missing band authorized by Article 1, j.1 with
>    DFS up to 1 W EIRP. Extend upper boundary to 5730 MHz to cover
>    Channel 144, similar to US, TW, and CA entries.
> - 5725-5850 MHz: Align boundaries from 5735-5835 to 5725-5850 MHz and
>    update EIRP limit to 30 dBm (1 W) (Article 1, j.1).
> - 57-66 GHz band: Add 60 GHz WiGig band at 40 dBm EIRP as authorized
>    for short-range devices.
>
> Signed-off-by: Patricio Labin Correa <plabin@plabin.cl>
> ---
> v1 -> v2:
> - Update source reference to direct link for Resoluci=C3=B3n Exenta N=C2=
=B0 1.247
>    (idNorma=3D1225920) which contains the refundido/consolidated text.
>
> Hi Chen-Yu, Ping-Ke, and linux-wireless reviewers,
>
> This is my first time submitting a patch, and I apologize for the wrong
> sources on v1.
>
> I prepared this RFC to modernize the regulatory rules for
> Chile (CL), which have remained largely untouched since the initial
> import in
> 2008.
>
> In Chile, major ISPs (such as Movistar) deploy Wi-Fi routers
> broadcasting on
> Channel 100 (5500 MHz) by default. Because the 5.470-5.725 GHz band was
> missing
> from country CL, Linux machines cannot detect or connect to these 5 GHz
> networks.
>
> This update aligns Chile's entry with SUBTEL Resoluci=C3=B3n Exenta N=C2=
=B0 1.247
> of
> July 10, 2026 (the official refundido and consolidated text of the
> standard).
>
> Before finalizing, I would appreciate your guidance on:
> 1. DFS region: I changed DFS-JP to DFS-FCC since Chile follows ITU
> Region 2
>     and aligns with FCC standards. Does DFS-FCC look right here?

Honestly I have no idea. I'm not that familiar with WiFi specification
details. But I suppose it makes sense.

> 2. Power limits: SUBTEL Article 1, j.1 authorizes up to 1 W EIRP. I used
> (30) dBm;
>     would you prefer explicit mW units (e.g. 1000 mW)?

Please use the unit from the standards / rules. So 1000 mW here.

> 3. Channel 144: I used (5470 - 5730 @ 160) to accommodate Channel 144,
> matching
>     conventions in US, TW, and CA rules. Does this look good?

Yes. But please also copy the comment over. And the previous range
has to end at 5730 as well. The database can't have overlapping ranges.

> Thank you for your review and guidance!
>
>   db.txt | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/db.txt b/db.txt
> index 7aff3fb..90a78bb 100644
> --- a/db.txt
> +++ b/db.txt
> @@ -455,13 +455,16 @@ country CI: DFS-FCC
>       (5735 - 5835 @ 80), (30)
>
>   # Source:
> -#
> https://www.bcn.cl/leychile/navegar?idNorma=3D1109333&idParte=3D9841504&i=
dVersion=3D&r_c=3D6
> -country CL: DFS-JP
> -    (2402 - 2482 @ 40), (20)
> -    (5170 - 5250 @ 80), (20), AUTO-BW
> -    (5250 - 5330 @ 80), (20), DFS, AUTO-BW
> -    (5735 - 5835 @ 80), (20)
> +# https://www.bcn.cl/leychile/navegar?idNorma=3D1225920
> +# SUBTEL Resoluci=C3=B3n Exenta N=C2=B0 1.247 (10-JUL-2026, texto refund=
ido de
> Res. 1.985)
> +# Norma T=C3=A9cnica de Equipos de Alcance Reducido
> +country CL: DFS-FCC
> +    (2400 - 2483.5 @ 40), (30)
> +    (5150 - 5250 @ 80), (30), NO-OUTDOOR, AUTO-BW
> +    (5250 - 5350 @ 80), (30), DFS, AUTO-BW
> +    (5470 - 5730 @ 160), (30), DFS
> +    (5725 - 5850 @ 80), (30)

As mentioned above, please use the units and numbers from the rules directl=
y,
so 1000 mW for the rules above.

>       (5925 - 6425 @ 320), (12), NO-OUTDOOR
> +    (57000 - 66000 @ 2160), (40)

I don't see a reference for this change though. Could you also add the
article and item number? It seems to be j.5? But j.8 also covers the
extended range of 57-71 GHz. And that also allows up to 43 dBm.


Last, please also send your patches to wireless-regdb@lists.infradead.org.
Otherwise I won't see them.


Thanks
ChenYu


>
>   # Source:
>   #
> https://wap.miit.gov.cn/zwgk/zcwj/wjfb/tz/art/2021/art_e4ae71252eab42928d=
af0ea620976e4e.html
