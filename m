Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757512;
	b=iCQlRACAtukVAt4y9MnFegCMyOWB9RD7lknZVx9bGRw5kPSNjwlx5oP7frgjHPMp3ReI
	 545nlCWqkGbW5hW2dzQkztVkUn6hnS7dwIYsJaD0cn0pOu3wAiqbIVT+leljj1FUPfFHZ
	 X6VV05RlfzzbVYgs3l8FCVDNwwfUfRbc0fe6zPQHv1iRN9Fn1dXIavtavJ0tW7AYFlqR+
	 ltQYMCsKA3shvzMTOTcz1yKNuatQjPquFzIjoSes60P2Kyez6MzdgUOAPaB3AWK+8sNna
	 X06Ase74L9Ek6JEQ1Hshp9M/F1sC/t81DBN2tOXmL8cvRhlZIIZMvozrTYuUeIik+dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757512;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=awgfQdrx3SqBYwG9uD9SmzAQ1+NjHmqwgyl3lIWiT7Y=;
	b=sSEjKpk//3i2BfkSG4evILu3B+xuA274qidQDeKF/fgjPg64Pxvgm5aAyHHUnHiPfZO3
	 wR+l7+2vOaJNN7OztNKARCARqvjlNlZ70zNWICY5KXEiBGHxBP26H6WflFpYIwugIpOu+
	 g5oIPBecZuM1oq1N56/gQk5ptXQ3wszLH4BlTThbC+EVFc0f1oPsU1nmH/hkiAne2iZJA
	 j9ZFz3zMk6mj11bOyU+PTH7sK5y7UVLZWLo+/j8LlsU2Q8u/chYCsK1jqyogtjMDvKVKV
	 ruZj+TukhxbfQQhH4RMUg39930V3tesjI6bJ28KDhW6d7ozgQm4O3AyoP3cyXyxeQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="cVsul8Y/";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E1606A31C;
	Fri, 27 Nov 2026 05:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cVsul8Y/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR5V7qM4658193, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795757467; bh=awgfQdrx3SqBYwG9uD9SmzAQ1+NjHmqwgyl3lIWiT7Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=cVsul8Y/zzdq9FT4Gk17zjDiMwDqN6P2+uSFtOfUaqthjF1T48AUuhEwcN5irgaEx
	 MCzkp/I9cLCSEgfe8ZAz1SoOZnypETGNObeDMLRcRHuwkxHpQGYS1DVLs9XH8FvQkB
	 dR2NaZQ4QS0Ggr70MnFZs4ogbMuFyMImP4R6kRTAdy3+IlOAaef+sA78CJ8etvuMvf
	 f1o+ryIHmUed0c1f7WgyZndso7q/i0yFL12ZXDoA1W/1gfgq2tqJQAjlwV8K8X6xtc
	 sFrla2VHPfJ86YpTS1Hn70mGBbd6SJkPy/XDJ9SrNMDf/Pgs9oBpmBMDVpnsiF6vlT
	 jQFXaJnBunl/A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR5V7qM4658193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 13:31:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:31:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 13:31:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 13:31:07 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>, Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris
	<briannorris@chromium.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mehmet.fide@screeningeagle.com"
	<mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v4 1/4] wifi: rtw88: free the reserved pages of
 an interface on firmware recovery
Thread-Topic: [PATCH rtw-next v4 1/4] wifi: rtw88: free the reserved pages of
 an interface on firmware recovery
Thread-Index: AQHdeeywzneCTeaBk0KoOS+FtDby37dBa+Jw
Date: Fri, 27 Nov 2026 05:31:07 +0000
Message-ID: <c7e381abd0d14e27b1d391926bebe7d4@realtek.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
 <20261121191528.591334-2-mehmet.fide@gmail.com>
In-Reply-To: <20261121191528.591334-2-mehmet.fide@gmail.com>
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

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>=20
> After a firmware crash, mac80211 adds the interfaces again without
> removing them first. rtw_ops_add_interface() then reinitializes the
> reserved page list, and the pages allocated before the crash leak:
>=20
> unreferenced object 0xffff0000cbe22c60 (size 96):
>   comm "hostapd", pid 25545, jiffies 4296463067
>   backtrace (crc cbdc21c4):
>     kmemleak_alloc+0xcc/0xe4
>     __kmalloc_cache_noprof+0x234/0x3bc
>     rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
>     rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
>     rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
>=20
> mac80211 zeroes the driver data of a new and of a removed interface, so
> track in struct rtw_vif whether the list was initialized, and free the
> old pages when the interface is added again. Until then the pages stay
> on the list, so a download before the reconfiguration, from the beacon
> update work or a WoWLAN suspend, still finds them.
>=20
> Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
> Suggested-by: Zong-Zhe Yang <kevin_yang@realtek.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

