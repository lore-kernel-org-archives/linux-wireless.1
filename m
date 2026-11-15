Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711466;
	b=DNhRIJCmygrnUH39Lk3z90jULflGDIBcDXLU6Ol3khr4jaGVTTSpsT8hLSjoXVGkqQko
	 9ub4/GagMFqbQTvk2GU+yYDUMTQTKE/ppZ1X3fC/jCimhs8Q7JEaLiwOdV1nscWL5b5wT
	 kGFF+z6VlYMFQAMAn1yGd1zWmuTxJWPLkMIePfoX1mJDwx8lug6hem1majo+ywfgMEKEC
	 vuZsXXfA4QReooHMgZq+/G8oQH+0DebqimeKFemlVwgS8TofpGL7vvbMPb291jxSPGvay
	 qC7NXdS5rjvhiDt8n0KpUXhnj6YhMIZMBDbBL/mnV7hRAYz41/hlEbyOpcn2mnO50jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711466;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=BV/Z5NIqNqorpUMIcX25JDSewYprhKxubZqUuDPCAWs=;
	b=YnEdnW5DNxxiRqCzzJzJ/whex/jCF01BOjm1ySHSUobgEpy1rSnCM6l7RLHrLnnq6BNC
	 ShdPRcVCTGadihykJoKR7Ht5DZHm/qQOimkfmaxjLhVYWX+pR26hgIbBoMD15LGaKCwSr
	 5N+1wh1I2gqxee6WYX+jCYG9Jlnx+932u2eTOF/SymY00G+vykeH40iZS1NHVChRhsF+5
	 KJ7VyYT8VFn+L5JcDN0PQqmtc1syrmeZasJ7/mDGTyPbDaoP4QiEptpc2T5DdACgF2wiF
	 QxlDaksVmBfK6yQB8hnI/UehDv3LD9ncpAaYVgZi+jKk5U+Zy/npOUY2An2asiSqJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lV8DxxJc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4D2606A327
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 02:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4D2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lV8DxxJc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF2vLKC12141482, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794711441; bh=BV/Z5NIqNqorpUMIcX25JDSewYprhKxubZqUuDPCAWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lV8DxxJc2v0Ckk0EpJkrAbL2Va1Vhh7waQGBsgQ1akYlF3c9GtFK+ehki9nMRirRn
	 6K6miyH4lOio0uwFxZ06foW3E4l8uI2FmYI6eG0nQT+t6NJIo83qwDL3b13CYMtAqq
	 SwOkwYjhUJ4Su0yFogL4oWbGxfFhiejKdR8gZAWAFZAmNRJ5xhlPFzfgMkLBHoUiRC
	 HtUUM3j2fQ3J4desjRUt0r/+SRBbNkSsNB2dizyfylmCGyo5dsGI9BJpiOSEggFMlo
	 WU9zMOeWK6cHJlYZzPgRrUph9hUU/Lgh5xEx/emkOWxr1zfZdpzlQa74RawrXJuZGa
	 ihnSJ/hy6Z7eQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF2vLKC12141482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 10:57:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 10:57:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 10:57:21 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: ph4ntom-rev <owner@ph4ntom-rev.uz>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
Subject: RE: [PATCH RFC net-next 0/2] wifi: rtw89: fix monitor mode RX
 filtering and enable raw packet injection
Thread-Topic: [PATCH RFC net-next 0/2] wifi: rtw89: fix monitor mode RX
 filtering and enable raw packet injection
Thread-Index: AQHdafoJ4NXzIeP2G0CSnWvXi0+7RLcZ9xAAgAGL1VD//51tAIATUzXw
Date: Sun, 15 Nov 2026 02:57:21 +0000
Message-ID: <20d94549347146e0b25926f7e91e1101@realtek.com>
References: <1a196d6dfbc.35537d221913104450.3720060455831933789@zoho.com>
 <1a19b7cce82.5dc2e93-44860545.1830508576953059669@zoho.com>
 <48b6758afb7844c8bdd6d8b775fd6bde@realtek.com>
 <1a19f4ae04e.52fd7adc-309223923.5560034215405031423@zoho.com>
In-Reply-To: <1a19f4ae04e.52fd7adc-309223923.5560034215405031423@zoho.com>
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

