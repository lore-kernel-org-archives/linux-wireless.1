Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458215;
	b=bsRD/jS3TF0OS8p56/OKuXuyca7HoZw2kjFq6104RS5otucn9sDfka84F9B9xW1jNBMd
	 NR4pLwdfKCMP9gxlLUyTd/dNMyccwOssXM6Mp6sKXkzZeDqN2L0SCwJORHNZYCd+RhM54
	 Lq84Lbm8H2e0WXUk2AEUxXcqRdzc2Zwh200e8P4M+me/b7suuc6e7BJz015SlBen5Ze7P
	 6ir1hztshvapMSxrc90HSWLnxuyMK9t8lS+zBwPgOhzAE8/QtiKST5jR4xbsX57B80lSs
	 8S3xYWWPQiY2wqYR+yVCpbByo8ktoIaB7qURfYlRyin+leeftc1Xae69ZpwLbmBNyxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458215;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZiUG2ZNLsXzBY/hyhYoW6mjwTEsNd/y8PdEvlA78jjQ=;
	b=2fOtABqrBOqzUHfUtCvmn2hbftw8LE6PEk9In5QB/qDROiIusDcLQhQd29eLItbXFl4X
	 SHlD2oFyH4prlwzZSsLWN8UrcSoimBHnfuOYWEhRfZgWRYluyVazGeWTwUQiRbXHP8ZUs
	 XS2SANxsBTFMMcQn6ED8vm8Y8N7c+c6ktXfUvmXUKt2m4xbbqomj8Ia7nH3vPANnWAWwN
	 uWRJof56WqcdJfd6KzU6lB7JG6cDsl0qC6cLYpS5kAlesOS8Gn2oo7TDOmx/rDy/vR/EZ
	 YazVwiQ0yWvJbo1itNptFJ4geFweEAJQl50L0zfmZ6cnlJ3Cm0scEtU83kQBr7JJaYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mq8XG65H;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A5606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mq8XG65H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795458212; x=1795717412;
	bh=ZiUG2ZNLsXzBY/hyhYoW6mjwTEsNd/y8PdEvlA78jjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mq8XG65Hsi5HsJtk11hhPKEQqV91NbehadmwAj/xzx6H/mKr2njOhb+4lEPXmio2S
	 gUxw969IVsPl4JqQsBeg9P7ZUQpvJ7j1fmnLkvtMaGycYw7trDQyyOo8LicW5pZtd6
	 Q3PZIlfdSmkfvBLdj9sFUngpKi29Q9pbrfXW7el+j+ZyWsKBFGN3/eJmbU4PRwvI5Y
	 xyOAM/sECSCW4qbZwhNz11pucqZJ3YTUGib46JgoyspOf59kPCQgSFV47ujOWE4r6W
	 VNYjhhlrgTvnCWACFQPEKlxEF1rRCRFxJ2HRMhzsuouqISSxnBG91/nxwlaS09NAmK
	 0GCrbdzOwFcww==
Date: Mon, 23 Nov 2026 18:23:29 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: Falconet3 <Falconet3@proton.me>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>
Subject: [PATCH v4 2/2] wifi: rtw89: fix u32 overflow in board element seek
Message-ID: <J7Alt6-qlyx7wBUQIFOv5e60k27PLQmMSnJqjcLlsLLZ2US-MP6vo7ny0nCq9WYWBJneWekcQHftkNy86oLzZOCIUJj5RPctR5-py5cvI4U=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 1593d7f9a274e696479bb12055072c32356b360f
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
v4: resend as a new thread at the maintainer's request; no code change
    since v3.
v3: resend of the series with the correct subjects and version label; no
    code change since v2.
v2: new. Found while fixing the element walk bounds check; split out as
    an independent caller. Compile- and sparse-tested on x86_64; no
    reproducer available.

 drivers/net/wireless/realtek/rtw89/fw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless=
/realtek/rtw89/fw.c
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1739,7 +1739,8 @@
 =09ofst =3D le32_to_cpu(ent->ofst);
 =09size =3D le32_to_cpu(ent->size);
=20
-=09if (unlikely(board_elm->size < ofst + size))
+=09if (unlikely(ofst > board_elm->size ||
+=09=09     size > board_elm->size - ofst))
 =09=09return -EFAULT;
=20
 =09memset(pseudo_fw, 0, sizeof(*pseudo_fw));
--=20
2.53.0
