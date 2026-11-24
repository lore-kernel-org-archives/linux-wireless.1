Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529769;
	b=0/N3rzf/tXxhyjwaQXLYLTkF/5TzhyknmnAPGf7r3mtQMpPVL9To+KNXsHhorT3Pj/PP
	 Slb/hqslpY56J6SCG6ccyujd9gq9PYwZkW+/X6QljPZ6RcCB0eSw79ed8Q2k7TxzUPv2+
	 wUJUkcXjWV0BrB1D7Y228ioU1LwG07cvCpNiyMZxyDWawovMXJtnnYXqNEx5oddgu79eu
	 vFGeNRCGA1KWZGFS5kxRvlpkTvOc/f0qXQKOCIdppLEa/o8HtMTU41NkHWqD+2dl6sEb1
	 m/tpiOljs+TMTc68scwJYFHInw2FraFDPUFLHMvW851BmBgLKgN4dBqaR7Ol7NpXKAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529769;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=etCLEeXYDLO6UeW8Ug9N7KEm3dXY8zKFiIq8CHLn/7c=;
	b=pPd8iFjvc57O/BSpPIzhU/VZfwOmUjVCjbRpOWo/uqnjTxR8LwO2Bgu2rZGZXK8NJ3o4
	 bRURVa+1rK8VPlu/6Jn+q3IgG1/Z8x6s28sxsc/6MN2h/HYlQzkjPEgIWJKCSpo9IgIKh
	 JXvS2+EJZhRBfi/3qqg1/To08+/iLrov8dErtYsHZz0CUIeknjieW9zMzPIQAK8h5CeP9
	 YgOFQDzGGu0W9pAGL+xpg5SJ6/KsCakxAgkFpuBbs5ffpTQUWwSYQMTwts8XAxhS6Z3NW
	 F45SRSJiONag2umAnJUV7Iesey6cJt7paj+XUvSRouJEOxUWdFWLmEuFRExVui6b+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SjrhQRsB;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AE606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SjrhQRsB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=etCLEeXYDLO6UeW8Ug9N7KEm3dXY8zKFiIq8CHLn/7c=;
	t=1795529769; x=1796739369; b=SjrhQRsBfGWxCBya07+Gs46Cyzu5xmGIGpWnEIl30Lcy1qX
	RXrmymjsUCy7mqrUqZLyWhTbtWjsIZDMwYx8+Gi9IH1dioD/JmiH0rPdnMisSPa9rHVARqEauKJup
	q6BuSFNMX6W+JIWDEFiRnyfowI0lNgEMN28t6vbXvs6yFYkxfG5dWbCIq+zaA0gK45lrPEd3Ighly
	/wo2Bl6yAoDNWE8UHzyPPms9gcE5hZWg4G7vslBhN/LJXCEB8n23YU2a/Fs0GwFlMr/C8gTMkJIiX
	yYU8lKtFxUN4uCSjkDrd6oNiEsVTe/wOYOFo/dGjcVy2A3ZsvrV8cASy7LPcbRTg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xVrJW-0000000CMcE-3X5p;
	Tue, 24 Nov 2026 15:16:07 +0100
Message-ID: <a915638f7d6a4a1fbf5b510743ceac8f88cd8a18.camel@sipsolutions.net>
Subject: Re: [PATCH wireless RESEND] wifi: mac80211: apply ap_isolate to
 AP_VLAN stations
From: Johannes Berg <johannes@sipsolutions.net>
To: Miroslav =?ISO-8859-1?Q?R=FDzek?= <miroslav.ryzek@gmail.com>
Cc: Christopher Hill <ch6574@gmail.com>, linux-wireless@vger.kernel.org
Date: Tue, 24 Nov 2026 15:16:06 +0100
In-Reply-To: <20261120235359.3424212-1-miroslav.ryzek@gmail.com>
References: <20261120235359.3424212-1-miroslav.ryzek@gmail.com>
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

On Sat, 2026-11-21 at 00:53 +0100, Miroslav R=C3=BDzek wrote:
> From: Christopher Hill <ch6574@gmail.com>
>=20
> ap_isolate is set via nl80211 SET_BSS, which is only accepted on AP and
> P2P GO interfaces, so ieee80211_change_bss() stores it as
> IEEE80211_SDATA_DONT_BRIDGE_PACKETS on the AP sdata. AP_VLAN interfaces
> never inherit it, but the intra-BSS forwarding decisions in
> ieee80211_deliver_skb() and ieee80211_check_fast_rx() test the flag on
> the station's own sdata, which is the AP_VLAN for stations assigned to a
> VLAN (e.g. hostapd dynamic_vlan). As a result, mac80211 keeps forwarding
> frames between stations of the same AP_VLAN although ap_isolate is
> enabled, and client isolation is silently ineffective for them.
>=20
> Store the setting in struct ieee80211_if_ap, next to
> multicast_to_unicast, and read it via sdata->bss so that it applies to
> the AP and all of its AP_VLAN interfaces. The now unused
> IEEE80211_SDATA_DONT_BRIDGE_PACKETS flag is removed, as was done for
> IEEE80211_SDATA_OPERATING_GMODE in commit 39eac2de0098 ("wifi: mac80211:
> move IEEE80211_SDATA_OPERATING_GMODE to link").
> __ieee80211_check_fast_rx_iface() already re-evaluates the fast-rx state
> of AP_VLAN stations when ap_isolate changes.
>=20
> The issue was found and this change drafted with the help of an AI
> coding assistant (Kiro); it was reviewed, built and tested on hardware
> by the submitter.

Why would we want to not have this separated per interface?

johannes
--=20
pw-bot: cr
