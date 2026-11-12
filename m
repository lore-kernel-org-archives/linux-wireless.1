Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504793;
	b=A30fSITi26rwaWkGdVulzz4kNznt2LznwMdTk69ECmUR7HARrsYji86fIEWomWy+wYGa
	 cKWZ6Tb20AdkewxgS58zBT1qfHtz+uFl8Jo4NkPCRv2U9Lh2ckXCnxpy2zWVhf6Ga/CZ6
	 mu6qkXSah4hHjzbdcffmK/ZVPH+M7r6eOFIqsodBY/z0Xvp2Qru+x88Lg+Ci2VniGPi4H
	 YbNCFN6Y+MTt3oeduiGBoCt4Gd0TKZ/XtR6yvxJVTUsHNMpundBDzzBWShsU1BqXM2AHK
	 8Kme8sX26ihTj7saTsLShp86/JfNQOa6prZ18XssyKsZiOZDJsu9oBL9FJLxoDhFSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kYKgVaocDJ/DiZWTyOirSg0cgAlU2Wvu8ek5UIm9hJ4=;
	b=Ew16YR3gtUdX/wr9R5Yv8MQQkZKmvb9NtO4mhkZZp6giTbVnUX8cmoeFIv5PnSOveF6w
	 TYWofGUKo7c0h0ysAQaiP/UT+S28+wxVGu//cP3ekP4xM1Ihm3msq4czj18LCVO3ovRwP
	 r/aqAyGJgQm3/1+ig2EX3EAr8xpeHU7Gqmnb9HFJmkLT1MDYXTs7TR/+Ept8C10je5Zc/
	 V+qRqSMpZLkqlzgxMO1L+VNg0p6SyzJby+4vta8p4eSnBFkKFbOUbvjoK9da32AIzsP/m
	 kRzosd+sNF0gVR+bNaFtEt3jTDn5w2sBLNwwPOMaaS5xHLEYdKEc3+j9gKeN0MGLy3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3o2iCDS;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DEC606A332
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DEC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3o2iCDS
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b179528d56so4684a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504792; x=1795109592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYKgVaocDJ/DiZWTyOirSg0cgAlU2Wvu8ek5UIm9hJ4=;
        b=X3o2iCDSkjbAAqpRFDnktujIY13QCYhgSg4g65MqKaJ8EHi0whrGr3GqNccsUXS0WG
         PiDrXPGsDx60xh7AVtAgVkMClZYuwUlBE1xU58mE5wvyLeTaTet/9kNRHn+3vUxdSOD3
         NlLQsWoYO9h25eS9H0Mbu53WHnP5fOaku2+YEIjwUMXxR7ONBpEiE6gZdwIfGxSGrolH
         kF0XJVP1ca98lrtF6a4YAHdLtcTJWQX+1BC6BgpyGYLR6oN4UPMMmr+19IBPowhl6rIb
         /VJgjl44zEA39R33HlrKG7MiSE1V6C6lM7bUCNe3m+YYT5z54YqLfRlp41MXaiwVmlWi
         VfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504792; x=1795109592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYKgVaocDJ/DiZWTyOirSg0cgAlU2Wvu8ek5UIm9hJ4=;
        b=XnLM/9PsNl5OaktFEfCICxMqDrt/DrCmG/KR6c+cLo6+VoGcq4rXRW5pXQZaXIqzBl
         VrtriBrdUlpXWwdpS3C63agFA/uB/GdS/EyjTHxQdoFdlpEMt+lWpS3K2ow/PhjG5Dk9
         rMV8Hk8POlrW5GcsWEl0jOnf8zPeHueLZgdG/u/pka9Ch/fiDQlCdFY9/5JoAy7CZviG
         dbnYIEKzQAT6mQus5dgrxGM9TqL9hXhlDku2OKll7utcMdbWWVTiWE7m6Y3OreFWbMJJ
         F89OsEBj3Whxjqe4Tk7U1hu4v9fXRXFwtOlfPW9RQ7UN+fxG3cSHP9hbN+b7/Q5dSn3n
         uDzw==
