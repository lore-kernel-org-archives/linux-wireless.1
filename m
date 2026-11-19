Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110613;
	b=HsEXrpSCNH8oyfdEFbDl+rKKRGBmPsVKG881oTnYSpDECH+nv0CPA2+kThm8hKKxrkFV
	 YNpzNFZ1sZi8bvNgnKHuDIc0WX6IO+8qz/KNT0RlnbQn6bBrA8qn7yFOHJ9Pz2U7Ytdj5
	 WYkQNUw8x9T0bUns1qolynX7KHWBHSOLBBN9DOZgTos0asmXs3o3U5BP/EdD0Vrh7z4ok
	 OPq51dZG22i7NnQ/iesqEwQrs2gLF3nn2XYGRoeABPZiNzW2XDtSdnbMm4cPANtAvkIHG
	 gJvZFw6yZFGTCC2wlJ2+UWNd4VR1UFZsgTfWbNQIY2N///uraVYQ3/MUGWqS770RSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
	b=oU3qaLU6ZWwWBnqTZhOtpKDTIaxxBdVQBzK+orRKr+bSUdHgmBvLofRfF9qCLhZF8AMT
	 rFe8Fnk7EgaOcjxNBUxfUVkiYy6vEwCBJ6qynpdXfFbV2ngKrgyue9are17+H3XG5DQEK
	 xGXMVfdWRAPMBg3jN6umfjRCJuuzZs8zALFCsEtIyGVW01/8rRVt0EXxfjUprkPa+3QYN
	 4m1GN4MdeefA1rETRHCQTML9P7NyIRZw5nIF4CHYkLJ/JY3GebDgdxPQOiMCuy5SEnR18
	 Y9m6HrPHpXi/Br1sKiZ5+crNDgWsbBptIof+/pDFP3KsF6nbDpNQF90rvta6Ozj6spQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C1606A330
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514C1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gMr5ru9l
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15191665e9.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110612; x=1795715412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=gMr5ru9lLh5siTDux9OeJMjctF8puIy6nYysyT9y+2aXt30gBNSeo2LqIHd4LgYy3W
         W0xYnInGeBUJFzMeXImmASrU0JOYIksebNC3t6YcmeH97eq3P36pDRT+5JJ+FyfsG7Dw
         3QUUkbjuahCxGBtzHeZi1Dz688ZBghQ8eXw51SPAOjg32nIfMgEN6B4+iZArnmGVWKDZ
         KMGYy00pfZsrXSuLERVR40hV3dFbwvDuSKmHfWIhL8dWSP8VOKuQoHzoTXAVcOa3rF58
         KPgS6QBL5VPg2PT2fEw6KWl8hnNJ708LdPoON05k/vfQaV4nDvl++XI2oRl/Y5bqHDwF
         T+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110612; x=1795715412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvEm5T+elZmAIVJRuKb7mSJIVKxbHtl2NRkj0Gb2l8U=;
        b=QRYygy/kx0Eht/tDH3FQ6aFkrUvUJqAsZqx5ozMeWRrIKxPQCPn0LDJpbqtpSBBo8x
         dmUueb5F2ftxxN4GP6r561kV+Nhy6Cbhoy2y5c4ZmfCfLiqjMdtRdzly8cTORRbQjOHD
         uHQucss8zpgaiMg2FQF15Lrp9gW4HHJZM1EeKmXd8/D1i68kJBDtje/YQQ1GKlNsTSMo
         3D7rU5/O8G1CY8ZaRDU1XLNpz7wmqMi8uo598WPGAMlTtDiDgGHrd343SgdG2OnB9fnq
         DxyK1DJ3OPp9DaGyQMGUPwvB1ztV+xB2fii5CtQ4bljv6pmhKFHOZHffkErfMdz7KM9V
         ++Bg==
X-Gm-Message-State: APuU4Z93D8VyQceukcLGGVVus9gG0cycHV1JW9Y1lIJPH+m6OhJnFSEG
	JZKiIhb1uUluKkL9d/lAI9mjIJH4MG8ttr4IHlKEH4kCGRiRLbz/UoRluXpASmgakAG7Qyp2tFK
	mIqtLoNI=
