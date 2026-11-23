Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394115;
	b=SXEGbqsmygZeg6N2+m6L8o83v8T78RI7W046/nqKz8wo+CGJHpy4J+jyLn+ddYDEuVb3
	 UYrgdG47pZNgsE0xaG/lbr+9SEnSt0LXFFVW6+TwjXLjhzwXqTZs3/Q5WyyDlyQ4yMPjG
	 QF79SjKvcijn64Ws/AIaqNSl+n2AoSXkycUCq7Q//N4X71eK23l2/yBq5cxYkuW8Qna2M
	 mS1LXNBPB66rTRbx1xW70J9Sw79A5lHIYviFLxlyG7hViXheleJ3a0egxU1i32u39kpiK
	 3y7Yht6eSyCVvvr++GdUPjj4TGQY6/8giEtUrJVWbArBo9dATMqaoBnrEhJIQzEcIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394115;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9Or1qhq+yHkoPRQn7YYNZyORxVKUllljxF1DYw84QxM=;
	b=zE2v0eAiPHtnshePHHmPlBh/XbMLPjRBHRamr4gnvVPJLV+t26wb5PzAnjs8ip70kMPl
	 TGnnPENym3I10OELR7iT5RGQCjoZ/yxgc7UR2S4bzchXeUwjDfZvkDRY7VmH7L6SEdOzL
	 G9a8y/61nUl4x20HBonDqlu6tsMMd3BSFpri0+KcHy5eTetQNa6XqRFg7skKyysVSbU0Y
	 /iIaiRKgveQlRwc74wThqHnT4grqD7j2wjU18q2iDVzXljFbnWB/Y7xJho3aZx2wYQuHV
	 rOwjHo7YNrkGVk2KDFzXmS5rMeKltt9THIlI6+Cv+8gjd60L/POs+OoRbvTuRpwAQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s+ZEH2AC;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BF606A31A;
	Mon, 23 Nov 2026 00:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s+ZEH2AC
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN0YeYB21167456, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795394081; bh=9Or1qhq+yHkoPRQn7YYNZyORxVKUllljxF1DYw84QxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=s+ZEH2AC5If42CuxY7a3L07TuV0velJWkmhlcbVG4KYKMfdfbZLRCyNdNCwkyrak1
	 qepCrMGfUwvHEdvlh7A5KosW6uaaCJ9LoeBB3l88pumHxfGBrQaLp20snT/MfOFBz/
	 6HooBDjgN8pcokM1uQyU3hdWqRVO9iNIQ9dn+VaCFcmJVVZdMi06swfnHarl2cxpA3
	 ExMP7KP27Qvc91HxCveHu6KpUaYGAloUSLQOPw6d27+fdd2V7SpUviIPGoje++uKaH
	 5Emn+KIgDFW36XN3n+tn9LLIvsxryp7tc6auK5+10D36jeQF0EAHb6LgOj6qPl28gh
	 HNrPS4nU4Qzgg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN0YeYB21167456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 08:34:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 08:34:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 08:34:41 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 2/3] wifi: rtl8xxxu: honour the retry count of
 injected frames on gen1 chips
Thread-Topic: [PATCH rtw-next v2 2/3] wifi: rtl8xxxu: honour the retry count
 of injected frames on gen1 chips
Thread-Index: AQHdekaoSsPnMAd5xUGbwFELudwqnbc60DXg
Date: Mon, 23 Nov 2026 00:34:40 +0000
Message-ID: <132dd24ce9bd4294a048032021822b30@realtek.com>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
 <20261122-b4-inject-v2-2-0ee720fe706d@proton.me>
In-Reply-To: <20261122-b4-inject-v2-2-0ee720fe706d@proton.me>
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
Cj4gbWF4X3JhdGVfdHJpZXMgaXMgbmV2ZXIgc2V0LCBzbyBtYWM4MDIxMSBjbGFtcHMgdGhlIHJl
dHJ5IGNvdW50IG9mIGV2ZXJ5DQo+IGluamVjdGVkIGZyYW1lIHRvIHplcm8gYW5kIHRoZSByYWRp
b3RhcCByZXRyaWVzIGZpZWxkIGhhcyBubyBlZmZlY3QuDQo+IEluamVjdGVkIGZyYW1lcyBhbHNv
IGlnbm9yZSBJRUVFODAyMTFfVFhfQ1RMX05PX0FDSyBhbmQgdXNlIHRoZSBkZWZhdWx0DQo+IGhh
cmR3YXJlIHJldHJ5IGxpbWl0IG9mIDQ4LiBVbmljYXN0IGZyYW1lcyB0byBhbiBhYnNlbnQgc3Rh
dGlvbiB0aGVuDQo+IHRha2Ugc2Vjb25kcyBlYWNoLCB3aGljaCBzdGFsbHMgYWxsIGluamVjdGlv
biBiZWhpbmQgdGhlbS4NCj4gDQo+IEFkdmVydGlzZSB0aGUgNi1iaXQgcmV0cnkgbGltaXQgb2Yg
dGhlIFRYIGRlc2NyaXB0b3IsIGFuZCBvbiBnZW4xIGNoaXBzDQo+IHByb2dyYW0gdGhlIHJldHJ5
IGxpbWl0IG9mIGluamVjdGVkIGZyYW1lczogbm9uZSB3aGVuIG5vIEFDSyBpcw0KPiBleHBlY3Rl
ZCwgb3RoZXJ3aXNlIHRoZSByYWRpb3RhcCByZXRyeSBjb3VudC4NCj4gDQo+IFRlc3RlZCBvbiBS
VEw4MTkyQ1UgKDBiZGE6ODE3OCk6IDQwIHVuaWNhc3QgZnJhbWVzIGF0IDEgTWJwcyB0byBhbg0K
PiBhYnNlbnQgc3RhdGlvbiBkcmFpbiBpbiB+MC4xMyBzIHdpdGggTk9BQ0sgb3IgMCByZXRyaWVz
LCB+MC40NSBzIHdpdGgNCj4gMiwgfjEuMSBzIHdpdGggNCBhbmQgfjMuMyBzIHdpdGggNiByZXRy
aWVzLiBXaXRob3V0IHRoaXMgcGF0Y2ggdGhlIHNhbWUNCj4gZnJhbWVzIGhhZCBub3QgZHJhaW5l
ZCBhZnRlciAxMDAgcywgZXZlbiB3aXRoIE5PQUNLLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWht
ZXQgWmVyZW4gPG5pa28zeEBwcm90b24ubWU+DQoNClJldmlld2VkLWJ5OiBQaW5nLUtlIFNoaWgg
PHBrc2hpaEByZWFsdGVrLmNvbT4NCg0KDQo=
