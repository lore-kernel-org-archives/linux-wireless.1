Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990779;
	b=ia0PGuSfM5axfLQ3NKcT0tnfnLNwkrC4mJi64vKDv1vpLN7Y9YKAOaXxBQpDkAt0THof
	 iMI/oxqXVd1ulW4OVO6UIKA14kau7RyS9zKHHhRwyJdpem6Hkso0fQItDaf2UsuFzWH9w
	 bDwjbUZMaSn6f5mb5zzO4b89Lfc8X/heglwAf0FjkL8tMnlDKbe8btLRwT8QPODONCl3I
	 TN2Y/Fg8zgvw9fbQN2740kD3MdT99xP1B+uteEcNUz74fr/EzrGprVQI3u4Sz6NfEnOUs
	 9VOtmSQoEJLAMGGBCfoPde5tKY9ANLMeXTuE/do+H5P7Rs1PQHNHrjLHi3qwsAoq2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990779;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ey7Ek9L+AIWnhIw+WSoEymvD0ud+3flTnBgshLlu14Y=;
	b=LUk5P3tB73Qbbg3XxaD4IZCpPmaGKxho8BqfoEbn4026tFqcE+gdVtAN3ZNs56E+jLGi
	 OK8N1/HVuoofw2Zia7f5rXj0JwXWXEEVAlUZz8iOgkmrdIfmZeqNksFKQ36swVEgYIrnY
	 TP7+28V4R0WXZ4lB7ThUz+Tm23Pe+0Ceu/txqnjKkSe8GL7ZlnaKyFOJbOB/um0gggK7W
	 X3M5CvINpAF3q6IPOWVNzFZGayIqiXPlUUV8EHuWXmKfiWiZz301ehoYcl/HGT4hs7Imy
	 OrkvTGjXzIVjfwprQtXG8+B3sQKnbLjGez5HqaO/BRowcCLGHXtir7fw6+JuY0Bt2fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P95W97V4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9E606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P95W97V4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB41F000C5;
	Wed, 18 Nov 2026 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990778;
	bh=ey7Ek9L+AIWnhIw+WSoEymvD0ud+3flTnBgshLlu14Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P95W97V4sc0aC8n6tOEK0uEoVhvXlGRbCZUyBTXirvBZcpAGSOag5YL52UMKfDYy3
	 d76JJ9igE2BebwBKikrSKeIB7IXKwW76BiGjCGkwdOzZJ0qMiPk8OIWZAMuM4aXEDl
	 EpCLibmO0EC4O3isOiacpYvZMpKG20oOo5453fu0OsZ7I4po1WhtHGqYuYRnOpM+eY
	 rKnFrC011N+et5eRTgeewzayzPAkGwkGqIdwQE75d9TWJophZExvnOCzU+AEw+MUSh
	 Do9f/8t9RhonlpYllXPIK+CAXpxdMXTJJ3lF7lsbjCMCYtHw33fLeUGHZHt4FCvMBn
	 7vj+m1Muv2nxg==
Date: Wed, 18 Nov 2026 09:32:56 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 05/19] wifi: mt76: delete only the RX NAPIs
 that were added
Message-ID: <av1iuPfe-CQP4OLG@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-5-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="ZD1EbOkqszrLSabP"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-5-nbd@nbd.name>

--ZD1EbOkqszrLSabP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Felix Fietkau wrote:
> mt76_dma_cleanup() calls netif_napi_del() for every RX queue, also for
> the WED RRO queues of mt7996, which get no NAPI while WED is active.
> __netif_napi_del() then locks the NULL netdev of that NAPI, and rmmod
> of mt7996e with WED crashes.
>=20
> Delete only the RX NAPIs that have a netdev.
>=20
> Fixes: 6b470f36616e ("wifi: mt76: Fix memory leak destroying device")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/dma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wirel=
ess/mediatek/mt76/dma.c
> index a67880a9281c..8c0403820299 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -1217,7 +1217,8 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
>  	mt76_for_each_q_rx(dev, i) {
>  		struct mt76_queue *q =3D &dev->q_rx[i];
> =20
> -		netif_napi_del(&dev->napi[i]);
> +		if (dev->napi[i].dev)
> +			netif_napi_del(&dev->napi[i]);
>  		mt76_dma_rx_cleanup(dev, q);
> =20
>  		page_pool_destroy(q->page_pool);
> --=20
> 2.47.3
>=20
>=20

--ZD1EbOkqszrLSabP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1iuAAKCRA6cBh0uS2t
rCWQAP9vnSbrCnUXoD1t9bJXQQ627udPPQtkleZP8oAxuINnuQEAiWGLGok0hRYi
E17+JSaggZmOW/4BY1DWxIK7gj++8Ac=
=u8Wk
-----END PGP SIGNATURE-----

--ZD1EbOkqszrLSabP--
