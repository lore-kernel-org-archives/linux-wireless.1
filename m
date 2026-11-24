Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510482;
	b=YPIUgKvPs7FQfyWpUbLiLk4aeYKdy7i3er/HPi8DnLHNaLE1wSnI9/lcLs+SBuEcMwxT
	 SjsYESn/qre9RElQkQjTiJA5X9uZVl1F2tKYkR3LCHceHc6I12ixi03GewTsusuKodk+b
	 CybytSh1VczkuUw8OePJ2b2z0bSPev62ULBsE2ejZCWKLB4uqcUA/Ymulv7r28MBqcmia
	 SVlegEbUJxNrZefr/eicNbKXxFLC9TVQ+2Y7x4/q+Z624EuY+Gx4wQIc7foEx0jZEkc9K
	 mAYrWzU6UjNPMkPBGdesHFq9SoqtJP7WD63pMuOpazTT/mFekeVQGhruKNB9y+8eHdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510482;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SEiMVT2ptsTCo6PTLX8w3+3k4dme/fHREF9/Dio0XHA=;
	b=n6ZyF3jbNBmZ34S6G6b9zbOmHturAc7k8cBIetOh9dRbMhnNPDFo4GkXXcXe9ya3sjmd
	 I0kgGBcysAd/9OpfufWh91KtYJJ93GEV5/wsccAW4J1aaGrXXL2/DrUzuCXuKsBYdy6tb
	 h5HHmyi+7qS42ycWxouBlUOBwn2Z4NyVR6MA6wzepDwzszDtp57DHtKRS9gahoni3jVe0
	 dsH2PvXbTxxVtS9se0QELlel+gZ2R/bhG6IqNbjnHcYg38HerN/D4urvSPgPGtsxr+3Wg
	 5UGFj1Rc0k3Yf9C4O5WYV8K8brCnsRgS90F3GwCXf6s18NvvivMtEcxclI8WzBT2iVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaxsQ3rj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45B606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaxsQ3rj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3401F000CA;
	Tue, 24 Nov 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510482;
	bh=SEiMVT2ptsTCo6PTLX8w3+3k4dme/fHREF9/Dio0XHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GaxsQ3rjY6VX+/HfSgAfbcnxlVKujqtp8n4CCgF0BTfpIxfQf8lcOcOtP8yyHf0iB
	 /PBADfYAdZ2XetkBrUVlzomntlz88UML1dgJT6clTYKgANwKh+xJW59bzClVeg/fN4
	 1SLBZPIUM4kmeSJw3CnFh/t2JX52D6biQXpeiUPwjVhbjwnb3DQvOsGPk78yo99eTv
	 sMbaXMOFnweL96EiOrVLyUVrIQb80PrI5MUdPa0wjl7YVfPeyzbj/sjwCLYwDMsqwu
	 VZ0RKx00bxtwhve+huYaZq11R87NER6t7kDkHlQcabm6nEJ/se5TVYFl3teyUijE7Q
	 yWrCyd0WZi9eg==
Date: Tue, 24 Nov 2026 09:54:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 03/20] wifi: mt76: fail an MCU command started
 during an MCU reset
Message-ID: <awVQ0N3TAeC5J7jF@lore-desk>
References: <20261124084309.1981968-1-nbd@nbd.name>
 <20261124084309.1981968-3-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="yFzDspzP+5XOcJSG"
Content-Disposition: inline
In-Reply-To: <20261124084309.1981968-3-nbd@nbd.name>

--yFzDspzP+5XOcJSG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 24, Felix Fietkau wrote:
> While MT76_MCU_RESET is set, mt76_dma_tx_queue_skb_raw() drops a
> command with the error of a full ring or a failed DMA mapping. The SDIO
> path queues the command, reports success and skips it. The USB path
> sends it. The caller thus cannot tell such a command from one whose
> answer the reset cut off.
>=20
> Do not send a command that starts while the bit is set. Return an error
> that no other step of the send gives. The interrupt path can set the
> bit after this test. Return the same error from the raw TX of the DMA
> path for that case.
>=20
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/dma.c | 6 ++++--
>  drivers/net/wireless/mediatek/mt76/mcu.c | 6 ++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wirel=
ess/mediatek/mt76/dma.c
> index 8c0403820299..f5203f39e6b1 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -637,8 +637,10 @@ mt76_dma_tx_queue_skb_raw(struct mt76_dev *dev, stru=
ct mt76_queue *q,
>  	struct mt76_queue_buf buf =3D {};
>  	dma_addr_t addr;
> =20
> -	if (test_bit(MT76_MCU_RESET, &dev->phy.state))
> -		goto error;
> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
> +		dev_kfree_skb(skb);
> +		return -ESHUTDOWN;
> +	}
> =20
>  	if (q->queued + 1 >=3D q->ndesc - 1)
>  		goto error;
> diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wirel=
ess/mediatek/mt76/mcu.c
> index 7149b2f7aafd..e19fd1bbd911 100644
> --- a/drivers/net/wireless/mediatek/mt76/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mcu.c
> @@ -91,6 +91,12 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev=
, struct sk_buff *skb,
>  		goto out;
>  	}
> =20
> +	if (test_bit(MT76_MCU_RESET, &dev->phy.state)) {
> +		orig_skb =3D skb;
> +		ret =3D -ESHUTDOWN;
> +		goto out;
> +	}
> +
>  	if (dev->mcu_ops->mcu_skb_prepare_msg) {
>  		orig_skb =3D skb;
>  		ret =3D dev->mcu_ops->mcu_skb_prepare_msg(dev, skb, cmd, &seq);
> --=20
> 2.47.3
>=20
>=20

--yFzDspzP+5XOcJSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVQ0AAKCRA6cBh0uS2t
rM9IAQDCr/Lhv0gGNviWc+E8y2gwH1cX+WIf+uTNmUr2aHdZFAEAym7sX3K1SZ6n
hZegTgm8huWHAQeLJa0ZplSjxjuCIQA=
=BiGw
-----END PGP SIGNATURE-----

--yFzDspzP+5XOcJSG--