X-Gm-Message-State: APuU4Z9YUyzGL/g8+m+E2ETTM4iDUOH69V7+BqB5PDCK8oE4pYt5lKZG
	UBU02jJMlwFgAsHxNpJhB1H7m06c/WkJr65eRs2gIxf8YagO1puBvU8dxB9wmEnd
X-Gm-Gg: AYBFou0p1k02id3n2PS8FGGz2/e3EoUa5KItwQX8n2tyK0f23rOMcXViy4+avAu+OMc
	Nuh1XSZ4T3y38Ui6FfAzZlP53v8PUk1gu0kPSodJvKZqU5qNDwNarrTENNmd+2J36BNGF7B1wwz
	aoo3xx0MCim/mgWJ04BidmEgV2kFNIkm71YaoX3aMEQBELui7+pQRzFYxcS+vSQ7AmOeGqf/CM/
	cvkm0KutzpSQSifqNM54vpdxisT+eE5dQDIMMdll6aeCh/4gqc29Oljv4BFfwL16vJPhhEhJJue
	IQ1b8x2lw7fx4zaPkK/tan1zoBuWZhLLfQrT+4LKOjlQpws/PEQyGcxmEq6WODFUztGXlbEmAs4
	QbDnWtZ/9/BFtT3UsJLAA5PH9tCg5esp7DZHN6r3yy7S1DZMFSCLwUOooVodRJYxCTHCzVdmsM/
	doE4e5nZCT3HVxaieTmmV6UobAqf5q2PMASd89sGAIVFVFxRohaWi4Wh7nY8fBbnEtEuMXUDofW
	ZUZnUBZGuh/TFZLiTjMVltdGbvWfpSCv6/fJ0HKv6ABf6AIqTbIi4PkYGwQhr8Q00g2msCrd+Zl
	dEqmMGKhbH5HJyxvMhK33KZkWr6WY5rCFBMiacZBGu4UMcCW+VoiaMhIy3y2U+truqFy4CcVbZR
	kBhiWG+dHFtnSNai7IOYreOVZ2DV5GFERPxstH9HD6aA9
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr5547183a91.7.1794504791841;
        Thu, 12 Nov 2026 09:33:11 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:33:11 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 4/5] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Fri, 13 Nov 2026 01:32:43 +0800
Message-ID: <20261112173246.3201729-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112173246.3201729-1-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com>
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

Use the newly promoted helpers to implement support for 88xxa

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/phy.c      |  6 ++-
 drivers/net/wireless/realtek/rtw88/phy.h      |  3 ++
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 32 +++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 47 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  1 +
 7 files changed, 79 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index d0c1fb65be..eed3e2cb60 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -687,13 +687,15 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
 	struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	/* rtl8814a has 4 paths, but only 2 of them report cfo */
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);
 	u8 *bssid = iter_data->bssid;
 	u8 i;
 
 	if (!ether_addr_equal(vif->bss_conf.bssid, bssid))
 		return;
 
-	for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
+	for (i = 0; i < path_num; i++) {
 		cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
 		cfo->cfo_cnt[i]++;
 	}
@@ -794,7 +796,7 @@ u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
 {
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-	u8 path_num = rtwdev->hal.rf_path_num;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, 2);
 	s8 crystal_cap = cfo->crystal_cap;
 	s32 cfo_avg = 0;
 
