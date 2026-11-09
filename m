Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196411;
	b=iLYdaHLZq2CIr/92ZqMg3NlUbSUjKZzB07+IurKZLuC7qplLOy8+zQpQhnLP8ZGAU27b
	 huLJfcEjIuUHop8T4RiPYfeyRTTkrlMx4d2lOU0ReZJVZwQopPoJhvx7CMUriG0Gjs2Rs
	 H3skrBO67i2YQNc11XapfxLxsz5oc472cd1aVESi9QvE50lnL1nZEEVGWRMTuqNNTy/BE
	 AKnGAZSNP89ROhcrryvtjVSSoEJ2PF8cidN2+tFAVyGye9221Tu3W6+NpeOQPoy/gfr01
	 qsJAPul56XOEPkvD/wnLS/dDuAa07edWAKfJLugSZBiw1ePuwC8ipF5rWtfcXovGCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196411;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=1roUKFm9HQ3G8hfvlTu0U+/zmL1WicoISxzziLR612k=;
	b=Nu7e42FHUXdp/RFBbORrPCHWjmwqtFpyGS83G9rs/sAlj+R0AWvKtgAkLoBJz60Zwf1L
	 jzPcCY6NsIisq59qdd7w3gU4vo9Dmm9xMQv4Btra1n709OeF3AiNhuEcdXgG/PqqYFlbX
	 HUnLofTaUfPVagLWgwkkbgtLtm85YqKvoUTFR5MZyB2YwK0b58jJqA7CWwOIoNWmzY1MM
	 65cRfWK9JNAp9Dk3IUDtU+TGlF/zamrQxnlY+csnoNSUFlbreLtXOfN00ly1+OpSey50b
	 BkBMBRlFu0ISdF9H7qw8hsGwMc9ylqUW9G3RiTJ2U7RWioaNYFa7YzqQJXKiLw9hniQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Lnz7sfjK;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1A8606A326
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 03:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Lnz7sfjK
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A93rE9v94004623, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794196394; bh=1roUKFm9HQ3G8hfvlTu0U+/zmL1WicoISxzziLR612k=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Lnz7sfjKhlM8gEkVEiVhERuHCDi70wGsh0fQlIcX1RP8XJRVArJS0AakM7QfdthY3
	 zqPc4gJ3R/nzGmMZtwPNLsUzIWQFOA13JcW54ap22dJ0066YYmmBkkWjybhwujRehi
	 bdSYL1DodzZAOf3VQFtRtSJugQ+7vCLbN7EiGPsL+hGTj6GM73Gt2pX29jRo8Gj1aF
	 J5YGxAPC61oCS6t5YXikRxxhSad2YrGO8sJ3sYouHm5FRnaa7lVlviVG2PEoqjMXFC
	 1NPBEPqPDtD++28s2h1SlGbP4K4cFPqSjgef6whoKDNzu9usqDvZxhjigLcVfDIoZx
	 IcqSmjCpO4TGA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A93rE9v94004623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 11:53:14 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:53:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:53:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 11:53:14 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Shalok Shalom <shalokshalom@protonmail.ch>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [Bug report] rtw89_8852ae: WoWLAN resume fails with "c2h reg
 timeout" and "failed to resume for wow -110" on s2idle
Thread-Topic: [Bug report] rtw89_8852ae: WoWLAN resume fails with "c2h reg
 timeout" and "failed to resume for wow -110" on s2idle
Thread-Index: AQHdYgJYOT/yKLNJnUCGKj74QS1/DrclNsXw
Date: Mon, 9 Nov 2026 03:53:14 +0000
Message-ID: <79a2803d1fa943729cdd086fd5f4e84b@realtek.com>
References: <zvVKbBQduN7iovmmy-oy6UZgR0AOBhnGgl9YuUrYtH48IGxvXoTr-iRZbEp-XyQgxq7LNuQxwRJ16cjQziq2sUKpe4b8UeSr6cNS46TBJQM=@protonmail.ch>
In-Reply-To: <zvVKbBQduN7iovmmy-oy6UZgR0AOBhnGgl9YuUrYtH48IGxvXoTr-iRZbEp-XyQgxq7LNuQxwRJ16cjQziq2sUKpe4b8UeSr6cNS46TBJQM=@protonmail.ch>
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

