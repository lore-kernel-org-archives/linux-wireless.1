Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395036;
	b=zZ7jW4BHuv9IXnSxtVg1p981+q1irvF/FzK+mEXcuobBHBSMzoC1M9f0pxfyQWu/KcrI
	 HBu2SctbPPv0WPEi+A/YpfGs2nCu5+f63OGtz5JNFtrjW5U3OA+pxSiU/Y4OrhzhghFPP
	 a2i4Zan7Hp7lBVx0G9xj8vKrgFbgY07jPWllknqOi8tOlQjXgYsg6O+4yGpxqat86plNK
	 lpVhTfiZ6ykt8nBxx8nQ0jgKwO5iixRClDsH9fEIQjH+Oa0KRMMKD9lwU+W0zzFNCa9J+
	 0CRCFuRH5KroEPMdsuqVa/N2EPzuNqzV/ZsXHXGKa+AvdAPrWMGGGCdEQ3AZERfP7fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395036;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OWqgaZdLyMmqN5zAvTioGCkpDneimhgpWuVD7xUPWRE=;
	b=0jITS4JVi0mLgW7VWB5ofo//ImAjAnvhVpK0WRT9AfhKRewq5LtmREz6M4OfhAZChiTi
	 jOn460ibrnRJOmFzPNFf02Wa9SZnKRiKQF6RyruQhqsEKsVJirp6S6eizA0xEMuLlcBwo
	 QXRJ279/53W6/Hv3txVUqHm1pJ91VRrqusL77h1iB3GRt8CldIdo0pyhiJ1np2Fu5M0sT
	 lePYyWQmWV0Lv8WEoQxUJ2/4js1zXTbPQ9MTaF7aohmNFxz698xcjy3NfQ18McqCjdddy
	 UmTxGsuz2Oks65yabcTnwJ7Ecjjk89rHCbLq09wKuZMnQ+HhDoeaSBlVESMs3d9D9KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=tgIXOFbc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641E606A69B;
	Mon, 23 Nov 2026 00:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A641E606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=tgIXOFbc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN0oSYW11173209, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795395028; bh=OWqgaZdLyMmqN5zAvTioGCkpDneimhgpWuVD7xUPWRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=tgIXOFbcnELJKUJ5jBRRIfEGa38PHJQ8Xb+0AYAZGQoyGJ9IGTEN2RENiMIbE5Gcr
	 KC5GPCqluYVykvOftm+pL+9cgKL8nmJZPho3Huj+n/wvtweKzQ5uN5YeTO9+mwi6PZ
	 mpXZ6IYCrXSSsQ4En+K8gJ9y5e7lQXkyLaNXmXuiFQ/DdhvaY7o8UCUD/Eh9o0VxS5
	 L4sVxVeqWuii3/qCDY0Szn9k0vlrUZV4J/g0GV2beSeS5lXoprpd9QD7JsEiH7s51v
	 DoR8+/tuYEimc9GDICenDcpMYHBCYs6H9OcrgNAdK4Vc1IcTDunWsef/ZizR+MVQZ1
	 zApfBMHjtenVQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN0oSYW11173209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 08:50:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:50:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:50:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 08:50:28 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Falconet3 <Falconet3@proton.me>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] wifi: rtw89: fix u32 overflow in board element
 offset check
Thread-Topic: [PATCH v3 2/2] wifi: rtw89: fix u32 overflow in board element
 offset check
Thread-Index: AQHdenG4pL+zOtiBfkOGxNoGH3Doirc5bFsAgAFniOA=
Date: Mon, 23 Nov 2026 00:50:28 +0000
Message-ID: <1b36d3a3ccf840088ded5991d35cc077@realtek.com>
References: <p7rw-XuXkRXg0R2mJ5S-HUUy3IwDD0iXcY11AzTDIvfIj3ofQsJ5exatm_1V-mlBCzsd_s0xhJSBvZz4zWCYaso5-ylUw9JMV3AoiPUZZ3o=@proton.me>
 <wQyrWhpyvBNzuZwnQTESLUjeEbdLHi5t3xdQUf2qlOjublpo9nBpuikHh7cpfpTRjtuXRza3-Q2ZAgcwr7O98Xqs6lFOaNsc3T-D7E4B1S8=@proton.me>
In-Reply-To: <wQyrWhpyvBNzuZwnQTESLUjeEbdLHi5t3xdQUf2qlOjublpo9nBpuikHh7cpfpTRjtuXRza3-Q2ZAgcwr7O98Xqs6lFOaNsc3T-D7E4B1S8=@proton.me>
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

RmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPiB3cm90ZToNCj4gTm90ZTogMi8yIHdhcyBw
b3N0ZWQgYXMgYSBzdGFuZGFsb25lIG1lc3NhZ2UgKCJbUEFUQ0ggdjMgMi8yXSB3aWZpOiBydHc4
OToNCj4gZml4IHUzMiBvdmVyZmxvdyBpbiBib2FyZCBlbGVtZW50IG9mZnNldCBjaGVjayIpIGJl
Y2F1c2UgbXkgd2VibWFpbCBjbGllbnQNCj4gZG9lcyBub3QgcHJlc2VydmUgdGhlIEluLVJlcGx5
LVRvIGhlYWRlciB3aGVuIHRoZSBzdWJqZWN0IGlzIGVkaXRlZC4gQm90aA0KPiBwYXRjaGVzIGFy
ZSBpbmRlcGVuZGVudCBhbmQgYXBwbHkgb24gdG9wIG9mIHY3LjQtcmMzLg0KDQpQbGVhc2UgcmVz
ZW5kIHY0LCBidXQgbm90IGluLXJlcGx5LXRvIHYxLiBUaGUgdjIgYW5kIHYzIGFyZSBhZGRlZCBp
bnRvIHYxDQppbiBwYXRjaHdvcmsgWzFdIHRoYXQgSSBjYW4ndCBtYW5hZ2UgdGhlIHBhdGNoZXMu
IA0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVs
ZXNzL3BhdGNoL09OQmhraF9CN2h5S29ITlJwallneHk3ZGE2OFFPYThjV1VxenRULUkxblctS3Vr
T0tFMzBGSVlGTGtYMVRtX1RyWGxCanNlNWQtQUZSd3N5emZ4QmRNR0t2eUlFb1ZzanlaUXF4elVr
UlFrPUBwcm90b24ubWUvDQoNCnB3LWJvdDogY3INCg0K
