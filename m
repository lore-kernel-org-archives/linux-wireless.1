Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815349;
	b=Yu24VYiJwNa6OYNYl1+e0/asdtzYE/JP1MDpUSxFL5zJjjlrQ7sjYeKqDLG6305xgo62
	 OVpurbiLDjuIAPs8AN4tGotA9VyJG5nV/o94G/YXNnpouDHSKLd/zClbx6ZG7p7tKC4hX
	 VjmDG8w3pMNlbF0hdvcaySoUcoF8vF/Wp6KncWeaYFl1SziiqPNW3ug9vCsbQe6MgddzF
	 aGcIqAlQcM/vXGvANmsJCe+jiT4zxpvQ8/WTwszbYDYggecsRHKYQaJ8EPTGB4uydlYX1
	 wUUjE5eS30iZ3FbfJ0vRKyj7bqQed48d34l2gNf0mIywevOLUSWTPHkwDX7nD7bnmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815349;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=FMDqEW4ZKuY0G5VySG8XnVV3zPt2F9GWS7hK9Beg1B4=;
	b=iCoQE10AdPlvEYAvguKZidVu1NeyjKGnbS8OacC7UZYp/RLS1PFbi2x52tQaE8B9AoAR
	 4DNyO0tnRnNT+AdNG9ftWQ0xM6spn8lKM5kJX/1yIikMhRW1j2lTmELr9sde11AlMgmUM
	 czgTm7JP6/cBcFPvK5ANquFgW9SOVD5hzO3ri16HooQbb86hgthHmsR+wdwd8YecMNmHE
	 i5l/Ovc/TBNdy3Pq5o8xi181PZAh56Nye54ZkqB1hMlDftdmIliMknYwnYvZJKGP9GA9h
	 Pc/ABZMo5BGwpZbaw33pwaZW6okySx10XsAQjXGj2xjG4K75+wfRpxFRcQ9T88jWF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oBA0S6G0;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7636606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7636606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=oBA0S6G0
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AG7n3Yg93224320, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794815343; bh=FMDqEW4ZKuY0G5VySG8XnVV3zPt2F9GWS7hK9Beg1B4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oBA0S6G0X1eZZ27aLStrmj9zbrTrC81V60UGUd+HakrbR4r07wsX132frSpcCFLkB
	 lSINE7jYagDmS49XaC4mdhoWZnzaPl89V+7HenJ33s57/OBwwzD4dbifb9MBIb+rok
	 eBXAc1jwjGSo614GO7lqHLpwZJbLxzm+AdQ/lUtfDrfLrJntK8pyyjmAVPkzTFmIAK
	 Lm1ZPLyy1PkOc93nuheKUXInD0QBr9RXpB5fZIJ0ltcIJNtduiitGxs6VgI8IHEINT
	 CLMrYbN2J/e8CCDZwAEP91ELAsfr8QbueEfO5b+3t2lvpg6GckUUTNgHer8hmJqSjs
	 tltwIVE5KkQQQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AG7n3Yg93224320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 15:49:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:48:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 16 Nov 2026 15:48:59 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "V. S." <spam@acio.nl>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
Thread-Index: AQHdc0YlUf9eQmeiD0qR+cPoa7qFpLcrqBfg///0NQCAAthicIAAEBAAgAFZOnCAAHhFUA==
Date: Mon, 16 Nov 2026 07:48:59 +0000
Message-ID: <1df4e66bece7402fbd92bb6dddb7ed1f@realtek.com>
References: <20261113080731.30155-1-spam@acio.nl>
 <4985719de8b5439e8484384ed52033e1@realtek.com>
 <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
 <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com>
 <CAJKtVVa6n++Uhy7z58d-Wbb3oGnTHz+bHt07_Akp7FPn6F2qYA@mail.gmail.com>
 <a0448c760a5243a7b956b16e9d563183@realtek.com>
In-Reply-To: <a0448c760a5243a7b956b16e9d563183@realtek.com>
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

UGluZy1LZSBTaGloIDxwa3NoaWhAcmVhbHRlay5jb20+IHdyb3RlOg0KPiBWLiBTLiA8c3BhbUBh
Y2lvLm5sPiB3cm90ZToNCj4gPiBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3Jv
dGU6DQo+ID4gPiBIb3cgYWJvdXQgbWVtc2V0KHJhLCAwLCBvZmZzZXRvZih0eXBlb2YoKnJhKSwg
cnNzaV91bmtub3duKSkgPw0KDQpGWUkuDQoNClBlb3BsZSBhcmUgd29ya2luZyBvbiBwYXRjaHNl
dCB0byByZW1vdmUgdGhlICd0eXBlb2YnIFsxXS4gQW4gZXhhbXBsZQ0KbGlrZSB0aGlzOg0KDQot
CWlmIChsZW4gPCBvZmZzZXRvZih0eXBlb2YoKm1nbXQpLCB1LmJlYWNvbi52YXJpYWJsZSkpDQor
CWlmIChsZW4gPCBzdHJ1Y3Rfb2Zmc2V0KG1nbXQsIHUuYmVhY29uLnZhcmlhYmxlKSkNCg0KSSBj
YW4gbWlncmF0ZSB0byB0aGUgc3R5bGUgYWZ0ZXJ3YXJkLiBXZSBjYW4gc3RpbGwgY29udGludWUg
dGhpcyBwYXRjaC4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNz
LzIwMjYxMTEzLW9mZnNldG9mLXYzLTItNzE0ZGY3MDUzODkzQGFybS5jb20vDQoNCg0K
