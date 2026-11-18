Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992248;
	b=RrNozYGIQbV3miexgOZeKKBvWlBQqf1PlPu4hlWIN36C/tTm5hv1KDYe3mL/LE8eXBfs
	 AW0qOWH697j6cQ4DaM4eKKYDXcd/+FvXhxSQ2NxljlL3SVZ2i+l0UyS2+xEFZwLrhkt6M
	 iNyDsB2oW/NYd6olM7rjioeA8zkJKd5Wj8FtAgkLNWNfNkFMgRJb2rG15fYoiObrpkxSP
	 odxRn3aZgkZ+26C0xOOqviL7iD+DeAKJOyshKqk90nIUdV3k5B7x6ku86wScXHoqMHB03
	 I7s0d59iW5oNXgMDD3oglEhsLliPaIBvDwD4Ff2iY2Y8vIihVANmW8aD4hOzWpZU2pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992248;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dmQxU4nPempJgIaOZdEQsgOybXBiKtgCdEn6e8Lqows=;
	b=Y1W4H7YHiGz+/Gr2xUvEb0+LilpRxoy4qzl0cYxuAYw4bftsU3XbnW0Zc+qw46oxcqFu
	 uqW0pIBdWV37EUHfC+B4cNgB8qoH9sSnbJdF+Ipt0fTQPERKjo6fy2i1QVpWYXD4ET/z/
	 ZA5GUwzEGNDZFiD7WJiSyiactfIhGNkIROaEXLbFBDbgBu9Spzn7/epdARtYK7zeLjQtr
	 lZbZ/DlBhvXcfmFEknUP2kTdjad70gHNs5vucliZM15h6ajnkgbCejkoBYJS5RiSBVVHX
	 LnPayC+MCnsH3tkD7IO0shEl7iSlBqUNpjYJaXAtxgbuYVjB4NA9TbNyWevqcd+shPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdzMXuFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2367606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdzMXuFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896A41F000C4;
	Wed, 18 Nov 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992248;
	bh=dmQxU4nPempJgIaOZdEQsgOybXBiKtgCdEn6e8Lqows=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VdzMXuFfFfYkbL2SZ5zE/1jGjlbm0y/E1kLKid291Ac9QdpJ69oX+6WzGG/FLZLkw
	 A+oV1kFE1YSAUvablmS+kGhKtYF67aFkMuux4bJoPc3yXIrmAGJ45Ui5+uJlojJd7a
	 po9PDmcNnjxfsbs++sJ47U5RQyUsTTerUPo6ta+MkALzg34KonDNyXrHezgcqf2qE4
	 XZXNeuTNK8fOnExwdRMp6cuZh3nozwAJoYe+HI/6J4uObYxIMqlx8FQfqBXlegnisn
	 o0So7fKUHulyRcdjdEqg8lgkkOdZZbNESRMkAtRcm6l/8ezFuUnWceasNK/Eb3MQ+e
	 4oOyohoRKgOqg==
Date: Wed, 18 Nov 2026 09:57:25 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 19/19] wifi: mt76: mt7615: take each polled
 station under sta_poll_lock
Message-ID: <av1odUw33kHzwox1@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-19-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="S7HvMrqLfNdOX21q"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-19-nbd@nbd.name>

--S7HvMrqLfNdOX21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7615_mac_sta_poll() tests its local copy of sta_poll_list and reads
> the first entry without sta_poll_lock, while a station removal takes
> the wcid off that list under the lock. If the removal takes the last
> station between the two reads, the poll takes the list head for a
> station and writes its airtime counters to the stack.
>=20
> Test the list and take the station off it in one locked section.
>=20
> Fixes: a621372a04ac ("mt76: mt7615: rework mt7615_mac_sta_poll for usb co=
de")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7615/mac.c
> index ada40b8a517a..8e81ebe3e2ca 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -905,13 +905,16 @@ void mt7615_mac_sta_poll(struct mt7615_dev *dev)
>  	list_splice_init(&dev->mt76.sta_poll_list, &sta_poll_list);
>  	spin_unlock_bh(&dev->mt76.sta_poll_lock);
> =20
> -	while (!list_empty(&sta_poll_list)) {
> +	while (true) {
>  		bool clear =3D false;
> =20
> +		spin_lock_bh(&dev->mt76.sta_poll_lock);
> +		if (list_empty(&sta_poll_list)) {
> +			spin_unlock_bh(&dev->mt76.sta_poll_lock);
> +			break;
> +		}
>  		msta =3D list_first_entry(&sta_poll_list, struct mt7615_sta,
>  					wcid.poll_list);
> -
> -		spin_lock_bh(&dev->mt76.sta_poll_lock);
>  		list_del_init(&msta->wcid.poll_list);
>  		spin_unlock_bh(&dev->mt76.sta_poll_lock);
> =20
> --=20
> 2.47.3
>=20
>=20

--S7HvMrqLfNdOX21q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1odQAKCRA6cBh0uS2t
rFPNAQDTH1XjHvT4WSXh+XAoiILHzgTGD4Vw+UWhoXsBgZ4bogEAwj0w5wAO8OkV
D+hIaS3yQp+6ouWuUbNwiDAU5eWr+wo=
=YvPI
-----END PGP SIGNATURE-----

--S7HvMrqLfNdOX21q--
