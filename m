Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304668;
	b=XrK7NZ8GWCpIzKmjpfOv4v6hCVAd1N6cTxF3j0iPBpGawlyfaEbPcp0+3p5WDoUBZnu7
	 jLvFzOPbLAL+q743rr4CRj/P3dZ/GCxhYpcEWKKDSXGNnVPbrbxqkO0/twN+LZVhLbvTZ
	 Ar8DJDe9oys36RwKBVGNlEhbXM6mtadR53oJAvClKVikOWDDwOzR0G0i9MV4wms1+aKET
	 /beLl/aH4D82NXT4Mbs98+S72+WMUwOvc4t7fkNElHgJRQOafkd4nlBh5Rld8voHVSj7J
	 Y+CBm2zDIoDNzC3IMjvA4dBwAOMME/QMiNMfBeTO+8/vdlw4Dzc0rwq9VkEMrOBbVWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304668;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-malware-bazaar;
	bh=pUfBgVGShCloFr9i2sxfNE5NDepbraEnQ4yKIpd+bVE=;
	b=looZnQ3qztTXsIMTSZLnjGJveIKvMiFTqklNsJoSQ8rPAxIbz3O0xpD2qdRPI47t7IAH
	 SbkymcObAcRZT0YhynJz0+MXhFC6nPU8SiaPOJAcr6ww6baEeYjHxEZA+AQwyRBdIbn1s
	 KnZzBjf7ghWjHcIYXlfnrcFzSV1eJ/rUBVUGQEo2Y4o0KV38494jYWCZgps2oZ33/l9Xv
	 D7xStiSN4LFSWKwia1G5yhwyFT0WtgtcGpcYnLKc3eqL31IdEOaNLoqhgVBeyzqzw5W2d
	 sXkVVpf0YCuQUlh+Yl/SgEgYVFkPWJiSArfBXsSjBySF93PW+KG8XZ4ZySRIdjIOLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=GQtW+6UC;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B55606A33F
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=GQtW+6UC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pUfBgVGShCloFr9i2sxfNE5NDepbraEnQ4yKIpd+bVE=;
	t=1794304666; x=1795514266; b=GQtW+6UC/5fv82o+VAh+cTGsRcyquGyfhxG6ETMVhoWQn7e
	eDs9A7Ht07hD1O24F44A2rqHds46maSAQ7JrwW+TMI1FvKT8S3l2kdOVAHZD9QIMvR10PrGs0zOmc
	2hVE+6JKurqXqs5jAX9HnrZ1pkiZdcFFXcjjjoEjKG2TQPwneljg7uwB8hdDfFjMuqXKiVKPeOn8T
	6SGeXiy+UVZPeHDws5zLL4iDPOrQC0eKaIwE2cIiPZcoXYrMFYKdhDaop0i8F7x45YLvxY+3id8K+
	jMKZnvpjgKulP29y7eLSkr0A7UxJVxDKGjxnTUAWFv7TO4/9fATPvFAwvGaFDEiA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQibo-00000001Q7m-1bHN;
	Tue, 10 Nov 2026 10:57:44 +0100
Message-ID: <12bec15dfdd9152ee450076a45c00679b9cd5d08.camel@sipsolutions.net>
Subject: Re: [PATCH wireless 1/4] wifi: mac80211: keep the monitor chanreq
 empty without a channel
From: Johannes Berg <johannes@sipsolutions.net>
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
Date: Tue, 10 Nov 2026 10:57:43 +0100
In-Reply-To: <20261106154648.1228594-1-nbd@nbd.name>
References: <20261106154648.1228594-1-nbd@nbd.name>
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

On Fri, 2026-11-06 at 16:46 +0100, Felix Fietkau wrote:
> +++ b/net/mac80211/cfg.c
> @@ -1165,8 +1165,12 @@ static int ieee80211_set_monitor_channel(struct wi=
phy *wiphy,
>  	ieee80211_link_release_channel(&sdata->deflink);
>  	ret =3D ieee80211_link_use_channel(&sdata->deflink, &chanreq,
>  					 IEEE80211_CHANCTX_SHARED);
> -	if (ret)
> +	if (ret) {
> +		if (ieee80211_hw_check(&local->hw, NO_VIRTUAL_MONITOR))
> +			memset(&sdata->vif.bss_conf.chanreq, 0,
> +			       sizeof(sdata->vif.bss_conf.chanreq));
>  		return ret;

I don't think I see why this is conditional, and other places not? We
_did_ release the channel after all.

johannes
