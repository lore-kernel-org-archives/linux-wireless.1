Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110614;
	b=afkb4WjXGkyFQQeKZl2XF/2RNvy3VkFb1vH1gTiG6Rx10lyuCSWSMrYDf78xUb+GbyOX
	 1McHJDYg62Yz2nDHtUvb0a549HA77S9t0fEJhGAx1HSvy6Fw7ZdTBSAF6TgS7nSoozc9K
	 peFPHhhnVkCLLcSFA6Cdj0BkAx9CXVdKmND2gCstfbRyF6/JF8nopshdSq/FewH0YJQpu
	 reb5h5iUuhiiEpLboK+YlWVsQgUvebgh7uL7o3q/s7/DXWWZqXzyRjDSbOciXNCgGgl9v
	 teRs8kefhc+ypIWlwDxGwZ51O5tC7iT/usS7x0g+azJ+pPsnD21fD3tY1oMy0nlPqig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V0vXpQ0w5/8cdfKY20evJG5SNfOITIVEXlv4OVmyRbg=;
	b=G4Oq7VKs4xR6xYf40JxnAdaGzvpWsFYiUf6BBDtR3Ad8Viqu13mFION8yJBM0LaihwGj
	 jabmAPCVjWlM5mZ7Zxxunm9547Vt1g/atJWaMjfRpeqX8pE+H5IVogHeWb1jm4b9/yEkl
	 0HbsTeM8RD1YisfxWfIdmAf3RWExNrynKeSIqOe4PWAO4654G1MWb4soAcRV7KTYvxPRk
	 +G+4wJE96aTxB1qRBQLz1wi4K2OtQfK2B7CTiSXbSENDjOj1i2Pq3tHg1AsGa/hKuzK+Y
	 wZdFPx/+qDi9xM/sUTSVa6qYpEH3XL26je2XT5lYuas/j59xpjbjQRNNnh48SVGGwQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Er3vtfFG;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7C60A380B
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B7C60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Er3vtfFG
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1484057f8f.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110613; x=1795715413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0vXpQ0w5/8cdfKY20evJG5SNfOITIVEXlv4OVmyRbg=;
        b=Er3vtfFGoCzSDbL+gYHxTGR5zk9JEAhm3BZQqUoya72WEJA9eVxyNXImSfwOYUsiFK
         2mPYEn9mbPUvUMe9eAzZ58egX6hIjz/oVmYuvzOA2zI7b7/zq0vGkZLSokrd0kDcaY3F
         ljalrKl3DU65DnwTvq35I0g8JQwvgZWiJD9jMwJinDDhpJAc7SylFHygyPlDrI2gDKVf
         KPctNg5kBlEuYyUeUYlDmrB644Vd8uAXs4s3fvehcO/TW7S9o0yFWRMOReAs0I/3qJXS
         r8e7PYhQq/eKZhwHgAUypbxjlSLJFkl6ZBAf3Bhteb8Ypl0CG6xPLWOA02ZqPG9vGl2b
         YcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110613; x=1795715413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0vXpQ0w5/8cdfKY20evJG5SNfOITIVEXlv4OVmyRbg=;
        b=SQem6otD7HL2zUtk19qBRRtHaSMat4BLKidsel44WItvbOUMGbMlol42qhoAZQJrmR
         f8rSu4cV6HmMA4Sxj9ewF1Y3Y+/GGH1eCKP8ntSP3VJLPdNMbiNdJRE83y/kgaQI79lu
         vJIALpDKG4Db5u41HUWOMd0jxgszQzUOgeJzuE2UcsdE1ODftf+epiH5fcFuZZO7dq2/
         JphnMCbjcUxUEogQ0kFBecPXmYP4Q6gpROEgWo8MoUn9wg1LFjlM7IV7wHq25ylA+Do9
         Bwqzeo84KzXD3iErUbBg3acfgmGwSWyu0HM/vXhu8WYmxHE+QQOAw9V2Bq0WzmPiqy0M
         oTtw==
X-Gm-Message-State: APuU4Z8GSvpnsyGG5R9Y7gHNOFNo3AU5dNlg8VfM/RWcdZs6h2818YWT
	I9Fg5siiRQmM9RG9ETi8DPTAgHgn3gMK9klPIfBWYpEklde4Eh3FGh9H872xFiVy83BnQLtLgNG
	fDbTv+Yg=
X-Gm-Gg: AZFdTZeF5L66t+xa1dTWcg+xnKshCB0qmPVHbwoKWcydlSdqKWMNtiwEsNrn47q/ryH
	63ZiZiROlBJ3r+b5l+dpVtXLeFbYBksw64ZoDAW+gZUq9YGRbaYIwlvsVN5962fPYZnjaGzFHJK
	uOQx1m3F4AH6FC0g5BK9kCS8nGbJsAE5UtAN7dLnaybmWKq10V/6IV9OQcKIGS0TlkZIe7CM+VB
	SbCtm+NB62bhcWhtBY6cq0FgaOti0zPfNnX0mB9/D3SaG9rTDouZDIoU9M7bPGFszlc/pnWEOJS
	OrDqBFaue0L3h7aZZx4KsF2s2sd09oOz+82b+EA3w9ETfMRT1c0q4SNmh8iNpC9TCvFVpb7XP6l
	6ay9KC5TRdpMVUIYPNoJnHaX3tkgeeIhlPxkMRqNJlU15E2BWb4PbEwLBT5qEjsNAtJ6+8rSutA
	37NJozr8ney4iGd8BJT/RWXZ34674lT35UHor2WWrJA0PyhWANf8eHIVfq9mBOCGge2BsaEXcFq
	wk+l2CeCQUJvaNHdFGU62p3cCWSUkjj3SPCH6Vlr/ja0GIPd5G/wbGtcgG6lpowrIeYn54jrsma
	vQLqg2P7rv81fFiOQrG1Q7eDcwAlFpkhr54oCxNFxS/GrbbvIWJcrXVMNZsiWS3IsTxUkwkv9Yk
	LO69glMvtT0NQMGLDwglBqbYHCVudSi48Ykdk33zDGZE1y+hbr4NBmTx7pI3owKNWkTTSGMX6HG
	DnyBUapKJsz/dYXN3PHWlDHAk=
