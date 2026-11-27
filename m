Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802470;
	b=eTATx+9/jHwes3eTIvm0GyeNDwMKy/ryDzghOtnWJi+jpA64xJArjb824SfS+MFjFzQO
	 UPcsLHP7D6eQKvKpcKZGx6MmsA1Xu9RnVdaKJ9NBPIoJCB85fz1y4mBb7Snge6dEK+dPv
	 FeJ/h2ApWzJnKSST4SPCuNui4m6yYQQNof889Oac+fZL/JEKxz7iweflndA8WX9n3DQUA
	 H11uf2gDnv0dXv6XSM5rJ1M+IA/LFjtRwGCQx1AlbSleWykV+UomtNXHIts6tn8uCfLpP
	 J1cZ4iMghmrYrNeK+CF3LbjeIAK/BEH2HTv1kQWvHe22DJXerhKNY/u5cLPOFm55Ysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xNLMTbVpnGFusLLUZvmmVcv0RxqGF9fcayFWYWFahaA=;
	b=q2lELZvNB9KZiOc86b/rXCCkEAryq/6kQNENQIxWGyOkigRpHtbHDptrreyLJUvg5+Bm
	 nRGWdA5P1w1ZxNtVOT2QKP/p+M9ZyZwIjNiPJjyeCqOr/6+6byjwQA+t8/9wIrs90mi4h
	 mowp+uxLuFPWoE1dvyhm/wFv8ALwopP/Nq/VbAEaikg9fqnQccmShUpLCXZ70g6lDyumH
	 UifqJW12gKdCJVd9fUAQask0/wYuD8XnGuihSWI4jEg9lcJpfGxwrVsMyj9FLQJjBfekL
	 MB6QbAxqWHg8QVs3zIyfDz1mRqica+/ul0fUCpKM4HeVcBvAspjILBiqsupIfc95YrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GtSjOoYv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B1606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GtSjOoYv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so10935274eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802469; x=1796407269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNLMTbVpnGFusLLUZvmmVcv0RxqGF9fcayFWYWFahaA=;
        b=GtSjOoYvYvBTKsCuXFoNbuU84ghBLatdMN1lKbMChnO9qH5xHeaHu+x3JJalhaSFqy
         hiQIXodqVVOGQSIzcHZKGWDq8bhjAcBOKLCFtPy+4JPVmChuLPXXMhOjSpy1aEfl9kG3
         BKVJZeqctmtwKZ0ntrtSiti0NnVhiiTmTUO6XO59EV8sty1z09lMr0DByCQKLGdWYL23
         EZjLQS94S6CxUGyxdAgOIpAejYXq2wz2TFXt0/I5zviuZCrkFGVgf18jbnSI49U4aLmJ
         aHK83eU9fC97bYBizfac90HXFiXlZPRooB4reUnJElcj8Bu7h21heCgc3la/T1hNFUB8
         7eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802469; x=1796407269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNLMTbVpnGFusLLUZvmmVcv0RxqGF9fcayFWYWFahaA=;
        b=twbj3sCOQjGDtIgCnDoxwVdLq7L7t11nQ9GHKhhdO9jUoRlAoHz2jwwsJ7ury6NO+l
         MyDXwz37/ogVwqHClLExNeF2NylpdINSWn5E9GY+ejxUED+9mKvO5iFL5K5HZATJ+E9T
         /7A7ZvvAiXHkLXLcKmPnD/Yj7gIZhferOyOLGyuW7yv6Y8hJ9Jv0EeZjwkm8myovgeuF
         ZfvQDK5CYTKF7YXcE7Z6DHhPpRDgmJL0QeWfUBlPTXTcEf++FM61QLtw9Cp70FdFUEl6
         WykUOmyR2TfjmfdI6tYBK7vA4/lJOxKlAJiXYrNooQhMy0tftXbXwXrZnoioYdbLxJ5v
         69oA==
X-Gm-Message-State: APuU4Z9vUHL+syuGvygnTohv4+ht7LVUH46NM1vmv9g28xEaWyr3kcUM
	koQSDhHcw36sIfFA+fr/vu0W2C+uX4dhxoPCi/e22droUhDTt8fr3GZKkwSsVfja
