Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991426;
	b=p+I9qgmwUu/Y4wIFjmxN1bItKScq2metdvF5PR6V0CSi4x6H7PP4jTQk35ibu2pcHpTd
	 Zj4OF/vlvxMgdDB0/D2aqkXUT347ahqAJPGlCrCqCk362Sff4ZQkfD7WP1iTbu5v77fzY
	 n7S/Gtha+Ym+qmaLKRFeJVVcHnsZQvXCAmMXW5aPmy9zTzdsfVf+H647KD+djJLj/ffM9
	 BmsIvWACk5SmmNEyv46FCP33ejF/CeAELTUHdX6O5Stip915OGtJ2+/WRWTTN8BSRkl1D
	 /0V8oWBan8ecujl/E2UlHDoDBqmZ+zOUYhmqYmS1Mvz7NpDtJDNt2mhstmaLCJUJidA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=viiCgMX5FxsuCwRaeZrTbp3S05gcv3mKnSbOwj67rpc=;
	b=2SZSJvlpaGvx9Pdig5B+dpZVdqgN9pb69dryuGsaRGtSSCU8rF51xbhOJ6krZ87te7/S
	 lJ6c/8Cj/fUuAvtheR3uMBU7SWieHl+PRYSQpLh2EIYq7Z4mBuFJ5wbtBdRYaGv++rgny
	 eOr072kg0FTK/xNZasLSx8AUZ7f/rQ6yxlCarC5Kn01reMtwIxdMez3l7H8JGMC/KL9ZW
	 HcwQPV0Te2rsTuHYqjl+qfexJxncGfdSiXYxj0IlRGYEWFqpMy3Pe4O7+fmqf5NLLK3kM
	 tJJcd1ABvVQ2nWnaz4PJCdMyXqePfDWrDyyG69NDl+hnrFyt8r7VEd4j8rcR8T+f9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtElFPu2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC8606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtElFPu2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BAF1F000C5;
	Wed, 18 Nov 2026 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991425;
	bh=viiCgMX5FxsuCwRaeZrTbp3S05gcv3mKnSbOwj67rpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JtElFPu2cxYYxHakf0ZLF5VZTl8SLYfQDSdKeWUEbXo7pXwkec7/vgvUtWZJiXkGn
	 kfoyUbvwBie568naso/5IaFvl/TEs2XKPkprtV6fOngB88ZsOPNYFEKbIwka/XREwg
	 NmYXZtCZppM5wLe1ooJdbbP98Kh+w3e6BlrYd4vcMi5n3+ssMRWOTVShzRLTFrres5
	 mcOFO4XhJTZLHdtkKuI9IJUXeiRxCf7A47e7aner8cFJ1nNdP8fN+guRexrgKbMaAB
	 DEfhQaLq/Ob4batZsoeEpnYkvqoSSGLRsEHPqAYAfbGT1AqrsRLc5HAkwWO73DOB/T
	 q8LwCASPKjZgQ==
Date: Wed, 18 Nov 2026 09:43:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 09/19] wifi: mt76: find the first A-MSDU
 subframe behind the radiotap data
Message-ID: <av1lP1f9hczy7jt2@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-9-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ppVBUBjNqrtGuBqH"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-9-nbd@nbd.name>

--ppVBUBjNqrtGuBqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt76_rx_release_amsdu() reads the first subframe relative to
> skb->data, which points to the radiotap data where the driver pushed HE
> fields or EHT TLVs. It then misses an RFC1042 header in place of the
> destination address, so an A-MSDU of an HE or EHT PPDU in 802.11 format
> passes the mitigation of CVE-2020-24588.
>=20
> Locate the subframe behind the header that mt76_skb_get_hdr() returns.
>=20
> Fixes: 2c2bdd2372af ("mt76: validate rx A-MSDU subframes")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index bd822193e769..271fbd4711f7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -965,18 +965,21 @@ static void mt76_rx_release_amsdu(struct mt76_phy *=
phy, enum mt76_rxq_id q)
>  	 * address.
>  	 */
>  	if (skb_shinfo(skb)->frag_list) {
> -		int offset =3D 0;
> +		u8 *subframe =3D skb->data;
> =20
>  		if (!(status->flag & RX_FLAG_8023)) {
> -			offset =3D ieee80211_get_hdrlen_from_skb(skb);
> +			struct ieee80211_hdr *hdr =3D mt76_skb_get_hdr(skb);
> +
> +			subframe =3D (u8 *)hdr +
> +				   ieee80211_hdrlen(hdr->frame_control);
> =20
>  			if ((status->flag &
>  			     (RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED)) =3D=3D
>  			    RX_FLAG_DECRYPTED)
> -				offset +=3D 8;
> +				subframe +=3D 8;
>  		}
> =20
> -		if (ether_addr_equal(skb->data + offset, rfc1042_header)) {
> +		if (ether_addr_equal(subframe, rfc1042_header)) {

maybe I am too paranoic, but should we check this is part of the skb head
running pskb_may_pull()? Otherwise I am fine with the patch.

Regards,
Lorenzo

>  			dev_kfree_skb(skb);
>  			return;
>  		}
> --=20
> 2.47.3
>=20
>=20

--ppVBUBjNqrtGuBqH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1lPwAKCRA6cBh0uS2t
rOpeAP4kNvAEvDbcBA6iRVCt7yNM1Tx5RWvCgA+2WZnG2ccxAQD/atIzwruLYUAE
gTYGzWXEMN4heyOgHTB0DHyV1l8dPAU=
=OFVo
-----END PGP SIGNATURE-----

--ppVBUBjNqrtGuBqH--
