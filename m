Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441298;
	b=hAuVQDpvflXySi+P2zpXuEEi5CmLTheLU1/c+nQ5EsJDQepSCBWMJIS3g/Yfwx9aOf0X
	 mjAfNydoto+ua9OEXNX1+Vjb+HR8Tk+SRI6UrV8qtK7rB1Gk5TheWuhIFwSFVi2TTqoz8
	 fXgdyRsSCcAZl7YF7aJkDxH3akHsTSiyK0iOESlatYXFL6YhpeGZ6ogFH1BMPymXvMKBn
	 PAovmgfQhbzEihEUV/qUZVYhMn5EuzuF3DNjXGcI5zCVAINZzvS53ljhSao3e46DjhkeJ
	 +Tbw/V52bVUuBimdKzCcNGhC1v9bFsCq04vZ6A2V/FMhmPGAAEJupTWjDmZC4tWMCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=p4G8h+Ao8TWudJx/7hKNwdYMx/h8ZW2EBjqt2QmYs8s=;
	b=uMnfdEiRw3WxVGqycUwNW+oaSZVq2Wi61GdOcknqZRRJsQXGw6vL3S3Sr1Ju6S4QhigQ
	 cY6bMH1YZ/VhbD9FNAc5NY1X+ERWnr+cMR5GeFaLruq1Kz5YxrNV7w4n/4raq2GA4LWeJ
	 u4vsS2rGUXjWlKn/cyj/Moa3qmw1CEhRmXSA7Z9ex0JIHC86EAMYwj8HPFBQzfRDy9tWw
	 H5w+rZoAKvytIwlAg/2aNCPsJ4VdkJVkScTSmeZFxfBk9XiCtgLAcRG6QX3LMK4vyLobL
	 7JcJ5Urw9CcNZKrYfisxFXZslnNbUAXPpYXYC3AlQC1cdW7GXLTMnFIzPdJwLIPJEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="0V7U/ui/";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE6F606A6B2;
	Mon, 23 Nov 2026 13:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE6F606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0V7U/ui/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441297; x=1826977297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ooGY6TEmCp3JKFZxcH1rrstK5NvsNxPJBRW1gzfJvnU=;
  b=0V7U/ui/TBxYDL1jJdw/a7af1oZguktQiGRYFy6m0BAwSGAx3yvAGET0
   m+4iLMAIIQl0JvMUTsfOe57h246+q8d95uACbS5C2YCsdeVWUybjYjEDJ
   SWfaXOYrbjDBfgcsIM30CJJQxnd5SIqjDqnXWFnJn4IG9GvkNc7rbQsXW
   9SW+kZ7+rkMAA0yOWjxRyIcQmjHmPKhEQ88VOAdlHLQVpJfB2uFfXDGx2
   7WnIYKExBWmHY0JF28rs8DkGR6ZUtTjHGOSbzOVw9Neco9wbb0E2sd2p/
   hUDi72Oo8coyKe/Bu3h54ixMHMH9NRrJWHEYZAPVoP4OvYNok3s1IjzDd
   A==;
X-CSE-ConnectionGUID: 2ug1FVlyQwuTIkS+QBY9gw==
X-CSE-MsgGUID: onOGKgJJQgiK+i5RhYTGzg==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="233970295"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:41:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Mon, 23 Nov 2026 06:41:37 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:36 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 5/6] wifi: wilc1000: Use device-specific error logging for MAC address retrieval failure
Date: Mon, 23 Nov 2026 15:41:19 +0200
Message-ID: <20261123134120.32638-6-mihai.sain@microchip.com>
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

Replace pr_err() with dev_err() in wilc_bus_probe() to associate the MAC address
retrieval error with the SPI device, providing more context in kernel logs.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/net/wireless/microchip/wilc1000/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/spi.c b/drivers/net/wireless/microchip/wilc1000/spi.c
index e40b829f719d..4408edd61d68 100644
--- a/drivers/net/wireless/microchip/wilc1000/spi.c
+++ b/drivers/net/wireless/microchip/wilc1000/spi.c
@@ -255,7 +255,7 @@ static int wilc_bus_probe(struct spi_device *spi)
 
 	ret = wilc_load_mac_from_nv(wilc);
 	if (ret) {
-		pr_err("Can not retrieve MAC address from chip\n");
+		dev_err(&spi->dev, "Can not retrieve MAC address from chip\n");
 		goto unregister_wiphy;
 	}
 
-- 
2.56.1

