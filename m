Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789697;
	b=GHo0XtgFof7+aSVoKjMo4oQEwE7VAroOo+1CcX5dcVI2VItAL4OaAZanRoJOQ1iutSCf
	 yaL0hILHrBBYEA0namAsrRSAdi+6JbEA1B1sG4fF65TJ0/fo9mum8tm8IbRz5SOLb6Khu
	 JX0i4Rf+1DCyjLO2MY+rscz5BFw7IlEDwME2z0KkRgFZA6UtCs/kotcR5aqSCE/FggX1e
	 P/VXxS1l7opSvdSqL7y0eME2wp3YloccpjMqjO4iUw8xgkozs8obtVOmzkKGS2tTtxGej
	 EqdDu+kAR1pAqwpXzO/xZfVqqWTBpm76NpJHy2zAE96jvtFNxB8nTHcKAhS7FByRECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789697;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=k+V0c0QTfwbjOBLho+aPVXHfT26IV0QrMzdVRB6G0MY=;
	b=1jwFvKN7c+6EgsNSVXEafvvRjXNUAjwJCClvioXvt4WZN8OKJxlXcUOaxGNSh/o4zfFS
	 npOsvMkIfjF2Kjw5bLk0JxvHr8nlmxaxV+fDXHdyrgyodHp1esCJMvuKS5VBKIGqb6OJL
	 STR0ZjfLpvmvfklfZyJNCVuvCeSz2i5e/5hYpQjI6OukZlAE1Wij6vB8+qqr49DDRN+Gk
	 HQEmmi6nAZnKQwDz6PSa87YV9g3k7EpubPjk94OS2nEyOwDoEjMpwmimFS5j5uPFW+7M2
	 Ku6YkIfdA14KI13zmL9N+KwNjnhD/kZToUfNgczwJWk/N+gpv3EsM9Hzzy2+Mmy8xiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=k4aXhrvd;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B0606A33D
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319B0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=k4aXhrvd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG0fUaqD2859423, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794789690; bh=k+V0c0QTfwbjOBLho+aPVXHfT26IV0QrMzdVRB6G0MY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=k4aXhrvdiv3VDa8gvIw8o2X41GxpQcaEGWhBprEmtJX+ox2Wr5QzHiEP5x1hPbTsY
	 JfafNmxC4xjjVg77jO/ZulT7+v2eE4Q9jye6hARRwz79viyLp0K47knKEguEx3fQG4
	 tybRpriUXjBJ5jXTCmRGXZKzW3il41LxCHrFT3GQtfp9ej1/8tGpOYQ37hsaMWK6G4
	 QtTtwAJrRHAB4ypKEeHViLFTRJu8Ooo+lQUvX4ign9kLAUUfVqiiinfyPlYWh197XY
	 MmQknz5PeNmD2Ztb3qL+RcARF2dJntnG4R0luZMlqZy6v640w67ohPs8TrPf0BwzOr
	 kGUDibOosp8Yw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG0fUaqD2859423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 08:41:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:41:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 08:41:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 08:41:30 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "V. S." <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHdc0YlUf9eQmeiD0qR+cPoa7qFpLcrqBfg///0NQCAAthicIAAEBAAgAFZOnA=
Date: Mon, 16 Nov 2026 00:41:29 +0000
Message-ID: <a0448c760a5243a7b956b16e9d563183@realtek.com>
References: <20261113080731.30155-1-spam@acio.nl>
 <4985719de8b5439e8484384ed52033e1@realtek.com>
 <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
 <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com>
 <CAJKtVVa6n++Uhy7z58d-Wbb3oGnTHz+bHt07_Akp7FPn6F2qYA@mail.gmail.com>
In-Reply-To: <CAJKtVVa6n++Uhy7z58d-Wbb3oGnTHz+bHt07_Akp7FPn6F2qYA@mail.gmail.com>
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

