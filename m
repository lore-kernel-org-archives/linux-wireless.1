Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961566;
	b=E61nyMt3dIH7dLnQ+Ts7txxRdoKZoACy129bLlRxKP4af9j8U+C/X62FFZSvs/r7AlVx
	 bbgb60m+8Y5d9w54JawkMtTn6LL4jp63620rS2X6NA4Grz49GlSLuTo1PrL3SbG+A4+be
	 aljYSrV/ZBw5eNdwTDcUQKldzi+gDsaL2ImvplrJnV79w4Awdf2dvbuKOJuNU6382unwl
	 C+jgSPI6f/AZ3JtqQPnU51Zql4DJvLylPEppdPZBQJagey46t1MBuxcXsX4M18WC5Bk29
	 HIDPW1m/lv7ZNjpl/950balXpZJIthOJ1tknIs76CPRIdCZAXyL0vWRLjCe9X3Bdq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961566;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=FzE7gLKg1OTzTgCIwrnCtdrb1qb6sYMfsgUvspRs+Lc=;
	b=l4/UzoaoNYchLSjjMiZEVT2MPHmYiPg4OvcyB/iViUtzRUtRc13tq5eVdoBP0akQFtMF
	 ABni1qXEQaf9uwyBDvSoPqRZEo1Dw7GCp5ocE40OsYpH4Cn2Ef0Bdzbl+U0flqxJwuhTc
	 7Zs+ZeaKUe79W+itWP/yhI8wliRmc24wvBttixoaiWc7q6LbbT/n3StsJydP0hzXdPfG+
	 YMHuH0qNLr057Txjiff0SLd8aqD0slbtLZ2fPbO+mXa338fhJQk9ZQiea+bicemKcuyLr
	 /hj1Lj1W1sES40gxVy7KtISn2VZeAh7z9VU0FkngnSyF/WG8Ioiwsi0qSsCk0bnGwOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J6CtUEH6;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC0606A31C;
	Wed, 18 Nov 2026 00:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J6CtUEH6
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI0Pf4H2775622, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794961542; bh=FzE7gLKg1OTzTgCIwrnCtdrb1qb6sYMfsgUvspRs+Lc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=J6CtUEH6YL56YmXItbMd8vFrS0mLVu1iCFwtgWR/SZ1cN/Yat8hcwoB+m4Gh/0+jy
	 2DOicFBBFnsBd2PPa8NyF/MFmoGISTcvQ6PffxL4J6ODZVvy8tFqkIL67UtFVKTwon
	 cdJwWU3VZNJBo3FTfautZ2K4uDC35OXH0WiKNC3sGBKhciArIXncVKzgmfOgNWWjkK
	 JPocKYlQqFEtLx7vEQ2Z8UEphRtT47xY+p17ALkP9+95Nmg9Kh3iW2rG/RB+RR6idk
	 rD+V81mRydzhp6tR3WElYCCdklVyJb+Go3bX1cSkh67L4ms/kbyv2dE2GdnRKldbS/
	 IVUX3CcPLukUA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI0Pf4H2775622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 08:25:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 08:25:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 08:25:42 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Zeshan Ahmed Nobin
	<zeshanahmednobin@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kalle Valo
	<kvalo@kernel.org>
Subject: RE: [PATCH rtw-next v3 2/2] wifi: rtw88: 8822c: ignore nrx values
 without CCK PD registers
Thread-Topic: [PATCH rtw-next v3 2/2] wifi: rtw88: 8822c: ignore nrx values
 without CCK PD registers
Thread-Index: AQHddT6xhEieifs1MkKPJ2YdDVTuQ7cx0FCg///rKACAAT4bYA==
Date: Wed, 18 Nov 2026 00:25:41 +0000
Message-ID: <7ec3ca20e62d4a34811492a21619cf6d@realtek.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
 <20261115201826.181662-3-zeshanahmednobin@gmail.com>
 <427f6f2e79474058958c3f3d0901df38@realtek.com>
 <8023529A-60D3-4708-9772-027436BF7756@linux.dev>
