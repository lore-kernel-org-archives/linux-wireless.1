Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502467;
	b=XxV0HImMprZ3z99LJOt2+8VzDZWYcndGIajf2CqHSocJf5fINXgk+akf68AzmoZDcn/e
	 9nZlrBEXQC7GPL+1zBaLvbj3vtD0F2bPXeYZYXSbvWj5hLqDR/e6fh3RGXDYby1bxc/ob
	 +zbDLTgdGKkO+ijvhz3Hsb22XxRxft+TFCkcjyrMc2SH1VydLB4mJmp0Zr37AVS5fOljg
	 TDy6nogbnnWiW6eI0VLDPqs1MWJY86KP+gIuvRVqQLRxtyFKwMe2syXJkWimgl1EXZ0fq
	 D+f8aGjTN25k999136REl560XOJ+wXINO/iP7jdaeDLS/yDlGU+CNP6jXdmTvPhuFhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502467;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RRfQhKttchyTzL2DUDqatrik9XZiWt92JJ2q1y9Xqto=;
	b=txEaUyhclEobYhON12q6WntvgvNx3DKmgXmDf5XHnPlTVHKoBQrulvxCo7C1upF1qo1b
	 G89m0yLH3wS6j1YfFPCtZ/4CLizuIPHXpcpkwOp29p7C9AIGUQeq3N1MDlb1nS7G36QZp
	 HgKthQHJWZ0XMvoJCfCsz3SWvzBzJXGzkEJ2yzhQHp36cP6yekYHNPhb544FOX5xbpU7m
	 JWEp/dR+ZkM6Hov/Tzt2J+qkLCGFnp76YU6V2p+wXS69/gZAYjHP7kGgo+1R50DE6lvED
	 SezFAvFE3ySv5Iww7fNN8JcAcpQQVZu7RDIuHHiwBIrnUHAYQo0zHv3ngJq4TlMFp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSFb3ReJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686F606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSFb3ReJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE64F1F000CF
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795502466;
	bh=RRfQhKttchyTzL2DUDqatrik9XZiWt92JJ2q1y9Xqto=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=nSFb3ReJp2I9t3CQ03x82mNhDgZ8qN/wCnwOlvQ+LfBf1LZxxNhq9quXrrgNZyql1
	 9GRKbOn/2hqiSnMYAYw33hiD0/nA4fE6mCbr9L5ZMa63OQkv3c1fGrQO/tC6jpNLe3
	 IWae5OAVDf3XGj4x9vYDd+G+fH0pEbhnGZqNcxTMryiWQJQ5CQ4J+hkga69FbLzLAD
	 Sn05G8NWccx65T5osb8cIv7EignnYnBS4IqzOExT31Lox0fOFizxocsae5IkBtmvof
	 YVyxh5aSZHHUkcGNx2Bu5fy3OBb2mgFTNtQsvpM0h1t1R7eyZtgzQJD4sW7bn/P1Vj
	 Ke8aAoEY2dVjw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a3374400so3315735e87.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 22:41:06 -0800 (PST)
X-Gm-Message-State: APuU4Z8Pj6oAnjQT9KVAkwwcZHw+7o09NpX8k9XOvrIpOT+tbG3VTqtG
	VZRD56bR8Yalfs/YZQIPizIBG6Y9Q1njn9nVZ5f+8bV+jd3d4Pxlts1VJCWkZfuDEG5oLi6bYsv
	vxd6CRvwsbxYt3cuAdKN6VQuE7mFB4z8=
X-Received: by 2002:a05:6512:131e:b0:5c1:ac60:71fa with SMTP id
 2adb3069b0e04-5c1bc81cf71mr3704573e87.49.1795502465109; Mon, 23 Nov 2026
 22:41:05 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com>