Vi4gUy4gPHNwYW1AYWNpby5ubD4gd3JvdGU6DQo+IFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0
ZWsuY29tPiB3cm90ZToNCj4gPiBIb3cgYWJvdXQgbWVtc2V0KHJhLCAwLCBvZmZzZXRvZih0eXBl
b2YoKnJhKSwgcnNzaV91bmtub3duKSkgPw0KPiANCj4gR29vZCBpZGVhLiBJIGRpZCB0aGlzIGZv
ciB2NC4gVGhlbiB0aGUgUkEgdXBkYXRlIGRvZXMgbm90IG5lZWQgdGhlDQo+IGxvY2FsIHZhcmlh
YmxlLCBhbmQgaXQgY2xlYXJzIHRoZSBmbGFnIGFmdGVyIGl0IHVzZXMgdGhlIGZsYWcuDQo+IA0K
PiA+IC8qIGRyaXZlciBoZWxwZXJzIChub3QgY2xlYXIgYnkgcnR3ODlfcGh5X3JhX3N0YV91cGRh
dGUoKSkgKi8NCj4gPg0KPiA+ID4gKyBib29sIHJzc2lfdW5rbm93bjoxOw0KPiANCj4gT25lIGNo
YW5nZSBmcm9tIHlvdXIgcHJvcG9zYWw6IHJzc2lfdW5rbm93biBtdXN0IGJlIGEgcGxhaW4gYm9v
bCwgbm90DQo+IGEgYml0LWZpZWxkLiBvZmZzZXRvZigpIGNhbm5vdCBiZSB1c2VkIG9uIGEgYml0
LWZpZWxkLiBXaXRoDQo+ICJib29sIHJzc2lfdW5rbm93bjoxOyIsIGdjYyBzdG9wcyB3aXRoIHRo
ZSBlcnJvciAiYXR0ZW1wdCB0byB0YWtlDQo+IGFkZHJlc3Mgb2YgYml0LWZpZWxkIHN0cnVjdHVy
ZSBtZW1iZXIiLiBJIGFsc28gd3JvdGUgIm5vdCBjbGVhcmVkIg0KPiBpbiB0aGUgY29tbWVudC4N
Cj4gDQo+IEFsc28sIHdpdGggdGhpcyBtZW1zZXQgdGhlIG9yZGVyIG9mIHRoZSBmaWVsZHMgaXMg
aW1wb3J0YW50IGZvcg0KPiBmdXR1cmUgY2hhbmdlcy4gcnNzaV91bmtub3duIGlzIHRoZSBib3Vu
ZGFyeSBvZiB0aGUgbWVtc2V0Og0KPiAtIEEgbmV3IGZpZWxkIGZvciB0aGUgSDJDIGNvbW1hbmQg
bXVzdCBiZSBhYm92ZSByc3NpX3Vua25vd24uIElmIGl0IGlzDQo+ICAgYmVsb3csIHJ0dzg5X3Bo
eV9yYV9zdGFfdXBkYXRlKCkgZG9lcyBub3QgY2xlYXIgaXQsIGFuZCB0aGUgUkEgdXBkYXRlDQo+
ICAgc2VuZHMgYW4gb2xkIHZhbHVlLg0KPiAtIEEgbmV3IGRyaXZlciBoZWxwZXIgbXVzdCBiZSBi
ZWxvdyByc3NpX3Vua25vd24uIElmIGl0IGlzIGFib3ZlLCB0aGUNCj4gICBtZW1zZXQgY2xlYXJz
IGl0IGV2ZXJ5IDIgc2Vjb25kcy4NCj4gVGhlIGNvbW1lbnQgbWFya3MgdGhpcyBib3VuZGFyeS4g
VGVsbCBtZSBpZiB5b3Ugd2FudCBhIHN0cm9uZ2VyDQo+IGNvbW1lbnQsIGZvciBleGFtcGxlICJr
ZWVwIGRyaXZlciBoZWxwZXJzIGJlbG93IHRoaXMgbGluZSIuDQoNClRoZSBzdHJvbmdlciBjb21t
ZW50IGlzIGdvb2QgdG8gbWUuDQoNCkkgaGF2ZSBhbm90aGVyIHRob3VnaHQgaXMgdG8gdXNlIHN0
cnVjdF9ncm91cCgpIHRvIGhhdmUgY2xlYXIgYm91bmRhcnksIHN1Y2ggYXMNCg0Kc3RydWN0IHJ0
dzg5X3JhX2luZm8gew0KCS4uLg0KDQoJLyoga2VlcCBkcml2ZXIgaGVscGVycyBiZWxvdyBpbiBn
cm91cCAobm90IGNsZWFyZWQgYnkgcnR3ODlfcGh5X3JhX3N0YV91cGRhdGUoKSkgKi8NCglzdHJ1
Y3RfZ3JvdXAoaGVscGVycywNCgkgICAgICAgICAgICAgYm9vbCByc3NpX3Vua25vd247DQoJKTsN
Cn07DQoNCj4gDQo+IFRoaXMgaXMgdGhlIHY0IGNoYW5nZToNCj4gDQo+IC0tLSBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL3JlYWx0ZWsvcnR3ODkvY29yZS5oDQo+IEBAIHN0cnVjdCBydHc4OV9yYV9pbmZvIHsN
Cj4gICB1OCBtYWNpZF9tc2I6MjsNCj4gICB1OCBiYW5kOjI7IC8qIGVudW0gcnR3ODlfYmFuZCAq
Lw0KPiAgIHU4IGlzX25ld19kYmdyZWc6MTsNCj4gKyAvKiBkcml2ZXIgaGVscGVycyAobm90IGNs
ZWFyZWQgYnkgcnR3ODlfcGh5X3JhX3N0YV91cGRhdGUoKSkgKi8NCj4gKyBib29sIHJzc2lfdW5r
bm93bjsNCj4gIH07DQo+IA0KPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0
dzg5L3BoeS5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvcGh5
LmMNCj4gQEAgc3RhdGljIHZvaWQgcnR3ODlfcGh5X3JhX3N0YV91cGRhdGUoc3RydWN0IHJ0dzg5
X2RldiAqcnR3ZGV2LA0KPiAtIG1lbXNldChyYSwgMCwgc2l6ZW9mKCpyYSkpOw0KPiArIG1lbXNl
dChyYSwgMCwgb2Zmc2V0b2YodHlwZW9mKCpyYSksIHJzc2lfdW5rbm93bikpOw0KPiBAQCB2b2lk
IHJ0dzg5X3BoeV9yYV91cGRhdGVfc3RhX2xpbmsoc3RydWN0IHJ0dzg5X2RldiAqcnR3ZGV2LA0K
PiAgIHJjdV9yZWFkX3VubG9jaygpOw0KPiANCj4gKyByYS0+aW5pdF9yYXRlX2x2ID0gcnR3ODlf
cGh5X3JhX2dldF9pbml0X3JhdGVfbHYocnR3c3RhX2xpbmspOw0KPiArIGlmIChyYS0+cnNzaV91
bmtub3duICYmIHJhLT5pbml0X3JhdGVfbHYpIHsNCj4gKyByYS0+dXBkX2FsbCA9IDE7DQo+ICsg
cmEtPnJzc2lfdW5rbm93biA9IGZhbHNlOw0KPiArIH0NCj4gICBpZiAoY2hhbmdlZCAmIElFRUU4
MDIxMV9SQ19TVVBQX1JBVEVTX0NIQU5HRUQpDQo+ICAgcmEtPnVwZF9tYXNrID0gMTsNCj4gQEAg
dm9pZCBydHc4OV9waHlfcmFfYXNzb2Moc3RydWN0IHJ0dzg5X2RldiAqcnR3ZGV2LCBzdHJ1Y3QN
Cj4gcnR3ODlfc3RhX2xpbmsgKnJ0d3N0YV9saW5rKQ0KPiAgIHJhLT5pbml0X3JhdGVfbHYgPSBy
dHc4OV9waHlfcmFfZ2V0X2luaXRfcmF0ZV9sdihydHdzdGFfbGluayk7DQo+ICsgcmEtPnJzc2lf
dW5rbm93biA9ICFyYS0+aW5pdF9yYXRlX2x2Ow0KPiAgIHJhLT51cGRfYWxsID0gMTsNCg0KSSB0
aGluayB0aGUgY29taW5nIHY0IHdpbGwgYmUgZ29vZCB0byBtZS4NCg0KPiANCj4gT25seSBydHc4
OV9waHlfcmFfYXNzb2MoKSBhbmQgcnR3ODlfcGh5X3JhX3VwZGF0ZV9zdGFfbGluaygpIGNhbGwN
Cj4gcnR3ODlfcGh5X3JhX3N0YV91cGRhdGUoKS4gQSBuZXcgc3RhdGlvbiBzdGFydHMgd2l0aCBh
IHplcm9lZA0KPiBydHc4OV9zdGEsIGFuZCBydHc4OV9waHlfcmFfYXNzb2MoKSBzZXRzIHRoZSBm
bGFnIGFnYWluIGZvciBlYWNoDQo+IGFzc29jaWF0aW9uLg0KPiANCj4gSSB0ZXN0ZWQgdGhpcyBv
biBSVEw4OTEyQVUgaW4gQVAgbW9kZS4gVGhlIGNsaWVudCBpcyBhdCAtNTYgdG8NCj4gLTU5IGRC
bSwgYW5kIGVhY2ggY29ubmVjdGlvbiBzZW5kcyBUQ1AgZm9yIDYwIHMuIDggb2YgOCBjb25uZWN0
aW9ucw0KPiB1c2UgODAgTUh6IChWSFQgMVNTIE1DUyA5IG9yIDJTUyBNQ1MgNSB0byA3KSwgMzQx
IHRvIDQyOCBNYml0L3MuIFBNRg0KPiBzdGlsbCB3b3Jrcy4NCj4gDQo+IElmIHRoaXMgaXMgT0sg
Zm9yIHlvdSwgSSB3aWxsIHNlbmQgdjQgd2l0aCAiU3VnZ2VzdGVkLWJ5OiBQaW5nLUtlIFNoaWgi
Lg0KDQpXaXRoL3dpdGhvdXQgc3VnZ2VzdGVkLWJ5IGFyZSBPSyB0byBtZS4NCg0KDQo=