X-Received: by 2002:a05:6000:29ce:b0:492:820d:1e with SMTP id ffacd0b85a97d-4abb0f3c464mr154289f8f.11.1795110612350;
        Thu, 19 Nov 2026 09:50:12 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm894064f8f.58.2026.11.19.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:12 -0800 (PST)
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
Subject: [PATCH wireless-next 05/10] wifi: cw1200: unregister from mac80211 before freeing the interrupt
Date: Thu, 19 Nov 2026 18:49:57 +0100
Message-ID: <20261119175002.458988-6-arthur@aheymans.xyz>
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

Removing the device unregisters the hardware from mac80211 only after the
bus driver has freed the interrupt and cw1200_core_release() has disabled
the device interrupts. Unregistering removes the interfaces, which sends
WSM commands such as RESET and CONFIGURATION, and their confirmations
then never arrive. Each unbind of an associated device waits for the
command timeout and ends with:

  CMD req (0x0009) stuck in firmware, killing BH
  [BH] Fatal error, exiting.

Add cw1200_core_unregister() and call it from the SDIO and SPI remove
paths while the interrupt still works. The interrupt is still freed
before cw1200_core_release() frees the device, as the handler uses it.

Tested on an Orange Pi Zero (XR819 over SDIO) with both the SDIO and a
GPIO interrupt: repeated unbind and bind while associated no longer
logs the error. The SPI change is build-tested only.

Prepared with Anthropic Claude.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200.h      |  1 +
 drivers/net/wireless/st/cw1200/cw1200_sdio.c |  2 ++
 drivers/net/wireless/st/cw1200/cw1200_spi.c  |  2 ++
 drivers/net/wireless/st/cw1200/main.c        | 13 +++++++++++--
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200.h b/drivers/net/wireless/st/cw1200/cw1200.h
index 48f808cdc1cb..6dc85ef6e0fa 100644
--- a/drivers/net/wireless/st/cw1200/cw1200.h
+++ b/drivers/net/wireless/st/cw1200/cw1200.h
@@ -293,6 +293,7 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 		      struct cw1200_common **pself,
 		      int ref_clk, const u8 *macaddr,
 		      const char *sdd_path, bool have_5ghz);
+void cw1200_core_unregister(struct cw1200_common *self);
 void cw1200_core_release(struct cw1200_common *self);
 
 #define FWLOAD_BLOCK_SIZE (1024)
diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index dda201e69735..4f4bd668ebd2 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -359,6 +359,8 @@ static void cw1200_sdio_disconnect(struct sdio_func *func)
 	struct hwbus_priv *self = sdio_get_drvdata(func);
 
 	if (self) {
+		if (self->core)
+			cw1200_core_unregister(self->core);
 		cw1200_sdio_irq_unsubscribe(self);
 		if (self->core) {
 			cw1200_core_release(self->core);
diff --git a/drivers/net/wireless/st/cw1200/cw1200_spi.c b/drivers/net/wireless/st/cw1200/cw1200_spi.c
index f71e71e06359..c08d1ce5605d 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_spi.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_spi.c
@@ -437,6 +437,8 @@ static void cw1200_spi_disconnect(struct spi_device *func)
 	struct hwbus_priv *self = spi_get_drvdata(func);
 
 	if (self) {
+		if (self->core)
+			cw1200_core_unregister(self->core);
 		cw1200_spi_irq_unsubscribe(self);
 		if (self->core) {
 			cw1200_core_release(self->core);
diff --git a/drivers/net/wireless/st/cw1200/main.c b/drivers/net/wireless/st/cw1200/main.c
index 5d569eeb353f..ee9fcecb0100 100644
--- a/drivers/net/wireless/st/cw1200/main.c
+++ b/drivers/net/wireless/st/cw1200/main.c
@@ -456,8 +456,6 @@ static void cw1200_unregister_common(struct ieee80211_hw *dev)
 	struct cw1200_common *priv = dev->priv;
 	int i;
 
-	ieee80211_unregister_hw(dev);
-
 	timer_delete_sync(&priv->mcast_timeout);
 	cw1200_unregister_bh(priv);
 
@@ -594,6 +592,17 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 }
 EXPORT_SYMBOL_GPL(cw1200_core_probe);
 
+/*
+ * Removing the interfaces sends WSM commands, which need the device
+ * interrupt for their confirmations, so the bus driver calls this before
+ * it frees its interrupt and calls cw1200_core_release().
+ */
+void cw1200_core_unregister(struct cw1200_common *self)
+{
+	ieee80211_unregister_hw(self->hw);
+}
+EXPORT_SYMBOL_GPL(cw1200_core_unregister);
+
 void cw1200_core_release(struct cw1200_common *self)
 {
 	/* Disable device interrupts */
-- 
2.56.0