X-Gm-Gg: AYBFou3PJqdRnigsLTiwyh1YbhIM9Rar32Qc3n2i6oBcCM9FHRQ/I0r4KidJrfgtjTf
	jmi6eiGZYTGZkaD86POYvqr6iqlKzDYFpyGSvvVOj+kxaFxQSJSNQOaTMFtaWNMve1gx0qDWx3a
	4fUeKiZhOS/OUDFpZ1awlxaSRamFCB8LZ/b4SOYbGapYCwNham2STnGiv/UM+FVdmupjDoP3hHI
	OPsXG1oOwIJaU+i7SNK1o/XrLqT4zHDAi2Lb39GhfjjZkx5XZ63Wh6hf7OeOZmoyCwvU3Sk5TIc
	p4kv7S4zdA8MqC7TfyeOcF0X/3/21EZnZUEEGl1xx43lxivue9m5yS8sTVs1E5WvfL9HzWmh8O7
	Wb8i+QV4bSPls90PFCq3bUkJuBbMas+Ztw3wWzz6W2lBenyceDYJ8BZbiajokL+Rmadhy5sBWuW
	XddMzlKYDvFRHtjxBlJMvYWUSl+IX7l7mAWVChOtCjf64Ol2WfKZaBhuawqBiZSg3L7byfbychd
	s9UC3mCnNRmhipaanlLHmOpXipHpuJmv+Jg9nKQ+w3vc2Pnq+ur/hldK6Dbkt9DD6xqAJmb7S4L
	3PDwkubHF15YHahnuQc0BMs31iIYYu5LGX9Jx3L0gX6Jb9TXAJXEJpqcQ3yqU/NAibk0SNBjla7
	nfbEZ6G3BQc4kvXzHs1Z9GYOx8QAZ9tRbHlwHScaUvcMHZOW4aZticWgenNANr2NkuH5xnWD+F5
	cl8Q==
X-Received: by 2002:a05:600c:820d:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb887e21c6mr6739265e9.3.1795110611578;
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90733095e9.2.2026.11.19.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:11 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 04/10] wifi: cw1200: unwind GPIO interrupt setup on error
Date: Thu, 19 Nov 2026 18:49:56 +0100
Message-ID: <20261119175002.458988-5-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

If requesting the GPIO interrupt fails, the wake reference and the
card interrupt enables remain set. Drop the wake reference and restore
the original CCCR interrupt-enable byte on the error paths.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 38 ++++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 1894359ee9b4..dda201e69735 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -143,37 +143,35 @@ static irqreturn_t cw1200_gpio_irq(int irq, void *dev_id)
 static int cw1200_request_irq(struct hwbus_priv *self)
 {
 	int ret;
-	u8 cccr;
+	int err;
+	u8 ien;
 
-	cccr = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
-
-	/* Master interrupt enable ... */
-	cccr |= BIT(0);
-
-	/* ... for our function */
-	cccr |= BIT(self->func->num);
+	ien = sdio_f0_readb(self->func, SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
-	sdio_f0_writeb(self->func, cccr, SDIO_CCCR_IENx, &ret);
-	if (WARN_ON(ret))
-		goto err;
+	sdio_f0_writeb(self->func, ien | BIT(0) | BIT(self->func->num),
+		       SDIO_CCCR_IENx, &ret);
+	if (ret)
+		return ret;
 
 	ret = enable_irq_wake(self->pdata->irq);
-	if (WARN_ON(ret))
-		goto err;
+	if (ret)
+		goto restore_ien;
 
 	/* Request the IRQ */
 	ret =  request_threaded_irq(self->pdata->irq, cw1200_gpio_hardirq,
 				    cw1200_gpio_irq,
 				    IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				    "cw1200_wlan_irq", self);
-	if (WARN_ON(ret))
-		goto err;
-
-	return 0;
+	if (!ret)
+		return 0;
 
-err:
+	disable_irq_wake(self->pdata->irq);
+restore_ien:
+	sdio_f0_writeb(self->func, ien, SDIO_CCCR_IENx, &err);
+	if (err)
+		dev_warn(&self->func->dev, "cannot restore interrupt enables: %d\n", err);
 	return ret;
 }
 
-- 
2.56.0

