Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470444;
	b=GOgWBFd8AyDsbvlLLRqPVa9Kq4P0yfR+Oqk2qjlTgf8Zt0um+Dzl8Saqfk4p7wWhanaH
	 TgTy2tkDC2bLuiyzgRYd/SESvQr4h/bOfMLfDYd+XTXyWXWrfMGozx5ZVijhjMn1sT1+H
	 8tuNHtBLPoSSHs95BrSV0hXa++eyUZMq6kp3HSNG6pafgHRE39NgMk5rZauOXnMK7R7zQ
	 +A+Qfni/b2z3YL4d1OWVhLv+RAU5/Ijq6fPf5LNCn/jDZJztc0ajiS06NwyMRzqofQkzm
	 FF+ZsWXs6TeToGinxuDW95Af8TX8hKQrwwcT6yTc01qXP41J5y0iDg4K6+c4UTBciTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470444;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type;
	bh=Sfo5gSBMS0w31r3uCXml3hy4zFYrUXUDs5/p39rwnf4=;
	b=yQCyWHjzYxsGmXXhleZHKlYP3dJ1X6NbAft07Kiwdr25EsK7EkDXGPjbO2Q0TvqdH2DV
	 ToK0A9+fMTBAGFCttXlnaeHZGy/cdN1ttLmvIq6ZDSGhO5lKo8E+49kKGL2z4w8RrG9v4
	 /EXjno0m8/kpleAE2pC06/mtE9K96jUkuWsTtkF1wI16PK5uZ37aRYRZnwL/BeFwsLqpy
	 /85cuBTC5pjrKV8lVFnXkY/Yjt4fA83klTkRcGpotCHQPlBBmpbl+heTih3Md2rVpsl4w
	 M8amHwOjq2DE+1yJ5Li36dZZEVlRiIB4u9CdfMPOWrH/J7rw9dlLcUA6CgDcdjeAQEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=a16LX381;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CFB606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 21:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=a16LX381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795470440; bh=ojzj8ecb72Bq2+4bElYv41NruwVQIb77CEPqDp27Hp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a16LX381yXaawMlg+bXi0MkIu6EqR6ZzYbGS7/0oHYSpa2WsC12lINbKnHpJrJdD2
	 Y5jYmka2VVpNgiIiP1yhN5ExsvgmWdMAct7QYxNTWKEh7Cyx1W3nB1Mus/htEBEqlw
	 jPC/Bwuz/HV5I1EfNnXdd/9y4XrIvkLm9Ld2s4M0F9M6kZFQ60wkwSFC6kn6EYtgGz
	 4IrTczflciJlvgIOyL+hEQIy6v66+r90H9rhorUVG9uhaE0FqzGk2WHBkFN6PAls6e
	 W2MH7saP1ZlOBiX0RZkAFSp6Dtl1ufgL1APksepN3NqsAylM1UMfr9mUofeIw7iGDS
	 pyNp27bj4zM+A==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Gaston Guevara <guevara.gaston@gmail.com>, linux-wireless@vger.kernel.org
Cc: Gaston Guevara <guevara.gaston@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k: don't check CSA completion on
 station interfaces
In-Reply-To: <20261123210815.25770-1-guevara.gaston@gmail.com>
References: <87mrqzeets.fsf@toke.dk>
 <20261123210815.25770-1-guevara.gaston@gmail.com>
Date: Mon, 23 Nov 2026 22:47:18 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87bj7fdxuh.fsf@toke.dk>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Gaston Guevara <guevara.gaston@gmail.com> writes:

> ath9k_csa_update() iterates over all active interfaces and calls
> ath9k_csa_is_finished() for each of them. mac80211 also sets
> bss_conf.csa_active on a station interface while it follows a channel
> switch announced by its AP, so when an AP and a station share an ath9k
> radio, ath9k_csa_is_finished() calls ieee80211_beacon_cntdwn_is_complete()
> for the station vif. That function only handles AP, ad-hoc and mesh
> interfaces and hits WARN_ON(1) for any other type, producing a burst of
> warnings (about one per beacon interval) on every upstream CSA.
>
> Skip station interfaces in ath9k_csa_is_finished(). Ad-hoc and mesh
> interfaces keep their current behaviour.
>
> Tested on a TP-Link Archer C60 v3 (QCA9561) with an AP and a station
> on the same radio: twelve consecutive upstream channel switches with
> no warnings, whereas every logged switch produced them before.
>
> Fixes: 4effc6fda7ab ("ath9k: prepare for multi-interface CSA support")
> Link: https://lore.kernel.org/linux-wireless/CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com/
> Signed-off-by: Gaston Guevara <guevara.gaston@gmail.com>
> ---
>  drivers/net/wireless/ath/ath9k/beacon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath9k/beacon.c b/drivers/net/wireless/ath/ath9k/beacon.c
> index 4a27e3753c03..ff72f231be5d 100644
> --- a/drivers/net/wireless/ath/ath9k/beacon.c
> +++ b/drivers/net/wireless/ath/ath9k/beacon.c
> @@ -362,7 +362,8 @@ static void ath9k_set_tsfadjust(struct ath_softc *sc,
>  
>  bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *vif)
>  {
> -	if (!vif || !vif->bss_conf.csa_active)
> +	if (!vif || vif->type == NL80211_IFTYPE_STATION ||
> +	    !vif->bss_conf.csa_active)

Hmm, actually, now that I think about this some more, I think it's
better to move this check out to the caller (in ath9k_csa_update_vif()).
If we ever do get called through the non-iteration path with a wrong
interface type, we want to hear about it through the WARN_ON.

-Toke

pw-bot: cr
