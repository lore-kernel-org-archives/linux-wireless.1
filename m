Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441299;
	b=bzb2gPCYoerYGy+a0GsV8i5aZ1y0IrqjR61F55p0BjdzEzuJkDWH5CwRVhNiMpf3PuN3
	 eEN1SioPiD1lQo6TJ6VxlqAFXah/B5VA6nWObk2CqcCZL3JDVpJVgCRvXKN8CyJ05De6f
	 bmcIZgxQR6nEEw6quZW02FNT1waYD8MzjDk1wP7LNpNNaMUpG+x2dspw5nGDXiS7LdzEn
	 cGgIxs1rj/xpYs4coC0cAlax9wZnJSLj6zmySxAqmnmdmeXOYy/XoBj6kGZIrufb1eogB
	 19dIBhDOKan6AhDkKoP1Mu21BPilDw23APJW48cPIHX1Tkc7j5EACAJS7Pfnpgu5JZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441299;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=/cah87Z4kqglg4dfXyO+CgPymxj7c6KJmaPWvkdbPDQ=;
	b=EbORkB5QB9C9m4oLPv+afzddmDaTjAwgHxnrUJoTI531M9sPDzp94zvT47bCd5fsVh9Q
	 zqkY2qHZ90jbFIdnWcgfPvRLzhyU9g911Vozc9AG4bdgApVYRkeXZWV0cfqlI8f3ecOKp
	 BZvxD78DbOazHoIvZ825Z0aPzXJ1ed/JFprg3dEvZlQN3xa9zLRN8w5rKt0+Ze7+SWHi9
	 MT3tBVeu0tHUb7Y7FGBfLYjdYmfzYBFnHwgsoJLlKfLdfgPTiiZdKE0gDDWt0NlXYr84b
	 axylSTlxdr51+/YtIShmhtnHey8RN1qI2PhlBzxwTZIeZSIpyKEh2nQVuseU7YZPD5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DScV9fhS;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455360A382C;
	Mon, 23 Nov 2026 13:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4455360A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DScV9fhS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441299; x=1826977299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LxQK2Pm76f0RnuIQKNm2WwankdlCxtp+5VQvrqgG30E=;
  b=DScV9fhSpfQZ933xGMHDGz4VLOeYLtxOXG04AkszH3T7vUEE9EUKAPlz
   vJ904g4tQhiSQcsX7EebntnuB+C+A8mzxSWBeuI7buHSkSnOF3o1zzbZQ
   Ld6QI5jy645ChIG7ucnlKO8qvEIQPNMLGhW2eXggYZ/e/ulM3Ri/3wtB9
   2wMcnqT6pkmr84EJgfqJ2Quo228goSF3ffbDT9v5/0fYi6JpiRHi8WZGS
   AXTolkDQB1GCk7NQbfRLNgKlUpwtOBMtrcc/F1yrHQew4xP9H7WSQKi24
   KsCfPVlGeUBA7iO1hvMWn0JDYHGgRmmWXDt8sN+L8Fk5w4FHbC9E2C2RO
   Q==;
X-CSE-ConnectionGUID: a+tnRi4mT62f3SzButXYcQ==
X-CSE-MsgGUID: MQ9Pxt0ZTe65CNu9BV4dKg==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154928"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:41:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:41:38 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:37 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 6/6] wifi: wilc1000: Use device-specific logging
Date: Mon, 23 Nov 2026 15:41:20 +0200
Message-ID: <20261123134120.32638-7-mihai.sain@microchip.com>
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

Replace pr_err(), pr_warn() and pr_debug() with their
device-specific counterparts dev_err(), dev_warn() and
dev_dbg().

This ensures that log messages are associated with the
corresponding device, making debugging easier, especially
when multiple devices are present.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../net/wireless/microchip/wilc1000/wlan.c    | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net/wireless/microchip/wilc1000/wlan.c
index 55a77a2e3288..2aece4ec1a33 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.c
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
@@ -575,7 +575,7 @@ static int chip_allow_sleep_wilc1000(struct wilc *wilc)
 			break;
 	}
 	if (!trials)
-		pr_warn("FW not responding\n");
+		dev_warn(wilc->dev, "FW not responding\n");
 
 	/* Clear bit 1 */
 	ret = hif_func->hif_read_reg(wilc, wakeup_reg, &reg);
@@ -676,7 +676,8 @@ static int chip_wakeup_wilc1000(struct wilc *wilc)
 		ret = hif_func->hif_read_reg(wilc, clk_status_reg,
 					     &clk_status_val);
 		if (ret) {
-			pr_err("Bus error %d %x\n", ret, clk_status_val);
+			dev_err(wilc->dev, "Bus error %d %x\n", ret,
+				clk_status_val);
 			return ret;
 		}
 		if (clk_status_val & clk_status_bit)
@@ -685,7 +686,7 @@ static int chip_wakeup_wilc1000(struct wilc *wilc)
 		trials++;
 	}
 	if (trials >= WAKE_UP_TRIAL_RETRY) {
-		pr_err("Failed to wake-up the chip\n");
+		dev_err(wilc->dev, "Failed to wake-up the chip\n");
 		return -ETIMEDOUT;
 	}
 	/* Sometimes spi fail to read clock regs after reading
@@ -1270,7 +1271,8 @@ int wilc_wlan_firmware_download(struct wilc *wilc, const u8 *buffer,
 		return -EIO;
 
 	offset = 0;
-	pr_debug("%s: Downloading firmware size = %d\n", __func__, buffer_size);
+	dev_dbg(wilc->dev, "%s: Downloading firmware size = %d\n", __func__,
+		buffer_size);
 
 	ret = acquire_bus(wilc, WILC_BUS_ACQUIRE_AND_WAKEUP);
 	if (ret)
@@ -1281,7 +1283,7 @@ int wilc_wlan_firmware_download(struct wilc *wilc, const u8 *buffer,
 	ret = wilc->hif_func->hif_write_reg(wilc, WILC_GLB_RESET_0, reg);
 	wilc->hif_func->hif_read_reg(wilc, WILC_GLB_RESET_0, &reg);
 	if (reg & BIT(10))
-		pr_err("%s: Failed to reset\n", __func__);
+		dev_err(wilc->dev, "%s: Failed to reset\n", __func__);
 
 	ret = release_bus(wilc, WILC_BUS_RELEASE_ONLY);
 	if (ret)
@@ -1313,10 +1315,10 @@ int wilc_wlan_firmware_download(struct wilc *wilc, const u8 *buffer,
 			ret = rv;
 
 		if (ret) {
-			pr_err("%s Bus error\n", __func__);
+			dev_err(wilc->dev, "%s Bus error\n", __func__);
 			goto fail;
 		}
-		pr_debug("%s Offset = %d\n", __func__, offset);
+		dev_dbg(wilc->dev, "%s Offset = %d\n", __func__, offset);
 	} while (offset < buffer_size);
 
 fail:
@@ -1711,14 +1713,14 @@ int wilc_load_mac_from_nv(struct wilc *wl)
 						 WILC_NVMEM_BANK_BASE + bank_offset,
 						 &reg1);
 		if (ret) {
-			pr_err("Can not read address %d lower part", i);
+			dev_err(wl->dev, "Can not read address %d lower part", i);
 			break;
 		}
 		ret = wl->hif_func->hif_read_reg(wl,
 						 WILC_NVMEM_BANK_BASE + bank_offset + 4,
 						 &reg2);
 		if (ret) {
-			pr_err("Can not read address %d upper part", i);
+			dev_err(wl->dev, "Can not read address %d upper part", i);
 			break;
 		}
 
-- 
2.56.1

