Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313739;
	b=v6hR/7YmpCQXBs5H6Z4hQSz88ElsfUzoviZyV07UHw1trqsRIQTkp67DTUpgo+NsCa/Y
	 IRSOUD6CngW+w8T5psL3NVEKUokLCHMm0AQdONL07jmMQqP2j+za3C4EF3E1Emaxsi0BS
	 0wxDD4SJqbykSSHWm7epfNPVdAfflmGlcVceovny1Vy7z3tCupEb0SxQZ+GKCLBDZXPJO
	 WB7UepcHbK5ZJ/OGgKHeWx0h2WAimaJhhtxD/fBi8LjGkjrxrPujMqjDIqi20Uprgnkc+
	 D8YYaj48yd8XQJ9Ru1ot7NYqqlxM0zjNHvhWoCXDW+XkFbYgPhKBzzVmRszUEka5QxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313739;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=tOHihlOpp3A8dTFxT5P3dM9PvAuyq7MYPF+4PBQifz8=;
	b=FTjqkjGwBG5zXnuFUSi2Bof1x8gUkwPDmhn5nRJqfzIZ8vTgdlRKfXI2JtxW9YlmbOH2
	 7ML1I97lZCaDP9BXhqD7jlNevu8m6MmdOMuSdPEmWMKv/X/tUG75kl5X0NiUqvlbHRsqG
	 o0YLp8a3Csy82QZBkaqpTAjm8/fJL/M0J3IksljPvHu256xyrc83j2kmgCZj7nWwDuVCT
	 9JNDvw+BvrZuYboIKxxubSS6orQ9GQNNVhtje1E+ldGNWH6r8UbqZU3qXYhOIgWHWLLvM
	 OGgWnJB3jyt/ER8OJjK312HDw0L9OnpvOO8oUUR5j0YvFTIya9meIdwyYt50crvD4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OKzIpjiH;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C2606A32A;
	Sun, 22 Nov 2026 02:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OKzIpjiH
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM2F6PX0521987, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795313706; bh=tOHihlOpp3A8dTFxT5P3dM9PvAuyq7MYPF+4PBQifz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OKzIpjiHWpIY5a0oUyb63roRks9HIFqPLiQcrN4smMEUi7B5+9dv+cQdu9Z6cXSmi
	 SagNn4B387zv85gri5tItsNW7WQM/JRDIyyDzt7RLttIqv440FnRru4kwe5F6ckIKt
	 PwzRoISwkGtN3+DIHAAeCfRjf09pGNLJiTmg3fX8WfVZusmQkHsiOinWmZmmNtgn4O
	 5Lz4EIeuPdnu5PBusPaE8FtMsrqc2LF0RBZaHRAtYzRHU9E9BfMunPBKhhAxt2I8jV
	 L/bGW9MEwJ+8O1hx8LziAuMeJ6qLJ1o7BaTfxi8ffc0D08RsGaJEB6GRysFXxFLHt6
	 NOBAtvPxOQHjw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM2F6PX0521987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 10:15:06 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 10:15:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 10:15:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 10:15:06 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "niko3x@proton.me" <niko3x@proton.me>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 1/2] wifi: rtl8xxxu: don't report frames sent
 without ACK as acked
Thread-Topic: [PATCH rtw-next 1/2] wifi: rtl8xxxu: don't report frames sent
 without ACK as acked
Thread-Index: AQHdeHMhjyVN5wz/706yQySXKGKTu7c5XZJw
Date: Sun, 22 Nov 2026 02:15:06 +0000
Message-ID: <bf2c18347d3b4ff7a81bcaa4a5ba3134@realtek.com>
References: <20261120-b4-tx-status-v1-0-abdab21c77fe@proton.me>
 <20261120-b4-tx-status-v1-1-abdab21c77fe@proton.me>
In-Reply-To: <20261120-b4-tx-status-v1-1-abdab21c77fe@proton.me>
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
Cj4gRXZlcnkgZnJhbWUgd2hvc2UgVVNCIHRyYW5zZmVyIHN1Y2NlZWRlZCBpcyByZXBvcnRlZCBh
cyBhY2tlZCwgaW5jbHVkaW5nDQo+IHRob3NlIHNlbnQgd2l0aCBJRUVFODAyMTFfVFhfQ1RMX05P
X0FDSy4gUmVwb3J0IHRoZXNlIGFzDQo+IElFRUU4MDIxMV9UWF9TVEFUX05PQUNLX1RSQU5TTUlU
VEVEIGluc3RlYWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBaG1ldCBaZXJlbiA8bmlrbzN4QHBy
b3Rvbi5tZT4NCg0KUmV2aWV3ZWQtYnk6IFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29t
Pg0KDQoNCg==
