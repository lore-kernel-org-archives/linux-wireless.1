Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481974;
	b=FIFQYaREOdgoYXyR6xljM6oH3WYyN/pvMBO02EbZ8XEIIRaOjrauTQTPD0eKd4wDlPFz
	 Zp2GC0Mm3hstAtmGmBKbRZWWgSZT4nHXAdLhMIblRfGkrJh9rqhuY6xH/z6nslwPYpOMl
	 KjTi2pPoqVB5OhSfsQd6f/3OYmVz+q3lvrNS0F3f+EAkF1fMuUpEWo4+zhUZMc5jtQrcj
	 J/d6KZz1o0QBZE4MwUbVtno+pK9SrcstOxrYA1ikROzIemT13e7PenHly3eyeksQSV/So
	 5Ch1tpPzzc27LZ2T9DAk5tB4Ow3unBArdZrXQ+N76uYOWjRUrAuBpOqt1EDIbj3kPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481974;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Ps2a4yXQ6v0aDzJqOiT29JQza2CMXX0hUfnQDpPA8Yk=;
	b=uZRIF+jeCAfZWQ5Yr79fA/CZ9t2jKVNtbp32rTTwFMSrH2MA3RzLgx/3muCNtEf0Wwow
	 XtVGf1TsoEzDvGmO3/LvQK3OvcEM8/WDyE/Jg2+7l44TVw15hsmQFxxecveBZBrTQ8F2d
	 NDXA/kjvGMyz992SquIW2t8dIzZWB+FHqmL7VtA+mZVUA2FoWtJzUjNX5Vsjrc/Jrqr4x
	 qRCqnbojEZAccLDCD+QkySSkDJY6tJL6MidivclVEVHvWVSuqarxXJA6HTiDIW0qHwJg2
	 ERH0mlIIz0Z2s5DEH9swImr205pgRM2p0iYcfAk8mtkeDbb5ZtTnCXwHl40kLLVydOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DizKmyLy;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D00606A31E;
	Tue, 24 Nov 2026 00:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DizKmyLy
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO0xSPp92089809, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795481968; bh=Ps2a4yXQ6v0aDzJqOiT29JQza2CMXX0hUfnQDpPA8Yk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=DizKmyLy1ZHvw/FseclJiM5UCnJ2UMmTyqmIubLQWHgYYck1E9qeKU+XdkXg7hamO
	 fxkxzB1s6HfhBAPz228+DiR790nxGJutxJ9wq0o5zqguANg1QhfH7SE+0YAUNkQYVS
	 n5QeO1DvR3B9MTISthOzSyuRyNKACaODYbE7pNpIgIsHUAdVH2jKIjOY4TILNbd9g7
	 Pwe4xz8dNDwbbMkidKAFkfjDgGRxo9Ixf4GWrXpA6hZ4n64HFuktT01J0XBYtZUGko
	 Je9jqLyK7vBeAcbW/jFhF02nLFVgEIGZ+QO7ygTP76ZMW3DKKX6VkpqduVrRuAA+T6
	 wYfKj0qlOaCmQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO0xSPp92089809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 08:59:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 08:59:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 08:59:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Topic: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Index: AQHdeOKzoeDEYzUTwEarjPoSRqZFqLc5b/EAgAHyyQCAAQk2AA==
Date: Tue, 24 Nov 2026 00:59:28 +0000
Message-ID: <ecad59dfc02941058452cad1889523ce@realtek.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
 <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
 <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
In-Reply-To: <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
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

SmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gT24gU3VuLCAyMiBOb3YgMjAy
NiBhdCAxMToyOCwgUGluZy1LZSBTaGloIDxwa3NoaWhAcmVhbHRlay5jb20+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiBIbyBKaWUgRmVuZyA8aGpmMzEwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4g
cnRsX3R4X3N0YXR1cygpIHN0YXJ0cyBhIFRYIEJBIHNlc3Npb24gZm9yIGFueSBRb1MgbnVsbCBk
YXRhIGZyYW1lcywNCj4gPiA+IHNvIHRoZXNlIHBvbGxzIHN0YXJ0IGEgc2Vzc2lvbiBldmVuIHRo
b3VnaCB0aGV5IGRvIG5vdCBjYXJyeSBkYXRhLg0KPiA+ID4gVGhhdCBjb3N0cyBhbiBBRERCQSBl
eGNoYW5nZS4NCj4gPg0KPiA+IFdpbGwgaWVlZTgwMjExX2lzX2RhdGFfcW9zKCkgYmUgbW9yZSBz
dWl0YWJsZT8NCj4gDQo+IGllZWU4MDIxMV9pc19kYXRhX3FvcygpIG9ubHkgdGVzdHMgdGhlIFFv
UyBiaXQgKDB4ODApLCB3aGljaCBpcyBhbHNvIHNldA0KPiBmb3IgUW9TIG51bGwgKDB4QzApLCBz
byB0aGUgQkEgc2Vzc2lvbiB3b3VsZCBzdGlsbCBiZSBzdGFydGVkLg0KDQpIb3cgYWJvdXQgaWVl
ZTgwMjExX2lzX2RhdGFfcW9zKCkgJiYgaWVlZTgwMjExX2lzX2RhdGFfcHJlc2VudCgpID8NCg0K
PiANCj4gPiA+DQo+ID4gPiBDaGVjayBpZWVlODAyMTFfaXNfZGF0YV9wcmVzZW50KCkgaW5zdGVh
ZCwgc28gb25seSBmcmFtZXMgdGhhdCBjYXJyeQ0KPiA+ID4gZGF0YSBzdGFydCBhIEJBIHNlc3Np
b24uDQo+ID4NCj4gPg0K
