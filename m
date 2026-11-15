Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711957;
	b=hXrMqkVjDHX4cQQ9IeMwRVcn12GLdTExuyypIWrgRN/h4zUZ9W/iOPs5idR8V7mUlxfx
	 m5uP/37ziD7rWf5p2dNb+MsGfYmqi4pvEpUBSQp2uDWRuaPUQJMG1XxYAhKowSbt79rDy
	 +uyGAV08Bf4szsfYFi9WtO/7l0n97XrmgWFzwzMIdfrRFMN5jXy9N3lHnTCgvT+VZSY9G
	 fV3xDY5H2E+qK1buY4PZoxE4Lo/xcuimeJ0kpW5QZ1qLlvE/ajWnHsfHSAZwRaS/nOUAX
	 kzX/TB8EPsllOWxWnScjlsgxuCDI1XHRtYE5b53HySb9YKuRn+h2RHQTbThdQTplD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711957;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=E+9OlLHTLxzOvWzTcoyKrRDiQrhp4xqBbf3u4cVlZeU=;
	b=fLmCA6lTXIRvLXsEjuGIlyDRl1qJsfohSdUMZUog2lasRHU9mURnzMQqOYpRa8R3HgMS
	 kFJ+ItuCTulPHdhWavjqVi/yKPheXrIKjtGzL8mB0ekyAiijWFgjhw6JNTmsEI28TPZ8l
	 UVcJ7cYo629oB/qyuPjeTpFvVSeIyxxrqePZmutuTzCfj2Uqrf/5Q9rbU0u8e5csDoiZN
	 xVoVlFqs0hYQKTBpDFzMfUcPTqE6kDh7OsL1b4uCyWm2dz7thvpsiCv+37kOyHP9faW/1
	 moNkt4vLg/FbQ/Ns6SUE23An6SUo4+AquAN+fziD5X2dEMIRFDmXuM9jvpoodQpqT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jcEGoGpW;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291EE606A323
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 03:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jcEGoGpW
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF35p3U22144612, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794711952; bh=E+9OlLHTLxzOvWzTcoyKrRDiQrhp4xqBbf3u4cVlZeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=jcEGoGpW21My8yRWfPVLVFWFroXQvncURoDlMi6afJaBFp8Wlnzo0x++ChKsBrbEm
	 N8fUbIIBV9Yjp4bL6AvPoMX+afLOMhW4hZ/Jm0coXIbKo/RzuwyIU9Q6aZ1OVNLybc
	 OyZJRucrjWHhdj0rgSpBGE57EjWNDltM8BP3g89r8BcnuHfctBcgzfS9XuS6DA87kr
	 rpiTAeIo/MYTMPWxHZFrfm6To4kts6zf5rOLfvrGk2dnZW6N0RVWvAWipwzkPVXZQ7
	 P8jMMLRfP1hi2CDdHRinC4m+Niv8rdJnKQocUdQ7KBpP12AVAT0/88de5HBeHgny0+
	 gFWiUL+BHKKxQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF35p3U22144612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 11:05:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:05:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 11:05:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "V. S." <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHdc0YlUf9eQmeiD0qR+cPoa7qFpLcrqBfg///0NQCAAthicA==
Date: Sun, 15 Nov 2026 03:05:52 +0000
Message-ID: <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com>
References: <20261113080731.30155-1-spam@acio.nl>
 <4985719de8b5439e8484384ed52033e1@realtek.com>
 <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
