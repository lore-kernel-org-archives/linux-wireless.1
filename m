Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463606;
	b=XcsFdKSEnYpUxgKI12IIilSEQcmmZ4kKV2mFuQzx0B/IB7h6K/5Llc51pcuLPgbhvDsv
	 grAFu4yUcCM1LcjQM2hXAnM5n4hcgfQNLddVE2sfFVCCOpl3Nevi47/jNfdrurpzpC1L3
	 EmfJkjKUz9IdLnDF70RfpEUy3LlhwCE9nAcDOgJbI3VLdRcgM1Oxo6jHDA3moj9/S4ZYl
	 N+WzloXnlpYFim28e7nzCqCOW89HYNbwU9yI9AZ88aU2bwyb6tz0fT6EG+/rrmjxxvDsL
	 d5WHuDKqQRjKq+3qwkBTafO3I8Zn3NJClCgO+fM7XCwcAqz3d24hj315aAgownnMULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463606;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=prt7SL6nrgQsZ59P7zqnGDZNIcnoV7zwj2HEtskYoz8=;
	b=iTGiOmj20IIDcLBYh2NIe5/+2dJucLUEA31qcuebXywkhPTm1jKUL7LMXuI1MH3AwM05
	 tGoJWzaCEd53RPbaRp//Pdc3egEER73nwmfORc5NoJPG5K1L7O4nJhc6FlfnHfPrWr89P
	 3rQgz2Quask8zd3lCOzbuv9dgL4jSQ/w4G5LiDop8sd/2MRvqsnM4MdR8eZan8OflQEAV
	 eYSup2AIRfbRVFDibzvG7SDDUGqoOTJjHUqociqOmXG+2oKDVLzgufen/z3h/XqxA54E4
	 2aiyMd7SBpVP8hz4Nn2KDopEUACpWEu/AzVDalacgPdugC6EXy/jrCArT1mnySvzLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jZ7QfFzn;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8C6606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8C6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=jZ7QfFzn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66hLG23489493, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463603; bh=prt7SL6nrgQsZ59P7zqnGDZNIcnoV7zwj2HEtskYoz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=jZ7QfFznWCqBkppUhnHFYkzJaBVIMYg6LFQuwErlrdRHDz13bUjUYc5EjI2RYRGa2
	 RZ9BzJFQmLZZjzVx9VcJ76W4ZC47Bwqr+2PptclaB/q5JZ1J7Np3spynPORVmGTllh
	 WiCoqK5QV5rsLCGJFrrQakDmHGRpraTfIRfswUp5KAzqThkxRvI5tVxUEA9Z0OCR8y
	 JADcSewZ1TWyPEYsHHho1G1HJk3gPXE8mvwh7eLGdM6AXmB+A4nl5D9KORvSlsXycH
	 w4HkbZKGABsggSFmSGrkp6zgaBnvviEGA02/5yIYPt2kpOV0lHmFzbh3WOwJ6tTSMl
	 qZGukCU+xKJEg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66hLG23489493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:43 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 06/11] wifi: rtw89: introduce bitmap of supported bands to deal with quirks
Date: Thu, 12 Nov 2026 14:05:55 +0800
Message-ID: <20261112060600.71784-7-pkshih@realtek.com>
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

From: Zong-Zhe Yang <kevin_yang@realtek.com>

The RTW89_QUIRK_DISABLE_2GHZ only blocked registering NL80211_BAND_2GHZ
in wiphy->bands, but didn't handle other SW logic. Other SW flow still
determined things based on chip->support_bands, and caused inconsistent
behavior.

Introduce supported_bands bitmap which is set by intersection of quirks
and chip->support_bands when initializing core. Besides, initialize quirks
when allocating HW.

