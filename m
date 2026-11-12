Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463627;
	b=XD2Onu3flE5qDIDbH9RsJNV1v2i2G1vw3uMs8Zv+ZH0i+WC7CzyMTf+waFZL/JE/OM6W
	 HSkCb1ictoxIl32l3Ewsxca5RuRSLnb+uKfxUJAVJ5s6GzGY6QmCCdJdbtTtyFNhUGIE/
	 zusYVCnK9bwRkXen/ah9Z+zMLDM6pj1Hsotcpqz02D86Kfur8R0R6WKa43NBgxhdntTJg
	 Zx92WQuLAW6qX3Y/ShEVVorPOwHG8Tyxiswbm6prYeQV8Ip4pIKfHIYzlrxXXZKH6+XIH
	 WrP3irvwfOk2czKyXJtz08jMP/flJKyyrtSBVql4uR67lxX7Rf1w8XxfSnR3U1cV0fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463627;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=BcCN3JaCu+1KND1dAx79yUosJHSOEjBbJjXLolPs4Mw=;
	b=4MELG5amrUusPcjxrva7xhATpszVOxg6ppVKpcyRwtP1GlmCifNLe/znDPgkmwcsD4WJ
	 ook7nkVm0TprRtnPVmwN30SCf8MfJLxJ57Y+P1SjIBek13B53maeLxWGA+iYMCg1l6B30
	 qQG+m1GIKSvJuP9xDfJe9iPJdhILHIGMSZGg6qnibxVIYo6VpVYlDe5uO1gUdzkqgatTM
	 KMtQvJlghuojkXDkGJM3lgVQIIJjsCPUwf4ey+da69GD97YKxz1n9yERj2vIKwZHag3uo
	 4ovyLTCGwIVjOYZ11I7SK5bhIZrEM0cLziM6v0di10OvFwTf8uglv7dFOJyYzWIEPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qQMW2PUb;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE590606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE590606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qQMW2PUb
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC674zvC3489725, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463624; bh=BcCN3JaCu+1KND1dAx79yUosJHSOEjBbJjXLolPs4Mw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qQMW2PUbMcWZlI9hxRrMVqGqh1xEYQueqGGotdlU4zppI0GqVT7jhBv6c1407ufJJ
	 s9XDdt5N2VrjcjaCd8BFwGuJwZ2u7ETLwJmpDASR8Yv2W/9th+Rqa3ztQoYX6ModlU
	 TEu7xl7KMk2ZGKtNhNbFGgaMRPkcG0vYyEclavJcOzcFeUTp79O0H7tnAd36Z2pjLP
	 iLAwfgCMlfqS45RgDFC7ClMoiRF4kUJblAsPlFIBbyQ8EvU0Saqdpav8Tg9GqNg5Zt
	 9k5Yb1cNOeFvI7VrrXrZma3pP5dEi5UYO71OpTjJegznlRCXko8EuHPPN9U0Y3/s3s
	 64eyFM/xeNnMQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC674zvC3489725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:07:04 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:07:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:07:04 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:07:04 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 10/11] wifi: rtw89: 8922d: enable dynamic antenna gain
Date: Thu, 12 Nov 2026 14:05:59 +0800
Message-ID: <20261112060600.71784-11-pkshih@realtek.com>
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

RTL8922D supports dynamic antenna gain compensation via ACPI Realtek
Antenna Gain (RTAG), so turn on the flag in its chip info.

Signed-off-by: Kuan-Chung Chen <damon.chen@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/rtw8922d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index 4175aeceef8d..eaa12f7562b0 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -3808,7 +3808,7 @@ const struct rtw89_chip_info rtw8922d_chip_info = {
 				  BIT(NL80211_CHAN_WIDTH_80) |
 				  BIT(NL80211_CHAN_WIDTH_160),
 	.support_unii4		= true,
-	.support_ant_gain	= false,
+	.support_ant_gain	= true,
 	.support_tas		= false,
 	.support_sar_by_ant	= true,
 	.support_noise		= false,
-- 
2.53.0

