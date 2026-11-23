Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448441;
	b=YTyn0Wh5jIWOIRqNXwWlV73veZDNDOkWELP/XjC+KOQYZgm5R4Fbaz4pXN5yVnNE7xkV
	 5RacScqh1F6SONO5nPUNfSVLNJClRD6olB029Jl4gZfsuS5wko0aK+TCqXKakZAUMJICm
	 z5m/3emSOUEy6T9QG02+DupOxkB8sXy+DA55uWNr9MAAUvFOSewnfGQNtseOnyD7kBBa/
	 Lqm/dobO4hktjxuvfEtVMrgigIUcV1BCFBpCB9i3PPtL2Aj/0kuesc18KNFP8/LxjT1kL
	 u9jVB6wNJUSi/G1EosG0YB16TM17j/mEiFEDzbZnvJ4Yw8QBfjqJ86QBr6O58kwNg3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448441;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type;
	bh=xonXF4RFEI25JoDyGqtgXrCKQYjzrdqSbo3L7yRFsYg=;
	b=qlkRBiDyzvxMoLKjjyu+9PAF4NMP0C7HUps4Wd+ittTdkvO3LOf/Jzc0HVSTvN9EPjAy
	 3v5BnwKxpymVx9CXn1zDHHI8gSj0bUtLJpNgY0eVbzqhxXgEeyv2jEbsujHNQdSmgaF4O
	 wC3mW/gXDrGewcQ632LeqgV+g+YQIlRPaiaubIf7t5Dou9ALW78Ze9T8k1r5FpxTPBTRK
	 lIHusvu6JmXdvUcRLNnjXXApIrRlmWVa3G7DcuP9FDvmmj/eB1xVt0PnfL6WdqyutYJCG
	 xLDhXRhLFmYHBexzNAwyeemYJEz8/pgE8zzyj1UU+3H5JSoFLCwyrFJjsFPcTeV7jjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=fCTPciBB;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00120606A32E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00120606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=fCTPciBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795448432; bh=uX3BEfN8Rch0e7f8xmHdSYDERPRwkbDq/DEnLTVlbso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fCTPciBBkK3EcSJwswwRAXqKdogcXz9kXMkodcul/Dz6d/6JEU0/k9SNFID02cAWA
	 lFf/W2mmFc+O9k0XB12lPhoQUaeubpCtOG4Yrjk2zyj6gt01NMWCdaQCQQ5o2r5Glt
	 pavGQvrWuXxU3mxV1h3RGcTLTryEkcElABq9EPFlUZSMDpj/DkZsUD7WhqVYTDaowr
	 33Qnkv07/sQopUq38MjQHB0XNsqWRdyAqT+568WRZ4qej+d4cY8Bz4LdgVMMegKC0X
	 9fNR49tVFg1GkbxXFzXokwUaBNH/wyx8yc8e1JQbifDDh2U5Bv3T/+sv4rI1q6yA2w
	 Pk3xBd4ejUwOg==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Gaston Guevara <guevara.gaston@gmail.com>, linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: Re: [BUG] ath9k: WARN in ieee80211_beacon_cntdwn_is_complete() on
 every CSA when AP and STA share a radio (ath9k_csa_update() visits the STA
 vif)
In-Reply-To: <CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com>
References: <CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com>
Date: Mon, 23 Nov 2026 16:40:31 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87mrqzeets.fsf@toke.dk>
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

> --- a/drivers/net/wireless/ath/ath9k/beacon.c
> +++ b/drivers/net/wireless/ath/ath9k/beacon.c
> @@ bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *vif)
>  {
> - if (!vif || !vif->bss_conf.csa_active)
> + if (!vif || vif->type == NL80211_IFTYPE_STATION ||
> + !vif->bss_conf.csa_active)
>                  return false;

I think this makes sense, please send a proper patch.

-Toke
