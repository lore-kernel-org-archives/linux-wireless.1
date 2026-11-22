Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316891;
	b=uAzd24DpUSYUvWn6dUxlrAJ2oe75ix24lzNH4lsmpSLYsX9y+cFrjaQvnSLuNalJ5XZb
	 5iFYlExJYCKBhkQm3l6sxXH7Smt6mh7YZdOjKVacbAfgVf/E2wVILUChOjl60/nbfHcrL
	 OQemd2TTyxx+EjsQKnK8UI6Us2CGGZUhc5Y/9ggKZPiFX33DdtWBAv/edyZgecQVubir7
	 3iH5L74lvYq3BL/0oIrCPW5KNqSzyt1a0vg32sG2zSOHR8cFerDU3jBi/JU+wDfsQVWd7
	 UyvwaBqYEjbwWnv+m0o5LomNWbeY4JN/wrZG5dddZ7zAZkze8UFT09WC4aJLnqrxXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316891;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=p4rn/j1aFkKLkcjb+I+46qsh3r/NDIidwKQ4N2v33tw=;
	b=x85d4Lf/tc6MpA24W1cx3pS4aJyXxzpOAHkujPlKTpr1W6r3glhH4d0DGKJMmuUSNvY8
	 8MXxLkuC4WcCsVlj8Z2hQq2E1VzHH2WePAhv1u4zYdlHBujhe5CY+KqAZNlx57irI3cnE
	 FxFAVCCPZcAzN4/C0LX8KKeXiq3+vxNFSSpC3tqY4vkniHn4QmcxvKrCnjQe6kFx/sLi8
	 0irK+FnepcTZsUxHEO3tI3bAnF7MEk2byUbE7wRbJLbVCrhcXwlPvyx+qBhUsxpEA8LbS
	 /qPa47RtZHEFxu7ru/QqTvkEt/5HXdKAEF0X4FM749FdN0hAHDqujMEYcBMcdgdyFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rjiwZ82s;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FF606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 03:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=rjiwZ82s
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM385Hc8536540, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795316885; bh=p4rn/j1aFkKLkcjb+I+46qsh3r/NDIidwKQ4N2v33tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=rjiwZ82s60DmRPPSQjUFpTyLSwzi7xlox01NOegA4ZOgTZdaHuOHulbhXnVbISNy8
	 uATkXeALDzOJpIdH+I7xxbhdR8GL0RNhEbcQzWrjaP7VVUnKX7KtmzFZ6rUjBGW5eY
	 0J+Z3pataEJM5R/80p2EuV6JWA/jJJncEdud5bynLydwqEfs3HzNRGCNvRhzC1rf13
	 9iyxBu67cghZjQWo+UtHf5koGKGbpscTv/hOtZVUy2y3Jc+HBYe0iWHeKZhAfJHcz9
	 r3AbOv8a8c9TQ7R4afFfwXTHiqD/1mUJ7gJWi9s3X3DgyOxXbHGkJ1tETRLPMnO6QZ
	 fgyesGNwN5spw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM385Hc8536540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 11:08:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:08:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 22 Nov 2026 11:08:05 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Anvik Loitongbam <permissiontogallop@gmail.com>, Jes Sorensen
	<Jes.Sorensen@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtl8xxxu: validate firmware size before parsing
Thread-Topic: [PATCH] wifi: rtl8xxxu: validate firmware size before parsing
Thread-Index: AQHdedwHDEwOXjHDR0ahvlL+iBapcbc5aCpw
Date: Sun, 22 Nov 2026 03:08:05 +0000
Message-ID: <6fad320e93974775b64f35460df423f8@realtek.com>
References: <20261121170559.149274-1-permissiontogallop@gmail.com>
In-Reply-To: <20261121170559.149274-1-permissiontogallop@gmail.com>
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

Anvik Loitongbam <permissiontogallop@gmail.com> wrote:
> rtl8xxxu_load_firmware() copies fw->size bytes and then subtracts the
> fixed firmware header size from fw->size without checking that the file
> is large enough.  A short firmware file with a valid signature makes
> fw_size wrap to a huge size_t; the revision logging then reads the
> header fields out of bounds, and the download path derives an
> out-of-bounds data pointer.
>=20
> A 2-byte rtlwifi/rtl8192eu_nic.bin containing the 0x92c0 signature,

It looks like you make a fake firmware to trigger KASAN?

> loaded while the driver probes a Foxin RTL8192EU (0bda:818b) passed
> through to a KASAN guest, reproduces it:
>=20
>   BUG: KASAN: slab-out-of-bounds in rtl8xxxu_load_firmware+0x238/0x2ae
>   Read of size 1
>   ...
>   The buggy address is located 4 bytes to the right of
>   allocated 2-byte region
>   ...
>   kmemdup_noprof
>   rtl8xxxu_load_firmware
>   rtl8192eu_load_firmware
>   rtl8xxxu_probe
>=20
> Reject firmware smaller than struct rtl8xxxu_firmware_header before
> copying or parsing it.  With this change the probe fails with -EINVAL
> and KASAN reports nothing.
>=20
> The issue and the initial fix were tested on a Foxin
> RTL8192EU (0bda:818b) passed through to a KASAN guest.
> I would be happy to provide the reproducer on request.
>=20
> Fixes: 26f1fad29ad9 ("New driver: rtl8xxxu (mac80211)")

If this isn't a real case, I don't want the tag.=20

> Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>

Also, the subject has clearly pointed out the purpose of this
commit, so reduce the commit message as what it is actually needed.
Recently, we have a lot of patches to validate boundary. They are
fine to me, but I don't want much commit message, which is not
very useful.=20

pw-bot: cr