diff --git a/drivers/net/wireless/realtek/rtw88/phy.h b/drivers/net/wireless/realtek/rtw88/phy.h
index b551cb860d..3a74035219 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.h
+++ b/drivers/net/wireless/realtek/rtw88/phy.h
@@ -204,4 +204,7 @@ enum rtw_phy_cck_pd_lv {
 #define RRSR_RATE_ORDER_MAX	0xfffff
 #define RRSR_RATE_ORDER_CCK_LEN	4
 
+/* crystal cap width of all chips except RTL8822C */
+#define RTW_XCAP_MASK		GENMASK(5, 0)
+
 #endif
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 5d58dff4fc..c8008cf43d 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -943,6 +943,8 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.coex_set_rfe_type	= rtw8821a_coex_cfg_rfe_type,
 	.coex_set_wl_tx_power	= rtw8821a_coex_cfg_wl_tx_power,
 	.coex_set_wl_rx_gain	= rtw8821a_coex_cfg_wl_rx_gain,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw88xxa_cfo_track,
 };
 
 static const struct rtw_page_table page_table_8812a[] = {
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index c2a18f6be8..a66bd7c7e0 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -146,6 +146,9 @@ static int rtw8814a_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 	efuse->rfe_option = map->rfe_option;
 	efuse->rf_board_option = map->rf_board_option;
 	efuse->crystal_cap = map->xtal_k;
+	if (efuse->crystal_cap == 0xff)
+		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= RTW_XCAP_MASK;
 	efuse->channel_plan = map->channel_plan;
 	efuse->country_code[0] = map->country_code[0];
 	efuse->country_code[1] = map->country_code[1];
@@ -284,9 +287,15 @@ static void rtw8814a_config_cck_rx_antenna_init(struct rtw_dev *rtwdev)
 	rtw_write32_mask(rtwdev, REG_CCKTX, BIT_CMB_CCA_2R, 1);
 }
 
+static void rtw8814a_set_crystal_cap(struct rtw_dev *rtwdev, u8 crystal_cap)
+{
+	rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x07ff8000,
+			 crystal_cap | (crystal_cap << 6));
+}
+
 static void rtw8814a_phy_set_param(struct rtw_dev *rtwdev)
 {
-	u32 crystal_cap, val32;
+	u32 val32;
 	u8 val8, rf_path;
 
 	/* power on BB/RF domain */
@@ -308,9 +317,7 @@ static void rtw8814a_phy_set_param(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	crystal_cap |= crystal_cap << 6;
-	rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x07ff8000, crystal_cap);
+	rtw8814a_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
 
 	rtw8814a_config_trx_path(rtwdev);
 
@@ -1269,6 +1276,8 @@ static void rtw8814a_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
 			pkt_stat->cfo_tail[i] = cfo[i];
 			dm_info->cfo_tail[i] = (cfo[i] * 5) >> 1;
 		}
+
+		rtw_phy_parsing_cfo(rtwdev, pkt_stat);
 	}
 }
 
@@ -2069,6 +2078,19 @@ static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
 		rtw_bf_remove_bfee_su(rtwdev, bfee);
 }
 
+static void rtw8814a_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, false);
+	if (crystal_cap == cfo->crystal_cap)
+		return;
+
+	cfo->crystal_cap = crystal_cap;
+	rtw8814a_set_crystal_cap(rtwdev, crystal_cap);
+}
+
 static void rtw8814a_fill_txdesc_checksum(struct rtw_dev *rtwdev,
 					  struct rtw_tx_pkt_info *pkt_info,
 					  u8 *txdesc)
@@ -2103,6 +2125,8 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
 	.fill_txdesc_checksum	= rtw8814a_fill_txdesc_checksum,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw8814a_cfo_track,
 
 	.coex_set_init		= rtw8814a_coex_cfg_init,
 	.coex_set_ant_switch	= rtw8814a_coex_cfg_ant_switch,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6d106ae70d..17d3677ca4 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -889,6 +889,8 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.coex_set_rfe_type	= rtw8821a_coex_cfg_rfe_type,
 	.coex_set_wl_tx_power	= rtw8821a_coex_cfg_wl_tx_power,
 	.coex_set_wl_rx_gain	= rtw8821a_coex_cfg_wl_rx_gain,
