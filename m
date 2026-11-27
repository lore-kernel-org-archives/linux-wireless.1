Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763500;
	b=A68nEl8Dw6nn12vz1CTLW4mt45/ftnO7ihiRinLNGpwDql0a/neHAMcsDQMaX9YugThS
	 VjyHGmAMyyKyPvcEFVoFZe3tAEP9UyNKqfaEL4XInvSfwcqi9UEErHBrCETNtLhlSgVNS
	 H2/rEekeq6YZ81ilIba8mCrF5RMQ2Nxxi6w5KcIYQJi7Vr+N65gAaxE18B2TxCMuYda/3
	 MTWhn5ORL5oUyjrWpzRcw986YP7lyL+DfflxCtjnGqxW/PIH/Bhxz7/cDfhj26Jrg2xMW
	 AVUrEqSUYfLVV/Ma3mkQc/RogMtjodokTjvJx0/0QghTUnSw9LQEFYE7XfMos1VjZRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763500;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Va5FgObBSo28d6Jf/jN7EWIhO+eUVFZbVP9yj6KGRfc=;
	b=s79CWWgLodaxBOI/fO+keCwJglxm2OvW8/Un+TstrXRjHYsjl+FaBb7SF3MfHD1nI3y3
	 q5w0PVT8oAzGX+PKLOCaPJriuFioJpyykX25+FuHoHdjGy/Qm26xK45yn7i34dNOK4syU
	 po2teUxPpHhH8QT3SzmNxfanKqqGYTUiBIleLXE8c/UHI7EGPV+XCBrMBJbxBRX4xL9NR
	 TBIQqRzA6k1LdMjrsb31+vR9IqEWfUwH4B9u9YyVzT2PVz1cLOC92RGajZxOee503nMGX
	 HgaJkevnei5dunXwU5fZKyHv8ugpPelYGiLTAbcGWLF1S1ak7u1MXIH+gG4vjiN9EHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vTt1d81Y;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2B606A31C;
	Fri, 27 Nov 2026 07:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vTt1d81Y
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR7BSjB4749831, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795763488; bh=Va5FgObBSo28d6Jf/jN7EWIhO+eUVFZbVP9yj6KGRfc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vTt1d81YKcOo0GRwOB454gkesZrNgt02r2dNQb6Tv3DFe0rHmuHq1/TiUa4BnxPS9
	 4LDs9CUqS0NThRvpK4uNsthQx4S9+TSNowqhINtQbPu4c14PX2tpRctFjTs0qsJmaB
	 1eCF35Qc1bH40BwtlZlN45RSjTaoJJ/YobaXZvrdZRHo0E6vniWTpoOg284PhL7OBh
	 NrwKlQ9ylPLABF+uItUGVEnJhU2BQ551OxsIOXcgE3MAaaN8h0AcWF/s1SJ+VSwGCD
	 08P6n9N8AGnvq1wdYoeC1FKj5lBfW5A/cb7YNTMSz0ydS7FNvy1UrPC29l/m/unmDW
	 xaHDBX2WbxwJA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR7BSjB4749831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 15:11:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 15:11:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 15:11:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: =?utf-8?B?6qeBU3dhcG5pbCBTaGluZGXqp4I=?= <shindeswapnil028@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts on
 shutdown
Thread-Topic: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts
 on shutdown
Thread-Index: AQHdfgkcjP7Pr8ogOkmROGqrlIhcubdBRICA//+zUgCAAIiKgA==
Date: Fri, 27 Nov 2026 07:11:27 +0000
Message-ID: <7b6eb43826cb440f9f9386310cb037bb@realtek.com>
References: <20261127004822.8536-1-shindeswapnil028@gmail.com>
 <24cb6dca77d3456fb5893ce37b0bd1c7@realtek.com>
 <CAJEWX79Jini8C44xiP_O41--eWEhcpZnMiK84Wp8dqmtO-D5Qw@mail.gmail.com>
In-Reply-To: <CAJEWX79Jini8C44xiP_O41--eWEhcpZnMiK84Wp8dqmtO-D5Qw@mail.gmail.com>
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

