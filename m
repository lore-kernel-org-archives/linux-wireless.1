Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274910;
	b=26KEYJ/SEeje2QmM7poyuGoFCK1Rmxu2CPwbfR2xzWPzEwseWu0IGEzRKC1EFRZXtJBA
	 XPojgsTUTS4YqSQN8fJnJqTsPZ+eT+pg08zy61vMUCKkhAIIym8q3424VA1a2ji7ACBlp
	 9BfN+1g6RCWxE2eyKo2ub58mZfJxuZp6cS1pFS5E8P9j6YwX44MJl78+OXONDJfwoN49v
	 xuxk/crLoGGieIZQdNrsCvYGBlu6daca2aigTERhSad7Od52db1uW7ttzTKl+MQXdYO8h
	 hycIMUUKZCXEE+k7d51nVmV0eO8qdOpP7j+aVXagRvBXL1GA7CZWtFc+CoEpoPxHfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274910;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=JCU8FnNkXA4/OJK6PGGzEHY7gj5iunwBW/tsM9Z6Cv4=;
	b=miQ3i9Kc5PdmV9rMqSztq8Zrr4e1whnQsjdMdStpF5WdITt38O62wKYk5MqjaYbK+cB8
	 KDn/fAmL//9wavVOcj1LXNjdNh8KMMpiDW4GW0TNwQsCxb7TrV6uQIviM+QNCRCd/+5gN
	 qt1vs1c9OCidQxr1WyPzcqumShbOOXnmsVNs/fMH0yvpyWV4tSprMJ2gqfSCqiNp/OE4+
	 nhFMtQeSlTfwCUENu4C82pYhw04HQgPVtG/g9Sz6mOS7j6gzmyv05XR+OV1z/yj60YMBr
	 Nif1shhIAlO1LIHo7rJhuCGBBsqIjLyI6C9PJgdfBbMWOBJdBgOtl+im0SQ7CJhVzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=B9y+TgGs;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FFB606A325
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 01:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FFB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=B9y+TgGs
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AA1fixE7776598, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794274904; bh=JCU8FnNkXA4/OJK6PGGzEHY7gj5iunwBW/tsM9Z6Cv4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=B9y+TgGs6j0EOKsUdvccC1GEvoHjyACtFytrJVZJivBaV1OBb8k9Nl3Cc4pZpNWQ2
	 Jjz2PoLnAJenPaBNx3uqiZbMiAAUvP0GFaAqFruw5ZrfnO8iIQmwpz1k+1DY4H4evr
	 p9BajsGAgFP36oUj/c/MMbsgeHsxVD1e8x53xS2rErZDv+ICpsbuIaUT4lxJsW9JbC
	 phE4dyRixnBahGXvqWo/TMeyj5UYkkfBZD62YX/kggeyXWsLyqjdpH8bmv5Ma+WaUq
	 Gh/J5oEpDY5WfFPgpccZ9hlxG8MfHAvNB/IvuQqFurz5PAeeDrnPktipcH4w3EneI8
	 RIoo4/Zmw4C2Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AA1fixE7776598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 09:41:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 09:41:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 09:41:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 10 Nov 2026 09:41:38 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Tan Hao <guwolf@guwolf.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since
 7.3
Thread-Topic: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since
 7.3
Thread-Index: AQHdcDpt8NFp7qQSw0+Qs+gU1DZt97cmhLmw
Date: Tue, 10 Nov 2026 01:41:38 +0000
Message-ID: <340ed206ff6a4680a46806e3bea5dbc5@realtek.com>
References: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
In-Reply-To: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
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

