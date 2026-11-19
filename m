Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067332;
	b=OsTd3YHzxLyoYbbEzCQ/hWd2X3oQ/KxvMZ4QXEUp0uLhUUFCf1vm3MRSHS/bgPgRENuJ
	 Cbd1/Ce6HYbbqtnuJrOf2oWQYZwRshchfjguzl9nDChehvQCy3xV4CzqMi21oT7dfzY/W
	 KmW3XJFET/cVavy2rEezH5wXc8/d5rZN8MCY9RDswJdV0D1CUyMODHjR0I93+V8ZOKNiS
	 34hSovJHq5mYH7Vikg1QVHp1b6zvixij7HJUWIOMgBYY4vxSQNEsj9nC1+TkI63vq4rsw
	 ZkCUUYnYlMxlRX+hPF6JMJFYY8A+0oOsktUWgadJMaAyP2rYqxeyMXUcaJuhGYRfTcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067332;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OFJzbnbaIEiQpuhhs+SmoBuJp4JcSeHuMEZDyuHys0U=;
	b=1K0XMUhoXDBx6XANlqkktAWV3ffboYEv4gSzDqyTK67/DnNRd2dMMOeXLVOMtFgxnPoI
	 uceNI4bTwoDPIJXLQyHajHywn229OhQLEStPxEW1AWcTAJGxV659MeHT5NiwrCppa+nPL
	 xSzb/PZAzeEM+z4JucJXERT+GeMvtWrgYJme8/M4sPqMZXa+KSDs+3k8pTOlMr/KaXlXg
	 70WEDPeVZEary/83z8eUNOoQx93s53Lz+MWbWDdi7RpfV/rAPZYPRmh+WeIj+F1IHqhO+
	 CMXTBrN+cX28HxRwV46vFeg6WxQaBkUkkqIgslV0jkOuYg3b3Ep5TOnlUkbNFtPzpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=b5cXheLP;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF0606A332
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 05:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7CF0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=b5cXheLP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ5mlmbF2066441, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795067327; bh=OFJzbnbaIEiQpuhhs+SmoBuJp4JcSeHuMEZDyuHys0U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=b5cXheLPhXFcQ5Fe5cN7DwbOjn42QYlsoKeznvUpQjOcw4G25j7pjL4vP9hMOnpV4
	 xnhdDc5k5WLUaU38dD+pM7bab0wKDeGZ7BJp5aNtWduy/oTojRUw664D/bu4ve3d4j
	 E4mclIu9DeLm/nZaV+mki4f2IiIbAFhgEWKMvmdzal/e6ze0aez/nATQ0ZxYZJv94S
	 48gHUqS2eeBlfSt3D1jHKOblh2mykW9S5m0AuuprhPfdny8R7E8roIL0jMECUw5b+F
	 7QDylHIJWiCHj6tkbyW11vzqyV5pBwh8Cg3TPCEgeAwx2sUjF5QJTvkOGV1yYvuVIB
	 SiIVMWLSP33oA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ5mlmbF2066441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 13:48:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 13:48:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 13:48:47 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Topic: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
Thread-Index: AQHdY0HfQGIda1zW60KKJQiEj21Ec7cra++AgAUI04CAAvLMgIABpDIQ
Date: Thu, 19 Nov 2026 05:48:47 +0000
Message-ID: <1c527c2ba8d64740a1b1df63b80f6ad7@realtek.com>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
 <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
 <08a6cf57-9c00-445d-bc91-9375e4ba2ef8@gmail.com>
In-Reply-To: <08a6cf57-9c00-445d-bc91-9375e4ba2ef8@gmail.com>
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

