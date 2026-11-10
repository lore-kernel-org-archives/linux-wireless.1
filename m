Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303127;
	b=NPguFab/m6e/O6UMJ4aSlLM5lihJB/TxvkkVh97sqeZOfmrY48cVFsdFdksGlHCGIp/S
	 nF4xkxSsazrRB62Vvvl/Um0A6C0sw/uhCCD/8tCML1SJb/FnKuEKXrNWukqidxQ3d8+Gf
	 200YmNOkgtJl50CZ5jRe+7Bp7+DTCqZuVFig3rNyMIJ6fR4AdrwkC/Q/51PCbv3WpBt7u
	 WSxKxY8iDxPLuRFrdcMVW6w4CqdBt89u89XwDm/1Mgb4yrZlPwNRyDzjVOITm7zh2yL4O
	 vrfzUBsSBT1tSwZ25Jr0kl8U2V067bx2c43imqWApMDx7HmOeB++P5cNkVVWVQRJ43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303127;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-malware-bazaar;
	bh=/cGNwRQhw2h3JzPtyA5P1rMbxBdzaDgGD6+2pL7TUp4=;
	b=u3kS/5gqTDhJ75tJXJp7BNeXTWlOboC/7ktEzUSFdDOEqcfxidLqUU6qCdUkVMkjo7ml
	 4HMml9kKeA0YKHbmDK3fmtMDMPUn73bCqOdhV+Xnk0hljar2n1774ZpbFndtTo/aft+5Q
	 GmLNWuXjIHRWAEBBfnPMmPv9I+LQMsZOh6lUaeMb1YmedKSbMKeXuuFGjnrnBnWVeBEGe
	 5Cw34/38G93pBhi6aZm/6JzLb2xlTOykpHYg5PLIRbA4O0/7XqirzWrx8WWiywevOIDaj
	 QfvQ2tOOtUc5ASX8nmURYUbb6/w5+bJWvtQhVam9xN6SuoTyQu9/QOxmRSkkgWLvZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Cu0hLc7s;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4BE606C677
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Cu0hLc7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/cGNwRQhw2h3JzPtyA5P1rMbxBdzaDgGD6+2pL7TUp4=;
	t=1794303125; x=1795512725; b=Cu0hLc7scWAaupUs4m/t+2COvR8PXUt0+KoSkyzzqFT9PjV
	/6GG52AxABSABBZFEN/sKpGT92AeUrvQgKOXPMjoKsMi3MdOFgiKXjm4isePFIJbp8RSl3JrjjL32
	6BbeyGuxxgnPscRWJ+oOhGo/KsscnLJMmmzv3yR9k8ZC0Wa9EkJbBLHpdrLQT+LWKHmD74exUTBKc
	MelBTLGZscK03FMPvlBuH6IfmmfM0W9Oy47q3xB2Ei8zRQg1E57tz6dHcwdRCCWd0xGzc6jiJe0P5
	ecwb7p97lmciNOTX0AsigoDENTsuWfmoD3xx3BWQWyMAml4R+WTWaR0LgFKceEZg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQiCw-00000001NrB-2ude;
	Tue, 10 Nov 2026 10:32:02 +0100
Message-ID: <789111f04835447d7324b1fbc6ef3c5b14c0640f.camel@sipsolutions.net>
Subject: Re: pull-request: nxpwifi-fixes-20261103
From: Johannes Berg <johannes@sipsolutions.net>
To: jeff.chen_1@oss.nxp.com, linux-wireless@vger.kernel.org
Date: Tue, 10 Nov 2026 10:32:02 +0100
In-Reply-To: <20261103072022.3955633-1-jeff.chen_1@oss.nxp.com>
References: <20261103072022.3955633-1-jeff.chen_1@oss.nxp.com>
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

On Tue, 2026-11-03 at 15:20 +0800, jeff.chen_1@oss.nxp.com wrote:
> Hi Johannes,
>=20
> Please pull the following nxpwifi changes for Linux 7.4.
>=20
> Thanks,
> Jeff
>=20
>=20
> The following changes since commit c3e67bd82b9b9b1a5118f09a429ccefe2aab07=
41:
>=20
>   ipv6: reject wrapped temporary address preferred lifetimes (2026-11-02 =
22:31:32 +0100)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/nxp-upstream/nxpwifi-next.git=20

I suspect you meant to include a tag here?

johannes
