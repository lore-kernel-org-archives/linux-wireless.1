Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255751;
	b=KU7xF59KPozVEzd1LIPeG8gtMdlSffu5EIWbBdu0VYquJTGZx/EtSxjoxcqHqbMRnEMb
	 SD5juXpk/sjQ7XW8Y3vAAnCWORydFxBGbW+tAxiRyxuAPuUXzMic36n09DezHMf8fOpGM
	 djj5gD/1ewZCiBKK6tTH0WNanUum7xKXgP61BSxXZx0oNHqIBM5pvp0mh37UxY8qvCA/g
	 QkgbS0gGtcsdJflW94BN2cSorDaIatksJmvq64PuaQ/Pe3O6V7huitxJFAQRg1aSr4GTz
	 wIMGxT84GIepOozHB91ysU/7Xe2VoW0C3ZAXwtV4FLis4XUOGai2zhwZtPuabmAAijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255751;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X2e3jcyAKL/IlXQY/dX1/0BfOjh8IFLz7Z4WGvwnzAk=;
	b=rf3yO9TzrMvSQ8N1U52unsf3GN6KQjMnaVfFv9nNoDUupzlAyQfgsOH8tzDoqwar2zeT
	 jZddQhaJi6NHF3hQMNoCpXNLxigEAUAtA4MqAsGnaOxyM1D3qCr1nG0Z/bfeFiTFj8Ffw
	 e+MUSW9aO0F6kkvRBRrx6m3jMzVcku0nm0kyFK71BtYuA8LWSRYay1d1vfwQ8hZK9sF07
	 qiLUUVISHU/XgECX5rLRW56xxga1VhzNj2i90NGpl+Gi6f1XkUgzlB84hTCVwV/mMGhGO
	 rYQhNG1qtslzc6bBqGu0i11XvfodySCJtuuGDBvUNTzFYMpOs96rdvfXyF9+eLlTRHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4WFiL6o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F9606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4WFiL6o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF301F000C0;
	Sat, 21 Nov 2026 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255750;
	bh=X2e3jcyAKL/IlXQY/dX1/0BfOjh8IFLz7Z4WGvwnzAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b4WFiL6oXCwKSZNj5Bahoilt/oTAbx3PM07nuEex5oKwSmneCrQ3C+H1VUPxazpqj
	 nGhVvKvrJHy+F1dxKnD5i2gmd0Lo4IVHbdvKH4XsVG0WSZa+mR4hqM5oY/3bS9N9t1
	 jRI0SvpsG6IfP2qQV76BfAxAxWg0U6J3PKb8voZ6h+QthAL9aTS/yhfhV7aWmxD8yR
	 ycj6IEh1CdlnXB8kbkezTKlvdfPx+3ZIPJgu8k09d2C5UoAjuSOorbsVEpz+887+dG
	 /5YgbbhDq+cD98jNUb+jz5fLxiSG/9+Jp31Gcws9n0Zdi3WFgZFoJtXF1mf6OQ/DuB
	 oXMsCxkRNz0yg==
Date: Sat, 21 Nov 2026 11:09:08 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 10/20] wifi: mt76: usb: do not park the TX
 worker again under MT76_RESET
Message-ID: <awFtxEeHjhUobcTN@lore-desk>
References: <20261120174459.1657382-1-nbd@nbd.name>
 <20261120174459.1657382-10-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="N15Iwce8pNlFlHn4"
Content-Disposition: inline
In-Reply-To: <20261120174459.1657382-10-nbd@nbd.name>

--N15Iwce8pNlFlHn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When the wait for pending TX in mt76u_stop_tx() times out, its cleanup
> parks the TX worker also where the caller parked it already. This is the
> case for mt792xu_disconnect(), which reaches mt76u_stop_tx() through
> mt76_unregister_device(), and for mt7921u_mac_reset() and
> mt7925u_mac_reset(). The second park triggers a WARN, and the cleanup
> then unparks the worker, which runs again during the teardown or the
> chip reset:
>=20
>   mt7925u 2-4:1.0: timed out waiting for pending tx
>   WARNING: CPU: 1 PID: 15805 at kthread_park+0x73/0x90
>   Call Trace:
>    ...
>    mt792xu_stop+0x15/0x30 [mt792x_usb]
>    ...
>    drv_stop+0x33/0xd0 [mac80211]
>    ...
>    ieee80211_unregister_hw+0x45/0x140 [mac80211]
>    mt76_unregister_device+0x70/0xf0 [mt76]
>    mt792xu_disconnect+0x7a/0x1c0 [mt792x_usb]
>    ...
>=20
> Park and unpark the worker in the cleanup only while MT76_RESET is
> clear, as mt792x_flush() does. Every caller that holds MT76_RESET has
> parked the worker already, or runs before mt76_register_device() starts
> it.
>=20
> Fixes: 7910bd565d8b ("wifi: mt76: mt792x: quiesce USB paths on disconnect=
")
> Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/usb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wirel=
ess/mediatek/mt76/usb.c
> index be48a88a3ad0..9a701840d23a 100644
> --- a/drivers/net/wireless/mediatek/mt76/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/usb.c
> @@ -1070,6 +1070,7 @@ void mt76u_stop_tx(struct mt76_dev *dev)
>  	if (!ret) {
>  		struct mt76_queue_entry entry;
>  		struct mt76_queue *q;
> +		bool park;
>  		int i, j;
> =20
>  		dev_err(dev->dev, "timed out waiting for pending tx\n");
> @@ -1083,7 +1084,9 @@ void mt76u_stop_tx(struct mt76_dev *dev)
>  				usb_kill_urb(q->entry[j].urb);
>  		}
> =20
> -		mt76_worker_disable(&dev->tx_worker);
> +		park =3D !test_bit(MT76_RESET, &dev->phy.state);
> +		if (park)
> +			mt76_worker_disable(&dev->tx_worker);
> =20
>  		/* On device removal we maight queue skb's, but mt76u_tx_kick()
>  		 * will fail to submit urb, cleanup those skb's manually.
> @@ -1100,7 +1103,8 @@ void mt76u_stop_tx(struct mt76_dev *dev)
>  			}
>  		}
> =20
> -		mt76_worker_enable(&dev->tx_worker);
> +		if (park)
> +			mt76_worker_enable(&dev->tx_worker);
>  	}
> =20
>  	cancel_work_sync(&dev->usb.stat_work);
> --=20
> 2.47.3
>=20
>=20

--N15Iwce8pNlFlHn4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawFtxAAKCRA6cBh0uS2t
rNNmAQD2ny+N/VFAcRjF0oUOAp8I8509KYBNq8X1Sq6NVPHv6AEAgmoyYD2k72wc
iN6mLh36cnlom5MDXRQ++uoWDWmjAgA=
=2mak
-----END PGP SIGNATURE-----

--N15Iwce8pNlFlHn4--
