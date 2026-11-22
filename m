Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311470;
	b=pIaL4s1gkw6T8LlWgOFt/8s7zjASJ43Iy2gSQK69368Wo9F0rnEnuo8q/bcYUmD6tNNL
	 Z270VfxwHNkdvw77KwKSslIdI3FBTEa6QJbFjmE1SXrZjzR4jReL95uzK3ra/bzT476XS
	 TLIcEDCVUGGx6P2Xg0tw6T4gvdBZyiUGSTEnxMvdanMeTwrucBtw3ibMgl6AWr79zileC
	 DiAWXLbWiSzmo/VxucIKeLiJVu4FB9JEoT+hcjpXhExlevsf/fZEo3fjEeJBpJU5Bb4EK
	 0+nN39G7luobgwisMzUv7VUz5EJbjZEjxBkThSkToW8bL+ODfiWkz4LKm9/jCHSJqyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311470;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Cf5cTdUxxv/xJ5vTCcw2jNpaQk8zAmtvOvhwPW36kK8=;
	b=oGclSk3GgLxB+lmXmG82H8J6OvGTOsaT4S4SUkvy82LACMQeue14lP8d/OjlUCqLAL+L
	 HsNRmrW9t+9XUVXX8t4c5Yx0kQebYV4iG+KbP4SmbulyqAotg9pNonHEc+kTdv3cAQ/Q1
	 gVLpTPLMqgpIPQTD/d1hrXA2x9kSTGy+PAYIxWFfwpVGraR9Fr0Q+qhcYCZdbQzDhIarm
	 cJ+gv7u0t5MsKlyVqG3U1fA2F8UMJXdI+5x4ACqhw41M2VIMjcv7vqUPyvs3anGcCY6yu
	 xYt98FQwAGiyZJanvNq6ViRr/n0wxTgZ9VZxUlTk9M9lPlyX6QTM3C7ChiEWL3SBNmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=VPtzXobp;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED09606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 01:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=VPtzXobp
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM1bVy75511767, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795311451; bh=Cf5cTdUxxv/xJ5vTCcw2jNpaQk8zAmtvOvhwPW36kK8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VPtzXobpAclz0ZU8oRqtARbOOlZ91kyuCdiT66WcByWo1sZ3rIKJ71x5Zd/cGr7CB
	 Uajjow7FVNg6JCKr6vW39I+VViKTJJKTQ6GaAtL/lU0ctbBWAgTxZAopwuc4/CYJGT
	 sHG6kllJhsgpUDVYK3SP58EZ/Z0dPAVDvIyI04Q1i8JPyLIaxB23I/xks1rJfgGSqd
	 Mi1Pm0QnLzAZRPsi0ukfM3ByKz7m3YXrG1XBDn9tNKr3zqFB372HDgAVWQL69LsJO/
	 pP7JE+1D3gFdtwARpWFZKWErnwUwRFt39e8QuX3t/xeIYmYihpJVHic5RMmw052tx6
	 tMPGnfxwiqs5w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM1bVy75511767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 09:37:31 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 09:37:31 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 09:37:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 09:37:30 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rik van Westendorp <rik@ellarik.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: Bug report: Realtek RTL8851BE Wi-Fi does not recover from suspend
Thread-Topic: Bug report: Realtek RTL8851BE Wi-Fi does not recover from
 suspend
Thread-Index: AQHdeYIUhAfJoMAxgkKJ5J5PRVKSPLc5UIvQ
Date: Sun, 22 Nov 2026 01:37:30 +0000
Message-ID: <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
References: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
In-Reply-To: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
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

UmlrIHZhbiBXZXN0ZW5kb3JwIDxyaWtAZWxsYXJpay5jb20+IHdyb3RlOg0KPiBTeW1wdG9tcyBh
bmQgZG1lc2cgZXZpZGVuY2UNCj4gDQo+IEltbWVkaWF0ZWx5IGFmdGVyIHJlc3VtZSwgdGhlIGtl
cm5lbCBsb2dzIChkbWVzZykgc2hvdyB0aGUgZHJpdmVyDQo+IGZhaWxpbmcgdG8gcmVpbml0aWFs
aXplIHRoZSBjaGlwOg0KPiANCj4gcnR3ODlfODg1MWJlIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRv
IHdyaXRlIERCSSByZWdpc3RlciwgYWRkcj0weEI0OA0KPiBydHc4OV84ODUxYmUgMDAwMDowMTow
MC4wOiBmYWlsZWQgdG8gd3JpdGUgREJJIHJlZ2lzdGVyLCBhZGRyPTB4QjQ4DQo+IHJ0dzg5Xzg4
NTFiZSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byByZWFkIFBDSSBjYXAsIHJldD0xMzQNCj4gcnR3
ODlfODg1MWJlIDAwMDA6MDE6MDAuMDogbG9hZGVkIGZpcm13YXJlIHJ0dzg5L3J0dzg4NTFiX2Z3
LmJpbg0KPiBydHc4OV84ODUxYmUgMDAwMDowMTowMC4wOiB4dGFsIHNpIG5vdCByZWFkeShSKTog
b2Zmc2V0PTQxDQo+IHJ0dzg5Xzg4NTFiZSAwMDAwOjAxOjAwLjA6IHh0YWwgc2kgbm90IHJlYWR5
KFcpOiBvZmZzZXQ9OTAgdmFsPTEwDQo+IG1hc2s9MTANCj4gcnR3ODlfODg1MWJlIDAwMDA6MDE6
MDAuMDogZmFpbGVkIHRvIHBvd2VyIG9uDQo+IHJ0dzg5Xzg4NTFiZSAwMDAwOjAxOjAwLjA6IGZh
aWxlZCB0byBzZXR1cCBjaGlwIGluZm9ybWF0aW9uDQo+IHJ0dzg5Xzg4NTFiZSAwMDAwOjAxOjAw
LjA6IHByb2JlIHdpdGggZHJpdmVyIHJ0dzg5Xzg4NTFiZSBmYWlsZWQgd2l0aA0KPiBlcnJvciAt
MTEwDQoNClRyeSB0byBkaXNhYmxlIGQzY29sZCBiZWZvcmUgc3VzcGVuZGluZyBieSBiZWxvdyBz
dGVwczoNCg0KMS4gdXNlIGxzcGNpIHRvIGZpbmQgdGhlIGRldmljZSBhZGRyZXNzIG9mIFJUTDg4
NTFCRS4NCjIuIGRpc2FibGUgZDNjb2xkIHZpYSBzeXNmcw0KICAgZWNobyAwID4gL3N5cy9idXMv
cGNpL2RldmljZXMvPGRldmljZV9hZGRyZXNzPi9kM2NvbGRfYWxsb3dlZA0KDQpQaW5nLUtlDQoN
Cg==
