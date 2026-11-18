Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991632;
	b=BrRnmuKtaIUr4NXY4WjwIwRs0rQjoJpGoJYklAtHvqoHGii38HpJA0bYg73CdYzHo5E3
	 rS4Zd3pER3Nm7VEmREJJoNwTC0pn29f+zNUxGFOrZG9d8ct2FPU/GWxpoGMpE8RqUNDTJ
	 kWalA5C2gjvS7xEOb1TINbf+OrYjnB3rv9ppLUwQTal7LxdSsGA4pegM7NmnvpFZ55HJT
	 ERSv3N1kaytLAI9U6342AeQPYhek9YPpgddTYPXFpVEOHdoQKI3UTtJBcrdIJ4rDkpEo3
	 PwTMOZI8RFjaFJ65FwrnnNspQkZJEUQMpfoUJKClhbWew92IZfMlH1FuaPqZJy2kaWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991632;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P1uT/GkM5nEKkQFVp14onlceujue4jdeyFiWUGextFg=;
	b=knNBspeuknaqffMguc9ZyMGhnzQEVMkAHkht+48FB/OPsChr0/90/iKyEedHG2qjeiRK
	 dgbjrvlLah52YbIz+UXUUU4cKqW/x1GpaQtRsxQK/7KKbeQF3O7JqcIBc0KbVhLy8XY0q
	 Nrs8WPT6XMQvmwJmbMre56YPAn5Vgk5Rvxqq+SSeW2qHqCcnWBA3PFm6GvxXk7QMPyg6d
	 pE1b1pkVOCF8ei3zlMeVYEOBymy4oB5dj/opv1Ik0YZrEdvAGAPWdfzmQo9WwtnvsZ7Ks
	 PHH/yzly1AThuGsfMVJjxNhCcrCDDOxNyayaZ0xXItoyRqi/3QlzDZlYzLn6h5Gbasw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/1iJree";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F2606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/1iJree
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF8D1F000CA;
	Wed, 18 Nov 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991632;
	bh=P1uT/GkM5nEKkQFVp14onlceujue4jdeyFiWUGextFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b/1iJreee+T0qf5SozBtDntuajhiDejqcI2HR0Mh3aorz38Cfgh942f5XI3MeBPLJ
	 2dkrxET3JfeoLuaJ3BMXfpqhjBiUmVHgWPCP5wUCS4/sPOiC4SrjATNATtlTYVkz07
	 WXK2JQ/il9fjODRyBqYw4O2/yXQNQq2tPiSHu+dUBE07VwuKvJEggwiB/P1+KNv4yl
	 ZSX9jlNfv89zNKfU211fnmQF+5KPQRDs8PkYVfa/7YKgCH4KTmVPDQboCVLLWvJhOS
	 gSLe9lRD2/hfindHHjDkAykgEvKCIjD5G2RUqxzSSavCKjSKk+2Q3EmDaPFYU50qne
	 SnhGqFPEmTtxA==
Date: Wed, 18 Nov 2026 09:47:10 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 10/19] wifi: mt76: mark all but the last
 subframe of an A-MSDU chain
Message-ID: <av1mDreZ50FCUFZ1@lore-qca>
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-10-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="LcIJLpN9u/TZoSS4"
Content-Disposition: inline
In-Reply-To: <20261117180134.2940930-10-nbd@nbd.name>

--LcIJLpN9u/TZoSS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt76_rx_complete() passes the subframes of a hardware-split A-MSDU to
> mac80211 without RX_FLAG_AMSDU_MORE. They share the sequence control of
> the MPDU, so in 802.11 format ieee80211_rx_h_check_dup() drops the later
> subframes of a retransmitted A-MSDU as duplicates.
>=20
> Set RX_FLAG_AMSDU_MORE on every subframe but the last.
>=20
> Fixes: cc4b3c139ad3 ("mt76: mt7915: enable hw rx-amsdu de-aggregation")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index 271fbd4711f7..d72ade2d46cb 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1625,6 +1625,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct =
sk_buff_head *frames,
>  		mt76_check_ccmp_pn(skb);
>  		skb_shinfo(skb)->frag_list =3D NULL;
>  		mt76_rx_convert(dev, skb, &hw, &link_sta);
> +		if (nskb)
> +			IEEE80211_SKB_RXCB(skb)->flag |=3D RX_FLAG_AMSDU_MORE;
>  		ieee80211_rx_list(hw, link_sta, skb, &list);
> =20
>  		/* subsequent amsdu frames */
> @@ -1634,6 +1636,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct =
sk_buff_head *frames,
>  			skb->next =3D NULL;
> =20
>  			mt76_rx_convert(dev, skb, &hw, &link_sta);
> +			if (nskb)
> +				IEEE80211_SKB_RXCB(skb)->flag |=3D RX_FLAG_AMSDU_MORE;
>  			ieee80211_rx_list(hw, link_sta, skb, &list);
>  		}
>  	}
> --=20
> 2.47.3
>=20
>=20

--LcIJLpN9u/TZoSS4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1mDgAKCRA6cBh0uS2t
rAUxAQDerm6uVbynfLD/Gf+QJhtAHi09z/Jn4n/sCYX0UCvGZQD/QFJTMPO118lg
lJ05EmEhUUO51J8Ayw8MnWsE1Z++NAw=
=dzmn
-----END PGP SIGNATURE-----

--LcIJLpN9u/TZoSS4--
