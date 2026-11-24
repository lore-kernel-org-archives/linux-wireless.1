Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483945;
	b=D3JvyBZ9ZRnwTtyhyMugz7Yjc+zHanwRNpjNeHkctgYM76OSBt5M0APN3II2yALn4Uxa
	 T2gDCEmcbRe3SB2mdiD78ryVsjnJFHicALn3URluyikZqkLKY5uhuN/MSsq4P8ZhaNFLO
	 ADZiBDUQogtitAN8tnO0IWiKE9/eVT442RWs54zvOqwYwH4HZzJAg7R/5zemtKcRomtQA
	 6iQRPw62V3EMgApM1B+QbNFcQuRw8aVH2VHa4kFyO5f8uIHsquSYzcRQ/jD48lCGfWJ5U
	 tbMN20FsUUPMt2PcYz94dE0kg8uFBWxeW4m17Svi0eXU6xM1++H2MC1LKssBaRK+4KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483945;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WmNs17brmFUXawNtsJcYIcN5Fniy0KN/gwCLKHTNXsQ=;
	b=5HTrztFcy2Wyg0AC5/z4DRAP4bOi/lkhT6v64tZwf3idhZg2pw/yOVCXYHw9Khb/y0h5
	 9wevSIL+D5Y8UbxrPe67Z4ITfoRQYPtipcPb37CHvLcDq/XQiraDYQtXaxSG4ilhyJkV3
	 t+jzQkEdngfuIQhHnLAoG6imjuj3XfuT7RtUZ7fIHqNgMq9ZI5rNegLRQ+/QaYUJgvshj
	 Ll/NCVNeAAOQIZaBeMq/h1aF1OAVm5PEJewqoDDEXNanDjeIByONYCa4Se880LJYi/csK
	 HpDCGVdFDs5/hd/F8HyEnTXflmGVEw18dULfht6otHtR7Gf0FmF+7U7OT6ks6HwIaUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=X1rdOoR0;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526F606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4526F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=X1rdOoR0
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO1WKaF42105401, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795483940; bh=WmNs17brmFUXawNtsJcYIcN5Fniy0KN/gwCLKHTNXsQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=X1rdOoR09V3kZHpAPCTb36CJBsPY9UBoIlmamx3QGARA4Y6LYpsmBLlCZpWdEF9lw
	 de+gvG+3JdNnwPyeB2ggHB8ZxV/LfYqQA/q01vtym8YKM+ghkdeFC9IRhpxXM2LEk3
	 mg04WSpr7iBh6XSrwDJrG0T2REDIyFtcdK0FMaBlllIzkibeQVeOQyPAT5/JkgtBqS
	 uw1xKfFZFbibs8DvUSVh6Fkwi53p2MmZMOKd2MP+tLXqXJUnxabcwC47xE+DLDZEuU
	 532cLrQfLYYUSCayhyKMurZpLnGXHHk6EeVlXKxuiUD83R5hrtNMrs4fgusTsAxfhG
	 UVFmIJ/JhY/yw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO1WKaF42105401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 09:32:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 09:32:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 09:32:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 09:32:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Topic: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Index: AQHdY0HfQGIda1zW60KKJQiEj21Ec7cra++AgAUI04CAAvLMgIABpDIQgAbFr4CAAM7HgA==
Date: Tue, 24 Nov 2026 01:32:20 +0000
Message-ID: <56caa561389c432db383b962f86c9b82@realtek.com>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
 <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
 <08a6cf57-9c00-445d-bc91-9375e4ba2ef8@gmail.com>
 <1c527c2ba8d64740a1b1df63b80f6ad7@realtek.com>
 <8226a69f-0c29-414b-8e2c-e01103819d6b@gmail.com>
