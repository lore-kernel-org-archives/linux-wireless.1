Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346369;
	b=i8JnRaj2iT/aVs6Y8VRl1qT6UZ3yoxaadW/PjAp5qTCl4hk6HcN6rGvp6d1b5TNNo/8e
	 3VokYqf2jsFMgDW+tftK4ZmRrpM3CzXP/f2zqF5uEtJg+9IP50Zlv01GmJJgcFTOUUMV1
	 kIhqucDZ2tf2ef7DSdaWIj9u2h0mokr66sUMrKLO+w/+DZkUeMJ7XxwIHGfFiMv0hEyMg
	 0XZd2ee2/drZf8ObtcefDxNISdvOkr37SIHwX8Mw1UjXS6fCvDd2kkCJXbubntoJZg9re
	 jvQq4s63ih0vD93/mu4Wixzh+3mc2ocLDD3FyAHI62GGjK08svhif4sUrMpx0P8W+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346369;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wmEfjb76yd/TSGCZLz92u0+6OA2ZZuajooWK2psOUzY=;
	b=FebZDA7+CBQbjIPOMbwLsTR4iDiPYQv0HutpjSAee22Jsndph20dSarF8tx3xEO6Pavz
	 CUyQSJWnoRWpb79e3hZAzAct/66CXEGVjMYlH7wsxZE01Om46tfGeYq058NlppIjDxPqr
	 xT1icLInuQ3A6oRukNgomvQlxz3EkvoS1UoP0ax8HkxkdjHceco8r2dMoZPKUHPknOnWQ
	 YWMmtsd5h1l07YNmM0Z7AwfgMmqeyrDkcFN3fRy6mG8MC9faVT7pWSVAQJTEzpOVzdRzC
	 YXBOH5XIfOpNbjjWgSAz5zmcVDfB2+pHanTQbHo+M3gvG8cIoytY/7cSJy4oX+mjjtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=rvaJU7QT;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B274606A32A;
	Sun, 22 Nov 2026 11:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B274606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=rvaJU7QT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795346365; x=1795605565;
	bh=wmEfjb76yd/TSGCZLz92u0+6OA2ZZuajooWK2psOUzY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rvaJU7QT664WsoT3v6BUAUHjNOdlqFvnpHyLfXDC01ej6sVmESMKpwzfbgfzTfNvP
	 LTR9D+1Z35xYVOkiGLANBHSjKv5qqg8DFuhfiewpRKeoFOm9G6luzCh/hOjrujKlgo
	 cYHgTx0af7sun3wDwP1iOdhOWx1tcXWYqUDr4O9OZ8qXkhllvaZSiZjJbOGPYBywNt
	 cHVytfFkhjhJ6Vs8yV0KCx9AbMCH0huQMJixwdbVd362Ph9jB13R98eaQfjG9o35VX
	 Mku+b0J6NkM5f7IFG5W649BuoC/Gxc9RRhV23LTQMpMK5wUs8K/stMFkCs1CRD7dOK
	 UqqzctuWvo9oA==
Date: Sun, 22 Nov 2026 11:19:22 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: rtw89: fix u32 overflow in board element offset check
Message-ID: <WrRgwJx2dXia7pNpMhIgkzLmU0qL0NL86gs8wJGUREAeBHLnve-pqqCBMGNrD7oU_ElRtAtJhKTChXP8CtCaSbV_sgHDuIX7c3zEyvvfs5I=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 6896c383e152805856e186435d23d07fda1804ec
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

rtw89_board_elm_seek() validates the selected entry against the board
element file with

=09if (unlikely(board_elm->size < ofst + size))

where ofst and size are u32 values read from the file. The addition
wraps in u32, so a crafted file with, for example,
ofst =3D 0xffffff00 and size =3D 0x200 passes the check and
pseudo_fw->data is set to board_elm->data + 0xffffff00 with
pseudo_fw->size =3D 0x200. The element walk then dereferences that
pointer and reads out of bounds.

Use remainder arithmetic against board_elm->size, which cannot wrap on
any architecture. The helper is new in v7.4-rc1, so only the current
cycle is affected.

Fixes: af5905e22a43 ("wifi: rtw89: support variants of FW elements")
Assisted-by: LLM Mistral Vibe
Signed-off-by: Falconet3 <Falconet3@proton.me>
---
v3: resend of the series with the correct subjects and version label; no
    code change since v2.
v2: new. Found while fixing the element walk bounds check; split out as
    an independent caller. Compile- and sparse-tested on x86_64; no
    reproducer available.

 drivers/net/wireless/realtek/rtw89/fw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless=
/realtek/rtw89/fw.c
index 0000000..0000000 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1734,12 +1734,13 @@ static int rtw89_board_elm_seek(const struct firmwa=
re *board_elm,
 =09if (num <=3D board_id)
 =09=09return -ENOENT;

 =09ent =3D &hdr->ents[board_id];

 =09ofst =3D le32_to_cpu(ent->ofst);
 =09size =3D le32_to_cpu(ent->size);

-=09if (unlikely(board_elm->size < ofst + size))
+=09if (unlikely(ofst > board_elm->size ||
+=09=09     size > board_elm->size - ofst))
 =09=09return -EFAULT;

 =09memset(pseudo_fw, 0, sizeof(*pseudo_fw));
--
2.53.0