In-Reply-To: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Nov 2026 14:40:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-2yV6oUA--fnG=ndHrOy4Li7pdZrNf954AwSm_Xk+dw@mail.gmail.com>
X-Gm-Features: Aa3M54pCqL-6FHjaHOCn2xkt_WlcGPIc4N3tNLpgWQluXE2A3PzhWX7zgI70xjo
Message-ID: <CAGb2v67-2yV6oUA--fnG=ndHrOy4Li7pdZrNf954AwSm_Xk+dw@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Georgia (GE)
To: RFAREAS Support <support@rfareas.com>
Cc: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:04=E2=80=AFAM RFAREAS Support <support@rfareas.co=
m> wrote:
>
> From: Valery Belousov <support@rfareas.com>
>
> The GE entry has no source for the 2.4 and 5 GHz rules and does not
> allow 5470-5725 MHz, which is permitted for licence-exempt use in
> Georgia.
>
> Licence-exempt WAS/RLAN is set out in Table 3 of Annex 1 to the
> National Radio Frequency Spectrum Allocation Plan (GNCC Resolution
> No. 6 of 30 June 2006), as amended by GNCC Resolution No. 9 of
> 25 July 2024, published on the official legislative portal matsne.gov.ge.
>
> Limits as stated in Table 3 (all e.i.r.p.):
>   2400-2483.5 MHz: 100 mW, 10 mW/MHz for wideband modulations
>   5150-5350 MHz:   200 mW mean, 10 mW/MHz, indoor use only
>   5470-5725 MHz:   1 W mean, 50 mW/MHz
>   5945-6425 MHz:   200 mW mean
>   57-71 GHz:       40 dBm mean, 23 dBm/MHz, fixed outdoor excluded
> Note 3.2 requires DFS (as in EN 301 893) in 5250-5350 MHz and
> 5470-5725 MHz. Note 3.3 requires TPC in the same bands and lowers the
> e.i.r.p. limits by 3 dB if TPC is not used.
>
> Changes:
>  * 2.4 GHz: 2400-2483.5 MHz, 100 mW.
>  * 5150-5250 MHz: 200 mW (was 18 dBm), NO-OUTDOOR.
>  * 5250-5350 MHz: 100 mW (was 18 dBm, 5250-5330 MHz), NO-OUTDOOR, DFS
>    (200 mW with TPC).
>  * Add 5470-5725 MHz, 500 mW, DFS (1 W with TPC).
>  * 60 GHz: extend to 71 GHz as in the table.
>  * Add the source and the TPC note.
>
> 5725-5875 MHz is listed in the table only for EN 302 502 (fixed
> broadband data transmission systems), not for WAS/RLAN under
> EN 301 893, so it is not added. The 6 GHz rule already matches.

There is also a non-specific SRD entry for this range limited at 25mW.
Would that be usable? If so, please send a follow-up patch.

I will apply this patch for now.

> Signed-off-by: Valery Belousov <support@rfareas.com>
> ---
> Found while cross-checking wireless-regdb against the national acts for t=
he
> RFAREAS Wi-Fi regulatory map (https://rfareas.com/blog/tools/wifimap/).
>
>  db.txt | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/db.txt b/db.txt
> index f5b7cc1..ac9aad5 100644
> --- a/db.txt
> +++ b/db.txt
> @@ -808,16 +808,26 @@ country GD: DFS-FCC
>         (5735 - 5835 @ 80), (30)
>
>  # Source:
> +# National Radio Frequency Spectrum Allocation Plan (GNCC Resolution No.=
 6
> +# of 30 June 2006), Annex 1, Table 3 (wideband data transmission systems=
,
> +# including WAS/RLAN), as amended by GNCC Resolution No. 9 of 25 July 20=
24:
> +#  https://matsne.gov.ge/ka/document/view/6234066
> +# Note 3.3 of the table requires TPC in 5250-5350 MHz and 5470-5725 MHz =
and
> +# lowers the limits by 3 dB without it. 5725-5875 MHz is listed only for
> +# EN 302 502 (fixed broadband data transmission), not for WAS/RLAN.
>  # Harmonized CEPT countries for 6 GHz (ECC Decision (20)01)
>  #  https://docdb.cept.org/implementation/16737
>  #  https://docdb.cept.org/download/4685
>  country GE: DFS-ETSI
> -       (2402 - 2482 @ 40), (20)
> -       (5170 - 5250 @ 80), (18), AUTO-BW
> -       (5250 - 5330 @ 80), (18), DFS, AUTO-BW
> +       (2400 - 2483.5 @ 40), (100 mW)
> +       (5150 - 5250 @ 80), (200 mW), NO-OUTDOOR, AUTO-BW
> +       # 200 mW with TPC (note 3.3); Linux has no TPC, so 3 dB less
> +       (5250 - 5350 @ 80), (100 mW), NO-OUTDOOR, DFS, AUTO-BW
> +       # 1 W with TPC (note 3.3); Linux has no TPC, so 3 dB less
> +       (5470 - 5725 @ 160), (500 mW), DFS
>         (5945 - 6425 @ 320), (23), NO-OUTDOOR
> -       # 60 GHz band channels 1-4, ref: Etsi En 302 567
> -       (57000 - 66000 @ 2160), (40)
> +       # 60 GHz band channels 1-6, ref: ETSI EN 302 567
> +       (57000 - 71000 @ 2160), (40)
>
>  country GF: DFS-ETSI
>         (2402 - 2482 @ 40), (20)
> --
> 2.43.0
>
>
> --
> RFAREAS Support
>
