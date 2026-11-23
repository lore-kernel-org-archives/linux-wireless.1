Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441294;
	b=fi9wBtX+oZTs0cE9LiQO09wMgbS12+RuU4JbwFys7wINRDxsZsiPY79hYACEjVZu7v21
	 sVe8x/wKSKjFcq26bFGBRJ4XezgvLHKWJEtxCJDI9aHXOAfjUILl3mI8jdRQ97tqiQ78z
	 kwciMepQIGjcdmFaKLWtF2p+7t4m4eoEqVkb/3LIL46MAU5KIal6DuOrFOTMHu3mEsoDq
	 Rs3bW/Qh1cvAF7XnigxcaTbKXHZA/UsDJneXsbyJsisWTxJWOF36jaRL9wAU1HUPU5XFJ
	 dGWRqc/J78m+oBmPGO4sHuvRqCuCG3wbPHf0enTlEqpRJN6AaVBNowzqOBM5gE2jhkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=pdnfcq5RI1JqTvZbBG490/RGDC68ZzHIR3Joh7aJQ1w=;
	b=tW2tD2TdoPZeRP/LFCx1GZ3yQktADO2HeXIvjP8wigPEn6s8zVMTc5efe8BXG0tSiu/Y
	 EHHuen/cFASFX1/7vibsJLnW+5yrk+08ltp7D04/q6WUGoGas8cZmZfaIq9M9xAMfsKXU
	 FipNTMRIt+fOCnLwzDihwEbC9h6yiQ2KHOrvBQpdiZ+YjwGUj6s4XdYZz15Yty7Vrm0qt
	 /b58ppb6I2rgwIIHqxs6AFvi+py3a21N7XT5lQyd+ml54mfFRycZEYBUX6812F7SYQjWd
	 kKR3LkxA1Ix+OV7U5Yubj6JoiOxGsBQCNbBc00E2I4QbaqcUCWkEdvQvcoKNebBhRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=WmDlpJAj;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243C606A6A7;
	Mon, 23 Nov 2026 13:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7243C606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=WmDlpJAj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441293; x=1826977293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WGjy/xn7xEUUcyeN3JMHQROL32dDt0oK/oU6xAh8qJw=;
  b=WmDlpJAj+TkaWfye/6OcaWL2dALB/TqRrbX25l/lzbCRlYheOScthKh8
   6vW22Hp6b7PJEQNK6YW9PCyxxhxr0/YswpIuixQyl/y4lo3fGtM32j9Wk
   L8fjzohKPMK5rsTv1cAY4zRiQG+yq5myJZNkt3hqUQ4x01kvJWVSP/OM1
   RcLsBmVKwt8QlvONiwlckY59RJKjG9/OEf9ZlMBlEBxIxR5QSxjG074VC
   oCGgpVxK9TonPUL4UbZV/CiUVNjjH/TmVomebdjHOWp3IUQANAcIT6m+K
   MukDtsr21qMZdoF40MBEQn7Lv8WkuvbicmrkI2yEAF3cHpLq/Bu80hFBK
   g==;
X-CSE-ConnectionGUID: ahilTgDtRKuto0Mg0lZgag==
X-CSE-MsgGUID: lLO9uKWGTKyZMErUL8WkyA==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="233970289"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:41:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:41:32 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:31 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 2/6] wifi: wilc1000: Use wiphy_err() for interface limit error
Date: Mon, 23 Nov 2026 15:41:16 +0200
Message-ID: <20261123134120.32638-3-mihai.sain@microchip.com>
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

Use wiphy_err() instead of pr_err() when the maximum number of
concurrent interfaces is reached.

This adds wireless PHY device context to the error message,
making it easier to identify the device that triggered the error.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 3db290875ff4..429889a2f5ed 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1577,7 +1577,7 @@ static struct wireless_dev *add_virtual_intf(struct wiphy *wiphy,
 validate_interface:
 	mutex_lock(&wl->vif_mutex);
 	if (wl->vif_num == WILC_NUM_CONCURRENT_IFC) {
-		pr_err("Reached maximum number of interface\n");
+		wiphy_err(wiphy, "Reached maximum number of interface\n");
 		mutex_unlock(&wl->vif_mutex);
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.56.1

