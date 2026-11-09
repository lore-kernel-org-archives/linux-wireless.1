Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192011;
	b=ZEsqqPa+fe1CNjAwWDbcyAm5fodQrHghIOQ9mIAnSM4EUwtULrUAbNtQ1/fI5VXQ5/G4
	 xRgDNN7DzFcF1fTridQX+N0VvOyKwFmRLWqRjj5gh9KV1olj+R3vn/aO3Nr5sucnmv10R
	 XwtRVc5j1xquQcD+NoA5+j6cbd0N9TH63l9T083qSJ/6quAtvB+Z3T+G8KU3XjaKUdQvJ
	 xVJl2tOJTCXzq0JCz+ikQKxOqH9mNQBsiLMmb3Mt03ytFByx01eHe9kUnpHce4dVClB4N
	 GyP0ihkaWJqyTYxuxRu99m0LAbOemvkGjQxbw6EYgbssDRRXOZr7HevrhTLWJAOCJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192011;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Hi9RC1SCwpP32bwZWIHIaIOTtbCrh8s2e3ENdUtR2mw=;
	b=zOnJFDFQ5gGDoxkLKVSWblpZjL1UFC/GGbdDevJp6fR1vVOvzPbRsaE2tQLU8rtHngFs
	 VLzGvdpO7vCcuIAdHzsKa5XtLEklWDUk1IH0LnjHTHAmKND3OLlGG//NhIvQTBn7u9dUc
	 kQc3iTEfRjO6a0SV1MaI8RK4GPL15lak4RoTOVNA/p4ox3Ix/JtWJme//LhE0jyk82MPV
	 9/9rI+O3tm/uRFkUAkqJ4du5rAO6I6uFITI9KiQKVo62v9NJRoLecNozd0LaYqfYvpgeV
	 Z2dDs4VwBtq9qqzldVTuyc4K7ozZCbcs0sCgaNh3BCQZAs6sjC2m9gtv9UsGrdQ2nZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=nSZYWAb8;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44641606A33E
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 02:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44641606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=nSZYWAb8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92e6J413949331, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794192006; bh=Hi9RC1SCwpP32bwZWIHIaIOTtbCrh8s2e3ENdUtR2mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=nSZYWAb8JcKPAAlio6e2khed2+5IO9GpxkxrmLvXcKbYbvrmGPMV1oHh2QxtgaW30
	 AQ81IprOEKtdcPdv2f7Ho36Gdop4b7mOW4RBTA+xvL0NzIN5SzfrmWJXEGzTzD+BXJ
	 7ItiuzSQ5sHFjVrUytll+a563kIVqvkVw09SzT7gRn4qvoduTSMBTeeU31le8MMhOS
	 FKV9MSxP0Pbhcd9WXv9KbhJrews36oqcq1qXlcsERzjQA8+1OFdXL8HZOu8TTSJ0E3
	 J2g9CGPjB+vc3dl8WzFTYdYnjEyD5ufpvMAeOD/81dzNSeWRYOJ1yc0er05QqKjgIk
	 DNHt7B2bsmVeg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92e6J413949331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:40:06 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:40:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:40:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:40:05 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "lnwgorou@gmail.com"
	<lnwgorou@gmail.com>, Jes Sorensen <Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next] wifi: rtl8xxxu: Allocate the USB control buffer
 separately
Thread-Topic: [PATCH rtw-next] wifi: rtl8xxxu: Allocate the USB control buffer
 separately
Thread-Index: AQHdb2WH5y0xbQYjckG+BDXzizYHibcjyLkAgAE/aQA=
Date: Mon, 9 Nov 2026 02:40:05 +0000
Message-ID: <0bf816c620d74dd7ac4bebdc2b466c6d@realtek.com>
References: <20261108-b4-rtl8xxxu-usb-buf-v1-1-ed021a85a2b9@gmail.com>
 <72fc9599-3f63-4da9-bc18-aeb09d0f757f@gmail.com>
In-Reply-To: <72fc9599-3f63-4da9-bc18-aeb09d0f757f@gmail.com>
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

