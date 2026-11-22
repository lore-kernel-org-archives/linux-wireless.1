Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311156;
	b=3DgcSSuxVo7Zsoh69JeIr2aqoYOY/lW+WRn1kyxqzdIU2nHMlAZQQTFqC894WM8ts+sA
	 eDIV0GHGCfdOxfdGZTGSRbhuefX6lJH407mdN9WyQp6Ru+7FnnVlFFizvhpr2G/dWYoMg
	 CH9gn+mK5I/Uj3aZndBv1jQtN2/vVsEej3gg+/3gnzC7y4ug0+dpsBD9Z4ESc5jR2qLg/
	 F+Tn8TVaEi8/2jIVxAwv9xzDz6m6Z8a5ZYfv0sA5xZKw4npWhe2jvWSszq/oIx/9UuG8X
	 CyQzPgn5ENMaLBTqyUkJKq8GlcNVF9jNFYjGj3cxmcmB8wNm+W2f3zLY2g9A5GcFBBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311156;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/Z0T1Hd2+TRGHE+Zic7U5lTIBGVdF/kqBPjxdZibBZs=;
	b=HhpaxNjBRaspajQCVRsrfazA+8NWQuL0dDpeXeRbAoOe9n0mOCokVGhApyUMD78UuHld
	 lquzpx6XK6Uxm6/XyNpunWM7dsd3KEqYlT3+BcXnWoyDFLMOFEkVMc3xRyYrA9P+M3/6d
	 8tJ3CuUihYFJlY18gsjLFRz9Q7Vwf+jmujAZYyX+AzahLbQQFsxRfA0ztE8Eml0djuy7l
	 RyQNNgnsfXEP0QkH4eFu9VdHhcg/fniCIPGZDa/l2jFcMlh2UB+xCUP0WVs9ujl78kW/J
	 fbJtLPU6pCwqRW4cFb2AuSMiGsI3K7URDmW5Pa/aB6/j7ramtIc185nZ/Fns80qOKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=E2qF4FD9;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EFC606A320;
	Sun, 22 Nov 2026 01:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EFC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=E2qF4FD9
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM1Vwx86510619, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795311118; bh=/Z0T1Hd2+TRGHE+Zic7U5lTIBGVdF/kqBPjxdZibBZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=E2qF4FD9JvoSkxvKxpAIcQxfb+oubyzXuzmNSoR0IzUW9C9h+f0svRwpz1sEGxXO/
	 mI3/ChyO08lp/rIpvnTNoUPdpMfDcsSl3UN9Bbpd+yLe+hvDCSzDzcvvuU7oxzQFAP
	 /F8ZGsBwICCxpMZHD2x0zUFvcR/jh8WdLg/x5oC8Gpvg0E7MchKiZ1pyIRz5IcKgQL
	 n4oLV2MAOwj2D8JDoEtdXbDhApN35ChbqjRd0LOFWhGE3/igcl7SEVIrJCWHIefQyl
	 L6B1Hpc4PFu87zNEFEYutMYITXuusAhv80ZgAbsz9QPRZL63A0uQWj8YJiKrqout36
	 dOyuF8E5JULRQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM1Vwx86510619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 09:31:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 09:31:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 09:31:58 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Falconet3 <Falconet3@proton.me>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw89: fix OOB read past firmware buffer when
 duplicating elements
Thread-Topic: [PATCH] wifi: rtw89: fix OOB read past firmware buffer when
 duplicating elements
Thread-Index: AQHdehVXcLzR+iyou0WN4rlyYPdLbbc5ThaA
Date: Sun, 22 Nov 2026 01:31:58 +0000
Message-ID: <2fb081759df841aa9d22df3ce43430be@realtek.com>
References: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me>
In-Reply-To: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me>
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

RmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPiB3cm90ZToNCj4gRml4IGZvciBhbiBPT0Ig
cmVhZCAodXAgdG8gMzEgYnl0ZXMgcGFzdCB0aGUgZmlybXdhcmUgYnVmZmVyKSBpbnRyb2R1Y2Vk
IGluIHY3LjQtcmMxIGJ5IHRoZSBmdy1lbGVtZW50DQo+IGNvcHktb24tcGFyc2UgcmV3b3JrLiBQ
YXRjaCBhdHRhY2hlZCwgYXBwbGllcyB0byB2Ny40LXJjMy4gVGhhbmtzIQ0KDQpQbGVhc2UgcmVw
aHJhc2UgY29tbWl0IG1lc3NhZ2UgZ2VuZXJhdGVkIGJ5IExMTSBhbmQgc2VuZCBwYXRjaCBpbmxp
bmUuIA0KDQotLS0NCnB3LWJvdDogY3INCg0K
