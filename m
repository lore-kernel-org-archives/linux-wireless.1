Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.2.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612169;
	b=C+3eETgap9b1tbIYZcOpKzPatctx/aIkxtD6QQn9pvqAc9lKk/Gljpc+8vjfz6QkcQn6
	 5C2P2+0GOnenl7EMqLS4yZ+43/DW9IsnN4qf90yg5+65MjReJEvUf7srOQEmL8CDpJZ+P
	 a6JXpFBUH746y13IwjoElU4ozC7GMbUgb9QzbE9Ggg+2nufLQhOQriEUnJDpHAcKgtq9i
	 Eq20uY3oJTRAq85zagR8jljsZTzeOVFTG5am4pvuOhDAb1GAXD9K/6d6aU8fGn0EM5sb7
	 anZF1V5+gA1IqikJmbo4eWefzNakDzhPnCJJJJZfnQM2rgf3/7zl1S4WbMBu5roBBeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:User-Agent:
	 MIME-Version:X-Virus-Scanned;
	bh=YWhnRNwmxzfxYHj9pjoF1k2oRy/qJ4v+6ZXKaG0u3rE=;
	b=yGlAcmtkyvMoHUq/eIwvtNEGgY49+7v/+aztDMgWc6Ow1/Waxa5/c7MYrtrMA7y795vt
	 bslNriWmPwR2VCdBnZhBpkkd10vq3EFnEU6Tv03qKVUOXeCYbMLO23XhT5KMolznYYo/F
	 v1TZuTmmcOE+5M1yrz1rmpkMtMqPgeWrq050IAMANdYrgu3jYIFFV9WrjG0bcZ0m56jfD
	 4fT/SiF3pchLjpyR4r1xjNm12bT/dny2WSKk7v8V0s6VmSKSasZ1tw0gBzWMSf+t9fCYi
	 qkTy1lQlyzz78iBoQ0jBDWgnKkpiBfALPBh7sLw9vmHZOJctS3+e+xKewJXUa6T2t9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jxself.org;
	spf=pass smtp.mailfrom=jxself.org;
	dkim=pass header.d=jxself.org header.i=@jxself.org header.a=rsa-sha256 header.s=default2501 header.b=JVKZZRZb;
	arc=none smtp.remote-ip=188.40.2.6
Received: from www186.your-server.de (www186.your-server.de [188.40.2.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C76606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 13:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jxself.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jxself.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jxself.org header.i=@jxself.org header.a=rsa-sha256 header.s=default2501 header.b=JVKZZRZb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jxself.org;
	s=default2501; h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=YWhnRNwmxzfxYHj9pjoF1k2oRy/qJ4v+6ZXKaG0u3rE=; b=JVKZZR
	ZbEj0Kc+7GhCrgBPXwRakZAg952a4K2inmkkMtbaslnkFHBU+SJvRtl7vMJjb/vuSAnXAYWxiLjXU
	+43v0A1Lcf322irVkt/442j4WApM5knYEuMo99gYcFzsBw9E1b1ttLoiwF30enmSfjAvjbK0YAQPu
	vBLFxTPSeHCYNMS2Vbe/2dtoyfupXb7KwmoilCfTWo8z5sUuQxldjVhUrmJi1NUQMghEWV2ii1XqI
	krL2ZKQTEz2Mp3v85QhWkTS5VFNWgyfvV4X21KdfiYIud1zNOcJ7+6XUEbEyflMu5dhfrliwdrHEc
	nbRoW1TD8OWxo9B4Adcw5wFON60w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www186.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <j@jxself.org>)
	id 1xWCkX-000BIo-0R;
	Wed, 25 Nov 2026 14:09:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <j@jxself.org>)
	id 1xWCkW-000D2a-1p;
	Wed, 25 Nov 2026 14:09:24 +0100
Message-ID: <90b7fcadc93f941bc529f4797c8b85a00de2cc7b.camel@jxself.org>
Subject: Re: [PATCH wireless] wifi: mac80211: wake TXQs of all ACs with
 fewer HW queues than ACs
From: Jason Self <j@jxself.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Date: Wed, 25 Nov 2026 05:09:21 -0800
In-Reply-To: <fb3146025af37481f714a0803708fa4eba90d6cc.camel@sipsolutions.net>
References: <20261125023259.820308-1-j@jxself.org>
	 <fb3146025af37481f714a0803708fa4eba90d6cc.camel@sipsolutions.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nddmGWczpIb1Nm/L7sEf"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)


--=-nddmGWczpIb1Nm/L7sEf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

vt6656 was removed from mainline after 6.12, but the same code path
is also used by in-tree drivers with the same setup (one queue and the
generic TXQ handler), such as zd1211rw and rtl8187. I reproduced this
on wireless main by setting mac80211_hwsim to a single queue. A ping
sent during a scan stays stuck in the best-effort TXQ, and the patch
fixes it. I'll work on a v2.

--=-nddmGWczpIb1Nm/L7sEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE9hGpCP+hZcaZWE7UnQ2zG1RaMZgFAmsG3gEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEJ0NsxtUWjGYpugP/iTaM3+O+iqXwA3i7KoG
lnXc3Lz/r+49fVWjP9CDnV1eMu9jH3QHvPlbESRiPm5E2DICoL8ybDeBSLZTPXGU
xrND0KuUPN6ADmdI08wnvUZIkxO/SJzQgebf/loyYJweeBCD+C7Yg4pIcZo7jE80
5c5qms2dKL1fJdNSOk5Ug9+WgxVA/Py3LAg5QtguyqsetZz8k+BSj1PGgqhJ0PEy
xrdKmNWEuWK0a4oj+ITScUlaPneCxhBmqr9I/r5D6wvjSk2R+umY+vVYMW/I5HsV
kCXa8ZMU2jLTtKfflTCFGrk/k3ZcUlmWjjHRvBKq7WQoNyxkx56JGGE9fzYCgzUA
VjvjW/nW7MOiw4OIudcUYsGicQbdsChtVN6HrDHD7e5DYHjhDgg5KUpfh3KdZyEK
SADdvIo/zTKd4jXD0DT2zAgImtFAt5kBQ0uc4wZHGcRfSdme04H4/vHJElwxGciG
rutAmdqO6nCNJVJYbycnZ+OIpZXKOivis6DoDFEP4ie0z3xKnnCkLv452D1joUNC
DxIrJvmaum6+cJUoqti3j6q3sHaSflSnArDoaVm1XwwJC2aNuxlMtO0NvNRAfMvc
64X4uRlBMwDeI5Mr15hXt1z92APcVtKPt6x0OnqM4Ilt67iiHFgasbAJqw0WvWmi
Yhzc+1Z5/zB9Hxrc0yYXh66F
=MjfR
-----END PGP SIGNATURE-----

--=-nddmGWczpIb1Nm/L7sEf--
