Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794358640;
	b=WeauzKCXNDxlWCGrp4po0laRFLMh3Kzts55A4a7I+sSIXhf3Zn1iaeUMkQxZYDByDj5a
	 6iRedhbqUNb1iQXD6B82Os2ta7zmQlmCwy1xtrKtdCiY3MwkcdVUKJH6rWsAiuu5/DI/D
	 elPR8ktz6TUqwdyFyRMky4SwUy8ZN7Q/tSPjldg7ZWmE0qBkxJS31IOSYQi7tbc+sRZZQ
	 53YFpS2prFod7mKjlkjoDx04nedBN6YvP/EtGOvFm2Lam/RYLv3XDhnH2zi4jxJIMpARM
	 Ur82SRNCj0WeyNFfPgl1ZscCSziXN84cf8AthlJe14tl8PL64FbrBnzzX50cAGwbTiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794358640;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eXbrtToIVj+B9iqcwd0hLVYnzc8QE/O+CveJCcBaLhg=;
	b=XEsmuNFrft4FVOx0McWIiparWRUTOoYCi/IG/jEG1QCV+cHrJuSaKYjuTs+mU3Fvata0
	 WeNHmE8TKKHUTJySSNSn4XIi54vDmgYvfIaOPeoaICuPeBqIxauugVEep/n2ug37YsT+1
	 LXVCNaeDCUZ2Ei8x44NtLoWsn8B0yxBV8J2RY+vdbFSjlfy2QBkVxLXpzao3ooIWyQ+c3
	 VB3XBgCzbWmVUrgJtDTTrv6hNB+10OrOtnpRPgrXrfWSIM3T5p8TT6eMfWvLRZMCQJTox
	 YChjSrbFTUCBaAXUMMPVmn5qAbvcvEwsLuUaZManufziDatO7VWAIuPTPYSZAQo7quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=smCZvC+S;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3B606A330
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=smCZvC+S
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB0vEcbD1860153, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794358634; bh=eXbrtToIVj+B9iqcwd0hLVYnzc8QE/O+CveJCcBaLhg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=smCZvC+SeLqSMWbGShfyhQVLPQlqECkqlBKTGF1Vbr68dVJG3au1wh6DhN+d1qhmd
	 45yZfcu6oKQeKjHvAGliVBeDzL5Rj5O/GalPtfT5dm+n64kx3I659BDjiEpm13eeK/
	 55a+qnpUYV7lun1H61+MoORrjS7C5ZJNR96GkjRVooupSZBBs2hDOim9vvnyB3QUxJ
	 TCBCrf7mfP+J3r80CV4nYHF+9a33cvM7mF+srEQLJmqQv3ydAUPB3OmCPFhnJltmv6
	 OMu9ooYLaa+p6Rng+ybJldI4UWocrxl2C+0z9LS+cG1qIDqfvqxB1qFgTCfLOTLSJB
	 ef9OZntDZAS3g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB0vEcbD1860153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 08:57:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 08:57:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 08:57:15 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>, Chris Vitalos
	<cvitalos@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: rtw89_8852bte (RTL8852BE-VT): recurring SER
 0x1000/0x4000/0x1001/0x1002 on fw 0.29.122.1/.2; question on
 rtw8852bt_fw-1.bin
Thread-Topic: rtw89_8852bte (RTL8852BE-VT): recurring SER
 0x1000/0x4000/0x1001/0x1002 on fw 0.29.122.1/.2; question on
 rtw8852bt_fw-1.bin
Thread-Index: AQHdaZogezorIXmrF0q/5jdQlxC1rrcZ84FwgAzsMQCAATugkA==
Date: Wed, 11 Nov 2026 00:57:14 +0000
Message-ID: <b8df608ab1e141388d663734fc631a02@realtek.com>
References: <CADp4rm+GmTjCoFXvT8WpiLNohnREqfR9z78PfH1m2rxs00jMUQ@mail.gmail.com>
 <703ebc52e1d544e590874df041b4d979@realtek.com>
 <ef843858-be07-49b3-9505-3ce08dbd28d2@gmail.com>
In-Reply-To: <ef843858-be07-49b3-9505-3ce08dbd28d2@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

DQpCaXR0ZXJibHVlIFNtaXRoIDxydGw4ODIxY2VyZmUyQGdtYWlsLmNvbT4gd3JvdGU6DQo+IFNv
bWVvbmUgZWxzZSByYW4gaW50byB0aGUgc2FtZSBwcm9ibGVtIChJIHRoaW5rKSBhbmQgY2FwdHVy
ZWQgZm91cg0KPiBjcmFzaGVzIHdpdGggeW91ciBwYXRjaC4gZG1lc2cgb3V0cHV0IGlzIGF0dGFj
aGVkLiANCg0KSSdkIGxpa2UgdG8gY29uZmlybSB0aGUgcHJvYmxlbSB5b3UgZW5jb3VudGVyZWQg
d2FzIGFsc28gY29ubmVjdGlvbg0KYmVjb21lcyBub3QgdXNhYmxlPyANCg0KDQo=
