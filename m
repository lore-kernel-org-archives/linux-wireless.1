Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794374563;
	b=4N9sydJuSyo2B9En3IEc9TR3ttcI5w6BxyouoV8URjoNXLuhwHYhq7wldZ3I8Dbu3pS+
	 y0JcvcfrtvLE0bvk+qMnc1BSr3n+aJLrOP0kZjQdmb0RPFpXNIkL4IQNkKmAEO7Jk3uNn
	 3hOuWhVOSuqPYkqR+jTZAoQ23Hrl87DUY5PXycwciy5fo3B6OlsuXhKW2WIslqyxEeJgk
	 CcAwaai1ifrY11LZnhDD7LUF6+D1/qT9hW9yvPM6cqshpbmwi8lQ0SNY8GX48a7EaeJ05
	 e3Jmb9/rD5KMmo6WGtKiVM7su/ZL6AOIWHGOkAUH+c1IxnCrzVrFx0JVQm/3c70dZLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374563;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=olULrCy8N410ix5hyNXR6Ni0eo6KArvvPjHxonm34m0=;
	b=DlrQ29t5iD+yUqlTJAyvoBI/a7opgzd2PgT7iU0PsXRfgIuynB4LPBSI3vEjCuZG+8AM
	 ETEW+CktTes4vpsj4uAtdi+9WKGMdc6/4yh6hL4jUtvRq/5tX0pKxLxUNdGcg14qvmpZ/
	 vTYeUnRTYjUfzEGYCIpP+CHN5F3bRPqJsBO82unv3ba0cNJTEtkAQF7Lms+1MUai/Mm3H
	 HtP1CKjduWhkq/kDmxE8aJONpq9A93owwyH0WYgTNolPUhMmXlwgvWQQ8FwrK/PoqKM0P
	 zX/f0fotPeC8diwR/Kh6TjfytHnVrMFKDVVQwIDnVB1qgUhQ2og5XSwrhPV0rP3nSKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=XBEgrX8h;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA096606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 05:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA096606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=XBEgrX8h
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB5MPR902097213, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794374545; bh=olULrCy8N410ix5hyNXR6Ni0eo6KArvvPjHxonm34m0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=XBEgrX8hriU4GR3l08FLlb23uhY1e/q9id0pPQPrKfdVwi+ZVZnjldTKnLwqwi753
	 bveCQg9EMwHcNOLXJFmK3VeH4LmXIJHsQbqZbpx+sqKgsa8Hv55cGiA7EzT6sz7C+r
	 yLpVqGOJWxY+bE/vck7IOeKcECnOdANzwi1Wl/uO2XaAw5+sxZXu/DT5upSx4qGBST
	 +s/NhKnIYue7atWcuC7NyOXric697Cncn9gR5uTvic2tcRrSFo6KbcTGdD6AAKlHmy
	 ovv4481AKH3Rz1n3WcRexzc9DnBFYIifE9t8Qhrz9pOcESaeXSOLlPu0L9g13RjoOR
	 r14ourcqq+CTw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB5MPR902097213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 13:22:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 13:22:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 13:22:24 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "igor@listopad.email" <igor@listopad.email>
Subject: RE: [RFC] Adding RTL8189ES SDIO support to rtw88
Thread-Topic: [RFC] Adding RTL8189ES SDIO support to rtw88
Thread-Index: AQHdcNYdZsJj5Khlj02TxSdgu8UcxrcmdvGAgAHELUA=
Date: Wed, 11 Nov 2026 05:22:23 +0000
Message-ID: <d34cd45d652f4b88a02c4795b0e1aaf2@realtek.com>
References: <A11FF135-696D-4107-B5FC-BBBB05303926@listopad.email>
 <977DC5C2-4EB7-45BD-9663-69E4094EE596@linux.dev>
