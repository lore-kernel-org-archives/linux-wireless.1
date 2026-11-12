Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448463;
	b=OYvxaj8uEgWpjKG3bUDZodvdlkRprnW/4+L+aPXAvBvZ8SNdvUa46wz3L/gQiQ9mji53
	 9F85TQNiJ2XYfFqiAvQLioZGHCpV154CJ9xRBFJRlXsmhP/soBWbA9oc9vx5rJXVXheIQ
	 e/iO/sJBHFm7w0tmFy08FwVNpW+zS0JMBh9jEyW2arGiEynENL+Lj62/Sirxpzq0zHcsB
	 8ZGuCeIqA4sTGxnN4XFbCXEzusfvleYsIZRCD+38J5EQk2vpv+jr/4DDaOzcd2Z8gL99s
	 x+iOuZTqb+JtJGZorXkzYZh/wGFHBDUnU6BBjTP/71ADHzyBSuJC6ccb7GePqWFTzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448463;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=pDOIr/MHUGMOxHHD78tYrzDdA4LJA3h1lraeh7AxfhM=;
	b=tN1aZln6hFTto2uJ3EgT80DKxUlzE+3ZzJ+BLgp+6a7tIOT5ZbKex2Hc2qtLAuB6J68t
	 xwIvvCHQQczOEd0ZNcL4GGAU57D+Ohmxe4XBx7U3SVSP+1Dtn6sgJO8ZE30qtGxROQVbM
	 dj+LzPBg7/aLGEhoScn+8CH+S7Ybj98ogJ3h0qkRiXvY/NOM+lZ7X9RVxbYmb0g70tUXc
	 CJqk4lomxx44fB1g5a7oT1/v8MV93kNBwBN+sITEsTHlDD1pSr+b6sPWKxL/Cw/d0Ly18
	 cQo4LmHqBovUtah2GvhQTqE0JXoTIoMpj19DuD3Q7XfbDCAegQTNMDrkpZ5NpYpQihg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FNy3UiTP;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54E606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 01:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F54E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FNy3UiTP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC1sIl253289883, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794448458; bh=pDOIr/MHUGMOxHHD78tYrzDdA4LJA3h1lraeh7AxfhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FNy3UiTPrSt57mDYIcpCcJWCiE0zQlntcOLPwRARls+YgBahgUhl+MS69a3zYEyET
	 VufUwSToRhG65sWdLLAqQGlQpamxrmF+TsVBIN2Lmv53BeDj8WG5qJMXfnIqkONFK9
	 gnO+rO3HrwhKDYGQJJE5AVZv0uQ+GSPphhgv+ND/N8OkTcUmdTjY+uZ3OvJxd6ngin
	 SdKLpwpwdKQysZykBBybX7mzELILrDNwxGuB3/w7V8z6pOp73fSJbqmxxkdvH2u627
	 er4ukt45QfDil3IYG+y/WpV8lhjNwiSYwcsYBU43SLxpc9n2r2ScZHXAAOOpBbjuEH
	 UvZt+lMJuJvdw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC1sIl253289883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 09:54:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 09:54:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 09:54:18 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Hao Tan <guwolf@guwolf.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: coex: Disable pre-AGC for out-of-band links
Thread-Topic: [PATCH] wifi: rtw89: coex: Disable pre-AGC for out-of-band links
Thread-Index: AQHdcOHiXcQkzqwOvU2lQfVQ+JOe/7cprt6Q
Date: Thu, 12 Nov 2026 01:54:18 +0000
Message-ID: <6bcdf08684564b05b63ee446b42af5de@realtek.com>
References: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
 <340ed206ff6a4680a46806e3bea5dbc5@realtek.com>
 <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
 <E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com>
In-Reply-To: <E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com>
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

