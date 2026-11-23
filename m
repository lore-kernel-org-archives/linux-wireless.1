Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394181;
	b=iVPuV5rbBTVHNNkBxr/SQf0TdmQ3tpwKnYapR4uHxfMRi2F2D62W20bA6ohGWbTHkI+y
	 UKscQvY/vS9yK58+cfb//NqiLdTeK03Rp60WtBn6KVrmC7v03hfi6Bhl5+q/vl8kI2rME
	 c8Y3RjjyZqyBsLOukPIgiYgFibWpNodThBHT5A3E+FCFTHUzblL+MqKhtRO+0jjErkzLG
	 Ne7HPCCYjH5p27FYZ9VSA3h4VJFUms5HcYO/FoCmJY0z2gkrEo443fVoZdn1+DAqMR3RC
	 l/TUhSAysMVka0HGrpfCLrSJ3geFzazEn8mMY1lrs67tjU4JGjF/NYkhp3F9b/ebkVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394181;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=v2QWS0e/e1SuVjnzWDCaj247XeVq8auKrTH1XswjL0I=;
	b=mLQIeshMQOKZ5wUzPpD4XBccChqTTFuXy20eQpL4z0XXFGx3R4Mf+ZKLuYDS2PAc5Xlc
	 euCHfKdZ5cbZiWAXZ+OU8tvlW1xTTM6Lyy+sm9RFyjtQ6V6AooTNmwPHBxTqSNUUPoZmI
	 qAoOaEyu/wshzJ+E1AMag0nt2/xxnYgfNcdXCdyMctE/zLVOPs0IUnjxcYyBbF42pk0Z9
	 OKM+6BC+qLkmyIk7TVi8TMo6dD6u/hLCedzxU6vbgkCt4YbeqoyNlO0TqMA8cWquZJhbI
	 mqbE70MHjc5VwdxKae/S4wYLYBW8ZdG8Lh4TSorlQw0NecX3UKyHLNMvfKybkU0qS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SQyfErWg;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E2606A31A;
	Mon, 23 Nov 2026 00:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SQyfErWg
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN0a67M11167701, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795394166; bh=v2QWS0e/e1SuVjnzWDCaj247XeVq8auKrTH1XswjL0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SQyfErWgAKzf7UPDky4huXMjPEx9tsqyn1qibIk76OhVPnEzQ8x8V8cM3cTDeaen/
	 1txqrAbtI/Pvsp8WJeTHyJmV9NHobjB5cSfwi0/qJiYD70N3I7FP8ybGz1lL9Oungl
	 c3eFllLfvaLG3ShFsVi+2vKe5y4CHssS2wBJ8YL39i/O6xlqddBFtwDwW20YUbXP5w
	 AjBbwClbY35awqIXEzewV1LmlJi+/90clHAhtx3AFHNmQjETsC+eZs553pgc1WnCJi
	 cN8DGhpDpsyWDERO3u0B9YlauGwX3Dizp9p9kqGUBqSXAzUdfwR7HTo5bGswKWkqHA
	 xQPEhK6IQiwfQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN0a67M11167701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 08:36:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:36:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 08:36:06 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 3/3] wifi: rtl8xxxu: honour the bandwidth of
 injected frames on gen1 chips
Thread-Topic: [PATCH rtw-next v2 3/3] wifi: rtl8xxxu: honour the bandwidth of
 injected frames on gen1 chips
Thread-Index: AQHdekapbnug4U+jM0K+j8ORm0fLdLc60F9g
Date: Mon, 23 Nov 2026 00:36:06 +0000
Message-ID: <49878bf447554507aaf06d40d25c70d8@realtek.com>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
 <20261122-b4-inject-v2-3-0ee720fe706d@proton.me>
In-Reply-To: <20261122-b4-inject-v2-3-0ee720fe706d@proton.me>
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
Cj4gSW5qZWN0ZWQgZnJhbWVzIGFyZSBhbHdheXMgc2VudCBhdCAyMCBNSHosIGV2ZW4gd2hlbiB0
aGV5IGFzayBmb3IgNDAgTUh6DQo+IG9uIGEgNDAgTUh6IGNoYW5uZWwsIGJlY2F1c2Ugb25seSBR
b1MgZGF0YSBmcmFtZXMgZ2V0IHRoZSA0MCBNSHogYml0cyBpbg0KPiB0aGUgVFggZGVzY3JpcHRv
ci4NCj4gDQo+IFNldCB0aGVtIGZvciBpbmplY3RlZCBmcmFtZXMgd2l0aCBJRUVFODAyMTFfVFhf
UkNfNDBfTUhaX1dJRFRILg0KPiANCj4gVGVzdGVkIG9uIFJUTDgxOTJDVSAoMGJkYTo4MTc4KSBv
biBjaGFubmVsIDYgSFQ0MCsgYW5kIEhUNDAtLCByZWNlaXZlZA0KPiBieSBhIHNlY29uZCByYWRp
byBzbmlmZmluZyBhdCA0MCBNSHo6IE1DUyAwIGFuZCA3IHJlcXVlc3RlZCBhdCA0MCBNSHoNCj4g
YXJyaXZlIGF0IDQwIE1IeiAod2l0aG91dCB0aGlzIHBhdGNoOiAyMCBNSHopLCByZXF1ZXN0ZWQg
YXQgMjAgTUh6IHRoZXkNCj4gc3RheSBhdCAyMCBNSHouDQo+IA0KPiBBY2tlZC1ieTogUGluZy1L
ZSBTaGloIDxwa3NoaWhAcmVhbHRlay5jb20+DQoNCkkgd3JvbmdseSByZXBsaWVkIEFja2VkLWJ5
LiBJJ2xsIGNoYW5nZSBpdCB0byBSZXZpZXdlZC1ieSBkdXJpbmcgY29tbWl0dGluZy4gDQoNClJl
dmlld2VkLWJ5OiBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4NCg0KPiBTaWduZWQt
b2ZmLWJ5OiBBaG1ldCBaZXJlbiA8bmlrbzN4QHByb3Rvbi5tZT4NCg0KDQo=
