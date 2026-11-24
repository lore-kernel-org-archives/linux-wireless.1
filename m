Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510430;
	b=nBR1NgXb5r4GzMGtW9wiMV5GZUWEgtp7/+Nhj3Es/KE6vwHp/+EcWrgjh4R/ZuXgRYNh
	 8ykoT42oTDjP31cz1TBSciOSutRPaqhpj5GydUBWhMCzksRZ6jHnAt/UKz+UVzmQDsIiM
	 +XbX6qtFlYSID5fDLcuXj29n3RyPGG7eFo46h8/T7TNeaepXB71Sz9mTs+2KWz3TH9mg8
	 PeNcBMlduM+9uNdwF+v4/6QgaK+nyPwc50GQQI13R6tn7WbyePxEWX0bumASdT4hadRf9
	 ssNJMktMsIncl4gKSoIHGLi1eLCmNYERbm/wrCXJy7a/IuwBgsfAdgbQqiXkCgq1xxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nIDwZ2Wgqdu6R+aV0AZ/pcuTASWZ3aQOA/yolG1lb5I=;
	b=C1E5WtMz4o32HnGDLhm6OcGrV+/ho2o26CC65xm38GfpagYp54LebSKk56HzAqIWj+wd
	 VUVdWvJpl8ReYa3sGOGTaps9nfASnFiKL3kO5WO9oDglYacJGF+JefnuPDgmYkoO2Qycu
	 EyRXeewVpK4uxGDBlLQhcy47bCOiP9Mc/FoZV5bxjzvZXnPS9A8tsHWQ4b5cpsCtRx00Y
	 88VfKgvgrW1idkxtI6NSgC90pmAuNvazFnfHp01QfFfM3RD/4zC0BX1hQW2j3GOFBtQMe
	 0PnRtMiDsNy7/jYA+yY6qH/KBEWbSTtsEZbJgg088wFxEWfa5itrd87M5g91TtS9gIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkZmx4UV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010F606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkZmx4UV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46421F000F2;
	Tue, 24 Nov 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510429;
	bh=nIDwZ2Wgqdu6R+aV0AZ/pcuTASWZ3aQOA/yolG1lb5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkZmx4UVRwNcbLrYYI3KTi+IErGf+3RaQ+jxXFUPB9u2aWIrXqqk7+LIHYBiXzT+Y
	 uX/X5AVFbEq2oOcp1kNmzCFAyRwryY20I2oMeruIu50ysR738+zyjx2L8ObJOXmHsC
	 SH3/u0uJVz4X552WXJyTFM3FDEln1H//MkiKlibE+4aZI0GFfn3Ob4UFGkZvnc/RDO
	 elqyOfnX1end6xlax2rx0zwrAhjUC0mYwUcbuQXkmy54kUgrOOit/hyA5rIbe4Qwtb
	 N7S9h/adEDsYFhiCIcJidHS33wV5YFIfWBwpTw/PS3aNAL8s5drHhWvQ6nqjRiNoqs
	 P4gHJDE1nbeyg==
Date: Tue, 24 Nov 2026 09:53:47 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 02/20] wifi: mt76: mt7915: set the LED GPIO mux
 of mt7916
Message-ID: <awVQm5zTu4wqi1Yx@lore-desk>
References: <20261124084309.1981968-1-nbd@nbd.name>
 <20261124084309.1981968-2-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="nLDixJpfgNXQ/AsJ"
Content-Disposition: inline
In-Reply-To: <20261124084309.1981968-2-nbd@nbd.name>

--nLDixJpfgNXQ/AsJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 24, Felix Fietkau wrote:
> The three switches of mt7915_init_led_mux() set the mt7916 GPIO mux for
> chip 0x7916. But mt76_chip() returns 0x7906 on mt7916, like is_mt7916()
> expects. 0x7916 is the PCI id of the second interface, which
> mt7915_pci_probe() hands to mt7915_pci_hif2_probe() without a device
> of its own. The GPIO mux of the mt7916 LED pins is thus never set.
>=20
> Match the chip id of mt7916.
>=20
> Fixes: 9e81c2c7b9af ("wifi: mt76: mt7915: enable per-phy led support")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 6d09718ec585..1bb2a938c354 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -612,7 +612,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
>  				       GENMASK(11, 8), 1);
>  			break;
> -		case 0x7916:
> +		case 0x7906:
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
>  				       GENMASK(27, 24), 3);
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
> @@ -631,7 +631,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
>  				       GENMASK(11, 8), 1);
>  			break;
> -		case 0x7916:
> +		case 0x7906:
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
>  				       GENMASK(31, 28), 3);
>  			break;
> @@ -648,7 +648,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
>  				       GENMASK(7, 4), 1);
>  			break;
> -		case 0x7916:
> +		case 0x7906:
>  			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
>  				       GENMASK(27, 24), 3);
>  			break;
> --=20
> 2.47.3
>=20
>=20

--nLDixJpfgNXQ/AsJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVQmwAKCRA6cBh0uS2t
rOgeAQCVlUL8QiiLPDETFq1gDUfUZe8Z7WP3leweF7pSFLWU9wD/UN5Tb7t62dmS
YcRd4+sOeQKVoPwb7v7XCIJ6ZaJjOAc=
=BggF
-----END PGP SIGNATURE-----

--nLDixJpfgNXQ/AsJ--
