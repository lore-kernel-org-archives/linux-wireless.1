Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304313;
	b=PDR+H294pIejllyw0w77qAt9rahjYVoK5qbBcoPq+EdsuXWhS4/nCgALB9cGniDsiGrK
	 iGrgqGD8FFO7BF1TV4OiCK8km8GDvh/MytNpRVISjPWl9/tCrjuurQgUAVNPTj/d423sP
	 9+tysv6Ow015NW6IBeTsj2yOBZK1GfXFt8w0dXRFKVfl43FpjNJuLgbkJnPMO9D8b3pAy
	 wpob3CKETW3qUvnF9j3DmqsUyTnLDRC/6ShZuP3dl2I0cniXOtQ+9HukKtzuPt7Q0wfD6
	 M7jDS8ZYr4J5QVJOmW6P6W2am7GTrKmPj9N5+p+lIDHsVK0IYxid1+KbllVzlIID9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304313;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=BSUyMZbUn8O+QiO2CeUKN2Iz1br7Q9gZAitcRCrCAMA=;
	b=zbvvxfWXvjuYeHSIQmwZLDJYdV6Pyz9S1vhHAYt5oQmsk9/LyP0lRWPvSA3PsPK7O78z
	 /ZSPA8IYbMhXuXX8Xky6md4h3Bzp5p53ooyAUnf6U7nhbEVx2dxr8iVbwHzayfMuNSHhX
	 nL8aF5kNud8+oWMsJyP2VlUGmMYIdO0yH4lfH9uRymGtX0Vs4DX1pRSxNM/aPX0HIgsvG
	 tOS2l8f8mvDp4NHAFRQHhZY1WXlEA1nlmN7rKGqnYTIEoXF3p+9A3YP9tV6krnlsHbF/9
	 d+CpYAhKIlgQz/aPCJqt9RyaVEVKewWYwG40MXI9LhxRZjykCgHAV8vAioTngb1zORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=sYZKaZjF;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE97606A330
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=sYZKaZjF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BSUyMZbUn8O+QiO2CeUKN2Iz1br7Q9gZAitcRCrCAMA=;
	t=1794304312; x=1795513912; b=sYZKaZjF4tTtBZKOO6+hZsCrPPbM9yB6tzvb62vHO947EgI
	vHz4NSmaadcJhfawsJeN+Gb3aqe/UTU9CuuZUnjrPgP8HD0e0hfVmrdy8x+2muBeUwVbQW5w5JimA
	o3GEmQjQ+n36zYObGsYrX1PBXzePAWN4GVAddgO5GwcKAWPp0MmDaOdNBAsw9xKh7kjcrW7qG+1AW
	scYmeuqz0+wRvs3CW8p5SqhhVr9Zhzmdx3G3DvRDKQpgUi1gLgHCjI9wi64Eano7wRX+3jiyeEPnr
	GNAm2NpKbmbssOud2KCwYPXLRMjMYkmST6u2qQng4GoSH1XbeJH3tAhKw6RWs4zw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQiW3-00000001Pdg-3l89;
	Tue, 10 Nov 2026 10:51:48 +0100
Message-ID: <72bf69b140827263fc4dec20f757d54d85f4cc65.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] wifi: mac80211: don't coalesce a new ROC onto an
 expired one
From: Johannes Berg <johannes@sipsolutions.net>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com, 
	James-LY.Huang@mediatek.com
Date: Tue, 10 Nov 2026 10:51:46 +0100
In-Reply-To: <20261104092050.1930716-1-jb.tsai@mediatek.com>
References: <20261104092050.1930716-1-jb.tsai@mediatek.com>
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

On Wed, 2026-11-04 at 17:20 +0800, JB Tsai wrote:
> From: james-ly huang <james-ly.huang@mediatek.com>
>=20
> ieee80211_coalesce_hw_started_roc() computed the remaining time of the
> running ROC as
>=20
> 	remaining =3D cur_roc->start_time +
> 		    msecs_to_jiffies(cur_roc->duration) - now;
>=20
> and merged the new request into it when the new duration fits. When the
> running ROC is already over, that subtraction wraps around (unsigned),
> the "fits" check passes, and the new request gets added behind a ROC
> that will never produce another on_channel or expired event.
>=20
> The expired-but-still-listed state is not rare at all: the driver's
> ieee80211_remain_on_channel_expired() only queues the hw_roc_done work,
> so until that work runs - the driver's UNI_ROC_ABORT round trip can
> take tens of ms - every ROC on the list whose time is up stays listed
> with started=3Dtrue. A remain-on-channel / mgmt-TX request arriving in
> that window hits exactly this path.
>=20
> Check the ROC's end time explicitly with time_after_eq() and refuse to
> coalesce once it has passed; compute the (now guaranteed positive)
> remaining window from the same end time.

Please rewrite this with a useful commit message and comment.

johannes
