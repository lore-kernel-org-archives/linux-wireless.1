Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510716;
	b=wtD6eYRFmXFwv/i1/zqpVjPI/oiW63YX7GACm6aVP1QgBjSedsY1+wK8OhGZumAewTHa
	 YZ2R7zhJb986JkGcCyP5p68Txd79KaHUurRopAI9zkTxwMJiNNtCiBtM8t2M8ZBviUzZ2
	 I2nibT/cjPDcqNfKuNOriKS2izP9oYMpW8bOeX3OLjTInlsCMFB+9WvwEkx+zwz7nXNH/
	 tyU145COmL7RYK4Y8Qxl+CHpoBf2cwNaphQQiuqqY8DzIuuuSLp3pPRz5FJ9ItILQ0+pq
	 IYkdG9eBPmYYMaBJ4JKVcIy5EcmOaWjufloXA60bjOsGVqc/kyIDaK4YGJg56rDLevA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510716;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OAlJFTYw6FEX9GANGLowb+qMNFxSdpFC4GaJgz8nFJU=;
	b=xUfPiyczBCG03m3R8fwr2WHs3Sdxsra2S5S0MiHjKavL4IeojZS+o3MPJP8Bp18y0Xcg
	 f2W1QhuFBDqQeO0DcZKJVg1f/dLm87H4qgmqRUzILLIG2hb2MgphK51SSEttgvLbg/6tx
	 tDSOzleDNoF+cNQ/q8/W5qYg4gbNuwMS+RRE5tbOFzjdmFBAQqx/NPM9E/xHB5cdQILRh
	 1eZQPcJHOudfqknazogUbWx2hL2jhMXRfjeqkuNh0aMLBd8OSdfYc1ukiP/tuILlBQX4c
	 H0V/4HK1fmrpY4c2xmhSqf9bxeBmDDoup50etmlP5AnkdsRzyw0uyf5TJYBofYqZBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpiZ6Des;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378E606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CpiZ6Des
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5951F000C4;
	Tue, 24 Nov 2026 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510715;
	bh=OAlJFTYw6FEX9GANGLowb+qMNFxSdpFC4GaJgz8nFJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CpiZ6Des2Wi3bOJfimCDedDrCY/+gNawKaCiTB3L6bVDin6s0+qgKP/m5IJQLwYC9
	 ZOqFk0YIcOkcmRfhfbE5zUQlnwf7Kqson7zXcPZtawNFv5PB0eu3EoGdzw+xUrSFcs
	 4+pQdSye0cARUitds0XLQdbiPmj6LVne4oMBFCzXPmlFmOP51JFrpCLEnyOqdfZLhv
	 gsQBa0LhzFMFGlllQ5YoXkSDDnN2TUHMTqeffqsFbC8dcYGyDL6ObRgSCXMY0GbIQz
	 iZzVstO6742MOagHyLg36/w/PZt0rdUvjHs5lwfwjPsRj5bgEf0CT+p709a2iY1f10
	 /SIK54MbFba9w==
Date: Tue, 24 Nov 2026 09:58:33 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 11/20] wifi: mt76: mt7915: hold the device
 mutex in the station and regd updates
Message-ID: <awVRuUGBIow53oo3@lore-desk>
References: <20261124084309.1981968-1-nbd@nbd.name>
 <20261124084309.1981968-11-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="LMVHCv7X7fcYPd8x"
Content-Disposition: inline
In-Reply-To: <20261124084309.1981968-11-nbd@nbd.name>

--LMVHCv7X7fcYPd8x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 24, Felix Fietkau wrote:
> The sta_set_4addr and sta_set_decap_offload ops and
> mt7915_regd_notifier() send their MCU commands without dev->mt76.mutex.
> The L1 SER work holds the mutex while MT76_MCU_RESET keeps commands from
> the firmware. An update in that window is thus lost: the header
> translation or the radar detector state.
>=20
> Hold the mutex across the updates, as mt7996 does in its station ops.
> mt7915_set_radar_background() already holds it for the background
> chain. The callers then wait for the end of the L1 SER.
>=20
> Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chi=
psets")
> Fixes: e151d71e503d ("mt76: mt7915: add encap offload for 4-address mode =
stations")
> Fixes: 90e3abf07c80 ("mt76: mt7915: add support for rx decapsulation offl=
oad")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/init.c |  4 ++++
>  drivers/net/wireless/mediatek/mt76/mt7915/main.c | 16 ++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/init.c
> index 1bb2a938c354..fb92a0b2e4ab 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -383,6 +383,8 @@ mt7915_regd_notifier(struct wiphy *wiphy,
>  	struct mt76_phy *mphy =3D hw->priv;
>  	struct mt7915_phy *phy =3D mphy->priv;
> =20
> +	mutex_lock(&dev->mt76.mutex);
> +
>  	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
>  	dev->mt76.region =3D request->dfs_region;
> =20
> @@ -393,6 +395,8 @@ mt7915_regd_notifier(struct wiphy *wiphy,
> =20
>  	mphy->dfs_state =3D MT_DFS_STATE_UNKNOWN;
>  	mt7915_dfs_init_radar_detector(phy);
> +
> +	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
>  static void
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7915/main.c
> index edbb921e63bc..47796e0fa506 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -1294,15 +1294,17 @@ static void mt7915_sta_set_4addr(struct ieee80211=
_hw *hw,
>  	struct mt7915_dev *dev =3D mt7915_hw_dev(hw);
>  	struct mt7915_sta *msta =3D (struct mt7915_sta *)sta->drv_priv;
> =20
> +	mutex_lock(&dev->mt76.mutex);
> +
>  	if (enabled)
>  		set_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
>  	else
>  		clear_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
> =20
> -	if (!msta->wcid.sta)
> -		return;
> +	if (msta->wcid.sta)
> +		mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
> =20
> -	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
> +	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
>  static void mt7915_sta_set_decap_offload(struct ieee80211_hw *hw,
> @@ -1313,15 +1315,17 @@ static void mt7915_sta_set_decap_offload(struct i=
eee80211_hw *hw,
>  	struct mt7915_dev *dev =3D mt7915_hw_dev(hw);
>  	struct mt7915_sta *msta =3D (struct mt7915_sta *)sta->drv_priv;
> =20
> +	mutex_lock(&dev->mt76.mutex);
> +
>  	if (enabled)
>  		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
>  	else
>  		clear_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
> =20
> -	if (!msta->wcid.sta)
> -		return;
> +	if (msta->wcid.sta)
> +		mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
> =20
> -	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
> +	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
>  static int mt7915_sta_set_txpwr(struct ieee80211_hw *hw,
> --=20
> 2.47.3
>=20
>=20

--LMVHCv7X7fcYPd8x
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVRuQAKCRA6cBh0uS2t
rFLqAQDVxvCwsHbsSb3oOnAmXYRwTcgHykwZsN/2IyS7Wj9jUgEAuF47MK4KmWHB
+afBRCcIhPCauTN3DN8SB+3cPDyG+wI=
=ah8t
-----END PGP SIGNATURE-----

--LMVHCv7X7fcYPd8x--