X-Gm-Gg: AZFdTZc/WgLSIaBdfgJHfce/dOBXjedhZwVimHndCeQ5iNUmJpaP7ijVqzDEz3xfDdg
	Qy3kXNGAlst/tUswJv2azsJbkIm6cFbTRDBFskxT03LjWl7+E+r9WDXssNocEoh0koZUfZzP1cy
	mkugbEaGbRkORH+xFAsN26If1dD9Dg30WrsLOE3MCG+3Qw7m0/gHyiSIMH2X0IuvFz99V3d3ild
	tRFCNfTQu1RSgJnBTFAz5JJiI1jA+DT2HklVu0/urQHME8m6qofQN6qjh/wPFPA/hrCdZEI07EY
	r9+58+7EmW6/E740DBZI+hxnt+581wLlZOd9RERw26bgC6u8DlN38ibpu28aiwhwFCSqZplVFlV
	q3NHrvJSq96H7NkwzHRMEKrVKy4NBhGhWi6KcQy1w58GVDUm33tfvU+nY3CGOEzaTwV/YXxBmJA
	vD8H3iwHzJPYdEVBErPigQwNy1DFzd6qcd5GpZmlosh5NkXa5k+IEMNXy6OmXNs9Z+9vN8WlNSO
	xCdoJqj355HhRrteNCWwjRKqiIkpvNp05c8fqkyEF2pdnBKMFeHWfFol2A6/7uzFyjyP8p0QM0h
	nU1xR4tN4fsf7zWkbDoM6vSkwYPWMtQX9Ce4sR+2CYflNbht07O+gpbLo5TXalffZd+Y+ErnK8F
	o4IvgVtFPfl/VKVpjVQ==
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr26699382eec.13.1795802469372;
        Fri, 27 Nov 2026 10:01:09 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 6/7] wifi: rtw88: 88xxa: correct carrier-frequency offset
Date: Sat, 28 Nov 2026 02:00:26 +0800
Message-ID: <20261127180034.1058591-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127180034.1058591-1-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com>
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

Use the newly promoted helpers to implement CFO tracking for 88xxa.

The PHY status of each received frame reports a CFO tail per RF path.
The CFO tracking code averages them and corrects the offset if the
offset is too large.

RTL8814A has four RF paths, but reports a CFO tail only for paths A
and B, so we only take the CFO tail of 2 paths.

The crystal cap is 6 bits wide on all chips except RTL8822C. Obtain
the correct value by masking it. For RTL8814A, use 0x20 if the
the efuse is empty, like the vendor driver.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/phy.c      |  5 +-
 drivers/net/wireless/realtek/rtw88/phy.h      |  6 +++
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 32 +++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  2 +
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 47 +++++++++++++++----
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  1 +
 7 files changed, 81 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index d0c1fb65be..b01601d707 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -687,13 +687,14 @@ static void rtw_phy_parsing_cfo_iter(void *data, u8 *mac,
 	struct rtw_rx_pkt_stat *pkt_stat = iter_data->pkt_stat;
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, RTW_CFO_PATH_NUM_MAX);
 	u8 *bssid = iter_data->bssid;
 	u8 i;
 
 	if (!ether_addr_equal(vif->bss_conf.bssid, bssid))
 		return;
 
-	for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
+	for (i = 0; i < path_num; i++) {
 		cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
 		cfo->cfo_cnt[i]++;
 	}
@@ -794,7 +795,7 @@ u8 rtw_phy_cfo_xcap_track(struct rtw_dev *rtwdev, u8 xcap_max, bool bt_hold)
 {
 	struct rtw_dm_info *dm_info = &rtwdev->dm_info;
 	struct rtw_cfo_track *cfo = &dm_info->cfo_track;
-	u8 path_num = rtwdev->hal.rf_path_num;
+	u8 path_num = min_t(u8, rtwdev->hal.rf_path_num, RTW_CFO_PATH_NUM_MAX);
 	s8 crystal_cap = cfo->crystal_cap;
 	s32 cfo_avg = 0;
 
diff --git a/drivers/net/wireless/realtek/rtw88/phy.h b/drivers/net/wireless/realtek/rtw88/phy.h
index b551cb860d..52e6546b52 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.h
+++ b/drivers/net/wireless/realtek/rtw88/phy.h
@@ -204,4 +204,10 @@ enum rtw_phy_cck_pd_lv {
 #define RRSR_RATE_ORDER_MAX	0xfffff
 #define RRSR_RATE_ORDER_CCK_LEN	4
 
+/* crystal cap width of all chips except RTL8822C */
+#define RTW_XCAP_MASK		GENMASK(5, 0)
+
+/* RTL8814A has 4 paths, but only paths A and B report CFO */
+#define RTW_CFO_PATH_NUM_MAX	2
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
index 13c22d2e50..74c548cb5c 100644
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
 
@@ -2074,6 +2083,19 @@ static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
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
@@ -2108,6 +2130,8 @@ static const struct rtw_chip_ops rtw8814a_ops = {
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
index 9780999a9b..68a4ca8069 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -290,6 +290,7 @@ int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 	efuse->crystal_cap = map->xtal_k;
 	if (efuse->crystal_cap == 0xff)
 		efuse->crystal_cap = 0x20;
+	efuse->crystal_cap &= RTW_XCAP_MASK;
 	efuse->pa_type_2g = map->pa_type;
 	efuse->pa_type_5g = map->pa_type;
 	efuse->lna_type_2g = map->lna_type_2g;
@@ -643,9 +644,19 @@ static void rtw88xxa_init_beacon_parameters(struct rtw_dev *rtwdev)
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
@@ -664,13 +675,7 @@ static void rtw88xxa_phy_bb_config(struct rtw_dev *rtwdev)
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
@@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
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
@@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
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

