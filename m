Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990055;
	b=Iy+qpQ/VCUP3lcUPFkYE++Yk76mNfRU1Iq0REfJcYeu9K/G0vx4wQyok6DYKEElZ9uN/
	 o0IEeB2jDjw7gMqzqTAIRCOwNuO5BcaVHWeFFHe2P+1UTGBkWxN1nBcl13hrrlKcljlUm
	 gipE/N7pUxmugehvIT7taTYfqe9lzQCeQAP34WZpARkH1M77K/Hds0//L5o8B4mOLXDQx
	 d8d7obJmICb7KppBOplUp+op2MqyZ8OES9ashdTL47Hcv/QydG1EdCFfzzqfeu8KMRi1z
	 pv76skyAqjYH/tUpLd6fLu+tKmZ3QywbME/ITCx35NfzDXcd0uBSrzucwrdl+Szw/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990055;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=06EgvRY5O0tMHpRtpDfFyR4lZr+1OR1CYZjUElG5+F0=;
	b=4PXkKNpvGqXDlYsQCl+8Dyzr6UZHIY9Ztr5txhY8XPu8hhKowxUQF/q2f9NhXKJCo9wZ
	 RH5vAGchVxtG+nHdQRCqhA/W/Icql59J+Ah/Jjcuve3MDh3ORx7LQlJAcOAsX7O6bvF7m
	 VZ3w6cfly/Hj+qMQGrSpd8145P+1lmuMxT7ALvLkNRWP6RXQcluHZgnUeHwpYmtn7w1ga
	 6MZOxPCuSGn8H1NkCoGsXqObbRdvSxImqF8FyQmm7hjDPq6TWnnPAlrFtpIGbTxfq1WrA
	 6zZMTwu4jFpaumd2H3nsejjcBbzQy28VI5sS+BmgVcj35TJU8iCLLL6YbuBWarI9wxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax4jGAbz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F647606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax4jGAbz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73031F000C5;
	Wed, 18 Nov 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990055;
	bh=06EgvRY5O0tMHpRtpDfFyR4lZr+1OR1CYZjUElG5+F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ax4jGAbzHH3DNXteerEyX9ul+6qLCgBXYC+PwNgwGnUe06rCN5uCE8Tp+IP6UwtE4
	 pgj3XsYvdl4gAoQSIZEyIIJJpIQvuS9kcmDhNQ6O5nXsGQAD0kHf3J6H3KJRrzGd+7
	 5X3AevqC7PnILW5hnZbahZF3Z3HZuiwqZxNNp4whzuKLtkdDe1W9hWdWoobXWwAe3t
	 ixbzptkREUnz9k8yvT8fUluBOiQzTqVg81Y2lS05Hsi0vh2Uv4a9EO0Jk/ntufCKP5
	 f+SzBP1YZjK/6iqlfOEEOAz/3Ly42hM4cEp+EhV6CudsIZAExa+wKarbHikQvRiY6g
	 YM2sfIGPTowhw==
Date: Wed, 18 Nov 2026 09:20:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 01/19] wifi: mt76: don't pin undrainable PS
 stations in the tx scheduler
Message-ID: <av1f5JG1f7tMhlu-@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="PCsk3m0Lh7wuL/U8"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>

--PCsk3m0Lh7wuL/U8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> A power save station whose buffered frames cannot be delivered consumes
> no airtime, so its airtime deficit never goes negative, and
> ieee80211_return_txq() keeps it at the head of the active_txqs list.
> With all bands on one ieee80211_hw, each scheduling round then ends at
> that station, and all other stations starve.
>=20
> Return the txq only when it sent frames or its queue is stopped.
> __mt76_tx_complete_skb() schedules it again when a buffered frame
> completes.
>=20
> Fixes: a547b414bf7e ("wifi: mt76: add PS buffering support for HW-managed=
 TIM drivers")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/tx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wirele=
ss/mediatek/mt76/tx.c
> index ea9993e9a199..0085b7a29fce 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -625,10 +625,13 @@ mt76_txq_schedule_list(struct mt76_phy *phy, enum m=
t76_txq_id qid)
>  			if (!mt76_txq_stopped(q))
>  				n_frames =3D mt76_txq_send_burst(phy, q, mtxq, wcid);
> =20
> -			ieee80211_return_txq(phy->hw, txq, false);
> -
>  			if (unlikely(n_frames < 0))
>  				return n_frames;
> +
> +			/* an undrainable PS station would starve all others */
> +			if (n_frames > 0 || mt76_txq_stopped(q))
> +				ieee80211_return_txq(phy->hw, txq, false);
> +
>  			ret +=3D n_frames;
>  			continue;
>  		}
> --=20
> 2.47.3
>=20
>=20

--PCsk3m0Lh7wuL/U8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1f5AAKCRA6cBh0uS2t
rDg6AQC299Uyx6erfEE/Kyq0qyZMXJ8e7IX24fi87lNVNWgQTQD+OGsYThxM/bFe
WcVpyMteTZL2qkwt90Qah9zSgVYbwQA=
=mV7L
-----END PGP SIGNATURE-----

--PCsk3m0Lh7wuL/U8--
