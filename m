Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066117;
	b=0x4zqo/Zyry3SPtO3bq0NHTjMvnyQwo5FRnktQRVfwhhPWi2VoTdSc0f/p/srUFKOQLi
	 fEXvDyRsKp0o/AnURZ0K3dJsNn0/u2zi+O82hAF/dFL7+yrxAK95cegCYN9IEBIt6ReGZ
	 bF0m7JBhkBhD8ZPzyz9Pe0A+yi1UdY3MXa4mVGK8KoZd+b3tsl4UcnalQTr+Ro3Hs3Bwp
	 bEOoLr/zj2JERhmtPSe91HqbMD++USN9xKVw0o14rdS2zooYGNJaWoVtFIa3mFShV5MyM
	 zVtxzOJbBQArhq1G09zFHEoN3r/q0d2iJSgiYvTMlTig3FQDz6MKQ0C34fq3EXhhSEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066117;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5NdA5plpjeGZJ4MZvQ0AvaZ11dLbUCDpOgqJBqsguU8=;
	b=1fsD0/9YEPv5QZ5GajhSleVrOwU7falEIrbF0L0pJWNWCcyesGI0Z1RJqSp2zhsXTPe7
	 1DWdYcLcQaR6jPxXPRyEV9/U4gStDOyP7/GH/h56J2UECh/ZYliu80C5RRdn14Iuy2saO
	 mnYpm07w7t64QcjcjXNK00JjI9hQqZOu4kuG8X+e+mKxwzujLAq3arr5T8+q9dSGxlo4r
	 tE8GzOnWlmrriIC1k0SCIqHJ0OLz0CNLSMle9YOzZ/Dkacml2wbctInKRm33fhGGGe+u/
	 +Z1+qO4g1dpW0BDf0jM6KrzkfOpLVsVWY3zgjtSOhjvCrjhxV/p9+dot8wHgIZEzLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pYJ537UY;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10917606A320;
	Thu, 19 Nov 2026 05:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10917606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=pYJ537UY
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5SMTw82039852, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795066103; bh=5NdA5plpjeGZJ4MZvQ0AvaZ11dLbUCDpOgqJBqsguU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=pYJ537UYw24gNSV4dReh+bk2gzWwqyv+vmZ/oD+cmqhI7wa1C2zJB72pomoPqoWmQ
	 lvjLPVgWpoYBAyUuouEBD3WMic6Igzh13Whxvdx8izqKxRpQCv1iqoT/VTnZiIGEPB
	 ug3WHBij3NHUoHsa69jyM4wx6YN5vcnUO+SEDQyvcvrTUr8a1JJpuM4LlXKOUBi0AC
	 0E66sQ8gfymIx3So/Y6LgTGhFrRK4CKGoURCBYIxCJHlk426XtFsg7vx2em8kIueHd
	 3XKDR4JEGHvuzvogIThLYW+CJKSDGZTqkMQE0Ejk7tZGIiHARb9+XbcZvTg3TpkCyL
	 9Mo8BGHfT86XA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5SMTw82039852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:28:22 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:28:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:28:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:28:22 +0800
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
Thread-Index: AQHddusUlFkb3JLAC0icESyq6ktwKbcy9ygAgAAD3QCAAJC3wP//hh0AgAF9CuD//73xAIAAkWxw
Date: Thu, 19 Nov 2026 05:28:22 +0000
Message-ID: <799edf0befac4164b0a45c59ab0b8c66@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
 <20261118083328.1984956-1-mehmet.fide@gmail.com>
 <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
 <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev>
 <9340ef0716924e229396aa1b595aa458@realtek.com>
 <7485BFDD-E895-4A73-AB29-8F3CB4712115@linux.dev>
