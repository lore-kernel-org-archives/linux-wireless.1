Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366311;
	b=lTv8uNBRfDvcsxPgabJV3y7/PsRgRGUJ+X8aI7DdmPlXcmHzh7hnIwQUA4T8n+wQoSSi
	 ggeHRPFXEZAB4H8saKyGPgNzDeFXlUkmn8jAHqx7RRTCokAfKZjc4wueWgtQTzjHMx6gI
	 roDd+dFEdm/JzyGeSS4/ryuUdzn81mmFtHxIvhQ43+p6m8xjtlF+uHYT9zs9FMKxS7x9y
	 +TtyDi+40K6ZADvN8ELuCj6Yqmsgtb1tMbFBA6gaB1As1wexSMxr5UckTEV0jkkgTgzoY
	 H0ichQRWl/q1iGRc2mLl7Wb/yn/9x5DmzOz5WYWTtWx0Yf9i8xbNNk0vgZlZXcxmB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366311;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=dIDTkJcvPyj4gfZ4ckvMpHKYCkyUSx92TDXJNRZJHWo=;
	b=Aayv7iTWbvADHiRe5DqhmKJ8C0SZDbiO7EnYr17A5Fs6G4nS39dxwlInHP/9bPGfD1XH
	 BbuFW6Rj/69T892ZPdcKav6rbC4s/b8pRHFfmnVNgyhjz35PNrNj1IVluhB+q4dob2A46
	 VdO/La9uOfwGAs0GcNv5FlEq01kYMaIOzDkJGHPUbn0cMBJTfsIFRnEzpOZFQcliDV3Rl
	 6syzdxQPYTrchgrx/+P44t6CWdoUTZc3RcRD4AwLpGIHu4x8N4QmaJVgJVdt+Ypmn4P0R
	 SEXx7DZ8B+MS6Mkhy+UJ9mXqmSFaCtxOfyuCIyQTGVV3QMUqGlyQX5WIEWxb32PzsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=N4IawUgz;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F7606A327
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 03:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9F7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=N4IawUgz
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB34xaL61988911, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794366299; bh=dIDTkJcvPyj4gfZ4ckvMpHKYCkyUSx92TDXJNRZJHWo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=N4IawUgz091axdkKYaV81MwJnIG1xPizXrOoGCUSVjCbh3WZpcHdofJ2x16xzH2mt
	 cGU+SMiL3UaqSmJ65BtAdxRnXAvjXmABv+xNOa19BNksVRKGpq0AgacQBACwh3zItu
	 B9B+kHYiLnMcuBeQD1volmzu8RuIch/ZwUWYGfH6o27kIDDnp4yzA9BZBVLz08iVD6
	 92/p2T1z3yate8179iNOJZq00Gs9Rk7ZQOULYVIVNi3ezSfPOe2c4gd1Rz5KKFtXR6
	 fYGLcU61ogEVzBQQwcNvV1TLVGHd3cDZRS34woBaYfYYC25BpV34V0VwjRR5UHFYvG
	 xSdkzgNhy5UyQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB34xaL61988911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 11:04:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:04:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 11:04:59 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: rcfa <kernel@cubiculum.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: RE: [PATCH rtw-next] wifi: rtw89: usb: keep the endpoints until the
 driver lets go on unbind
Thread-Topic: [PATCH rtw-next] wifi: rtw89: usb: keep the endpoints until the
 driver lets go on unbind
Thread-Index: AQHdbxOieYr5tLIiqkeXKK63jnfmrrcoMhoA
Date: Wed, 11 Nov 2026 03:04:58 +0000
Message-ID: <d8cde7d5d5174e6a8b6ccf2edb65faeb@realtek.com>
References: <20261107230547.3673679-1-kernel@cubiculum.net>
In-Reply-To: <20261107230547.3673679-1-kernel@cubiculum.net>
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

rcfa <kernel@cubiculum.net> wrote:
> When the driver is unbound from a device that is still attached (rmmod,
> or an unbind through sysfs), usbcore disables the interface's endpoints
> and kills their URBs before it calls the disconnect method, unless the
> driver sets soft_unbind. rtw89_core_unregister() then still
> deauthenticates, flushes the queues and stops the chip, but the bulk
> endpoints that carry H2C and C2H are already gone. On an RTL8922AU with
> an association, every unload logged:
>=20
>   c2h reg timeout
>   timed out to flush queues    (3 times)
>   read HWSI is busy            (18 times)

Is this because sending deauth frames?=20

>=20
> Set soft_unbind for the USB drivers, and in rtw89_usb_disconnect()
> unregister before cancelling the RX and TX URBs while the device is
> still attached. After an unplug the device is gone, so the order stays
> as it was; usbcore disables the endpoints first in that case (state
> NOTATTACHED) whether soft_unbind is set or not.

With soft_unbind=3D1, is it enough? Can we just one calling odrer?

>=20
> Tested on an RTL8922AU (a USB 2 adapter) with the out-of-tree copy of
> this driver (morrownr/rtw89, which carries rtw-next as of 2026-11-05),
> kernels 7.1.5 and 7.2.15. Every unload while associated now logs only
> the deauthentication and "deregistering interface driver", with no
> warnings. A physical unplug while associated logs what it logged before
> (the messages above), with no warnings and nothing stuck. Reordering
> rtw89_usb_disconnect() without soft_unbind changed nothing. The other
> USB chips share rtw89_usb_disconnect() but were not tested.

Only need " Tested on an RTL8922AU (a USB 2 adapter)". Putting others
after your s-o-b with "---" delimiter.=20

>=20
> The problem was found with Claude Code (Claude Opus 5.5) while testing
> the driver, and this change and changelog were written in the same
> session.

To disclose LLM use, put this in additional note area.=20

>=20
> Fixes: 2135c28be6a8 ("wifi: rtw89: Add usb.{c,h}")

I don't think it touch chips, and it isn't not a severe problem.

> Signed-off-by: rcfa <kernel@cubiculum.net>

Please use your real name.

---
(Put additional note/comment here)

> ---
>  drivers/net/wireless/realtek/rtw89/rtw8851bu.c |  1 +
>  drivers/net/wireless/realtek/rtw89/rtw8852au.c |  1 +
>  drivers/net/wireless/realtek/rtw89/rtw8852bu.c |  1 +
>  drivers/net/wireless/realtek/rtw89/rtw8852cu.c |  1 +
>  drivers/net/wireless/realtek/rtw89/rtw8922au.c |  1 +
>  drivers/net/wireless/realtek/rtw89/usb.c       | 17 ++++++++++++++---
>  6 files changed, 19 insertions(+), 3 deletions(-)
>=20