In-Reply-To: <8023529A-60D3-4708-9772-027436BF7756@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciAx
NywgMjAyNiA3OjM4OjIxIEFNIEdNVCswMTowMCwgUGluZy1LZSBTaGloDQo+IDxwa3NoaWhAcmVh
bHRlay5jb20+IHdyb3RlOg0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiBTaW5jZSB0aGlzIG9ubHkg
Y2FuIGhhcHBlbiB3aGVuIGEgZGV2aWNlIGlzIHJlbW92ZWQgc3VkZGVubHksIGhvdyBhYm91dA0K
PiA+IHJldmVydGluZyBwYXRjaCAxLCBhbmQgYWxzbyB2YWxpZGF0ZSBidyA8PSBSVFdfQ0hBTk5F
TF9XSURUSF80MCBoZXJlLg0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgcnR3X3NldF9jaGFu
bmVsKCkgc3RvcmVzIHRoZSBiYW5kd2lkdGggaW4gaGFsIGFuZA0KPiBwYXNzZXMgdGhlIHNhbWUg
dmFsdWUgdG8gdGhlIGNoaXAncyBzZXRfY2hhbm5lbCBjYWxsYmFjay4gV2UgYWxyZWFkeQ0KPiB1
c2UgaGFsLmN1cnJlbnRfYmFuZF93aWR0aCB3aGVuIHNldHRpbmcgVFggcG93ZXIuDQo+IA0KPiBD
Q0sgUEQgYWxyZWFkeSBjaGVja3MgaGFsLmN1cnJlbnRfYmFuZF90eXBlIGFuZCBvbmx5IHJ1bnMg
b24gMi40IEdIeiwNCj4gd2hlcmUgdGhlIGJhbmR3aWR0aCBpcyAyMCBvciA0MCBNSHouIFNvIEkg
dGhpbmsgdXNpbmcgdGhlIHN0b3JlZCB2YWx1ZQ0KPiBoZXJlIGlzIHJlYXNvbmFibGUgdG9vLiBJ
dCBhdm9pZHMgYW5vdGhlciByZWdpc3RlciByZWFkIGFuZCBrZWVwcyBhDQo+IGZhaWxlZCByZWFk
IGZyb20gYmVjb21pbmcgdGhlIGJhbmR3aWR0aCBpbmRleC4NCj4gDQo+IFdvdWxkIHlvdSBiZSBv
a2F5IHdpdGgga2VlcGluZyBwYXRjaCAxIGFuZCB1c2luZyBucnggPiBSRl9QQVRIX0IgaW4NCj4g
cGF0Y2ggMiwgYXMgeW91IHN1Z2dlc3RlZD8NCg0KRnJvbSByZXZpZXcgcG9pbnQgb2Ygdmlldywg
dmFsaWRhdGlvbiB0aGUgcmVhZCB2YWx1ZSBmcm9tIHJlZ2lzdGVycw0KaXMgZWFzaWVyLiANCg0K
VG8gcmV2aWV3IHBhdGNoIDEsIHJldmlld2VycyBzaG91bGQgdHJhY2UgdGhlIGNvZGUgdG8gdW5k
ZXJzdGFuZCBob3cgDQpSRUdfVFhCV0NUTCBpcy4gSW4gZHJpdmVyIHNpZGUsIHllcywgaXQgaXMg
b25seSBtb2RpZmllZCBieQ0KcnR3X3NldF9jaGFubmVsKCksIGJ1dCBjYW4geW91IGVuc3VyZSBm
aXJtd2FyZSBkb2Vzbid0IGNoYW5nZSBpdA0KKGl0IHNob3VsZCBub3QpPyANCg0KSSdkIHByZWZl
ciBzcXVhc2hpbmcgdHdvIHBhdGNoZXMgaW50byBvbmUsIGFuZCBqdXN0IHZhbGlkYXRlIHRoZQ0K
cmVhZCB2YWx1ZXMuIENvbW1pdCBtZXNzYWdlIGNhbiBiZSBhbHNvIHNpbXBsZXIuIA0KDQoNCg==
