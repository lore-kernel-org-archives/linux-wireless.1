Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312855;
	b=k2+wXAr0bwgU4glMiHrl23S6zzgXHpPxxGqymIc52kSHYVUwKXTzhB2eEc/uMOIqxm8N
	 CIQ/Am4fYKmaUisO8pazlxbBLHGK4uBmrIVHGBxrBhQMVvZiP44M1reBFIlnna/QtftrM
	 uOL0uxkQdLoF/r9jAqODfiUkUN7v7P11K4+54YM1REnZ1aRsI2X+QxhiCZYiYL43wz8Hc
	 wSJYJgdDMMMhCuGLUfqWUkmIqXTE0N2SMOWEaFmRSPTnVjEknJDaPhicJzqh38fmFJfdi
	 CZxc1A2y91SugUYhqPpxSD0ZtVf4H8OYLlCzWyuO5+pS09rjFW9KnYit4WL4cUMT7/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312855;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=66NOkVGbsTtseE9LorWFWIRJc60PSA0iDjMQX5+IfcU=;
	b=OIKH+he9S4vvAzpGqOTSzQCCJaY4OF/B2EqCPESTKglG6KtE965akVtICCLnzxutGOON
	 BaCh1XmypYS69WcPbewtfW8s7aWpgl64cgkoxkiSXHO1QCcwjUf2RI0UiNIFyvGq8tOvY
	 DMdcBnlN1y4SIirHAWVvPZyojIGtQsOHGg4ndtygnEpxA8tGmpcMb4DWwmPhabma10m4Z
	 JXbKFYbBruSqjSpyODo67vPF1E4j/ZX28nnJsxNSBelS7VTvgGzyZsItvHwxy2mDME7RW
	 CGi0FGTmnE8gbY8u3dmcc439Uu9AvB1mSz0dDEFkKABKJZxJr1DEu+tfJt7plp9qlEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=tZShP1LJ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B77606A32C;
	Sun, 22 Nov 2026 02:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B77606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=tZShP1LJ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM20O5v8518081, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795312824; bh=66NOkVGbsTtseE9LorWFWIRJc60PSA0iDjMQX5+IfcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=tZShP1LJpzJbtEV4qoMZCDEY5NdJxbgOJd4yGq0jEa0i8sZEhCxGPEx19YgHiQpli
	 EuvidMQm/ZhKQXPr05cu0czJ4yfMCwljxy1AH4Y+6I+aFZ8IbE6SfKi0LBagCEVV7D
	 cbvbo0oc6IagmdPrv0f9msBxsWjTRbgzjo8IgpBmSHSxFnzHAciXQOZtViO7c709aK
	 AJWn9uHltzZllr4SKzsY5Sbq/kMT3ET80O+ETtmXu/DM50WGHwN01cOafigx9MVaFN
	 7z+hOpihlJdAjDCSfetS3PFViwgPkjzEkjFBTwCBPChMG+ckieUX3GsWywWp1Zn1ke
	 kb7ZYPNebBLcQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM20O5v8518081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 10:00:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 10:00:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 10:00:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 2/3] wifi: rtl8xxxu: honour the retry count of
 injected frames on gen1 chips
Thread-Topic: [PATCH rtw-next 2/3] wifi: rtl8xxxu: honour the retry count of
 injected frames on gen1 chips
