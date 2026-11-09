Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204883;
	b=VkNFjYqWYwaMo55g4FS5g6xO73hNc7XPFouoYyqokVGojJxcnaOugsKqagoyJtT6CqNr
	 USPA4E1k1BwS+Gw7RZg1hjeXSkORiVgnAMgphL7kDO1VBjbRI0inmW20DnYDYHIxsjA5d
	 fBh8q/SwhogyuEjNobXf8/YBndUbOv7oNTbrnYmc78+UlJoZFI1pAuTkQ3a8k3FjXMr6q
	 OMd3/prl01bibuiI6xM3LgfAKiiebPzdL9bmC8ggze/uicLVe6kiw8PRMWcrkaT47DaDj
	 HdzbDl6QmiBdR7doEaoirsAfCHC+n/Moc32TKVU0NXsXacV5CgoxX5rO30EMWHokcNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204883;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7SE27M7/nKlqHU4dW8cV7hQmRY+kZPB6hzPIzbKWDhQ=;
	b=Xr6A389ohxfl/41av9430hVAuHW3KMMIi2CI9cL2L/cvAOwDfqi4NtwIH0n84fitxY3a
	 9+oJ28mzMgG4ws0m3ZmAFpjavcmwKjJHrzsU88NkSjAIP9sVSH+y4Yj92B34hC5SiMRKm
	 a96rA6me5aGHJmMz1gerhdi0UecZ/FdYAltIKuMwqZhYkzRCPB5+NyYqaX9hh+GAP7mSO
	 0MAQv3BQE1lM4C6v0p1mMCS2vKtw5lgs5iSK99udRi1+YG2FKmDnPPTMCkdDe2W2Mmr80
	 QOnzqAilX1G5akRfyNT1Z9A9UM0qiyZesEOcJuje8PhMkCmmqpnTTPOe1/RBYpz7tUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RPoFhTmP;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16186606A322
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 06:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16186606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RPoFhTmP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A96EUUt84103788, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794204870; bh=7SE27M7/nKlqHU4dW8cV7hQmRY+kZPB6hzPIzbKWDhQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RPoFhTmPewdSYtzFx2G8RMde2umPb+xorIYjZmWgSN4eQY9qzm4u6jIbIeAw532KZ
	 t/BMcXt7jiMx+nKfZAEpIvoobi3aeoAKbYfUhRJ3oXmy1gpFFtvB00MFgSyVF4lMlH
	 puAj01YZbp3Uga2/5gaYK0BsvPIPYxQCIJZe8TSsgmfT/huxx2V5GKt1HbnAY5x8cR
	 1zaRdFlIhVUEJBddOcYMjUvP7z2NANpVDJjpN60N7E+RkMl0lmnp7kSnjkteG+9OIW
	 cdpmEYuCbut4wwGFh6bKanhWUeN3fvhV2GNJKj5X3T3eDA5VFuOw0Tdtt7C1uO6/7T
	 zuHLfOPUTW4CQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A96EUUt84103788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 14:14:30 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:14:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 14:14:29 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Luka Gejak <luka.gejak@linux.dev>, Zeshan Ahmed Nobin
	<zeshanahmednobin@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
Subject: RE: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register values
 in cck_pd_set
Thread-Topic: [PATCH rtw-next v2 0/2] wifi: rtw88: 8822c: check register
 values in cck_pd_set
Thread-Index: AQHdbuazUOaT5QdG1kKmKm0xSXDCtbcjQrSAgAAAdACAAb2B8P//vFGAgACICoA=
Date: Mon, 9 Nov 2026 06:14:28 +0000
Message-ID: <87ae80f9477f43559d01e851f2ef2e8a@realtek.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
 <cec3629205b2535d73f5285caddec290e7bda1c4@linux.dev>
 <4f3b37d5e7bdc710a54e46b4f28879b4f51ff15e@linux.dev>
 <b91cf87116d04aa7b3d1758ff58fab1f@realtek.com>
 <32B31B48-2A08-4A09-8D19-39FF49FE7306@linux.dev>
In-Reply-To: <32B31B48-2A08-4A09-8D19-39FF49FE7306@linux.dev>
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

THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiBPbiBOb3ZlbWJlciA5
LCAyMDI2IDM6MTA6MTAgQU0gR01UKzAxOjAwLCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVr
LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+THVrYSBHZWphayA8bHVrYS5nZWpha0BsaW51
eC5kZXY+IHdyb3RlOg0KPiA+PiBOb3ZlbWJlciA4LCAyMDI2IGF0IDg6MzIgQU0sICJMdWthIEdl
amFrIiA8bHVrYS5nZWpha0BsaW51eC5kZXY+IHdyb3RlOg0KPiA+Pg0KPiA+PiBUeXBvOg0KPiA+
PiA+IERvIHlvdSBtaW5kIHJlc2VuZGluZyB0aGlzIHNlcmllcyBhbmQgcHV0dGluZw0KPiA+bGlu
dXgta2VybmVsLnZnZXIua2VybmVsLm9yZw0KPiA+PiA+IGluIHRoZSBDQyBhcyB3ZWxsLg0KPiA+
Pg0KPiA+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4NCj4gPldoeSBpcyBpdCBy
ZXF1aXJlZCBmb3Igd2lyZWxlc3MgcGF0Y2hlcz8NCj4gPg0KPiA+DQo+IFdpcmVsZXNzIGxpc3Qg
aXMgYnVnZ2VkIG91dCBhbmQgbm90aGluZyBuZXdlciB0aGFuIDIwMjYtMTEtMDYgMTU6NDYNCj4g
VVRDIGlzIGFwcGVhcmluZyBvbiBpdC4NCg0KTXkgd29yayBmbG93IGlzIHRvIGFwcGx5IHBhdGNo
ZXMgZnJvbSBwYXRjaHdvcmsgb2YgbGludXgtd2lyZWxlc3MuDQpDYyBsaW51eC1rZXJuZWwgZG9l
c24ndCBoZWxwLiANCg0KDQo=
