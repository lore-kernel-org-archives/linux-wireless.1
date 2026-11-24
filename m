Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511417;
	b=pNCDeYznLntNAqax5nVODNhEY3YoZS9YAOZ1o2zO1gW8or/hNU750pnBejCr8ag7HxOc
	 DNyga1J1Esjx8O33IYXgfwZWqnMqPx90K+fPAESyXYTZ+YL0bbbPC+q6fCBZD84iz0B7i
	 yk3XDVdgt1Y4kBQ8jMoSHKBS+8KCFyWlAtvLgHwTImlEx6/jMTBb+hue75oMIqKWl/KiG
	 kAVXUPY1kUM91x+5/tQjUGcBp9BXug7szwnZrSE/agMvwDz5TnHS4p/7NulVBwU+vO14m
	 zSH+7psEc2yRhfsQuuUWwFSQJ4kVcgG78RHic4jo8JiPss7hqulYwpl+WJ165mgWXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511417;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=L742LJPztQllDgYQFQJq6vana+Q6W6rt9qE7KuzQfec=;
	b=NSr02km83BVyAhnUn97s4cxYpRLPDWkz0N9N3qnWh12VGpouXE91veJ7ZAYzSE8GClbz
	 3489FIbBBAsPhgEgi30h9mhbN6Iy4brLSG6noP8vpBpf4deC4i2V+YBAnxSxabsNodzBr
	 t7uHyFx1rmLe+O3o+tLneg6vgtzzEvA1X36vFn3sjm3LM343Iy6PjmIUO2z5nDw2PbWYq
	 dC7MC0PWdom3ekCtopL2gmfA0Z1AihNVchO1GxP+loKfvioS9kpLiYTRKlhACCVybtSd7
	 UuDvMCn5dNFfzQjdrHrLndQ6sXH0lmjV5NJge4vR533Mi0y5PoLD9cAyXsi1pFDHMgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="f/9M3A8X";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320A606A31E;
	Tue, 24 Nov 2026 09:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B320A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=f/9M3A8X
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO99uPD22401111, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795511397; bh=L742LJPztQllDgYQFQJq6vana+Q6W6rt9qE7KuzQfec=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=f/9M3A8XnUHCecfUtHtPxjP6wSiVrV6tzT6jwEbexWLfPi1Vent6cfiJuxdYbS4WH
	 qmub2sPdt1Jk8+iEKKd/kTkN0/uSjtjhTkXiEDWXRg/FvRu1Y24hkpBnLbaQMlYKn6
	 dTxvHhV/pQBAwDkHgCOmKoMUvKIIp79Gtg2eemPCUTT2EqROZF+G8K/h1xDg6vCDUF
	 odgsyyrODIuZ2pRnKOTP5ztzQE2pomJ3CY5wkdi0JIIx26NKBeYS4S6GBhlJE9cVLX
	 4HjOflHNHBbv5W/rDrdS2vx7YOwx2LyRiJ8j7qgVvaVS/E4/BH0+lB/2FAeqLbrPIX
	 CN42eXICGzNPg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO99uPD22401111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 17:09:56 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:09:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:09:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 17:09:56 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Luka Gejak <luka.gejak@linux.dev>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown
 downloads from the TBTT
Thread-Topic: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown
 downloads from the TBTT
Thread-Index: AQHdee+qTezIyBv8dUSLB0F4t45DM7c72mSAgACIJwCAAI2FUA==
Date: Tue, 24 Nov 2026 09:09:56 +0000
Message-ID: <b5309523db4f437ebcbdaf1c99fc7a96@realtek.com>
References: <20261124002437.213112-2-luka.gejak@linux.dev>
 <20261124083156.206506-1-mehmet.fide@gmail.com>
In-Reply-To: <20261124083156.206506-1-mehmet.fide@gmail.com>
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

Hi Mehmet,

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> Hi Luka,
>=20
> > Could the wait for the safe part of the interval use a finer timer, or
> > could we limit CSA to intervals the timer can reliably handle?
>=20
> Agreed for short intervals with HZ=3D100. A finer timer would not help
> much on USB, where the download itself takes 6 to 17 ms. At 100 TU no
> count repeats (model with HZ=3D100, rig with HZ=3D250). If Ping-Ke wants,=
 a
> minimum interval check can be a separate patch.

In my opinion, we can just fix the real case you encountered, and yes
we can think about the different HZ cases in detail. However, we don't=20
need to consider too many corner cases, which spend a lot of time,=20
but actually never happen. Sometime in the future, if it happens,
we can spin another patch to fix it. No need a perfect patch.=20

The main point I want to catch up during reviewing is to prevent kernel
crash. A patch with flaw functionality is acceptable.

Ping-Ke