Fixes: 355626a2c232 ("wifi: rtw89: 8852cu: add quirk to disable 2.4 GHz band")
Signed-off-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.c  | 37 ++++++++++++++--------
 drivers/net/wireless/realtek/rtw89/core.h  |  1 +
 drivers/net/wireless/realtek/rtw89/debug.c |  5 +--
 drivers/net/wireless/realtek/rtw89/fw.c    | 30 ++++++------------
 drivers/net/wireless/realtek/rtw89/mac.c   |  3 +-
 drivers/net/wireless/realtek/rtw89/regd.c  |  3 +-
 drivers/net/wireless/realtek/rtw89/wow.c   |  5 +--
 7 files changed, 37 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index b7df97e7d622..4467ca25f1b0 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -2584,7 +2584,7 @@ static void rtw89_core_cancel_6ghz_probe_tx(struct rtw89_dev *rtwdev,
 	if (rx_status->band != NL80211_BAND_6GHZ)
 		return;
 
-	if (unlikely(!(rtwdev->chip->support_bands & BIT(NL80211_BAND_6GHZ)))) {
+	if (unlikely(!test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands))) {
 		rtw89_debug(rtwdev, RTW89_DBG_UNEXP, "invalid rx on unsupported 6 GHz\n");
 		return;
 	}
@@ -6427,13 +6427,9 @@ static int rtw89_core_set_supported_band(struct rtw89_dev *rtwdev)
 {
 	struct ieee80211_hw *hw = rtwdev->hw;
 	struct ieee80211_supported_band *sband;
-	u8 support_bands = rtwdev->chip->support_bands;
 	int ret;
 
-	if (test_bit(RTW89_QUIRK_DISABLE_2GHZ, rtwdev->quirks))
-		support_bands &= ~BIT(NL80211_BAND_2GHZ);
-
-	if (support_bands & BIT(NL80211_BAND_2GHZ)) {
+	if (test_bit(NL80211_BAND_2GHZ, rtwdev->supported_bands)) {
 		sband = rtw89_core_sband_dup(rtwdev, &rtw89_sband_2ghz);
 		if (!sband)
 			return -ENOMEM;
@@ -6444,7 +6440,7 @@ static int rtw89_core_set_supported_band(struct rtw89_dev *rtwdev)
 		hw->wiphy->bands[NL80211_BAND_2GHZ] = sband;
 	}
 
-	if (support_bands & BIT(NL80211_BAND_5GHZ)) {
+	if (test_bit(NL80211_BAND_5GHZ, rtwdev->supported_bands)) {
 		sband = rtw89_core_sband_dup(rtwdev, &rtw89_sband_5ghz);
 		if (!sband)
 			return -ENOMEM;
@@ -6456,7 +6452,7 @@ static int rtw89_core_set_supported_band(struct rtw89_dev *rtwdev)
 		hw->wiphy->bands[NL80211_BAND_5GHZ] = sband;
 	}
 
-	if (support_bands & BIT(NL80211_BAND_6GHZ)) {
+	if (test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands)) {
 		sband = rtw89_core_sband_dup(rtwdev, &rtw89_sband_6ghz);
 		if (!sband)
 			return -ENOMEM;
@@ -6970,6 +6966,22 @@ void rtw89_sta_unset_link(struct rtw89_sta *rtwsta, unsigned int link_id)
 	list_del(&link->dlink_schd);
 }
 
+static void rtw89_core_init_supported_bands(struct rtw89_dev *rtwdev)
+{
+	const struct rtw89_chip_info *chip = rtwdev->chip;
+	enum nl80211_band band;
+
+	for (band = 0; band < NUM_NL80211_BANDS; band++) {
+		if (!(chip->support_bands & BIT(band)))
+			continue;
+
+		set_bit(band, rtwdev->supported_bands);
+	}
+
+	if (test_bit(RTW89_QUIRK_DISABLE_2GHZ, rtwdev->quirks))
+		clear_bit(NL80211_BAND_2GHZ, rtwdev->supported_bands);
+}
+
 int rtw89_core_init(struct rtw89_dev *rtwdev)
 {
 	const struct rtw89_mac_gen_def *mac = rtwdev->chip->mac_def;
@@ -6978,18 +6990,14 @@ int rtw89_core_init(struct rtw89_dev *rtwdev)
 
 	rtwdev->io = rtw89_fw_cmd_ofld_alloc_and_get_io_ops(rtwdev);
 
-	bitmap_or(rtwdev->quirks, rtwdev->quirks, &rtwdev->chip->default_quirks,
-		  NUM_OF_RTW89_QUIRKS);
+	rtw89_core_init_supported_bands(rtwdev);
 
 	INIT_LIST_HEAD(&rtwdev->ba_list);
 	INIT_LIST_HEAD(&rtwdev->forbid_ba_list);
 	INIT_LIST_HEAD(&rtwdev->rtwvifs_list);
 	INIT_LIST_HEAD(&rtwdev->early_h2c_list);
-	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
-		if (!(rtwdev->chip->support_bands & BIT(band)))
-			continue;
+	for_each_set_bit(band, rtwdev->supported_bands, NUM_NL80211_BANDS)
 		INIT_LIST_HEAD(&rtwdev->scan_info.pkt_list[band]);
-	}
 	INIT_LIST_HEAD(&rtwdev->scan_info.chan_list);
 	INIT_LIST_HEAD(&rtwdev->tx_waits);
 	INIT_LIST_HEAD(&rtwdev->fw.dup_data_list);
@@ -7722,6 +7730,7 @@ struct rtw89_dev *rtw89_alloc_ieee80211_hw(struct device *device,
 	rtwdev->fw.fw_format = fw_format;
 	rtwdev->support_mlo = support_mlo;
 
+	bitmap_copy(rtwdev->quirks, &chip->default_quirks, NUM_OF_RTW89_QUIRKS);
 	bitmap_or(rtwdev->quirks, rtwdev->quirks, dev_id_quirks,
 		  NUM_OF_RTW89_QUIRKS);
 
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index afec4e166b78..2a691daf7dab 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -7753,6 +7753,7 @@ struct rtw89_dev {
 
 	struct rtw89_ser ser;
 
+	DECLARE_BITMAP(supported_bands, NUM_NL80211_BANDS);
 	DECLARE_BITMAP(hw_port, RTW89_PORT_NUM);
 	DECLARE_BITMAP(mac_id_map, RTW89_MAX_MAC_ID_NUM);
 	DECLARE_BITMAP(flags, NUM_OF_RTW89_FLAGS);
diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index 3ebe4aa04e2b..9d680360a89b 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
@@ -4747,12 +4747,9 @@ static ssize_t rtw89_debug_priv_stations_get(struct rtw89_dev *rtwdev,
 		       (int)sizeof(rtwdev->pkt_offload),
 		       rtwdev->pkt_offload);
 
-	for (idx = NL80211_BAND_2GHZ; idx < NUM_NL80211_BANDS; idx++) {
-		if (!(rtwdev->chip->support_bands & BIT(idx)))
-			continue;
+	for_each_set_bit(idx, rtwdev->supported_bands, NUM_NL80211_BANDS)
 		p += rtw89_dump_pkt_offload(p, end - p, &rtwdev->scan_info.pkt_list[idx],
 					    "\t\t[SCAN %u]: ", idx);
-	}
 
 	rtw89_debugfs_iter_data_setup(&iter_data, p, end - p);
 	ieee80211_iterate_active_interfaces_atomic(rtwdev->hw,
diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless/realtek/rtw89/fw.c
index e965aca66fdc..72882fe14d77 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1328,7 +1328,6 @@ int rtw89_build_txpwr_trk_tbl_from_elm(struct rtw89_dev *rtwdev,
 				       const union rtw89_fw_element_arg arg)
 {
 	struct rtw89_fw_elm_info *elm_info = &rtwdev->fw.elm_info;
-	const struct rtw89_chip_info *chip = rtwdev->chip;
 	const struct rtw89_fw_element_hdr *elm_dup;
 	struct rtw89_hal *hal = &rtwdev->hal;
 	u16 aid = le16_to_cpu(elm->aid);
@@ -1341,11 +1340,11 @@ int rtw89_build_txpwr_trk_tbl_from_elm(struct rtw89_dev *rtwdev,
 	if (aid && aid != hal->aid)
 		return 1;
 
-	if (chip->support_bands & BIT(NL80211_BAND_6GHZ))
+	if (test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands))
 		needed_bitmap |= RTW89_DEFAULT_NEEDED_FW_TXPWR_TRK_6GHZ;
-	if (chip->support_bands & BIT(NL80211_BAND_5GHZ))
+	if (test_bit(NL80211_BAND_5GHZ, rtwdev->supported_bands))
 		needed_bitmap |= RTW89_DEFAULT_NEEDED_FW_TXPWR_TRK_5GHZ;
-	if (chip->support_bands & BIT(NL80211_BAND_2GHZ))
+	if (test_bit(NL80211_BAND_2GHZ, rtwdev->supported_bands))
 		needed_bitmap |= RTW89_DEFAULT_NEEDED_FW_TXPWR_TRK_2GHZ;
 
 	bitmap = le32_to_cpu(elm->u.txpwr_trk.bitmap);
@@ -9920,10 +9919,7 @@ static void rtw89_hw_scan_release_pkt_list(struct rtw89_dev *rtwdev)
 	struct rtw89_pktofld_info *info, *tmp;
 	u8 idx, wildcard_pkt_id;
 
-	for (idx = NL80211_BAND_2GHZ; idx < NUM_NL80211_BANDS; idx++) {
-		if (!(rtwdev->chip->support_bands & BIT(idx)))
-			continue;
-
+	for_each_set_bit(idx, rtwdev->supported_bands, NUM_NL80211_BANDS) {
 		wildcard_pkt_id = scan_info->wildcard_pkt_id[idx];
 		if (wildcard_pkt_id != RTW89_SCANOFLD_PKT_NONE)
 			rtw89_fw_h2c_del_pkt_offload(rtwdev, wildcard_pkt_id);
@@ -9987,10 +9983,7 @@ static int rtw89_append_probe_req_ie(struct rtw89_dev *rtwdev,
 	int ret = 0;
 	u8 band;
 
-	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
-		if (!(rtwdev->chip->support_bands & BIT(band)))
-			continue;
-
+	for_each_set_bit(band, rtwdev->supported_bands, NUM_NL80211_BANDS) {
 		new = skb_copy(skb, GFP_KERNEL);
 		if (!new) {
 			ret = -ENOMEM;
@@ -10039,10 +10032,7 @@ int rtw89_hw_scan_append_wildcard_probe_req(struct rtw89_dev *rtwdev,
 	int ret;
 	u8 id;
 
-	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
-		if (!(rtwdev->chip->support_bands & BIT(band)))
-			continue;
-
+	for_each_set_bit(band, rtwdev->supported_bands, NUM_NL80211_BANDS) {
 		if (wowlan) {
 			nd_config = rtw_wow->nd_config;
 
@@ -13090,17 +13080,15 @@ void rtw89_fw_load_tx_shape_lmt_ru(struct rtw89_tx_shape_lmt_ru_data *data)
 static bool rtw89_fw_has_da_txpwr_table(struct rtw89_dev *rtwdev,
 					const struct rtw89_rfe_parms *parms)
 {
-	const struct rtw89_chip_info *chip = rtwdev->chip;
-
-	if (chip->support_bands & BIT(NL80211_BAND_2GHZ) &&
+	if (test_bit(NL80211_BAND_2GHZ, rtwdev->supported_bands) &&
 	    !(parms->rule_da_2ghz.lmt && parms->rule_da_2ghz.lmt_ru))
 		return false;
 
-	if (chip->support_bands & BIT(NL80211_BAND_5GHZ) &&
+	if (test_bit(NL80211_BAND_5GHZ, rtwdev->supported_bands) &&
 	    !(parms->rule_da_5ghz.lmt && parms->rule_da_5ghz.lmt_ru))
 		return false;
 
-	if (chip->support_bands & BIT(NL80211_BAND_6GHZ) &&
+	if (test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands) &&
 	    !(parms->rule_da_6ghz.lmt && parms->rule_da_6ghz.lmt_ru))
 		return false;
 
diff --git a/drivers/net/wireless/realtek/rtw89/mac.c b/drivers/net/wireless/realtek/rtw89/mac.c
index 41796bff08ed..11b6c6510050 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.c
+++ b/drivers/net/wireless/realtek/rtw89/mac.c
@@ -5319,8 +5319,7 @@ rtw89_mac_c2h_scanofld_rsp(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	actual_period = le32_get_bits(c2h->w2, RTW89_C2H_SCANOFLD_W2_PERIOD);
 	mac_idx = le32_get_bits(c2h->w5, RTW89_C2H_SCANOFLD_W5_MAC_IDX);
 
-
-	if (!(rtwdev->chip->support_bands & BIT(NL80211_BAND_6GHZ)))
+	if (!test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands))
 		band = chan > 14 ? RTW89_BAND_5G : RTW89_BAND_2G;
 
 	if (rtwdev->chip->chip_gen == RTW89_CHIP_BE) {
diff --git a/drivers/net/wireless/realtek/rtw89/regd.c b/drivers/net/wireless/realtek/rtw89/regd.c
index f75ce808254c..017e6a2b4b0d 100644
--- a/drivers/net/wireless/realtek/rtw89/regd.c
+++ b/drivers/net/wireless/realtek/rtw89/regd.c
@@ -587,8 +587,7 @@ static void rtw89_regd_setup_policy_6ghz_vlp(struct rtw89_dev *rtwdev)
 
 static void rtw89_regd_setup_6ghz(struct rtw89_dev *rtwdev, struct wiphy *wiphy)
 {
-	const struct rtw89_chip_info *chip = rtwdev->chip;
-	bool chip_support_6ghz = chip->support_bands & BIT(NL80211_BAND_6GHZ);
+	bool chip_support_6ghz = test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands);
 	bool skip_acpi_dsm = rtwdev->hci.type == RTW89_HCI_TYPE_USB;
 	bool regd_allow_6ghz = chip_support_6ghz;
 	struct ieee80211_supported_band *sband;
diff --git a/drivers/net/wireless/realtek/rtw89/wow.c b/drivers/net/wireless/realtek/rtw89/wow.c
index 928faf71c239..91fbb6d28069 100644
--- a/drivers/net/wireless/realtek/rtw89/wow.c
+++ b/drivers/net/wireless/realtek/rtw89/wow.c
@@ -1470,10 +1470,7 @@ static void rtw89_fw_release_pno_pkt_list(struct rtw89_dev *rtwdev,
 	struct rtw89_pktofld_info *info, *tmp;
 	u8 idx, wildcard_pkt_id;
 
-	for (idx = NL80211_BAND_2GHZ; idx < NUM_NL80211_BANDS; idx++) {
-		if (!(rtwdev->chip->support_bands & BIT(idx)))
-			continue;
-
+	for_each_set_bit(idx, rtwdev->supported_bands, NUM_NL80211_BANDS) {
 		wildcard_pkt_id = scan_info->wildcard_pkt_id[idx];
 		if (wildcard_pkt_id != RTW89_SCANOFLD_PKT_NONE)
 			rtw89_fw_h2c_del_pkt_offload(rtwdev, wildcard_pkt_id);
-- 
2.53.0

