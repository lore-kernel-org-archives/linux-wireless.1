Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999739;
	b=hEOMZl1OMkThjyPFHFHKp7Gdqgvj1Hr5lK6AEh1AF1wXwnX20O30r54Fs/OKgWA3H3gy
	 /olax7qNLjyncjPDfFBYcdOEvm4rCx39LTvmIGsJM7ldHNuoqkKBvMAup2Y9kjYRz9lUQ
	 H6PGrhWrw2RX/O+RqYpzj0Ia2j6Ymmnou/mMHtgm6YQuhf/lXezVOp20RteQ2VPdeCbE/
	 HoY69MAYuNW1ZYY73qF8oGPAMhu6jysMGKerwzx4cJ7rrVOaQemyOry8f4sQN/ey7L/Si
	 lZnW0vnF8IcH5ttPAX0spNZwnvvPA7U+dSEo7loBhN6gSVh9loDPRs01jcaC9FiAcqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FE9Jx3Oce5/DrcXeSeUgKLEZbdD4bTE8lYWFSeIC14Y=;
	b=wNvTPNNBIiNU6LZmYdQ9NuvGKnYqWG8ZJYLi5Y/c/937wJE9l9C3vJtTwNZp+2kg8Nfz
	 diWOwbbHw+csWxROl6XBwqayiFSz9mFFUx1ZwfOtezkezKW7pD/7Fzbn94+oKCz0e9jtu
	 4juqtR3CyPsC9RBkw/BXD4sn5LW6vPYaKl+KpQ5mFs+K/+tlpsqIphWoaK3zZ4uo0e4Wj
	 m1HPhB6o8seB7sg7Lo/4fbdr7Wkv2k0pEhinwpP/VX+EtarLD7jbpV0KjYhb+S3J/hYi3
	 IdaS0IiFLpp5oHh3DYkdB+uN1Xo0dGFpoFfndesq3q11JW99pkdd07VMW5laOaG5XOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XnCYqB0;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53859606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53859606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XnCYqB0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so559595e9.1
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999738; x=1794604538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FE9Jx3Oce5/DrcXeSeUgKLEZbdD4bTE8lYWFSeIC14Y=;
        b=0XnCYqB0JcjuxEuVVfxwQk/rJuUxpLUO4zfc8JbO3Qjl75Ifyi9k0PiXQ303hYKUGn
         HKmCXXzT1lH+q9jaLkPkdzl7JCSy6rKP9lx+qKkfHeC9PD5Jx5Z3MhBjL3eBetKD3PkV
         psLQcGpA9HqTM5tGAQa3/oaZld9ugMXCZMBgJVvAo6XUIV6Ql8IMXPLMOb2JfEKK8tZO
         cVWh7gGv40pvpfBG9mFaPPhBdoLggftdjLt84/QW8tzmPPiuBMQFTzBqBfFnnTauMo0K
         giwWJ2ncLr9tZ9Kssk0d3oYMHqMrsimzLzR63BI0xxeQG5+fgnWYTztsp4aultFSTs4+
         5ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999738; x=1794604538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FE9Jx3Oce5/DrcXeSeUgKLEZbdD4bTE8lYWFSeIC14Y=;
        b=2jGhakeNnrcBTDnGfd1xTIKYwDjChpTFQ80KlOsyfWmlpCxuwiGfdRhnBaIYK6ttkt
         X9Hw1cm5mgf0LX1YFvhLeXYklXoj221xyVe5K18RTWr4hYke4Kj6vWBQy9laowzMq3kO
         znlQrFYPq5Z0oMeFQVj5qv+OSepeVV6BIq8lKOgSPrK1RJciiZ+EsHC9MVp8gAxC5B5c
         HXGQaXwqkfJ+MKJaHZAnUaAqduE7xfHg2gIQJgVFjUpFwlwcaWBi4IKgRdx9XhLLQxqu
         aEa9aCmLyByYBHt1a9VkSloIeL+fQqARG5jwDcqNMSVlkhVie3wm35EGxtNH4KO5FH+6
         JkQA==
X-Gm-Message-State: APuU4Z+ijbC2Rvctx8YGHF3oYsrmiJsyow+V6Btj9LOWykYuZE1WJQJ7
	vTWoCQ5WDacTImYaHoDVydDH5ZSW15WdlWERaD4WX0+qJrbCNEsbaO1FRjmtbvx1
