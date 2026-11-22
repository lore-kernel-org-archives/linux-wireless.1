Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312313;
	b=BH40DRMWh+QykWtGIRWHS1Mlqu+zwyJapbE1+kIW1IRTzI+D82VtQhaMBVH3a4S3z5rQ
	 wXU3WesJtxcgYHaMaEIJhkI733mXKCxQWvVtrZ+zOWx7++3CqmK3DmLLrv4PQKpaLOmqE
	 3xDyYsPMPUu2GCHY7w23/g/0vQ0UCdLDOMc4j4PLRRkdphqadKOshlboXIb8DrFX1+GAx
	 N0QikG25IdSoHkUoRZyL6K3Apk/GXItN0WBhvmvpgMeBi0WhAE6d7bw1GPTxPV9NQiegs
	 7+y4BHpRrOnv2gY5EbP/WjboNs6hZw3iQnTznSzmCs0Li/FtDhRmw9WydzaMYItuQbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312313;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=z6w5Pt64hxUsrNGZLf6exPMYPi1xVW4QdYEWe63y3wg=;
	b=tXidrngU1KRAyu52AED9wxtp5T5dhegtqgpu8lhf6T/gBcsuBvuB7Nz/mgdy0COeduhX
	 N58+tbb4C1Bk7VNCsfmVBmetiRMMdmgSQ2zTjDiaCQo1EeAp2Yomxz3r/ZpbEVC1F0ua5
	 womXHA265jUGVh0PE71lHtKpHrTZOcLURBNNpiN/+LhVyyRR1nAHufsJ0UzsjIBOXyLqZ
	 VitgAR9/scUWwlrs9D77pENTjsbFG/UiJj1ldKdey09XRGxer+0nz0+43vN+ey5odpFy7
	 uElAEL07LlSIb8bhvean5xUvXW8EXvIgyvQFR0LGmU7kA2VM7lusIQ9GP9hLLCTy5hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Brrl9TLo;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6B606A32C;
	Sun, 22 Nov 2026 01:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC6B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Brrl9TLo
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM1pK7C1515643, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795312280; bh=z6w5Pt64hxUsrNGZLf6exPMYPi1xVW4QdYEWe63y3wg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Brrl9TLo6m9Bjql1TGluzfGHcZvoS1E0KiySlFVI/kT+oPh4HXBk767hvnE9jN+D4
	 RLf9iOX0Y5r3r/7gzWeNjB1OieRaeZeClrC224Ti2fNsgY8rOFvB8rKiu14DtFaL9h
	 Y1qQ0Q5vHMaapNpFb70n/r8zs5xF84ZGTnPBDecy539U/NVeqMhpxRO5OCUt59i63x
	 FvDBwjIdzXHvTNsPtierFwMrH2XvSO8J2IZpHG7xEp7/IhHdsPqV2lyyfzf08RwTjp
	 dnxHvZ7jE/PwwJ5pVPuJlCyk7CK6e0fFZNyD7OCzBgDB5bt1/10W16zS3ivp8Vz3mo
	 KG6hp93UvOYpA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM1pK7C1515643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 09:51:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 09:51:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 09:51:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 1/3] wifi: rtl8xxxu: honour the rate of injected
 frames on gen1 chips
Thread-Topic: [PATCH rtw-next 1/3] wifi: rtl8xxxu: honour the rate of injected
 frames on gen1 chips
Thread-Index: AQHdeHKps1yrgoumFkma1jbt4yBvTLc5VVRw
Date: Sun, 22 Nov 2026 01:51:19 +0000
Message-ID: <990225d3544d4965b80a70d4645b3733@realtek.com>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
 <20261120-b4-inject-v1-1-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-1-1e1693af0c6b@proton.me>
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

