Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463589;
	b=1hOfutgUm9TX4aBkMP+djsrUwvpyufszyh7zN+R5YIAVoLI9w1cAqRL5edGHwwLZIcl+
	 4xlfcUF9aNt5kAoLZDynmdlmo90/kW/BS9t2QmsisVX14Yrb4ZUwyTI6/Zknsp9pTisK/
	 Zn/Pz1zhqdK7URTx398FiXmr8ydIVu7vXipzhinlJVhzqk5lXVY6ybduG6Do9dTydq4yj
	 ZToQobjpcJdm63+eKraONBMYH33u9tZ3mEQBt6HC0YQ0SelPFFI23PnEoqbIHF2OtVC7d
	 cW2iPkCF/O1McccEwJI3aQksFARve4ttuvZgfSpBAeYnsf70oHzXvrIuNxgZp+VWG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463589;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=n5q+A+pyorjQerDAecmIZ0d5b07geJj8vOB5tL+7C3k=;
	b=FMLg3TwRuxa6zG5QV0bRfRCxJfD+ggdjfbAbvnP6bJBYaWYWmOPCbkbGKMPvbh7k5Uk4
	 NWd/TYQQDO0StQrPmaUzD/nO2xewhRNN97PR0UMrhCMZGY5ey1sfqSWzXRxu62uv2twny
	 Ji5fSNdXnY4xVFP4Jx7GPk49Ir3PcSIUYE1CCO54JXaehEcGtHdAF58gH1ZQPQfcGbCya
	 9cHCf05TvyCuOvMm1acijYbh5BJfuOrcmhx8juiM3gLswsRV/Z5jFojwgynyThbmvVYXy
	 qDfQbRCV91Njuu1yqAowK85YwGt3PINpu93dXr+ZXOKZw5gDIG7ppN+P4RZbDgrtLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=gmxDRTc2;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0AE606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=gmxDRTc2
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66Q9N03489174, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463586; bh=n5q+A+pyorjQerDAecmIZ0d5b07geJj8vOB5tL+7C3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=gmxDRTc2shxuapfKgQqh4ZoXmTD1NJrP3yzdqftZvNxoADTXkDm5zQJ7+xF+zM6zx
	 PzGJkaUemum/Gs9dficipwgAedXpAE3WpjIYTKHP+jSQDmGlfyjIhxzLYFm8L6hR1e
	 ReuW7GYkgn568oIw3+aiRW/1byI7+9ykG8NOJwskI35kWp+nab17Xgjd0FBbfTv5bD
	 FyG/g3V9GlldRqMiDvs9327PpsyqrJpkFO4ahl50cUP8OJ4O3dYDRseixwQEBGyou8
	 q0/XILMu5NeIL0YDdNClSXrnY0pDun0qFXMxdpXgx+YEpdEIDwlT97A74b42ZmyVBr
	 qz/v2qEx4YSXA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66Q9N03489174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:26 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:26 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:25 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:25 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 03/11] wifi: rtw89: 8922d: use efuse bias for CCK RX gain
Date: Thu, 12 Nov 2026 14:05:52 +0800
Message-ID: <20261112060600.71784-4-pkshih@realtek.com>
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

Instead of deriving the CCK RX gain compensation from BW20/BW40 gain bias
and CCK RPL offset fields, write the calibration efuse gain value directly
to the efuse bias field.

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.h     | 1 +
 drivers/net/wireless/realtek/rtw89/reg.h      | 1 +
 drivers/net/wireless/realtek/rtw89/rtw8922d.c | 9 +++------
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 01da0b30a7ab..afec4e166b78 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -7437,6 +7437,7 @@ struct rtw89_phy_calc_efuse_gain {
 	s8 cck_mean_gain_bias;
 	s8 cck_rpl_ofst;
 	s8 rssi_ofst;
+	s8 cck_efuse_bias;
 };
 
 #define RTW89_MAX_PATTERN_NUM             18
diff --git a/drivers/net/wireless/realtek/rtw89/reg.h b/drivers/net/wireless/realtek/rtw89/reg.h
index 4829f9fd8eb5..edbfc9514a08 100644
--- a/drivers/net/wireless/realtek/rtw89/reg.h
+++ b/drivers/net/wireless/realtek/rtw89/reg.h
@@ -11003,6 +11003,7 @@
 #define R_CCK_FC0_INV_BE4 0x26090
 #define B_CCK_FC0_INV_BE4 GENMASK(18, 0)
 #define R_GAIN_BIAS_BE4 0x260A0
+#define B_EFUSE_BIAS_BE4 GENMASK(5, 0)
 #define B_GAIN_BIAS_BW20_BE4 GENMASK(11, 6)
 #define B_GAIN_BIAS_BW40_BE4 GENMASK(17, 12)
 
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index 43d9df619260..b874bac9bfee 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -1720,6 +1720,7 @@ static void rtw8922d_calc_rx_gain_normal_cck(struct rtw89_dev *rtwdev,
 	rx_gain_offset = -rtw8922d_get_rx_gain_by_chan(rtwdev, chan, path, true);
 	calc->cck_mean_gain_bias = (rx_gain_offset & 0x3) << 1;
 	calc->cck_rpl_ofst = (rx_gain_offset >> 2) + gain->cck_rpl_base[phy_idx];
+	calc->cck_efuse_bias = rx_gain_offset;
 }
 
 static void rtw8922d_set_rx_gain_normal_cck(struct rtw89_dev *rtwdev,
@@ -1731,12 +1732,8 @@ static void rtw8922d_set_rx_gain_normal_cck(struct rtw89_dev *rtwdev,
 
 	rtw8922d_calc_rx_gain_normal_cck(rtwdev, chan, path, phy_idx, &calc);
 
-	rtw89_phy_write32_idx(rtwdev, R_GAIN_BIAS_BE4, B_GAIN_BIAS_BW20_BE4,
-			      calc.cck_mean_gain_bias, phy_idx);
-	rtw89_phy_write32_idx(rtwdev, R_GAIN_BIAS_BE4, B_GAIN_BIAS_BW40_BE4,
-			      calc.cck_mean_gain_bias, phy_idx);
-	rtw89_phy_write32_idx(rtwdev, R_CCK_RPL_OFST_BE4, B_CCK_RPL_OFST_BE4,
-			      calc.cck_rpl_ofst, phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_GAIN_BIAS_BE4, B_EFUSE_BIAS_BE4,
+			      calc.cck_efuse_bias, phy_idx);
 }
 
 static void rtw8922d_calc_rx_gain_normal_ofdm(struct rtw89_dev *rtwdev,
-- 
2.53.0