VGFuIEhhbyA8Z3V3b2xmQGd1d29sZi5jb20+IHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIFJUTDg4
NTFCRSwgNSBHSHogODAgTUh6L0hFIGFzc29jaWF0aW9uIHN1Y2NlZWRzLCB0aGVuIHRoZSBTVEEN
Cj4gbG9zZXMgYmVhY29ucyB3aXRoaW4gYWJvdXQgb25lIHNlY29uZC4gQWZ0ZXIgdGhhdCwgZXZl
cnkgNSBHSHoNCj4gYXV0aGVudGljYXRpb24gdGltZXMgb3V0IHVudGlsIHJ0dzg5Xzg4NTFiZSBp
cyB1bmxvYWRlZC4gMi40IEdIeg0KPiBhbmQgNSBHSHogSFQyMC9IVDQwIHN0YXkgdXAuIFRoaXMg
c3RhcnRlZCBpbiA3LjMuMDsgNy4yLjExIGlzIGZpbmUNCj4gd2l0aCB0aGUgc2FtZSBmaXJtd2Fy
ZSBmaWxlLg0KDQpUaGUgY2hhbmdlcyBiZXR3ZWVuIDcuMy4wIGFuZCA3LjIuMTEgcmVsYXRlZCB0
byBSVEw4ODUxQkUgYXJlIG1vc3RseQ0KQlQtY29leGlzdGVuY2UgcGF0Y2hlcyAoaWYgSSByZWFk
IGNvcnJlY3RseSksIHNvIHlvdSBjYW4gcXVpY2tseQ0KY2hlY2sgaWYgaXQgd29ya3Mgd2VsbCB3
aXRoIEJUIGRpc2FibGVkLg0KDQo+IA0KPiBJIGFtIHN0aWxsIGJpc2VjdGluZy4gVGhpcyBpcyBh
IHJlcG9ydCBvbmx5LCBubyBwYXRjaCB5ZXQuDQoNClRoYW5rcy4gUGxlYXNlIGJpc2VjdCB0aGUg
Y2F1c2UuIA0KDQo+IFJlcHJvZHVjZXINCj4gDQo+ICAgMS4gQm9vdCA3LjMueCB3aXRoIHRoZSBz
dG9jayBydHc4OSBkcml2ZXIgKGRvIG5vdCBtYXNrIEhFL1ZIVCkuDQo+ICAgMi4gQ29ubmVjdCB0
byBlaXRoZXIgNSBHSHogQlNTSUQgYWJvdmUgKFNBRSBvciBQU0ssIHNhbWUgcmVzdWx0KS4NCj4g
ICAzLiBBc3NvY2lhdGlvbiBjb21wbGV0ZXM7IGJlYWNvbnMgYXJlIGxvc3QgfjFzIGxhdGVyLg0K
PiAgIDQuIFJlLWF1dGggdG8gYW55IDUgR0h6IEFQIHRpbWVzIG91dC4gMi40IEdIeiBzdGlsbCB3
b3Jrcy4NCg0KRm9yIHRoaXMgcG9pbnQsIEJUIG1pZ2h0IGJlIG5vdCByZWxhdGVkIGJlY2F1c2Ug
aXQgd29ya3Mgb24gMi40R0h6IGJhbmQsIGJ1dA0KaWYgaXQgaXMgbm90IHRvbyBoYXJkLCBwbGVh
c2UgdHJ5IHRvIGRpc2FibGUgQlQuDQoNCj4gICA1LiBSZWNvdmVyeTogbW9kcHJvYmUgLXIgcnR3
ODlfODg1MWJlIHJ0dzg5Xzg4NTFiIHJ0dzg5X3BjaSBydHc4OV9jb3JlDQo+ICAgICAgJiYgbW9k
cHJvYmUgcnR3ODlfODg1MWJlDQo+ICAgICAgVGhlIG5leHQgNSBHSHogYXR0ZW1wdCBjYW4gYXNz
b2NpYXRlIG9uY2UsIHRoZW4gdGhlIHNhbWUgbG9zcw0KPiAgICAgIHJlcGVhdHMuDQoNClRoaXMg
aXMgYSBsaXR0bGUgd2VpcmQgdG8gbWUuIFJUTDg4NTFCRSBiZWNvbWVzIGlkbGUgKHBvd2VyIG9m
ZikgYWZ0ZXINCmRpc2Nvbm5lY3Rpb24uIEl0IGlzIHZlcnkgbGlrZSByZWxvYWQgbW9kdWxlcy4g
Tm90IHN1cmUgd2hhdCB0aGV5IGFyZQ0KZGlmZmVyZW50Pw0KDQo+IA0KPiAgIFVJTlRfTUFYIChX
UEEyLVBTSykgaXMgdGhlIHNhbWUgcGF0dGVybjsgb25lIHJ1biBhc3NvY2lhdGVkLCB0aGVuOg0K
DQpXaGF0IGRvZXMgVUlOVF9NQVggbWVhbj8NCg0KPiBXaGF0IGRvZXMgd29yayBvbiB0aGUgc2Ft
ZSA3LjMuMyBrZXJuZWwNCj4gDQo+ICAgRm9yY2luZyBIVC1vbmx5ICh3cGFfc3VwcGxpY2FudCBk
aXNhYmxlX2hlPTEgZGlzYWJsZV92aHQ9MSksIHNvIHRoZQ0KPiAgIEFQIGZhbGxzIGJhY2sgdG8g
SFQyMC9IVDQwIG9uIDU3NDUgTUh6Og0KDQpEb2VzIGl0IHdvcmsgaWYgbm90IGRpc2FibGVfdmh0
PyAoVG8gY2xhcmlmeSBpZiBSVEw4ODUxQkUgbWlzYmVoYXZpb3INCm9uIGJhbmR3aWR0aCA4ME1I
ei4pDQoNCg0KDQo=
