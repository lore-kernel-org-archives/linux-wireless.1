Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990189;
	b=mFte2OtjUIcfbpEbu+4//BBFlBfWwM8WBoR3QC2UCQUVxmOPkIHWoydbMA0zgr5kb8Ss
	 qkkDkk5ouJ6+e9Sdzu68ma/T3DXqoHgVt5+8pI1tePjIhXjnzURy604qd5YHlU/vxJBJJ
	 +2HW0vQoaiTPK/LG5gnEaJ3ib14cOhdpVhJC2sintK6c8SwyhEHPE2kIhROvYQ3lcQ9sW
	 8lkQQi5UWJkBAWV1DMt5FX+X9Jp1DnB4U/S8e4rsoUO26JYlN2kbmExNrZg6/kvtvz8Wr
	 i6PHBQm0cshQEib7B4hcKaex2dhKKyktsrVuIBcCCtPEbGQurU1i0zZsKjZ+C8PjgtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990189;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+1uc4ao1Ap+nGLdsAXB1nnahTKcpfRqOoQT0w0vGcao=;
	b=xzRJ1sB+bgEezXHy0URQMW23ic4BiF4hOSqxc9ByKRH/KkSy9owYDx6RX38VvwX58w34
	 YBQnuejM2JqtWUSs+AIlIyr9MwEuV89WyqqfWf3cYiBGSWE3ajPon/RqH8j9T4MTAk24/
	 8tPgeIMZTFkpz0N5ilymMQlyiIf85l8EJPTfNZD1mjoqidyTjCwoiX0Za6AYHeOEYs2te
	 KiW4CjaCYHk++WLqGFrIFFwwCjDOXhZNNvRfCzCGNgiMEhZgJmuIr0WmuLOAxvYO2gOah
	 rqzPlkvPJXUHuuSGrXXlX442i7Ftnz0+ywUQCZGZaU7W23Q5KQ27/o6B10mxK2vMQmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjObT3xm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA1606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UjObT3xm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D411F000C7;
	Wed, 18 Nov 2026 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990188;
	bh=+1uc4ao1Ap+nGLdsAXB1nnahTKcpfRqOoQT0w0vGcao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UjObT3xmO3H0QkEyOjPMmzFcUE7zP0uECo3fkqDZuKyDMww+izRlendt7DzJQIcAQ
	 RvjNUun4DWVtQTTJiT/1+O+wIVgfTcMuyXup4ar/rl/ovz5kDepz0I3MnaEzlBJ2Li
	 2AwvnXzN2ygDyvsadA1qdSyywP9xWsNzfr+Pt5RvOOL8dT7yij8E3Qe1Shl0KFVCm+
	 CIAA9I236VGLwZTKYPfiCW7+STNkZlUeE9IYY87Sm5MoCsakoHfnZq8y5Dzs2RHZMW
	 dumfzle4+1d7M6jmhO81SQIBNJMX7kQ3KC3gjl8pMSL1D2DxirdTEErNFdfSXtikGV
	 MzRdhruWzteiQ==
Date: Wed, 18 Nov 2026 09:23:06 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 04/19] wifi: mt76: mt7915: use the default
 timeout for STA_REC and BSS_INFO
Message-ID: <av1gasgmHXDhPO_E@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-4-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="5NA4iwZ+DODkF1k0"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-4-nbd@nbd.name>

--5NA4iwZ+DODkF1k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7915_mcu_set_timeout() gives STA_REC_UPDATE and BSS_INFO_UPDATE a
> timeout of 2 seconds. Their payload grows with the beacon templates of
> MBSS configurations, the firmware can take longer to process them, and
> an MCU timeout resets the device.
>=20
> Use the default timeout for both commands, like mt7996.
>=20
> Fixes: 1254c66356d1 ("wifi: mt76: mt7915: decrease timeout for commonly i=
ssued MCU commands")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mcu.c
> index e66968b819da..9b748b37624d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -214,8 +214,6 @@ mt7915_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
>  	case MCU_EXT_CMD_THERMAL_CTRL:
>  	case MCU_EXT_CMD_GET_MIB_INFO:
>  	case MCU_EXT_CMD_PHY_STAT_INFO:
> -	case MCU_EXT_CMD_STA_REC_UPDATE:
> -	case MCU_EXT_CMD_BSS_INFO_UPDATE:
>  		mdev->mcu.timeout =3D 2 * HZ;
>  		return;
>  	case MCU_EXT_CMD_EFUSE_BUFFER_MODE:
> --=20
> 2.47.3
>=20
>=20

--5NA4iwZ+DODkF1k0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1gagAKCRA6cBh0uS2t
rLLRAQDrEFIdHPtsVB+rzuLpNzlQnag+1Zhtj1NP4P+FLWaF+wD/YghmDV/D9Sk8
vrucQH4xZw5fVzJ4ML9uO7S6QtPJOAs=
=O9Jr
-----END PGP SIGNATURE-----

--5NA4iwZ+DODkF1k0--