DQpCaXR0ZXJibHVlIFNtaXRoIDxydGw4ODIxY2VyZmUyQGdtYWlsLmNvbT4gd3JvdGU6DQo+IE9u
IDA4LzExLzIwMjYgMTE6NDIsIFRhcHBhcml0IFJ1a3RoYXdvcm53b25nIHZpYSBCNCBSZWxheSB3
cm90ZToNCj4gPiBGcm9tOiBUYXBwYXJpdCBSdWt0aGF3b3Jud29uZyA8bG53Z29yb3VAZ21haWwu
Y29tPg0KPiA+DQo+ID4gcHJpdi0+dXNiX2J1ZiByZWNlaXZlcyB0aGUgZGF0YSBvZiBldmVyeSBj
b250cm9sLUlOIHRyYW5zZmVyIHVzZWQgZm9yDQo+ID4gcmVnaXN0ZXIgcmVhZHMsIGJ1dCBpdCBp
cyBlbWJlZGRlZCBpbiBzdHJ1Y3QgcnRsOHh4eHVfcHJpdiBkaXJlY3RseQ0KPiA+IGFmdGVyIHVz
Yl9idWZfbXV0ZXguIE9uIENQVXMgd2l0aCBETUEtaW5jb2hlcmVudCBjYWNoZXMgdGhlIHR3byBz
aGFyZSBhDQo+ID4gY2FjaGUgbGluZSwgd2hpY2ggRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9kbWEt
YXBpLWhvd3RvLnJzdCBzYXlzIGNhbg0KPiA+IGNvcnJ1cHQgZGF0YS4NCj4gPg0KPiA+IFRoaXMg
aGFwcGVucyBpbiBwcmFjdGljZS4gV2hlbiBhbm90aGVyIHRhc2sgY29udGVuZHMgZm9yIHVzYl9i
dWZfbXV0ZXgNCj4gPiB3aGlsZSBhIHJlYWQgaXMgaW4gZmxpZ2h0LCB0aGUgQ1BVIHdyaXRlcyB0
byB0aGF0IGNhY2hlIGxpbmUsIGFuZCB0aGUNCj4gPiBkZXZpY2UncyBkYXRhIGNhbiBiZSBsb3N0
IHdoZW4gdGhlIGJ1ZmZlciBpcyB1bm1hcHBlZC4gdXNiX2NvbnRyb2xfbXNnKCkNCj4gPiBzdGls
bCByZXR1cm5zIHRoZSBmdWxsIGxlbmd0aCwgYnV0IHRoZSByZWFkIHJldHVybnMgc3RhbGUgYnVm
ZmVyDQo+ID4gY29udGVudHMsIHR5cGljYWxseSB0aGUgdmFsdWUgb2YgdGhlIHByZXZpb3VzIHJl
Z2lzdGVyIHdyaXRlLiBUaGUgZHJpdmVyDQo+ID4gdGhlbiB3cml0ZXMgdGhhdCB2YWx1ZSBiYWNr
IGluIGEgcmVhZC1tb2RpZnktd3JpdGUuDQo+ID4NCj4gPiBPbiBhbiBSVEw4MTkyRVUsIGEgc3Rh
bGUgcmVhZCBvZiBSRUdfRlBHQTBfWEFfSFNTSV9QQVJNMiAoMHg4MjQpIGR1cmluZyBhDQo+ID4g
c2NhbiBpcyB3cml0dGVuIGJhY2ssIGFmdGVyIHdoaWNoIHRoZSBjaGlwIHN0b3BzIHJlY2Vpdmlu
ZyBhbmQgZG9lcyBub3QNCj4gPiByZWNvdmVyIG9uIGl0cyBvd24uIFJFR19GUEdBMF9QT1dFUl9T
QVZFICgweDgxOCkgYWxzbyBkcmlmdHMgYXdheSBmcm9tDQo+ID4gaXRzIGluaXQgdmFsdWUgd2l0
aG91dCBvYnZpb3VzIHN5bXB0b21zLg0KPiA+DQo+ID4gQWxpZ25pbmcgdGhlIGZpZWxkIGluc2lk
ZSB0aGUgc3RydWN0IGlzIG5vdCBlbm91Z2g6IHRoZSBzdHJ1Y3QgbGl2ZXMgaW4NCj4gPiB0aGUg
bWFjODAyMTEgcHJpdmF0ZSBhcmVhLCB3aGljaCBpcyBvbmx5IE5FVERFVl9BTElHTiAoMzIgYnl0
ZSkgYWxpZ25lZC4NCj4gPiBkZXZtX2t6YWxsb2MoKSByZXR1cm5zIEFSQ0hfRE1BX01JTkFMSUdO
IGFsaWduZWQgbWVtb3J5LCBzbyBhbGxvY2F0ZSB0aGUNCj4gPiBidWZmZXIgc2VwYXJhdGVseS4N
Cj4gPg0KPiA+IFRlc3RlZCBvbiBhIFJhc3BiZXJyeSBQaSAyIChCQ00yODM2LCBkd2Nfb3RnLCAz
Mi1iaXQsIDYuMTguNTAgd2l0aCB0aGlzDQo+ID4gY2hhbmdlIGJhY2twb3J0ZWQpIHdpdGggYSBU
UC1MaW5rIFRMLVdOODIzTiB2MiAoUlRMODE5MkVVKSwgdHJpZ2dlcmluZyBhDQo+ID4gc2NhbiBl
dmVyeSAxNSBzZWNvbmRzOg0KPiA+DQo+ID4gICB1bnBhdGNoZWQ6ICA1OTkgc2NhbnMsIDkgcmVj
ZWl2ZSBoYW5ncyB3aXRoIDB4ODI0IGNvcnJ1cHRlZCwgcGx1cw0KPiA+ICAgICAgICAgICAgICAg
MiBvdGhlciBjb25uZWN0aW9uIGZhaWx1cmVzIHdpdGggMHg4MjQgaW50YWN0DQo+ID4gICBwYXRj
aGVkOiAgIDEyMDAgc2NhbnMsIG5vIGZhaWx1cmVzLCAweDgxOCBhbmQgMHg4MjQgY29ycmVjdCBh
dA0KPiA+ICAgICAgICAgICAgICAgZXZlcnkgY2hlY2sNCj4gPg0KPiA+IFRvIGxvb2sgYXQgdGhl
IHJlYWRzIGRpcmVjdGx5LCBhIHRlc3QgYnVpbGQgcHV0IGEgc2VudGluZWwgaW4gdGhlIGJ1ZmZl
cg0KPiA+IGJlZm9yZSBlYWNoIHJlYWQgYW5kIHJlLXJlYWQgd2hlbiBpdCBjYW1lIGJhY2sgdW5j
aGFuZ2VkLiAzMDAgc2NhbnMgcGVyDQo+ID4gbGF5b3V0Og0KPiA+DQo+ID4gICBidWZmZXIgbmV4
dCB0byB0aGUgbXV0ZXggKGN1cnJlbnQpOiAgNzIgb2YgMTkzIGNvbnRlbmRlZCByZWFkcyBzdGFs
ZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwIG9mIH4yNjAw
MDAgdW5jb250ZW5kZWQgcmVhZHMNCj4gPiAgIGJ1ZmZlciBpbiBpdHMgb3duIGNhY2hlIGxpbmU6
ICAgICAgICAwIG9mIDIxNCBjb250ZW5kZWQgcmVhZHMgc3RhbGUNCj4gPiAgIGJ1ZmZlciBmcm9t
IGRldm1fa3phbGxvYygpOiAgICAgICAgICAwIG9mIDI3MCBjb250ZW5kZWQgcmVhZHMgc3RhbGUN
Cj4gPg0KPiA+IFRoZSByZS1yZWFkIGFsd2F5cyByZXR1cm5lZCB0aGUgZXhwZWN0ZWQgdmFsdWUs
IHNvIHRoZSBkZXZpY2UgYW5zd2VyZWQNCj4gPiBjb3JyZWN0bHkgYW5kIG9ubHkgdGhlIGhvc3Qt
c2lkZSBidWZmZXIgd2FzIHN0YWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGFwcGFyaXQg
UnVrdGhhd29ybndvbmcgPGxud2dvcm91QGdtYWlsLmNvbT4NCj4gDQo+IEEgc2ltaWxhciBwYXRj
aCB3YXMgYXBwbGllZCBqdXN0IGZpdmUgZGF5cyBhZ28uDQoNCkZvciB0aGUgcmVjb3JkOg0KDQpo
dHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjEwMTAtcnRsOHh4eHUtdXNiLWRtYS12MS0xLWU2
NzBkOWMwOGZkZkBraHUuYWMua3INCg0KDQo=
