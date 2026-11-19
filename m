Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110613;
	b=idGOfP1ylDK0Rh8hyEzs89umlR5j5B+gvDJLEGjKf9G67VUwdldc/7VRiOYBYa4BRSmC
	 qcUTi4z4ETAk1Hz+JQfvP0eYygYnJnoqCawRAihsPcgGNtrJA8FiUc6strfTJmaZfgwsU
	 +NrRA4OR7ZYLm1KYpNj9Mf3claKFbDIrnREzUXjJ0a7se3j//7mz04UYvDNgeA5Z8xQ/Y
	 oeAAvedfSN53j9qqxL8KzDgshjvMB4GnhgqImltJ+d/KzWo/oxylCBtKBt3FiDmcT3DfR
	 5Jt09YV3GsrXV0Et5yv4j8w/jVnfj0255/tDKlms14ZepE4G/Z9X4GXUXTzzqGXsXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
	b=i/ncU2A3dR779SgCxAerArhvOyXU1IK4mFoMtP3zQdb0RYBE3PEkoPBcqkbP7nTSCae4
	 PMWHfY7ivrBWQYiTQo2uZYOoAONikpD4JoA4mzVjNoQD9zkzJckH0J5HAf+0YnWVltJWa
	 MlAgFT8C2X3kkCk4G1BmD0v4QWeGtgOFcKq3wSYBsbo6awmz4iykTSPcwLYL+QhcfEb7A
	 lb+CV1KDdP3enWWcenZjtVaWeP8QLxgGYTpD2WTgkq8ee1z/EFPhCruvoZxQy2f43MK13
	 P6HQ4o7jZ/6YEav8HyoYrmdwxTuPGzcXDJZKPc7YWvxnD/NYnGCa6JExzGk73K2Ko+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35D260A260E
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35D260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso28733795e9.3
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110611; x=1795715411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=pipCExcaAkgn33Jj+6XRGBrNhCc+5e9sj5XWlJo6lmJ/sjHGiZAeX5r2xVCdiCNUfI
         IIWErUWiAWY+B3j7mrp99xi/YrTIjNUJmkgtKvMfFAjEQ6Sd2c/u5fSE42jeEhPhMuKf
         T8/lzLvWPyKKXU1B0LGYaxfIjgAtb7+6pcaSd1U9NNSHH3gq+AEMHQ4/k4LhsUlyBHP4
         3ALctnth2LWKxHQHdzsj9TEau7rdpUow+TvP/1XU2wF2xnLb0txNfNYpf8LiZpbZOyI0
         zwyGZcgeIuEYEsujTM+NBjqz+fMizNvqzmEZdGcaxL3JqO3Mzt50eiIn30KmzBfM0KzR
         rNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110611; x=1795715411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=OiMOSodoYY16qa6xnqg1T2Inu4g93h3xv7kZF/n3CL7PXk3xmB1QDUrR8mlskDegto
         JKcTVoJw99txEWF+mShDHgFCk1xicYomViSfsv/JAY2MmeNudn8u27iu7qIsl+1HA92+
         1/xG3xJU0D1bWWf1geSRjCnetkqSWII80K5e6naN2U2s+owkMmkBcWMwsOw/uVJoWv7J
         1MZ1k4eikNXfVn4OCiWxUJ7EhlpQJXHJdZah/GGu/8YGOrc895F9KZDN7/xf8JLZqYsN
         0Osnsg/LGBJ6++C1dw+tXMPzwUXyWWV3OyHx//s2fqr4DVwg6M752IycljnSNc9Dvxx/
         cjMw==
X-Gm-Message-State: APuU4Z9dBF8nlVkeq1zqT39qeiBUntFd1W59rYAFQ6HbHyNAPS+5f9l9
	jh2Fzi06eg8XelwEeF3WCAsaAmg6z44jW6WZjw79lPW7qcVEm/SnKbtWhiXe41GA4wh5ASTbBSV
	MiHpjoow=
X-Gm-Gg: AYBFou1OVdN0YFg03rPVm+v/lFzJSwlTozL/OuosPOhEx3Vx0K+tNJa0qQNM7w0In14
	eZkLTZbsT7K0va+4Z2dPW1CNXvmzL9GTv6qayY2VEP+Jl6I8Ao+DBbGVXIYf8DTzPMFMUcaYBRG
	UrXhL0Dj4/7RHVVkgc1QHss5meNTcIMSlv2wH3BdAFBXLn3l0XavLHYJTMi1psOmYKokx+yZpbk
	opfj2YdhS8LBjYYOpUN6dFEqgmaGKhX2bdGid6FshRDNg6Fx0XJThINUwhr3SG0z3zo9CLv+dvU
	Mo9cLRd/impf8C3PRL3SvAQIS4SGSizEV6GxtYqsC/kHEgUAykRrxK9T9AppKsWG0/s8jLOnvcp
	gp7pNIcr75m0IENIoYVDxuvDrhlM4OzCv5q44UXEhquJNvmszAwitYmbHUK1k1dK+MiJ7cZT4Dy
	+eGYy8hL1BtRvc4KWsw+Xn0rMHbcTST1bHHh6+TtAwxW3Ii9FYKP1sM14VRaNfMiWS+eVn5Kp2n
	pj0L9glmmtBP01nhRP3IxeUDSBIJE79sL4kgaV2Qa2HTePMIloJ0JL886a69Pbp/EOZg+XHvyrp
	7mZzxAek/QuJSXxOw/ufIrnOQvI904eapxPSohwqyS9JLHxAPObPqF/VMQ9ONH4Zh2B/SXSf0pw
	+UZce9qEnUhFsKgrYZw4HGB2VFut421S5bz2NkY376iATLhz6iS1QVGOdLNEqt5kzAquta+qwHg
	LiB8o=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr8080595e9.2.1795110610855;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm53032625e9.15.2026.11.19.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
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
Subject: [PATCH wireless-next 03/10] wifi: cw1200: bounce SDIO transfers that use stack buffers
Date: Thu, 19 Nov 2026 18:49:55 +0100
Message-ID: <20261119175002.458988-4-arthur@aheymans.xyz>
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

Register accesses pass stack words to sdio_memcpy_fromio() and
sdio_memcpy_toio(). Use a heap buffer for stack and non-linear
addresses; keep the direct path for ordinary packet buffers.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 35 ++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 2b6afe221268..1894359ee9b4 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -10,6 +10,9 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/sched/task_stack.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/sdio_func.h>
 #include <linux/mmc/card.h>
@@ -61,14 +64,42 @@ static int cw1200_sdio_memcpy_fromio(struct hwbus_priv *self,
 				     unsigned int addr,
 				     void *dst, int count)
 {
-	return sdio_memcpy_fromio(self->func, dst, addr, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(dst) && !object_is_on_stack(dst))
+		return sdio_memcpy_fromio(self->func, dst, addr, count);
+
+	bounce = kmalloc(count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_fromio(self->func, bounce, addr, count);
+	if (!ret)
+		memcpy(dst, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static int cw1200_sdio_memcpy_toio(struct hwbus_priv *self,
 				   unsigned int addr,
 				   const void *src, int count)
 {
-	return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(src) && !object_is_on_stack(src))
+		return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+
+	bounce = kmemdup(src, count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_toio(self->func, addr, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static void cw1200_sdio_lock(struct hwbus_priv *self)
-- 
2.56.0

