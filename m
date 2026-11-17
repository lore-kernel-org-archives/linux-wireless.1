Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924375;
	b=X+STI/DOr53OkH8njb1t2lrdg8skafpLAUUjWi+JMiQXsr/PYyGBZUcWzvO5YMEwPwRO
	 KGnVmzOIvmwZYiGf8/P6oXOUtPF64nmndcirKWJzRKNb2sXl7VTh+74fbeqvPPZdCuEyI
	 Rtg4ULxZAslYKY/9LsjIewcggc8h+ClZ3Vcksi7+TNYvkGsFiFC2EubV/XBUwHQZicHdd
	 /+6pkCLmYnXYjpdfC3mEvg4GeCKSiJb8CjoET5K+jNnpz2x53YH2oY0UTOLA1OKUCFPKt
	 aTISlSo+/6/NkdqLkmt1cquHbG+CHXipsYP6fDtbxJzIhBCj8xys3cqmfYKR9U/ZiEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924375;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-malware-bazaar;
	bh=TI4z+WsJUkXducHM9tsLduN4n3Y6eqgVGUOqVnsPesg=;
	b=sRr3vQGLi5cbxVJx5kf7Mj1q/v6vfhC2j9KoS1x5DyEIsC8jDW81/aY0ClwhwX41lD0E
	 Cyv3SuyOnX6MB8++91dsYIYZx89ppuCVA7HFWxX83DLpQzbFGefTPXlAd4nAd/jf1Ktw0
	 XNgvT3Yke6xJV0yCdLkFOJf2T13+658xbB/DJrYazjlXeLsrubgmRu9Im0zThq3ex9dDK
	 flqeLow06dmkFxXmof4F63WOhUvYWtxwFSQs0LwrdGIs+VEmMGJZ9h9ZyEhT5hf6Qy0x+
	 7fKTfKWswPQpL8ry0j/iokJnTrNJZNcvy1BSM2N0OfAoR2o+8zUuY+BPiZK/4gjnfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="tFqZN/Wm";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC12606A330
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=tFqZN/Wm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=TI4z+WsJUkXducHM9tsLduN4n3Y6eqgVGUOqVnsPesg=;
	t=1794924374; x=1796133974; b=tFqZN/Wmm1xEpjehWAzOWhOxpMLxi3ef1cvtdAbefHvPf8q
	TQkyQQVopcIdPIQs1tPzXNof6sNZGEZq/aZ/GDl4DJV5cfxXjxGYx0RKTKX7Tn7CLCsHG8Gio0PiY
	BJPm6kizC2VfpF6rWtVClIIvYqevLbCo6Mifcy/po19ENQwAfnFY1hn51J3xgUCEnFma5fAzAmHit
	fkPvJuQEZkBFJT4OWm/j7BVJJGo44qIpYuC4I0pnAiKupeDvHWGJNMbRvd9iMeWr5ky1dBSSi5u8b
	807C/zjI8aBMA1N4Vw7g3V3z5A5zAu+DdTIjQC3PsxUMXL1WEdD/W358pUSywnKA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xTJp0-00000000YNJ-0vEO;
	Tue, 17 Nov 2026 15:06:06 +0100
Message-ID: <d654e38a45785b29bf79cb35929d706bad1ab909.camel@sipsolutions.net>
Subject: Re: pull-request: nxpwifi-next-20261106
From: Johannes Berg <johannes@sipsolutions.net>
To: jeff.chen_1@oss.nxp.com, linux-wireless@vger.kernel.org
Date: Tue, 17 Nov 2026 15:06:04 +0100
In-Reply-To: <20261117134456.477898-1-jeff.chen_1@oss.nxp.com>
References: <20261111013858.98465-1-jeff.chen_1@oss.nxp.com>
	 <20261117134456.477898-1-jeff.chen_1@oss.nxp.com>
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

On Tue, 2026-11-17 at 21:44 +0800, jeff.chen_1@oss.nxp.com wrote:
> From: Jeff Chen <jeff.chen_1@oss.nxp.com>
>=20
> On Wed, Nov 11, 2026 at 09:38:58 AM +0800, jeff.chen_1@oss.nxp.com wrote:
> > Hi Johannes,
> >=20
> > Please pull the following nxpwifi updates for Linux v7.5.
> > This series adds P2P support for nxpwifi.
> > Resending the pull request.
> >=20
> > Thanks,
> > Jeff
>=20
> Hi Johannes,
>=20
> Just following up on this pull request.
> Please let me know if there are any concerns or if any changes are needed=
.

Don't think so, but also haven't looked much yet ;-)

I've just had my own pull request in flight, which only just settled,
and I might wait until Friday(-ish) until it all settles with Linus
before I pull anything new.

johannes