QWhtZXQgWmVyZW4gdmlhIEI0IFJlbGF5IDxkZXZudWxsK25pa28zeC5wcm90b24ubWVAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IEZyb206IEFobWV0IFplcmVuIDxuaWtvM3hAcHJvdG9uLm1lPg0KPiAN
Cj4gV2hlbiBhIGZyYW1lIGlzIGluamVjdGVkIHdpdGggYSByYXRlIGluIGl0cyByYWRpb3RhcCBo
ZWFkZXIsIHRoZSBkcml2ZXINCj4gaWdub3JlcyBpdCBhbmQgbGVhdmVzIHRoZSBjaG9pY2UgdG8g
dGhlIGZpcm13YXJlIHJhdGUgYWRhcHRhdGlvbi4gT24gYQ0KPiBSVEw4MTkyQ1UgZXZlcnkgaW5q
ZWN0ZWQgZnJhbWUgd2VudCBvdXQgYXQgTUNTIDcsIHdoYXRldmVyIHdhcyBhc2tlZC4NCj4gDQo+
IFVzZSB0aGUgaW5qZWN0ZWQgcmF0ZSBhbmQgZ3VhcmQgaW50ZXJ2YWwsIGFuZCBkaXNhYmxlIHJh
dGUgZmFsbGJhY2sgc28NCj4gdGhlIGZyYW1lIGlzIHNlbnQgYXQgZXhhY3RseSB0aGF0IHJhdGUu
DQo+IA0KPiBUZXN0ZWQgb24gUlRMODE5MkNVICgwYmRhOjgxNzgpIGluIG1vbml0b3IgbW9kZSBv
biAyLjQgR0h6OiAxLCA1LjUsIDYNCj4gYW5kIDU0IE1icHMsIE1DUyAwLzcvOC8xNSB3aXRoIGxv
bmcgYW5kIHNob3J0IEdJIHdlcmUgYWxsIHJlY2VpdmVkIGF0DQo+IHRoZSByZXF1ZXN0ZWQgcmF0
ZS4gRnJhbWVzIHdpdGhvdXQgYSByYWRpb3RhcCByYXRlIGFyZSB1bmNoYW5nZWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBaG1ldCBaZXJlbiA8bmlrbzN4QHByb3Rvbi5tZT4NCg0KVGhlIGNvbW1l
bnQgaXMgbm90IHVubmVjZXNzYXJ5LiBPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8gbWU6DQoNClJl
dmlld2VkLWJ5OiBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4NCg0KPiAtLS0NCj4g
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bDh4
eHh1L2NvcmUuYw0KPiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29y
ZS5jDQo+IGluZGV4IDYwNGJiMWU1YjAuLjk2OTg3NWZkNTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5jDQo+IEBAIC01MjIzLDYgKzUyMjMs
MjggQEAgc3RhdGljIHZvaWQgcnRsOHh4eHVfZHVtcF9hY3Rpb24oc3RydWN0IGRldmljZSAqZGV2
LA0KPiAgICAgICAgIH0NCj4gIH0NCj4gDQo+ICsvKg0KPiArICogVXNlIHRoZSByYXRlIGZyb20g
dGhlIHJhZGlvdGFwIGhlYWRlciBvZiBhbiBpbmplY3RlZCBmcmFtZSwgaWYgYW55Lg0KPiArICog
bWFjODAyMTEgaGFzIGFscmVhZHkgY2hlY2tlZCBpdCBhZ2FpbnN0IHdoYXQgd2UgYWR2ZXJ0aXNl
Lg0KPiArICovDQoNCk5vIG5lZWQgdGhlIGNvbW1lbnQuIFRoZSBjb2RlIGRvZXMgYXMgdGhlIGNv
bW1lbnQuDQoNCj4gK3N0YXRpYyBib29sIHJ0bDh4eHh1X3R4X3JhdGVfaW5qZWN0KHN0cnVjdCBp
ZWVlODAyMTFfdHhfaW5mbyAqdHhfaW5mbywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdTMyICpyYXRlLCBib29sICpzZ2kpDQo+ICt7DQo+ICsgICAgICAgc3RydWN0IGll
ZWU4MDIxMV90eF9yYXRlICp0eHJhdGUgPSAmdHhfaW5mby0+Y29udHJvbC5yYXRlc1swXTsNCj4g
Kw0KPiArICAgICAgIGlmICghKHR4X2luZm8tPmNvbnRyb2wuZmxhZ3MgJiBJRUVFODAyMTFfVFhf
Q1RSTF9SQVRFX0lOSkVDVCkpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsN
Cj4gKyAgICAgICBpZiAodHhyYXRlLT5mbGFncyAmIElFRUU4MDIxMV9UWF9SQ19NQ1MpDQo+ICsg
ICAgICAgICAgICAgICAqcmF0ZSA9IERFU0NfUkFURV9NQ1MwICsgdHhyYXRlLT5pZHg7DQo+ICsg
ICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgICAgKnJhdGUgPSBydGw4eHh4dV9sZWdhY3lfcmF0
ZXRhYmxlW3R4cmF0ZS0+aWR4XS5od192YWx1ZTsNCj4gKw0KPiArICAgICAgICpzZ2kgPSB0eHJh
dGUtPmZsYWdzICYgSUVFRTgwMjExX1RYX1JDX1NIT1JUX0dJOw0KPiArDQo+ICsgICAgICAgcmV0
dXJuIHRydWU7DQo+ICt9DQo+ICsNCg0KDQo=
