Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481600;
	b=ODi2Y/mJNU/49j5rS4kY03E28uACFvRcg4Yu/AbcfXwe3i3Zt/QRmR7lysLhnYBeGOrG
	 gn/G/3BWPcQIdMtXbk2OHd9xHJpIOTZD4tNPsgfZKoZjsJwL9eDho+7lkzy5zhYQ1oL/u
	 gC3zlFffJC0c9xkI2E1OXlJ7m1qt0cyVxGPYvhReAfk6EYThY5zuqEYgt5oZffEBmXdf8
	 m4lB6+b7vx/yeOiuoUxU8wulSB6s0e/h3LN3B/3uegeOu24qQvg9bgFMKbv2nqs1W0oOz
	 Nt2VqD7LpWoxSLzK/lAtk14gcIurjXn2PNJB2l7jSnGKUZQA/VHFQurSkgSzEbSRqMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481600;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=o/vxPPLw9J0tQcMFFd2KMuzm1glCzbbnkdJ8n2DVzK4=;
	b=BvbBnqVbmexjdfsQnBBHOFvYyTNTs66HY5NTz9u3edzBmQMg1OvhTAgKQDQKiUXJ4JKU
	 LtM1hcH9xgkVExoqN8hRv5AtmACO+aPidyxMZUonKQPvC9KQQJa6bs2+UX+lLcKsHSb2K
	 liJdd8pi/lIbayOjLFHvxCVTqo1/J2j64viYixjTnqFMEQOf1GoUi485BSY6N5zQRBlZS
	 xDH7SvFqEPyDVoA19mdmd/K/l9toA8GfJfLrhFJJEWt33wFLC1dMcqbn4ZZlzfQ7V94D8
	 NT/XdFKutpN9D5+fMlLW7v/RkFBTHkKlk1Q6hjX8tP6XBHMWoyvw3YexcyhpujuZEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=be0R+JBP;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80EC606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=be0R+JBP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO0qmSvB2087933, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795481569; bh=o/vxPPLw9J0tQcMFFd2KMuzm1glCzbbnkdJ8n2DVzK4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=be0R+JBPajkoqoXHoFlMS3Zm5CzDJtw8NinkDELNlYgpFhRJATMPb1jeyb8jW/pyR
	 GQmZ3HX6CvA1Pyiesq/0OlfvbCXnnUBqzpGqffK1x1wRFt72ZbSvDMN4UBDQ+dIA3i
	 nHPOqeQSEP0+gxZff4DFIQVnqWutvorphxtrP0d+NSnfyD+TXRtXztPnGllCeSIRvG
	 kx0N3yK27F2YO6Ajlz0yAxNFHXYAaDvLv7jWiAKW5BeG67rLW+PFcGqEnzG2UuziJF
	 6BIhIDDldNrNpIV53ORhYjOLp/UTObAVvKLoKsBmuZj3YzIhxHLiSb9xXRF9eCOEki
	 9cWPZdzuBPvng==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO0qmSvB2087933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 08:52:49 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 08:52:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 08:52:49 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 08:52:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: niko3x <niko3x@proton.me>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>, Luka Gejak
	<luka.gejak@linux.dev>
Subject: RE: rtw88: injected frames ignore radiotap rate and retry count
Thread-Topic: rtw88: injected frames ignore radiotap rate and retry count
Thread-Index: AQHde1Jl9SboFH/HZEaAiwQiFQwM4Lc8ZIug
Date: Tue, 24 Nov 2026 00:52:49 +0000
Message-ID: <89e27a6cf5e64dde82f4fa7e2ac4f15b@realtek.com>
References: <sz_DHzKsOepyz69cMCgwtDkF_KWzFDHlbuRsiUI4mOjDDIL1G4JvoK43-NbdZqQmfxQhtIqH5sMQpPQ5wfwYMrg6oDx2mlJ-x_rlqNB-pJg=@proton.me>
In-Reply-To: <sz_DHzKsOepyz69cMCgwtDkF_KWzFDHlbuRsiUI4mOjDDIL1G4JvoK43-NbdZqQmfxQhtIqH5sMQpPQ5wfwYMrg6oDx2mlJ-x_rlqNB-pJg=@proton.me>
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

