Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990152;
	b=wYSI8cFlcoiWnfmS/lp+neUPygf8RXlpREQanxEZP+yvxzD2Yjw+Wu0revam7Yk/HHsM
	 kXFQuincvR5orT09gTF3TQXnajpnLMFQ5sUMuSNTEp2yhWicwpg661uCMXtW9uX/ucDmZ
	 w8/yie9lkMBEVHMxgCaeOxDpRD3PMkg6kB8brZaoRiSnf2OLvXJQQtkYDVUb12oqfVPiC
	 +WkLmncCebx2SCDRgt88SzyoZhLMUW5rDorHB2U7AYk5SJDPlQbpjlFV1VI8ypGtJKEt7
	 zOHdviDMc7vBFJZs2aLL4llXfeW7w7+65El8cGyOUbhPbvuslEy7dM1u5ZkQU4ZpttQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990152;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8amZohmZh3AnTIw3kwvCeHfCGYfKSePA+yzhGQzou88=;
	b=x61Q9DrRaK64kho8s1xfJJ1tgyby57WAMCMg3cXhHUNcEYPj5TJ3yhWBpTT+uTJUWR9F
	 AEqH8b2uzfskn+kEwO8yPoIdjATtxr7EdnyLdczT9zZQKkGHPf95Qgh8LSUh7zor/iYq8
	 E13IP88TJbMAMr0p4d06elo6qftqSB4VQ5mRCC58FKqhKRA/jBfn4n1N9nE9SPiBU9Ib9
	 /tTETJj5ZB2Fc6KKOb2+1omwyJJBe2muB0ta04tgiDcloTLj5h7HW8IwYmfqhF6m4oejh
	 Pn473bEnYnpLuHOxZXOSIxTHk/4jd2pXXJeY4PPYxTfZAoxfnvNbCgHkuf+AFZHx8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcypHlp7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6905606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcypHlp7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423341F000C4;
	Wed, 18 Nov 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990151;
	bh=8amZohmZh3AnTIw3kwvCeHfCGYfKSePA+yzhGQzou88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IcypHlp7GDWsexTI3PqxkdwGAKPIFsFwrqhD+Fy4xWBlo+jx7Bfq0ZSlBdicnFNWo
	 O0+LLDxGyTTeTjS0UbAu3wz728q3PD4Syk3LFJNswQf3ZASn8AXF1SKpu/5eKlBQQ3
	 Fv02i20AALGEET2e0PC4/77IeFu+e0h4vcJSnMo3XX7RPttbCo3Ja8pECQ68lPo74y
	 5I26FGFLvZb2Kd6FwCKCXMkbg8VtNLPgFQv2mXye8OLB3FTFcr4eyi7T2fEFCiYO/K
	 HWjIDHPR+8KNxPYX78hm41MBPvautMIdH0epook2g2d/SxcjCAGreLQkwMeP1GXJ+e
	 g9kvnq/8r/OKA==
Date: Wed, 18 Nov 2026 09:22:29 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 03/19] wifi: mt76: mt7996: use the default
 timeout for STA_REC and BSS_INFO
Message-ID: <av1gRcnc-PZYhmlr@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-3-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="qFK5y0sny0jso20S"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-3-nbd@nbd.name>

--qFK5y0sny0jso20S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7996_mcu_set_timeout() gives STA_REC_UPDATE and BSS_INFO_UPDATE a
> timeout of 2 seconds. Their payload grows with the beacon templates of
> MBSS and MLD configurations, the firmware can take longer to process
> them, and an MCU timeout resets the device.
>=20
> Use the default timeout for both commands.
>=20
> Fixes: beb01caa570c ("wifi: mt76: mt7996: decrease timeout for commonly i=
ssued MCU commands")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 94e88455c732..e56b60346fc4 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -282,8 +282,6 @@ mt7996_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
>  	case MCU_UNI_CMD_THERMAL:
>  	case MCU_UNI_CMD_TWT:
>  	case MCU_UNI_CMD_GET_MIB_INFO:
> -	case MCU_UNI_CMD_STA_REC_UPDATE:
> -	case MCU_UNI_CMD_BSS_INFO_UPDATE:
>  		mdev->mcu.timeout =3D 2 * HZ;
>  		return;
>  	case MCU_UNI_CMD_EFUSE_CTRL:
> --=20
> 2.47.3
>=20
>=20

--qFK5y0sny0jso20S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1gRQAKCRA6cBh0uS2t
rPNdAP4ovvSJfKRU6im90ArxSTBKSmIRXnTjileZFC5eW0WyuAEAj/poP5/Isnpx
0MPt4UCS9t5XgN7YvvHIKWZJrpdwAAo=
=Jfrv
-----END PGP SIGNATURE-----

--qFK5y0sny0jso20S--
