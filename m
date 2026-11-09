Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190039;
	b=1lyi/kNaBgr095w5i4qO79RvTm9DrpWjbbEmCjIzxFAfe5dsShA+BZBY0jhV8YuZMf5Q
	 v3Lwq2bXmq4CpXMmitgNiDOpeeG7+7PaMfIWRi6IOUl3ocWfh8xGqMGC5k4EG6etwygJE
	 nDUWyQ6qN4pSRrjKSiBG8cXkO8TUXeCjSqbyCV+kLfDNupkH/xRxl3XFyT0QnDLWNt1nK
	 OmviQwW4iZJ29H0LSDDFRhxrukgqCd8kzr6c90ptWYkc4eJ9d+5RSntqNDbluu+83NM08
	 mqsY7qJrNtnAifGfbi4Zhvnl0qMYQUvZzB0GVv3ba7xxmaU+qsjuIzm3BFOLOXNlv0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190039;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=sJxkNdw0BtrwG2XAovKslvG4Z6WnWv+VWereLQ65zLI=;
	b=kYW1ThMOrkhmsXA8fdVcYEzZ/C+fbvgBC23UvJVSq/bC7vGUWV3oRe97+J7mj5gBOtW7
	 r+mJWq+dIbDT6qawBhLJ/rz6B7Rv8Po8woDiVV4QgbeAI/jRn6AVtqMCUbzOeeK7eX6Ht
	 +gOvWPXc9r+j3Wl3tofUlDrmyhw4PkCp7bRY6T8niUIC4Biz72j4YYaJ2fUTK144RG3Ip
	 yBjF1YLrJaN+KDVgbbtDRLtk7V5rKE0WFCITz+uOHRrEumZWFJrOgj7NNofCpxa9XbsCs
	 K/xhSEdGOf5xF/dXOQc0HSt9w3nveP6jGHuQ5DQfjTJjDzo4Pu3oYmjikH3IYq0tkgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NRWHYHrh;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951C606A331
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 02:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7951C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NRWHYHrh
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A9273Xe83901260, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794190023; bh=sJxkNdw0BtrwG2XAovKslvG4Z6WnWv+VWereLQ65zLI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NRWHYHrho0FEftCynBS95JH2nqOf4O/eAwvmzPkxd0FHq6+cxvlrClaXaxUoz+/TN
	 YKXrzxAMxj4VJN5eui95WfDqoG59xRd7ARyVn5S6qF0DJMeiM8Zz3Oj0HGb4FQ0Km4
	 yv/pZFdWPHCU/2/yjEAINYWjPdGWE0//Nvv2T9rGY1b5DGAL9Y2mV7OxBkgr7zE6Ju
	 euhawLVRkn5ZRjzZR0LFFAJDNLVTA4cagKHXDP3KkWs7DaIGka9F1xKbjLZTVdTux0
	 MZRWLthFoU+3/MP6MujQN38Fvp5+sEFORFYL2SR+IIyk4v7zh/5cSax5UaruvjrfDp
	 0t68t59usRkcA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A9273Xe83901260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:07:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:07:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:07:03 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Huihui Huang <hhhuang@smu.edu.sg>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 2/2] wifi: rtw88: check the C2H payload length
 before reading it
Thread-Topic: [PATCH rtw-next v3 2/2] wifi: rtw88: check the C2H payload
 length before reading it
Thread-Index: AQHdbSXkwrKL8ISdgk+h4vqqjdMzCrcjeI0g///LmwCAAb7r8A==
Date: Mon, 9 Nov 2026 02:07:03 +0000
Message-ID: <d7a44f3816664c74886ae08ba2c4cff1@realtek.com>
References: <20261105125958.3891196-1-hhhuang@smu.edu.sg>
 <20261105125958.3891196-3-hhhuang@smu.edu.sg>
 <bdb47a1dc13347448cff24a26a231478@realtek.com>
 <bd0f7a6723a11810263d3e35eb41cd9a096f051d@linux.dev>
In-Reply-To: <bd0f7a6723a11810263d3e35eb41cd9a096f051d@linux.dev>
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

