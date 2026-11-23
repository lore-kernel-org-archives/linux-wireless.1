Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441295;
	b=V5r7PqYuiZEaUNuqplriYEHF/i9ybmV31/0C5n10T+nGM0VFNdq1JFLGTP4IjOqbNHK8
	 TbGBQI6z8MDhiNQKj0N5euG3u7VJAwFy9iaKRUQidbaEFE1/jUHvY7kN7oge92Fwoo7N4
	 cgxjgvxyoR/iSUTk5e6aupd4DAo/QPgKxXj9hkoklKVZNb0h5nN+5Fpb0gqyKbXYp6G06
	 8ThGfG4/kNxcRxMXqAJ7U0SkoM8J2/Sz4GBZCRW/4xWox3jJ66vPL3VAVp1156Z8t6n95
	 rtB5iavfuQd/9RN4C1nqPcGDFz80j/3vao37ZiZGx6IM1ja58PFaOZXbeKHoytHslEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441295;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=ZjB1nnaDs9zw/csA1PZ9Ywdgt4IZ46uL8pOCZfeYnw4=;
	b=rCJXR/c6XZFjrw1lMtObk2Oi/JSqKl9HHXMrq6njtGdmE75kU4yoFNXgNqKN4uY4ccTw
	 TstBoxrD8b+TaMn4HqCcYU0Hw8EcJnvYaQ+YFR1gCfNq4Ey+7bSjfYDn/do0CEperciCy
	 TSCg2+S1i4H/SLmnCxduNSMj23+mlXBKjfK8POWaiCD4AceQ1qyBBI+ZHmIvYDVtaISgI
	 bH/fFn5oflvvRx5gVmDH/OVcQ3oDYqHGuHQDvbpNEWOF5jURkZUprzZ7Vg4T0ZSX89hQn
	 9TD7MKMjxUO3HBwIvf0Y54muyzx9AXpf265nqvMOD6rUiMmFWjTxn8w3b/6x7C7hxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PEQaCvDB;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0660A380E;
	Mon, 23 Nov 2026 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D0660A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PEQaCvDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441295; x=1826977295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AJ+fgqHDz/Ez9ol54ZpOYl/VwdWxR7uamUyABk5XlZY=;
  b=PEQaCvDBUSdLg8ZD2BeWYmy/cMcbvbAZ0PWloG2F1zUjOuLq4hhByxx8
   hmjkha67KarzCInoAqijgbu1mRfzbVcMcUlQ+9MBGxpFtDQtGfD9gfWNt
   k1YFLDr5CmoLPicSw6NPIHfGCuPsDAQeHPvoE9/zN8hkcxmSjrmKvj2BO
   EMXzcN1bKIpgy3I+k2p7eHiiK9VjLdn86d6IM+8FhzmrEr4umIRXnPet3
   vPJAGVBCkl4xn8k4FA3gxwT/9SZWFLCQRng/CI96AOxVcw7l2NZjZYlw2
   9pyxKSvVoxF2u2cylSDDzZhFlyXlx9YflgXxyfIaa6zYGcGumls3ELkk9
   Q==;
X-CSE-ConnectionGUID: 1r/P+/j1QH2Ef+w1dfxrXw==
X-CSE-MsgGUID: i+OMiUPBSl2BP1UZ/BEdMg==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154922"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:41:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Mon, 23 Nov 2026 06:41:34 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:33 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 3/6] wifi: wilc1000: Use device-specific logging for interrupt errors
Date: Mon, 23 Nov 2026 15:41:17 +0200
Message-ID: <20261123134120.32638-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123134120.32638-1-mihai.sain@microchip.com>
References: <20261123134120.32638-1-mihai.sain@microchip.com>
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
Content-Type: text/plain

Replace pr_err() with dev_err() in the upper-half and bottom-half
interrupt handlers to associate error messages with the WILC device.

This provides more contextual and consistent device-specific logging
when an interrupt occurs while the device is closing.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/net/wireless/microchip/wilc1000/netdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/netdev.c b/drivers/net/wireless/microchip/wilc1000/netdev.c
index d3343113cea5..7cdb41ac5eb0 100644
--- a/drivers/net/wireless/microchip/wilc1000/netdev.c
+++ b/drivers/net/wireless/microchip/wilc1000/netdev.c
@@ -34,7 +34,7 @@ static irqreturn_t isr_uh_routine(int irq, void *user_data)
 	struct wilc *wilc = user_data;
 
 	if (wilc->close) {
-		pr_err("Can't handle UH interrupt\n");
+		dev_err(wilc->dev, "Can't handle UH interrupt\n");
 		return IRQ_HANDLED;
 	}
 	return IRQ_WAKE_THREAD;
@@ -45,7 +45,7 @@ static irqreturn_t isr_bh_routine(int irq, void *userdata)
 	struct wilc *wilc = userdata;
 
 	if (wilc->close) {
-		pr_err("Can't handle BH interrupt\n");
+		dev_err(wilc->dev, "Can't handle BH interrupt\n");
 		return IRQ_HANDLED;
 	}
 
-- 
2.56.1

