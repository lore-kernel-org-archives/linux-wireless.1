Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394771;
	b=tBC00kBz/G/z+Onem+CWTtwayWuzzUC3essZicSCinbxB8GrtxCNF+QcXhGAJHmAMN/h
	 FecWgKV+3poKzzmM1GZSadXqcgF6gEN8ypvEbTbMczJ3/y7HbURCF3oXeTXTJEad7DRVg
	 CxLQNXlD4mfIxeDAMir+spxoM9Ev+Q461wf1dEy5mAquO7N+t+1Q/otXlTnUpQGf54Q3r
	 RgJAyHtgGxaBHTI2kU/mAhn3IHuIy+EQq+FOM3X6pqMcwrEmAWmDRRTqNyevNBKO5YWI6
	 LxU5JsZW9WmLqikaMMobNU9T32M8K0Bj5jspxOXazRmMSDsfmo2Uq22WEgBcqkJw9Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394771;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QYRLaUNWD5+prNpzFegUjnbMRw/HLaoWobpWeyPrg6c=;
	b=wepVUGBdTOMQXck/z9RZtGEy8emyXE0JUqBav5kP1nB5KFmgyQFaOWrwRLwWMIAdcjPC
	 5FXVzNgqeBPTSwEIryjKD8uKxjsfg7q7ksnREftilTemb9NZgU0M7rW1aOkVCRz0ghGUv
	 isj8Io5kmG6G68q4mJBKAWioH84JuObJ703GsW8J41y+LPT0Ey6rNF557lMsqL5MuVxpa
	 OYGoMdqpH41YNG8HxIBWLiTQXr5SImtsaaxSemeHqqnVUYa1i8RqVcaGGjA/YfBIJbPb4
	 RMemmgfaGnhMf5sQGMKPBqREb7f9w6I3SjCgHCEvRke9uGr08Ygcxz17/wfiSeSO79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Rfc2DH4U;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB382606A334
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB382606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Rfc2DH4U
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN0juW031172062, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795394756; bh=QYRLaUNWD5+prNpzFegUjnbMRw/HLaoWobpWeyPrg6c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Rfc2DH4UK9PtUNKf4y2AFq53iQSoh/94Shbnod0n/qLajFR+SLVGFgwbrKmD7z8Fk
	 ayODJNlnvisQxPqhy25hb5eau+Mw1eJuLU2jp822Jkm8LRJMTXDnavfyhTrEh35weB
	 Lf+SlaktiS6WEAvB6aE89QF5eDQdptQBAT1MeeVrx1Om3fkrSySIrLW4eHInmWLO3J
	 Xc4Rk2vkRkEeg4u5NctK5eMHoq2a3LMXiyj4CpuE0yCtLMmuYxVGU4Wiu+Miz2cr2I
	 zzkyVZI6lrrjQbPwdcZSjJF0hcQVz2rRc8HMFL0M6Lsn1tNDBJ3uFQsdCjBsLN9Dd/
	 rmzHzG874nbRQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN0juW031172062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 08:45:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:45:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 08:45:57 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rik van Westendorp <rik@ellarik.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: Bug report: Realtek RTL8851BE Wi-Fi does not recover from suspend
Thread-Topic: Bug report: Realtek RTL8851BE Wi-Fi does not recover from
 suspend
Thread-Index: AQHdeYIUhAfJoMAxgkKJ5J5PRVKSPLc5UIvQ///QUQCAAbMogA==
Date: Mon, 23 Nov 2026 00:45:56 +0000
Message-ID: <c873b08ae23a4e56884aa6139d5d8b6d@realtek.com>
References: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
	 <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
 <ff6a236dd11ef2f2cb00202b4a6856424b93974b.camel@ellarik.com>
In-Reply-To: <ff6a236dd11ef2f2cb00202b4a6856424b93974b.camel@ellarik.com>
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

UmlrIHZhbiBXZXN0ZW5kb3JwIDxyaWtAZWxsYXJpay5jb20+IHdyb3RlOg0KPiBIaSBQaW5nLUtl
LA0KPiANCj4gQ29uZmlybWVkOiBkaXNhYmxpbmcgRDNjb2xkIGJlZm9yZSBzdXNwZW5kIGZpeGVz
IHRoZSBpc3N1ZS4NCj4gV2ktRmkgY29tZXMgYmFjayBhZnRlciByZXN1bWUgd2l0aCBkM2NvbGRf
YWxsb3dlZD0wLg0KPiANCj4gT25lIG9ic2VydmF0aW9uOiB0aGUgc3lzZnMgc2V0dGluZyBkaWQg
bm90IHNlZW0gdG8gcGVyc2lzdCBhY3Jvc3MNCj4gc3VzcGVuZCBjeWNsZXMgb24gbXkgbWFjaGlu
ZSAtIGFmdGVyIG9uZSBzdWNjZXNzZnVsIHJlc3VtZSwgdGhlIG5leHQNCj4gc3VzcGVuZCBmYWls
ZWQgYWdhaW4gdW50aWwgSSByZS1hcHBsaWVkIHRoZSBlY2hvLiBJIGhhdmUgbm93IGF1dG9tYXRl
ZA0KPiBpdCB3aXRoIGEgc3lzdGVtZCBzbGVlcCBob29rIHRoYXQgd3JpdGVzIGQzY29sZF9hbGxv
d2VkPTAgaW4gdGhlDQo+ICJwcmUiIHBoYXNlIGJlZm9yZSBldmVyeSBzdXNwZW5kLCBhbmQgdGhh
dCB3b3JrcyByZWxpYWJseS4NCg0KQ2FuIHlvdSBoZWxwIHRvIHVzZSAnZG1pZGVjb2RlJyB0byBm
aW5kIHRoZSBib2FyZCBuYW1lIGFuZCBmaWxsIGFuDQplbnRyeSBsaWtlIFsxXT8gV2l0aCB0aGUg
ZW50cnksIHRoZSBzZXR0aW5nIGNhbiBiZSBwZXJzaXN0ZW50LiANCg0KWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9wa3NoaWgvcnR3L2Jsb2IvcnR3LW5leHQvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVh
bHRlay9ydHc4OS9wY2kuYyNMNDc3NA0KDQoNCg0KDQo=
