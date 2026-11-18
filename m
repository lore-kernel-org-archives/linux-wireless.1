Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992152;
	b=w4Qr/rrXLfmfQ22ZsWJA7UA+OLc9L9uIAG/TXYvEfuFjOGwGPqAb7dfvQlOmDJNObr4W
	 ZIZJ3DwI+IQ6L1FU/yuy5B6nYcGP9NkwlZ4OVIjpxvPqWuMTwlxGESEQD33oQy4Xlxmjc
	 lgMSHS7ExPu1ju+L4KltCvwyi7XelOWfTha8tVeGgq2Kr8Xb+RIAMjqCks+3jlezP7GNM
	 q08cCoc9xYVOHQpXgOY/TMW7icv07NZBOYauKKlW4v0nhj2FnRZ7hQwECB3wuPbcA6Yqz
	 9tdFd8mS2UGrPJq+JsaxPzKYQm4H+CMOVF4IexDSFwXuGXfAGLGlU3cu3aI13aOToIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992152;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rxX8HZ6bdAsiXwmcT/aOWZwgtWEHggXdn2outMxYS2M=;
	b=CwH7h5G2C8ETaCKRcp3mCu5Xg7CJ5A0yF16D+Za2eD30LPjq8/5kauAEIzq+y493n15u
	 UnfnRv9IpwxckBvMBPNInQPgswpJiFC41lE8kY5xYNTb8WMBwAvbYysGaMZzrdlZbV4yq
	 XAApkwNIcItXlSx5rBu17Y7FgoNciAfnHvTh46MEkvfHl73EKhJVwzs2X3XuGNCkim2rV
	 Y8iytGiO5QH97+w+ekutsPA99nMrzwot6JBO+UcWEqiF+loGO9KSSig1/bWVYj9tanVFE
	 uMU9D2ZLKv0QwA8sUjH807s6sprVQFzq5ckjK5zaNZZMA6t/X5nMseLm6g0p4c0FBpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCkTj8Ry;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A81606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCkTj8Ry
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477DD1F000C4;
	Wed, 18 Nov 2026 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992151;
	bh=rxX8HZ6bdAsiXwmcT/aOWZwgtWEHggXdn2outMxYS2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VCkTj8Ry0yAK8/pzsXIym6lB8qmoTVW8Nf6BfJ8aNM5uQsXlBS+oBbX1luWKtga/S
	 ryTPqp2xJexgRpYZ9+eRMB0BWcoUVaKRoCUFi4ZubMx+YtV1Cct3d8G0nSLSZDEW7A
	 FOWSgakwFtSAxi8tckQfxe2Bi8FrVTNUZCHX2u2pm4rCXdvir/x5qBXu83+7OKbZKu
	 elweVoeYwG26SNiEYD82Y2xxe3ryfXkJHE0+dEm/25mRCaPyOL7xBfucneTmjX5bqR
	 3iN7RUjVqucv94wAqpUJ47FeKBH+MIUvGteqP3wpQuLF3Hd954xGMxOHFQSm2KzvH5
	 MYCxdX5KZzYww==
Date: Wed, 18 Nov 2026 09:55:49 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 12/19] wifi: mt76: check the PN of a BA session
 frame at its release
Message-ID: <av1oFdgZJneuAgcg@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-12-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="CUcerYJ93Dq16LkN"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-12-nbd@nbd.name>

