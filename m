Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049485;
	b=o8ZXnTZHEu/uLp5BCJ/wbsbHQucPyVEdx7RtIVe7wDbouRvcQbVt+y6mhv3N6sZQKlo3
	 Xa9FeesQUJpKp5JYPpcDfJKEoDf/KtD2UM4SiQpgZDL5v7Je6XbJx8ewdx3TypVA2e/5z
	 1ZZwwBOG9w+4+ZAvoWPFwwxPets7agYpVA5iKL6KjQRrXmE1MDIsqIkjEcW1zZmcKm7KZ
	 FKiEWME6HWmkBhlY8754DBUsMaPmaLpuE3FwDVImyjLtZ4JYu/R69u/yFmHZI3YDhdg87
	 NJDHgyXTlRB4aLnnXzJCwovA5gjFR6ENtrZGEvCCiyFt/GPJl+x1RLs6K76kEdLU6YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049485;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5bHAPuS5qC0QXYjC19aRRZyyyVQrrAo7XwVIBbMCNW8=;
	b=uaKuOgP1CjI7Wx14armsAtJCdOYqffRQ5gbhl1dfOACDF1g//lgW0qeKIommKcJ7j8NU
	 68HY7FIun5X0KhIYyydkpKU7bADe6zdxAuH+LqxPgXLMfGPwLl1u6Pm6QjCHafSgYpBvH
	 rVFaj/EzXvGqa3faOmRjT8zaxXRm+FxSJm36mOfwA9CTZTIHG6Zj1wcKIIaoP/+7TefKP
	 ylrsyFRqBghC276IGcsMjW/tYm2fUqUqp6GWsKlYvSaeCwBbMS0e0zo1Vmyj4hJfbD7dx
	 2L+xggXgD3Ks51Hsd1eb+Bob2cbKsLxm5slQBQspV7d+3n7lKcwCh14WfvxGZU5wWxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=dI5tH3pI;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40D606A31C;
	Thu, 19 Nov 2026 00:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B40D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=dI5tH3pI
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ0p6qsD1892998, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795049467; bh=5bHAPuS5qC0QXYjC19aRRZyyyVQrrAo7XwVIBbMCNW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=dI5tH3pI1alvyJ+E++CrlB7Asyzle3KT+t93YfK4tVHm6Z4PEqCsGrCNnLukVEJ/u
	 4EvTNNXc3KY2Sz2Wkz9AAIF/5AP/bHvChW4yPs4EX5S3VGU7lhZtAN4tN7cArXkkEM
	 mJQ7X+WsVgRqQ7tA6/j0atNY7toW6f+BP12zPdZmE4K1udCGUOZF+NdumQ7G9Fvtb7
	 H0tPFJIwMFWdR1iZ97fHco64hh6VaYdeZRYA+FsCvS7kU41faH7pZwbgQp/KYNHszB
	 uW3jMRCxJRiYBmI7yrHQVt7JoCPupLy1I4M8c2t2yYdx7jUEujuuzzRR8XtfLyIhmn
	 CRdkPilFwL5tg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ0p6qsD1892998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 08:51:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 08:51:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 08:51:07 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Topic: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Index: AQHddusUlFkb3JLAC0icESyq6ktwKbcy9ygAgAAD3QCAAJC3wP//hh0AgAF9CuA=
Date: Thu, 19 Nov 2026 00:51:06 +0000
Message-ID: <9340ef0716924e229396aa1b595aa458@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
 <20261118083328.1984956-1-mehmet.fide@gmail.com>
 <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
 <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev>