In-Reply-To: <7485BFDD-E895-4A73-AB29-8F3CB4712115@linux.dev>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVrYSBHZWphayA8bHVr
YS5nZWpha0BsaW51eC5kZXY+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxOSwgMjAyNiAx
Mjo0MyBQTQ0KPiBUbzogUGluZy1LZSBTaGloIDxwa3NoaWhAcmVhbHRlay5jb20+OyBNZWhtZXQg
RmlkZSA8bWVobWV0LmZpZGVAZ21haWwuY29tPg0KPiBDYzogQml0dGVyYmx1ZSBTbWl0aCA8cnRs
ODgyMWNlcmZlMkBnbWFpbC5jb20+OyBsaW51eC13aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG1laG1ldC5maWRlQHNjcmVlbmluZ2VhZ2xl
LmNvbQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHJ0dy1uZXh0IHYxMiAyLzNdIHdpZmk6IHJ0dzg4
OiBzdXBwb3J0IGNoYW5uZWwgc3dpdGNoIGluIEFQIG1vZGUNCj4gDQo+IA0KPiBFeHRlcm5hbCBt
YWlsIDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9u
LiBEbyBub3QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiANCj4gT24gTm92ZW1iZXIgMTksIDIwMjYgMTo1MTowNiBBTSBHTVQrMDE6MDAs
IFBpbmctS2UgU2hpaA0KPiA8cGtzaGloQHJlYWx0ZWsuY29tPiB3cm90ZToNCj4gPkx1a2EgR2Vq
YWsgPGx1a2EuZ2VqYWtAbGludXguZGV2PiB3cm90ZToNCj4gPj4gT24gTm92ZW1iZXIgMTgsIDIw
MjYgMTA6MTQ6MTcgQU0gR01UKzAxOjAwLCBQaW5nLUtlIFNoaWgNCj4gPj4gPHBrc2hpaEByZWFs
dGVrLmNvbT4gd3JvdGU6DQo+ID4+ID5NZWhtZXQgRmlkZSA8bWVobWV0LmZpZGVAZ21haWwuY29t
PiB3cm90ZToNCj4gPj4gPj4gPiBJIHRoaW5rIHRoZSBwcmVzZW5jZSBjaGVjayBpcyBiZXR0ZXIg
Zml4ZWQgaW4NCj4gPj4gPj4gPiBydHdfY29yZV9jaGVja19zdGFfYWN0aXZlKCkuIEl0cyBjYWxs
YmFjayBvbmx5IHJlYWRzIGludGVyZmFjZQ0KPiA+c3RhdGUsDQo+ID4+ID5zbw0KPiA+PiA+PiA+
IGNvdWxkIGl0IHVzZSBhbiBhdG9taWMgaW50ZXJmYWNlIGl0ZXJhdG9yIHdpdGhvdXQgYWxsb2Nh
dGluZw0KPiA+ZW50cmllcz8NCj4gPj4gPj4NCj4gPj4gPj4gUmlnaHQsIHRoZSBjYWxsYmFjayBk
b2VzIG5vdCBzbGVlcCwgc28gcnR3X2l0ZXJhdGVfdmlmc19hdG9taWMoKQ0KPiA+d29ya3MNCj4g
Pj4gPj4gdGhlcmUuIFRoZSBjaGVjayBpcyBvbGRlciB0aGFuIHRoaXMgc2VyaWVzOiBzaW5jZSBj
b21taXQgOTZmYmI4NGRlNGZmDQo+ID4+ID4+ICgid2lmaTogcnR3ODg6IGhhbmRsZSBzdGF0aW9u
IG1vZGUgY29uY3VycmVudCBzY2FuIHdpdGggQVAgbW9kZSIpIGENCj4gPj4gPj4gZmFpbGVkIGFs
bG9jYXRpb24gYWxzbyBtYWtlcyBydHdfY2xlYXJfb3BfY2hhbigpIGRyb3AgdGhlIG9wZXJhdGlu
Zw0KPiA+PiA+PiBjaGFubmVsIG9mIGFuIGFzc29jaWF0ZWQgc3RhdGlvbiwgb24gQlNTX0NIQU5H
RURfQlNTSUQgYW5kIGluDQo+ID4+ID4+IHJ0d19vcHNfc3RvcF9hcCgpLg0KPiA+PiA+Pg0KPiA+
PiA+PiBQaW5nLUtlLCBMdWthOiB3b3VsZCB5b3UgdGFrZSB0aGF0IGFzIGEgc2VwYXJhdGUgZml4
IGZvciBydHctbmV4dCwgb3INCj4gPmFzDQo+ID4+ID4+IGEgcGF0Y2ggYmVmb3JlIHRoaXMgb25l
IGluIHYxMz8NCj4gPj4gPg0KPiA+PiA+SSB0aGluayBydHdfY29yZV9jaGVja19zdGFfYWN0aXZl
KCkgaXMgdXNlZCB1bmRlciB3aXBoeSBsb2NrLCB3ZSBjYW4NCj4gPj4gPm1pZ3JhdGUgdG8gdXNl
IGZvcl9lYWNoX2FjdGl2ZV9pbnRlcmZhY2UoKSB3aXRoIGxvY2tkZXBfYXNzZXJ0X3dpcGh5KCkN
Cj4gPj4gPmFzIGEgc2VwYXJhdGUgcGF0Y2guDQo+ID4+ID4NCj4gPj4NCj4gPj4gV29ya3MgZm9y
IG1lLg0KPiA+DQo+ID5UaGluayBtb3JlIGFib3V0IGZhaWxpbmcgdG8gYWxsb2NhdGUuIEkgc3Vw
cG9zZSBrZXJuZWwgd2lsbCB0aHJvdyBvdXQNCj4gPmEgT09NIG1lc3NhZ2UsIHNvIHdlIGNhbiBq
dXN0IGhhbmRsZSB0aGUgcmV0dXJuIE5VTEwgcG9pbnRlciB0byBwcmV2ZW50DQo+ID5jcmFzaC4g
VG8gZW5zdXJlIGZ1bmN0aW9uIHN0aWxsIHdvcmtzIGFzIG5vcm1hbCB1bmRlciBPT00gc2l0dWF0
aW9uLA0KPiA+aXQgaXMgbm90IHNvIGVhc3kuIEkgZ3Vlc3Mgd2UgbmVlZCB0byBhZGQgbWFueSAi
c3BlY2lhbCBjb25kaXRpb25zIiwNCj4gPmFuZCBkcml2ZXIgYmVjb21lcyBoYXJkIHRvIHJlYWQu
DQo+ID4NCj4gPlNvLCBteSBvcGluaW9uIGlzIHRvIGRvIG91ciBiZXN0IHRvIGtlZXAgZnVuY3Rp
b24gd29yayB1bmRlciBPT00uDQo+ID5ObyBuZWVkIHRvIGVuc3VyZSBldmVyeXRoaW5nIHdvcmsg
cGVyZmVjdC4NCj4gDQo+IEkgYWdyZWUuIEkgdGhpbmsgdGhlIGJlbmVmaXQgb2YgaGFuZGxpbmcg
YW4gYWxsb2NhdGlvbiBmYWlsdXJlIG5lZWRzIHRvDQo+IGp1c3RpZnkgdGhlIGV4dHJhIGNvbXBs
ZXhpdHkuIEknbGwga2VlcCB0aGF0IGluIG1pbmQgaW4gZnV0dXJlIHJldmlld3MuDQo+IA0KPiA+
Rm9yIHRoaXMgY2FzZSwgaXQgaXMgbm90IHRvbyBoYXJkIHRvIGF2b2lkIHRoZSBPT00gY2FzZSwg
c28gSSBhZ3JlZQ0KPiA+dGhlIGNoYW5nZS4gQnV0IHdlIGRvbid0IGFsd2F5cyBuZWVkIHRvIGhh
bmRsZSB0aGUgY2FzZSBmb3VuZCBieSBMTE0uDQo+ID4NCj4gDQo+IERvIHlvdSBtaW5kIGV4cGxh
aW5pbmcgd2hpY2ggTExNIGFyZSB5b3UgcmVmZXJyaW5nIHRvPyBQZXJoYXBzIHNhc2hpa28/DQoN
CkknbSBub3Qgc3VyZSBpZiB5b3UgZmluZCB0aGlzIGFsbG9jYXRpb24gZmFpbHVyZSBjYXNlIGJ5
IExMTSBvciBub3QsIGJ1dA0KSSdtIHN1cmUgTExNIGNhbiByZXBvcnQgdGhpcyBraW5kIG9mICJw
cm9ibGVtcyIuIEp1c3Qgd2FudCB0byByZWNvcmQNCnRoYXQgd2UgZG9uJ3QgbmVlZCB0byBwcm9j
ZXNzIHRoZW0gcGVyZmVjdGx5LiANCg0KQnkgdGhlIHdheSwgZXZlcnlvbmUgdXNlcyBMTE0gcmVn
dWxhcmx5LCBzbyBJIGRvbid0IG1pbmQgcGVvcGxlIHVzZSB0aGVtLg0KSG93ZXZlciwgSSBuZWVk
IHRvIGxlYXJuIGhvdyB0byBjby13b3JrIHdpdGggTExNIGFuZCBwYXRjaGVzIGdlbmVyYXRlZA0K
YnkgTExNLg0KDQoNCg==
