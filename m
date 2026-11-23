Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458147;
	b=bcpjtVKKPHeCkesJ4IPvoeSkeQKLKjGgVypuv73ChwtoweOImF+gGyzPaUCzWlbIys9t
	 oaIZsprZ9LBS/YR97jGSNhnKUetuty+FvCtc+UmsSElqI3+YI7qaWGcq7J4zAwLlH0GwZ
	 Mxr0zz8hroq56pPhOMCxyJa5R2BsH9/JDum3NoNbGmmxr/7uThGARL0KjB/anLS4zQ5U4
	 iu6BB158ICtLNk0moJ1OfE21NGD6Agh+8sPKNJnF2h5ncZBH6vn8Dkp+VP9Sp/bb9zQOq
	 kau0YHd7ruyCHAFHxIeKpUpmPpt6d2L2vMsLdC6+RqTH6TgGzdiJy5PGZdBx+P4bykA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458147;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W62jdCKSqsbvalmLa+inpH0UsEpznK/18iQ3wN0ahh4=;
	b=V+wyN5DicuMzoUa5hlo4TAAlqTcCSITaPZExYTmwBmyHTNkLhiSAGy72qp7FbrhTj85G
	 U3cKQg8rt5UZG291CPtQtaiLq/ef0DuH8RokFj8Kzhx0F6UVIpmGY3mNt/0+bMFEg6a8g
	 ZsqT7XSGpZXsq9s6cr9xz7zJj/NfW5+KUYUiRMwItJ21Xd3S4aLIMnFeXxxTejbbytBdO
	 9Xa8vvtyauVsEuU9+K9WsS33278O+MhVihCtxQFP4zUy45nRLTyA3H6rKr2UvC6F2NHBW
	 OMKOYBQ8fZZ9Saj2wh9OsYqSgHjF4ZVPKU/c/UAPMIcc6hbQvhOLLjx1mX9pWJhkzxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=L0wXg3xQ;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3876606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3876606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=L0wXg3xQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795458143; x=1795717343;
	bh=W62jdCKSqsbvalmLa+inpH0UsEpznK/18iQ3wN0ahh4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=L0wXg3xQfmgKa5S0rvBGkFN+wLkFeUD3wzSPM86bPp5qxy7KJwvqf0WH7JpQAJQMV
	 7YfIM9KnI7zkWwL4KPAOHQlz7Rv+5VdSWmW2iZGje0Zzn5CmMBvZQLMbk6ybh/0vnF
	 ZRiw5BVmKCHEJZDMsVehqZd5/VFy1NtTVW8z17eEX8rPK5ncl7/aiz9xHE//0D6ZVU
	 cH+muhBKxi4EjAKZ0FJNCuEpG9mO0+A4uaAq9CEjmUewuWIvt8DBUsqZP6Sh0cZ+bA
	 P1RgVqQJQoBFnc7ufni75zl+3eM7kn5e/pNe1GnfaH81rp83v8WYVYupY9p7/gaAKH
	 d9YdwFUIIWKlw==
Date: Mon, 23 Nov 2026 18:22:19 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: Falconet3 <Falconet3@proton.me>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>
Subject: [PATCH v4 0/2] wifi: rtw89: bounds-check firmware element parsing
Message-ID: <Sndp-tQNkZ9wC2c3pgwnN3ct-AgpKNTZg2Nc3PRiPELGPvXYckQ_eyGkmaQyBHgyTge6PrGV53Tr8rE5jtpjVnia5f8KEMaypXt3XXBJe0g=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: bc8bd82f6c723293cc8dd1cec6c0cc83ddce44aa
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

Two bounds-check fixes in the rtw89 firmware element parser, both found
while auditing drivers/net/wireless/realtek/rtw89/fw.c.

1/2: __rtw89_fw_recognize_elements() checks only the element body
against firmware->size and ignores the 32-byte element header, so an
element whose body ends one byte before the end of the buffer is read up
to 31 bytes past it; for firmware larger than 2 MB those bytes are also
copied into a persistent devm_ buffer. The same loop's start offset is
unvalidated, and on 32-bit "offset + sizeof(*hdr)" wraps.

2/2: rtw89_board_elm_seek() validates the entry with "ofst + size" in
u32, which wraps, so a crafted board element file can set pseudo_fw->data
far outside the buffer.

Both need a crafted firmware or board element file loaded by the driver,
so these are hardening fixes, not remote attack vectors. No reproducer;
compile- and sparse-tested on x86_64.

---
v4: resend as a new thread at the maintainer's request; no code change
    since v3.
v3: resend of the series with the correct subjects and version label; no
    code change since v2.
v2: 1/2: validate the walk start offset before dereferencing hdr (fixes
    the 32-bit wrap) and use size_t remainder arithmetic; 2/2: new,
    split out as an independent caller.

 drivers/net/wireless/realtek/rtw89/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