Qml0dGVyYmx1ZSBTbWl0aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiBPbiAx
Ni8xMS8yMDI2IDA5OjQzLCBQaW5nLUtlIFNoaWggd3JvdGU6DQo+ID4gQml0dGVyYmx1ZSBTbWl0
aCA8cnRsODgyMWNlcmZlMkBnbWFpbC5jb20+IHdyb3RlOg0KPiA+PiBPbiAyNC8xMC8yMDI2IDAx
OjU3LCBCaXR0ZXJibHVlIFNtaXRoIHdyb3RlOg0KPiA+Pj4NCj4gPj4+IFRoZW9yZXRpY2FsbHkg
cnRsd2lmaSBzdXBwb3J0cyBXT1dMQU4sIGJ1dCBpdCBkb2Vzbid0IHdvcmsgZm9yIG1lIHdpdGgN
Cj4gPj4+IFJUTDg4MjFBRSBvciBSVEw4ODEyQUUuIHJ0dzg4IGRvZXNuJ3Qgc3VwcG9ydCBXT1dM
QU4gd2l0aCB0aGVzZSBjaGlwcy4NCj4gPj4+DQo+ID4+DQo+ID4+IEFjdHVhbGx5LCB0aGlzIGxv
b2tzIGxpa2UgbXkgbGFwdG9wJ3MgZmF1bHQuIEkgdHJpZWQgd2l0aCBSVEw4ODIyQ0UNCj4gPj4g
YW5kIFJUTDg4NTJCRSwgYW5kIHRoZXkgZG9uJ3Qgd29yayBlaXRoZXIuIFRoZSB3aWZpIGNhcmQg
ZG9lc24ndCBoYXZlDQo+ID4+IHBvd2VyIHdoaWxlIHRoZSBsYXB0b3AgaXMgc3VzcGVuZGVkIHRv
IFJBTS4gVGhlcmUgaXMgbm8gb3B0aW9uIGZvciBpdCBpbg0KPiA+PiB0aGUgQklPUywgZWl0aGVy
Lg0KPiA+DQo+ID4gSWYgeW91IGhhdmUgYW4gZXh0ZXJuYWwgUENJRSBhZGFwdGVyLCBpdCB3aWxs
IGJlIHBvc3NpYmxlIHRvIGNvbm5lY3QNCj4gPiBhbiBleHRlcm5hbCBwb3dlciB0byBrZWVwIFdp
Rmkgd29ya2luZy4gKE5vdGUgdGhpcyBtaWdodCBkYW1hZ2UgeW91cg0KPiA+IGxhcHRvcCBvciBX
aUZpIGNhcmQgaWYgY29ubmVjdCBleHRlcm4gcG93ZXIgdG8gd3JvbmcgaGFyZHdhcmUgcGlucykN
Cj4gDQo+IEkgZG9uJ3QgaGF2ZSBhbnl0aGluZyBleHRlcm5hbCwgYnV0IHlvdSBnYXZlIG1lIGFu
IGlkZWEuDQo+IA0KPiBJIHNvbGRlcmVkIHR3byB3aXJlcyBvbiB0aGUgbW90aGVyYm9hcmQuIE9u
ZSBjb25uZWN0cyB0aGUgTS4yIHNsb3QgdG8gdGhlDQo+IDMuM1YgbGluZSB3aGljaCBzdGF5cyBv
biBpbiBTMy4gVGhlIG90aGVyIGNvbm5lY3RzIHRoZSBNLjIgc2xvdCdzIFBDSWUNCj4gV0FLRSBw
aW4gdG8gdGhlIGxhcHRvcCdzIHBvd2VyIGJ1dHRvbi4gTm93IHRoZSBsYXB0b3Agd2FrZXMgdXAg
d2hlbg0KPiBJIHNlbmQgdGhlIG1hZ2ljIHBhY2tldC4NCg0KQXMgdGhlIHJlc3VsdCwgSSB0aGlu
ayBXb1dMQU4gd29ya3MgZmluZSB3aGVuIHlvdXIgcGxhdGZvcm0gaW4gUzMuDQoNCj4gDQo+IEkn
bSBub3Qgc3VyZSBpdCdzIHdvcmtpbmcgMTAwJSBjb3JyZWN0bHkuIFJUTDg4MjFBRSAod2l0aCBy
dHc4OCksDQo+IFJUTDg4MjJDRSwgYW5kIFJUTDg4NTJCRSBhbGwgZGlzY29ubmVjdCBmcm9tIHRo
ZSBuZXR3b3JrIGFmdGVyIHdha2luZyB1cC4NCj4gSXNuJ3QgaXQgc3VwcG9zZWQgdG8gc3RheSBj
b25uZWN0ZWQ/DQoNCkl0IHNob3VsZCBzdGF5IGNvbm5lY3RlZC4gSGF2ZSB5b3UgdHJpZWQgY29u
bmVjdGlvbiB3aXRob3V0IHNlY3VyaXR5Pw0KQWxzbywgSSB0aGluayBpdCdkIGJlIGhlbHBmdWwg
dG8gZGlnIHByb2JsZW0gd2l0aCBhaXIgc25pZmZlci4NCg0KDQo=
