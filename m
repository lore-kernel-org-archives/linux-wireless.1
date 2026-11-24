Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512005;
	b=XY0alau32ctYDh1a7XLX6r3ZKEaeQQn+eHTF0CeG/+R8aCpKAaj0mCq6O+uIY2P6Crgq
	 LZ2QaMTqJECRub22KyMYfrPTwhJ8QA09yfWbItXaeFSuunTqA08yxgglFOmPf47S3p7VI
	 Y1RxOpH2R9PGlL0L7nz4wH1dNgnfMhCu2yHgSLoLzTp+tgoZEcmqKPRLtuBV8byHi1fSi
	 ozmTw+D7ClLXP09EmxlpJ9dStSaH19FYM6ags/Z0zEebB0H0RVg65DKCGnX9SpChWXmeS
	 9kzOV/D2DK91a208C8hsTGta310kA5voVjxQF+r4Mt6RlEUF6GjdoMyvbP79gJp75qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512005;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NqW9qBlJNDh8qdSOKk35usq/AwR4fbdMdCFn+b6t+Xc=;
	b=Z3vr734le9Zcnw5aJPpTEzz1hGhpHvSzmoiIwsGU8eCmWlGezguZnmR7plmJ8t9otBPm
	 zTZWzIfs8h26FhcXxo2hL/7doUIAAXHKZoPFn9k6Rw6XtF9/7VYhO0zxfRTAo9WYJVxjR
	 Lt+6jMXVpLvY5+8I9Ajs9o+z9uQk7BJJtF03v0Kl5qIL35a1+mUiNerckA8r9XM+QfMow
	 lydv/FrAnDjGwf0BHVvG/CYQy5fME8NynNfKZzGuyC743umR5PuWGggHBHZAqpn6Rq1ZM
	 j4xW8YyH1cHos+GmXRq1bKCqIqgykO1bvDqugNM6wrfCiJR5ktcCWSbKaEdgdnDHSMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oXjE7eIx;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDE606A332
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCDE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oXjE7eIx
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO9JwviE2404311, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795511999; bh=NqW9qBlJNDh8qdSOKk35usq/AwR4fbdMdCFn+b6t+Xc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oXjE7eIx31p/RlKql032e9NbcKw0r6rjincnB0Z12D+oVS3i6LrGiS0iQLEl0yiM6
	 iUAhYiVzXNVM69v7lyTCEBBt2RTZRy3kLcGGMMNH0gnsNmfhGapGNzrz4seOgeJLOH
	 OMGzylf57+PcNqtjD4WAxtwBcnaMIFPNvrzzRrxpGrCd5ikhOsp1LA+bb8qyzPrKR5
	 bF0kwkxKuHYGFtpsoTNZIzbri9q6NAkV1Q4DBo3a8dTaOdR2BEXC/dZB4GTQ1NyG7Z
	 QEX5+BotXdviF47//0RuLXeTaEP0hRMTC6PXwY15ZwOxw4qSfDoFgP/WASzJH1aUWL
	 WYZqTzM1Vid3g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO9JwviE2404311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 17:19:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:19:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 17:19:59 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jimmy <kernel@jimmycushnie.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows
 with the same hardware
Thread-Topic: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows
 with the same hardware
Thread-Index: AQHde+qVS/GIpZ76Fk61c4tbPwE3arc88Gyg
Date: Tue, 24 Nov 2026 09:19:58 +0000
Message-ID: <c4513d04819e4b52b855e5a21c67b8d2@realtek.com>
References: <a98a6666-1499-433f-8c3f-d7277224b334@jimmycushnie.com>
In-Reply-To: <a98a6666-1499-433f-8c3f-d7277224b334@jimmycushnie.com>
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

