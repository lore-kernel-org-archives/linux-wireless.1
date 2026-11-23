Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394562;
	b=VOL/NHRnDST864BKMZEFkHXHSBBwYJRtq303fVP9D3vrUDxJ8yAOWTBdh78H3BdyEM1b
	 kV69eGdzTn0ws7P+mPPchnXiEVNij9SscsXSvrNHZnb3Ysd9KNmL+LO6JtjOIMMg7U30x
	 3GAVLEyuAdtetPsZ/3coRNO5uSgrrOZdjvWS0GwyWalLk7UKqJKQY0Za1ImB5ahvx9iYO
	 TeIZif/Ok+3HXv9jcKUgw11FOrMGtpvWEtW4IJHPTKyYjNKizZzEpJ4iaBfeXptHsUyqJ
	 nsBwFhUPZC4nFWHTFq8v11w87ipfGUh0MELllFxCh4m283HAmt75yImzCVT9R3DdO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394562;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=aWdEVdEH6v6WLgvuBfgYcXN/PScT3Fm4toYb1ovQsk8=;
	b=xMUBY/pDbNxFZ6OdSteceEs5Kmemrm0ukmvcIjPkuEP6WRw5I4dVlQY/rdsdEENC24gn
	 Vm78XF9GCX/tpk2td27BTPWJ8UQCdJCmYTVQbtq+Fk3HTKczpQPWoWfSiS8LzVMuv7an8
	 VDqLg23+dWIv8PUZh8Z6xd0kIK6742P0ElukmoAQAA6m8d5/856aSElX8i/1mcdE3t5WV
	 n92jqvaksFFj2R6M7EYZn4+3Xitv1yO2rbMwz5ryVWlQG3QlOL1uhRgI6RD5wRPoZDXs5
	 cflsK/eTfj3EBpI0ZxMf6jabnNjSKFkdWBQdUCSQQbcWS4NJV7BI278luMf9z3MQBRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WP2KKQEN;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A708606A334;
	Mon, 23 Nov 2026 00:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A708606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WP2KKQEN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN0gIUR11170186, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795394538; bh=aWdEVdEH6v6WLgvuBfgYcXN/PScT3Fm4toYb1ovQsk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=WP2KKQEN0XiKYbWhy5+gMlt+yM3cozU+H7tr+57ShOvscRaP0isFEn7Hpfhmsvcpg
	 TijxrexF0kEmWDYxxN0mPLOnZseT8pgjlxFAuyDhRrWsQm5Rt+f65XXXzrwM8VMV/b
	 kNMyia0i3kotTbhKqEESqZq0qY5P2BIP46O4IyGVofMf6GckvOZDS4C/NmGLvQ+1TH
	 oBL/O6+BMVZCm9yaTWk5tPj5hq+CoIlBxCkU8/9hVs1RmvBbwo1flt9iMOAlDaf9k/
	 gSjp6ZQkNmlKuRfCLWjTJWDCioN4MD8UkylFfgmDdUpRK0IG1055ngLL2a5JQaEiTo
	 dpC1WTduW7mlA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN0gIUR11170186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 08:42:18 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:42:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:42:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 08:42:18 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 2/2] wifi: rtl8xxxu: report real TX status on
 RTL8188CU/RTL8192CU
Thread-Topic: [PATCH rtw-next v2 2/2] wifi: rtl8xxxu: report real TX status on
 RTL8188CU/RTL8192CU
Thread-Index: AQHdekbTZxP8pNINO0ifX/YlfNJGmLc60lTA
Date: Mon, 23 Nov 2026 00:42:18 +0000
Message-ID: <6911e0a143a64b3da2b4ff63653056f2@realtek.com>
References: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
 <20261122-b4-tx-status-v2-2-bbfdbd880acf@proton.me>
In-Reply-To: <20261122-b4-tx-status-v2-2-bbfdbd880acf@proton.me>
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
Cj4gVGhlIGRyaXZlciByZXBvcnRzIGV2ZXJ5IGZyYW1lIGFzIGFja2VkIG9uY2UgaXRzIFVTQiB0
cmFuc2ZlciBpcyBkb25lLg0KPiANCj4gVGhlIGZpcm13YXJlIG9mIHRoZXNlIGNoaXBzIGNhbiBz
ZW5kIGEgQ0NYIFRYIHJlcG9ydCB3aXRoIHRoZSBBQ0sgc3RhdHVzDQo+IGFuZCByZXRyeSBjb3Vu
dCBvZiBhIGZyYW1lIHRocm91Z2ggdGhlIEMySCBldmVudCBtYWlsYm94LiBUaGUgcmVwb3J0DQo+
IGRvZXMgbm90IHNheSB3aGljaCBmcmFtZSBpdCBpcyBmb3IsIHNvIHJlcXVlc3QgaXQgZm9yIG9u
bHkgb25lIGZyYW1lIGF0DQo+IGEgdGltZSwgcG9sbCB0aGUgbWFpbGJveCBhZnRlciB0aGUgZnJh
bWUgd2FzIHNlbnQgYW5kIHJlcG9ydCBpdHMgc3RhdHVzDQo+IGZyb20gdGhlcmUuIEZyYW1lcyB0
aGF0IHJlcXVlc3Qgc3RhdHVzIHdoaWxlIGFub3RoZXIgb25lIGlzIHBlbmRpbmcgYXJlDQo+IHJl
cG9ydGVkIGFzIGJlZm9yZS4NCj4gDQo+IFRlc3RlZCBvbiBSVEw4MTkyQ1UgKDBiZGE6ODE3OCkg
d2l0aCB1bmljYXN0IGZyYW1lczogZnJhbWVzIHRvIGEgcHJlc2VudA0KPiBzdGF0aW9uIGFyZSBy
ZXBvcnRlZCBhY2tlZCwgZnJhbWVzIHRvIGFuIGFic2VudCBzdGF0aW9uIGFyZSByZXBvcnRlZA0K
PiBmYWlsZWQgd2l0aCB0aGUgcmV0cnkgY291bnQgdGhlIGhhcmR3YXJlIHVzZWQsIGFsc28gd2hl
biB0aGF0IHRha2VzDQo+IHNlY29uZHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBaG1ldCBaZXJl
biA8bmlrbzN4QHByb3Rvbi5tZT4NCg0KUmV2aWV3ZWQtYnk6IFBpbmctS2UgU2hpaCA8cGtzaGlo
QHJlYWx0ZWsuY29tPg0KDQoNCg==
