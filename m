Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740566;
	b=RiCcYlWWBxG6RFFIyD2/9DxeMXWKXEo/GUW40QSFFx45B38F8QI0UlFE/L2ONF2I0pz+
	 D4N4KGAJLEw6d7bl8YOCezQr9qgjPrG+AKD5febkC/jaBjvaoWVxBcmujOMvDp/S7i/+T
	 UbvPgO5R8emD9wQTnXK+PScFBkRhBuZyrih2sJypyJatVtOJckTHMFPm5YpBKrAagA0Yq
	 EJ2Mt0g7Yz8739Iw9e7n6l4LAy/pBhh4bGo/DOd1E9Kn01+rFtLPTCInIrnAtcimBkWrR
	 OlZEm8qTRmDO1JP5PC+J9lBrxVY0peXeMf7RF3N4KCbcgS37dTko7k5qcODnKDGlk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740566;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=E8CWNBIGJkq6X8c404QSLv87nelzGtON6TVbKUu03XM=;
	b=LfsrydutKouwikzXjb5ASIGK1+NrZh+7zu14FLQNOeEaLuGejnhW0jvQn+hlXV5wBWkJ
	 OfxeTDaPiTNspLmxi0GxFeCambOXv2Pa7HuzPMa8cnbZffd2m2Qg5aPNea4uuIsakVT9u
	 /wfQYacLTmW6O2TLpXFTHeqUs1IP4g1RK5pTPenncjC2JAlPnsxlfJUHnR76P8BcNmnx+
	 XRE0w9vYL5jJO99NGyJuagP1EuJF82jYuJFTbPeJVN65MCpGvfIwFl+dvQyAcwgUVr8a4
	 SMuf0LK1z16aN0mcWe/4V9xtZYHt3mGTgUz40xzKoxn1hJkrCr4UTWT/T0XThrN5c2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hBJ1QKaU;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DC606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 00:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hBJ1QKaU
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR0mqayF518584, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795740532; bh=E8CWNBIGJkq6X8c404QSLv87nelzGtON6TVbKUu03XM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=hBJ1QKaUtmjJjHAM7YYtaNmV24JHFROl74CpO8juQRzZoJJSktvw8a+DuHUmeZiR4
	 EetkZx8KD3MKmD9OmArLhqp6aS723Dczh1Ui821zk/d2kOyQsqaVyqiN2/Tyjx1H8Z
	 47zBOGsQ72gzU+mPvGyjhy8m+yIcFCwFGZKI1WGv4AL0QcdM65KbDGwWv/FDypXWmX
	 4uKPQTH9ECw/DcIXPKM/XHkGYtDyeWJiTDM46yTwvN+DuaZYVbfXUudNZIVrx4vqcR
	 Te9dhzor4InXJd1T8BIE7iBDj3hpcZCbXxSoixnkQakCKkQY0xhgdYrK09pzicEG0I
	 oxRP6ApGHHr9w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR0mqayF518584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 08:48:52 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 08:48:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 08:48:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 08:48:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Shreyansh Khajanchi <hi@shreyan.sh>
CC: Jes Sorensen <Jes.Sorensen@gmail.com>, =?iso-8859-1?Q?Georg_M=FCller?=
	<georgmueller@gmx.net>, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Thread-Topic: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Thread-Index: AQHdaEhpWqRVzw+aqkmzkIP8D0CnC7cYm7VAgCbZtACAAcr9kA==
Date: Fri, 27 Nov 2026 00:48:52 +0000
Message-ID: <79b1bbbf24614176b569469961c2d610@realtek.com>
References: <81c3d0056a0849078715e0f0be074d1e@realtek.com>
 <20261126052152.2887192-1-mehmet.fide@gmail.com>
In-Reply-To: <20261126052152.2887192-1-mehmet.fide@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> What works:
> - Association and traffic, open and WPA2.
> - Unicast TIM: the client's AID is set while mac80211 has frames
>   buffered for it.

Do you think it is acceptable for normal use with these functions only?
For me, it is fine to merge this patch, but don't want average users blame
AP mode unusable.=20

>=20
> What does not work:
> - The DTIM count does not count down. mac80211 counts it down once per
>   ieee80211_beacon_get(), and the hardware repeats the uploaded
>   beacon, so the count stays at one value until the next upload.
>   ath9k_htc sends 1, 0, 1, 0.
> - The multicast bit is never set, and broadcast frames go out when
>   they are queued, not after a DTIM beacon. rtl8xxxu does not set
>   HOST_BROADCAST_PS_BUFFERING, so mac80211 does not buffer them.
>   ath9k_htc sets the bit in the DTIM beacons and sends the broadcasts
>   after them.

Maybe normal user doesn't care this much? But at least we should
point out these points in commit messages. (No need detail. Only
list the leak features).

Ping-Ke

