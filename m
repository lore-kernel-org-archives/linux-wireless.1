Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301883;
	b=255o0HLkDpSsf8UZU8bX8EXpgFEwEvbvnYvJCW5/TyO5RHCd+vKElPZXubZnpvnz8h9D
	 e+PiPECp479QFpgcfWNsMqr+MUzeaLhXeuaynamCDfv40EDcjQjW69LLAklB8cRd4GfMs
	 8K2bL2MO8FTK6vx+39JMPM33swEigDyVPv0J5jsZjb1Ml0+C7+eRskSX5I3nACfdtvoeD
	 cwE1DG5JvwSBzR+eyIl2I9vQkXzp0au97aG2AgsZMhLSfDOxT2Ix0girn5SiNaIB7a3lh
	 d8dvbH9NtDDAfEjYIa/0Jdxcrr0qgs1vKyiN7jzr5ujAg5mGLB0u/wnZ+kFBTLv97cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301883;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=8/x/JjulVcCFt8Bl0KlPQQYsmAF1dc5N/Sx+9vpjo+c=;
	b=XX8Fqir3rXEYjGszub53U/o6g+QASkUWhBm264c2okuPRjCYBFLoeOwvE8dubFeE9est
	 csfBw8JTLVckPmDTZWnw2TO3z+Plk9GfdypxmP0Q+qcdUCxEEbiw6VNitjY7hYrr/pY/n
	 hH/X4/npOhBtfp6xaywxaBj46I7xpb3lEwCm3h4TIY7VfkUq7mnCXpvjhH2/WyEmO26hV
	 clWsa4dZDVD9YpvBJobDVykB9JGRcV9i3CrAOUC46f6zxu8sfuwXNSTlMqfOLzrYxLzaw
	 9XQZC+HSGfTslb2qZTsck8KJr32EF5oxeRKp8WmllCIR4VXUKMCtt6iREKnnaD9rwjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RNYNe1sF;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC68606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RNYNe1sF
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AA9BI6F01174902, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794301878; bh=8/x/JjulVcCFt8Bl0KlPQQYsmAF1dc5N/Sx+9vpjo+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RNYNe1sF0NjJ1JjUXrDvvzunjjHbktPABzNuEwMUeolyRpjrDCMEvtuBNdwc5O6sW
	 upjKqXleYMYPbmsci4Ul5yubntrE/oM3t9v9iaGPp7Da4xMyDhyRJEhYNQE7UfeQAL
	 LDrVLy2EXE9fp2hSuJbYAO2x8sGey8vUn4Iw1r74y+L5fWxjUjTmRDlqwCmnKxNk/4
	 5/ICo7aOqgZcVd8dQfQ1F433+Jo2bJsf8yDoCnfbTChu9vfSj97CZzjI213oDnvLor
	 YFYpCrI/wkDRWOfxeKZE9Q60cNoqk9yRuHIa1ZZ2W89Gd4vjFvWZNOASBitz5/DFWu
	 x1pCT+TNeDSVw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AA9BI6F01174902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 17:11:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 17:11:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 17:01:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 10 Nov 2026 17:01:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: BrNcO BrNkO <brnco925@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: rtw89: 8852cu: no data TX under firmware RA at 6 GHz 160 MHz
 (fixed rate works)
Thread-Topic: rtw89: 8852cu: no data TX under firmware RA at 6 GHz 160 MHz
 (fixed rate works)
Thread-Index: AQHdb3TbjoYAYqpEDEKDYQv9wQ0F0Lcm3vfA
Date: Tue, 10 Nov 2026 09:01:16 +0000
Message-ID: <0b15ba0a644c4c82bfd3c92a93b647e9@realtek.com>
References: <CAD8w8XJuPc0mDtLnOb3MfwKJeC9t9UU0dsNoHVH=azzbKxBWyg@mail.gmail.com>
In-Reply-To: <CAD8w8XJuPc0mDtLnOb3MfwKJeC9t9UU0dsNoHVH=azzbKxBWyg@mail.gmail.com>
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

