Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510388;
	b=L/r5QPfzyI6uNq1mtGu8Z/lUPjRXbUoVgQVjrXpv/JKvpsn2fsI3GzDP1Ah6t6Av5C/Y
	 YsJK8e45T51N9jWfmP69wISCSbsbN9LBgsLJhdj6Yh3LrsLdv2znAeeBNaZN/wArZ6VEz
	 nZv9lBSfSUTWHBk9I1e4N97WO2qkgQpL3N63VB4zs2oy93if2x9EPrX+68hNq0XrBfg5n
	 inns/PvPwlPmNbwlrSWLjauq04Tx1qJjz8hMKmB0B9qqWX9Acj42aAa33oJfQdF6yUIMT
	 U82bViZAbozE8NSsWIL56VTnn8m5lJE/v6QGy3r+u9uy9dOG4nZir8zXzrR7Z3LwJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510388;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1x3SsCFmTxG+6IbbN+J2aHaHxtjdAaDf/N9yF2FywJg=;
	b=LfTJ8VybFr3Tq9upCJaZos+CYtQXulmECW2wnqYRZ7QRJLAIt/LuR47H/J0aAg/+Zr5e
	 yshVnoGLvfTxvpUAlwsfk6Zhlnb4fqdVkhJyzWiAbv4WfUqjHuB2m9i2bkyXlncYhZlBZ
	 GjnNPWkCifgDNCnEuQBj6dgeMuPog0LKoJ5ZTAB8nlnJLUPxrLUP77JX5ezm6cYtVIKKU
	 ZyToz+9wuXVE68S3GHwW9Dt1tWPtuq7bzrTlffVH1viubBqSQSj7/b/3hIcw+PaiIqlaF
	 sRJGPuzCw888DotzL5eo9a2s90q1+ZKm6hiXz8Z5LX5akOVVjQkPNzQBBk+WUt7Wj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ho5/41Sb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B62606A336
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho5/41Sb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D463A1F000E6;
	Tue, 24 Nov 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510387;
	bh=1x3SsCFmTxG+6IbbN+J2aHaHxtjdAaDf/N9yF2FywJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ho5/41SbHDiZqvnNAl0vHz1cUjze6sOLBJC68Z+qwLlJn3RyIbk6YoTo7CN4K9o4I
	 loqEumKSVaV6L4rgo1iEfRwXtzniRhpSHO83LuKlxEWtT/p+5zH8AeLP2dTFLU3cCx
	 x8ITpqS1mXnYb+sQ2p89suzez280ZEZFaje1h0jTujkLc8Vt8/SkAUnuk6PRTeIK7D
	 RRQfbMdjj+50sg/zYmCk8POUzK23tTnND7j5dEvVok8q8vOpeoamaAHRbvMoZBgaoB
	 kVzW4KDP6mrhXvDYQfHHU3pWlpAOZuIK1v3yhELqj5d4+bUlA9Wa37yx4VYgbF7F6d
	 VImOklsnggN/g==
Date: Tue, 24 Nov 2026 09:53:04 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 01/20] wifi: mt76: mt7915: dump the firmware
 memory of mt7916
Message-ID: <awVQcDJaKz9drZdw@lore-desk>
References: <20261124084309.1981968-1-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="VAZYc5s3d7FoGq16"
Content-Disposition: inline
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>

--VAZYc5s3d7FoGq16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7915_coredump_get_mem_layout() selects the mt7916 regions for chip
> 0x7916, but mt76_chip() returns 0x7906 on mt7916, like is_mt7916()
> expects. 0x7916 is the PCI id of the second interface, which
> mt7915_pci_probe() hands to mt7915_pci_hif2_probe() without a device
> of its own. With the coredump_memdump parameter set, an mt7916
> firmware crash thus gives a dump without firmware memory.
>=20
> Match the chip id of mt7916.
>=20
> Fixes: 4dbcb9125cc3 ("wifi: mt76: mt7915: enable coredump support")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/coredump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c b/drive=
rs/net/wireless/mediatek/mt76/mt7915/coredump.c
> index db079b274a93..91f02735a882 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
> @@ -96,7 +96,7 @@ mt7915_coredump_get_mem_layout(struct mt7915_dev *dev, =
u32 *num)
>  	case 0x7986:
>  		*num =3D ARRAY_SIZE(mt798x_mem_regions);
>  		return &mt798x_mem_regions[0];
> -	case 0x7916:
> +	case 0x7906:
>  		*num =3D ARRAY_SIZE(mt7916_mem_regions);
>  		return &mt7916_mem_regions[0];
>  	default:
> --=20
> 2.47.3
>=20
>=20

--VAZYc5s3d7FoGq16
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVQcAAKCRA6cBh0uS2t
rEtnAP0UC0Y9S5qoKwhRLCn9/iKI7q7Ps89U1EPxR4dmSpbjxQD+MRcvkdDsPN9e
ljx1Gcn4TyFTq2UfCwoVBE7cZ5ew6gs=
=m4KH
-----END PGP SIGNATURE-----

--VAZYc5s3d7FoGq16--