In-Reply-To: <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciAx
OCwgMjAyNiAxMDoxNDoxNyBBTSBHTVQrMDE6MDAsIFBpbmctS2UgU2hpaA0KPiA8cGtzaGloQHJl
YWx0ZWsuY29tPiB3cm90ZToNCj4gPk1laG1ldCBGaWRlIDxtZWhtZXQuZmlkZUBnbWFpbC5jb20+
IHdyb3RlOg0KPiA+PiA+IEkgdGhpbmsgdGhlIHByZXNlbmNlIGNoZWNrIGlzIGJldHRlciBmaXhl
ZCBpbg0KPiA+PiA+IHJ0d19jb3JlX2NoZWNrX3N0YV9hY3RpdmUoKS4gSXRzIGNhbGxiYWNrIG9u
bHkgcmVhZHMgaW50ZXJmYWNlIHN0YXRlLA0KPiA+c28NCj4gPj4gPiBjb3VsZCBpdCB1c2UgYW4g
YXRvbWljIGludGVyZmFjZSBpdGVyYXRvciB3aXRob3V0IGFsbG9jYXRpbmcgZW50cmllcz8NCj4g
Pj4NCj4gPj4gUmlnaHQsIHRoZSBjYWxsYmFjayBkb2VzIG5vdCBzbGVlcCwgc28gcnR3X2l0ZXJh
dGVfdmlmc19hdG9taWMoKSB3b3Jrcw0KPiA+PiB0aGVyZS4gVGhlIGNoZWNrIGlzIG9sZGVyIHRo
YW4gdGhpcyBzZXJpZXM6IHNpbmNlIGNvbW1pdCA5NmZiYjg0ZGU0ZmYNCj4gPj4gKCJ3aWZpOiBy
dHc4ODogaGFuZGxlIHN0YXRpb24gbW9kZSBjb25jdXJyZW50IHNjYW4gd2l0aCBBUCBtb2RlIikg
YQ0KPiA+PiBmYWlsZWQgYWxsb2NhdGlvbiBhbHNvIG1ha2VzIHJ0d19jbGVhcl9vcF9jaGFuKCkg
ZHJvcCB0aGUgb3BlcmF0aW5nDQo+ID4+IGNoYW5uZWwgb2YgYW4gYXNzb2NpYXRlZCBzdGF0aW9u
LCBvbiBCU1NfQ0hBTkdFRF9CU1NJRCBhbmQgaW4NCj4gPj4gcnR3X29wc19zdG9wX2FwKCkuDQo+
ID4+DQo+ID4+IFBpbmctS2UsIEx1a2E6IHdvdWxkIHlvdSB0YWtlIHRoYXQgYXMgYSBzZXBhcmF0
ZSBmaXggZm9yIHJ0dy1uZXh0LCBvciBhcw0KPiA+PiBhIHBhdGNoIGJlZm9yZSB0aGlzIG9uZSBp
biB2MTM/DQo+ID4NCj4gPkkgdGhpbmsgcnR3X2NvcmVfY2hlY2tfc3RhX2FjdGl2ZSgpIGlzIHVz
ZWQgdW5kZXIgd2lwaHkgbG9jaywgd2UgY2FuDQo+ID5taWdyYXRlIHRvIHVzZSBmb3JfZWFjaF9h
Y3RpdmVfaW50ZXJmYWNlKCkgd2l0aCBsb2NrZGVwX2Fzc2VydF93aXBoeSgpDQo+ID5hcyBhIHNl
cGFyYXRlIHBhdGNoLg0KPiA+DQo+IA0KPiBXb3JrcyBmb3IgbWUuDQoNClRoaW5rIG1vcmUgYWJv
dXQgZmFpbGluZyB0byBhbGxvY2F0ZS4gSSBzdXBwb3NlIGtlcm5lbCB3aWxsIHRocm93IG91dA0K
YSBPT00gbWVzc2FnZSwgc28gd2UgY2FuIGp1c3QgaGFuZGxlIHRoZSByZXR1cm4gTlVMTCBwb2lu
dGVyIHRvIHByZXZlbnQNCmNyYXNoLiBUbyBlbnN1cmUgZnVuY3Rpb24gc3RpbGwgd29ya3MgYXMg
bm9ybWFsIHVuZGVyIE9PTSBzaXR1YXRpb24sDQppdCBpcyBub3Qgc28gZWFzeS4gSSBndWVzcyB3
ZSBuZWVkIHRvIGFkZCBtYW55ICJzcGVjaWFsIGNvbmRpdGlvbnMiLA0KYW5kIGRyaXZlciBiZWNv
bWVzIGhhcmQgdG8gcmVhZC4gDQoNClNvLCBteSBvcGluaW9uIGlzIHRvIGRvIG91ciBiZXN0IHRv
IGtlZXAgZnVuY3Rpb24gd29yayB1bmRlciBPT00uDQpObyBuZWVkIHRvIGVuc3VyZSBldmVyeXRo
aW5nIHdvcmsgcGVyZmVjdC4gDQoNCkZvciB0aGlzIGNhc2UsIGl0IGlzIG5vdCB0b28gaGFyZCB0
byBhdm9pZCB0aGUgT09NIGNhc2UsIHNvIEkgYWdyZWUNCnRoZSBjaGFuZ2UuIEJ1dCB3ZSBkb24n
dCBhbHdheXMgbmVlZCB0byBoYW5kbGUgdGhlIGNhc2UgZm91bmQgYnkgTExNLg0KDQpQaW5nLUtl
DQoNCg==