Thread-Index: AQHdeHKpZckEvcXX2kmHArJhmABCRbc5Vzqg
Date: Sun, 22 Nov 2026 02:00:23 +0000
Message-ID: <323a762f8e0846c6b958c77672aeca75@realtek.com>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
 <20261120-b4-inject-v1-2-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-2-1e1693af0c6b@proton.me>
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
Lm9yZz4gd3JvdGU6DQoNClsuLi5dDQoNCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsv
cnRsOHh4eHUvY29yZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bDh4eHh1L2NvcmUuYw0KPiBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5jDQo+IGluZGV4IDk2OTg3NWZkNTQuLmIxNTlk
OWI2NGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4
eHUvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUv
Y29yZS5jDQo+IEBAIC01MjQ1LDYgKzUyNDUsMjQgQEAgc3RhdGljIGJvb2wgcnRsOHh4eHVfdHhf
cmF0ZV9pbmplY3Qoc3RydWN0IGllZWU4MDIxMV90eF9pbmZvICp0eF9pbmZvLA0KPiAgICAgICAg
IHJldHVybiB0cnVlOw0KPiAgfQ0KPiANCj4gKy8qDQo+ICsgKiBSZXRyeSBsaW1pdCBvZiBhbiBp
bmplY3RlZCBmcmFtZTogbm9uZSBpZiBubyBBQ0sgaXMgZXhwZWN0ZWQsIGVsc2UgdGhlDQo+ICsg
KiByYWRpb3RhcCByZXRyeSBjb3VudC4gLTEgbGVhdmVzIGl0IHRvIHRoZSBoYXJkd2FyZS4NCj4g
KyAqLw0KPiArc3RhdGljIGludCBydGw4eHh4dV90eF9yZXRyeV9pbmplY3Qoc3RydWN0IGllZWU4
MDIxMV90eF9pbmZvICp0eF9pbmZvKQ0KPiArew0KPiArICAgICAgIGlmICghKHR4X2luZm8tPmZs
YWdzICYgSUVFRTgwMjExX1RYX0NUTF9JTkpFQ1RFRCkpDQo+ICsgICAgICAgICAgICAgICByZXR1
cm4gLTE7DQo+ICsNCj4gKyAgICAgICBpZiAodHhfaW5mby0+ZmxhZ3MgJiBJRUVFODAyMTFfVFhf
Q1RMX05PX0FDSykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiArDQo+ICsgICAgICAg
aWYgKHR4X2luZm8tPmNvbnRyb2wuZmxhZ3MgJiBJRUVFODAyMTFfVFhfQ1RSTF9SQVRFX0lOSkVD
VCkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0eF9pbmZvLT5jb250cm9sLnJhdGVzWzBdLmNv
dW50IC0gMTsNCj4gKw0KPiArICAgICAgIHJldHVybiAtMTsNCj4gK30NCj4gKw0KPiAgLyoNCj4g
ICAqIEZpbGwgaW4gdjEgKGdlbjEpIHNwZWNpZmljIFRYIGRlc2NyaXB0b3IgYml0cy4NCj4gICAq
IFRoaXMgZm9ybWF0IGlzIHVzZWQgb24gODE4OGN1LzgxOTJjdS84NzIzYXUNCj4gQEAgLTUyNjIs
OSArNTI4MCwxMSBAQCBydGw4eHh4dV9maWxsX3R4ZGVzY192MShzdHJ1Y3QgaWVlZTgwMjExX2h3
ICpodywgc3RydWN0IGllZWU4MDIxMV9oZHIgKmhkciwNCj4gICAgICAgICB1OCB0aWQgPSBxY1sw
XSAmIElFRUU4MDIxMV9RT1NfQ1RMX1RJRF9NQVNLOw0KPiAgICAgICAgIHUzMiByYXRlID0gMDsN
Cj4gICAgICAgICB1MTYgc2VxX251bWJlcjsNCj4gKyAgICAgICBpbnQgcmV0cmllczsNCj4gICAg
ICAgICBib29sIGluamVjdDsNCj4gDQo+ICAgICAgICAgaW5qZWN0ID0gcnRsOHh4eHVfdHhfcmF0
ZV9pbmplY3QodHhfaW5mbywgJnJhdGUsICZzZ2kpOw0KPiArICAgICAgIHJldHJpZXMgPSBydGw4
eHh4dV90eF9yZXRyeV9pbmplY3QodHhfaW5mbyk7DQo+IA0KPiAgICAgICAgIGlmIChydGw4eHh4
dV9kZWJ1ZyAmIFJUTDhYWFhVX0RFQlVHX1RYKQ0KPiAgICAgICAgICAgICAgICAgZGV2X2luZm8o
ZGV2LCAiJXM6IFRYIHJhdGU6ICVkLCBwa3Qgc2l6ZSAldVxuIiwNCj4gQEAgLTUzMTQsNiArNTMz
NCwxMiBAQCBydGw4eHh4dV9maWxsX3R4ZGVzY192MShzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywg
c3RydWN0IGllZWU4MDIxMV9oZHIgKmhkciwNCj4gICAgICAgICAgICAgICAgIHR4X2Rlc2MtPnR4
ZHc0IHw9IGNwdV90b19sZTMyKFRYREVTQzMyX1VTRV9EUklWRVJfUkFURSB8DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWERFU0NfRElTQUJMRV9EQVRB
X0ZCKTsNCj4gDQo+ICsgICAgICAgaWYgKHJldHJpZXMgPj0gMCkgew0KPiArICAgICAgICAgICAg
ICAgdHhfZGVzYy0+dHhkdzUgJj0gfmNwdV90b19sZTMyKFRYREVTQzMyX1JFVFJZX0xJTUlUX01B
U0spOw0KDQpDYW4gd2Ugc3F1YXNoIHRoaXMgd2l0aCBpZWVlODAyMTFfaXNfbWdtdChoZHItPmZy
YW1lX2NvbnRyb2wpIGNhc2U/DQpUaGVuIHdlIGRvbid0IG5lZWQgdG8gY2xlYXIgdGhlIGJpdHMg
YWdhaW4uDQoNCj4gKyAgICAgICAgICAgICAgIHR4X2Rlc2MtPnR4ZHc1IHw9IGNwdV90b19sZTMy
KHJldHJpZXMgPDwgVFhERVNDMzJfUkVUUllfTElNSVRfU0hJRlQgfA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFhERVNDMzJfUkVUUllfTElNSVRfRU5B
QkxFKTsNCg0KbGUzMl9lbmNvZGVfYml0cyhyZXRyaWVzLCBUWERFU0MzMl9SRVRSWV9MSU1JVF9F
TkFCTEUpID8NCg0KPiArICAgICAgIH0NCj4gKw0KPiAgICAgICAgIC8qDQo+ICAgICAgICAgICog
cnRzX3JhdGUgaXMgemVybyBpZiBSVFMvQ1RTIG9yIENUUyB0byBTRUxGIGFyZSBub3QgZW5hYmxl
ZA0KPiAgICAgICAgICAqLw0KPiBAQCAtNzk3OSw2ICs4MDA1LDggQEAgc3RhdGljIGludCBydGw4
eHh4dV9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlLA0KPiAgICAgICAgIFNF
VF9JRUVFODAyMTFfUEVSTV9BRERSKGh3LCBwcml2LT5tYWNfYWRkcik7DQo+IA0KPiAgICAgICAg
IGh3LT5leHRyYV90eF9oZWFkcm9vbSA9IHByaXYtPmZvcHMtPnR4X2Rlc2Nfc2l6ZTsNCj4gKyAg
ICAgICAvKiBUaGUgVFggZGVzY3JpcHRvciByZXRyeSBsaW1pdCBpcyA2IGJpdHMgd2lkZSAqLw0K
PiArICAgICAgIGh3LT5tYXhfcmF0ZV90cmllcyA9IDY0Ow0KDQpkZWZpbmUgYSBUWERFU0MzMl9S
RVRSWV9MSU1JVF9NQVggYWxvbmcgVFhERVNDMzJfUkVUUllfTElNSVRfRU5BQkxFLg0KV2UgZG9u
J3QgbmVlZCB0aGUgY29tbWVudCwgYW5kIGl0IGlzIGNsZWFyIHRoYXQgNjQgaXMgYmVjYXVzZQ0K
VFhERVNDMzJfUkVUUllfTElNSVRfRU5BQkxFIGlzIDYgYml0cyB3aWRlLg0KDQo+ICAgICAgICAg
aWVlZTgwMjExX2h3X3NldChodywgU0lHTkFMX0RCTSk7DQo+IA0KPiAgICAgICAgIC8qDQo+IA0K
PiAtLQ0KPiAyLjU2LjENCj4gDQoNCg==