cGg0bnRvbS1yZXYgPG93bmVyQHBoNG50b20tcmV2LnV6PiB3cm90ZToNCj4gTW9yZSBzcGVjaWZp
Y2FsbHk6DQo+IDEuIEluIFJfQVhfUlhfRkxUUl9PUFQgKDB4Q0UyMCksIEJfQVhfQV9DUkMzMl9F
UlIgbXVzdCBiZSB1bm1hc2tlZCB3aGVuZXZlcg0KPiAgICBtYWM4MDIxMSBwYXNzZXMgRklGX0ZD
U0ZBSUwsIHdoaWNoIGlzIG5lY2Vzc2FyeSB0byBjYXB0dXJlIGNvcnJ1cHRlZC9hYm9ydGVkDQo+
ICAgIEFDS3MgYW5kIFJUUy9DVFMgZnJhbWVzIGluIG5vaXN5IGFpci4NCg0KSSB0aG91Z2h0IHRo
ZSBCX0FYX1NOSUZGRVJfTU9ERSBzZXQgc2hvdWxkIGJlIGluY2x1ZGVkIENSQ19FUlIgcGFja2V0
cy4gSSdsbA0KY2hlY2sgdGhpcyBpbnRlcm5hbGx5Lg0KDQo+IDIuIElmIEJfQVhfU05JRkZFUl9N
T0RFIGlzIGVuYWJsZWQgb24gQmFuZCAwIHdpdGhvdXQgc2V0dGluZyBwcm9taXNjdW91cyBtYXRj
aGluZw0KPiAgICBpbiB0aGUgQWRkcmVzcyBDQU0sIG5vbi1tYXRjaGluZyBCU1NJRCBjb250cm9s
IGZyYW1lcyBhcmUgZmlsdGVyZWQgYXQgdGhlIE1BQw0KPiAgICBDQU0gbGF5ZXIgcHJpb3IgdG8g
cmVhY2hpbmcgdGhlIFJfQVhfQ1RSTF9GTFRSIHJvdXRpbmcgbG9naWMuDQo+IA0KPiBGb3IgcmVm
ZXJlbmNlIG9uIG91ciBSVEw4ODUyQUUgdGVzdCBzeXN0ZW0gKFBDSSBJRCBbMTBlYzo4ODUyXSwg
SFAgc3Vic3lzdGVtDQo+IFsxMDNjOjg4ZTFdKSwgdGhlIGRlZmF1bHQgcmVnaXN0ZXIgdmFsdWVz
IG9uIGNoYW5uZWwgNSBhZnRlciBtb25pdG9yIG1vZGUgZW50cnkNCj4gd2l0aG91dCBvdXIgcGF0
Y2g6DQo+ICAgUl9BWF9SWF9GTFRSX09QVCAoMHhDRTIwKTogMHgwMDAyMDAwMCAgKEJfQVhfU05J
RkZFUl9NT0RFIHNldCwgQ1JDMzIgZXJyb3IgZHJvcHBlZCkNCj4gICBSX0FYX0NUUkxfRkxUUiAg
ICgweENFMjQpOiAweDU1NTU1NTU1DQo+ICAgUl9BWF9NR05UX0ZMVFIgICAoMHhDRTI4KTogMHg1
NTU1NTU1NQ0KPiAgIFJfQVhfREFUQV9GTFRSICAgKDB4Q0UyQyk6IDB4NTU1NTU1NTUNCg0KVGhl
IDB4Q0UyMCBJIGNhbiBzZWUgaXMgZGlmZmVyZW50IGZyb20geW91cnM6IChrZXJuZWwgNy4xLjUg
d2l0aG91dCBhbnkgY2hhbmdlKQ0KDQoxODYwY2UyMGggOiAwMzE3NDQzOCA1NTU1NTU1NSA1NTU1
NTU1NSA1NTU1NTU1NQ0KDQpJZiBJIHVzZSB0aGUgbGF0ZXN0IGRyaXZlciwgdGhlIGJpdCBCX0FY
X1NOSUZGRVJfTU9ERSBpcyBlbmFibGVkIChhZnRlciA3LjIpOg0KDQoxODYwY2UyMGggOiAwMzE3
NDQzOSA1NTU1NTU1NSA1NTU1NTU1NSA1NTU1NTU1NQ0KDQpDYW4geW91IHRyeSB0aGUgbGF0ZXN0
IGtlcm5lbCB3aXRob3V0IGFueSBtb2RpZmljYXRpb24/DQoNCj4gPiBJIGRpZCBzaW1pbGFyIHN0
ZXBzIHdpdGggcHJvZ3JhbSB3cml0dGVuIGluIEMsIGJ1dCBubyBwcm9ibGVtLg0KPiA+IENvdWxk
IHlvdSBzaGFyZSB0aGUgc2ltcGxlIFB5dGhvbiByYXcgc29ja2V0IHNjcmlwdCBhcyBhdHRhY2ht
ZW50IHRoYXQgeW91IGNhbg0KPiA+IHJlcHJvZHVjZSBOVUxMIHZpZiBwb2ludGVyIGluIHlvdXIg
c2lkZT8gKEkgdGhpbmsgcmFkaW90YXBfbnVsbF9kYXRhX2ZyYW1lIGFib3ZlDQo+ID4gaXMgYSBw
c2V1ZG8gY29kZSkuDQo+ID4NCj4gPiBEb2VzIGV2ZXJ5IGluamVjdGlvbiBjYXVzZSBOVUxMIHZp
Zj8gT3Igc29tZSB1bmRlciBjZXJ0YWluIGNvbmRpdGlvbnM/DQo+ID4gSW4gbXkgc2lkZSwgSSBo
YXZlIG5ldmVyIHNlZW4gdGhhdCB3aXRoIHJhd19zb2NrZXQgaW5qZWN0aW9uLg0KPiANCj4gVGhl
IGRpZmZlcmVuY2UgY29tZXMgZG93biB0byBob3cgdGhlIG1vbml0b3IgaW50ZXJmYWNlIHdhcyBp
bnN0YW50aWF0ZWQ6DQo+IC0gSWYgYSBtb25pdG9yIGludGVyZmFjZSBpcyBjcmVhdGVkIGFzIGEg
dmlydHVhbCBzdWItaW50ZXJmYWNlIGFsb25nc2lkZSBhbg0KPiAgIGV4aXN0aW5nIHN0YXRpb24g
aW50ZXJmYWNlIChlLmcuLCBgaXcgZGV2IHdsYW4wIGludGVyZmFjZSBhZGQgbW9uMCB0eXBlIG1v
bml0b3JgKSwNCj4gICBtYWM4MDIxMSBtYXkgcmV0YWluIGFuIGFzc29jaWF0ZWQgc2RhdGEvdmlm
IHJlZmVyZW5jZS4NCj4gLSBIb3dldmVyLCB3aGVuIHRoZSBwaHlzaWNhbCBpbnRlcmZhY2UgaXRz
ZWxmIGlzIHN3aXRjaGVkIGRpcmVjdGx5IGludG8gYSBwdXJlLA0KPiAgIHN0YW5kYWxvbmUgbW9u
aXRvciBtb2RlOg0KPiAgICAgIyBpcCBsaW5rIHNldCB3bGFuMCBkb3duDQo+ICAgICAjIGl3IGRl
diB3bGFuMCBzZXQgdHlwZSBtb25pdG9yDQo+ICAgICAjIGlwIGxpbmsgc2V0IHdsYW4wIHVwDQo+
ICAgSW4gdGhpcyBtb2RlLCBuZXQvbWFjODAyMTEvdHguYyAoaWVlZTgwMjExX21vbml0b3Jfc3Rh
cnRfeG1pdCgpKSBpcyBjYWxsZWQNCj4gICB3aXRob3V0IGFuIGFzc29jaWF0ZWQgb3BlcmF0aW9u
YWwgVklGLiBDb25zZXF1ZW50bHksIG1hYzgwMjExIGV4cGxpY2l0bHkgc2V0cw0KPiAgIGluZm8t
PmNvbnRyb2wudmlmID0gTlVMTC4NCg0KTXkgdGVzdCByZXN1bHRzIGFyZSB0aGUgb3Bwb3NpdGUg
b2YgeW91cnMuDQoNClRoZSBzdGFuZGFsb25lIHdvcmtzIHdlbGwgdG8gbWUsIG5vIHZpZiA9IE5V
TEwgY2FzZS4gDQoNCkZvciBjb25jdXJyZW50IHdsYW4wICsgbW9uMCBjYXNlLiBJIHVwIHR3byBp
bnRlcmZhY2VzLCBhbmQgcnVuIHlvdXIgc2NyaXB0IG9uDQplYWNoIG9mIHRoZW0uIA0KSWYgSSBk
aWQgaW5qZWN0IG9uIHdsYW4wLCBpdCBvYnZpb3VzbHkgY2FuJ3Qgc2VuZCBvdXQgYmVjYXVzZSB2
aWYgdHlwZSBpc24ndA0KbW9uaXRvci4gDQpJZiBJIGRpZCBpbmplY3Qgb24gbW9uMCwgaXQgY3Jh
c2hlcyBhcyB3aGF0IHlvdXIgZmlyc3QgcGF0Y2ggd2FudCB0byBwcmV2ZW50Lg0KDQpCdXQgYW55
d2F5LCBJIGhhdmUgc2VlbiB3aGF0IHlvdSB3YW50IHRvIGZpeC4NCg0K
