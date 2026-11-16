Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825418;
	b=L8Se+oy4VyyjuLlJJBR4riYLTFqrF18ASIl3/gTp96MbB2jC7Sv5jgxERZM6J05O5mou
	 YCBhPla1RJgclM0mX0CghMXJ2zVhZOeV6GTRRttYpex+2QwJoTQACo1cwoEpY+0qlfQNA
	 WMsBadMbGOPCRTUnIgvwacUxdBr4Loo/aEclmW0UezDDIyAl/Fzic8+IE4Lw//hgHNrSs
	 1LvnGO1KhyDOvN4LM4Vw/w/V/xA+IJEq7yBEnUlKgkzNQWmgLlG2V4FOWrQ6UQH2xgl/e
	 Krh5HN/kaQDqgUHUTAbcGQeKX+5vbptnHZdMLMYE9HT14SQujyaZ7Hc1jeEgHE74J4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825418;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=0Lfd5Tu63ALhg/Z98/F6CBGlcx1fTXaoOVqqGYFKYbI=;
	b=0isy5vfeE/H4Dp0qpE8BMf+wc8qQ05MNrQtpjKqqddHad+R6lcvJEGOour80QlcvYScL
	 ywFFKchUHSTu+esRngTnKmZO2TcUb0qk5gsDay9FCcVTlhMY0le8J3944CiIBZa12JW1h
	 h5tCjTPAooDAjHIr0AIAx+zR4xsOAO6k83gNx3CiU6mzCcwcTn9Hcaa1J52Ptj/16x3xH
	 fcpzIXSaT74SXaC3HF8x13B6+tPNRNZKnKZnvHwEcbrCFN3w1WBbqqnkh94K9+k1YgIeX
	 qkNzBzRAtStFAStfY8mDUkjU9DwFDCh8B4etzpn0Pg5tfQROs1YTjwqSQfqQurM6f0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=hgtvTbVB;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A18606A882
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=hgtvTbVB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=0Lfd5Tu63ALhg/Z98/F6CBGlcx1fTXaoOVqqGYFKYbI=;
	t=1794825416; x=1796035016; b=hgtvTbVBl6On+DYq69n5I5/58GUVMDkf5TSUr4WgCxPoj3o
	HRaU/3xoLV5UQZWH9W7uXXdjtMJZ0ajPBjfpmrUAZG4CJFuKtzxSqoMWRy5XplkGdNSLJnggmb5jS
	P14TyRBqeLV5LzqaoT387Die3XxHIo318Pz+GnWe3eDg/TeIdNkD9WvmfmlzTdwpCax5DMOxVVEg+
	0n9CFEJ4GhvtbR2N2lQd7i6XdDkCDkk/MEop9GpeCA8BV8FwWI2Hft/CrtbWWaLyOGAJEAXNoXuAz
	K7UY3j+IoJ8dQHyGG6vrSgii5+08HVlw4AkSnH97MZmXzQFff3ZPfbY2gzSg82IQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSu4m-0000000GWxh-3kqT;
	Mon, 16 Nov 2026 11:36:41 +0100
Message-ID: <866f6a81c1dfe95b3969361d5ac54f615f060eed.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: libertas: reject short monitor TX frames
From: Johannes Berg <johannes@sipsolutions.net>
To: Kai Kuang <kuangkai@kylinos.cn>, linux-wireless@vger.kernel.org
Cc: libertas-dev@lists.infradead.org
Date: Mon, 16 Nov 2026 11:36:40 +0100
In-Reply-To: <20261116101615.276337-1-kuangkai@kylinos.cn>
References: <20261116101615.276337-1-kuangkai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2026-11-16 at 18:16 +0800, Kai Kuang wrote:
> In monitor mode, lbs_hard_start_xmit() casts skb->data to a radiotap TX
> header, skips that header and then copies the 802.11 destination address
> from offset 4 in the remaining frame.  The generic length check only
> rejects zero-length and oversized skbs, so a short monitor frame is read
> past the end of the skb data.  If the frame is shorter than the radiotap
> header, the subtraction that computes pkt_len also underflows, turning
> the following memcpy() into a large out-of-bounds read of the skb and a
> write past the end of tx_pending_buf.
>=20
> Require enough bytes for the radiotap TX header and the destination
> address field before using the monitor-mode header layout.  The check
> runs while driver_lock is held and before the TX queues are stopped, so
> the drop path reuses the existing "goto free" cleanup; placing it after
> the lock is dropped would unlock driver_lock twice and leave
> tx_pending_len set to -1 with the queues stopped.
>=20
> This addresses the same out-of-bounds read that the earlier submission
> linked below was meant to fix, but was reverted because it performed the
> check after driver_lock had already been released.
>=20
> Link: https://patch.msgid.link/20260704011140.37639-1-pengpeng@iscas.ac.c=
n
> Signed-off-by: Kai Kuang <kuangkai@kylinos.cn>
> ---
>  drivers/net/wireless/marvell/libertas/tx.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/net/wireless/marvell/libertas/tx.c b/drivers/net/wir=
eless/marvell/libertas/tx.c
> index 27304a98787d..6ad7a5067f2a 100644
> --- a/drivers/net/wireless/marvell/libertas/tx.c
> +++ b/drivers/net/wireless/marvell/libertas/tx.c
> @@ -88,6 +88,22 @@ netdev_tx_t lbs_hard_start_xmit(struct sk_buff *skb, s=
truct net_device *dev)
>  		goto free;
>  	}
> =20
> +	/*
> +	 * A monitor frame carries a radiotap TX header followed by the
> +	 * 802.11 header; the destination address is copied from offset 4
> +	 * of the latter.  Drop frames too short for that layout instead of
> +	 * reading past the end of skb data or underflowing pkt_len.
> +	 *
> +	 * This must happen while driver_lock is held and before the queues
> +	 * are stopped, so that the "goto free" path above stays consistent.
> +	 */

You should never let LLMs write comments ...

johannes