X-Gm-Gg: AYBFou3sBaUeM7T9mviQjbM41WiBC1Ld3TsUsKt3AfS/8Xh2qZbnm8zacvtT4NJvw3m
	sYTOliuH63InIr3UQZrCuG226Kpi/eGVn3rqdMVmblKhT0HF3dYGzE58u+hhh9aD8NyfqtsZuWG
	eAyX8qLsX38PXSzX0gjopCD4ZDHfNg/id6JmUep2AL60NkHkbnmlk9lU0gv+rTyohJruWvevhgK
	RPO3euXrS8dKr1dmXp1ftyjLlhMsUBSwhYTmfi3pKBoEY+u/UbOpSO8JUKFGDHs/IigfRbkc0O4
	JbGX+AP53326rO3zeyAU1KxO3ujftZ8s0bZ6GH9mwJWoWEchKMZxBP5k3coemfENNHpiznQk+Tu
	7QXA2q7zFJWnQq7a4zBhomJjHgkr6aPz/Dx6DkTbOwOMRvpj8gu1P0ydx95f8y4uHx6nVzGlAjW
	rvoBBuYx5e8D9xieMzUx1zAlZAZ0Fy0SaJcAhVFKJpouJrqDA8FFvESVH1J43mjBeUcSFqqRaSN
	vGVuJCU9RNl2oprIqrAzLg25Zlzrt7pjN+/X1gay1Yd5ill2QtQmjun9rTCvKIW8jvi5rOWtr1N
	D9TEEvsD63roQewDA8bCXqMYHpmV7TuZ9oX6XYtpaZjBQnTP7DI=
X-Received: by 2002:a05:600c:64c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4b8190f42aemr3302375e9.6.1793999737652;
        Fri, 06 Nov 2026 13:15:37 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:37 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 4/5] b43: N-PHY: use wl's delays in the 2057 RC calibration
Date: Fri,  6 Nov 2026 22:15:15 +0100
Message-ID: <20261106211516.273791-5-luk00casati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
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

b43_radio_2057_rccal() follows wl's sequence, but sleeps with
usleep_range(x, 2 * x) where wl waits x us, and polls DONE every
500 us where wl polls about every 30 us. Every step takes about twice
as long as in wl.

That breaks the first run. Its poll comes straight after the start,
while RCCAL_DONE_OSCCAP still has the done bit set from before, so it
returns at once and the run is stopped. wl does the same, but writes
the stop about 40 us after the start; b43 writes it about 85 us in,
while the cal is running. RCCAL_SCAP_VAL then reads 0 or 0x1f instead
of 8 on a BCM43228 (radio 2057 rev 9), which detunes the TX low-pass
filter set up in the rev7+ workarounds. With only that delay fixed it
reads 7; with all of wl's delays it reads 8, as with wl.

Use wl's delays, with udelay(): the whole cal busy-waits about 2 ms,
as brcmsmac's version does.

mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch4-rccal.txt

Found and fixed with the help of an AI coding assistant (Claude Opus 5.5),
by comparing mmiotraces of b43 and wl on the same card.

Signed-off-by: Luca Casati <luk00casati@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 36c07d891..ab8fab018 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -940,12 +940,12 @@ static u16 b43_radio_2057_rccal(struct b43_wldev *dev)
 
 	/* Start, wait, stop */
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x55);
-	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 500,
+	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 30,
 				  5000000))
 		b43dbg(dev->wl, "Radio 0x2057 rccal timeout\n");
-	usleep_range(35, 70);
+	udelay(35);
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x15);
-	usleep_range(70, 140);
+	udelay(70);
 
 	/* Setup cal */
 	if (special) {
@@ -958,15 +958,15 @@ static u16 b43_radio_2057_rccal(struct b43_wldev *dev)
 	b43_radio_write(dev, R2057_RCCAL_X1, 0x6E);
 
 	/* Start, wait, stop */
-	usleep_range(35, 70);
+	udelay(35);
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x55);
-	usleep_range(70, 140);
-	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 500,
+	udelay(70);
+	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 30,
 				  5000000))
 		b43dbg(dev->wl, "Radio 0x2057 rccal timeout\n");
-	usleep_range(35, 70);
+	udelay(35);
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x15);
-	usleep_range(70, 140);
+	udelay(70);
 
 	/* Setup cal */
 	if (special) {
@@ -980,18 +980,18 @@ static u16 b43_radio_2057_rccal(struct b43_wldev *dev)
 	}
 
 	/* Start, wait, stop */
-	usleep_range(35, 70);
+	udelay(35);
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x55);
-	usleep_range(70, 140);
-	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 500,
+	udelay(70);
+	if (!b43_radio_wait_value(dev, R2057_RCCAL_DONE_OSCCAP, 2, 2, 30,
 				  5000000)) {
 		b43err(dev->wl, "Radio 0x2057 rcal timeout\n");
 		return 0;
 	}
 	tmp = b43_radio_read(dev, R2057_RCCAL_DONE_OSCCAP);
-	usleep_range(35, 70);
+	udelay(35);
 	b43_radio_write(dev, R2057_RCCAL_START_R1_Q1_P1, 0x15);
-	usleep_range(70, 140);
+	udelay(70);
 
 	if (special)
 		b43_radio_mask(dev, R2057_RCCAL_MASTER, ~0x1);
-- 
2.43.0