U2hhbG9rIFNoYWxvbSA8c2hhbG9rc2hhbG9tQHByb3Rvbm1haWwuY2g+IHdyb3RlOg0KPiBIaSwN
Cj4gDQo+IEkgYW0gcmVwb3J0aW5nIGEgcmVwcm9kdWNpYmxlIGZhaWx1cmUgaW4gdGhlIGBydHc4
OWAgZHJpdmVyIGZvciB0aGUgUmVhbHRlayBSVEw4ODUyQUUgKFBDSWUpIHdoZW4gdXNpbmcNCj4g
V2FrZS1vbi1XTEFOIChXb1dMQU4pIHdpdGggYHMyaWRsZWAgc3VzcGVuZC4gVGhpcyBkb2VzIG5v
dCBoYXBwZW4gYWx3YXlzLCBidXQgZnJlcXVlbnRseS4NCj4gVGhlIHN5c3RlbSBmYWlscyB0byBy
ZXN1bWUgZnJvbSBzdXNwZW5kIHdoZW4gYSBtYWdpYyBwYWNrZXQgaXMgcmVjZWl2ZWQsIGFuZCB0
aGUga2VybmVsIGxvZyBzaG93cyBhDQo+IGZpcm13YXJlIGNvbW11bmljYXRpb24gdGltZW91dCBm
b2xsb3dlZCBieSBhIGZhaWx1cmUgdG8gc3dhcCBiYWNrIHRvIG5vcm1hbCBmaXJtd2FyZS4NCj4g
DQo+IFRoZSBmYWlsdXJlIGJlZ2lucyBhdCBgcnR3ODlfZndfcmVhZF9jMmhfcmVnKClgICh0aGUg
QzJIIHRpbWVvdXQpLCB3aGljaCBjYXNjYWRlcyBpbnRvIHRoZSBBT0FDIHJlYWQNCj4gZmFpbHVy
ZSBhbmQgdGhlIGZpcm13YXJlIHN3YXAgZmFpbHVyZSAoYC0xMTBgKS4gVGhlIGRyaXZlcidzIHJl
Y292ZXJ5IHBhdGggaGFzIGJlZW4gaGFyZGVuZWQgYWdhaW5zdA0KPiBhIHN1YnNlcXVlbnQgY3Jh
c2ggKENWRS0yMDI1LTIxNzMwKSwgYnV0IHRoZSBpbml0aWFsIHRpbWVvdXQgb24gdGhlIFBDSWUg
aW50ZXJmYWNlIGR1cmluZyBgczJpZGxlYCByZXN1bWUNCj4gaXMgbm90IHJlc29sdmVkIGJ5IGFu
eSBwYXRjaCBJIGNvdWxkIGlkZW50aWZ5IGluIHRoZSBjdXJyZW50IHNvdXJjZSB0cmVlLg0KPiAN
Cj4gDQo+IEhhcmR3YXJlIGFuZCBTb2Z0d2FyZSBFbnZpcm9ubWVudA0KPiANCj4gLSAgIExhcHRv
cDogTGVub3ZvIFlvZ2EgNyBDYXJib24gMTRBQ042DQo+IA0KPiAtICAgV2ktRmk6IFJlYWx0ZWsg
UlRMODg1MkFFIChQQ0llKQ0KPiANCj4gLSAgIEtlcm5lbDogNy4yLjExLXplbjEtMS16ZW4gKFpl
biBicmFuY2gpIGFuZCA2LjE4LjU3LTIgKExUUyBicmFuY2gpDQo+IA0KPiAtICAgRmlybXdhcmU6
IHJ0dzg4NTJhX2Z3LTEuYmluLCB2ZXJzaW9uIDAuMTMuMzYuMg0KPiANCj4gLSAgIFNsZWVwIHN0
YXRlOiBzMmlkbGUgKFMzIGlzIG5vdCBleHBvc2VkIGJ5IHRoZSBmaXJtd2FyZTsgY29uZmlybWVk
IHZpYSBgY2F0IC9zeXMvcG93ZXIvbWVtX3NsZWVwYCkNCj4gDQo+IC0gICBXb1dMQU4gdHJpZ2dl
cjogbWFnaWMtcGFja2V0IG9ubHkgKGBpdyBwaHkwIHdvd2xhbiBlbmFibGUgbWFnaWMtcGFja2V0
YCkNCj4gDQo+IA0KPiANCj4gDQo+IFN0ZXBzIHRvIFJlcHJvZHVjZQ0KPiANCj4gMS4gIEVuYWJs
ZSBXb1dMQU46IGBzdWRvIGl3IHBoeTAgd293bGFuIGVuYWJsZSBtYWdpYy1wYWNrZXRgDQoNClBs
ZWFzZSB0cnkgdG8gZGlzYWJsZSBkM2NvbGQgYmVmb3JlIGVudGVyaW5nIHN1c3BlbmQuDQoNCmVj
aG8gMCA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxkZXZpY2VfYWRkcmVzcz4vZDNjb2xkX2FsbG93
ZWQNCg0KVXNlICdsc3BjaScgdG8gY2hlY2sgdGhlIDxkZXZpY2VfYWRkcmVzcz4uDQoNCj4gDQo+
IDIuICBTdXNwZW5kOiBgc3lzdGVtY3RsIHN1c3BlbmRgDQo+IA0KPiAzLiAgU2VuZCBhIFdvTCBt
YWdpYyBwYWNrZXQgdG8gdGhlIGxhcHRvcCdzIFdpLUZpIE1BQyBhZGRyZXNzIGZyb20gYW5vdGhl
ciBkZXZpY2Ugb24gdGhlIHNhbWUgbmV0d29yay4NCj4gKFZpYSBPcGVuV09MIGZyb20gQW5kcm9p
ZCkNCj4gDQo+IDQuICBPYnNlcnZlOiB0aGUgbGFwdG9wIGRvZXMgbm90IHdha2UuDQo+IA0KPiAN
Cj4gDQo+IE91dHB1dCBvZiBsc3BjaSAtbm5rDQo+IA0KPiAwMTowMC4wIE5ldHdvcmsgY29udHJv
bGxlciBbMDI4MF06IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDby4sIEx0ZC4gUlRMODg1MkFFIDgw
Mi4xMWF4IFBDSWUgV2lyZWxlc3MNCj4gTmV0d29yayBBZGFwdGVyIFsxMGVjOjg4NTJdDQo+IFN1
YnN5c3RlbTogTGVub3ZvIERldmljZSBbMTdhYTo0ODUyXQ0KPiBLZXJuZWwgZHJpdmVyIGluIHVz
ZTogcnR3ODlfODg1MmFlDQo+IEtlcm5lbCBtb2R1bGVzOiBydHc4OV84ODUyYWUNCj4gDQo+IEFj
dHVhbCBCZWhhdmlvcg0KPiANCj4gVGhlIHN5c3RlbSBmYWlscyB0byByZXN1bWUgZnJvbSBgczJp
ZGxlYC4gVGhlIGZvbGxvd2luZyBgZG1lc2dgIHNlcXVlbmNlIGlzIGNhcHR1cmVkIGFmdGVyIGEg
ZmFpbGVkDQo+IHdha2UgYXR0ZW1wdDoNCj4gDQo+IFsgMjM1OS41NDM1NTldIHJ0dzg5Xzg4NTJh
ZSAwMDAwOjAxOjAwLjA6IGMyaCByZWcgdGltZW91dFsgMjM1OS41NDM1NjNdIHJ0dzg5Xzg4NTJh
ZSAwMDAwOjAxOjAwLjA6IHdvdzoNCj4gZmFpbGVkIHRvIGdldCBhb2FjIHJwdCBieSByZWcNCj4g
WyAyMzU5LjY0NDgwMl0gcnR3ODlfODg1MmFlIDAwMDA6MDE6MDAuMDogd293OiBmYWlsZWQgdG8g
Z2V0IGFvYWMgcnB0IGJ5IHBrdA0KPiBbIDIzNjAuMzA1MjcwXSBydHc4OV84ODUyYWUgMDAwMDow
MTowMC4wOiBmYWlsZWQgdG8gY2hlY2sgd293IHN0YXR1cyBkaXNhYmxlZA0KPiBbIDIzNjAuMzA1
Mjc4XSBydHc4OV84ODUyYWUgMDAwMDowMTowMC4wOiB3b3c6IGZhaWxlZCB0byBjaGVjayBkaXNh
YmxlIGZ3IHJlYWR5DQo+IFsgMjM2MC4zMDUyODBdIHJ0dzg5Xzg4NTJhZSAwMDAwOjAxOjAwLjA6
IHdvdzogZmFpbGVkIHRvIHN3YXAgdG8gbm9ybWFsIGZ3DQo+IFsgMjM2MC4zMDUyODJdIHJ0dzg5
Xzg4NTJhZSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBkaXNhYmxlIHdvdw0KPiBbIDIzNjAuMzA1
Mjg1XSBydHc4OV84ODUyYWUgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gcmVzdW1lIGZvciB3b3cg
LTExMA0KPiBbIDIzNjEuOTE2NjU3XSBydHc4OV84ODUyYWUgMDAwMDowMTowMC4wOiBydHc4OV9o
d19zY2FuX29mZmxvYWQgZmFpbGVkIHJldCAtMTEwDQo+IFsgMjM2MS45MjE0NzVdIHJ0dzg5Xzg4
NTJhZSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBzZXQgd2FrZXVwIGV2ZW50DQo+IFsgMjM2MS45
MjE0ODNdIHJ0dzg5Xzg4NTJhZSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBzdXNwZW5kIGZvciB3
b3cgLTENCg0KU2luY2UgeW91IGRpZG4ndCBzaGFyZSB0aGUgbG9nIGJlZm9yZSB0aGVzZSBlcnJv
cnMsIEkganVzdCBndWVzcyB0aGUgZGV2aWNlIGdvdCBsb3N0DQpmcm9tIGQzY29sZCByZXN1bWUu
IFBsZWFzZSB0cnkgdGhlIGNvbW1hbmQgYWJvdmUuDQoNCg0KDQo=
