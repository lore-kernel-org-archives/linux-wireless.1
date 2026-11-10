Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295792;
	b=gSx3ZT6Yjskpgz+Xo37WLllSYf2G09atL439jhnCPXz9E3nkBdjj5o8f7JTGIB1FJTIo
	 P0nBH66TQSqeAdUDVg+Z+dOi9Povoe7xTt3Hi7nIb9SqKOZF1GSFezmCnRrQwi99FOXXs
	 67WPKC7ijI5gNsHvawWLqfaI75DR4ix1MXab0Fp81DuJ0aVMX4l5km3+SbHeG16D/ULZj
	 gzDgN9uTbbV/a3K0sdSF0J3BI1E39YKTUTzx/KLn5sSNhCnxifa5CVUvwr4FJ/Gu+Fh3B
	 kjyRn2e1OvWZ14rBjWQg/riE6lnxwb4pu45OlOU8W1Wy4tpjj1uzhHfAHYiTvLMTyMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295792;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=h5iSXPtsP6AgMu6zWqa86PFGDI5rA5jDD43BMgAkPx4=;
	b=W+bTYN1/d07CMxMgvSrNNsZsbJRWDaTgcEtBE2vg2j2bpQMNkmh/YBgIbWXuOemN+OGl
	 upkjLHVaksL20t9SiEYOciamm6xm7qooZ3Wz3UHXbSloibuv+25SwVvRlW+4m3fzfdFtF
	 QNh//nNX2I4/RQJQrHrwB0QKXLplHrhQRue9mq0doUmXmEz1KiGzkOLgWZTPxjorZU+Vd
	 2dEOcNMzmazk/twh/CmpExPRWrpZW7E8ulJbybzwTMjfi/mmr7eOmtJo93Uy+3XXa3q1O
	 22ql/mHPHh0btRFOvaeZ3lS+4oisWE3H8/Vv8wAlbQIvVWR47wAd+4OIg6l5WE2C9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rOXVeby7;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED20606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 07:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rOXVeby7
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AA7TlDvA1060690, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794295788; bh=h5iSXPtsP6AgMu6zWqa86PFGDI5rA5jDD43BMgAkPx4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=rOXVeby7Cb2Nr+qI1QzsPlF8V5HxK0bmdPcdd2XaXBbqeGnFkNzyeh/Ozv/hmeT7W
	 khocFvrEaqCJ5fNCkJqAtexSoQLIb5RMPathb31wM0HFrzt/0bT6u8HBKmzj8SjrWL
	 mYYYaA/LrWWIpmNCEZWcx2ZmMjw21vrDQBXmqKTq5GVYvgybJGE7affcyH3ybzPWT/
	 ofnKOl5isLkcTP15u0TuRiQpdGZm7mEezltswyrcPukflf5hIdGh/rxGxlysdi8hUN
	 B1Ylv9TaHYWrJdSFkZwcWVgiDw4Gfmrdngp21DsWeZY2o0VmG5Xl2Ze3JnAFCpGuKn
	 L7DaSV4/EXjEQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AA7TlDvA1060690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 15:29:47 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:29:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 15:29:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 10 Nov 2026 15:29:47 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Hao Tan <guwolf@guwolf.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since
 7.3
Thread-Topic: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since
 7.3
Thread-Index: AQHdcDpt8NFp7qQSw0+Qs+gU1DZt97cmhLmw///PnQCAAJVNEA==
Date: Tue, 10 Nov 2026 07:29:47 +0000
Message-ID: <52beef47470745fd8f52f1c6bda7749c@realtek.com>
References: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
 <340ed206ff6a4680a46806e3bea5dbc5@realtek.com>
 <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
In-Reply-To: <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
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

SGFvIFRhbiA8Z3V3b2xmQGd1d29sZi5jb20+IHdyb3RlOg0KPiAgIDg2Zjc2M2UzNzI0OCAoIndp
Zmk6IHJ0dzg5OiBjb2V4OiBSZWFycmFuZ2UgX250Znlfcm9sZV9pbmZvIGluZm8iKSBpcyBnb29k
Lg0KPiANCj4gICBhNzY1MDFlMWQxNDggKCJ3aWZpOiBydHc4OTogY29leDogU2VwYXJhdGUgX250
Znlfcm9sZV9pbmZvIGludG8gdHdvIGZ1bmN0aW9uIikNCj4gICBpcyBiYWQuDQoNClRoYW5rcyBm
b3IgdGhlIGJpc2VjdC4NCg0KPiBfc2V0X3dsX3ByZWFnY19jdHJsKCkgZGlzYWJsZXMgcHJlLUFH
QyB3aGVuIHRoZSBUREQgYmluZGluZyBpcyA1IEdIeiwgb3INCj4gd2hlbiB0aGUgcm9sZSBpcyBz
dGlsbCBOT0xJTksuIFdpLUZpIG9uIDUgR0h6IGFuZCBCbHVldG9vdGggb24gMi40IEdIeg0KPiBk
byBub3Qgc2hhcmUgYSBiYW5kLCBzbyB0ZGRfYmluZCBpcyBlbXB0eSBhbmQgb3V0X29mX2JhbmQg
aXMgYWxyZWFkeSBzZXQuDQo+IEFmdGVyIGE3NjUwMWUxZDE0OCB0aGUgTk9MSU5LIGZhbGxiYWNr
IG5vIGxvbmdlciBtYXRjaGVzLiBUaGUgY2hhbmdlIGlzOg0KPiANCj4gICB9IGVsc2UgaWYgKGRt
LT5vdXRfb2ZfYmFuZCB8fA0KPiAgICAgICAgICAgICAgZG0tPnRkZF9iaW5kLnJmX2JhbmQgPT0g
QklUKFJUVzg5X0JBTkRfNUcpKSB7DQo+ICAgICAgICAgICBpc19wcmVhZ2MgPSBCVENfUFJFQUdD
X0RJU0FCTEU7DQoNCkkgc2F3IHRoZSBwYXRjaC4gSSdsbCBjb25zdWx0IGludGVybmFsIGV4cGVy
dHMgdG8gcmV2aWV3IHRoZSBwYXRjaC4NCg0KUGluZy1LZQ0KDQo=
