Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102555;
	b=fwtdprt0ml/oFFf6bYreoHLwAQGuqIFlUxKEROAWPqrWyR0BoeT4kXUG7dNj05B8NXuU
	 Q5zp1ScoVLOYLXV0olWFU8n+bJy4KCZxCpqJt3XXsYUughm6fSF+kKwVLiQUn4jMInoFf
	 l7+y5AY9aa1UNNZgDjHW/4ylhPUD4giMPp/QUDEHpEoo4s9ZR8zQMGmgGxB7BvCc0X0xP
	 Bt6Pv5ZSotrOrSDQ8RzEpVomQ0Fj1ml8ndyCX3LsxRdX0ISm83rxTbXG19MUEzPC7qfEo
	 bvu+BnvYw6Ue/YfMBA3d15wyTRY2RtGKAYtsWg+fYCI4EMl2RAChSy0HvXxdvFinjjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102555;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-malware-bazaar;
	bh=CGMB0Zt/Cv+t1juTmDzR1OFbbAPS4kCafusjuYMhnT0=;
	b=HQqdDW5DSYAqJw7yz1E9vqm6v7s5mK04YDtJKnRrnIhzfYg0Aj5SM+OcZXRvr6EYfxna
	 /bGsdhOpgb0sji6uZW0b5A1VIlULyOa0tE3+3dXncL+AEqyje5uZAvHaKYVPC1p/L0uAe
	 73WtTXzR8gSJRtxj++W250Z9hcjKYhGAhvWIMhAfPPFWfpNdm1hzgjw+BVgtiqpL+6iut
	 4NIuCPX+CIsP9se7Ey3/Vx/U6EYfXBwlzmFxvIEhJ9ypZQZGjRKD3IXwgDNi1gBh1yiNM
	 M/A5gzgdBia/8cYo9fb+EH2wZ98m+JUv7ewCp+FJX+tR0nEK+eLhP0vy8CuDriv0plg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="HD/VSyqF";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD26606A33D
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=HD/VSyqF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=CGMB0Zt/Cv+t1juTmDzR1OFbbAPS4kCafusjuYMhnT0=;
	t=1795102555; x=1796312155; b=HD/VSyqFkVc945fnbgv/D4h/Q8UqvkGEjhUvlKIOEAjDN4r
	bT3iX94ZkZMix2Wzzirz8yjvbNwDzF01ga6GwWZtD5Q4Xf/z5XkmBF+UH3Rt3zM4l4nKd2TJUQDOZ
	ND/AiUE3bYDOoiB6YHlUCH59gciwynXkzZJfZ211j+9fao+ysn/dYOvt+IuHLIfhD/9AIZkp9CJB/
	XiggvQyNhQzTUEdttSgtSKx24eLiJ9Q2eQcQQwGTsDSnWW4SO4eKjueVzEpobrnv5fltd04S7hg8W
	ZsSu05wjQhMA66v4pNj/p4bhIrVsKJzXK7XcY2qo9XM2vNwenwrIqjeuxXOORTqw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU4Az-00000004Yjs-0bf7;
	Thu, 19 Nov 2026 16:35:53 +0100
Message-ID: <1edc3fd4ecf65cdf1eb4ab312d0f992a5c0855d1.camel@sipsolutions.net>
Subject: Re: pull-request: nxpwifi-fixes-20261119
From: Johannes Berg <johannes@sipsolutions.net>
To: jeff.chen_1@oss.nxp.com, linux-wireless@vger.kernel.org
Date: Thu, 19 Nov 2026 16:35:52 +0100
In-Reply-To: <20261119090352.565202-1-jeff.chen_1@oss.nxp.com>
References: <20261119090352.565202-1-jeff.chen_1@oss.nxp.com>
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

On Thu, 2026-11-19 at 17:03 +0800, jeff.chen_1@oss.nxp.com wrote:
> Hi Johannes,
>=20
> Please pull the following nxpwifi updates for Linux 7.4.

I couldn't pull this, you've (again) based it on the wrong tree.

I can keep it open for now, it _looks_ like you based it on net instead
of wireless, so after net merges wireless and I pull the merge back, I
can probably pull this.

johannes