DQpMdWthIEdlamFrIDxsdWthLmdlamFrQGxpbnV4LmRldj4gd3JvdGU6DQo+IEhpIFBpbmctS2Us
DQo+IA0KPiBKdXN0IG9uZSBjb21tZW50IG9uIHRoZSBzdHJ1Y3QgaWRlYS4NCj4gDQo+IE5vdmVt
YmVyIDgsIDIwMjYgYXQgMzo1NiBBTSwgIlBpbmctS2UgU2hpaCIgPHBrc2hpaEByZWFsdGVrLmNv
bT4gd3JvdGU6DQo+IA0KPiA+DQo+ID4gSHVpaHVpIEh1YW5nIDxoaGh1YW5nQHNtdS5lZHUuc2c+
IHdyb3RlOg0KPiA+DQo+ID4+DQo+ID4+ICsgICAgaWYgKHJ0d19jMmhfcGF5bG9hZF9sZW4oc2ti
KSA8IDMpIHsNCj4gPg0KPiA+IFRoZSAzIGlzIGJlY2F1c2Ugb2YgR0VUX1NDQU5fUkVQT1JUX1JF
VFVSTl9DT0RFKCkuIEhvdyBkb2VzIHBlb3BsZSB1bmRlcnN0YW5kDQo+ID4gd2hhdCAzIG1lYW5z
Pw0KPiA+DQo+ID4gTWF5YmUsIHdlIHNob3VsZCBkZWZpbmUgc3BlY2lmaWMgc3RydWN0IGZvciBz
dGF0dXNfcmVwb3J0LCBsaWtlDQo+ID4NCj4gPiBzdHJ1Y3Qgc3RhdHVzX3JlcG9ydCB7DQo+ID4g
ICAgIHU4IGlkOw0KPiA+ICAgICB1OCBzZXE7DQo+ID4gICAgIHU4IHJzdmRbMl0NCj4gPiAgICAg
dTggcmV0cnVuX2NvZGU7DQo+ID4gfTsNCj4gPg0KPiA+IHN0cnVjdCBzdGF0dXNfcmVwb3J0ICpz
dGF0dXNfcmVwb3J0ID0gZ2V0X2MyaF9mcm9tX3NrYihza2IpOw0KPiA+DQo+ID4gaWYgKHJ0d19j
MmhfcGF5bG9hZF9sZW4oc2tiKSA8IHNpemVvZigqc3RhdHVzX3JlcG9ydCkpDQo+IA0KPiBBZ3Jl
ZWQsIGEgc3RydWN0IGlzIG11Y2ggZWFzaWVyIHRvIGZvbGxvdyB0aGFuIHRoZSBiYXJlIG51bWJl
cnMuIE9uZQ0KPiBzbWFsbCB0aGluZyB0aG91Z2guIFRoaXMgc3RydWN0IHN0YXJ0cyBhdCB0aGUg
QzJIIGhlYWRlciwgYnV0DQo+IHJ0d19jMmhfcGF5bG9hZF9sZW4oKSBsZWF2ZXMgdGhlIHR3byBo
ZWFkZXIgYnl0ZXMgb3V0LiBTbyBhcyBmYXIgYXMgSSBjYW4NCj4gc2VlIHRoZSBjaGVjayB3b3Vs
ZCBhc2sgZm9yIDUgcGF5bG9hZCBieXRlcyB3aGlsZSBvbmx5IDMgYXJlIHJlYWQsIGFuZCBhDQo+
IHZhbGlkIHJlcG9ydCB3aXRoIDMgb3IgNCBwYXlsb2FkIGJ5dGVzIHdvdWxkIGJlIHRyZWF0ZWQg
YXMgdG9vIHNob3J0Lg0KPiANCj4gTWF5YmUgdGhlIHN0cnVjdCBjb3VsZCBjb3ZlciBvbmx5IHRo
ZSBwYXlsb2FkLCBsaWtlIHN0cnVjdCBydHdfYzJoX3JhX3JwdA0KPiBhbmQgc3RydWN0IHJ0d19j
MmhfYWRhcHRpdml0eSBhbHJlYWR5IGRvOg0KPiANCj4gICAgICAgICBzdHJ1Y3QgcnR3X2MyaF9z
Y2FuX3N0YXR1c19ycHQgew0KPiAgICAgICAgICAgICAgICAgdTggcnN2ZFsyXTsNCj4gICAgICAg
ICAgICAgICAgIHU4IHJldHVybl9jb2RlOw0KPiAgICAgICAgIH0gX19wYWNrZWQ7DQo+IA0KPiBU
aGVuIGl0IGNvbXBhcmVzIHdpdGggcnR3X2MyaF9wYXlsb2FkX2xlbigpIGRpcmVjdGx5LCBhbmQg
dGhlIHNhbWUgd291bGQNCj4gd29yayBmb3IgdGhlIGNoYW5uZWwgc3dpdGNoIHJlcG9ydCBhbmQg
dGhlIHR3byBUWCByZXBvcnQgZm9ybWF0cy4NCg0KSSBqdXN0IGRvbid0IHdhbnQgbWFnaWMgbnVt
YmVyIDMsIDUgYW5kIGV0Yy4gVGhhdCdzIHZlcnkgaGFyZCB0byBwZW9wbGUNCnRvIHVuZGVyc3Rh
bmQuIE5vIHN0cmljdCBvcGluaW9uIGFib3V0IHRoZSBzdHJ1Y3QuDQoNCg0KDQo=
