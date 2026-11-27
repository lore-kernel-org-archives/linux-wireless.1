Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767459;
	b=QGF9Mj2uKZMKAF0wL9OVi7qhf53JSbMdIU6hGnEjyCjsIdXlaDh6LhH8TcFmOiJ80p76
	 AZHhwGursFQw7sdC/Jti6IUgpb0OjGeDDoX5RZwoU/AA6JU+KErurGByhjjs4jmRWyMBZ
	 7jB5TCmYfDuespdC/ZhbCLE1ZDppo0FrNnYJYtWPQzuJlU2UuEqG3DSOJeoDxiBFAinTo
	 g2hkU1M8wX3wEC0G4YPbIsy6ITkAldD7Tu+NCcUgZcPOofPU7fk49gbzm3UNoJdGjEUvz
	 Ri5Fu3DC1IgZUDx+XUM2uXSySyksNXlG99BbeXMICZd8hpS1mqXuN/+0m9v4LoY891g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767459;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=KxJE34scYaOADRszM2PUcJDYlPn27+PoAweLzQDQ9Yw=;
	b=J7wd4Y54mfji3oUxpofARiggP1QFwrlKdS8B2p5AghOYgFc/qu+9GNygWmafftkxhDAu
	 91hMp1VD6c5Rkm5jUMzpF0qM/M8JcmqUcvDEQtYhOqCtWlVTX52poa10YvEweWO++b1Ft
	 X9hzCmqDROX35w39D4EAhutGX9H5Z68lGQAQ4slY2im6xoSkdOZp8LvBAEX7n9kikdVhR
	 pJI6W26qRR2yZGGjmwY/UJ4CsAId20EzfxbJTvRWsiz+4vIHtOb1vrHV30M00nGP4haSo
	 BWETTxwR4csaAlmyliMGCwhUuEV23zvZc5f6UwndJtmpohnBiufrfXQ4kZtKIOKhblw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="Wz6FV/Hs";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1A606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA1A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Wz6FV/Hs
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR8HY4X0775664, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795767454; bh=KxJE34scYaOADRszM2PUcJDYlPn27+PoAweLzQDQ9Yw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Wz6FV/Hsyj2i2yfc3Oa6XRbgJQWRGiH8K1y0abHQT5VHcqn3Fl/r/KemtFBlPDXz3
	 d/b4JvQh1OoJ3vLj7W6TJ3zZCcUNkfe08Z7cWrfhJtIcIFdDjOeEWtmt3AEEm8cPCh
	 AtM/wp+BUIYXsp/zhgRKjqqA7ZveVtlBcbxvTx304vkf6NdCqQQ6HfNOZNM5XG/ewj
	 cIag+KqUCC7zan4S7cYfTbjf/B9jvYKwdZm6I/GNoM93/+MEfg/nhoR51IwmgV0oqx
	 pHGNPcv9Sbie1F6jllI+7eH1RU5M5zC3IErZq49vQpKMHitFYdHhr/lNr5xdpw3aW3
	 DsFcSbeX+obpQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR8HY4X0775664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 16:17:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 16:17:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 16:17:34 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: fan ftdm700 <fantdm700@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: RE: [BUG] rtw88_8821au (TP-Link Archer T2U Plus 2357:0120): auth
 timeout on 5 GHz, scan returns nothing (6.18 LTS, 7.3.1)
Thread-Topic: [BUG] rtw88_8821au (TP-Link Archer T2U Plus 2357:0120): auth
 timeout on 5 GHz, scan returns nothing (6.18 LTS, 7.3.1)
Thread-Index: AQHdfTLYsyTlSrhBgUaZ9N+tSfLd7rdBlAIg
Date: Fri, 27 Nov 2026 08:17:34 +0000
Message-ID: <7517275a03084caf82fdc90dd05d161b@realtek.com>
References: <CAOL0-9i8wCt+AJru1zzae0ir+UKYU06kB+6P0VMzxrTZ8GHc4w@mail.gmail.com>
In-Reply-To: <CAOL0-9i8wCt+AJru1zzae0ir+UKYU06kB+6P0VMzxrTZ8GHc4w@mail.gmail.com>
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

ZmFuIGZ0ZG03MDAgPGZhbnRkbTcwMEBnbWFpbC5jb20+IHdyb3RlOg0KPiAtIEl0IHdvcmtlZCBv
biBMaW51eCBlYXJsaWVyIChleGFjdCBrZXJuZWwgdW5rbm93bikgYW5kIHN0b3BwZWQgd29ya2lu
Zw0KPiAgIGFyb3VuZCB0aGUgdGltZSBJIG1vdmVkIHRvIGtlcm5lbCA3LjEuIEl0IGFsc28gZmFp
bHMgb24gNi4xOCBMVFMgb24gYQ0KPiAgIHNlY29uZCBtYWNoaW5lLg0KDQpJIGRvbid0IGhhdmUg
YSBSVEw4ODIxQVUgYWRhcHRlciwgc28gSSB0aGluayB0aGUgZWFzaWVyIHdheSBpcyB0byBiaXNl
Y3QNCmtlcm5lbC4gVWJ1bnR1IHByb3ZpZGUgcHJlLWJ1aWx0IGtlcm5lbCBbMV0uIFlvdSBjYW4g
dXNlIHRoZW0gdG8gYWRkcmVzcw0KdGhlIGNhdXNlLiBUaGVuIEkgY2FuIGNoZWNrIGNvbW1pdHMu
IA0KDQpbMV0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9tYWlubGluZS8NCg0KDQo=