6qeBU3dhcG5pbCBTaGluZGXqp4IgPHNoaW5kZXN3YXBuaWwwMjhAZ21haWwuY29tPiB3cm90ZToN
Cj4gSGkgUGluZy1LZSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyBhbmQgc3VnZ2Vz
dGlvbi4NCj4gDQo+IEkgdGVzdGVkIGNhbGxpbmcgcnR3X2VudGVyX2lwcyhydHdkZXYpIHVuZGVy
IHJ0d2Rldi0+bXV0ZXggaW4NCj4gcnR3X3BjaV9zaHV0ZG93bigpICh3aXRoIEVYUE9SVF9TWU1C
T0wocnR3X2VudGVyX2lwcykgYWRkZWQgaW4gcHMuYywNCj4gcnVubmluZyBhbG9uZ3NpZGUgdGhl
IGNvbXBhbmlvbiBidHVzYiBzaHV0ZG93bi9hdXRvc3VzcGVuZCBmaXgpIG9uIG15DQo+IFJUTDg3
MjNERSBsYXB0b3A6DQo+IA0KPiAtIENvbGQgYm9vdDogV2ktRmkgYW5kIEJsdWV0b290aCBib3Ro
IHdvcmsuDQo+IC0gV2FybSByZWJvb3QgIzEgKFdpLUZpIE9OLCBCbHVldG9vdGggT04pOiBCb3Ro
IFdpLUZpIGFuZCBCbHVldG9vdGggd29yay4NCj4gLSBXYXJtIHJlYm9vdCAjMiAoQmx1ZXRvb3Ro
IHRvZ2dsZWQgT0ZGIG1pZC1zZXNzaW9uLCBXaS1GaSBPTik6IEJvdGgNCj4gICBXaS1GaSBhbmQg
Qmx1ZXRvb3RoIHdvcmsgY2xlYW5seSAobm8gLTE2IE1BQyBwb3dlci1vbiB0aW1lb3V0IG9yIC03
MQ0KPiAgIFVTQiBlbnVtZXJhdGlvbiBlcnJvcikuDQoNCkdvb2QgdG8gaGVhciB0aGF0Lg0KDQo+
IA0KPiBVc2luZyBydHdfZW50ZXJfaXBzKCkgaXMgaW5kZWVkIG11Y2ggY2xlYW5lciB0aGFuIG1h
bnVhbGx5IGNsZWFyaW5nIHRoZQ0KPiBpbnRlcm5hbCBmbGFncyBhbmQgY2FsbGluZyBydHdfcG93
ZXJfb2ZmKCksIGFuZCBpdCBhbHNvIG5vdGlmaWVzIEJUDQo+IGNvZXggdmlhIENPRVhfSVBTX0VO
VEVSIGJlZm9yZSBlbnRlcmluZyBQQ0lfRDNob3QuDQo+IA0KPiBSZWdhcmRpbmcgY29tbWl0cyAw
NTIwMjc0NmVkNzAgYW5kIDQ0NDkyZTcwYWRjODoNCj4gLSAwNTIwMjc0NmVkNzAgc2V0cyBCSVRf
VVNCX1NVU19ESVMgaW4gUkVHX0hDSV9PUFRfQ1RSTCwgd2hpY2ggZG9lcyBub3QNCj4gICBwb3dl
ciBvZmYgdGhlIFdpLUZpIE1BQyBiZWZvcmUgNDQ0OTJlNzBhZGM4IHRyYW5zaXRpb25zIHRoZSBk
ZXZpY2UgdG8NCj4gICBQQ0lfRDNob3TigJRsZWF2aW5nIFJFR19BUFNfRlNNQ08gYWN0aXZlIGFj
cm9zcyB3YXJtIHJlc2V0ICgtRUJVU1kpLg0KDQpTbyBib3RoIG9yIGVpdGhlciBvbmUgY29tbWl0
IGRvbid0IGhlbHA/DQoNCj4gLSBDYWxsaW5nIHJ0d19lbnRlcl9pcHMoKSByaWdodCBiZWZvcmUg
cGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDNob3QpDQo+ICAgY2xlYW5seSByZXNvbHZl
cyB0aGF0IHdoaWxlIGtlZXBpbmcgYm90aCBjb21taXRzIGludGFjdC4NCj4gDQo+IFdvdWxkIHlv
dSBsaWtlIG1lIHRvIHNlbmQgYSBbUEFUQ0ggdjJdIHRoYXQgZXhwb3J0cyBydHdfZW50ZXJfaXBz
KCkgaW4NCj4gcHMuYyBhbmQgY2FsbHMgaXQgZnJvbSBydHdfcGNpX3NodXRkb3duKCkgaW4gcGNp
LmM/DQoNCklmIHRoaXMgaXMgdGhlIG9ubHkgd2F5IHRvIGZpeCwgcGxlYXNlLiANCg0KLS0tDQoN
CnB3LWJvdDogY3INCg0K