In-Reply-To: <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
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
ZWsuY29tPiB3cm90ZToNCj4gPiBOb3Qgb25seSBSU1NJIDAgYnV0IFJTU0kgMSBjYW4gZmFsbCBp
bnRvIHRoaXMgY2FzZSwgYnV0IEkgdGhpbmsgaXQgaXMgaGFybWxlc3MuDQo+IA0KPiBBZ3JlZWQu
DQo+IA0KPiA+IEhvdyBhYm91dCBwdXQgaW50byByYS0+IGluc3RlYWQgb2YgcnR3c3RhX2xpbmst
PiA/DQo+ID4NCj4gPiBQbGVhc2UgcHV0IGl0IG9uIGJvdHRvbSB3aXRoIGEgY29tbWVudCBsaWtl
IGJlbG93LCBiZWNhdXNlIHRoZSBzdHJ1Y3QgcnR3ODlfcmFfaW5mbw0KPiA+IGlzIGEgY29weSBv
ZiBIMkMgY29tbWFuZCAoYXQgaW5pdGlhbCB2ZXJzaW9uKS4NCj4gDQo+IE9LLiBPbmUgcG9pbnQg
YmVmb3JlIEkgc2VuZCB2NDogcnR3ODlfcGh5X3JhX3N0YV91cGRhdGUoKSBzdGFydHMgd2l0aA0K
PiBtZW1zZXQocmEsIDAsIHNpemVvZigqcmEpKS4NCg0KSSBmb3Jnb3QgdGhpcyBwb2ludC4gDQoN
CkhvdyBhYm91dCBtZW1zZXQocmEsIDAsIG9mZnNldG9mKHR5cGVvZigqcmEpLCByc3NpX3Vua25v
d24pKSA/DQoNCkFuZCwgYWRkaXRpb25hbCBjb21tZW50IC4uLiAoc2VlIGJlbG93KQ0KDQo+IFRo
ZSBSQSB1cGRhdGUgY2FsbHMgaXQgZXZlcnkgMiBzZWNvbmRzLCBzbw0KPiB0aGUgbWVtc2V0IGNs
ZWFycyB0aGUgZmxhZyBiZWZvcmUgdGhlIFJBIHVwZGF0ZSBjYW4gcmVhZCBpdC4gVGh1cywgdGhl
DQo+IFJBIHVwZGF0ZSBtdXN0IGtlZXAgdGhlIGZsYWcgaW4gYSBsb2NhbCB2YXJpYWJsZSBiZWZv
cmUgdGhlIGNhbGwuIFRoaXMNCj4gaXMgbXkgcHJvcG9zYWwgZm9yIHY0Og0KPiANCj4gLS0tIGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmgNCj4gKysrIGIvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmgNCj4gQEAgc3RydWN0IHJ0dzg5X3Jh
X2luZm8gew0KPiAgIHU4IG1hY2lkX21zYjoyOw0KPiAgIHU4IGJhbmQ6MjsgLyogZW51bSBydHc4
OV9iYW5kICovDQo+ICAgdTggaXNfbmV3X2RiZ3JlZzoxOw0KPiArIC8qIGRyaXZlciBoZWxwZXJz
ICovDQoNCi8qIGRyaXZlciBoZWxwZXJzIChub3QgY2xlYXIgYnkgcnR3ODlfcGh5X3JhX3N0YV91
cGRhdGUoKSkgKi8NCg0KPiArIGJvb2wgcnNzaV91bmtub3duOjE7DQo+ICB9Ow0KPiANCj4gLS0t
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9waHkuYw0KPiArKysgYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L3BoeS5jDQo+IEBAIHZvaWQgcnR3ODlfcGh5
X3JhX3VwZGF0ZV9zdGFfbGluayhzdHJ1Y3QgcnR3ODlfZGV2ICpydHdkZXYsDQo+ICAgc3RydWN0
IHJ0dzg5X3JhX2luZm8gKnJhID0gJnJ0d3N0YV9saW5rLT5yYTsNCj4gKyBib29sIHJzc2lfdW5r
bm93biA9IHJhLT5yc3NpX3Vua25vd247DQo+ICAgc3RydWN0IGllZWU4MDIxMV9saW5rX3N0YSAq
bGlua19zdGE7DQo+IEBADQo+ICAgcmN1X3JlYWRfdW5sb2NrKCk7DQo+IA0KPiArIHJhLT5pbml0
X3JhdGVfbHYgPSBydHc4OV9waHlfcmFfZ2V0X2luaXRfcmF0ZV9sdihydHdzdGFfbGluayk7DQo+
ICsgaWYgKHJzc2lfdW5rbm93biAmJiByYS0+aW5pdF9yYXRlX2x2KQ0KPiArIHJhLT51cGRfYWxs
ID0gMTsNCj4gKyBlbHNlDQo+ICsgcmEtPnJzc2lfdW5rbm93biA9IHJzc2lfdW5rbm93bjsNCj4g
ICBpZiAoY2hhbmdlZCAmIElFRUU4MDIxMV9SQ19TVVBQX1JBVEVTX0NIQU5HRUQpDQo+ICAgcmEt
PnVwZF9tYXNrID0gMTsNCj4gQEAgdm9pZCBydHc4OV9waHlfcmFfYXNzb2Moc3RydWN0IHJ0dzg5
X2RldiAqcnR3ZGV2LCBzdHJ1Y3QNCj4gcnR3ODlfc3RhX2xpbmsgKnJ0d3N0YV9saW5rKQ0KPiAg
IHJhLT5pbml0X3JhdGVfbHYgPSBydHc4OV9waHlfcmFfZ2V0X2luaXRfcmF0ZV9sdihydHdzdGFf
bGluayk7DQo+ICsgcmEtPnJzc2lfdW5rbm93biA9ICFyYS0+aW5pdF9yYXRlX2x2Ow0KPiAgIHJh
LT51cGRfYWxsID0gMTsNCj4gDQo+IEFub3RoZXIgb3B0aW9uIGlzIHRvIGtlZXAgdGhlIGZsYWcg
aW4gc3RydWN0IHJ0dzg5X3N0YV9saW5rLCBhcyBpbiB2My4NCj4gVGhlbiB0aGUgbWVtc2V0IGRv
ZXMgbm90IGNsZWFyIGl0LCBhbmQgdGhlIFJBIHVwZGF0ZSBkb2VzIG5vdCBuZWVkIHRoZQ0KPiBs
b2NhbCB2YXJpYWJsZS4gV2hpY2ggb25lIGRvIHlvdSBwcmVmZXI/IEkgd2lsbCB0ZXN0IHRoZSBj
aGFuZ2Ugb24NCj4gUlRMODkxMkFVIGJlZm9yZSBJIHNlbmQgdjQuDQoNClBsZWFzZSBjaGVjayBt
eSBvcGluaW9uLiBJZiB0aGF0IGlzIG5vdCBnb29kLCBtYXliZSB3ZSBjYW4gcmVjb25zaWRlciB2
My4NCg0K