In-Reply-To: <8226a69f-0c29-414b-8e2c-e01103819d6b@gmail.com>
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
OS8xMS8yMDI2IDA3OjQ4LCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4gQml0dGVyYmx1ZSBTbWl0
aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiA+PiBPbiAxNi8xMS8yMDI2IDA5
OjQzLCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4+PiBCaXR0ZXJibHVlIFNtaXRoIDxydGw4ODIx
Y2VyZmUyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+Pj4gT24gMjQvMTAvMjAyNiAwMTo1NywgQml0
dGVyYmx1ZSBTbWl0aCB3cm90ZToNCj4gPj4+Pj4NCj4gPj4+Pj4gVGhlb3JldGljYWxseSBydGx3
aWZpIHN1cHBvcnRzIFdPV0xBTiwgYnV0IGl0IGRvZXNuJ3Qgd29yayBmb3IgbWUgd2l0aA0KPiA+
Pj4+PiBSVEw4ODIxQUUgb3IgUlRMODgxMkFFLiBydHc4OCBkb2Vzbid0IHN1cHBvcnQgV09XTEFO
IHdpdGggdGhlc2UgY2hpcHMuDQo+ID4+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBBY3R1YWxseSwgdGhp
cyBsb29rcyBsaWtlIG15IGxhcHRvcCdzIGZhdWx0LiBJIHRyaWVkIHdpdGggUlRMODgyMkNFDQo+
ID4+Pj4gYW5kIFJUTDg4NTJCRSwgYW5kIHRoZXkgZG9uJ3Qgd29yayBlaXRoZXIuIFRoZSB3aWZp
IGNhcmQgZG9lc24ndCBoYXZlDQo+ID4+Pj4gcG93ZXIgd2hpbGUgdGhlIGxhcHRvcCBpcyBzdXNw
ZW5kZWQgdG8gUkFNLiBUaGVyZSBpcyBubyBvcHRpb24gZm9yIGl0IGluDQo+ID4+Pj4gdGhlIEJJ
T1MsIGVpdGhlci4NCj4gPj4+DQo+ID4+PiBJZiB5b3UgaGF2ZSBhbiBleHRlcm5hbCBQQ0lFIGFk
YXB0ZXIsIGl0IHdpbGwgYmUgcG9zc2libGUgdG8gY29ubmVjdA0KPiA+Pj4gYW4gZXh0ZXJuYWwg
cG93ZXIgdG8ga2VlcCBXaUZpIHdvcmtpbmcuIChOb3RlIHRoaXMgbWlnaHQgZGFtYWdlIHlvdXIN
Cj4gPj4+IGxhcHRvcCBvciBXaUZpIGNhcmQgaWYgY29ubmVjdCBleHRlcm4gcG93ZXIgdG8gd3Jv
bmcgaGFyZHdhcmUgcGlucykNCj4gPj4NCj4gPj4gSSBkb24ndCBoYXZlIGFueXRoaW5nIGV4dGVy
bmFsLCBidXQgeW91IGdhdmUgbWUgYW4gaWRlYS4NCj4gPj4NCj4gPj4gSSBzb2xkZXJlZCB0d28g
d2lyZXMgb24gdGhlIG1vdGhlcmJvYXJkLiBPbmUgY29ubmVjdHMgdGhlIE0uMiBzbG90IHRvIHRo
ZQ0KPiA+PiAzLjNWIGxpbmUgd2hpY2ggc3RheXMgb24gaW4gUzMuIFRoZSBvdGhlciBjb25uZWN0
cyB0aGUgTS4yIHNsb3QncyBQQ0llDQo+ID4+IFdBS0UgcGluIHRvIHRoZSBsYXB0b3AncyBwb3dl
ciBidXR0b24uIE5vdyB0aGUgbGFwdG9wIHdha2VzIHVwIHdoZW4NCj4gPj4gSSBzZW5kIHRoZSBt
YWdpYyBwYWNrZXQuDQo+ID4NCj4gPiBBcyB0aGUgcmVzdWx0LCBJIHRoaW5rIFdvV0xBTiB3b3Jr
cyBmaW5lIHdoZW4geW91ciBwbGF0Zm9ybSBpbiBTMy4NCj4gPg0KPiA+Pg0KPiA+PiBJJ20gbm90
IHN1cmUgaXQncyB3b3JraW5nIDEwMCUgY29ycmVjdGx5LiBSVEw4ODIxQUUgKHdpdGggcnR3ODgp
LA0KPiA+PiBSVEw4ODIyQ0UsIGFuZCBSVEw4ODUyQkUgYWxsIGRpc2Nvbm5lY3QgZnJvbSB0aGUg
bmV0d29yayBhZnRlciB3YWtpbmcgdXAuDQo+ID4+IElzbid0IGl0IHN1cHBvc2VkIHRvIHN0YXkg
Y29ubmVjdGVkPw0KPiA+DQo+ID4gSXQgc2hvdWxkIHN0YXkgY29ubmVjdGVkLiBIYXZlIHlvdSB0
cmllZCBjb25uZWN0aW9uIHdpdGhvdXQgc2VjdXJpdHk/DQo+ID4gQWxzbywgSSB0aGluayBpdCdk
IGJlIGhlbHBmdWwgdG8gZGlnIHByb2JsZW0gd2l0aCBhaXIgc25pZmZlci4NCj4gDQo+IEl0J3Mg
dGhlIHNhbWUgd2l0aG91dCBzZWN1cml0eS4NCj4gDQo+IFRoZSBzbmlmZmVyIHNob3dzIHRoYXQg
dGhlIGNsaWVudCBzZW5kcyBhIGRlYXV0aGVudGljYXRpb24gZnJhbWUuDQo+IEkgdGhpbmsgaXQg
aGFzIHNvbWV0aGluZyB0byBkbyB3aXRoIE5ldHdvcmtNYW5hZ2VyLCBiZWNhdXNlIGlmIEkgc3Rv
cA0KPiB0aGUgTmV0d29ya01hbmFnZXIgYW5kIHdwYV9zdXBwbGljYW50IHNlcnZpY2VzIGFuZCBy
dW4gd3BhX3N1cHBsaWNhbnQNCj4gbWFudWFsbHksIHRoZSBjbGllbnQgc3RheXMgY29ubmVjdGVk
IGFmdGVyIHdha2luZyB1cC4NCg0KR29vZCB0byBrbm93IHRoYXQsIGJ1dCBJIGRvbid0IGhhdmUg
ZXhwZXJpZW5jZSB3aXRoIE5ldHdvcmtNYW5hZ2VyLCBzb3JyeS4NCg0KDQo=