Ly8gK0x1a2ENCg0KbmlrbzN4IDxuaWtvM3hAcHJvdG9uLm1lPiB3cm90ZToNCj4gSGkgUGluZy1L
ZSwNCj4gDQo+IFRoYW5rcyBmb3IgdGFraW5nIHRoZSBydGw4eHh4dSBpbmplY3Rpb24gYW5kIFRY
IHN0YXR1cyBwYXRjaGVzLg0KPiANCj4gTG9va2luZyBhdCB0aGUgb3RoZXIgUmVhbHRlayBkcml2
ZXJzLCBydHc4OCBzZWVtcyB0byBoYXZlIHRoZSBzYW1lIGdhcHMNCj4gcnRsOHh4eHUgaGFkLiBU
aGlzIGlzIGZyb20gcmVhZGluZyB0aGUgY29kZSwgSSBoYXZlbid0IHRlc3RlZCBpdDoNCj4gDQo+
IC0gdGhlIHJhZGlvdGFwIHJhdGUgb2YgaW5qZWN0ZWQgZnJhbWVzIGlzIG5vdCB1c2VkLCBzbyB0
aGUgZmlybXdhcmUgcmF0ZQ0KPiAgIGFkYXB0YXRpb24gcGlja3MgdGhlIHJhdGUNCj4gLSBtYXhf
cmF0ZV90cmllcyBpcyBub3Qgc2V0LCBzbyBtYWM4MDIxMSBjbGFtcHMgdGhlIHJhZGlvdGFwIHJl
dHJ5IGNvdW50DQo+ICAgb2YgaW5qZWN0ZWQgZnJhbWVzIHRvIHplcm8NCj4gLSB0aGUgcmVxdWVz
dGVkIGJhbmR3aWR0aCBvZiBpbmplY3RlZCBmcmFtZXMgaXMgbm90IHVzZWQNCj4gDQo+IHJ0dzg5
IGdvdCB0aGlzIHJlY2VudGx5IGluIGU5NmFiZTRmZDdjICgid2lmaTogcnR3ODk6IGNvbnNpZGVy
IGRhdGENCj4gcmF0ZS9iYW5kd2lkdGgvR0kgZm9yIGluamVjdGVkIHBhY2tldHMiKSBhbmQgOTI2
MDhiYjVmMTQgKCJ3aWZpOiBydHc4OToNCj4gaG9ub3IgQVNTSUdOX1NFUSwgcmV0cmllcywgYW5k
IE5PX0FDSyBmb3IgaW5qZWN0ZWQgZnJhbWVzIikuDQo+IA0KPiBXb3VsZCB5b3UgdGFrZSBzaW1p
bGFyIHBhdGNoZXMgZm9yIHJ0dzg4PyANCg0KU3VyZS4NCg0KPiBJIGRvbid0IGhhdmUgcnR3ODgg
aGFyZHdhcmUsDQo+IGJ1dCBJIGNhbiB3cml0ZSB0aGVtIGZvbGxvd2luZyB0aGUgcnRsOHh4eHUg
YW5kIHJ0dzg5IGNoYW5nZXMuIENvdWxkIHlvdSwNCj4gb3Igc29tZW9uZSBlbHNlIHdpdGggYW4g
cnR3ODggY2hpcCwgdGVzdCB0aGVtPyANCg0KSSBDYydkIEx1a2EuIEJpdHRlcmJsdWUgYW5kIEx1
a2EgYXJlIGFjdGl2ZSB3aXRoIHJ0dzg4LCBzbyBJIHRoaW5rIHRoZXkNCmNhbiBoZWxwIHRoaXMu
IA0KDQo+IEkgd291bGQgc2VuZCB0aGVtIGFzIFJGVA0KPiB3aXRoIHRoZSB0ZXN0IHN0ZXBzIEkg
dXNlZCBmb3IgcnRsOHh4eHUuDQoNCk9rYXkuDQoNClBpbmctS2UNCg0KDQo=
