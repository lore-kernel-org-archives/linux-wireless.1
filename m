Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506190;
	b=uCkuZhhO08ODjJwgAIW5IZVC1dgd7n9Je92Mc/0fZFyy1UJMEkVUQFmzxKacWLkFv/WO
	 9xvB2vYydHCYa6mVwJvKy9MJY/RU2X1+x9fgyb7aERx+WmnIBGzq8Zu/Ok4ro3JIpPWom
	 wapWlL8hT0u3L1+AksrNt/lX9gClUIRyN+4jfQlvHm1nuW3CC6oq3N4ifRcjVMmlsgfRF
	 JpNxH5TM1SRDWjQwQ0ipGV8VvmR5V5VsY/ZTjTgOGIRRoGsJQEPLxq7rmF7m2FDwCmhek
	 hp5dsOeaBKSsK8k3hjz3yYww43OmrTW77qAwYiKttPSVb/S85uhtwwpJjLRxdoTPYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
	b=22lcYpUpe1Lde5bmVFUhV1zxEPFrkXVZxSyXYZli/KqFzW9uR+oJx+lU/dC0Z0gQggrL
	 7dlZefrqAAJt/AlFZ+pRXc/w84fSxM3MRTs5T+zpf+IvP2d225sRfiRrTV7BuwFUxJO78
	 bRUkAn4eGqADf1V4UcnEq/2MT6kraxhA1wVzSEkkNZELAEdNIItjEJDbWcBg2inFesIrW
	 vrzJthT+VSRv5J5Nj2ouX/OStnesTXm/Yx8K74OTkAK1R6GDI3GG0ItysLmxBcxoN25VE
	 AbtUQB76S+wWjm4Xl8wHrERDGVd1mHvMn+L4ghr3HOrwByPSxU0P4fAzjk7tv9jWhgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4N8nYzn;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6845606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6845606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4N8nYzn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490a0e72588so12144f8f.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506188; x=1795110988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
        b=V4N8nYznopgnOiuHT+YUe2sVDXtjCImj6Txxvl1bwqi4d3Asn+8ZAyKdlT5e95SPFI
         +KFB7/0qQjtD+q98aaERU6rVjpz+z9wdrkql649gfqe8fC3pih2TwyXl4mOMvw+ospGD
         iPfFx6Worl76CFR2Pk8tMCXk2xk7nkqetu0TF48ux4oMdhJqXZt1NzW7fDbz9tR9PlOs
         lhZAIxdQbyQA7zim5U3P79sF3ueh7LYwd4+ubMyf81w5KJ1JZF1HcT3vMuEHFm0DpiSH
         N3aQ8m1Erf8obsUGHTdjrBWvjwtVbhTXsAW/VK0Ke5jyYtB4aaIze2O3m8VnKmUDsMfo
         t2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506188; x=1795110988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKWAY7VVnpLDcrJZc6H5yDzttlq0pcYOErt/+PCFLEQ=;
        b=VHXqMlrYQ0fN93gksCSKxAxtyESNVEQ3eSg6bb2uAylXEfA/i3EUqWBVCVhlTshQiO
         eKCf09uhqhSyWX4rZZqiKJMQgQCbRbbDLo1CdfVUUbAqSTI0DRbuoG789vGUKF8qb4Vp
         XNNUf1gxm4sXAZHcUpU/SlmMnuRVwEN46+z16QCWr5rapvga5YAtdIzT8g9LcQfMMYBl
         ayOQzF50OLSIGxE0OEJod7Q2l4K7YD4PPUybOM9oReaqVD/arMwv2VlAlEATqiKWV3ML
         M0VAGbyyNUnSQ97sXELt/JJqA0QBAHEvjYureB1yDe1+JFFiqm2TsFcqo76P98+BWrto
         mcwQ==
X-Gm-Message-State: APuU4Z99jTh/+RvZVoqBiVMctHve9gtNmNDRCwavpsqh9Z2thFuSZkwy
	O/lFok6SsuOR+uBeMJck99NnI3JvkETR1Tk6oipPzQZv8GTn8uCMthMgRTi5SFicW+A=
X-Gm-Gg: AYBFou0Ux9SKE46n5hq3H2PMOsvB9LdLM8mjbS3K9oqAJ0lMM80Zl8KXO3sN6bXVJlC
	ap5YFC5kfZmHqXtxN6kR6xMW3cs1IuFBKhOulxdNgvUAG8ubw/13D2h+Tn5CMB0T5U6eCTFQC3b
	RH7LlacgoEiFpymVLQgDxW+vz+tZ8gSe+ezq6+ruS0ken1RXII0GWlE5/nym/zy44dcM5CWEtD9
	UganRr6qs5i07zpOKnxO+bd1NvE6uYAddIsjGgfXROr6PvlbriylA8fNT94PHJPZhp7eqVVg/U+
	2aRr3LWHeUPR77bLzZ0CA/Bavb+bb8uX11rqa+iRr5LRGf0SQJGtzmaatlJWK7pGWWGLl8KS0wN
	4v1yAhwriZjQ9X2+CENzjrEnEoA+ipdwpo2Gu6HLananQkXfXCxq70Zs+YWqmsORQN1xiTUKbvH
	1fiA6JpRJ3WXh/mHf3wB/b9Vu7EmxJsyyYr2tMM9jVXgMC6D8ZoodfJAbT2/WI4GI8LHCZeMsAV
	3p813l9vw+P8aoV4GF8OYg2LoqKbSr/6drtZDT6lSGlpmoZ9xonY934nh/eqEemkcg1OTRxGud3
	3kFBgNJJxJFMwgcuGl+v3OmCYbrCx3guQqv+rSk2Ml0pLkRAaumW068LKORJEZtSnOgMLiIXGAu
	RNtCe3sZH6nmkyuzj343DNln138k0v+aKCkt0sdHQes1A6Wh7FkeDyLpvvoAMUQNYw4gpcZXVCU
	nHjQqTblfIZFfyJCKZV70jK9trl2EQrS8nVoB3nVKXmQ==