QnJOY08gQnJOa08gPGJybmNvOTI1QGdtYWlsLmNvbT4gd3JvdGU6DQo+IElzb2xhdGlvbiAob25l
IGNoYW5nZSBwZXIgdGVzdCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAx
LiA2IEdIeiBCU1MgYXQgODAgTUh6IChBUCBzd2l0Y2hlZCB3aXRoIGNoYW5fc3dpdGNoLCBvciBT
VEEgd2l0aG91dA0KPiAgICBIRTE2MCBjYXBhYmlsaXR5KTogd29ya3MuDQo+IDIuIDUgR0h6IEJT
UyBhdCAxNjAgTUh6IHdpdGggdGhlIHNhbWUgYWRhcHRlcjogd29ya3MuDQo+IDMuIDYgR0h6IDE2
MCBNSHogd2l0aCBhIGZpeGVkIHJhdGUgaW4gdGhlIFRYIGRlc2NyaXB0b3IgKHVzZV9yYXRlPTEs
DQo+ICAgIGRpc19kYXRhX2ZiPTEpOiB3b3JrcyBmb3IgT0ZETTYvMjAsIEhFIE5TUzEgTUNTMCBh
dCAyMC80MC84MC8xNjAsDQo+ICAgIEhFIE5TUzIgTUNTMCBhdCA4MC8xNjAsIGFuZCBIRSBOU1My
IE1DUzIvTUNTNCBhdCAxNjAuIFRoZSBoYW5kc2hha2UNCj4gICAgY29tcGxldGVzIGFuZCBwaW5n
IHRvIHRoZSBBUCB3b3Jrcy4gTUNTNyBhbmQgYWJvdmUgYXQgMTYwLCBhbmQNCj4gICAgTUNTOSBh
dCA4MCwgYXJlIG5vdCBkZWNvZGVkIGJ5IHRoaXMgQVAuIEkgYmVsaWV2ZSB0aGF0IGlzIGxpbmsN
Cj4gICAgYnVkZ2V0OyBXaW5kb3dzIGFsc28gdG9wcyBvdXQgYXJvdW5kIEhFMTYwIE1DUzYgaGVy
ZS4NCg0KRGlkIHlvdSBtb2RpZnkgZHJpdmVyIHRvIHNldCB1c2VfcmF0ZT0xPyBOb3QgdXNlIGl3
IHNldCBiaXRyYXRlcywgcmlnaHQ/DQpBY3R1YWxseSAnaXcgc2V0IGJpdHJhdGVzJyBpcyB0byB1
c2UgUkEgdG8gY29udHJvbCByYXRlLiBJZiBpdCBjYW4gd29yaw0KZm9yIGNlcnRhaW4gY29uZGl0
aW9ucywgaXQnZCBiZSBlYXNpZXIgdG8gYWRkcmVzcyBjYXVzZXMuDQoNCj4gNC4gNiBHSHogMTYw
IE1IeiB3aXRoIGZpcm13YXJlIFJBOiBmYWlscyBpbiBldmVyeSB2YXJpYW50IEkgdHJpZWQuDQo+
ICAgIFRoZSBIMkMgUkEgTUFDSURfQ0ZHIGlzIGlkZW50aWNhbCB0byB0aGUgd29ya2luZyA4MCBN
SHogY2FzZQ0KPiAgICBleGNlcHQgYndfY2FwIDMgaW5zdGVhZCBvZiAyLg0KPiAgICAtIHJhX21h
c2sgbGltaXRlZCB0byBIRSBOU1MxIE1DUzAtNDogZmFpbHMuDQo+ICAgIC0gcmFfbWFzayB3aXRo
IEhFIE5TUzEgTUNTMCBvbmx5OiB0aGUgaGFuZHNoYWtlIHNvbWV0aW1lcyBwYXNzZXMsDQo+ICAg
ICAgdGhlbiBwaW5nIGZhaWxzLg0KPiAgICAtIHNzX251bSAwLCBlcl9jYXAgMCwgZGNtX2NhcCAw
LCBmaXhfZ2lsdGZfZW4gMCwgaW5pdF9yYXRlX2x2IDEuLjMsDQo+ICAgICAgQ1NJIGVuYWJsZWQ6
IGFsbCBmYWlsLg0KPiAgICAtIENNQUMgRElTREFUQUZCPTAsIERJU1JUU0ZCPTAsIFJUU19FTj0x
LCBIV19SVFNfRU49MTogYWxsIGZhaWwuDQo+ICAgICAgRXZlbiB3aXRoIFJUUyBlbmFibGVkLCBu
byBSVFMgYXBwZWFycyBvbiBhaXIuDQoNCkRpZCB5b3UgbW9kaWZ5IFJUUyB0aHJlc2hvbGQgc2V0
dGluZyBpbiBfX3J0dzg5X21hY191cGRhdGVfcnRzX3RocmVzaG9sZCgpID8NCg0KPiAgICAtIHJh
X21hc2sgd2l0aCBPRkRNIG9ubHkgKDB4ZmYwKSBhdCBid19jYXAgMzogd29ya3MuDQo+ICAgIC0g
YndfY2FwIGZvcmNlZCB0byAyIHdoaWxlIHRoZSBjaGFubmVsIHN0YXlzIGF0IDE2MCBNSHo6IHdv
cmtzLg0KDQpDYW4geW91IGFsc28gdHJ5IGxkcGNfY2FwIDAsIHN0YmNfY2FwIDA/DQoNCg0KSW4g
b3VyIHNpZGUsIHdlIGNhbiBjb25uZWN0IGFuIEFQIHdpdGggYmVsb3cgY2hhbm5lbDoNCiAgIGNo
YW5uZWwgMzcgKDYxMzUgTUh6KSwgd2lkdGg6IDE2MCBNSHosIGNlbnRlcjE6IDYxODUgTUh6DQoN
CkFsc28sIHdlIHVzZSBob3N0YXBkIHRvIHN0YXJ0IEFQIG1vZGUsIHdoaWNoIGl0IHdvcmtzIGFz
IHdlbGwuDQoNCkNhbiB5b3UgdHJ5IGFub3RoZXIgQVAgdG8gc2VlIGlmIGFueXRoaW5nIGRpZmZl
cmVudD8NCg0KUGluZy1LZQ0KDQo=