In-Reply-To: <977DC5C2-4EB7-45BD-9663-69E4094EE596@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBIaSBJZ29yLA0KPiAN
Cj4gVGhhbmtzIGZvciBhc2tpbmcgYmVmb3JlIHNlbmRpbmcgaXQuIFBpbmctS2UgaGFzIHRoZQ0K
PiBmaW5hbCB3b3JkIG9uIHRoaXMsIHNvIHRoaXMgaXMgb25seSBteSB2aWV3IGFmdGVyIGFkZGlu
ZyBSVEw4NzIzQlMgdG8gdGhlDQo+IHJ0dzg4Lg0KPiANCj4gT24gTm92ZW1iZXIgMTAsIDIwMjYg
NTo1MDozOCBBTSBHTVQrMDE6MDAsIGlnb3JAbGlzdG9wYWQuZW1haWwgd3JvdGU6DQo+IA0KPiA+
IFdvdWxkIHN1cHBvcnQgZm9yIFJUTDgxODlFUyBTRElPIGRldmljZXMsIGJhc2VkIG9uIHRoZSBS
VEw4MTg4RSBULXNlcmllcw0KPiA+IChTRElPIElEIDAyNGM6ODE3OSksIGJlIHdlbGNvbWUgaW4g
cnR3ODg/DQo+IA0KPiBJIHRoaW5rIHNvLiBBcyBmYXIgYXMgSSBjYW4gc2VlIG5vdGhpbmcgaW4g
dGhlIGtlcm5lbCBiaW5kcyB0aGlzIFNESU8gSUQNCj4gdG9kYXkuIHJ0bHdpZmkgaGFzIFJUTDgx
ODhFRSBvbiBQQ0llIGFuZCBydGw4eHh4dSBoYXMgUlRMODE4OEVVIG9uIFVTQiwNCj4gd2hpbGUg
cnR3ODggYWxyZWFkeSBoYXMgdGhlIFNESU8gY29kZSBhbmQgb3RoZXIgODA1MSBiYXNlZCA4MDIu
MTFuIGNoaXBzDQo+IGxpa2UgUlRMODcwM0IgYW5kIFJUTDg3MjNCLg0KDQpNYXliZSBvbmUgZGF5
IHBlb3BsZSBjYW4gbW92ZSBSVEw4MTg4RUUgdG8gcnR3ODggYXMgd2VsbC4gRm9yIG5vdywNCnJ0
dzg4IGlzIG9ubHkgb25lIGRyaXZlciBzdXBwb3J0aW5nIFJlYWx0ZWsgV2lGaSBTRElPLCBzbyBs
ZXQncyBhZGQNClJUTDgxODlFUyB0byBydHc4OC4gDQoNCj4gDQo+IE9uIG15IFJUTDg3MjNCUyBz
ZXJpZXMgUGluZy1LZSBzYWlkIGl0IGlzbid0IHNvIGdvb2QgdG8gbWFpbnRhaW4gdGhyZWUNCj4g
aW50ZXJmYWNlcyBpbiB0aGUgdHJlZSBkcml2ZXJzLCBidXQgaGUga2VwdCB0aGUgZXhpc3Rpbmcg
b25lcyBhbmQgdG9vayB0aGUNCj4gbmV3IG9uZS4gU28gSSB3b3VsZCBleHBlY3QgdGhlIHNhbWUg
c3BsaXQgdG8gYmUgYWNjZXB0YWJsZSBoZXJlLg0KPiANCj4gUmVmdXNpbmcgY3V0IEkgc2VlbXMg
ZmluZSB0b28uIHJ0bDh4eHh1IGRvZXMgdGhlIHNhbWUgZm9yIFJUTDgxODhFVS4NCj4gDQo+IFsg
Li4uIF0NCj4gDQo+ID4gVGhlIGltcGxlbWVudGF0aW9uIGFkZHMgY2hpcCBvcGVyYXRpb25zLCBy
ZWdpc3RlciB0YWJsZXMsIGZpcm13YXJlLA0KPiA+IGFuZCBhbiBTRElPIGJpbmRpbmcuDQo+IA0K
PiBUaGUgZmlybXdhcmUgaW4gdGhlIFBSIGlzIGJ5dGUgZm9yIGJ5dGUgdGhlIHNhbWUgYXMNCj4g
cnRsd2lmaS9ydGw4MTg4ZXVmdy5iaW4sIHdoaWNoIGlzIGFscmVhZHkgaW4gdGhlIGZpcm13YXJl
IHJlcG9zaXRvcnkgYW5kDQo+IHdoaWNoIHJ0bDh4eHh1IHVzZXMuIFNvIEkgZG9uJ3QgdGhpbmsg
eW91IG5lZWQgYSBuZXcgYmxvYi4gWW91IGNvdWxkDQo+IHJlcXVlc3QgdGhhdCBuYW1lLCBvciBh
ZGQgYSBMaW5rOiBpbiBXSEVOQ0UgaWYgUGluZy1LZSBwcmVmZXJzIGFuIHJ0dzg4DQo+IHBhdGgu
DQoNCkkgcHJlZmVyIGEgTGluay4gT25lIGRheSBydHc4OCBjYW4gc3VwcG9ydCBSVEw4MTg4RUUs
IGFuZCByZW1vdmUgUlRMODE4OEVFDQpmcm9tIHJ0bHdpZmkuIEl0J2QgYmUgZWFzaWVyIHRvIG1v
dmUgZmlybXdhcmUgZnJvbSBydGx3aWZpLyB0byBydHc4OC8NCg0KPiANCj4gWyAuLi4gXQ0KPiAN
Cj4gPiBXb3VsZCB0aGlzIGJlIGFuIGFjY2VwdGFibGUgZGlyZWN0aW9uIGZvciBydHc4OD8gQXJl
IHRoZXJlIGFyY2hpdGVjdHVyYWwNCj4gPiBjb25jZXJucyBvciByZXF1aXJlbWVudHMgdGhhdCBz
aG91bGQgYmUgYWRkcmVzc2VkIGJlZm9yZSBzdWJtaXR0aW5nDQo+ID4gdGhlIHNlcmllcyBmb3Ig
cmV2aWV3Pw0KPiANCj4gRnJvbSBteSBxdWljayBza2ltIG9mIHRoZSBQUiwgSSB0aGluayB0aGUg
ZGlyZWN0aW9uIGlzIGZpbmUuIFdoYXQgSSB3b3VsZA0KPiB3b3JyeSBhYm91dCBpcyBob3cgbXVj
aCBpdCBjaGFuZ2VzIHRoZSBzaGFyZWQgY29kZS4gSXQgbmVlZHMgYW4gYWRkaXRpb25hbA0KPiAy
MCBjYWxsYmFja3MgaW4gcnR3X2NoaXBfb3BzIGFuZCBtb3JlIHRoYW4gMjAgY2hlY2tzIGZvciB0
aGlzIGNoaXAgaW4gdGhlDQo+IGNvcmUgYW5kIFNESU8gY29kZS4gT24gbXkgc2VyaWVzIFBpbmct
S2UgYXNrZWQgd2h5IHRoZSBleGlzdGluZyBsb2dpYw0KPiBkaWRuJ3Qgd29yayBmb3Igc3BlY2lh
bCBjYXNlcyBsaWtlIHRoZXNlLCBzbyBJIHdvdWxkIGV4cGVjdCBlYWNoIG9uZSB0bw0KPiBuZWVk
IGEgcmVhc29uLg0KPiANCj4gQSBmZXcgZXhhbXBsZXM6DQo+IA0KPiBydHc4MTg4ZS5jIGNhc3Rz
IHJ0d2Rldi0+cHJpdiB0byBzdHJ1Y3QgcnR3X3NkaW8sIGFuZCBub3RoaW5nIG91dHNpZGUNCj4g
c2Rpby5jIHVzZXMgdGhhdCBzdHJ1Y3QgdG9kYXkuIE1heWJlIHRob3NlIHBhcnRzIGNhbiBiZWNv
bWUgaGNpIG9wcy4NCj4gDQo+IHJ0d19zZGlvX3R4X2hhbmRsZXIoKSByZWFkcyBob3N0LT5zZGlv
X2lycV9wZW5kaW5nLCB3aGljaCBhcyBmYXIgYXMgSSBjYW4NCj4gc2VlIG9ubHkgdGhlIG1tYyBj
b3JlIHVzZXMgdG9kYXkuIFRYIGtlZXBpbmcgdGhlIElSUSB3b3JrZXIgYXdheSBmcm9tIHRoZQ0K
PiBob3N0IGFsc28gZG9lc24ndCBzb3VuZCBzcGVjaWZpYyB0byB0aGlzIGNoaXAsIHNvIEkgdGhp
bmsgdGhhdCB3YW50cyBhDQo+IGZpeCBpbiB0aGUgY29tbW9uIFNESU8gVFggcGF0aC4NCj4gDQo+
IHJ0dzgxODhlX2VmdXNlX2dyYW50KCkgYW5kIHJ0dzgxODhlX2ZhbHNlX2FsYXJtX3N0YXRpc3Rp
Y3MoKSBsb29rIHRoZSBzYW1lDQo+IGFzIHRoZSBydHc4NzIzeC5jIGhlbHBlcnMgdGhhdCBSVEw4
NzIzQiB1c2VzLiBNYXliZSB0aG9zZSBjYW4gYmUgc2hhcmVkDQo+IGluc3RlYWQgb2YgY29waWVk
Lg0KPiANCj4gQSBtb3JlIHRob3JvdWdoIHJldmlldyB3aWxsIGZvbGxvdyBvbmNlIHRoZSBzZXJp
ZXMgaXMgcG9zdGVkLg0KPiANCj4gRm9yIHRoZSBhY3R1YWwgc2VyaWVzLCBwbGVhc2UgYmFzZSBp
dCBvbiBydHctbmV4dCBpbnN0ZWFkIG9mIHRoZSBsd2Zpbmdlcg0KPiB0cmVlLiBTZXZlcmFsIG9m
IHRoZSBjb3JlIGZpbGVzIGRvbid0IGFwcGx5IHRoZXJlLCBhbmQgdGhlDQo+IExJTlVYX1ZFUlNJ
T05fQ09ERSBjaGVja3MgaGF2ZSB0byBnby4gSXQgYWxzbyBuZWVkcyB0aGUgS2NvbmZpZyBhbmQN
Cj4gTWFrZWZpbGUgZW50cmllcywgdGhlIGRldmljZSBJRCBpbiBzZGlvX2lkcy5oLCBhbmQgdGhl
IGZpeGVzIGZyb20geW91cg0KPiBsYXRlciBjb21taXRzIHNxdWFzaGVkIGludG8gdGhlIHBhdGNo
ZXMgdGhleSBmaXguIFRoZSBzaWduIG9mZiBzaG91bGQgdXNlDQo+IGEgcmVhbCBhZGRyZXNzIGlu
c3RlYWQgb2YgdGhlIEdpdEh1YiBub3JlcGx5IG9uZS4NCj4gDQo+IFlvdSBjYW4gYWxzbyB0YWtl
IGEgbG9vayBhdCBob3cgdGhlIFJUTDg3MjNCIHNlcmllcyB3ZW50IHVwc3RyZWFtIGZvcg0KPiBy
ZWZlcmVuY2UsIGZyb20gdGhlIFJGQyB0byB0aGUgdmVyc2lvbiB0aGF0IHdhcyBhcHBsaWVkOg0K
PiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtd2lyZWxlc3MvY292ZXIuMTc4NDA0
NzU2MS5naXQubHVrYS5nZWpha0BsaW51eC5kZXYvDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXdpcmVsZXNzLzIwMjYxMDA2MTMwNzAxLjEyMDQ2MC0xLWx1a2EuZ2VqYWtAbGludXgu
ZGV2Lw0KDQpBZ3JlZS4gTHVrYSwgVGhhbmtzIGZvciBzaGFyaW5nIHRoZXNlIGV4cGVyaWVuY2Vz
Lg0KDQoNCg==
