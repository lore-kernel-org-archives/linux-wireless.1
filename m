Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366567;
	b=mJn0/R/5vggwFT0wN9IVU5Ajjz6xV2L4iCcGVE35U9Tn85LRIB/gpaDcALXUBpFV2PgA
	 vXimGIxUjzb3e9IgcmrOgLHLlnQ0CDCwGkUunLXlDSL352KRbCiVCS1Xd5Uq2b3nY4qcp
	 zx5lf6CIunM1BOE0yYYh3cpWqFJeDPLG7NSEvrS1BaAd6aUqQLmNsQJPaSnwrrmnfHk5c
	 c/az7nznIaft7Zm/JQ14Q+yeMtH3p96tSoFN00ydtKQJ5nNtfBirabMrbR34B/Ji+br2y
	 Ak8pRxnV4bjg2XABIborquR3GfllrkT5YCfyfuF6A97MMxpSaAvYz6Smyl0lEdWzWpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366567;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=chAQ7KDVujLb4P6mjnQP2U2dbTDPBZxKP8pq5A+58yI=;
	b=lL4g64GxuCmUgKOPzM+3wjoM2sJqwDd5lsQex3g2xB1+XK9YZXSZoD/g686EWAlPXCnn
	 z9JrB3TEbsT6jVy3/3ZsCVaUR+K4iXFXBy2/E6mFxWQvENMDoHVO61uT0Xh6sh4sEl7wK
	 l8epE6wFHuErnqwmWn7mYaF3oP2Y3pZdLOQglJyUY57Kxx40p12MK2aORvq6XofxE1fWs
	 oyLQD3GOBCt/qNajOBlbHlwGzf1vVgINJhegCPKdgsQIoNM/roi/q6IgUXOhvoRLvwXzj
	 s4lLT/9eGlkzVEXhNHHH72jnsbcj0mIubHvFop9E/4FvP0AwGY4nJDIbTUsxU2uMvDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oBltf1+w;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF867606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 03:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF867606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oBltf1+w
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB395a642000909, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794366545; bh=chAQ7KDVujLb4P6mjnQP2U2dbTDPBZxKP8pq5A+58yI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oBltf1+woSStJooGkqxH7okTMW8eUGuPpdx6cIYW08ywzj5z/K5rztizPyIHbcb21
	 If3r9jSbKqSIkXrnWRsIhBqyayXBsQaFKmpzmn088l/J0bUsn95dSFpm9/rrD9U9ai
	 pHroaerlQbvMW/FRaAHilHARgkrNcdYPilWPcFD8bzq1fY9C12RePtiai15t09izg0
	 hQsuuOYNE2ix94ATa5E6BK/LXkKiIi8OcxrWg2Sc9UxLCdQ3OnrlFLA9opZRI0yTw0
	 otnQGbU8heSTXsya0pclCK2VRLinhjDu4R5ccvIMsF03ELtQacYNu9RkZH+z8H1KxH
	 FoKnioCEhURYQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB395a642000909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 11:09:05 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:09:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:09:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 11:09:05 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: rcfa <kernel@cubiculum.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Subject: RE: [PATCH rtw-next] wifi: rtw89: allocate rfe_data with kvzalloc
Thread-Topic: [PATCH rtw-next] wifi: rtw89: allocate rfe_data with kvzalloc
Thread-Index: AQHdbxPPkkifAkcs7kW4bShPS0bOircoNRrw
Date: Wed, 11 Nov 2026 03:09:05 +0000
Message-ID: <ec14ad0998374fbe983ca8a53afb064e@realtek.com>
References: <20261107230713.3675421-1-kernel@cubiculum.net>
In-Reply-To: <20261107230713.3675421-1-kernel@cubiculum.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
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


rcfa <kernel@cubiculum.net> wrote:
> struct rtw89_rfe_data holds the TX power tables from the firmware
> file's elements and is 1190784 bytes, so kzalloc() asks for an order-9
> (2 MiB) contiguous block. On a host that has been up for a while there
> may be none, and probing a USB adapter that is plugged in then fails:
>=20
>   kworker/12:1: page allocation failure: order:9, mode:0x40dc0(GFP_KERNEL=
|__GFP_ZERO|__GFP_COMP)
>   ...
>   failed to recognize firmware elements
>   failed to setup chip information
>   probe with driver rtw89_8922au_git failed with error -12

Below commit messages are not necessary except to=20
"Tested on an RTL8922AU (a USB 2 adapter)"

>=20
> Only the CPU reads the tables, so allocate them with kvzalloc() and
> free them with kvfree().
>=20
> Tested on an RTL8922AU (a USB 2 adapter) with the out-of-tree copy of
> this driver (morrownr/rtw89, which carries rtw-next as of 2026-11-05;
> hence the module name above), kernel 7.2.15. The failure came from
> replugging the adapter after 16 hours of uptime, when the Normal zone
> had no free block of order 8 or above. With this change the driver
> probes, connects and unloads cleanly. A test build that always used
> vzalloc() for rfe_data, to exercise the fallback path, put the tables in
> vmalloc space (1196032 bytes in /proc/vmallocinfo), showed the same
> debugfs txpwr_table as the unchanged driver on the same association,
> passed traffic and unloaded without warnings.
>=20
> The problem was found with Claude Code (Claude Opus 5.5) while testing
> the driver, and this change and changelog were written in the same
> session.
>=20
> Fixes: 5ee7b2ea07cc ("wifi: rtw89: load TX power related tables from FW e=
lements")
> Signed-off-by: rcfa <kernel@cubiculum.net>

Use your real name.


