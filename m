Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420729;
	b=kkMniREHNlycpQb13jMTgVNqkIBCHQCzPjhtskRzBnNFogmyq3Z2qeabelggGWD2I6wb
	 pkrnpIcD0VEBFMUS7tyB0xlixFzvVSIfVuWgC1X+E0D2WQa2xA6hajGewvxlv0U7oEtp+
	 Lu1jqSts3qf/41TysOV+HKi6gFRcD6LDbd7BU74LEc5iZaKRKF6StrNR2NK41PIzzQ9dW
	 ic+q3doq/gzzd8bdncEYsxpX/KX1cggszsYRuKiRs9Z4dXkD8wMcihjtw7s8uoAX+ZMx7
	 pS1EAyV1ns5O8jaGsR/q0boyF5Hwf64QzKm2fp3WhJc4o/0FAFk2ZiR5M0QIDIS1/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420729;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+PKSLk5Q2nulvWMfoxlate25vMEeh2vlna9T9mNiqZo=;
	b=EBhgEfvWN6N7A7nLxh1NYYGOEoFGaHCi1dWnjA04eYoNaS49cJ+5KBuKE9ZPe7N0PMAC
	 s0HR+N1uIL5MitXaxfXhMwUMQvpp4TlAlQPKkppXMY/zXh+BnyryNEkHgif09w9kejUTO
	 GHrPsoO9w7O6Des5syMD7mRs4I5w+HVqfha6HOeQdGPuBE91NdSIAqEFudphEB02sP/AM
	 sEqQ8UMszlwpXsmVuQcgckI/Rp+jMbby0WCTwEp3oxtv1hQzPCTuj7TuPcC8TLG3cviUZ
	 xdSjkO/3Z4+ErCJ4BKyIKBu6MliDa5yj0CAveGo9y6Ry2wmyavN0NJRGH+1sXmQeuIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="N/RAKkL7";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF5606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=N/RAKkL7
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN7wZV311447987, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795420715; bh=+PKSLk5Q2nulvWMfoxlate25vMEeh2vlna9T9mNiqZo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=N/RAKkL7my6C36PABh6oCIX4jkKj0Fo3U4P+HFu+olqS1h9m/M3H3m7eHwsEPO4Z/
	 VE+OT9ddAqYM3jTQ73UbfiM9YzaIvSxOY6YUt4i5LELC0FozXtL3d/zLgDnngYK5kI
	 tdQCCpeqTr0clZJnkkzXB2/d5rOvKG6iQD7YXJPI5xA+22sj7ifASJqlkqxyarCIcL
	 xhkI5WyIET2e81vaF1vQHhTnBHMXdYiwsPw1b2QoLAb/Iq0/O/rSPWVI2WdIabZ/TL
	 nKSCe6ttho/tBmeUiLTy3Up+hVomyFsNVdA2jGcctqT7O93pIhrVTGY7PWye+hbDTQ
	 /bKwsKnFzEZYw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN7wZV311447987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 15:58:35 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:58:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:58:34 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 15:58:34 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <rik@ellarik.com>
Subject: [PATCH rtw-net] wifi: rtw89: pci: disable D3cold on ASUS Vivobook 14 X1404MA
Date: Mon, 23 Nov 2026 15:58:16 +0800
Message-ID: <20261123075816.25606-1-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
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

With D3cold, RTL8851BE failed to resume on ASUS Vivobook 14 X1404MA:

  rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=0xB48
  rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=0xB48
  rtw89_8851be 0000:01:00.0: failed to read PCI cap, ret=134
  rtw89_8851be 0000:01:00.0: loaded firmware rtw89/rtw8851b_fw.bin
  rtw89_8851be 0000:01:00.0: xtal si not ready(R): offset=41
  rtw89_8851be 0000:01:00.0: xtal si not ready(W): offset=90 val=10 mask=10
  rtw89_8851be 0000:01:00.0: failed to power on
  rtw89_8851be 0000:01:00.0: failed to setup chip information
  rtw89_8851be 0000:01:00.0: probe with driver rtw89_8851be failed with error -110

Add an entry to disable D3cold.

Reported-by: Rik van Westendorp <rik@ellarik.com>
Closes: https://lore.kernel.org/linux-wireless/7e47e43141ace3e769a30653b84228444e8235aa.camel@ellarik.com/T/#t
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 76523d057825..323897674b8d 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -4798,6 +4798,13 @@ static void rtw89_pci_d3cold_quirks(struct rtw89_dev *rtwdev, struct pci_dev *pd
 				DMI_MATCH(DMI_BOARD_NAME, "P3606CMA"),
 			},
 		},
+		{
+			.ident = "ASUS Vivobook 14 X1404MA",
+			.matches = {
+				DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
+				DMI_MATCH(DMI_BOARD_NAME, "X1404MA"),
+			},
+		},
 		{},
 	};
 	const struct dmi_system_id *match;

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.53.0

