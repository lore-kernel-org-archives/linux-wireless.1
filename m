Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289351;
	b=BO0pwKg2dwsStD2Y7gsS8HIyDbim3aSF7lNK6P7ZrCCKhGlpWIkQz0wmZVxYv9h6H2m0
	 uIVPz2+REXOYCkLFB/NZh4EX4AVPSFgjUhayaYYyfqFKIWyqU8onOn/D41r6AZxFPri1T
	 nUQ+zpBJiq62RE8iROp2sQbXz2v/1VHLym1hPiFyGTCZz7cAHtQB4GRjaG+jRrKS+Tagi
	 KHQY7tQWKete/SdDFQDOQgrtSBm7yhagbl4NMx8vBbXlhmdXUn/je+pr4p0KS4O4tbxut
	 KRrYkwiQorTNGog47JQhlSUBOi2DwGHXOjzHwr8oVXlNi+Y+AYr9XSy4RjVYlmBmnEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289351;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=pJT7OFPE9VdjLGL+zkTjw3CKPGWL8/IsXY7OnlxcJRo=;
	b=JpsVy/T8yuJn2ZeF7M2soFg1uqgS9ZUwVuskhyPSp6ZCjmsd16SN/zrmWrwdi88G0kj9
	 QvJ4EfE8nPNeZhpCCgTH4PGygJYCZLyOrObgL+F4p2MEy1EOxaEDszhaq/hgatBw/Nb5E
	 CnOel/1VKkoZ1QkBkF+g5fEONfzi6fNE1KFRW4pm/+ul/U+/kDNksw+tOoWYkOFTGIJ2L
	 aabURQnXcOb8nm8DQXGGp6wmfNUbJEk/JsQrznHt0ug75mMkz451U7y+mweCNGWfmlOs7
	 c0fUPLH5nCGCfD25nyCxq2I3FHxN/m7O21r/CVJaI8yzg4EChLapbNSQ3D01UKB4g3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=STb7aWh6;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E0606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 05:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=STb7aWh6
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AA5gQ5V1980344, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794289346; bh=pJT7OFPE9VdjLGL+zkTjw3CKPGWL8/IsXY7OnlxcJRo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=STb7aWh6yXNbctPoQunwXpmkIGGjrDqjiG00o3NpO1f/SXSsnju31e2DFC+p2wx8/
	 1wqxWVIWBj1j1OOJIIF+37IuigEpVEzIxVe0AzPFeJSujCtgDWpqZmRupeOnp1oFEA
	 fY0667BNXlRaViIzk6mUruNzgE3zLuqlEGM8+pw4dFgW9WRueZmm32ar78Yvbwku9Q
	 obO3R4jtKOeHhxBGn/D/L5wYemirarTr7u6KpasBO7WRuQBICu4hqRERy3ZqPF6jTH
	 Am5DEC89sJTYgw+9nh/akJXw8Cp/dVQzsTF0hDYZ6Kn+EwLP2JJAoJfJN/zQ8K1rJ9
	 BG1M8oCIo4SYg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AA5gQ5V1980344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 13:42:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 13:42:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 10 Nov 2026 13:42:23 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Frederick Watkins <freddiewatkins6@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: pci: disable D3cold on Lenovo Ideapad
 LNVNB161216
Thread-Topic: [PATCH] wifi: rtw89: pci: disable D3cold on Lenovo Ideapad
 LNVNB161216
Thread-Index: AQHdbxPuFTVH2CX4SkOw0x07uZnUxbcjg28AgANKhzA=
Date: Tue, 10 Nov 2026 05:42:23 +0000
Message-ID: <7bf0f5b31ca243cf9ddbd7f3d6f6c479@realtek.com>
References: <20261107235819.19758-1-freddiewatkins6@gmail.com>
 <20694cf6372343ea877a015a695fffbe@realtek.com>
In-Reply-To: <20694cf6372343ea877a015a695fffbe@realtek.com>
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

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Frederick Watkins <freddiewatkins6@gmail.com> wrote:
> > The Lenovo Ideapad LNVNB161216 is affected by the same PCIe link loss a=
s
> > ASUS ExpertBook models after entering the L2 low power state associated
> > with D3cold.
> >
> > Add the affected board number to the quirk table preventing entry into
> > D3cold.
> >
> > Closes: https://lore.kernel.org/linux-wireless/auyIxMg3r767ud7z@freddie=
s-laptop/
>=20
> Thanks for the fix before I read your report. :)
>=20
> > Signed-off-by: Frederick Watkins <freddiewatkins6@gmail.com>
>=20
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

As patchwork was broken days ago (2026-11-06 ~ 2026-11-10), please take my
Acked-by and send v2.=20


