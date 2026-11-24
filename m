Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502737;
	b=UPD/mgdakGDJTje4wBxZb7eHgwrGPpb8NZeDj6dk9IDepHGonPKyOGaD+mpZvhf1Cjoy
	 EvS8xjRf6PMWMnHGM2wt3wNj/vLY329vsYRKJfOZauF18h2ctBC8n507o5O87T7az2JYQ
	 mSGyupypytmrt7YlOPa5ZYLwI4Zud0icv4aLj8My9sRATQEh/TZJ0TJdVqajTlBu462oQ
	 Pm0yxRfED9+mPQFDs3aXPp4x8OrLSWiPWkAscjHa6UD1DVedMzb0XbKxV9a+7Qo6y4wQS
	 l9LH9XQP0qL3bAyOxiu7/+EL+yv3BsK5d/rFyj6soYKsZ7YLEPwYZKrH/p9+swwwv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502737;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=joTLPSe1FtOBg5/kidr98NS73DbLAuvGrAAITCxqqZo=;
	b=tL8n0VhUwKA+iflJOqPdNpVv0LM5+LaAGChAb62SRRr0utPW2I+uQN+NB0iNez0cazeW
	 CJLX7K/aJNXVi+gIOsZdmWi+XiLcdVe7RNIlOA8SwpaLMQEqWhq6zvrEJK8+8Fx0FP59d
	 7XiP5zrnMKSybetnPWC5CHEnZlaVTwsDr3swCtQIoHsKXUE6dnpJFZJ7KnMcBFi6HlDmM
	 x/PfvZaAnY1OacEpSwELx2PWsgM3GwR3hV2mV+C6KhrvdIL5coidgH+ftvB+8MLAvt4GI
	 fDkLeXfYdSEgGKGU6jbVK0fNdekJ0hhWW0K6T4572cpV9Os8v/y0nydlrUny1plzFlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGAYry3v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95884606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGAYry3v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306801F000CA
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795502737;
	bh=joTLPSe1FtOBg5/kidr98NS73DbLAuvGrAAITCxqqZo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=oGAYry3vgkcRJfirO5sg4BridMiDJYjI/EsjUNyWS8xiadjcFGEXdKLbxqDXXmQ8r
	 Dr7k7zJM2tDl3SnmyiU2rLgu8OSUqCkLH9HLANQzH+OPbdhMns8W97H2Lg3Fs/y4eN
	 XYkYJXMXqimQpTF0onEa3spqBgLAgorlVKezuba4aqpWo+fZFb2c4EJ2ekI/pIIklR
	 g/qXL5j2UZUEqiYI8DW5MwsHe6PP42SwezgEkDq1tZfNGaflBGSdWQDgYSjPe1wZRk
	 NOO14FASQurT5AnNTEmCM9hh9ZtI/gGwfnUes5Hoq5W+BFB5/NAXR9CHyIiBqCYn6t
	 7xavPbSQWKcFA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so37535911fa.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:45:37 -0800 (PST)
X-Gm-Message-State: APuU4Z8IUbectWmeOsBDA8V6X3ubxfrnS7/bBSb/U9KjCTNdQoUlRQgR
	Y/AervtELTcjxLMrQGCIcCd4ExTnvw+vir/0+hdu/zni7U2ybgaFJxgYb8XRkyOR2Uhsn8W5E8+
	QkEBg2MjvSpSM5j20qgmUItjZU10A0+4=
X-Received: by 2002:a05:651c:1585:b0:3ac:ff0a:9d85 with SMTP id
 38308e7fff4ca-3ae7f9b2233mr38998981fa.7.1795502735660; Mon, 23 Nov 2026
 22:45:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com>
In-Reply-To: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Nov 2026 14:45:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HFxk90gUKbtf-MbZX1dhYrpH5RT_JCWRzpUxOwpnxnQ@mail.gmail.com>
X-Gm-Features: Aa3M54pBrNYSHw4RKERlK31f1WdWnZmEZPk3AhNIzuNV86bKE809JXT37QmJ9U4
Message-ID: <CAGb2v64HFxk90gUKbtf-MbZX1dhYrpH5RT_JCWRzpUxOwpnxnQ@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: Update 60 GHz rule for Ukraine (UA)
To: RFAREAS Support <support@rfareas.com>
Cc: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:15=E2=80=AFAM RFAREAS Support <support@rfareas.co=
m> wrote:
>
> From: Valery Belousov <support@rfareas.com>
>
> The UA entry allows 40 dBm in 57-66 GHz. The current list of radio
> equipment used under general authorisation in Ukraine, NKEK Resolution
> No. 361 of 3 July 2024, allows MGWS (WAS/RLAN) equipment in 57-66 GHz
> under item 78 with a maximum mean e.i.r.p. density of 13 dBm in any 1 MHz=
,
> a maximum e.i.r.p. of 20 dBm and indoor use only (ETSI EN 302 567).
> The amendments to the list adopted since then (Resolution No. 32 of
> 28 January 2026, current consolidated version of 18 March 2026) do not
> change this item.
>
> Change 57-66 GHz from 40 dBm to 20 dBm (NO-OUTDOOR is kept) and add
> the source.
>
> The source cited for the 2.4 and 5 GHz rules (z0201-15) was repealed by
> Resolution No. 361 on 16 August 2024. Those rules are not changed here.
>
> Signed-off-by: Valery Belousov <support@rfareas.com>
> ---
> Found while cross-checking wireless-regdb against the national acts for t=
he
> RFAREAS Wi-Fi regulatory map (https://rfareas.com/blog/tools/wifimap/).
>
>  db.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/db.txt b/db.txt
> index f5b7cc1..07c3ef9 100644
> --- a/db.txt
> +++ b/db.txt
> @@ -2097,6 +2097,10 @@ country TZ: DFS-ETSI
>  # 2.4 GHz band channels can be used outdoors when some requirements are =
met.
>  # 5 GHz band channels must be used only indoors in some cases. They are =
neither
>  # permitted nor denied outdoors in others.
> +# 60 GHz: NKEK Resolution No. 361 of 3 July 2024, list of radio equipmen=
t
> +# used under general authorisation, item 78 (MGWS, 57-66 GHz): 20 dBm
> +# e.i.r.p., 13 dBm/MHz, indoor use only.
> +#  https://zakon.rada.gov.ua/laws/show/z1175-24

I couldn't open this one, but my LLM agent says it matches.

It also noticed that the 2.4 GHz indoor-only restriction was removed.
Could you check? If that is true, please send a follow-up patch if you
can.


Thanks
ChenYu

>  # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
>  #  https://docdb.cept.org/implementation/16737
>  #  https://docdb.cept.org/download/4685
> @@ -2108,7 +2112,7 @@ country UA: DFS-ETSI
>         (5725 - 5850 @ 80), (100 mW), NO-OUTDOOR
>         (5945 - 6425 @ 320), (23), NO-OUTDOOR
>         # 60 GHz band channels 1-4, ref: Etsi En 302 567
> -       (57000 - 66000 @ 2160), (40), NO-OUTDOOR
> +       (57000 - 66000 @ 2160), (20), NO-OUTDOOR
>
>  country UG: DFS-FCC
>         (2402 - 2482 @ 40), (20)
> --
> 2.43.0
>
> --
> RFAREAS Support
