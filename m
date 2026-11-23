Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441296;
	b=QOCPuSddHj51A7+IT4+HpFy6h3QnJoHSm8TpS0NKZAmJeXOTpUinLzTGOU7ync00vLgk
	 G4jryMMoEcGD4qh7mdBDEL5KouzjTfybTgnfrKRzgUOTEDOnb5ibjkkhnYPJIM4Rpn0nZ
	 qvHDE9ppG2lgwgkLQkw5nXkwHIi3OPXZ/lQKd9pmvLHJJG/rPtjqouVhFnbAgNlxIhyDD
	 v3SK7TE8SvnOTPnsIXKk3TKdwlRXIW+dMjLa/rpkKbA4BiN4Rnjo199ML4KMY/W8Q06ZV
	 eAtxlXpBAt6qGk2FJEWevTRWzUPSQRa1CYniqmtYCyCxcFeFctLJys938vxiexsKETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=Ay1L+FYMTI7HGMKuXjbygThQxB2EdrvQ0AtkOKJscYU=;
	b=wMo7p26fZTsP17zWlaI8sKkX5ybarkPN+Eh25MY+yG12mTgDKDCMISP8Mfu3JtwB8nZg
	 r5gwAhTafhF+EICTDzm0lQx1JbrvM1XUAyK4Y4vnMR5Y2scD4v+8BM/9Pm0v0tKu3Q4tp
	 T6OXrNgTWkfAbY3m5CX/Est+mZ7LBVrrc4ZDjRX45DEJzi+ZS2K8pTRALoGkEHb40PTBg
	 DIVXjKlidVjj3dJ7HlJOg5tB9Co1wZf+Wh3m1UM4EKGSeb72ZwUeFoYzMtA+X0RhFQbQ6
	 +wLOv+phoRxrtpAE5wbqvJ9ErYkXXz93H/rxHaiAjtPd/l2EfqNJI7KPKzUiuNkfdeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=TP6bAKaY;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E360A3818;
	Mon, 23 Nov 2026 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703E360A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=TP6bAKaY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441296; x=1826977296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w8N5AFoWQMMdzwaV+j3MmtZn18lre8Pl/IetgOAxtJ8=;
  b=TP6bAKaYqqs1wtl3NVM+NHoti+ybHutkxQ8Bfcvqafw0MJ+mou22VWoc
   poytai4mRz+JjqFsa0gQlxwnzkk9+APlkOYdOuytWE/BX/zypEFJ53/ea
   fk45nT2ztgzklnqJxMrV2mrCv4+BbFxIqzmJZK6qiwK1ZbTbyUPNqgtm4
   YRqkgM3U3WEyhpjUSEN4/j91Mlw7RgrEwDFAMAMssL15BPprzYOGL5+rA
   0BDCz8qv/NdRNjeYLSdz87+LWz3eOci3/7ISxivltRa0YM2eXUhimhqyt
   5qbIYg7sqDEiRp9CWzOrIxIyws39FwW7GVrMA6jrqX0MEfAWYBltUc1bf
   w==;
X-CSE-ConnectionGUID: dqhawuA0RnqsqIKTscc9TA==
X-CSE-MsgGUID: JalPVXxBQc2T7TNScctHpw==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154924"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:41:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:41:35 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:34 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 4/6] wifi: wilc1000: Use device-specific error logging
Date: Mon, 23 Nov 2026 15:41:18 +0200
Message-ID: <20261123134120.32638-5-mihai.sain@microchip.com>
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

Use dev_err() instead of pr_err() when reporting a failure to
retrieve the MAC address from the chip.

This associates the error message with the SDIO device, making
it easier to identify the source of the error in kernel logs.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/net/wireless/microchip/wilc1000/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/sdio.c b/drivers/net/wireless/microchip/wilc1000/sdio.c
index 67dea1360f0a..a328e1b6f5de 100644
--- a/drivers/net/wireless/microchip/wilc1000/sdio.c
+++ b/drivers/net/wireless/microchip/wilc1000/sdio.c
@@ -192,7 +192,7 @@ static int wilc_sdio_probe(struct sdio_func *func,
 
 	ret = wilc_load_mac_from_nv(wilc);
 	if (ret) {
-		pr_err("Can not retrieve MAC address from chip\n");
+		dev_err(&func->dev, "Can not retrieve MAC address from chip\n");
 		goto unregister_wiphy;
 	}
 
-- 
2.56.1

