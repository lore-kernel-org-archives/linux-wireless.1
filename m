Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992293;
	b=mM3NQKNiGk/xDUsuQO3w5Bv6EyvExCGH1UNi8RcFscNecY5fzFMzieSoxTp3DijHjw29
	 Ky0VL35ee42XLvIH+v9XtE1L1h9YVw+MSBnSMM4ICL86UqYJ0e6+5L9i4Yu6838C8KQld
	 ObMFWHPAMZ3+Nm6uGs0CUvIGWFFXmBQGPgloEvlhncoIAMe/mOmKFhW5VmcOLVosSK6l1
	 X0tuF+KG7MsazOW1rDWj2rfWg2O88dt1PyVXTIPj21k/wtZFEklJB36Tbx0I9NuCiSRAj
	 995IejM5ExjC/xPkHYLZsYCXOnILlw21XdfjGDLv7pRKV4UBlzJj8YWtMImb0AgYmxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992293;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uZRfyEEpRw+0xWpmMnvdikCB8hZmvtUZBLuyHkvZiak=;
	b=Q6nW8tL0vOBaFLr8BdzBWY7GzW/4832MYjaNQMsN6hyjE24uBWRn/1bNKqDa+TcJEEMG
	 G1LM7wC4bYyZRe2x+W0KK2Jcjm6CQjk50bbA+9XJwyfijx4yfDNEw7HRYjyGtAzfuIEdt
	 mqTEx2JdJYWmOi5kB3zYot6mKSsvARDSij+Tp7UokXHn04qGJpeoPxIIJZmcc/W/eUfFq
	 tZsYC8gf87tx0LK3h+tkyW1ITT/sGaRfoDRbEciQPawyN/A6cgyqDnN8XblvW4WxbUw/3
	 lPBh3OjBO8NRUeKatneFHjFdbngIOYRXaI/M+X0UTC5IDUnADh0P3qrSdDnEnPOO16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T19pulHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65F606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T19pulHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C931F000CB;
	Wed, 18 Nov 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992293;
	bh=uZRfyEEpRw+0xWpmMnvdikCB8hZmvtUZBLuyHkvZiak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T19pulHiINC0e6/lzkHVpF3cBHM/jNKxEP+U4qdBATvtfEMsvxeBEaG6OaVboUxyn
	 lvv0v1YqU2b6djE+Q9NxWOFImhtNss5GlgTgcjW7C7mOEJuhVwvXc/yBoB5LPWkAKp
	 PBg5cyeZcMbFAa2FcSHaorpQBW4G1W5Gt18dCI99xOAOOH/2fExqJVeOBiOUhf2loo
	 DvqSJAxMpVmxnjX3viqzAeeTsykTMGJVJElW/YDLmkw+OH8uvvse6NvxKIKyIkuu/r
	 y8RpFEzZVFKMSnzTZHHUsX8YwukaDe55mg/NTr3qGHjBLD9o2umDgWkxe14lY0Z4kn
	 hX2uJoCrVsbTw==
Date: Wed, 18 Nov 2026 09:58:10 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 18/19] wifi: mt76: mt7925: take each polled
 link under sta_poll_lock
Message-ID: <av1ooknLJakhO5Vg@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-18-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="gMH1sUJP3ABLn4kc"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-18-nbd@nbd.name>

--gMH1sUJP3ABLn4kc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Felix Fietkau wrote:
> mt7925_mac_sta_poll() tests its local copy of sta_poll_list and reads
> the first entry without sta_poll_lock, while a link removal takes the
> wcid off that list under the lock. If the removal takes the last link
> between the two reads, the poll takes the list head for a link and
> writes its airtime counters to the stack.
>=20
> Test the list and take the link off it in one locked section, as
> mt7921_mac_sta_poll() does.
>=20
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 5518960e1375..2528c2f5d717 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -54,12 +54,14 @@ static void mt7925_mac_sta_poll(struct mt792x_dev *de=
v)
>  		u16 idx;
>  		u8 bw;
> =20
> -		if (list_empty(&sta_poll_list))
> +		spin_lock_bh(&dev->mt76.sta_poll_lock);
> +		if (list_empty(&sta_poll_list)) {
> +			spin_unlock_bh(&dev->mt76.sta_poll_lock);
>  			break;
> +		}
>  		mlink =3D list_first_entry(&sta_poll_list,
>  					 struct mt792x_link_sta, wcid.poll_list);
>  		msta =3D mlink->sta;
> -		spin_lock_bh(&dev->mt76.sta_poll_lock);
>  		list_del_init(&mlink->wcid.poll_list);
>  		spin_unlock_bh(&dev->mt76.sta_poll_lock);
> =20
> --=20
> 2.47.3
>=20
>=20

--gMH1sUJP3ABLn4kc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1oogAKCRA6cBh0uS2t
rJPtAP9ge8DKtIap8AD4G2Y7ehJBynaE92kefFIqdRu4uKIi6AD+NOGn3AjC3ibU
Ih+3xXSzpbSk3S9MBLwioxePefyvVwU=
=Ylle
-----END PGP SIGNATURE-----

--gMH1sUJP3ABLn4kc--
