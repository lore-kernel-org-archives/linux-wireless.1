Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441291;
	b=nKEgRUpZ1XeQtv0ajzdElIyCsQH1sUOg+X7d8p1s7O4nawGSOKsFs2hWr/SiD9vG4c6H
	 JAoCopw/yNBlrMsyuTTyHafmZEV7XADj5v33uPY88WBnjT7EvugkuLecEEWehq0uJE/KH
	 GOiaAZe2ZohM2tJjrDqOZD68w923oFcaXs7evb3ByGGlHOHZtkKEJtTiw5WpsGX6VZLML
	 Wnfb+FlGR9vMuW3WPjC+QhYGenpmfRbGF1DTGGnWhAD86+F41pY2G9M9MmpaGSIzRazla
	 yP43xT5i6+NW56PkHlAoxMqIk6oDVdJuHpxgTFbnJMsTGfe8FjaQR7OLi6UFKZFUnsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=iWanZeU7LTm51pxByej/4aVWIB/4zgNtfe8FZR7mzdY=;
	b=jAEDnCgFVqqTqfJPqqkbCdTp9cgxlN738wpHaZEuXUxFAk8PpGveP6B1XJaH6u+aUbyR
	 mj3Yld49MfNnrrvNJVmxKmXlOAEjCLyi3tyTpvYEufmEAVWy5zWWYe2siznPCPHBQ9Mn2
	 wbPRdN4iGjg04VDtGUjCWG1qMIXt6W/ZMuG0QhsjMsKALdCxPl1YakTDOT+hIwqDa3Ced
	 9J2ir+9/uNmkwODGbYs8aZD9T7MLip3O1r1FLnyUC78KTKSKal2QjR2oaKi6B7XgirEUH
	 AyGyQy/c/cKS2Pq9raSLGerZB+cXb9zs7TxkhqdQxRJJcu3z9mYcn9TY4BPiQBcb+hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=wpMXUfnO;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F8606A695;
	Mon, 23 Nov 2026 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40F8606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=wpMXUfnO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441290; x=1826977290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eVpxiM74E0jv/ba3E36gcvCjexfRk4yunfnT9TJgCrU=;
  b=wpMXUfnOXP6sixbNjioME/K581EdY3Xa/GRNcWMSacRGLD+wNTJTsDAl
   8CO8A/FA9FHI3js9Ohl/NUIYOkZGCMTRbT+tyKwU9aI+MPOneUuppPABn
   /l07deSwcza82uKfFR6vHAJ1TuPEUF1uz1eyESqqbODUSV2r/NzED4ETu
   gDdEhfPomw8lrpenXHFig3fFIeut/nEQ1I2Myxl01gUOzMQP44/Udx3r/
   /VZOQhO5ZzUs8dQEuNo8wJUgLwm+AxzFAcicL9Q7SpgeU51IYwB8iuZix
   E0aj0CB6Jbps2OBz3dxeGmhX/xOQnn0w6711hMZhRtKyfeJPZL80KAUuU
   Q==;
X-CSE-ConnectionGUID: cqkpM756Tjym68nEXjVYXQ==
X-CSE-MsgGUID: QE02FaWIRE+ohC89YWUu1Q==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="233970283"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:41:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:41:29 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:28 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 0/6] wifi: wilc1000: Improve error logging
Date: Mon, 23 Nov 2026 15:41:14 +0200
Message-ID: <20261123134120.32638-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
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

This patch series improves error logging in the wilc1000 driver by replacing generic
logging calls with device-specific logging helpers.

This makes error messages more informative and easier to identify when debugging issues,
while improving consistency with kernel logging conventions.

Mihai Sain (6):
  wifi: wilc1000: Use netdev_err() for WoWLAN trigger errors
  wifi: wilc1000: Use wiphy_err() for interface limit error
  wifi: wilc1000: Use device-specific logging for interrupt errors
  wifi: wilc1000: Use device-specific error logging
  wifi: wilc1000: Use device-specific error logging for MAC address retrieval failure
  wifi: wilc1000: Use device-specific logging

 .../wireless/microchip/wilc1000/cfg80211.c    |  2 +-
 drivers/net/wireless/microchip/wilc1000/hif.c |  2 +-
 .../net/wireless/microchip/wilc1000/netdev.c  |  4 ++--
 .../net/wireless/microchip/wilc1000/sdio.c    |  2 +-
 drivers/net/wireless/microchip/wilc1000/spi.c |  2 +-
 .../net/wireless/microchip/wilc1000/wlan.c    | 20 ++++++++++---------
 6 files changed, 17 insertions(+), 15 deletions(-)


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.56.1

