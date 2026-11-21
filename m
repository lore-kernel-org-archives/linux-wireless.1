Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255825;
	b=XpYv2aXLQ0msU2uo4ge/ba+bCzricr84vDE/KljVmy8YeeYSj68uvnTffL+tuh1bfNgk
	 w5fBBKewmXbKPCKFpKAD4+uW8Ze3ccaPRECg2B+OfeK6pRVfUMFtM1fTEjJLBbzbWhskT
	 xomkhIKxu/vYvofvaUrjYSidlnx2BU+HtvjAqshNcvWLn4/D9PKuTLdXVgtJDHbklFYEU
	 SLT0G4hIFXmV7fJL0koCunrCobPCK/MBBWhyNN5JLdnEdLPyIzelBth0LuWTrbLlPRCVe
	 QxGKywe3CoVljcoGu9+Mq9tpHFRPxnUUkPuL/RhOczh+jFY5sgy2VtWKc7YPFgJJwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255825;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Da7mcUM2lG4eJHkRoTRt/Da/jKOZ6OJ866bixU36PJA=;
	b=J+giBz7qi4Fw+UmUsTevZ2fsvanvs3lIrOtd/GsBfPpcyFig8+mKVzclR33Wjk4WY8F/
	 2Ld0nDY0sNoWGcwnk0Nn69j9eON3lTyZSsMrD0pQXNj+UMhMm9zxeurgmhAp3eTiHTztx
	 q403v/TszwWLMeP0QtfCvZgejmnp4SoMWGO4qIgUVykM28LFrknLcLTLW313l1+enBbPG
	 3YOFfqEywHAk53Y+WcIFGyN6LIc+lGq2+8AWNYMNSSwuO2l04wk142NEFCXSQIzhOq6CI
	 PEA5H6R41+sKphJsas+WUF8L5Vax6f4tudg22m7s8cK+L5CojhsntLnqel2J+bComRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="arrOnQj/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B3606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arrOnQj/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FF81F000C6;
	Sat, 21 Nov 2026 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255825;
	bh=Da7mcUM2lG4eJHkRoTRt/Da/jKOZ6OJ866bixU36PJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=arrOnQj/jaWXPixRedWQOCQok8bZmiKPqO8oDjJusJTbOp47GyNGsEtKLwioP87bp
	 b3I7EgWFbamflq8IrqgAIZvP3yrtTIwry5j26a/wZM5pA6hZKQs8te7Ds0JaMDUq0i
	 XHCYBpof6LU+SBlfbAqgCFNgmY8HcbXVMp3KUDwP8S24V0hyFloF1uuG2f2hNsX3mv
	 oggX+Cv4/pdLGA8aHskoiG97E18AHdKPIE3mONR6zg1gbmhHQpDHImDmQmnHbR9ZzQ
	 I5QkMUwzp9X3n9zhJmvgVELVNaTOgJ8GZ2LD4/TSeLusCqjVaK/NcapjpxSsK9QNDA
	 hAuZACRGJB2Ug==
Date: Sat, 21 Nov 2026 11:10:22 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 16/20] wifi: mt76: buffer Disassociation frames
 for stations in power save
Message-ID: <awFuDuulV0phpqdt@lore-desk>
References: <20261120174459.1657382-1-nbd@nbd.name>
 <20261120174459.1657382-16-nbd@nbd.name>
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
	protocol="application/pgp-signature"; boundary="1/Bp1wiQcNgJ4uih"
Content-Disposition: inline
In-Reply-To: <20261120174459.1657382-16-nbd@nbd.name>

--1/Bp1wiQcNgJ4uih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Since commit 3999d15cfcc7 ("wifi: mt76: fix queue assignment for
> disassoc packets"), a Disassociation frame to an associated station goes
> to the ALTX queue. The hardware sends ALTX frames at once, also to a
> station in power save. A sleeping station thus misses the frame and
> stays associated until it detects the disconnection by itself.
>=20
> Send Disassociation frames on the AC queue like other bufferable MMPDUs,
> so that they wait until the station wakes. If the station does not wake,
> hostapd removes it when the wait for the TX status ends. Keep
> Deauthentication frames on the ALTX queue, so that hostapd removes a
> deauthenticated station at once.
>=20
> Fixes: 3999d15cfcc7 ("wifi: mt76: fix queue assignment for disassoc packe=
ts")
> Signed-off-by: Felix Fietkau <nbd@nbd.name>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/tx.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wirele=
ss/mediatek/mt76/tx.c
> index 72d1021a940f..d8036466f495 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -729,7 +729,6 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, =
struct mt76_wcid *wcid,
>  		    (!(wcid->tx_info & MT_WCID_TX_INFO_SET) ||
>  		     !ieee80211_is_bufferable_mmpdu(skb) ||
>  		     ieee80211_is_deauth(hdr->frame_control) ||
> -		     ieee80211_is_disassoc(hdr->frame_control) ||
>  		     head =3D=3D &wcid->tx_offchannel))
>  			qid =3D MT_TXQ_PSD;
> =20
> --=20
> 2.47.3
>=20
>=20

--1/Bp1wiQcNgJ4uih
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawFuDgAKCRA6cBh0uS2t
rGkJAQCDMkDtVK8qiBtE9wnWIXXFr3xQ0BEfSa7Uqx4tRZY7oAD/X9gVKVsymsj2
f3LWU6o71xd27M03Zy+Gb3aK6KrF0Aw=
=mzRC
-----END PGP SIGNATURE-----

--1/Bp1wiQcNgJ4uih--
