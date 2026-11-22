Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313162;
	b=AGtykLUuqFCChpGFb98cUs8uei/BFBZU/Z2M4wfHcGcs19NuKOmW8HqUzZ5Hwo+Dcqed
	 8EBjdup5bBL6PBwM3PAdsOtlUqh2pAbI4kLTsoVe2dZtILTtG3iOw+mN+b/LEB52bsi+A
	 KPMeA7LqOZ5g8W8RSBhTMBQQlKQ2Ktpw1kH90wWBmrCcSX2KQYMP2PPC4sg2UjWxfuiJO
	 ZR6uCl0u2lLjuCrCRPrL6J/1OUjkk67V5fSaGtYmOS0yhoyE7kgExxxXhYCvqGKbiW0ua
	 Ua/D2/66WUxY7TAtSkNQJF55hw2WnYkrA3BYetd8jBRudJ0TRgmq7bk1PuDRlu+9zVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313162;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qUpNHegFPkl++oewfv3eET+ToFpAOrpx+/i0EpVj764=;
	b=oennTcOWSZ9lKzK4OvKiChQsycWeIPEx3hpDpjVhWne7G7iKOdfVbx/eeqx4gKZ7nbZf
	 M4xIWWawppFTBIekVjnv5ZBI4KFI/Nkpv2gTj/Jf0yaySqk+6bGMWAfFco+z1Yg/qmuC0
	 Tyg7oPw115VzdsWTjNfwP0dTjKbibodciLHr/UDE2IU5f/NrDxo27rJ7LFfpwpmVhgIqW
	 3WF9lsY8d7jSC/vMxyL4QJ2nQGNGmrXonaGaFIyOYczBZczkdLxLLhldJhmcG3+ROq7L+
	 of5fUI0H7FJ8H++uan/lQshxvOfcdsgtmwMgGP+67BlmAUNgLUEsYX7/d1IY1/hAx/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=u0wryXsG;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A5606A330;
	Sun, 22 Nov 2026 02:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8A5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=u0wryXsG
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM25UkdC519884, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795313130; bh=qUpNHegFPkl++oewfv3eET+ToFpAOrpx+/i0EpVj764=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=u0wryXsG1Ae6aDaqdDwTvv6AkjohSm9/EzdrhHhbdRiuyiwJWWBN/dz82Bf4ZY6ty
	 OmE/Kfj+fk2FlGa2tPn2T96amtj964Vq5FAmYKorH/rGjdxtvsybOhTpLYfLmlsTBu
	 mGhNeqIhEKDyCZUs3Ivm6hAVvEzyOHP6kyCKi+auqAFb8Rv4wVNoJpqssMVl+g6EEm
	 Jhx+uxNnRtoPzN85jeVkaNxiZ9YS8exHjoWIWNvPeaCGPKR2e3hiVSR843doOvyZs6
	 ubWWiNqc7jv+cd6BVYk5IUlBKodhArTWv56RafwQFUzta8PpHwrzC1iNyWgy/hqzsu
	 X8THpPPBln79Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM25UkdC519884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 10:05:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 10:05:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 10:05:30 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 3/3] wifi: rtl8xxxu: honour the bandwidth of
 injected frames on gen1 chips
Thread-Topic: [PATCH rtw-next 3/3] wifi: rtl8xxxu: honour the bandwidth of
 injected frames on gen1 chips
Thread-Index: AQHdeHKp2ZJtlHh+BU6r33SS8ocXrLc5WdAA
Date: Sun, 22 Nov 2026 02:05:30 +0000
Message-ID: <46a467eddd9e48e0b3ae93391608e857@realtek.com>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
 <20261120-b4-inject-v1-3-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-3-1e1693af0c6b@proton.me>
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
YXQgMjAgTUh6IHRoZXkNCj4gc3RheSBhdCAyMCBNSHouDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBB
aG1ldCBaZXJlbiA8bmlrbzN4QHByb3Rvbi5tZT4NCg0KQSBzbWFsbCBuaXQuIE90aGVyd2lzZSBs
b29rcyBnb29kIHRvIG1lDQoNCkFja2VkLWJ5OiBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVr
LmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUv
Y29yZS5jIHwgMjMgKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsOHh4eHUvY29yZS5jDQo+IGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvcmVhbHRlay9ydGw4eHh4dS9jb3JlLmMNCj4gaW5kZXggYjE1OWQ5YjY0Yy4uMmVl
ZjQ1ODVhOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGw4
eHh4dS9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGw4eHh4
dS9jb3JlLmMNCj4gQEAgLTUyODEsNyArNTI4MSw3IEBAIHJ0bDh4eHh1X2ZpbGxfdHhkZXNjX3Yx
KHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LCBzdHJ1Y3QgaWVlZTgwMjExX2hkciAqaGRyLA0KPiAg
ICAgICAgIHUzMiByYXRlID0gMDsNCj4gICAgICAgICB1MTYgc2VxX251bWJlcjsNCj4gICAgICAg
ICBpbnQgcmV0cmllczsNCj4gLSAgICAgICBib29sIGluamVjdDsNCj4gKyAgICAgICBib29sIGlu
amVjdCwgYnc0MDsNCg0KVG8gYmUgaW4gcmV2ZXJzZSBYJ21hcyBvcmRlciwgZGVjbGFyZSBpdCBp
biBhbm90aGVyIGxpbmUuDQoNCj4gDQo+ICAgICAgICAgaW5qZWN0ID0gcnRsOHh4eHVfdHhfcmF0
ZV9pbmplY3QodHhfaW5mbywgJnJhdGUsICZzZ2kpOw0KPiAgICAgICAgIHJldHJpZXMgPSBydGw4
eHh4dV90eF9yZXRyeV9pbmplY3QodHhfaW5mbyk7DQoNClsuLi5dDQoNCnB3LWJvdDogY3INCg0K
DQo=
