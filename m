Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569680;
	b=c7wDO/hHvMWKSz3PygSMaXOjARGKCYXMx2YfWdwCdtpdgr8/VlnHELDhdbtZH388DC9W
	 ZSDPWYlTmchkdsFB7jWtlYc7I7MRQsZfcgYQ/8tHXee7DzqnqHjXz96nnabb4cVp2ORAS
	 LOelfguvyWNY/Id5QreOOcqo79pSDWgptBdUrwu/SuubldgcVdNLxwe0rntCY6utH+kOg
	 wNb9felmYsOw+fadn71iSPVU/iyHTTH86qOaYprdvg3R3a17YB2l/yhuoCWGHViOkfW3F
	 3VJEZCqfr4cej5kFDizWLPKZI1NMlVXz9JUAnBgpsE+OnhAxEtSRqbRLRjlsktJPynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569680;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6Hr99w0AYVbXgOPOFxXzggljrKxIQbCXkYtiCqnUM3Q=;
	b=0UazZjiC9GxezIN+1BWvFGMfeIibtED2iAXlJW/quX2kxyljuJ0cf2dGcsj4MFrNiumS
	 e9iJfYr0iEibhHSXjG0CZxsQfj+T/rqoScRpM7WoHaqKRqyvdquXSqG7CpWtas9vdgy+X
	 OFud7ZeuDqqZi0uMPvHDvhPF1RgMcOMdDPwraBprHxwyzQIsDRCScg7uhB03WKwAK4HIk
	 XPB5S+zKnVFeApdGOWkmFdRh/FbDlZREhX/TG8QYf7i1W3t7vK+lXdwOu8k5mkb/UJtnf
	 83gKcqhNDnxVnbAkmrIkNYjLxrVDo/NIuVhuY558qk1B1zPzblNIvI5d1SAtTwB5e4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s6Hh8jgx;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEBA606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s6Hh8jgx
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP1LDIq83021409, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795569673; bh=6Hr99w0AYVbXgOPOFxXzggljrKxIQbCXkYtiCqnUM3Q=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=s6Hh8jgxRBofjgUdNPf3Wk9Ja7L+81pXW0/CIhBio6RRaRlvKvdr1V35MWLfVcj+g
	 9orCFNe2qilVsQMabcrpY4l0UXEE2hcWAz9Yu+K/sPUM3E/b0wjYgGl0RhYdkoinSY
	 nl+HOyDGJ/nYSZUpSXzRbIBoxl9fmhUk5bN55rzRUfly7bPdaewlwiQJYZIOS9K3g4
	 rBlTBXMBQJEZgqO9osTUrneLVS82RvEuvvraQrXuhCcUUgG3TYC8YWVG7Fj4Ighcn/
	 bwIBqb3C3Jn+BlOi4bKhFrvh9JmDI+36paFunTmqlloksW37j19gi59cRzqxJCOw4w
	 H1K1kSVP3+/iQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP1LDIq83021409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 09:21:13 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 09:21:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 09:21:13 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 25 Nov 2026 09:21:13 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jimmy <kernel@jimmycushnie.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows
 with the same hardware
Thread-Topic: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows
 with the same hardware
Thread-Index: AQHde+qVS/GIpZ76Fk61c4tbPwE3arc88GyggAAhQ4CAAOWvEA==
Date: Wed, 25 Nov 2026 01:21:13 +0000
Message-ID: <077a164224714d3dba29cd650c385eb2@realtek.com>
References: <a98a6666-1499-433f-8c3f-d7277224b334@jimmycushnie.com>
 <c4513d04819e4b52b855e5a21c67b8d2@realtek.com>
 <7530cda9-06c9-41af-885b-238eb20a66f2@jimmycushnie.com>
In-Reply-To: <7530cda9-06c9-41af-885b-238eb20a66f2@jimmycushnie.com>
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

