Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345670;
	b=FKJUGmBLCmGX+l2YLbnF7AQMmZY+ZgdcnrDAiss+mmho3u9+UYN6IK415TjU9rhy525q
	 OcY/kwGap8yIKHjSSKhqbqSbnICfOyMNep5h4I+06HdImS5oEzS+j+l8xAl6Jmif0/oSY
	 Zwo5FqXU48pjmKVK+TcR5R6mQ+/NPKxl9l7UiwPAiikA/96HfkWO7kIHtDgoy7IHtKozv
	 8On4YxwaaqLqtsCG1g9jl1z7n9nPaBlLeMixFqLpjgONX+i9JeQaxy362R83v3DIGCWUa
	 0fHRNO0SK2QaMU7WrIRbfkp6j8140tDowCBRxoUP7ATwnTB6M09F+MsUmeXZYyCrpAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345670;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PBmX0gymUfN6gygF+scb6Yb2OHU0W7WRU+BamkOLXMc=;
	b=HizQa8esgpA7be0P3XpY2AeYliAOxy67cYgdKWauG78172KodJgyB2u/nd2/yo0oyQ33
	 DSN5HoiDjhgiI1xKV9XHngoPDzE3Dt63ulo+bOdI80P0JbzoGpoUYGvRVJrewHJm+gJKc
	 dPMSJFQ162Zq3HTfF6wl4q0ljpTGFSGkxghz4T7A5GcghIuDtiK+PuQg6/uCun57J8iLr
	 63g/h+TxtfsfLtWhj8kxrXQWc2gQ8U+Qbrdrup0gtB53KekPL0KpeeFkbQmhZUrgm+JYH
	 aOcImzmMTpCu9ProP3a97UjBex39NgdfBlh2WVWPCtxG8U2MsczkhuPUiZXzF1lcabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y7oNN+Wo;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE2606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=y7oNN+Wo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795345668; x=1795604868;
	bh=PBmX0gymUfN6gygF+scb6Yb2OHU0W7WRU+BamkOLXMc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=y7oNN+Wotb35ShYE/eizEcKUZiUCh8E6bFEccBuZxXAFEMwIJKeZbLMTSMlv9T7K4
	 YDUNOBegX2Cy86ObbR87S0M3VhuMzzeT1IXlT+v8rglbHDy+5jmy+cKn9ZvqdtAapP
	 QOJ9r1CKSKLkIUKsPzjU55MhFsl5kch1f2ug5ksP8FlHpFXzEc/UhNtH3ibkqPSG0e
	 VsH0ctHDnRKGbkSRVKFX5ejlsAlTivwGwpsLXxW+3KPnCxr2jiXtka+QNIxOjKWD7Y
	 Ry5Zg7U+qJG88q5aF+KpSkLZWJpN1AxlE85f5ehplR2OFcW9Qk4DtXWo1JfT8UlWTO
	 C+uiiCmuutXSg==
Date: Sun, 22 Nov 2026 11:07:45 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: rtw89: fix u32 overflow in board element offset check
Message-ID: <p7rw-XuXkRXg0R2mJ5S-HUUy3IwDD0iXcY11AzTDIvfIj3ofQsJ5exatm_1V-mlBCzsd_s0xhJSBvZz4zWCYaso5-ylUw9JMV3AoiPUZZ3o=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 960f38f365011122a7bbcc77aede9c3c84d1d3ad
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
=20
 =09ent =3D &hdr->ents[board_id];
=20
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