SmltbXkgPGtlcm5lbEBqaW1teWN1c2huaWUuY29tPiB3cm90ZToNCj4gSGVsbG8sDQo+IA0KPiBJ
IGhhdmUgYSBSVEw4OTIyQUUgd2hpY2ggb25seSBnZXRzIDYwLTEyMCBNYnBzIFRDUCB0aHJvdWdo
cHV0IG9uIExpbnV4LA0KPiBldmVuIHRob3VnaCB0aGUgbGluayByZXBvcnRzIDEyMDAuOSBNQml0
L3MgSEUtTUNTIDExIE5TUyAyIGluIGJvdGgNCj4gZGlyZWN0aW9ucyB3aXRoIGEgc3Ryb25nIHNp
Z25hbC4gDQoNCkl0IGxvb2tzIGxpa2UgUEhZIHJhdGUgaXMgbm9ybWFsLiBQbGVhc2UgY2FwdHVy
ZSBhaXIgcGFja2V0cyBhbmQgY29tcGFyZQ0KdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBXaW5kb3dz
IGFuZCBMaW51eC4gDQoNCj4gVGhlIHNhbWUgbWFjaGluZSBnZXRzIH42MDAgTWJwcw0KPiB0aHJv
dWdocHV0IHdoZW4gYm9vdGVkIGludG8gV2luZG93cyAxMS4NCj4gDQo+IElzc3VlIGlzIHJlcHJv
ZHVjaWJsZSBvbjoNCj4gICAgLSA3LjMuNSwgaW4ta2VybmVsIHJ0dzg5DQo+ICAgIC0gNi4xOC42
MCwgaW4ta2VybmVsIHJ0dzg5DQo+ICAgIC0gNy4zLjUsIG1vcnJvd25yL3J0dzg5IGF0IGNvbW1p
dCBmMmNlNjZlDQo+IA0KPiBUaGUgV2luZG93cyBkcml2ZXIgdGhhdCB3b3JrcyBmb3IgbWUgaXMg
NjEwMi4yNC4xNDMuMC4NCj4gDQo+IE15IHN5c3RlbToNCj4gLSBNb3RoZXJib2FyZDogR2lnYWJ5
dGUgWDg3MCBBT1JVUyBFTElURSBXSUZJNyBJQ0UgKG9uYm9hcmQgUlRMODkyMkFFKQ0KPiAtIENQ
VTogQU1EIFJ5emVuIDkgOTk1MFgzRA0KPiAtIDA5OjAwLjAgTmV0d29yayBjb250cm9sbGVyIFsw
MjgwXTogUmVhbHRlayBSVEw4OTIyQUUgWzEwZWM6ODkyMl0NCj4gICAgKHJldiAwMSksIHN1YnN5
c3RlbSBbMTBlYzo4OTIyXQ0KPiAtIGNoaXAgaW5mbyBDSUQ6IDcxLCBDVjogMiwgQUlEOiA2OTMz
LCBBQ1Y6IDEsIFJGRTogMQ0KPiAtIEZpcm13YXJlIDAuMzUuODAuMyAoOGVmNGYwY2YpLCBydHc4
OS9ydHc4OTIyYV9mdy00LmJpbg0KPiAtIERpc3RybzogQ2FjaHlPUw0KPiAtIEFQOiBSb2dlcnMg
KENhbmFkYSkgZ2F0ZXdheSBDR000MzMxQ09NLCBoYXJkd2FyZSByZXZpc2lvbiAyLjAsIDUgR0h6
DQo+ICAgIGNoYW5uZWwgNDQsIDgwIE1IeiwgODAyLjExYXgsIFdQQTItUFNLLiBSZWd1bGF0b3J5
IGRvbWFpbjogY291bnRyeSBDQS4NCj4gDQo+IFRoaW5ncyBJIGFscmVhZHkgdHJpZWQ6DQo+IC0g
aXcgcG93ZXJfc2F2ZSBvZmYNCg0KSSB0aGluayB0aGlzIGNhbiBhZmZlY3QgdGhyb3VnaHB1dCBz
aWduaWZpY2FudGx5LiBQbGVhc2UgdXNlIGl3IGdldA0KdG8gY29uZmlybSBhZ2Fpbi4NCg0KPiAt
IHJ0dzg5X3BjaSBkaXNhYmxlX2FzcG1fbDE9eSBkaXNhYmxlX2FzcG1fbDFzcz15IGRpc2FibGVf
Y2xrcmVxPXksDQo+ICAgIHJ0dzg5X2NvcmUgZGlzYWJsZV9wc19tb2RlPXkgKGNvbmZpcm1lZCBh
Y3RpdmUgaW4gc3lzZnMpDQoNClRoaXMgc2hvdWxkIGJlIGFkZGVkIGludG8gL2V0Yy9tb2Rwcm9i
ZS5kLywgYW5kIGNvbGQgcmVib290IHRvIHRha2UNCmVmZmVjdC4gKFRob3VnaCBJIHRoaW5rIHRo
aXMgZG9lc24ndCBhZmZlY3QgdGhyb3VnaHB1dCB0b28gbXVjaCkNCg0KUGluZy1LZQ0KDQoNCg==
