Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762062;
	b=26Y64uEyvaMaqk7PkDrcrUFoYfP+PJFbBvY/wyqc6NSGCyJa2DU+xG0oBxJNzTZQ7pSk
	 BTqD7bGcu96EeDKZgYGfyEeQz2ho/8DEecG+AC5saa2FZWoootwXP4ye3mydqHca+7Gva
	 Zn9LBK1boFPOsAL4c/dMQwucvj65f60lGxGDH/pRCzTAo+5gWQYfXcQsbEWhqLVG4pPLy
	 iO2XtjDZ/h/UuJnQFyJW6bPDM0lkk8kLbm/3ble4hrk+QeZuOTCbUF+dvdAGtTBbjIAWt
	 Slnkbyspo7yD+SX+ljr/FS/7xwtRslBPRLjgOu5JIeFClmc9Ao21+NgjnnhGuey0zhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762062;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=nyDfeFUAr4fi4JpYS9acNjjf1ItoIMxYjfml7ATp+8k=;
	b=P02Ujjy2Jl8FsB4f9FMi2gzv0gpTjlqCIpf12foJuCY40vnMUbwWwzoA/RXtU5BANj6O
	 kOu/rqHJr0bjSQdLTXSqRjQ/MzsiYndYdoEzuZx5T88Bo96TLmzI8FICtLB9OOnNUULYo
	 BOwgUwOIJ2Ici2u58VQ70Nj1vf9r5oG/GGFe7oMsYg+VsJ2Iq/Awe4yc50ef0lHChthqa
	 tXJi2BDJZskX2NWASCdFdGy4p1qFlf655izfDfPCrxLx06HPEwCrKJzFpM3UxsuSM2vwR
	 LLXuTZeKcx9vLxS5t1LPPFlV4IQK7XY1XmFoVCU8j/zuSmZztTDnGTuibtugqGsCp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=BZHp2J5J;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B48606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=BZHp2J5J
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR6lYF21741326, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795762054; bh=nyDfeFUAr4fi4JpYS9acNjjf1ItoIMxYjfml7ATp+8k=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=BZHp2J5J5utiC1rdmuQE/a8hOfI1YcMk1bOXqvrTTrnE2m+o3FnvjrUjRCnYHwYWT
	 nmJltbEcB8pVaw6j/9BAuYRg+kgJVQWX8LK6BQNHtLVXZVN1KR3gzX+0Wp9R98rnfx
	 x+eLgKW2BPNU9eJ/eVCBnRLgjydD2Vdc8ayZBNy9PcPP+h504n09c2ERKjjcs0XQul
	 MEQSJGccBQCQ92y8AfbhSLn/y7Np/92rU2mugnLjnpw7EhhsZeP8xU1SGJaMU9duqM
	 rWVv+K7o4JFmml6y822y1c1YVBg77rZbSSqSxicIPtY/CmzXmR3Zn5qtTVcSFwbpNa
	 KYiCQv2O3VwCg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR6lYF21741326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 14:47:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:47:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 14:47:35 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Falconet3 <Falconet3@proton.me>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] wifi: rtw89: fix u32 overflow in board element
 seek
Thread-Topic: [PATCH v4 2/2] wifi: rtw89: fix u32 overflow in board element
 seek
Thread-Index: AQHde3fBRET87gpdB0i8dyQWHvU9HbdBf0jQ
Date: Fri, 27 Nov 2026 06:47:35 +0000
Message-ID: <216b618489b640569748f19c964bb199@realtek.com>
References: <J7Alt6-qlyx7wBUQIFOv5e60k27PLQmMSnJqjcLlsLLZ2US-MP6vo7ny0nCq9WYWBJneWekcQHftkNy86oLzZOCIUJj5RPctR5-py5cvI4U=@proton.me>
In-Reply-To: <J7Alt6-qlyx7wBUQIFOv5e60k27PLQmMSnJqjcLlsLLZ2US-MP6vo7ny0nCq9WYWBJneWekcQHftkNy86oLzZOCIUJj5RPctR5-py5cvI4U=@proton.me>
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

RmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPiB3cm90ZToNCj4gcnR3ODlfYm9hcmRfZWxt
X3NlZWsoKSB2YWxpZGF0ZXMgdGhlIHNlbGVjdGVkIGVudHJ5IGFnYWluc3QgdGhlIGJvYXJkDQo+
IGVsZW1lbnQgZmlsZSB3aXRoDQo+IA0KPiAgICAgICAgIGlmICh1bmxpa2VseShib2FyZF9lbG0t
PnNpemUgPCBvZnN0ICsgc2l6ZSkpDQo+IA0KPiB3aGVyZSBvZnN0IGFuZCBzaXplIGFyZSB1MzIg
dmFsdWVzIHJlYWQgZnJvbSB0aGUgZmlsZS4gVGhlIGFkZGl0aW9uDQo+IHdyYXBzIGluIHUzMiwg
c28gYSBjcmFmdGVkIGZpbGUgd2l0aCwgZm9yIGV4YW1wbGUsDQo+IG9mc3QgPSAweGZmZmZmZjAw
IGFuZCBzaXplID0gMHgyMDAgcGFzc2VzIHRoZSBjaGVjayBhbmQNCj4gcHNldWRvX2Z3LT5kYXRh
IGlzIHNldCB0byBib2FyZF9lbG0tPmRhdGEgKyAweGZmZmZmZjAwIHdpdGgNCj4gcHNldWRvX2Z3
LT5zaXplID0gMHgyMDAuIFRoZSBlbGVtZW50IHdhbGsgdGhlbiBkZXJlZmVyZW5jZXMgdGhhdA0K
PiBwb2ludGVyIGFuZCByZWFkcyBvdXQgb2YgYm91bmRzLg0KPiANCj4gVXNlIHJlbWFpbmRlciBh
cml0aG1ldGljIGFnYWluc3QgYm9hcmRfZWxtLT5zaXplLCB3aGljaCBjYW5ub3Qgd3JhcCBvbg0K
PiBhbnkgYXJjaGl0ZWN0dXJlLiBUaGUgaGVscGVyIGlzIG5ldyBpbiB2Ny40LXJjMSwgc28gb25s
eSB0aGUgY3VycmVudA0KPiBjeWNsZSBpcyBhZmZlY3RlZC4NCg0KVGhlIHNhbWUgY29tbWVudCBh
cyBwYXRjaCAxLzIuDQoNCj4gDQo+IEZpeGVzOiBhZjU5MDVlMjJhNDMgKCJ3aWZpOiBydHc4OTog
c3VwcG9ydCB2YXJpYW50cyBvZiBGVyBlbGVtZW50cyIpDQo+IEFzc2lzdGVkLWJ5OiBMTE0gTWlz
dHJhbCBWaWJlDQo+IFNpZ25lZC1vZmYtYnk6IEZhbGNvbmV0MyA8RmFsY29uZXQzQHByb3Rvbi5t
ZT4NCj4gLS0tDQo+IHY0OiByZXNlbmQgYXMgYSBuZXcgdGhyZWFkIGF0IHRoZSBtYWludGFpbmVy
J3MgcmVxdWVzdDsgbm8gY29kZSBjaGFuZ2UNCj4gICAgIHNpbmNlIHYzLg0KPiB2MzogcmVzZW5k
IG9mIHRoZSBzZXJpZXMgd2l0aCB0aGUgY29ycmVjdCBzdWJqZWN0cyBhbmQgdmVyc2lvbiBsYWJl
bDsgbm8NCj4gICAgIGNvZGUgY2hhbmdlIHNpbmNlIHYyLg0KPiB2MjogbmV3LiBGb3VuZCB3aGls
ZSBmaXhpbmcgdGhlIGVsZW1lbnQgd2FsayBib3VuZHMgY2hlY2s7IHNwbGl0IG91dCBhcw0KPiAg
ICAgYW4gaW5kZXBlbmRlbnQgY2FsbGVyLiBDb21waWxlLSBhbmQgc3BhcnNlLXRlc3RlZCBvbiB4
ODZfNjQ7IG5vDQo+ICAgICByZXByb2R1Y2VyIGF2YWlsYWJsZS4NCj4gDQo+ICBkcml2ZXJzL25l
dC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2Z3LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvZncuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L3JlYWx0ZWsvcnR3ODkvZncuYw0KPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVr
L3J0dzg5L2Z3LmMNCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9m
dy5jDQo+IEBAIC0xNzM5LDcgKzE3MzksOCBAQA0KPiAgICAgICAgIG9mc3QgPSBsZTMyX3RvX2Nw
dShlbnQtPm9mc3QpOw0KPiAgICAgICAgIHNpemUgPSBsZTMyX3RvX2NwdShlbnQtPnNpemUpOw0K
PiANCj4gLSAgICAgICBpZiAodW5saWtlbHkoYm9hcmRfZWxtLT5zaXplIDwgb2ZzdCArIHNpemUp
KQ0KPiArICAgICAgIGlmICh1bmxpa2VseShvZnN0ID4gYm9hcmRfZWxtLT5zaXplIHx8DQo+ICsg
ICAgICAgICAgICAgICAgICAgIHNpemUgPiBib2FyZF9lbG0tPnNpemUgLSBvZnN0KSkNCg0KVGhl
IHNhbWUgY29tbWVudCBhcyBwYXRjaCAxLzIuDQoNCj4gICAgICAgICAgICAgICAgIHJldHVybiAt
RUZBVUxUOw0KPiANCj4gICAgICAgICBtZW1zZXQocHNldWRvX2Z3LCAwLCBzaXplb2YoKnBzZXVk
b19mdykpOw0KDQpwdy1ib3Q6IGNyDQoNCg==
