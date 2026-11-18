Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991826;
	b=lwBnH98Ugqr0uVeQHP/rr2ZesuVG58/IoFQ2OQ0xA9X4aOS4qSu6grwlZ+hw27L1BCgj
	 w/EFm8vCL4abhDgSRcv98tY0VMVQPmS9y5UI/Fwbt7zGg/9X6Kd67tUwaI0Xw2m3nLJWB
	 3oj7v7GKkUiKwYlMNYWCaAbV3B5UXhRytu8pUHmfc0PMFEtwbZJ4XHARd1brRydrHBqNV
	 hdxh2s2TppXth146T94Lga1P1QyfjuDOW41ngug/73EzaNik+uWvu+nW5cYojMSsjP76J
	 tgdnu/97ENerxsYuCBrb03hxadhim6o9XAOYxZ5dq/yfjfegbSGkyLPD+egF0LZSK+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sD+bIoRz8GSGZGb/cjsEW5lHo1+Z38kAtGEg6TMj/w0=;
	b=IBWEItwnoSH3WZL5tL+BFwsX+ZpPxuDtDCxjTxwFQpG/Ww70HV5q5fcGvLUO8FiYuN9B
	 ZsJT62t41E9+4n7vZFANodJnvjW2amI/wP063mjRNmQTR8X3YZ59nYfCm2mPYxDpb8E7c
	 neeOknlkvI6SbKK67Hro1h5p4T7+SqB83Kx2KpBA8Bgr1BMCflMVMrZU9VdKObT+4mScS
	 J2gpIefmThI6RjyuDOuAYLPVD57ebe2Bash7DIs53o+j+w4xER2ujgNBPM+hIDVxx4dIr
	 pC8oe+Rcq+LJ8OJ7b6zzgfEwIUdm4szS133ptM639x4WIC35kM+vfvztSTnATwNzhpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fh5JX+pm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC95606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fh5JX+pm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DABE1F000C4;
	Wed, 18 Nov 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991825;
	bh=sD+bIoRz8GSGZGb/cjsEW5lHo1+Z38kAtGEg6TMj/w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fh5JX+pmJips/oj3BqIazAtFzhTUNpfIpytmAZTj8TIC20Tm3w9lkI4ybhcAe/DVx
	 zBoHzT0eFXnJTVUbNeCpi0K2EZwHAgt8vnfG4H7QEm13953Vsu2I2DmAQMZXk+I68h
	 byQnpGc/m/RVb1mqnh+yZRk1JHJHSsVsOxkqyb74NdaQPjwFDVXrLhEB8+TndakWgV
	 OvuFZXcr5ZvneSfJtEUaeMizLNHdzKCYLZTUQdDwiY6qKXeDgGwfPItxDxAR9p2ri+
	 rCZ5NzzJy4AWDAcdv8RhfbiN+aSA1p8tQYb19BZTmH85dSVu2Ag3ybbf6WvoGMu/SH
	 xDSshnmrr8dWA==
Date: Wed, 18 Nov 2026 09:50:23 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 11/19] wifi: mt76: mt7996: set qos_ctl of a
 frame that hardware reordered
Message-ID: <av1mz3bO5hfltI-w@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-11-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="ZdhV9Ybr80aqfO9I"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-11-nbd@nbd.name>

--ZdhV9Ybr80aqfO9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Felix Fietkau wrote:
> mt7996_mac_fill_rx() returns before it sets status->qos_ctl for a frame
> that the hardware reordered. mt76_check_ccmp_pn() then checks every
> such frame against the counter of TID 0, so frames of different TIDs
> read as replays.
>=20
> Set qos_ctl for these frames as well.
>=20
> Fixes: 950d0abb5cd9 ("wifi: mt76: mt7996: add wed rx support")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 2e1d98bf823a..c70e429ab419 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -707,12 +707,15 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt7=
6_rxq_id q,
>  		}
>  	}
> =20
> -	if (!status->wcid || !ieee80211_is_data_qos(fc) || hw_aggr)
> +	if (!status->wcid || !ieee80211_is_data_qos(fc))
> +		return 0;
> +
> +	status->qos_ctl =3D qos_ctl;
> +	if (hw_aggr)
>  		return 0;
> =20
>  	status->aggr =3D unicast &&
>  		       !ieee80211_is_qos_nullfunc(fc);
> -	status->qos_ctl =3D qos_ctl;
>  	status->seqno =3D IEEE80211_SEQ_TO_SN(seq_ctrl);
> =20
>  	return 0;
> --=20
> 2.47.3
>=20
>=20

--ZdhV9Ybr80aqfO9I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1mzwAKCRA6cBh0uS2t
rE03AP9TrYvsdTfkrTH4m6hsq8U8SMscnf8XugLgrdUI+1swNgD+LPjBs1KHjBUd
n3kfUfVhnm4zlyu8tDb2py8YRw41Sgo=
=+PuT
-----END PGP SIGNATURE-----

--ZdhV9Ybr80aqfO9I--