SGFvIFRhbiA8Z3V3b2xmQGd1d29sZi5jb20+IHdyb3RlOg0KPiBXaGVuIFdpLUZpIGFuZCBCbHVl
dG9vdGggYXJlIG9uIGRpZmZlcmVudCBSRiBiYW5kcywgbmVpdGhlciB0aGUgVEREIG5vcg0KPiB0
aGUgRkREIGJpbmRpbmcgaGFzIGEgYmFuZC4gX3VwZGF0ZV9jb2V4X2JpbmQoKSByZWNvcmRzIHRo
YXQgYXMNCj4gZG0tPm91dF9vZl9iYW5kLg0KPiANCj4gX3NldF93bF9wcmVhZ2NfY3RybCgpIGRp
c2FibGVzIHByZS1BR0Mgd2hlbiB0aGUgVEREIGJpbmRpbmcgaXMgNSBHSHosIG9yDQo+IHdoZW4g
dGhlIHJvbGUgaXMgc3RpbGwgTk9MSU5LLiBBZnRlciBjb21taXQgYTc2NTAxZTFkMTQ4ICgid2lm
aTogcnR3ODk6DQo+IGNvZXg6IFNlcGFyYXRlIF9udGZ5X3JvbGVfaW5mbyBpbnRvIHR3byBmdW5j
dGlvbiIpLCBhIDUgR0h6LW9ubHkgU1RBIGlzDQo+IG5vIGxvbmdlciBOT0xJTksuIFdpdGggV2kt
Rmkgb24gNSBHSHogYW5kIEJsdWV0b290aCBvbiAyLjQgR0h6LCB0ZGRfYmluZA0KPiBpcyBlbXB0
eSwgc28gcHJlLUFHQyBzdGF5cyBlbmFibGVkLiBPbiBSVEw4ODUxQiB0aGlzIHByb2dyYW1zIHRo
ZQ0KPiBwcmUtQUdDIHRhYmxlLCBhbmQgYSBWSFQ4MCBsaW5rIGRyb3BzIHNob3J0bHkgYWZ0ZXIg
YXNzb2NpYXRpb24uDQo+IA0KPiBBbHNvIGRpc2FibGUgcHJlLUFHQyB3aGVuIGRtLT5vdXRfb2Zf
YmFuZCBpcyBzZXQuIE92ZXJsYXBwaW5nIFRERCBhbmQNCj4gRkREIGJpbmRpbmdzIGFyZSB1bmNo
YW5nZWQuDQo+IA0KPiBUZXN0ZWQgb24gUlRMODg1MUJFIChSRkUgNSwgcnR3ODg1MWJfZnctMS5i
aW4gMC4yOS40MS41KSB3aXRoIDUgR0h6DQo+IFdpLUZpIGFuZCAyLjQgR0h6IEJsdWV0b290aC4N
Cg0KSSdsbCBrZWVwIGFib3ZlIGNvbW1pdCBtZXNzYWdlLCBidXQgcmVtb3ZlIGJlbG93IHZlcnNp
b24gaW5mbyB3aGlsZQ0KY29tbWl0dGluZy4gDQoNCj4gV2l0aCB0aGlzIGNoYW5nZSwgVkhUODAg
c3RheWVkIHVwIGZvciA2MDANCj4gc2Vjb25kcyBvbiB2Ny4zIGFuZCBvbiBydHctbmV4dCAwNGM5
OTg0MTg3MjIuIFdpdGhvdXQgaXQsIHY3LjMgZHJvcHMgdGhlDQo+IGxpbmsgc2hvcnRseSBhZnRl
ciBhc3NvY2lhdGlvbi4NCg0KPiANCj4gRml4ZXM6IGE3NjUwMWUxZDE0OCAoIndpZmk6IHJ0dzg5
OiBjb2V4OiBTZXBhcmF0ZSBfbnRmeV9yb2xlX2luZm8gaW50byB0d28gZnVuY3Rpb24iKQ0KPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC13aXJlbGVzcy8zNDBlZDIwNmZmNmE0NjgwYTQ2ODA2ZTNiZWE1ZGJjNUByZWFsdGVr
LmNvbS8NCj4gU2lnbmVkLW9mZi1ieTogSGFvIFRhbiA8Z3V3b2xmQGd1d29sZi5jb20+DQoNCkkn
bGwgcGljayB0aGlzIHRvIHJ0dyBicmFuY2ggZm9yIC1yYyBjeWNsZS4NCg0KQWNrZWQtYnk6IFBp
bmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPg0KDQoNCg==