--CUcerYJ93Dq16LkN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Felix Fietkau wrote:
> mt76_rx_complete() checks the PN after a frame left the reorder buffer,
> outside tid->lock. The links of an MLD peer share one PN state, so a
> frame released on one RX ring can be checked before an earlier frame of
> the same TID on another ring, which then reads as a replay. The reorder
> work has the same gap on a single link.
>=20
> Check the PN of a BA session frame where it leaves the reorder buffer,
> under tid->lock. mt76_rx_complete() still checks all other frames.
>=20
> Fixes: 30ce7f4456ae ("mt76: validate rx CCMP PN")
> Fixes: 62694ed0b76f ("wifi: mt76: check the RX PN of an MLD peer once per=
 peer")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/agg-rx.c   | 11 +++++++++++
>  drivers/net/wireless/mediatek/mt76/mac80211.c |  6 ++++--
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wi=
reless/mediatek/mt76/agg-rx.c
> index bf1babac3895..49721b4faab1 100644
> --- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
> +++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> @@ -12,6 +12,15 @@ static unsigned long mt76_aggr_tid_to_timeo(u8 tidno)
>  	return HZ / (tidno >=3D 4 ? 25 : 10);
>  }
> =20
> +static void
> +mt76_rx_aggr_pn_check(struct sk_buff *skb)
> +{
> +	struct mt76_rx_status *status =3D (struct mt76_rx_status *)skb->cb;
> +
> +	mt76_check_ccmp_pn(skb);
> +	status->skip_pn_check =3D true;
> +}
> +
>  static void
>  mt76_aggr_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames, =
int idx)
>  {
> @@ -25,6 +34,7 @@ mt76_aggr_release(struct mt76_rx_tid *tid, struct sk_bu=
ff_head *frames, int idx)
> =20
>  	tid->reorder_buf[idx] =3D NULL;
>  	tid->nframes--;
> +	mt76_rx_aggr_pn_check(skb);
>  	__skb_queue_tail(frames, skb);
>  }
> =20
> @@ -204,6 +214,7 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct=
 sk_buff_head *frames)
>  	}
> =20
>  	if (seqno =3D=3D head) {
> +		mt76_rx_aggr_pn_check(skb);
>  		tid->head =3D ieee80211_sn_inc(head);
>  		if (tid->nframes)
>  			mt76_rx_aggr_release_head(tid, frames);
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index d72ade2d46cb..b1789be134d6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1387,8 +1387,7 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buf=
f *skb,
>  	*hw =3D mt76_phy_hw(dev, mstat.phy_idx);
>  }
> =20
> -static void
> -mt76_check_ccmp_pn(struct sk_buff *skb)
> +void mt76_check_ccmp_pn(struct sk_buff *skb)
>  {
>  	struct mt76_rx_status *status =3D (struct mt76_rx_status *)skb->cb;
>  	struct mt76_wcid *wcid =3D status->wcid;
> @@ -1403,6 +1402,9 @@ mt76_check_ccmp_pn(struct sk_buff *skb)
>  	if (status->flag & RX_FLAG_ONLY_MONITOR)
>  		return;
> =20
> +	if (status->skip_pn_check)
> +		return;
> +
>  	if (!wcid || !wcid->rx_check_pn)
>  		return;
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index 8f8388d44aa9..0b16567920fa 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -774,7 +774,7 @@ struct mt76_rx_status {
>  		} eht;
>  	};
> =20
> -	u8 amsdu:1, first_amsdu:1, last_amsdu:1;
> +	u8 amsdu:1, first_amsdu:1, last_amsdu:1, skip_pn_check:1;
>  	u8 rate_idx;
>  	u8 nss:5, band:3;
>  	u8 chains;
> @@ -1842,6 +1842,7 @@ void mt76_rx_complete(struct mt76_dev *dev, struct =
sk_buff_head *frames,
>  void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
>  			   struct napi_struct *napi);
>  void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *fram=
es);
> +void mt76_check_ccmp_pn(struct sk_buff *skb);
>  void mt76_testmode_tx_pending(struct mt76_phy *phy);
>  void mt76_queue_tx_complete(struct mt76_dev *dev, struct mt76_queue *q,
>  			    struct mt76_queue_entry *e);
> --=20
> 2.47.3
>=20
>=20

--CUcerYJ93Dq16LkN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1oFQAKCRA6cBh0uS2t
rKSJAP9ZGOBwIah/Lerj3sZHacjfEOH1jToOKWZqpAd/6t1XZAEAkMQKsyf6D69K
BmoUaCwO9JbBPvbrOGlwrng14p2Aqwc=
=11y9
-----END PGP SIGNATURE-----

--CUcerYJ93Dq16LkN--
