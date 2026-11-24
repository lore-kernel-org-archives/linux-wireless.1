Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510600;
	b=onG4tuqzIxE3otEUHNRGWI2UgPWfY1Xu/Zg4Wg6EYfozGyGjzbGQWZ2LIidx0xePbL0o
	 20jm9FrANH5rxW/onFUFh0CTf3LX6Q34NtiGcI2oIhJuoVXICYmUKzso54MUwEZODmsF2
	 pB8dfK3uWu6AO5XLI7L45vhk8g1ixLo7QI6K5GrR0oTGVCxTN9IyfrbEkyh8IO9wig4XL
	 xRvDU+GN+E51SvmkGqG275d+8+QfhCBPu7Z/pOzz2w5AzISJO81AgpeehsSAYAbqttv3T
	 8EjLeTqBg1hK2LlMD/YeoQoqRTQvswwFDaF2EROKaRO8xlTpFBMtyRkR9ld4UTGWxzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510600;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e9yu9PlVUguDidrYbKTvqP1ZNkglpz+gmNKIYXXy2Nk=;
	b=CWcgRO5OBweGR4UzNH/fUFyiAJDcJDigQonlrrAggrduBkef/0yVzFlh1QlJOAZhhcJj
	 o7xOqAn9qu/8p86O4+ZSACGcZVjnqqagukExAu+HI8gMxCSwxxMjzcb8PEs+U/RPANEmn
	 5+ZjC5UFZr5iQ/sO68ENKTgQZa5sjQx0WPYYxLN+FZKkQ+C3z71ko1k6g5ZEv9V6BZK6r
	 D6IpN9aVLmxafTj8+h3a9ptvk1pOF5BK1QRkKbHEAVaLsJyyDBc+zLHrRt6EfxHoYYhX4
	 gJkSxhv8u0tKn0+4K5K8bk80B/E5cq0BA7z55lO6CTFNphlYXkVeFbwzgg4ho2/HCQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3fxLzJO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BA606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3fxLzJO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DED51F000C0;
	Tue, 24 Nov 2026 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510600;
	bh=e9yu9PlVUguDidrYbKTvqP1ZNkglpz+gmNKIYXXy2Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3fxLzJO435l+wi3JfKsRnKCjWLp0huyTSa+EGS7wucKt2xKXztY9gWa112wagA34
	 qVxPwuauIZDYwLxmY1dC2vrPcTkfAMBBbkKL+YdmRfuoSs/ZR4HQVopE1kv0tpfAFP
	 fLVEJYbCdUVOYhdBZCz2sgHhcrBX4fwhjzwoK5DD+sp0R0vp/Cwyram/gCFwm6U1YH
	 DlFF3rgpnZgvj887dSJr2kz8ImknjO0VzQvtvQw5lYIl7few1PoSwBgNZJN31htVIF
	 1IvWu4CduZpfD3EKMpoky55oUCEOPZ0npAxXxzgF90ToBrJZiu+SupXPfakkoZkxw4
	 U90nBjMS+B+lw==
Date: Tue, 24 Nov 2026 09:56:37 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 10/20] wifi: mt76: mt7915: hold the device
 mutex in the rate control work
Message-ID: <awVRRX8YlqJ4JGqh@lore-desk>
References: <20261124084309.1981968-1-nbd@nbd.name>
 <20261124084309.1981968-10-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="Mra39Ihft6sHSrt8"
Content-Disposition: inline
In-Reply-To: <20261124084309.1981968-10-nbd@nbd.name>

--Mra39Ihft6sHSrt8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 24, Felix Fietkau wrote:
> mt7915_mac_sta_rc_work() sends its rate control and SMPS updates
> without dev->mt76.mutex. The L1 SER work holds the mutex while
> MT76_MCU_RESET keeps commands from the firmware. The rate control work
> can still run in that window, so its update does not reach the
> firmware.
>=20
> Hold the mutex across the updates, as mt7996_mac_sta_rc_work() does.
> The work then waits for the end of the L1 SER.
>=20
> Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chi=
psets")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/mac.c
> index e9b1704d1289..110d5368a8ee 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -2008,6 +2008,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *wor=
k)
>  	u32 changed;
>  	LIST_HEAD(list);
> =20
> +	mutex_lock(&dev->mt76.mutex);
> +
>  	spin_lock_bh(&dev->mt76.sta_poll_lock);
>  	list_splice_init(&dev->sta_rc_list, &list);
> =20
> @@ -2033,6 +2035,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *wor=
k)
>  	}
> =20
>  	spin_unlock_bh(&dev->mt76.sta_poll_lock);
> +
> +	mutex_unlock(&dev->mt76.mutex);
>  }
> =20
>  void mt7915_mac_work(struct work_struct *work)
> --=20
> 2.47.3
>=20
>=20

--Mra39Ihft6sHSrt8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVRRQAKCRA6cBh0uS2t
rEybAQDf98AFpUHHLBsYCM7MfFgSWFiA7aP4VsyGnZ7/GFkdSwD/a0VgAiDAQF9Z
X/RdtdXg4XocM3cjhen7EY4Rra4bbQk=
=N0Mm
-----END PGP SIGNATURE-----

--Mra39Ihft6sHSrt8--
