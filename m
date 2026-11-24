Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512879;
	b=uVDrsT14zMLQUZ4mepcE758JV9vazi6GrkQ+bcv7yWcOZYLeirKgtY5ppIUjvWnCg105
	 lYfK8f8yGL96G0AdMY2NTaetu7WmdrtY9kKDlWTQPtOk4f1V07IvYmGlSGtwhos5puwqs
	 zLN/4A0Ax7WT6pgD2wlbiwY94q3JsOSgOjuP9WAm874kSuapDALgdacX0WUBob2lmKo6X
	 HXMHsFLZsu5OnsXPZ0xAFu3YbXovRMR/35tSVF5iVFhxq4OimFACRrXla5RJV+LJ5XXZD
	 QaRbfZcUff8wW7ROR48tXIlNi5LRkmW0CZBWmEv82tL3jZ751gjnCocfe65atNO8WxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512879;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ujdSgrbpJb7DVJdIQTa8oUd352Rz89axeyfq0ZyWcRI=;
	b=NhLYjpxJO/ioPZWjjkHAYNFtcZSyhxMSl9rc5V7vzKA2l2dvQh/yzH1GDTXXQ3hFh8wD
	 DUG3/JljBPP5nvMt/oDWM5f21ZKfRbxrMbHd1yMGAL69e9ppu6wycadmglaCQI0tm1ofL
	 nR7RsN17NIvykfSXDQqFVntCUrjU9OXjHt/Q0ef33jteKOqhXoQ7t0xURZu0reGW4BD1i
	 iQ2a2Gm0Gh3U9bggpdS1WCWorQOpCbKFT7KLnb8zVpad7BOo42LvKnd9bVyO+rauPV/bh
	 CZ6ggXZkL0xoPZnbPwdH2Av/6r0LEzPsQ1OKn1ly21IRv0vUxmJZY21f1bEnscAn0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="PA/9kxWl";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3D606A31E;
	Tue, 24 Nov 2026 09:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PA/9kxWl
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO9YJhX42408467, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795512859; bh=ujdSgrbpJb7DVJdIQTa8oUd352Rz89axeyfq0ZyWcRI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PA/9kxWliyuoF+oDaw4WaTZiVmEbksoWUySOQ6btj7rNt3LZgdJZyGB7FaitBistN
	 T7bqvadipOP3iBZOU3hFLZA0Wp5q27WHqzrAmE4vidJhPCOvYYarDlAzaCSkZ+/a3G
	 ybfetujJyIWpSr7z8R8z4t35OvGaudDmsuIUseEoEuji+EFE0x/Hb+1vvP+sEFFPOk
	 DPt2eJj2AvwHB6aBYqIE1y+gWj+HUe2wGdwm9L02J1HtDCPmSwfqLtDZ+fo9DdTGAV
	 BYoPZpvkdgh3+AUNBOILEZWic0R0CibZNUydKIBdLj4UXYl0zu39YaETBb6U8TEW1Y
	 8g9i54qXFBNgA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO9YJhX42408467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 17:34:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:34:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 24 Nov 2026 17:34:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Luka Gejak <luka.gejak@linux.dev>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: RE: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Topic: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in
 AP mode
Thread-Index: AQHdee+p8j6aIxstNkarBQ/O0oJacrc72mMAgACICQCAAJDwkP//ftUAgACHQDA=
Date: Tue, 24 Nov 2026 09:34:19 +0000
Message-ID: <a864efe79a0d4fc99de306bc85a7386f@realtek.com>
References: <243260ca062b40ba965eece69e5c52f7@realtek.com>
 <20261124092756.211244-1-mehmet.fide@gmail.com>
In-Reply-To: <20261124092756.211244-1-mehmet.fide@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Mehmet Fide <mehmet.fide@gmail.com> wrote:
> > You can decide if they are necessary. As I mention in another patch in
> > the same patchset. If you think that is rare case, just reply your
> > opinion, and let it go.
>=20
> Then I will let them go. Both are rare: a failed download was only seen
> in unbind and crash tests, and the AP stop needs an AP and an associated
> station on one RTL8822C. The same holds for the minimum interval in
> 3/3, as hostapd uses 100 TU by default.

I'd admit that I don't know the detail for now, but adding many conditions
to handle rare cases is hard for me to do final review. Keep it simple is
good to me.

Ping-Ke

