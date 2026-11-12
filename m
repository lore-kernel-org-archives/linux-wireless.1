Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794443324;
	b=TI+upNsxedwrdIXYiRhPB0zCvCY/p3ta+zlsrH0mGtDPDummYyvPlRHn33AyOnsz8Hd6
	 VfW5YINV71ip0DODUmrZwOEt22vrI2XsvYBgNKClFwshnM6lnPL5aGaFEkcuNAIMUmcv0
	 ifvQZuBc8Y5bjaBgHAqhk1yiA1yvGg224SRS9fpmRboduzEFZ1WGF5ekgmIxrncSrY3i/
	 SnZ3YjAiRuR5vO9HXzmicb2l9LWbTHs6793R1TrQBTlfPyWgTEQkaVOQSNHaFDTFa2Nfz
	 J2dXe6djCIPTe2QG3R5DOptNwpJFtIeGsukJQ3AKY6DuzGZ1+4bq0ihElm4AFhYzeoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443324;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ny5VnKkmiFn54cli0mHevUAbvhvveN8rURdQpVia1Z4=;
	b=PNYhd6GaeD1M4qinxSlVcha7GCWhxO3TAQsTKMwPXxfrh+7cTZCOI/H5a43nvwLMLUAr
	 rLZhteYQZqJ3KMMKfYs/JAooSNuYFc4CpDzVHlgQQNZJpLHOsYD7/93hmuOT92SUY/wg8
	 26VFYrUfsIkOLAUdxiz6+JL0IgCpgADsc1pnZZJ5Fe4s/3fxMGSBhP+1Vjja/lzjcEw8N
	 hk80n+phCTkqcSkWZ021gM0vQWTJmJoTkqzy8T0t4TARPpuyJTFGUEliV0w5gNrnMTof6
	 MoMM3yR/VyalOQW22vPUCrDYWSY/+lNMfL2TXTNkW0AiqI9imz2Kzz4MJPxj+EYDwIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rG9noM4C;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8935606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8935606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rG9noM4C
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC0ScgL63229592, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794443318; bh=ny5VnKkmiFn54cli0mHevUAbvhvveN8rURdQpVia1Z4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=rG9noM4CBH7AMeWCr4pjn9eH7RfWfpoBziznZ29VuSxQs8/rvZUpObgZvE61dI0Wt
	 besImwKZfXLmdAeHngugWCusZ5nu9L2dbNdp3wGPOLvFBjXf6rSr8spkGaHFu9O1c4
	 xBSy5onwjyFP0vXnD0hXvvYiaIw2Dzdy+wih+85000WRDcPJatWzr/qJve10URqEV7
	 Cs2SB5s1dgphjb4UYVbj948ixw5aKkkX6xU4iW2LZAUTbmwTxLMsTXhDy4MkoZ2cjb
	 cSLKrrY7tHGtzlkuqhCOt2nXsl4JJbrGNf5xDotCHE+b73pF/qsy/UObLpEP6JHeit
	 DOiBJjTBWt5lw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC0ScgL63229592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 08:28:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 08:28:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 08:28:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 08:28:38 +0800
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
Thread-Index: AQHdaZogezorIXmrF0q/5jdQlxC1rrcZ84FwgAzsMQCAATugkIAAM86AgAFWT3A=
Date: Thu, 12 Nov 2026 00:28:38 +0000
Message-ID: <4c9f8c150753483bbed78337885732a7@realtek.com>
References: <CADp4rm+GmTjCoFXvT8WpiLNohnREqfR9z78PfH1m2rxs00jMUQ@mail.gmail.com>
 <703ebc52e1d544e590874df041b4d979@realtek.com>
 <ef843858-be07-49b3-9505-3ce08dbd28d2@gmail.com>
 <b8df608ab1e141388d663734fc631a02@realtek.com>
 <3eb642b4-a3cb-4b21-9dbd-aa6880593b57@gmail.com>
In-Reply-To: <3eb642b4-a3cb-4b21-9dbd-aa6880593b57@gmail.com>
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

Qml0dGVyYmx1ZSBTbWl0aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiBPbiAx
MS8xMS8yMDI2IDAyOjU3LCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4NCj4gPiBCaXR0ZXJibHVl
IFNtaXRoIDxydGw4ODIxY2VyZmUyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+IFNvbWVvbmUgZWxz
ZSByYW4gaW50byB0aGUgc2FtZSBwcm9ibGVtIChJIHRoaW5rKSBhbmQgY2FwdHVyZWQgZm91cg0K
PiA+PiBjcmFzaGVzIHdpdGggeW91ciBwYXRjaC4gZG1lc2cgb3V0cHV0IGlzIGF0dGFjaGVkLg0K
PiA+DQo+ID4gSSdkIGxpa2UgdG8gY29uZmlybSB0aGUgcHJvYmxlbSB5b3UgZW5jb3VudGVyZWQg
d2FzIGFsc28gY29ubmVjdGlvbg0KPiA+IGJlY29tZXMgbm90IHVzYWJsZT8NCj4gDQo+IFRoZSB1
c2VyIHNheXMgdGhlcmUgaXMgbm8gb3RoZXIgcHJvYmxlbSwganVzdCB0aGUgY3Jhc2hlcy4NCj4g
DQo+IEkgZm9yZ290IHRvIGxpbmsgdGhlIHJlcG9ydCBlYXJsaWVyOg0KPiANCj4gaHR0cHM6Ly9n
aXRodWIuY29tL21vcnJvd25yL3J0dzg5L2lzc3Vlcy85OCNpc3N1ZWNvbW1lbnQtNjcyNjA3MTgz
Mg0KDQpUaGUgImNyYXNoIiBpcyBTRVIgTDEgdGhhdCBmaXJtd2FyZSBkZXRlY3RzIGFibm9ybWFs
LCByZWNvdmVycywgYW5kIA0Kbm90aWZpZXMgZHJpdmVyLiBCdXQgaXQgbG9va3MgYSBsaXR0bGUg
ZnJlcXVlbnQ6DQoNClN1biBOb3YgOCAxOTo0NjozMSAyMDI2DQpTdW4gTm92IDggMTk6NDc6NDAg
MjAyNg0KU3VuIE5vdiA4IDIwOjQwOjQ2IDIwMjYNClN1biBOb3YgOCAyMTowOTowNyAyMDI2DQpT
dW4gTm92IDggMjE6MTA6NTUgMjAyNg0KDQpXZSBhcmUgYW5hbHl6aW5nIHRoZSBsb2cuIFBsZWFz
ZSBnaXZlIHVzIHNvbWUgdGltZS4gDQoNCg0K
