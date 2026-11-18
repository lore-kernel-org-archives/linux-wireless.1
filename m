Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994925;
	b=Mpkf4WGlsExy++5twlynln6D/4KPExWWBPySoW7ZC/iKcYZYamYPxO3vt87URnIHYZ5h
	 jUGoEW7mfbkBjrIWl5kU7lYmy/knErMu7Gyyktv8mRyZ5xxIna7zwLJVpiffVpZK/oWZI
	 3aSeT+aqd5kR2pfBINfLXCIPAH3iiC1vilEzsWo5TbyHFu7F+A6dKUczGHf1QKJJ+54XM
	 Vk4gyhDRVq5Y8hpnvwV2vzRfAwYqPgRY4pKJ786FOAfqe7Xls5C2f+EFYpTzNPpaSXmOc
	 yRg73bXk8+fXKXxjaUClTcBH2N3PgxX6CDvaxeR3YXxdBx4jmukbwYgEnY7aNq9y0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994925;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eYeCugMbRYyvGt+DwcZ7cncdd8zoPpPtaruTznr5YFE=;
	b=X5UJYXjxXkDpby7/43yfFhMTrEalRL5hnhnpSOZPN8CDF+A84gugBJWprmoOYxojRa4F
	 6csyIsSxBov70zm2e6oWe7aL+CdPigRbYROV4vuVezYezDnj158AwLP/GR93b2ZaMtDN3
	 zAaJw/EoockhpFBmC/Dw0PB5QwkDAy6pzViWXQAz1QCFOSOr0zVRXHvWYwMbxXqFdFX9G
	 bbyw8m1lsCClLIH8cNBXUygNTyM51x0FLS5c3taNWqZU8iEbfRq2jh6Bea3zV/TH1rItL
	 BGBRGSVKIbMusk+85bff1mBd8/RaOP9c3k1dkIYcEoMhV697HUjIzeIDM4gcpep9ysQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQrgRcxd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF2606A332
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQrgRcxd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477BF1F000C4;
	Wed, 18 Nov 2026 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794994924;
	bh=eYeCugMbRYyvGt+DwcZ7cncdd8zoPpPtaruTznr5YFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQrgRcxdy5xtPttu6PiXi1sjU3JGwhpEp/4e7y+T5sOc4O1Qyty9eJK7l/gdZLPWU
	 kLPoJ8PHFedB5RFDv4EB1sdYP9EW6Rb1OOxNEMWpvdNmR+VObf3UZEpEsq1HAYMlpj
	 lo5HaUwS7FntYR7QLSUoXXaPa9A/7002A1qOhpdPfm0aD8/GuHia98n548KdfHRKME
	 CR7tQTFZITBGoNqwaZfIiFgFFATiNXxsDstieKHGxQMHinVVfeYtb0eek0UbKPsWCr
	 ZasSK7+RJOsJV9SmLLTfCLhHC9MDhkc0XwK4jlllJn9R/ZBNBxrZ8I51AlQD4tevVN
	 nNduoi5q9GZIg==
Date: Wed, 18 Nov 2026 10:42:02 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 09/19] wifi: mt76: find the first A-MSDU
 subframe behind the radiotap data
Message-ID: <av1y6mgMpXQcME8E@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-9-nbd@nbd.name>
 <av1lP1f9hczy7jt2@lore-qca>
 <81acd946-dc4c-4fa4-81a7-4df0b7cb06f2@nbd.name>
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
	protocol="application/pgp-signature"; boundary="WM16RNVdtvEkxK55"
Content-Disposition: inline
In-Reply-To: <81acd946-dc4c-4fa4-81a7-4df0b7cb06f2@nbd.name>

--WM16RNVdtvEkxK55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 18, Felix Fietkau wrote:
> On 18.11.26 09:43, Lorenzo Bianconi wrote:
> > > mt76_rx_release_amsdu() reads the first subframe relative to
> > > skb->data, which points to the radiotap data where the driver pushed =
HE
> > > fields or EHT TLVs. It then misses an RFC1042 header in place of the
> > > destination address, so an A-MSDU of an HE or EHT PPDU in 802.11 form=
at
> > > passes the mitigation of CVE-2020-24588.
> > >=20
> > > Locate the subframe behind the header that mt76_skb_get_hdr() returns.
> > >=20
> > > Fixes: 2c2bdd2372af ("mt76: validate rx A-MSDU subframes")
> > > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/mac80211.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/=
net/wireless/mediatek/mt76/mac80211.c
> > > index bd822193e769..271fbd4711f7 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> > > @@ -965,18 +965,21 @@ static void mt76_rx_release_amsdu(struct mt76_p=
hy *phy, enum mt76_rxq_id q)
> > >  	 * address.
> > >  	 */
> > >  	if (skb_shinfo(skb)->frag_list) {
> > > -		int offset =3D 0;
> > > +		u8 *subframe =3D skb->data;
> > >  		if (!(status->flag & RX_FLAG_8023)) {
> > > -			offset =3D ieee80211_get_hdrlen_from_skb(skb);
> > > +			struct ieee80211_hdr *hdr =3D mt76_skb_get_hdr(skb);
> > > +
> > > +			subframe =3D (u8 *)hdr +
> > > +				   ieee80211_hdrlen(hdr->frame_control);
> > >  			if ((status->flag &
> > >  			     (RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED)) =3D=3D
> > >  			    RX_FLAG_DECRYPTED)
> > > -				offset +=3D 8;
> > > +				subframe +=3D 8;
> > >  		}
> > > -		if (ether_addr_equal(skb->data + offset, rfc1042_header)) {
> > > +		if (ether_addr_equal(subframe, rfc1042_header)) {
> >=20
> > maybe I am too paranoic, but should we check this is part of the skb he=
ad
> > running pskb_may_pull()? Otherwise I am fine with the patch.
> This is only called for hw-deaggregated A-MSDU subframes, and each subfra=
me
> has its own buffer. Even if the hardware were to misbehave and pass a
> truncated subframe here, the pointer would still be much closer to the st=
art
> of the buffer than the end, and never overflow.

ack, in this case:

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> - Felix

--WM16RNVdtvEkxK55
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1y6gAKCRA6cBh0uS2t
rF+iAP4iY40Lf4apJqM6txbuWiiSNPFdwZwYYbHL7f3b6Pr3HgD8CZOgrCd54aWb
PtZa8b8Cyfho+SGnxd8p5GgDxTsDRQQ=
=Uuog
-----END PGP SIGNATURE-----

--WM16RNVdtvEkxK55--
