Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814987;
	b=nLYpDpiJUdgYkGF6N2CXc+Eq+/rl8P3o4b5RLM2HNLz3UpYJvu9w+WaTwlf8sAiH3LqJ
	 oFFDzenP+5IHOLRO9jPqsT/dze7g0PS0+MxDAQAZpHCEEIbJJ76VnqUxAcOuDkSdZrUb5
	 DaEAARCkbpPosRdukvIArFMckzhpAGfCCKwfu5+1d/rbd8T6EhZ6siX61o7fsUnPJNLqr
	 plRrW0BXktL/PfOcAyQza9CrBMazNaP8tYtRjiv9n4j0iJ01xCShBvAAvoAP2GWLH4WRV
	 4vUtTqYy/DOKncPjYvFjFeKTsN3wlEB6TX7gEsnf0yrxXeTf7UqPqPlABaOeV2AQPeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814987;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=xj8klUyL6tMPgmR458jntQbZ86w7ANcfqsfJtLLIKJc=;
	b=MVyoyZjbtMs7ikzWF0Ej3hbx9g7s5MvO843b8l9BDmnnY2hOj8WrBCMzjaAevafhkAkt
	 HU2UC9g/56TtBIqBRH8ArN6Yf98hjHx37z8vwpvCR6tRWE5jz4sH7fCnf/48oJo/9tm8K
	 2bh27Q2+uaexHc6O/SRtv1uHX3M/P8pcZKKkkpIUuPxDwT4QcEVSGjRoBEhX2EMelmPJp
	 MjnciRXx2GquZ15qWM7hhFAS/Yqm06w673NMKcT/zrIZ/kuu9C0/AjzKP2BZxzaXOtsly
	 tukLg4vOBe4tewVFS4nbwFm9pI9z3i6mieKqtdn6ezjyXzQIzTaaLS/BDTYWKvRfamg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PrTGKPD3;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959FD606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959FD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PrTGKPD3
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG7h2RL13219735, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794814982; bh=xj8klUyL6tMPgmR458jntQbZ86w7ANcfqsfJtLLIKJc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PrTGKPD3l5bRIjF/sVvCmlT3hyYQMiOQtcXNs3VgtPQAXoQVAhnoMPZxwpjYEwsXA
	 zmTPxyuoJLu6A4Ee8iG/ZugLDGz3NXomESF9JPw6/s/EZnrvobr0NRkBuCDUMPRBkI
	 iai25/s89iFU3bKVg4eWobMkvE8W+8U/4HUgeC2lsAHXXhjyuMsMb7osdk9TaEi+9z
	 SGV4UEATGSx1bZOu7I59lE7Hj9jcX6keJZVsFUvKt6btEGl+YzGANLyVG9JfZTnhfU
	 cJFuYnLHCReci/jV9cMXptHc4ccpNNMIE/NJufKhgjP/Z8hP6kd7nc8HpfBRWDTrp5
	 gV250qSLiBHbw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG7h2RL13219735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 15:43:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:43:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:43:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 15:43:02 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Topic: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Index: AQHdY0HfQGIda1zW60KKJQiEj21Ec7cra++AgAUI04A=
Date: Mon, 16 Nov 2026 07:43:02 +0000
Message-ID: <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
In-Reply-To: <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
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

Qml0dGVyYmx1ZSBTbWl0aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiBPbiAy
NC8xMC8yMDI2IDAxOjU3LCBCaXR0ZXJibHVlIFNtaXRoIHdyb3RlOg0KPiA+DQo+ID4gVGhlb3Jl
dGljYWxseSBydGx3aWZpIHN1cHBvcnRzIFdPV0xBTiwgYnV0IGl0IGRvZXNuJ3Qgd29yayBmb3Ig
bWUgd2l0aA0KPiA+IFJUTDg4MjFBRSBvciBSVEw4ODEyQUUuIHJ0dzg4IGRvZXNuJ3Qgc3VwcG9y
dCBXT1dMQU4gd2l0aCB0aGVzZSBjaGlwcy4NCj4gPg0KPiANCj4gQWN0dWFsbHksIHRoaXMgbG9v
a3MgbGlrZSBteSBsYXB0b3AncyBmYXVsdC4gSSB0cmllZCB3aXRoIFJUTDg4MjJDRQ0KPiBhbmQg
UlRMODg1MkJFLCBhbmQgdGhleSBkb24ndCB3b3JrIGVpdGhlci4gVGhlIHdpZmkgY2FyZCBkb2Vz
bid0IGhhdmUNCj4gcG93ZXIgd2hpbGUgdGhlIGxhcHRvcCBpcyBzdXNwZW5kZWQgdG8gUkFNLiBU
aGVyZSBpcyBubyBvcHRpb24gZm9yIGl0IGluDQo+IHRoZSBCSU9TLCBlaXRoZXIuDQoNCklmIHlv
dSBoYXZlIGFuIGV4dGVybmFsIFBDSUUgYWRhcHRlciwgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byBj
b25uZWN0DQphbiBleHRlcm5hbCBwb3dlciB0byBrZWVwIFdpRmkgd29ya2luZy4gKE5vdGUgdGhp
cyBtaWdodCBkYW1hZ2UgeW91cg0KbGFwdG9wIG9yIFdpRmkgY2FyZCBpZiBjb25uZWN0IGV4dGVy
biBwb3dlciB0byB3cm9uZyBoYXJkd2FyZSBwaW5zKQ0KDQoNCg==
