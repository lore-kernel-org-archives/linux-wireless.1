Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567559;
	b=hT4OsQVTO/Wn3Rqw4rVwNACj3Pht1b5F1KlzXnuQdjRv19Fn2JDD8sIUNA2BXif6B8Mo
	 ipOfaZfJccfzPz3a7CBGsdcu8/aq3N7rzUsCbXheBQ0MRyogSGsX07YkECrHV/vclRUv6
	 dLqJ5uqHpPsxCH3a6RotpmejL8D/Urx0wneihbdj36JA9Oay2lPvtrhe7Zyv+voOcp5Rx
	 iTqaFloJwu5TTy8eWzH0jPZFBLuRVFCljeTcrTF1Dg2KS3hUrvrNpsQ3vMxE9doQSDIB+
	 4fNJJ4kTS5FhsTXPokKFlO40dH6hm4zW9mjxotA89dRcG/scWtDct7wOdWteLpKmS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567559;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qLFS6dorIIRfwv1hJ2fQ9Jar64xz38lAhoMSxZ2Ku5g=;
	b=0oGHB0Wy2PRmehCVUPCXlUrjglQQ0oKG/jJ36eHA1T631x/2+Nz6DVc5N+OrBEg323YA
	 WlOGZVF/83CtcpDokEOMWjC22w+sQBMpxT96GR3Ka6OtyRG0T/WksPNWwdVfw4el/L5ms
	 TdpXyG8U/etwGZbgOtRVuR/xXFyQtca0s3wgmbRNamRIeIIgtpPlkDNOVv+MYNHUJxDfz
	 qS4J2OyOC0dDbMKE4t5I+2W8xeRVm7bLeDbt2S7AdMcnQ/0M8xw2cDNAe7SOaP0niSRBI
	 LGV6nTjMulZ6hLG9zZsbzp4AJES0Nbkv82dWPAImGm1CWc0kAnQLzwLh1M/okKCQbNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=K8lvEiUg;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F03606A31E;
	Wed, 25 Nov 2026 00:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=K8lvEiUg
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AP0jsWdB2983903, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795567554; bh=qLFS6dorIIRfwv1hJ2fQ9Jar64xz38lAhoMSxZ2Ku5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=K8lvEiUgJe+SijjKNupWmQMLUeqy8if3nvNdK638t52l0iTyhesTEfDwElXPrUNik
	 Kr+P8XnZXmY70S6ufRPbcO1Kv80OmTpEe7RmaS9XN33Mf/OOBkVHr+zJ1dlyf09UER
	 lyTgzlSBpDXMOgoIvvHMq/AbH0LbzBP1HQcY2bw7wCLi2ampLZaHf0qRUU5FtlPEmw
	 XurFXQVb+BjUnM572/JSL8Bz/gt319gbHeO1Zj1gm9PP/3GcmGMIjB21dMa+qmwUgx
	 FelhBXA0snXVk8lp1Qnl3iYMbvzgowjSx5Qp5UlWGFrRAYvpEZ9+4w2eoIt+c9B1cl
	 mOW595Vd1Vw8g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AP0jsWdB2983903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Nov 2026 08:45:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 08:45:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 25 Nov 2026 08:45:54 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Topic: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Index: AQHdeOKzoeDEYzUTwEarjPoSRqZFqLc5b/EAgAHyyQCAAQk2AIAANwyAgAFXtlA=
Date: Wed, 25 Nov 2026 00:45:54 +0000
Message-ID: <e0d6094e1b4c4372985052ec126a31ed@realtek.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
 <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
 <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
 <ecad59dfc02941058452cad1889523ce@realtek.com>
 <CABOQOSVEG0+WvX04swuVAbUFG=Ga0HTcBJjzpaXB_eKZRwE35g@mail.gmail.com>
In-Reply-To: <CABOQOSVEG0+WvX04swuVAbUFG=Ga0HTcBJjzpaXB_eKZRwE35g@mail.gmail.com>
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

SmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gT24gVHVlLCAyNCBOb3YgMjAy
NiBhdCAwODo1OSwgUGluZy1LZSBTaGloIDxwa3NoaWhAcmVhbHRlay5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gSmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+IE9uIFN1biwg
MjIgTm92IDIwMjYgYXQgMTE6MjgsIFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPiB3
cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSG8gSmllIEZlbmcgPGhqZjMxMDhAZ21h
aWwuY29tPiB3cm90ZToNCj4gPiA+ID4gPiBydGxfdHhfc3RhdHVzKCkgc3RhcnRzIGEgVFggQkEg
c2Vzc2lvbiBmb3IgYW55IFFvUyBudWxsIGRhdGEgZnJhbWVzLA0KPiA+ID4gPiA+IHNvIHRoZXNl
IHBvbGxzIHN0YXJ0IGEgc2Vzc2lvbiBldmVuIHRob3VnaCB0aGV5IGRvIG5vdCBjYXJyeSBkYXRh
Lg0KPiA+ID4gPiA+IFRoYXQgY29zdHMgYW4gQUREQkEgZXhjaGFuZ2UuDQo+ID4gPiA+DQo+ID4g
PiA+IFdpbGwgaWVlZTgwMjExX2lzX2RhdGFfcW9zKCkgYmUgbW9yZSBzdWl0YWJsZT8NCj4gPiA+
DQo+ID4gPiBpZWVlODAyMTFfaXNfZGF0YV9xb3MoKSBvbmx5IHRlc3RzIHRoZSBRb1MgYml0ICgw
eDgwKSwgd2hpY2ggaXMgYWxzbyBzZXQNCj4gPiA+IGZvciBRb1MgbnVsbCAoMHhDMCksIHNvIHRo
ZSBCQSBzZXNzaW9uIHdvdWxkIHN0aWxsIGJlIHN0YXJ0ZWQuDQo+ID4NCj4gPiBIb3cgYWJvdXQg
aWVlZTgwMjExX2lzX2RhdGFfcW9zKCkgJiYgaWVlZTgwMjExX2lzX2RhdGFfcHJlc2VudCgpID8N
Cj4gDQo+IGllZWU4MDIxMV9pc19kYXRhX3FvcygpIGlzIGFscmVhZHkgY2hlY2tlZCBpbiBydGxf
dHhfc3RhdHVzKCk6DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjQtcmMx
L3NvdXJjZS9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0bHdpZmkvcmMuYyNMMjM0DQoN
CkdvdCBpdC4NCg0KQWNrZWQtYnk6IFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPg0K
DQoNCg0KDQoNCg==