X-Received: by 2002:a05:6000:490a:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-49c6dc01369mr339149f8f.1.1794506188068;
        Thu, 12 Nov 2026 09:56:28 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm438408f8f.57.2026.11.12.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:27 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 1/3] wifi: b43: set the DMA burst and prefetch bits of core revisions 40 and 42
Date: Thu, 12 Nov 2026 18:56:22 +0100
Message-ID: <20261112175624.40547-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
References: <20261112175624.40547-1-gonsolo@gmail.com>
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

The DMA engines of the core revisions 40 and 42 (BCM4352, BCM4360) need
the burst length and prefetch bits of the TX and RX control words that the
vendor driver sets (0x03780040 and 0x036c0000). Without them the engine
moves about 6 MB/s and every link tops out near 50 Mbit/s.

Add b43_is_ac_core() for these core revisions.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/b43.h | 6 ++++++
 drivers/net/wireless/broadcom/b43/dma.c | 4 ++++
 drivers/net/wireless/broadcom/b43/dma.h | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/b43.h b/drivers/net/wireless/broadcom/b43/b43.h
index e1e8083..80b299b 100644
--- a/drivers/net/wireless/broadcom/b43/b43.h
+++ b/drivers/net/wireless/broadcom/b43/b43.h
@@ -1001,6 +1001,12 @@ static inline enum nl80211_band b43_current_band(struct b43_wl *wl)
 	return wl->hw->conf.chandef.chan->band;
 }
 
+/* MAC core of the BCM4352 and BCM4360 (core revisions 40 and 42). */
+static inline bool b43_is_ac_core(struct b43_wldev *dev)
+{
+	return dev->dev->core_rev == 40 || dev->dev->core_rev == 42;
+}
+
 static inline int b43_bus_may_powerdown(struct b43_wldev *wldev)
 {
 	return wldev->dev->bus_may_powerdown(wldev->dev);
diff --git a/drivers/net/wireless/broadcom/b43/dma.c b/drivers/net/wireless/broadcom/b43/dma.c
index 5e1b30a..5f968b0 100644
--- a/drivers/net/wireless/broadcom/b43/dma.c
+++ b/drivers/net/wireless/broadcom/b43/dma.c
@@ -691,6 +691,8 @@ static int dmacontroller_setup(struct b43_dmaring *ring)
 			    & B43_DMA64_TXADDREXT_MASK;
 			if (!parity)
 				value |= B43_DMA64_TXPARITYDISABLE;
+			if (b43_is_ac_core(ring->dev))
+				value |= B43_DMA64_TXCTL_AC;
 			if (ring->dev->dma.ptr_is_addr) {
 				ring->ptr_base = lower_32_bits(ring->dmabase);
 				value |= b43_dma_read(ring, B43_DMA64_TXCTL) &
@@ -733,6 +735,8 @@ static int dmacontroller_setup(struct b43_dmaring *ring)
 			    & B43_DMA64_RXADDREXT_MASK;
 			if (!parity)
 				value |= B43_DMA64_RXPARITYDISABLE;
+			if (b43_is_ac_core(ring->dev))
+				value |= B43_DMA64_RXCTL_AC;
 			if (ring->dev->dma.ptr_is_addr) {
 				ring->ptr_base = lower_32_bits(ring->dmabase);
 				value |= b43_dma_read(ring, B43_DMA64_RXCTL) &
diff --git a/drivers/net/wireless/broadcom/b43/dma.h b/drivers/net/wireless/broadcom/b43/dma.h
index eddc882..14de4cb 100644
--- a/drivers/net/wireless/broadcom/b43/dma.h
+++ b/drivers/net/wireless/broadcom/b43/dma.h
@@ -91,6 +91,7 @@ struct b43_dmadesc32 {
 #define		B43_DMA64_TXADDREXT_MASK		0x00030000
 #define		B43_DMA64_TXADDREXT_SHIFT		16
 #define B43_DMA64_TXCTL_KEEP				0x03FC00C0
+#define B43_DMA64_TXCTL_AC				0x03780040
 #define B43_DMA64_TXINDEX				0x04
 #define B43_DMA64_TXRINGLO				0x08
 #define B43_DMA64_TXRINGHI				0x0C
@@ -120,6 +121,7 @@ struct b43_dmadesc32 {
 #define		B43_DMA64_RXADDREXT_MASK		0x00030000
 #define		B43_DMA64_RXADDREXT_SHIFT		16
 #define B43_DMA64_RXCTL_KEEP				0x03FC0000
+#define B43_DMA64_RXCTL_AC				0x036c0000
 #define B43_DMA64_RXINDEX				0x24
 #define B43_DMA64_RXRINGLO				0x28
 #define B43_DMA64_RXRINGHI				0x2C
