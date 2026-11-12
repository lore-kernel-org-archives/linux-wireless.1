Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463583;
	b=c4wkSuOQv+EggMCha8Fs7uBd2sZ89vYuUA1xkjmzqxIMs+wfur3u5WqHQ0sfTRADoenI
	 zXyA8t29w1nOyrUTYb81yiamD2q+un6JFAEiKIPkcr0M5QJCVZfDFl0wIgGWUhcOmmaAu
	 LoWpQ342vfNocc3uR2GnBwO6UOBHFFrgfTjcJ/SgXaMkle8faeJP3Kx7JOx5I8Op3tcI0
	 akiEUfFg0VL+XotBMlaaKmcDfgm/vAVDf4SsOPROa0IlmbgJvcY67sNluR25cBvecFnYf
	 fZJ8j68lanGnxlVnW9bt2Dhk9tF4OivJZclMSfqYXxLZW1tKB+8n1pcCWKP63IZkIDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463583;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=j3pHXRQX4DQvvSIy1DOa/LfQA1QbtmOFWiA3wIJhJtw=;
	b=41CJLMFX0jY7SZqn8jdNyU/6xMZTNmCbBSWgBRowYIv9dAuWhdIRGy5M9c70jgC0nxhp
	 tqmqOcPH2gAqHlrFTAI5aewdz+XiXAXKptuCP1coY/NDOsRPW9wAkc2i5CPn8Vm7GAQQg
	 1MCiVs9GNfCkVAEPWEaBK2pjNlInnVbWKkFv6Wb2mNjF98XVvhrrefCVkY2RxAx8mvMWV
	 VpU/fb1R0h52dEJow+eLn+y1wiNqYzuRuFB/9t+07xrapsNcYe2t+iswBWvo7J+iyBTN6
	 7XCyGoPJXKCA7LgkoOKE607ZzpvU40W66nY0I2DSd6LxFtSk+cHiPpO1TyfT8kuAYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RftmMoKt;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299E606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D299E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RftmMoKt
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66Ke943489119, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463580; bh=j3pHXRQX4DQvvSIy1DOa/LfQA1QbtmOFWiA3wIJhJtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=RftmMoKtAEQkRIVqeBNGS7uvH7F09QxH9ieGFkrxKyoo0JlUrDX45GL/fUSksxfqV
	 l0z9oePtl5NI1iBkPwLQUKYVw6/5tI6xgKTiJgmCAhlaTIz01BZDvC8j+bj/nXHpPB
	 OEvKeWMO9Uov9P++wCyHQ2MtYBf4pZ0IZgHP4Y9dw9PUQY0NdpPBmf92jjCNtweQl+
	 wbKYcOZmMr6RR+Spqr6u+cFyNUfhNVKIGKgCpzsrYeYfMM2/v3k//o+VOpe2qHnhOG
	 eENSndnYifA+I4sqa71DdJrYAS6VEkEm695nbQM8D/SwTYRKE3xy0FeCxBehz8EZNw
	 K6/nIyy+ceaYw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66Ke943489119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:20 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 02/11] wifi: rtw89: pci: reclaim TXBD before fully draining
Date: Thu, 12 Nov 2026 14:05:51 +0800
Message-ID: <20261112060600.71784-3-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112060600.71784-1-pkshih@realtek.com>
References: <20261112060600.71784-1-pkshih@realtek.com>
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

From: Kuan-Chung Chen <damon.chen@realtek.com>

Currently, we reclaim TXBD only when the available resource is 0.
When two ACs share the same DMA channel, the lower-priority AC
occupies the whole channel, which affects the higher-priority
AC's throughput.

Add RTW89_PCI_TXBD_RECLAIM_TH to reclaim early once the
available resource falls below it, improving TX
fairness between ACs sharing a DMA channel.

Signed-off-by: Kuan-Chung Chen <damon.chen@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/pci.c | 4 ++--
 drivers/net/wireless/realtek/rtw89/pci.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 6d19e759fc0d..76523d057825 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -1281,7 +1281,7 @@ static u32 __rtw89_pci_check_and_reclaim_tx_resource(struct rtw89_dev *rtwdev,
 	bd_cnt = rtw89_pci_get_avail_txbd_num(tx_ring);
 	wd_cnt = wd_ring->curr_num;
 
-	if (wd_cnt == 0 || bd_cnt == 0) {
+	if (wd_cnt == 0 || bd_cnt < RTW89_PCI_TXBD_RECLAIM_TH) {
 		cnt = rtw89_pci_rxbd_recalc(rtwdev, rx_ring);
 		if (cnt)
 			rtw89_pci_release_tx(rtwdev, rx_ring, cnt);
@@ -1289,7 +1289,7 @@ static u32 __rtw89_pci_check_and_reclaim_tx_resource(struct rtw89_dev *rtwdev,
 			goto out_unlock;
 
 		bd_cnt = rtw89_pci_get_avail_txbd_num(tx_ring);
-		if (bd_cnt == 0)
+		if (bd_cnt < RTW89_PCI_TXBD_RECLAIM_TH)
 			rtw89_pci_reclaim_txbd(rtwdev, tx_ring);
 	}
 
diff --git a/drivers/net/wireless/realtek/rtw89/pci.h b/drivers/net/wireless/realtek/rtw89/pci.h
index 0f9ea4bf54ea..3cc484bc1ca8 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.h
+++ b/drivers/net/wireless/realtek/rtw89/pci.h
@@ -1120,6 +1120,7 @@
 #define B_BE_MAX_TAG_NUM_MASK GENMASK(3, 0)
 
 #define RTW89_PCI_TXBD_NUM_MAX		256
+#define RTW89_PCI_TXBD_RECLAIM_TH	(RTW89_PCI_TXBD_NUM_MAX >> 1)
 #define RTW89_PCI_RXBD_NUM_MAX		256
 #define RTW89_PCI_TXWD_NUM_MAX		512
 #define RTW89_PCI_TXWD_PAGE_SIZE	128
-- 
2.53.0

