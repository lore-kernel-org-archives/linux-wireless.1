Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761969;
	b=OEHvesQRGntz/BNKKAYQS4ejzLBAKNmmNvEw7JKSczC0RpnoefqlzqDebXJnnVeMGeQl
	 ltlZbDbdUwf6nYvgPXDe2HKGkse9iy0BTFjRJsK5BE94BN22lPFNrMNvgNg8ErQ7kh5/M
	 e1rnHpPOuO7DuXq4fXSpcaXpysgBznetzG6r7yOTCXp/n99HlTAt3PVBXTKG6rDTXmPpf
	 xUoYQTd1xrQHRm2CgVGy3NKh7kzS3kpoKoydr8+iP4p9uT3GzDsLchwegUuY6NjPxdhM3
	 sWAouyGR/0hINwPn2s3QYDRaUV0BvLVWrR0S6V2e7QBXr5rY9hnmUbB3vYT8rcSjq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761969;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hzoxS5e0AqgWIvGz4EODA3qv+uaXkw1hP8MtEIrrngM=;
	b=3gyuf9MMPv0zK+Wn/Z8YZXAJECAhQDtcwXIkXzIa1nwdv4czcBmWzRFTSBhIBsaCFb2o
	 sv03qBPswfPUmZ7g3wGXc63/8AgindlYKUafsMhK2v/KO93cEZa0n3xcy3xETK80SICaW
	 xejyZEzqwISlEBYWSLCZEOszZdEj62bNn7VjFkwTyHtTih67CbkL3N5B3YqfIlimSy59k
	 qvPlSD8fSuhU2QTVSjRn5eyb0XmBd4uAWmjW2zYnAWlhOMDcbzncCy3mDy7Gn5RWU7yCJ
	 iDanME0xNU2df28/h4i0WTzp1zQOXCRwMdXRwi0IXlBLM6dKTjr2qdkBqs/xLyiEqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KYF0Pc0J;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C742606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C742606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=KYF0Pc0J
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR6jrcH7740327, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795761953; bh=hzoxS5e0AqgWIvGz4EODA3qv+uaXkw1hP8MtEIrrngM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KYF0Pc0JwYlq3KAYy/ZCUksZF5tsmXlbfYLnhbdw8tQeDXpGjuv/ULOqUG5amRA+K
	 B/3hHsAOQGPFQdj+cSKeYB2grTtRBIpyge0ttxcSCgIgWNKC9QwDso2YKPlh3svy6w
	 kaT6eUs3NqcQa/R9GcZrKAxsbh7uYbL1ujBDIIABEGvz+YOLpDS1GKPdZT45KOd567
	 kQBw8tBQdtHTWAEKbU4wk9kRTgx/9MP1iAO1FjXdkelb/YRTx9TDOsOML0tBx0jeko
	 VN0vwT1sH0l2OaCPTckGSMulOdL0vjwp5QU4wBnI1VkIa4sBleBZGL/bQ7fe7/O/St
	 CF0M4OpV7NaNw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR6jrcH7740327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 14:45:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:45:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 14:45:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 14:45:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Falconet3 <Falconet3@proton.me>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] wifi: rtw89: fix element walk bounds checks
Thread-Topic: [PATCH v4 1/2] wifi: rtw89: fix element walk bounds checks
Thread-Index: AQHde3etbAMica9OdU6J+AR2pE0TBbdBfOLA
Date: Fri, 27 Nov 2026 06:45:53 +0000
Message-ID: <98320cb119c54cd9be1c36f0ca1126a7@realtek.com>
References: <B6QON2a1ZGk3ddppttcN5qus6WXB2bodBbLcQQEXK7zfi7AcYQjU2qTIjYb4nS7QE62oRYH14MK65-AZ4VafzlrFpNKhEFunww-H6B1kuV4=@proton.me>
In-Reply-To: <B6QON2a1ZGk3ddppttcN5qus6WXB2bodBbLcQQEXK7zfi7AcYQjU2qTIjYb4nS7QE62oRYH14MK65-AZ4VafzlrFpNKhEFunww-H6B1kuV4=@proton.me>
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

RmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPiB3cm90ZToNCj4gX19ydHc4OV9md19yZWNv
Z25pemVfZWxlbWVudHMoKSBjaGVja3Mgb25seSB0aGUgZWxlbWVudCBib2R5IGFnYWluc3QNCj4g
ZmlybXdhcmUtPnNpemUsIG9taXR0aW5nIHRoZSAzMi1ieXRlIHN0cnVjdCBydHc4OV9md19lbGVt
ZW50X2hkcjoNCj4gDQo+ICAgICAgICAgd2hpbGUgKG9mZnNldCArIHNpemVvZigqaGRyKSA8IGZp
cm13YXJlLT5zaXplKSB7DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICAgICAgICAg
IGVsbV9zaXplID0gbGUzMl90b19jcHUoaGRyLT5zaXplKTsNCj4gICAgICAgICAgICAgICAgIGlm
IChvZmZzZXQgKyBlbG1fc2l6ZSA+PSBmaXJtd2FyZS0+c2l6ZSkNCj4gDQo+IFRoZSBlbGVtZW50
IGhhbmRsZXJzLCBhbmQgcnR3ODlfZndfZWxlbV9kdXBfaWZfbmVlZGVkKCkgd2hlbiBpdCBjb3Bp
ZXMNCj4gZWxlbWVudHMgKHNpemVfdCBsZW4gPSBzaXplb2YoKmVsbSkgKyBsZTMyX3RvX2NwdShl
bG0tPnNpemUpKSwgcmVhZCB0aGUNCj4gaGVhZGVyIGFuZCB0aGUgYm9keS4gQSBjcmFmdGVkIGVs
ZW1lbnQgd2l0aA0KPiBvZmZzZXQgKyBlbG1fc2l6ZSA9PSBmaXJtd2FyZS0+c2l6ZSAtIDEgcGFz
c2VzIHRoZSBjaGVjayBhbmQgaXMgcmVhZCB1cA0KPiB0byBzaXplb2Yoc3RydWN0IHJ0dzg5X2Z3
X2VsZW1lbnRfaGRyKSAtIDEgPSAzMSBieXRlcyBwYXN0DQo+IGZpcm13YXJlLT5kYXRhLiBGb3Ig
ZmlybXdhcmUgbGFyZ2VyIHRoYW4gMiBNQiB0aGUgY29weSBwYXRoIGFsc28gc3RvcmVzDQo+IHRo
b3NlIGJ5dGVzIGluIGEgcGVyc2lzdGVudCBkZXZtXyBidWZmZXIuDQo+IA0KPiBUaGUgd2FsayBz
dGFydCBvZmZzZXQgaXMgbm90IHZhbGlkYXRlZCBlaXRoZXI6IHJ0dzg5X21md19nZXRfc2l6ZSgp
DQo+IHJldHVybnMgbGUzMl90b19jcHUobWZ3X2luZm8tPnNoaWZ0KSArIGxlMzJfdG9fY3B1KG1m
d19pbmZvLT5zaXplKSwgYW5kDQo+IHJ0dzg5X21md192YWxpZGF0ZV9oZHIoKSBvbmx5IGNoZWNr
cyB0aGF0IHRoZSBpbmZvIGFycmF5IGZpdHMgaW4gdGhlDQo+IGJ1ZmZlci4gT24gMzItYml0IChz
aXplb2Yoc2l6ZV90KSA9PSA0KSBhbiBhbGlnbmVkIG9mZnNldCA+PSAweGZmZmZmZmUwDQo+IHdy
YXBzICJvZmZzZXQgKyBzaXplb2YoKmhkcikiIGluIHRoZSBsb29wIGd1YXJkLCBzbyBoZHItPnNp
emUgaXMNCj4gZGVyZWZlcmVuY2VkIG91dCBvZiBib3VuZHMgYmVmb3JlIGFueSBjaGVjayBydW5z
Lg0KPiANCj4gQ2hlY2sgdGhlIHN0YXJ0IG9mZnNldCBiZWZvcmUgZGVyZWZlcmVuY2luZyBoZHIg
YW5kIHVzZSBzaXplX3QgcmVtYWluZGVyDQo+IGFyaXRobWV0aWMgZm9yIGJvdGggYm91bmRzIGNo
ZWNrcywgd2hpY2ggY2Fubm90IHdyYXAgb24gYW55DQo+IGFyY2hpdGVjdHVyZS4gQW4gZWxlbWVu
dCB3aG9zZSBoZWFkZXIgYW5kIG5vbi1lbXB0eSBib2R5IGVuZCBleGFjdGx5IGF0DQo+IGZpcm13
YXJlLT5zaXplIGlzIG5vdyBhY2NlcHRlZDsgYmVmb3JlLCBzdWNoIGV4YWN0IGZpdHMgd2VyZSBy
ZWplY3RlZA0KPiBldmVuIHRob3VnaCB0aGV5IGFyZSBpbiBib3VuZHMuDQoNClBsZWFzZSByZWR1
Y2UgdGhlIG1lc3NhZ2UuIFRoZSBtYWluIHBvaW50IGlzIHRoYXQgeW91IGp1c3Qgd2FudCB0byBh
dm9pZA0Kb3ZlcmZsb3cgY2FzZS4NCg0KPiANCj4gRml4ZXM6IGEzMzdkNDMzMWZkNiAoIndpZmk6
IHJ0dzg5OiBpbnRyb2R1Y2UgaW5mcmFzdHJ1Y3R1cmUgb2YgZmlybXdhcmUgZWxlbWVudHMiKQ0K
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBBc3Npc3RlZC1ieTogTExNIE1pc3RyYWwg
VmliZQ0KPiBTaWduZWQtb2ZmLWJ5OiBGYWxjb25ldDMgPEZhbGNvbmV0M0Bwcm90b24ubWU+DQo+
IC0tLQ0KPiB2NDogcmVzZW5kIGFzIGEgbmV3IHRocmVhZCBhdCB0aGUgbWFpbnRhaW5lcidzIHJl
cXVlc3Q7IG5vIGNvZGUgY2hhbmdlDQo+ICAgICBzaW5jZSB2My4NCj4gdjM6IHJlc2VuZCBvZiB0
aGUgc2VyaWVzIHdpdGggdGhlIGNvcnJlY3Qgc3ViamVjdHMgYW5kIHZlcnNpb24gbGFiZWw7IG5v
DQo+ICAgICBjb2RlIGNoYW5nZSBzaW5jZSB2Mi4NCj4gdjI6IHZhbGlkYXRlIHRoZSB3YWxrIHN0
YXJ0IG9mZnNldCBiZWZvcmUgZGVyZWZlcmVuY2luZyBoZHIgKGZpeGVzIHRoZQ0KPiAgICAgMzIt
Yml0IHdyYXApLCB1c2Ugc2l6ZV90IHJlbWFpbmRlciBhcml0aG1ldGljLCBub3RlIHRoZSBleGFj
dC1maXQNCj4gICAgIGFjY2VwdGFuY2UsIGNvcnJlY3QgRml4ZXM6IGFuZCB0aGUgYWZmZWN0ZWQg
cmFuZ2UsIGFkZCBDYzogc3RhYmxlLg0KPiAgICAgQ29tcGlsZS0gYW5kIHNwYXJzZS10ZXN0ZWQg
b24geDg2XzY0OyBubyByZXByb2R1Y2VyIGF2YWlsYWJsZS4NCj4gDQo+ICBkcml2ZXJzL25ldC93
aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2Z3LmMgfCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkvZncuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L3JlYWx0ZWsvcnR3ODkvZncuYw0KPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVr
L3J0dzg5L2Z3LmMNCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9m
dy5jDQo+IEBAIC0xNjcxLDExICsxNjcxLDEyIEBADQo+ICAgICAgICAgdTMyIGVsZW1faWQ7DQo+
ICAgICAgICAgaW50IHJldDsNCj4gDQo+IC0gICAgICAgd2hpbGUgKG9mZnNldCArIHNpemVvZigq
aGRyKSA8IGZpcm13YXJlLT5zaXplKSB7DQo+ICsgICAgICAgd2hpbGUgKG9mZnNldCA8IGZpcm13
YXJlLT5zaXplICYmDQo+ICsgICAgICAgICAgICAgIGZpcm13YXJlLT5zaXplIC0gb2Zmc2V0ID4g
c2l6ZW9mKCpoZHIpKSB7DQoNClRoaXMgYmVjb21lcyBub3QgcmVhZGFibGUuIEkgZG9uJ3QgdGhp
bmsgcGVvcGxlIGNhbiBiZSBlYXN5IHRvIHVuZGVyc3RhbmQNCndoYXQgaXQgZG9lcy4gDQoNCk1h
eWJlLA0KDQp1MzIgb2Zmc2V0X2hkcl9lbmQ7DQoNCndoaWxlICghY2hlY2tfYWRkX292ZXJmbG93
KG9mZnNldCwgc2l6ZW9mKCpoZHIpLCAmb2Zmc2V0X2hkcl9lbmQpICYmDQoJICAgb2Zmc2V0X2hk
cl9lbmQgPCBmaXJtd2FyZS0+c2l6ZSkNCg0KDQo+ICAgICAgICAgICAgICAgICBoZHIgPSAoY29u
c3Qgc3RydWN0IHJ0dzg5X2Z3X2VsZW1lbnRfaGRyICopKGZpcm13YXJlLT5kYXRhICsgb2Zmc2V0
KTsNCj4gDQo+ICAgICAgICAgICAgICAgICBlbG1fc2l6ZSA9IGxlMzJfdG9fY3B1KGhkci0+c2l6
ZSk7DQo+IC0gICAgICAgICAgICAgICBpZiAob2Zmc2V0ICsgZWxtX3NpemUgPj0gZmlybXdhcmUt
PnNpemUpIHsNCj4gKyAgICAgICAgICAgICAgIGlmIChlbG1fc2l6ZSA+IGZpcm13YXJlLT5zaXpl
IC0gb2Zmc2V0IC0gc2l6ZW9mKCpoZHIpKSB7DQoNClNpbWlsYXJseS4gDQoNCnUzMiBvZmZzZXRf
ZWxtX2VuZDsNCg0KaWYgKGNoZWNrX2FkZF9vdmVyZmxvdyhvZmZzZXQsIGVsbV9zaXplLCAmb2Zm
c2V0X2VsbV9lbmQpIHx8DQogICAgb2Zmc2V0X2VsbV9lbmQgPj0gZmlybXdhcmUtPnNpemUpDQoN
Cg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBydHc4OV93YXJuKHJ0d2RldiwgImZpcm13YXJl
IGVsZW1lbnQgc2l6ZSBleGNlZWRzXG4iKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7DQo+ICAgICAgICAgICAgICAgICB9DQo+IC0tDQo+IDIuNTMuMA0K
