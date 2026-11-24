Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541789;
	b=Ub0Ko2H6oqQjg9B2nj1SHIrhSeCYdSJaFXZsgMWdIg8lmT91JyWsoJ0kt5p0IaU9ufKu
	 5YXkX4rTbaSLOIxrZOwAPJtwyWK9vnyW4w/7yYMw7z5/YRcsXIqsPOYm6q7e7/7zQAh1q
	 FIUQ6cxSSdMuGP3qVGgzCjsanKqmgRjEqYgwz/T52fWUQ3JS9UzJE/97WwBKW2N5SRCt7
	 1ecBBiB4nrPcK4rEZwE0QfqXfq7+o0X5mYT9vThLMtfEOgcMfomjm/KT8XUMmHHb26oCD
	 +yDf0ccDiP9DLq1Mh6Gwn/zXOoK0z6eXyqhp01pU7qGyL/6aDzX9C5m3JD0gm5Q4szQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbNl23hJg1zhKbb7G3pd1XhcFGZFlCFFFZsOCpK/2p4=;
	b=XS4km+PsqFhV+1YvDXgVqxXBoQTw+bh/mPM6qbwzLd8zK7uBkDkZXqOgZo0RWeh1b+7W
	 LsctGv9U64FniL2IaBlQW2fhebzNlmFDoj26tM++OSjGYerT4kz1BxG+9qfSdkJ5sbKt2
	 PUA3PY5QNe9msUvFTUQAKASkAtDfrgHioJqWO8sN2HZmUnGvrDlZLGBeZCdWgF7wM2Gl3
	 GR4oi6CnjCBwk6+r/U8kpwyM8TgnmoZAwE44D4TXYQUNaHeNjKN3zggyr+b/kAK4OmCd2
	 qua+asosN3mKhQqvyfO7BRJZ1XmrcdOBcPwykaNHfpMY52kfGpo8DA5XyMRYSDNvtcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvctpYzb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E1606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvctpYzb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so41623035e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541787; x=1796146587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbNl23hJg1zhKbb7G3pd1XhcFGZFlCFFFZsOCpK/2p4=;
        b=PvctpYzb1u8JcsH4LrpwM+4rqwqAK72f/fTIrzOhUkIixFwHQ9WL5vVg2312aYuVbM
         AGcYgYla9aGPLyNb9IP0fDDKLyQMABmh+NLYEa1i8dty0WVBU1pfZfGDEuP/5sluGNQs
         0S9ZJsNluykyCjIv1X+PSTmYNpePwlqM5WnEjEREFupbPvb95pykVdWtEwH49zPwIPdn
         ZetU2iXYJ2ME30gv71vmUR3Jza0oqC9J+NEW9m56psYlVSSIsBvTVQjJC580s7hlRe0v
         OSyFcfoUZltHJGOhmz7htLKD2i/eI6wfJelNL5LTkxqg2Jt4x3aCtY6u83F6FJep5TCx
         3nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541787; x=1796146587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbNl23hJg1zhKbb7G3pd1XhcFGZFlCFFFZsOCpK/2p4=;
        b=sRpFrYwIFO7NFRoBxQ5TRsyRuMZippW0NqfoF8f09vZUYUOT4vx2Ls6ZyRkKHKs+PB
         ZkKxDEyFsHYkdmScrdX7uCJbSBa+Ecdbzss/p4sjnATpItfr6CeJifeeNLyt6zcvamhZ
         hJOfM6XWFL7a657u5u0keHYpklXm6dEh1sTwdXQQjQeB0AlJcwiqGT2kzfpfPXbdvRV9
         0kheNxHk8DPvNlk+863ZEWmBg7xebysa07SCLwoOKuNCt8LVboV90hlOLRYFXAPySMAB
         mh+rFJ8XwMe6lR87UyWKWeMUrUSsfuWbqdni+Zr1irhJX0B230Rh3JvylGodKsAJarMS
         mkFw==
X-Forwarded-Encrypted: i=1; AL+hErHgQhwxKf7fPSBmkk5z4t4ThArcaOoaqEShm+e7urrzHT1nuZ/LyfqgunxQyTEeR7rbU+MDcKZPGeICY40Tpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6am3GFoaquaneDG3AJarkK3pcjsF/mBoTTbu3avgGIpM0c2bp
	IFQ1NaeJWUXZmPRzG1lEztQvOG1BthXbq4oZFhyIk8pf80s7msVAfbc=
X-Gm-Gg: AZFdTZej6sqpOerLhaArU4pQqF5qVw7s+c8nDMKsJfLeNbInC3t4StLqciOZoIP2yf5
	ooWakTI40D+qTFZZN+cigroFjcLBzUPwp7D/46R0LUQOpzmA/pa6gURAUm6Z8yFTJue2vh7S5cw
	AtT6Hpp14xOoGRcEjF+rnY4QcvkqZjXIZWxxiCRYIyMnIMp3K/df71vXbeRwKK4x7CyJrW+zOMO
	Iw55L9Vm/cQU6rE2WJjz7T8ZXRYmHup6oDLbrHoPUqy1f55Fw824asjG6PlA0ySwQvXtiPIiTy8
	WdIIKa37rsKdVmAxIknngdH29MWVDEuQcDO++OrV7P10xYGUNHG98v0NuZXSFG2DqTwZZDSfqz5
	3HcYRFlIw8e2GRezZuBWDY8cG312c3lYBlR5slOKfslU3Sk1x3D0MgA7rYqL/Vh1tgsmG7ooXWl
	ShPWC/+dB5NDkkicuBfSqGxX+eW2/9uK0wwTZzFTPW8/6mFfIwLignnXBSaVCoIoHGu4EkDJv9Q
	xlmEozOlW8BbrDAzWQcB/dagLh4OX8C5+DGc3KjGZXhA9c3Tgc7SdPl3lr+PQZvbSd0rl5xXqIo
	WMck4DEmP8t9uFg=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr308628985e9.26.1795541787091;
        Tue, 24 Nov 2026 09:36:27 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm267098675e9.1.2026.11.24.09.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:36:26 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Bing Zhao <bzhao@marvell.com>,
	Amitkumar Karwar <akarwar@marvell.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 0/2] wifi: mwifiex: validate firmware response sizes
Date: Tue, 24 Nov 2026 17:36:15 +0000
Message-ID: <20261124173617.802875-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

Two missing bounds checks on firmware-provided size fields in mwifiex:

  1. ext_scan event: buf_size is used to determine scan response
     parsing length but never checked against the event buffer.

  2. command response: resp->size is passed to individual handlers
     but never validated against the response skb length.

Both patches add early validation that the declared size fits within
the actual buffer before proceeding with parsing.

Changes in v2:
- Patch 2/2: moved the response size check after timer_delete_sync()
  so the command timer is properly cancelled before the early return
  (Jeff Chen)

Tristan Madani (2):
  wifi: mwifiex: validate ext_scan buf_size against event buffer length
  wifi: mwifiex: validate command response size against buffer length

 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 14 ++++++++++++++
 drivers/net/wireless/marvell/mwifiex/scan.c   |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.47.3
