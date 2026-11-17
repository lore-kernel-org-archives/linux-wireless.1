Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908194;
	b=DMl+zAn8TzO9DIPeIDkKikIyQ5j1RiGBPFgFCPDk7SoefB78Y8Obc3w+OWR5Sd3dWY3K
	 ToXZZhknKyI01XOXs/iKgAu7fYSDCI2hqsqdKDxJJdEYPvVtxciA/K3fsxDqoUvFFOlrW
	 mGFHnH1IzKpVHxTjJGbW0ASgM6j3Q5fSHEYLP4J++U52AKctoirLROzRSvlQ0j75/p+qf
	 7YgXRcnNRZKow1FDW4i6HqQI0dt5WGSuTpQTj+M7oanNypGpCYr7I/H62DnrLCCXOYtTH
	 ETnNIqGLEPaerIQP0IxOzZTSuSrJHkdr7Ea9oeCy6VuBMCjxvdEDHfRREbbhfun0F+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908194;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=mmoOL9TxuANYAsujlxrcguo44tEldsX5JWB3FQvn64o=;
	b=R4gucyuTbwacqHcu/ER4HPs2zIlh5t0Oq2VA+KhoYMydMWwBOCBvzjaWMd4yURzxlMlL
	 2tx/3wIV4g5z8vVGMFQZTJhQ+69s35Cz7jD5RpZPbS4ZAnLPbBw2OzgRpskOV6BAw0X6M
	 DLnSDUSTpZH9aRV0ShPcFNOU/dXywOKywziD0atGbIZFSz9qv9Z/3vhjBzsyKFVWSSbAO
	 pPzmOrhSvrmsG0dstsyNj7cuNd/0XVkV/wT28nl/kcLgTt0DWURIA4+qf4pmW5jY9EN3E
	 O/0oqqbg096ceSCt33XD0FvNV/5pNApqNAXuy0Bb2XgSOWAPk16P/buGcnb6coNa9sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KrGUXukK;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6B2606A32A;
	Tue, 17 Nov 2026 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=KrGUXukK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mmoOL9TxuANYAsujlxrcguo44tEldsX5JWB3FQvn64o=;
	t=1794908193; x=1796117793; b=KrGUXukKdMidyfA4KWW62jKam3Lh4flMT7f0FRjiLch1lvH
	84FyT7TWipOToIM4IW7Tzy9rwoFlx/IhQ2fomntbcq4LH9Jp3NOJytpksBiK+Wx85bOTSQplGciD6
	QumDnKOSE8N1P4qwRkP3bNCN3QAGRulOFGqgr0/EWQysL17yiVn2NzaBwBnDDhd++Ngf36NXsDTOM
	Mr6JBiAGjyrV043H/ezZv2xCVQdXvVWOYJuiPBWYew1aGhvyIhXHt2vH00PomQXtnYL60rFs7sjCQ
	3OpmEeL1f6hufY/hCucvLfuxLFmtJE36MTrdGL3F2gi6JI2ggyqwEy2j6YyLsY5A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xTFc6-00000000CzM-2EDN;
	Tue, 17 Nov 2026 10:36:30 +0100
Message-ID: <63f451c9226b44361e38c05f8fb0c1846ac4d73d.camel@sipsolutions.net>
Subject: Re: [GIT PULL] wireless-next-2026-11-16
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org
Date: Tue, 17 Nov 2026 10:36:29 +0100
In-Reply-To: <20261116164541.3adf8979@kernel.org>
References: <20261116122302.1501378-3-johannes@sipsolutions.net>
	 <20261116164541.3adf8979@kernel.org>
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

On Mon, 2026-11-16 at 16:45 -0800, Jakub Kicinski wrote:
> On Mon, 16 Nov 2026 13:20:08 +0100 Johannes Berg wrote:
> > net/mac80211/link.c
> >  -> two conflicts, use the new version =20
> >     (the sync issue was fixed already implicitly in the new one)
>=20
> I shied away from doing this and followed Mark's resolution.
> AI wasn't convinced that taking -next is good enough, or maybe
> I fumbled the edit.. Either way, I assume it's more expedient
> to do the merge the way I did and let you fix up on top as needed

Sounds good, thanks. I actually mostly thought I'd let you merge it the
simpler way and then see what we still need, pretty sure the sync issue
was something I'd fixed on both sides, but I wasn't entirely sure about
the rollback ones anyway :) Will check.

johannes
