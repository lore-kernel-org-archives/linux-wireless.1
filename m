Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463637;
	b=rFQ/D+QqGmdVTagO8vpgXUOawr0R512o9d7AbXCODZuIEE7LaQF6DmzRFRxIciob/Jpn
	 UAEqf1bJDXScCsUUTZ3ewXy/4eU2gGv82er81KOYnNwSQqaGWtOr7siZ57notBUTb20xW
	 TF7wxGdmkRJNlj7ShicPS/HdGeCjCzmaSnBHSgVCwk6pJlhoRVCvAacLxI0bSR7t0A2yT
	 nWqDSSUzpuaUSckDM64422DrBGNzr9pt6153bAUJR8RYNjbOZSwNZcmQ9y5jQavt0zWi0
	 fiLxjs3/ZZRPUmZxQLLKE2BSV0Luz1twn/BgXc1RqTPvXwuaLq/W9no3AxPJyLQ2Cqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463637;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=5ltdhjdYCrEILG6p4iJLs3C3WwtMxs1hymsNwrm7ROQ=;
	b=hwM8XMfkNN20bGbun15OZNpcvm/JnRi964ufj1UIJysmhDoppqz6yLHpbuW5E8e/GBlh
	 ZTtDCg9IjP1Y5bvyqjO5NGdZcl9k1qlNUO55ko+RRLUfSBqF+63s2UTpqZNbuQ5qgeRqr
	 POPpaS0+DaR8Stv/XSZWy3mWwN6WqXvs9Xf19HvON9m27X969kKOgpV5Caib6xmcf/w61
	 cqdR7oYrSdS0+CdxHaNxVaOdo9xHecKSsghfgvF1p90KevgbQoTTT6UbKdIfJBnLj1lGq
	 254KtLU/kSrfe80Plt7LqQe4Gd+4PXdAl9z/k0j8iZAj42VQ+Jl9u+z0YJXY0/ePdPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Bv6bcc8K;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9E606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF9E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Bv6bcc8K
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC67ErA43489990, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463634; bh=5ltdhjdYCrEILG6p4iJLs3C3WwtMxs1hymsNwrm7ROQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Bv6bcc8KVYZsOU0owWL0E3WePkXX1PbrVaGhEgU58tKVRPU1dVEiAsZbHzM9yU16q
	 g5AuL2P4afImabXRamxGnzMbhxsvA5R5ucB+tcY7efYXekvsY0hfSCYdyDc3YjsI8S
	 8vceFSmXqgNOdJgl0sMvF4t1E/eQzcNMK7zcEpDUUUc64PX+E3Br0p4Aht66InU9R5
	 2LYX37xAu2FcfNhrqDPI4CTzxaj/lQ8mizqpqHlkzpLwUc0rad01uEJi+tFkwOPGTk
	 WMBESASvw4+04ONTkJFEkx/xn+c9JrkjJT6Mk6ZhnpI7+sUe69ukXd4Qqjd1ftAr3w
	 JtWdFJ6R5ryHg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC67ErA43489990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:07:14 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:07:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:07:09 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:07:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 11/11] wifi: rtw89: phy: fix antenna gain unit in debug output
Date: Thu, 12 Nov 2026 14:06:00 +0800
Message-ID: <20261112060600.71784-12-pkshih@realtek.com>
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

The antenna gain offset is in RF TX power precision, so shift
right by txpwr_factor_rf before printing it.

Signed-off-by: Kuan-Chung Chen <damon.chen@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/phy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 795920b899d9..bbbe43e1ea04 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -2391,6 +2391,7 @@ EXPORT_SYMBOL(rtw89_phy_ant_gain_pwr_offset);
 int rtw89_print_ant_gain(struct rtw89_dev *rtwdev, char *buf, size_t bufsz,
 			 const struct rtw89_chan *chan)
 {
+	u8 factor = rtwdev->chip->txpwr_factor_rf;
 	char *p = buf, *end = buf + bufsz;
 	s8 offset_patha, offset_pathb;
 
@@ -2402,8 +2403,8 @@ int rtw89_print_ant_gain(struct rtw89_dev *rtwdev, char *buf, size_t bufsz,
 	offset_patha = rtw89_phy_ant_gain_query(rtwdev, RF_PATH_A, chan->freq);
 	offset_pathb = rtw89_phy_ant_gain_query(rtwdev, RF_PATH_B, chan->freq);
 
-	p += scnprintf(p, end - p, "ChainA offset: %d dBm\n", offset_patha);
-	p += scnprintf(p, end - p, "ChainB offset: %d dBm\n", offset_pathb);
+	p += scnprintf(p, end - p, "ChainA offset: %d dBm\n", offset_patha >> factor);
+	p += scnprintf(p, end - p, "ChainB offset: %d dBm\n", offset_pathb >> factor);
 
 out:
 	return p - buf;
-- 
2.53.0

