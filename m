Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346522;
	b=xLhACiVI3mtgoYL5Cn72hcFpgWXksHaqAU5qcHpuvHn1Oxybh81+UauMHKgw7uBGlh3X
	 /NSofHEYtbidJeYe91HkPAnr0KY6YnvVVYfwKenJB/CfTVoNwF/at41EKMPIxUtP5iqjs
	 lW8z/MSnGhozxx/QjgBUE6UwQss9OBWBkqD7iDpN0Fr/ye88RVZcK7RoPslDhk22Uclzo
	 GyOlNsCxuJfQ+qZY/2GtAjKUpdu5e71zDDGIkhpQtFImpY09tE6UPfGISwMC56bzH4/ga
	 eF5xgRjl3ylNhahtrqwB0fmZ9rP5u7cdUs1TPrH3ApoXZ+0JWeyjhrCUFHJ0gWDSxiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346522;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=utBTjs+dqc3oDE0m/ffB35QBFM5MmJvgCEGqgp52YS8=;
	b=ARhNo9szV+53zEvcfWhvY01VZIKgfmtaUW5Ol1dVR3fzkYX1bewfhg5lNomKKtkSi3Rs
	 mUpGA0LhkIWhjdx5eo2GpbbU5eSppESff5unFbFlvO0nrAxGc+gOwDyF8IGYnobec5nG6
	 4euPvdvAZ4ElOajheOiwf/+awHx5i1SyyQOiapSSbdnVY8RHnA4by8otGiH73bgBM8Ons
	 DV4F9TibAxw7xXIGFXHmffr01lloGWQxzR7O5u8sRRnv9Pb2+KDbPZP9+/q4E6x2xUQZ7
	 7FwLVEE1X36TqXnDiBG73Y/J0R0GwyxlXLF5ftSADr73c9IT0X5mU0DVeIwdoQJe9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=k5YPQypB;
	arc=none smtp.remote-ip=109.224.244.30
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C210606A331
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C210606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=k5YPQypB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795346519; x=1795605719;
	bh=utBTjs+dqc3oDE0m/ffB35QBFM5MmJvgCEGqgp52YS8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k5YPQypBNzc5Oow1KvXojXzDSMwlvFZFzGMZuRULKlgAkJviwXQGDEk0JSu7IIco1
	 ZI2jVpd1vmsK/Z8YsG6JaBOFp2QqL3uZ94RdEW77sCjN+RCq5Yw5d4ZVzLhU9aUVG0
	 lGqg7pWgFH/YixKL0uDWmauZlQeRVdX/XIK1ZUUWF3OFjLanJgp+Rf8KQQv/GpOnmu
	 w11whRdKWcFjnD5jeLY4olkkCGDqTu6EptmvGtQH5jxtByg2YHp0f+FArWGfHU/s7S
	 cFmRJJ8rKUebmvNJsrRs1NiUqcGUpidKDTr+q1/XHHVwkoAebSaig2ArhG0scF1ybC
	 24YntQAPQBjnA==
Date: Sun, 22 Nov 2026 11:21:54 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: rtw89: fix u32 overflow in board element offset check
Message-ID: <wQyrWhpyvBNzuZwnQTESLUjeEbdLHi5t3xdQUf2qlOjublpo9nBpuikHh7cpfpTRjtuXRza3-Q2ZAgcwr7O98Xqs6lFOaNsc3T-D7E4B1S8=@proton.me>
In-Reply-To: <p7rw-XuXkRXg0R2mJ5S-HUUy3IwDD0iXcY11AzTDIvfIj3ofQsJ5exatm_1V-mlBCzsd_s0xhJSBvZz4zWCYaso5-ylUw9JMV3AoiPUZZ3o=@proton.me>
References: <p7rw-XuXkRXg0R2mJ5S-HUUy3IwDD0iXcY11AzTDIvfIj3ofQsJ5exatm_1V-mlBCzsd_s0xhJSBvZz4zWCYaso5-ylUw9JMV3AoiPUZZ3o=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 45c052aaa64b2835661aa3b15561a13f0c0bcffc
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Note: 2/2 was posted as a standalone message ("[PATCH v3 2/2] wifi: rtw89:
fix u32 overflow in board element offset check") because my webmail client
does not preserve the In-Reply-To header when the subject is edited. Both
patches are independent and apply on top of v7.4-rc3.

Sorry for the confusion,
Falconet3



Enviado com um e-mail seguro do Proton Mail.

Em domingo, 22 de novembro de 2026 =C3=A0s 11:07, Falconet3 <Falconet3@prot=
on.me> escreveu:

> rtw89_board_elm_seek() validates the selected entry against the board
> element file with
>=20
> =09if (unlikely(board_elm->size < ofst + size))
>=20
> where ofst and size are u32 values read from the file. The addition
> wraps in u32, so a crafted file with, for example,
> ofst =3D 0xffffff00 and size =3D 0x200 passes the check and
> pseudo_fw->data is set to board_elm->data + 0xffffff00 with
> pseudo_fw->size =3D 0x200. The element walk then dereferences that
> pointer and reads out of bounds.
>=20
> Use remainder arithmetic against board_elm->size, which cannot wrap on
> any architecture. The helper is new in v7.4-rc1, so only the current
> cycle is affected.
>=20
> Fixes: af5905e22a43 ("wifi: rtw89: support variants of FW elements")
> Assisted-by: LLM Mistral Vibe
> Signed-off-by: Falconet3 <Falconet3@proton.me>
> ---
> v3: resend of the series with the correct subjects and version label; no
>     code change since v2.
> v2: new. Found while fixing the element walk bounds check; split out as
>     an independent caller. Compile- and sparse-tested on x86_64; no
>     reproducer available.
>=20
>  drivers/net/wireless/realtek/rtw89/fw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wirele=
ss/realtek/rtw89/fw.c
> index 0000000..0000000 100644
> --- a/drivers/net/wireless/realtek/rtw89/fw.c
> +++ b/drivers/net/wireless/realtek/rtw89/fw.c
> @@ -1734,12 +1734,13 @@ static int rtw89_board_elm_seek(const struct firm=
ware *board_elm,
>  =09if (num <=3D board_id)
>  =09=09return -ENOENT;
>=20
>  =09ent =3D &hdr->ents[board_id];
>=20
>  =09ofst =3D le32_to_cpu(ent->ofst);
>  =09size =3D le32_to_cpu(ent->size);
>=20
> -=09if (unlikely(board_elm->size < ofst + size))
> +=09if (unlikely(ofst > board_elm->size ||
> +=09=09     size > board_elm->size - ofst))
>  =09=09return -EFAULT;
>=20
>  =09memset(pseudo_fw, 0, sizeof(*pseudo_fw));
> --
> 2.53.0
