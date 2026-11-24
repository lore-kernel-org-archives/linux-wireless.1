Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528327;
	b=XaPhyCfDE9elaZfjyl9FstNR0Z28i8ZbVIy+cvn6qiFbQbH1hgDWFUwE2iCF534ljgnF
	 TPikUzgiMUs8YuB203w2A0TWkivnhqRrA5aTsnFmnF5Nj85AQFaMG6UZDROhzrvjaRi1X
	 Z6xUQCDGHb479+B4MyDBGPzR9iUBE82H8eDczgITVQCh1E2TdR3Y65RlYfb654Ctsa6H/
	 i0iOo5xokBw0+Eyhe23yYzHVnBuC0We9cBFBN3S4pNHV1dUKgq1yBijXij937pBtVK/mu
	 U/FnsVn7lOlLqaozBIXV+X96KBHgtX81Ck1BBbuzRTBW7xnseZBxap8/jtrkhQiRj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528327;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=h+GOkO/r4k3wl8EouStenYOarylixVL/kfH/mmyBMMo=;
	b=iTien//23pCojbv9o8ENWU64V2QqqFOgHYa5gnByq0BpQu95642Kzz6pCk8/cACv+1mE
	 wKjR59jGi8TBo5SnAt1AqvK9ZnxYKCtQbr9OkXiG/H7KgnIGuIHLyah+eoWwXKG8DRjF5
	 S0kzUSKgGpSdoX2Xd436TauLorTgBzhaDrIi04mQDgllOtlXY6GPfbTkwc4v4kFk9Y7VD
	 EJVJO9xH6K2xhd1V8P0NjyTsnoXVPj9hFT4BMsyctRTiuhuJSNSMYiFD/mJaFy7f3E31I
	 TBM8dwvfW7JNLlrpfS4JfEmLFHwvWDX55puXF/5KHz1vFm2kP7PJsOQCFzJhAcwb86g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=x2AZMQ4p;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF0606A31E;
	Tue, 24 Nov 2026 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=x2AZMQ4p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=h+GOkO/r4k3wl8EouStenYOarylixVL/kfH/mmyBMMo=;
	t=1795528326; x=1796737926; b=x2AZMQ4pg/HJUx0+Jpa0J1ilQfhCxqBem8n6m9Hx1xOG8Gk
	coRJY9NVedcv7B/+hhfQMGDuhA204wnGDm/EbhAB4EC0Tp3Ap1/XOxkzVlRfPtDEwV1NAg9j+ahpy
	mjaQb6trUQ1SPmLHWsQOpmD8tBfjrep/Xqvr2OpA+3FUWo2gIAmJcMIfRlFt/GYIrkIj1EXIQjO/v
	7u9jICrf+dbvHgGTiNdg+j36lwtID7jQVEQsw2GuxCL4b4vAitbNzGOQs4hKeaxHvFpN4VFR2e6Jn
	SYTAwi981oHbM8m31mXIdtf/6GjsPAJhhtlrJ080rAaXSDnn8X2yZKNMq8YoMVsg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xVqwF-0000000CKQe-3XHW;
	Tue, 24 Nov 2026 14:52:04 +0100
Message-ID: <26593ae869ed222980ac78ac869bc2745d2c282a.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next] wifi: mac80211: replace the CSA beacon
 before clearing csa_active
From: Johannes Berg <johannes@sipsolutions.net>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Toke
 =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?=	 <toke@toke.dk>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mehmet.fide@screeningeagle.com
Date: Tue, 24 Nov 2026 14:52:02 +0100
In-Reply-To: <20261117153154.1804945-1-mehmet.fide@gmail.com>
References: <20261117153154.1804945-1-mehmet.fide@gmail.com>
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

On Tue, 2026-11-17 at 16:31 +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> __ieee80211_csa_finalize() clears csa_active and only then replaces the
> CSA beacon with the one for after the switch. A driver that fetches its
> beacons with ieee80211_beacon_get() and skips them once the countdown
> is complete, as ath9k does in ath9k_csa_is_finished(), tests csa_active
> first. A beacon fetched between the two steps passes that test and gets
> the CSA beacon again, which goes out on the new channel, and
> ieee80211_beacon_get() reports "beacon TX faster than countdown".
>=20
> Replace the beacon first, as the finalize work did before the clear was
> moved ahead of it. csa_active is still cleared when replacing the
> beacon fails.
>=20
> Fixes: e487eaeb076a ("cfg80211/mac80211/ath6kl: acquire wdev lock outside=
 ch_switch_notify")

I don't see why it would be that?? Please explain that.

johannes
--=20
pw-bot: cr
