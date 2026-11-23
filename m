Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423249;
	b=fyNARdocdBaSlt1ncqUhvBERBTgY/qOBpOX+77liXnkbwfzS1OWMe0taBYriKsKX0Zp5
	 WHY80UiTUxpdF63woyoopevgV5aYrr3es+nLQlIw7MqbHmq0ShFbYA2r5UFodgyLDlPUy
	 KsjF98ARWihREIvCZH/2DUxFW5kbKHj95e2EmK+2jlCQ1mJFGhU367JWJlyyh6UIrr0m7
	 fwgVJfAlXwg1GQyk/JLZX3vTLI8DNPB7j2RcLc7TEJsYCWfYftsKPmJUPIhj7jg/myxLB
	 uwQbIviK9Hti8YT8bjO1AHYIaQ5t66bBNPzF7Dgd+nnNRWNoFfii8GT0LSRpSGTlTIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423249;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QRXBPA2aMQnEWk1htW5qbPs6cG9+tctAn+xKJ5Wtsfs=;
	b=1455pE8soZsRHQ8Cb3uRq0Z85N86FePOfo4J2l8t35g+LjF5inDT6gT6QNKTz5iGr9OL
	 fCOaTwY3t8IoVTdxeHIHQCZnX8C80baJ8nr5bysWqF531ngqt4uOi2S2rrbIprLVLqcKl
	 4YtF6LLu7nD5MwJrmzmizRqirCsRqr4Ykv+qARsdR3l0LanY3Kw/7Phnxe6oWqE4nxPdU
	 pPnGVFM2MdRY6hwUR31tQrBAmr15Ukb1qIQCzDtkNISKdP7IQIA7mak3T7IE7M/HKtI+j
	 X3Kj4dLBSCsdwELC5c/hPEEsLgo7M53FT4kD5xnfRmaALbQ7lKv7yCgSh3v5RkrgaSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q03lgtU1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BE606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q03lgtU1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C8E1F000E6
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423248;
	bh=QRXBPA2aMQnEWk1htW5qbPs6cG9+tctAn+xKJ5Wtsfs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Q03lgtU1WJyaSuO1vflp5VgUGcutvC8WG2puydargr0YHOAXePIjV9HaRgfzA1gor
	 +4wrZ+OpANP6ecohEnAgDZ7vaWQfyQxs2aN7B4X3AcM2N+rxPTy/FHAonUW7zsYKLw
	 tSnsRJrVeXllhJlGiVo+Ewsk356Xpy/zCr00fYbFnDbFG8VsjZHEQJqhWbNf9QYUAW
	 FByK47Jil2D45Q5lrrUmlX8jo1xxlIlgX+iuVkAla4Cq6uX/em5JIKulqn/IYdwEAx
	 oOmmBNsav68awIL6QikL+uiT6Ywmblzbt2NHNDSWqrWxFKSv7I0b5dKtV+fhj5Lre/
	 tYjFXm0K5Dh7A==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso19031471fa.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 00:40:48 -0800 (PST)
X-Gm-Message-State: APuU4Z+7N+4tt2ITwi8UzDfFEF9gHASGA9M/s8gOa63RbARiC5oJlHaP
	P7t9by+OREvxuZuKrgaAyBd8JKyyLDMn21SAIZcal3MEUWIkC+MbnE4TebxqSBY+uiLX09ZAkgJ
	OJM5QKtE6cTIWUhaCg8hypRd1Gt4JxJk=
X-Received: by 2002:a2e:be26:0:b0:3ae:25c9:f5d1 with SMTP id
 38308e7fff4ca-3ae7f9d255cmr28773671fa.11.1795423247354; Mon, 23 Nov 2026
 00:40:47 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1844356607.822318.1792144991919.ref@mail.yahoo.com> <1844356607.822318.1792144991919@mail.yahoo.com>
In-Reply-To: <1844356607.822318.1792144991919@mail.yahoo.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 16:40:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64NdP_SrBjrUZaBuMAB5EwsacnZH=YV7i+Jk9L2vm+0TQ@mail.gmail.com>
X-Gm-Features: Aa3M54qwH1whWvhObfYe-WlNsYmELQW_9kYghPU4lMJs_TVptLWBzvkVAJVVsXY
Message-ID: <CAGb2v64NdP_SrBjrUZaBuMAB5EwsacnZH=YV7i+Jk9L2vm+0TQ@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: update regulatory rules for Bangladesh
 (BD) to allow 6 GHz (UNII-5)
To: blackbird <jewel_boss_m@yahoo.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"wireless-regdb@lists.infradead.org" <wireless-regdb@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:03=E2=80=AFPM blackbird <jewel_boss_m@yahoo.com> =
wrote:
>
> Dear Maintainers,
>
>
> The Bangladesh Telecommunication Regulatory Commission (BTRC) has officia=
lly approved the lower portion of the 6 GHz frequency band (5925=E2=80=9364=
25 MHz) for shared, unlicensed use including Wi-Fi 6E/7, IoT, and Wireless =
LAN (WLAN) devices.
>
>
> Please update the database rules for Bangladesh (BD) to permit indoor tra=
nsmissions on the UNII-5 band up to a 160 MHz channel width.
>
>
> Official Regulatory References and Direct Circular Evidence:
> - Official Announcement Notice Page:
> https://btrc.gov.bd/pages/notices/6922ee00dbfbab28ce0c438d
> - Direct Source Regulatory PDF Document:
> https://objectstorage.ap-dcc-gazipur-1.oraclecloud15.com/n/axvjbnqprylg/b=
/V2Ministry/o/office-btrc/2024/12/18337854ab6c487fa749464c7672c8a8.pdf

The announcement does not say what the power limits are. Without supporting
evidence, we cannot add it.


ChenYu


>
> Proposed database block update for db.txt:
>
>
> country BD: DFS-FCC
> (2402 - 2482 @ 40), (20)
> (5170 - 5250 @ 80), (23)
> (5735 - 5835 @ 80), (30)
> # 6 GHz band (UNII-5) approved by BTRC circular on Sept 15, 2024
> # Shared unlicensed indoor use for Wi-Fi, IoT, and WLAN
> (5925 - 6425 @ 160), (23), NO-OUTDOOR
>
>
> Signed-off-by: Syed Mubashir <jewel_boss_m@yahoo.com>
>
>