+	.cfo_init		= rtw_phy_cfo_xcap_init,
+	.cfo_track		= rtw88xxa_cfo_track,
 };
 
 static const struct rtw_page_table page_table_8821a[] = {
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
index 128a18ee33..a6c964e6c3 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -278,6 +278,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 	efuse->crystal_cap = map->xtal_k;
 	if (efuse->crystal_cap == 0xff)
 		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= RTW_XCAP_MASK;
 	efuse->pa_type_2g = map->pa_type;
 	efuse->pa_type_5g = map->pa_type;
 	efuse->lna_type_2g = map->lna_type_2g;
@@ -631,9 +632,19 @@ static void rtw88xxa_init_beacon_parameters(struct rtw_dev *rtwdev)
 	rtw_write16(rtwdev, REG_BCNTCFG, 0x4413);
 }
 
+static void rtw88xxa_set_crystal_cap(struct rtw_dev *rtwdev, u8 crystal_cap)
+{
+	if (rtwdev->chip->id == RTW_CHIP_TYPE_8812A)
+		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x7FF80000,
+				 crystal_cap | (crystal_cap << 6));
+	else
+		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x00FFF000,
+				 crystal_cap | (crystal_cap << 6));
+}
+
 static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
 {
-	u8 val8, crystal_cap;
+	u8 val8;
 
 	/* power on BB/RF domain */
 	val8 = rtw_read8(rtwdev, REG_SYS_FUNC_EN);
@@ -652,13 +663,7 @@ static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
 	rtw_load_table(rtwdev, rtwdev->chip->bb_tbl);
 	rtw_load_table(rtwdev, rtwdev->chip->agc_tbl);
 
-	crystal_cap = rtwdev->efuse.crystal_cap & 0x3F;
-	if (rtwdev->chip->id == RTW_CHIP_TYPE_8812A)
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x7FF80000,
-				 crystal_cap | (crystal_cap << 6));
-	else
-		rtw_write32_mask(rtwdev, REG_AFE_CTRL3, 0x00FFF000,
-				 crystal_cap | (crystal_cap << 6));
+	rtw88xxa_set_crystal_cap(rtwdev, rtwdev->efuse.crystal_cap);
 }
 
 static void rtw88xxa_phy_rf_config(struct rtw_dev *rtwdev)
@@ -1620,6 +1625,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
 			power_b = power_a;
 
 		pkt_stat->signal_power = max3(power_a, power_b, min_rx_power);
+
+		pkt_stat->cfo_tail[RF_PATH_A] =
+			(s8)le32_get_bits(rpt->w2, RTW_JGRPHY_W2_CFO_TAIL_A);
+		pkt_stat->cfo_tail[RF_PATH_B] =
+			(s8)le32_get_bits(rpt->w2, RTW_JGRPHY_W2_CFO_TAIL_B);
+
+		/* convert to kHz (used only for debugfs) */
+		for (i = RF_PATH_A; i < rtwdev->hal.rf_path_num; i++)
+			dm_info->cfo_tail[i] = (pkt_stat->cfo_tail[i] * 5) >> 1;
+
+		rtw_phy_parsing_cfo(rtwdev, pkt_stat);
 	}
 }
 EXPORT_SYMBOL(rtw88xxa_query_phy_status);
@@ -2008,6 +2024,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 }
 EXPORT_SYMBOL(rtw88xxa_phy_pwrtrack);
 
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev)
+{
+	struct rtw_cfo_track *cfo = &rtwdev->dm_info.cfo_track;
+	bool bt_hold = rtwdev->efuse.btcoex && !rtw_coex_disabled(rtwdev);
+	u8 crystal_cap;
+
+	crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
+	if (crystal_cap == cfo->crystal_cap)
+		return;
+
+	cfo->crystal_cap = crystal_cap;
+	rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);
+}
+EXPORT_SYMBOL(rtw88xxa_cfo_track);
+
 MODULE_AUTHOR("Realtek Corporation");
 MODULE_DESCRIPTION("Realtek 802.11ac wireless 8821a/8811a/8812a common code");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
index 150e86ea74..188b8f3a4b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
@@ -172,5 +172,6 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 			   void (*do_iqk)(struct rtw_dev *rtwdev));
 void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
 			     struct rtw_bfee *bfee, bool enable);
+void rtw88xxa_cfo_track(struct rtw_dev *rtwdev);
 
 #endif
-- 
2.53.0