DQpKaW1teSA8a2VybmVsQGppbW15Y3VzaG5pZS5jb20+IHdyb3RlOg0KPiBQaW5nLUtlIFNoaWgg
PHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ICA+IEppbW15IDxrZXJuZWxAamltbXljdXNo
bmllLmNvbT4gd3JvdGU6DQo+ICA+PiBJIGhhdmUgYSBSVEw4OTIyQUUgd2hpY2ggb25seSBnZXRz
IDYwLTEyMCBNYnBzIFRDUCB0aHJvdWdocHV0IG9uDQo+ICA+PiBMaW51eCwgZXZlbiB0aG91Z2gg
dGhlIGxpbmsgcmVwb3J0cyAxMjAwLjkgTUJpdC9zIEhFLU1DUyAxMSBOU1MgMiBpbg0KPiAgPj4g
Ym90aCBkaXJlY3Rpb25zIHdpdGggYSBzdHJvbmcgc2lnbmFsLg0KPiAgPg0KPiAgPiBJdCBsb29r
cyBsaWtlIFBIWSByYXRlIGlzIG5vcm1hbC4gUGxlYXNlIGNhcHR1cmUgYWlyIHBhY2tldHMgYW5k
DQo+ICA+IGNvbXBhcmUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBXaW5kb3dzIGFuZCBMaW51eC4N
Cj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGRlYnVnZ2luZyBhZHZpY2UuIEkgY2FwdHVyZWQgYWly
IHRyYWZmaWMgd2l0aCBteQ0KPiBtYWNib29rJ3Mgc25pZmZlciB0b29sIGR1cmluZyBhIHNwZWVk
IHRlc3Qgb24gdGhlIFBDLCBvbmNlIG9uIExpbnV4IGFuZA0KPiBvbmNlIG9uIFdpbmRvd3MuIFBI
WSByYXRlcyBsb29rIHRoZSBzYW1lIG9uIGJvdGg6IGRhdGEgZnJhbWVzIGFyZSBhdA0KPiBIRS1N
Q1MgMTAvMTEgKDEwODAtMTIwMSBNYi9zKSwgYW5kIExpbnV4IGFjdHVhbGx5IGhhcyBmZXdlciBy
ZXRyaWVzDQo+ICgwLjIlIG9mIGZyYW1lcyB2cyAxLjYlIG9uIFdpbmRvd3MpLg0KPiANCj4gVGhl
IG1haW4gZGlmZmVyZW5jZSBJIGNvdWxkIGZpbmQgaXMgdGhhdCBXaW5kb3dzIHVzZXMgQmxvY2tB
Y2sgd2F5IG1vcmUNCj4gdGhhbiBMaW51eDoNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTGludXggICAgIFdpbmRvd3MNCj4gICAgQmxvY2tBY2sgZnJhbWVzIHNlbnQg
YnkgUEMgICAgICAwICAgICAgICAgMzAzMzINCj4gICAgQmxvY2tBY2sgZnJhbWVzIHNlbnQgYnkg
QVAgICAgICAwICAgICAgICAgMTY0NTUNCg0KSXQgaXMgd2VpcmQgd2h5IExpbnV4IGRvZXNuJ3Qg
dHJ5IHRvIGJ1aWxkIEJBIHNlc3Npb24uIA0KTWF5YmUgeW91IGNhbiB0cnkgYW5vdGhlciBBUCwg
c3VjaCBhcyB5b3VyIGNlbGwgcGhvbmUuDQoNCkNoZWNrIFRYIHNpZGUgZmlyc3Q6DQoNCkNoZWNr
IGlmIGRyaXZlciBlbnRlcnMgcnR3ODlfY29yZV90eHFfY2hlY2tfYWdnKCkgYW5kIHF1ZXVlIHdv
cmsNCiAgICBpZWVlODAyMTFfcXVldWVfd29yayhodywgJnJ0d2Rldi0+YmFfd29yaykNCg0KYW5k
IHRoZW4NCiAgICBpZWVlODAyMTFfc3RhcnRfdHhfYmFfc2Vzc2lvbihzdGEsIHRpZCwgMCk7DQoN
CmFmdGVyIEJBIHNlc3Npb24gZXN0YWJsaXNoLCB0aGUgZnVuY3Rpb24gaXMgY2FsbGVkOg0KDQog
ICAgcnR3ODlfb3BzX2FtcGR1X2FjdGlvbigpDQoNCj4gICAgUEMgZGF0YSBNUERVcyBwZXIgQS1N
UERVICAgICAgICAxLjAgICAgICAgNC4xDQo+ICAgIE5vcm1hbCBBQ0tzIHNlbnQgdG8gUEMgICAg
ICAgICAgNTI3MDQgICAgIDM4NzUNCg0KU28gSSB0aGluayB0aGUgZGlmZmVyZW5jZSBpcyBBLU1T
RFUgb3IgQS1NUERVIG51bWJlci4gRm9yIFRYIGRpcmVjdGlvbiwNCnRyeSB0byAoaGFyZCBjb2Rl
KSBpbmNyZWFzZSBkZXNjX2luZm8tPmFtcGR1X251bSB0byAzMSBpbg0KcnR3ODlfY29yZV90eF91
cGRhdGVfYW1wZHVfaW5mbygpLg0KDQpGb3IgUlggZGlyZWN0aW9uLCBjaGVjayB0aGUgQWRkLUJB
IHJlc3BvbnNlIGZyb20gU1RBIHRvIHNlZSB0aGUgbnVtYmVyDQpvZiBidWZmZXIgaXMgbm9ybWFs
IChub3JtYWxseSBpdCBzaG91bGQgYmUgMzIgb3IgNjQpIFsxXQ0KDQooSSBmaW5kIHRoaXMgYnkg
Z29vZ2xlIHNlYXJjaCkNClsxXSBodHRwczovL21ybmNjaWV3LmNvbS8yMDE0LzExLzAxL2N3YXAt
ODAyLTExLWJsb2NrLWFjay8NCg0KUGluZy1LZQ0KDQo=
