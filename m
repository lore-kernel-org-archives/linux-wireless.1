Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422784;
	b=RpblIjY15FVLIo9if7DQ04V/Lqhf2jc9f/MJHFF3xYqeyJRNzHsMkKo4ncJeqrsnKPwh
	 JKvlRFn9SDVYotuHQitz1n2wXV8u7vuUlCdakgl0+yzxnfBsvNSbfYAEqdHTcm01g2oCL
	 pmmAB6stOyuEUjqLTGnZkJQavfpqaNqxMRzU+jzqI9SpykWDpz1hO3MeaX4NLcopl5dd7
	 pu3+aDKvKRDVZjgjNfe1iSkUnQSOpMadcy3XTNjWk9jg/pkGPi8H2OP+tK1k/Px3GA0i3
	 33yBTTWzxl596YrOeKdG82tusxvD3IRxZUWhA6TWGBM4aQ9YCnA1iN9SmIsZcKgGBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422784;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=10mVHKBcg/+Uaagqs4hy6NfKuaxlv+YYpd7i/JHosR4=;
	b=OSrH1P+lOqpCicKQN5vIN1bv7J8kcS+UYxJBKiylIECR07ozkqqK7VJXD8b7y1i7bo+s
	 c7S6uIuoONRss2cZQqZ4SRmeXuAM1BLPvoyI0BH2k/1DO5SSM1cX2kCIu2lAqn+ideGiN
	 ylCK9hi+6dVv296F375gx9jqnTgE8+LPA6rNRxug6bWK0trL3QfkT5ygE1c39XSdjRrGV
	 Skiu0jgtpRVetodShmrRcpCtTZoOFBWc00PLUJFElcE6ci+Z4juWjl0caRkxtpHiWoCmU
	 HiUzjNaQXfuZfdUdTmW9WVbwdf08ThCiB6gsbFScBVm8TxKHHnkZz3lgTVXyi9e7/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6XJpRpJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E11606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6XJpRpJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16941F000D3
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422783;
	bh=10mVHKBcg/+Uaagqs4hy6NfKuaxlv+YYpd7i/JHosR4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=B6XJpRpJoybHwEeOLzF8DQMchMN9vQrEGPNQObXqA+IoaNx1dSY8N83hqONpBOVE9
	 ned1CadoJXIUXngvQafhSMCyWUHb+LW6yDw3GNjAu4mul3r12CAI/mbghpVB3aGx1E
	 zCCHziRiVb4jzoiUvCa3aeOfq2vnbKgsO+6v9Eafi+DJ68Yu4Dv4NNI5hTOzzAucKK
	 XuYRJ9oeFU257CzPZxRGqvJn3AZQ+znOTvvWz84de1UpFfymtZMuXPi/Ng1BLheNeY
	 PGUymdPdervh6O1qNxLXNG0XHelzdj2dLI9+ROVqb/MoOCp5QRZgVvm6HrmVtb0qKJ
	 6aK1V0S0PSKeA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3932008e87.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:33:03 -0800 (PST)
X-Gm-Message-State: APuU4Z/1qUVTdSWmAopSGTDRjsGyaoPFoVqL4A0dxqnX7xVqbsbnbx1V
	QdqDZV6puXKEk18xYqE+/NQ69c3hF+rokG58Cn/4I3gn/dwaKBm7UXh7HKsdmnUGuj21mtEu4Gd
	cKzp2F2LnY6FkLq0zFxlCqTGrCFQBSIo=
X-Received: by 2002:ac2:4bd2:0:b0:5c0:a67:e7d1 with SMTP id
 2adb3069b0e04-5c1bc7bda01mr3040959e87.12.1795422782139; Mon, 23 Nov 2026
 00:33:02 -0800 (PST)
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
Date: Mon, 23 Nov 2026 16:32:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v656LkoRqbzSLP9=JvWHjW1tpjwMUy=_zmKHCLAx4xDsgQ@mail.gmail.com>
X-Gm-Features: Aa3M54p_mbWN-4hEeJdayzUjU65l1M7XxkGc4ondbhtJ3C1dEwToX82b_cD-hC8
Message-ID: <CAGb2v656LkoRqbzSLP9=JvWHjW1tpjwMUy=_zmKHCLAx4xDsgQ@mail.gmail.com>
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
>         (5470 - 5725 @ 160), (100 mW), NO-OUTDOOR, DFS
>         (5725 - 5850 @ 80), (100 mW), NO-OUTDOOR

Not related to this patch, but this boundary setting makes the wifi
channel straddling 5725 MHz unusable. Could you send a follow-up
patch to move the boundary? See the US rules for an example.


Thanks
ChenYu

>         (5925 - 6425 @ 320), (200 mW), NO-OUTDOOR
> -       (57000 - 66000 @ 2160), (40)
> +       (57000 - 66000 @ 2160), (40), NO-OUTDOOR
>
>  country LB: DFS-FCC
>         (2402 - 2482 @ 40), (20)
> --
> 2.43.0
>
