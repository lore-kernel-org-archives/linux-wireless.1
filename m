Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844846;
	b=5tOkkoXzzEyN2EfoaLlmoWEjateL/j/aezq68p9hRvCdmzzLmMGRBC0pt7GsYgBVwued
	 hU6d/IiWec6UgfMMWdl4zpYwm093LHdFr5X/LU51Wm4JeSyLJrvdJnfG7cUJHCka6EvfC
	 hfaUEKgC9akoHv3C3lLIkm5ggYqIsUscCAeStlhHGKjG4+7nZF++fk8pSEcl+FLCz5a5K
	 ss/Jq5KVRbL0jr0gqm5RLS97Us1RLfLcULJl7mIjMMdbKNNqo96iXFxPOWJ8KjQ65u/Ue
	 N+kWrEvDIJ+OX6P/PRTJ65P/0gLbOGowxLMFlKybfj13rUGlKOoeJDRL0TFbNLsLFiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844846;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=awUBBokyjA1ESA7ZA/rLZ5c8P1+TSeCs5IsCOdLW0uw=;
	b=uZwHrvU1GznJtZRRFqNU4+Zg0xeE4WL4HMvVzUms8GlIRRoZwDB0YiaA4etzc8zuXXXB
	 h85VPPJwTIKdvCiviT3kQEqmvP0gAcQUEw7Aw5AgvtMIy8M5OVrbhduJOEnh/2gtzFwwG
	 LrCARmCp7Quaj5Geh8GIZVQCFIpqls1+y8yw9+jwFE5IQL+5SgAoUOfcB/HoRuQzBUfqh
	 jK80yqsFcDnxMekDBswWa/zTho74QtHy0qWN1sRmeD1GHM9nFuzE/DVbWEVlV0e55X/Vo
	 1O94RvaeuEpxRBQQ4JURmZR7+QL8HgOr3btFPV+jEykP6R3m2E2lK6hvkHSVKIlqceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=VXeBAdYi;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD2606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=VXeBAdYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=awUBBokyjA1ESA7ZA/rLZ5c8P1+TSeCs5IsCOdLW0uw=;
	t=1794844846; x=1796054446; b=VXeBAdYiUUsDH0KezWHHClG6G0iVy+BX/fvPITt44pxCqDM
	c8t8b5pCEE6wqYcS5NBn56S7l/afAQ0UGfTIwAbOZLYxsidP5EXK30gXM7Bho2fnl6kJf8BLqkyOs
	d/bcqS2LsfI4CvnDAfleDn4nx1yYxdttXg1iK54MRH4pyBemEN2Pmsjk0AtiRn90IDby7XSFUY493
	zF6Fk+bnbTU9u4zcpTSyt3V1mX6pqNk1+VciWtODFmqWL1w9PthsSDiEmjFrWrKafn+bRATSZI4i9
	TQr5kjhdxnoCGXlqXyWctp1MWxSTTe/q8qBZHPW33nWR7VpnPA+zydJ285oUT+XQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSz8N-0000000GomW-3obS;
	Mon, 16 Nov 2026 17:00:44 +0100
Message-ID: <dd56ed9479b239b55bc13d08d9a2d111e76ebad7.camel@sipsolutions.net>
Subject: Re: [PATCH wireless] wifi: cfg80211: don't call CRDA for a country
 regdb lacks
From: Johannes Berg <johannes@sipsolutions.net>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Martin Moosbauer <martinmoosbauer@vivaldi.net>, 
	linux-wireless@vger.kernel.org
Date: Mon, 16 Nov 2026 17:00:42 +0100
In-Reply-To: <20261116155339.6127-1-lucid_duck@justthetip.ca>
References: <20261116060723.37130-1-lucid_duck@justthetip.ca>
	 <20261116155339.6127-1-lucid_duck@justthetip.ca>
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

On Mon, 2026-11-16 at 08:53 -0700, Devin Wittmayer wrote:
> Hi Johannes,
>=20
> I see this was marked rejected in patchwork, but I didn't find a
> reply. Is the approach wrong, or should I change something for a v2?

You've not really convinced me you're doing much more than feeding
things into an LLM, but yes, it's just completely wrong to make any sort
of relation between those two independent paths here.

johannes
