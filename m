Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420924;
	b=p0m+mQSsTuLD1UTe+PvZ5bkNPbmQdhD2lISzGP1yR7XW5tZbSH8asn5Ui6dVFIZQmyex
	 mY9qUOs+WUtzJI1mECrvhbFkT7hFDUapNrio2dSPp8wgl0FSf0nQzV77iM4P7PsW2Z3wr
	 Jqo0zoDi9WkzH3ReB/V3nCp0eujOiAZJzoiVx32wOFfCyMoukEnf9ia9S5lfTmmMrDAGn
	 gg+JeJi6H0ThS+SvbIBbrZePeitCvohV5+N9HFugTDnCGenINdBdB4aa2K0y898Qv0l+k
	 YtosIABUO0QzuKwnt+kcM5vFRfdJKG3YxYSLr0or3a9CcRU+JgNl+Us+1iMo2LIFjFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420924;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ZuR14Rzlr7JiMdXlknI/Yf+swOlU0tbBpPadLpyVjc0=;
	b=yXSMLo+yUl4YRp8Ig5AH6A9jnFftBBGeWC9K1HOMeCTp1aEAbJw79+VB77CIg1gbqzNw
	 sTfci4xD1HvnqJ8SGeu0fSrkQnpQtHQTVrXjC3xD3U1PUflRtfybYld1su8Up5xLy9tbo
	 6qSUILmUu2tN+U91wV7I7UFzWcZBo1AjfAxoACwwrVs3t8V4ZZK+a7M82bB/vtHvOBtkL
	 ZQpyJf8SPnp8pp5DqhlIT0p382LR+S9CwR3FEpDLjXRePfZ89ESdEXG5HJWvWbyon9te3
	 sLc4btBJo1hddZPsDZP5tyGVktEyDmg651OsbGRSj5ZLdriSXGuRtwLvwHfA5mUAcog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OJa3TsK2;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DF606A68D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6DF606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OJa3TsK2
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN81vcD61450554, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795420918; bh=ZuR14Rzlr7JiMdXlknI/Yf+swOlU0tbBpPadLpyVjc0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OJa3TsK2gOX6X5jJGzAp6zcutEe6azbpezyISSBjc5RPI5Bc/M9p3S6Kqf21xinzm
	 LyEbsjsYRqziICwqyEQhJ68+hQ5wWcBz8tZhHc/YKMWjvPQdE+6fBmCmEH2cEwJkbD
	 p/tc23QkZRlsYC7+5TXLE0yhuun0lHUzAqO7QFh5QsOd9dDwI9rDM5AFbjhrT+g94N
	 HvucilLfy9qaUFtlzDyUsO/xyhqnKWOSDSoTtXSxcHJfUvqbULbXHAZV2fkTP11Ofe
	 AJvd+XF7oJGOev4F9/vxk/N5TAwFmClKYcDtFQfMpfYTmBnisg59Bfj8KGUrhwJdA0
	 eSmpTCI4PcrHw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN81vcD61450554
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 16:01:57 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 16:01:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 16:01:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 16:01:57 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rik van Westendorp <rik@ellarik.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: Bug report: Realtek RTL8851BE Wi-Fi does not recover from suspend
Thread-Topic: Bug report: Realtek RTL8851BE Wi-Fi does not recover from
 suspend
Thread-Index: AQHdeYIUhAfJoMAxgkKJ5J5PRVKSPLc5UIvQ///QUQCAAbMogP//6zyAgACKMmA=
Date: Mon, 23 Nov 2026 08:01:57 +0000
Message-ID: <68dca0e4e2724b2694ff8e8d30497149@realtek.com>
References: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
		 <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
	 <ff6a236dd11ef2f2cb00202b4a6856424b93974b.camel@ellarik.com>
	 <c873b08ae23a4e56884aa6139d5d8b6d@realtek.com>
 <7e47e43141ace3e769a30653b84228444e8235aa.camel@ellarik.com>
In-Reply-To: <7e47e43141ace3e769a30653b84228444e8235aa.camel@ellarik.com>
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

UmlrIHZhbiBXZXN0ZW5kb3JwIDxyaWtAZWxsYXJpay5jb20+IHdyb3RlOg0KPiBIaSBQaW5nLUtl
LA0KPiANCj4gSGVyZSBpcyB0aGUgaW5mb3JtYXRpb246DQo+IA0KPiBiYXNlYm9hcmQgbWFudWZh
Y3R1cmVyOiBBU1VTVGVLIENPTVBVVEVSIElOQy4NCj4gYmFzZWJvYXJkIHByb2R1Y3QtbmFtZTog
IFgxNDA0TUENCj4gc3lzdGVtIHByb2R1Y3QtbmFtZTogICAgIFZpdm9ib29rIDE0IFgxNDA0TUEN
Cj4gc3lzdGVtIHZlcnNpb246ICAgICAgICAgIDEuMA0KPiANCj4gbHNwY2kgLW5uIGZvciB0aGUg
Y2FyZDoNCj4gMDE6MDAuMCBOZXR3b3JrIGNvbnRyb2xsZXIgWzAyODBdOiBSZWFsdGVrIFNlbWlj
b25kdWN0b3IgQ28uLCBMdGQuDQo+IFJUTDg4NTFCRSBQQ0llIDgwMi4xMWF4IFdpcmVsZXNzIE5l
dHdvcmsgQ29udHJvbGxlciBbMTBlYzpiODViXQ0KPiAgICAgICAgIChzdWJzeXN0ZW06IEZveGNv
bm4gSW50ZXJuYXRpb25hbCwgSW5jLiBEZXZpY2UgWzEwNWI6ZTEwMF0pDQo+IA0KPiBMZXQgbWUg
a25vdyBpZiB5b3UgbmVlZCBhbnl0aGluZyBlbHNlLiBIYXBweSB0byB0ZXN0IGEgcGF0Y2hlZA0K
PiBkcml2ZXIgaWYgdXNlZnVsLg0KDQpJIHNlbnQgYSBwYXRjaCBbMV0uIFBsZWFzZSBoZWxwIHRv
IHRlc3QgaWYgaXQgd29ya3MgdG8geW91Lg0KSWYgc28sIHBsZWFzZSBhZGQgYSBUZXN0ZWQtYnkg
dGFnIHRoZXJlLiANCg0KTm90ZS4gUGxlYXNlIHJlbWVtYmVyIHJlbW92aW5nIHRoZSBob29rIHlv
dSBhZGRlZCB0byBzeXN0ZW1kLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
d2lyZWxlc3MvMjAyNjExMjMwNzU4MTYuMjU2MDYtMS1wa3NoaWhAcmVhbHRlay5jb20vVC8jdQ0K
DQoNCg==
