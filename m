Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905108;
	b=WGSqTUZreT02HqgIFLGzHQMGto4PzExlPpKNKMVwA3XWy0PwyBEk7d/5kyL6ZJgjJMeo
	 oy3Ojpxe3P84kUAsfL7q0TKA1BOx87h56WzxHwH0VyqOQ0e3EuGtbZKVYp09XlQjPmKat
	 7woW/Qg3Eclc4NB31eG3livb9kYmm7e3XsV3Ag/6/j1yLzPee4UM+qeTKbJibQTetDQBZ
	 cgtQMZlyb+APaQfiX78TIPly6pZZKxrFMcuwKgPXsUkGZrqWDf6WbKgMDEhGbVqoxUQcS
	 uKWNKf8/0RcgyspYdxLPnqArDiNcHf0Jb12Pfj2aXUCdFTEc2oMeGLorrvmaw1HkgFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905108;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=ONECRaM1NblIIpUhkb+BYTFNA/HYegHk44VMbVz+Ct8=;
	b=MZ5yIOFJamfrcXVh6REFBBnHfB0U2eMX75+N5T1nFmcNn639R6vGWWYs9Skm/HYC6i2I
	 yiedMqp/l/FLpPPDdE7BjhEZWqHtohOVeqPfQ0njmKYP6R4ZskyEL1I/BxqHA2lyQRXtf
	 fLDlmg4P5WSN1tpKqxCRO1gPsrHXvVXfrKM4RoHnxi/xN0zekeoLZAXekPJNRdYaNJ5NM
	 rmVEi82ODX3Q0wb/Y+xsEG5SkZJ/P4WW9Fd125AjGffm54MUIKuorKqr0mdaeVJu8cfhD
	 KJ/ebc16/k4O9ZdDz6likNTPrRuJh2XgNEOs/sxQTvl2EeiZ3RDPjQsoSaL0+Z/j22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Nj1dPxSN;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254B606A338
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 08:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A254B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Nj1dPxSN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH8ixGkB097582, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794905100; bh=ONECRaM1NblIIpUhkb+BYTFNA/HYegHk44VMbVz+Ct8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Nj1dPxSNXj603wNmf8NLGAAtwrYma/pdcc8fA4g/cT8MSl1xMRvetUejXwYVChmbx
	 hMZ0s4UMur586BtpUsQ+LLgFW0iM2sEuZeGcSUyU+C5ZgqRzXPGYV6QIEhEeQv9C51
	 Fe1y4mC3ndFT42bRkWwiuKtb4MhqpZ8zZHMfBFg+1oK4AYib0fv/SP1DUThM1IMVG6
	 G0/NhJ62rqQ24ME7MF2xIkk9iAdj4NcPB6mbVQA1aNr9j36a6vNO97hRYO4U97KWt/
	 HrDCT0Pd2nIZ6/DKivHBBkyIgicG95T5WUh07OoS+I+rThaxCIvKh7d9hyLd92FxWK
	 X+/+ER7IWWjmw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH8ixGkB097582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 16:44:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:44:59 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 16:44:59 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <echuang@realtek.com>, <henchy.chen@realtek.com>
Subject: [PATCH rtw-next] wifi: rtw89: 8922d: add DTP for thermal protection
Date: Tue, 17 Nov 2026 16:44:47 +0800
Message-ID: <20261117084447.65229-1-pkshih@realtek.com>
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

From: Hsiao-Yung Chen <henchy.chen@realtek.com>

Add dynamic TX power (DTP), which limits TX power of each station through
the power limit by MAC ID, to prevent temperature from getting too high
during high throughput.

DTP is enabled when thermal value is over a threshold, which is defined
as the thermal value corresponding to 110 degree Celsius, and disabled
when it drops 2 in unit of thermal value below the threshold. While
enabled, driver checks RSSI of each station in every track work. A station
is limited to a TX power cap of 3 dBm if RSSI is not lower than -23 dBm,
and released when RSSI is 3 dB lower than that.

DTP is not applied if the channel is noisy. Measure NHM in background
during the interval of track work, and decide a channel is noisy if the
ratio is not lower than 2%, and keep it noisy until the ratio drops
below 1%. If NHM gives no valid ratio for three consecutive track works,
don't apply DTP. Program per-MACID power limits through the BB wrapper
and enable them for each active PHY, retrying the enable when a PHY
becomes available. Currently only RTL8922D supports DTP.

For debugging, add a flag to disable_dm that DTP can be disabled.

Signed-off-by: Hsiao-Yung Chen <henchy.chen@realtek.com>
Signed-off-by: Eric Huang <echuang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.c     |   5 +
 drivers/net/wireless/realtek/rtw89/core.h     |  26 ++
 drivers/net/wireless/realtek/rtw89/debug.c    |   1 +
 drivers/net/wireless/realtek/rtw89/phy.c      | 376 +++++++++++++++++-
 drivers/net/wireless/realtek/rtw89/phy.h      |  12 +
 drivers/net/wireless/realtek/rtw89/phy_be.c   |  78 ++++
 drivers/net/wireless/realtek/rtw89/reg.h      |  21 +
 drivers/net/wireless/realtek/rtw89/rtw8851b.c |   1 +
 drivers/net/wireless/realtek/rtw89/rtw8852a.c |   1 +
 drivers/net/wireless/realtek/rtw89/rtw8852b.c |   1 +
 .../net/wireless/realtek/rtw89/rtw8852bt.c    |   1 +
 drivers/net/wireless/realtek/rtw89/rtw8852c.c |   1 +
 drivers/net/wireless/realtek/rtw89/rtw8922a.c |   1 +
 drivers/net/wireless/realtek/rtw89/rtw8922d.c |  34 +-
 14 files changed, 546 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 1e8b60e1bf26..88b2ddef31f6 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5560,6 +5560,7 @@ static void rtw89_track_work(struct wiphy *wiphy, struct wiphy_work *work)
 	rtw89_core_bcn_track(rtwdev);
 	rtw89_phy_stat_track(rtwdev);
 	rtw89_phy_env_monitor_track(rtwdev);
+	rtw89_phy_dtp_track(rtwdev);
 	rtw89_phy_dig(rtwdev);
 	rtw89_core_rfk_track(rtwdev);
 	rtw89_phy_ra_update(rtwdev);
@@ -5786,6 +5787,7 @@ int rtw89_core_sta_link_add(struct rtw89_dev *rtwdev,
 	int ret;
 
 	rtwsta_link->prev_rssi = 0;
+	rtwsta_link->dtp_enabled = false;
 	ewma_rssi_init(&rtwsta_link->avg_rssi);
 	ewma_snr_init(&rtwsta_link->avg_snr);
 	ewma_evm_init(&rtwsta_link->evm_1ss);
@@ -6027,6 +6029,9 @@ int rtw89_core_sta_link_remove(struct rtw89_dev *rtwdev,
 	const struct ieee80211_sta *sta = rtwsta_link_to_sta(rtwsta_link);
 	int ret;
 
+	if (rtw89_chip_support_dtp(rtwdev))
+		rtw89_phy_dtp_set_pwr_ctrl(rtwdev, rtwsta_link->mac_id, false);
+
 	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls) {
 		rtw89_reg_6ghz_recalc(rtwdev, rtwvif_link, false);
 		rtw89_btc_ntfy_role_info(rtwdev, rtwvif_link, rtwsta_link,
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 8e93cf1e5a5a..657ed471bbb1 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -4553,6 +4553,12 @@ enum rtw89_dig_noisy_level {
 	RTW89_DIG_NOISY_LEVEL_MAX = 3,
 };
 
+#define RTW89_DTP_RSSI_TH -23 /* dBm */
+#define RTW89_DTP_TX_PWR_CAP 3 /* dBm */
+#define RTW89_DTP_FLOOR_UP_GAP 3 /* dB */
+#define RTW89_DTP_THERMAL_GAP 2 /* in unit of thermal value */
+#define RTW89_DTP_NHM_FAIL_MAX 3 /* consecutive invalid samples */
+
 enum rtw89_gi_ltf {
 	RTW89_GILTF_LGI_4XHE32 = 0,
 	RTW89_GILTF_SGI_4XHE08 = 1,
@@ -4738,6 +4744,8 @@ struct rtw89_sta_link {
 	u32 ampdu_max_time:4;
 	bool cctl_tx_retry_limit;
 	u32 data_tx_cnt_lmt:6;
+
+	bool dtp_enabled;
 };
 
 #define RTW89_EFUSE_SN_LEN 5
@@ -5832,6 +5840,7 @@ struct rtw89_chip_info {
 	u8 wde_qempty_mgq_grpsel;
 	u32 rf_base_addr[2];
 	u8 thermal_th[2];
+	u8 dtp_thermal_th;
 	u8 support_macid_num;
 	u8 support_link_num;
 	u8 support_chanctx_num;
@@ -6477,6 +6486,13 @@ struct rtw89_chanctx {
 	struct rtw89_chanctx_cfg *cfg;
 };
 
+struct rtw89_dtp_info {
+	bool is_noisy;
+	u8 nhm_fail_cnt;
+	bool bb_wrap_en;
+	bool bb_wrap_valid;
+};
+
 struct rtw89_edcca_bak {
 	u8 a;
 	u8 p;
@@ -6494,6 +6510,7 @@ enum rtw89_dm_type {
 	RTW89_DM_DIG_PD,
 	RTW89_DM_VCORE,
 	RTW89_DM_REGD_LEARN,
+	RTW89_DM_DTP,
 };
 
 #define RTW89_THERMAL_PROT_LV_MAX 5
@@ -6575,6 +6592,7 @@ enum rtw89_flags {
 	RTW89_FLAG_UNPLUGGED,
 	RTW89_FLAG_SHUTDOWN,
 	RTW89_FLAG_REGD_LEARNING,
+	RTW89_FLAG_DTP_EN,
 
 	NUM_OF_RTW89_FLAGS,
 };
@@ -7242,6 +7260,8 @@ struct rtw89_env_monitor_info {
 	u32 nhm_mntr_time;
 	u16 nhm_result[RTW89_NHM_RPT_NUM];
 	u8 nhm_th[RTW89_NHM_RPT_NUM];
+	u8 nhm_ratio;
+	bool nhm_bg_ongoing;
 	struct rtw89_nhm_report *nhm_his[RTW89_BAND_NUM];
 	struct list_head nhm_rpt_list;
 	u8 edcca_clm_ratio;
@@ -7805,6 +7825,7 @@ struct rtw89_dev {
 		struct rtw89_tx_stat_info tx_stat;
 		struct rtw89_diag_bb diag;
 		struct rtw89_phy_path_diff path_diff;
+		struct rtw89_dtp_info dtp;
 	} bbs[RTW89_PHY_NUM];
 
 	struct wiphy_delayed_work track_work;
@@ -8949,6 +8970,11 @@ static inline void rtw89_chip_rfk_init_late(struct rtw89_dev *rtwdev)
 		chip->ops->rfk_init_late(rtwdev);
 }
 
+static inline bool rtw89_chip_support_dtp(struct rtw89_dev *rtwdev)
+{
+	return rtwdev->chip->dtp_thermal_th;
+}
+
 static inline void rtw89_chip_rfk_band_changed(struct rtw89_dev *rtwdev,
 					       enum rtw89_phy_idx phy_idx,
 					       const struct rtw89_chan *chan)
diff --git a/drivers/net/wireless/realtek/rtw89/debug.c b/drivers/net/wireless/realtek/rtw89/debug.c
index 9d680360a89b..b129341e71cd 100644
--- a/drivers/net/wireless/realtek/rtw89/debug.c
+++ b/drivers/net/wireless/realtek/rtw89/debug.c
@@ -4778,6 +4778,7 @@ static const struct rtw89_disabled_dm_info {
 	DM_INFO(DIG_PD),
 	DM_INFO(VCORE),
 	DM_INFO(REGD_LEARN),
+	DM_INFO(DTP),
 };
 
 static ssize_t
diff --git a/drivers/net/wireless/realtek/rtw89/phy.c b/drivers/net/wireless/realtek/rtw89/phy.c
index 3697cd60f6be..9a7e032f7c8b 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.c
+++ b/drivers/net/wireless/realtek/rtw89/phy.c
@@ -5846,6 +5846,211 @@ static void rtw89_phy_thermal_protect(struct rtw89_dev *rtwdev)
 	rtw89_fw_h2c_tx_duty(rtwdev, hal->thermal_prot_lv);
 }
 
+static void rtw89_phy_dtp_update_is_noisy(struct rtw89_dev *rtwdev,
+					  struct rtw89_bb_ctx *bb)
+{
+	struct rtw89_env_monitor_info *env = &bb->env_monitor;
+	bool was_noisy = bb->dtp.is_noisy;
+	u8 noisy_th = RTW89_NHM_RATIO_TH;
+
+	if (env->nhm_ratio == RTW89_NHM_RATIO_FAIL) {
+		if (bb->dtp.nhm_fail_cnt < RTW89_DTP_NHM_FAIL_MAX)
+			bb->dtp.nhm_fail_cnt++;
+		else
+			bb->dtp.is_noisy = false;
+
+		rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+			    "NHM phy %u no valid ratio (%u), noisy %d -> %d\n",
+			    bb->phy_idx, bb->dtp.nhm_fail_cnt, was_noisy,
+			    bb->dtp.is_noisy);
+		return;
+	}
+
+	bb->dtp.nhm_fail_cnt = 0;
+
+	if (was_noisy)
+		noisy_th -= RTW89_NHM_RATIO_TH_GAP;
+
+	bb->dtp.is_noisy = env->nhm_ratio >= noisy_th;
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+		    "NHM phy %u ratio=%u threshold=%u noisy %d -> %d\n",
+		    bb->phy_idx, env->nhm_ratio, noisy_th,
+		    was_noisy, bb->dtp.is_noisy);
+}
+
+static bool rtw89_phy_dtp_enable_check(struct rtw89_dev *rtwdev, s8 rssi_dbm,
+				       bool cur_enabled)
+{
+	s8 rssi_th = RTW89_DTP_RSSI_TH;
+
+	if (cur_enabled)
+		rssi_th -= RTW89_DTP_FLOOR_UP_GAP;
+
+	return rssi_dbm >= rssi_th;
+}
+
+void rtw89_phy_dtp_set_pwr_ctrl(struct rtw89_dev *rtwdev, u8 mac_id,
+				bool enable_pwrctrl)
+{
+	s8 dbm = enable_pwrctrl ? RTW89_DTP_TX_PWR_CAP : 0;
+
+	rtw89_phy_bb_wrap_dtp_set_pwr_ctrl(rtwdev, mac_id, enable_pwrctrl, dbm);
+}
+
+static void __rtw89_phy_dtp_track(struct rtw89_dev *rtwdev,
+				  struct rtw89_sta_link *rtwsta_link)
+{
+	s8 rssi_dbm = RTW89_RSSI_RAW_TO_DBM(ewma_rssi_read(&rtwsta_link->avg_rssi));
+	struct rtw89_vif_link *rtwvif_link = rtwsta_link->rtwvif_link;
+	struct rtw89_bb_ctx *bb = rtw89_get_bb_ctx(rtwdev, rtwvif_link->phy_idx);
+	bool enabled;
+
+	if (bb->dtp.is_noisy || bb->dtp.nhm_fail_cnt >= RTW89_DTP_NHM_FAIL_MAX)
+		enabled = false;
+	else
+		enabled = rtw89_phy_dtp_enable_check(rtwdev, rssi_dbm,
+						     rtwsta_link->dtp_enabled);
+
+	if (enabled == rtwsta_link->dtp_enabled)
+		return;
+
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+		    "mac_id %u dtp_enabled %d -> %d (rssi %d dBm)\n",
+		    rtwsta_link->mac_id, rtwsta_link->dtp_enabled, enabled, rssi_dbm);
+
+	rtw89_phy_dtp_set_pwr_ctrl(rtwdev, rtwsta_link->mac_id, enabled);
+	rtwsta_link->dtp_enabled = enabled;
+}
+
+static void __rtw89_phy_dtp_reset(struct rtw89_dev *rtwdev,
+				  struct rtw89_sta_link *rtwsta_link)
+{
+	if (!rtwsta_link->dtp_enabled)
+		return;
+
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "mac_id %u dtp_enabled 1 -> 0 (reset)\n",
+		    rtwsta_link->mac_id);
+
+	rtw89_phy_dtp_set_pwr_ctrl(rtwdev, rtwsta_link->mac_id, false);
+	rtwsta_link->dtp_enabled = false;
+}
+
+static void rtw89_phy_dtp_reset(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_sta_link *rtwsta_link;
+	struct ieee80211_sta *sta;
+	struct rtw89_sta *rtwsta;
+	unsigned int link_id;
+
+	for_each_station(sta, rtwdev->hw) {
+		rtwsta = sta_to_rtwsta(sta);
+
+		rtw89_sta_for_each_link(rtwsta, rtwsta_link, link_id)
+			__rtw89_phy_dtp_reset(rtwdev, rtwsta_link);
+	}
+}
+
+static void rtw89_phy_dtp_bb_wrap_update(struct rtw89_dev *rtwdev,
+					 struct rtw89_bb_ctx *bb, bool en)
+{
+	struct rtw89_dtp_info *dtp = &bb->dtp;
+
+	if (rtw89_phy_bb_wrap_dtp_en(rtwdev, bb->phy_idx, en)) {
+		dtp->bb_wrap_valid = false;
+		rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+			    "BB wrap phy %u en=%d not synced; retry later\n",
+			    bb->phy_idx, en);
+		return;
+	}
+
+	dtp->bb_wrap_valid = true;
+	dtp->bb_wrap_en = en;
+}
+
+static void rtw89_phy_dtp_bb_wrap_sync(struct rtw89_dev *rtwdev, bool enable)
+{
+	struct rtw89_bb_ctx *bb;
+
+	rtw89_for_each_active_bb(rtwdev, bb) {
+		if (bb->dtp.bb_wrap_valid && bb->dtp.bb_wrap_en == enable)
+			continue;
+
+		rtw89_phy_dtp_bb_wrap_update(rtwdev, bb, enable);
+	}
+}
+
+static void rtw89_phy_dtp_init(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_bb_ctx *bb;
+
+	if (!rtw89_chip_support_dtp(rtwdev))
+		return;
+
+	clear_bit(RTW89_FLAG_DTP_EN, rtwdev->flags);
+
+	rtw89_for_each_capab_bb(rtwdev, bb)
+		rtw89_phy_dtp_bb_wrap_update(rtwdev, bb, false);
+
+	rtw89_phy_dtp_reset(rtwdev);
+}
+
+static void rtw89_phy_dtp_enable(struct rtw89_dev *rtwdev, bool enable)
+{
+	rtw89_phy_dtp_bb_wrap_sync(rtwdev, enable);
+
+	if (test_bit(RTW89_FLAG_DTP_EN, rtwdev->flags) == enable)
+		return;
+
+	assign_bit(RTW89_FLAG_DTP_EN, rtwdev->flags, enable);
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR, "dtp protection en=%d\n", enable);
+
+	if (!enable)
+		rtw89_phy_dtp_reset(rtwdev);
+}
+
+static void rtw89_phy_thermal_protect_dtp(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_phy_stat *phystat = &rtwdev->phystat;
+	bool en;
+
+	if (!rtw89_chip_support_dtp(rtwdev))
+		return;
+
+	if (rtwdev->hal.disabled_dm_bitmap & BIT(RTW89_DM_DTP)) {
+		rtw89_phy_dtp_enable(rtwdev, false);
+		return;
+	}
+
+	if (test_bit(RTW89_FLAG_DTP_EN, rtwdev->flags))
+		en = phystat->last_thermal_max >=
+		     rtwdev->chip->dtp_thermal_th - RTW89_DTP_THERMAL_GAP;
+	else
+		en = phystat->last_thermal_max > rtwdev->chip->dtp_thermal_th;
+
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK, "dtp thermal: sensor=%u th=%u en=%d\n",
+		    phystat->last_thermal_max, rtwdev->chip->dtp_thermal_th, en);
+
+	rtw89_phy_dtp_enable(rtwdev, en);
+}
+
+void rtw89_phy_dtp_track(struct rtw89_dev *rtwdev)
+{
+	struct rtw89_sta_link *rtwsta_link;
+	struct ieee80211_sta *sta;
+	struct rtw89_sta *rtwsta;
+	unsigned int link_id;
+
+	if (!test_bit(RTW89_FLAG_DTP_EN, rtwdev->flags))
+		return;
+
+	for_each_station(sta, rtwdev->hw) {
+		rtwsta = sta_to_rtwsta(sta);
+
+		rtw89_sta_for_each_link(rtwsta, rtwsta_link, link_id)
+			__rtw89_phy_dtp_track(rtwdev, rtwsta_link);
+	}
+}
+
 static void rtw89_phy_stat_thermal_update(struct rtw89_dev *rtwdev)
 {
 	struct rtw89_phy_stat *phystat = &rtwdev->phystat;
@@ -6291,6 +6496,7 @@ void rtw89_phy_stat_track(struct rtw89_dev *rtwdev)
 	rtw89_phy_stat_thermal_update(rtwdev);
 	rtw89_phy_thermal_protect_vcore(rtwdev);
 	rtw89_phy_thermal_protect(rtwdev);
+	rtw89_phy_thermal_protect_dtp(rtwdev);
 	rtw89_phy_stat_rssi_update(rtwdev);
 	rtw89_phy_stat_update(rtwdev);
 
@@ -6495,9 +6701,28 @@ static void __rtw89_phy_nhm_setting_init(struct rtw89_dev *rtwdev,
 	env->nhm_mntr_time = 0;
 	env->nhm_sum = 0;
 
+	if (rtw89_chip_support_dtp(rtwdev)) {
+		env->nhm_ratio = RTW89_NHM_RATIO_FAIL;
+		env->nhm_bg_ongoing = false;
+		bb->dtp.is_noisy = false;
+		bb->dtp.nhm_fail_cnt = 0;
+
+		/* Force the first background measurement to exclude CCA. */
+		env->nhm_include_cca = true;
+
+		if (ccx->nhm_filter)
+			rtw89_phy_write32_idx(rtwdev, ccx->nhm_filter,
+					      ccx->nhm_filter_mask, 0, bb->phy_idx);
+	}
+
 	rtw89_phy_write32_idx_set(rtwdev, ccx->nhm_config, ccx->nhm_en_mask, bb->phy_idx);
-	rtw89_phy_write32_idx_set(rtwdev, ccx->nhm_method, ccx->nhm_pwr_method_msk,
-				  bb->phy_idx);
+
+	if (rtw89_chip_support_dtp(rtwdev))
+		rtw89_phy_write32_idx(rtwdev, ccx->nhm_method,
+				      ccx->nhm_pwr_method_msk, 1, bb->phy_idx);
+	else
+		rtw89_phy_write32_idx_set(rtwdev, ccx->nhm_method,
+					  ccx->nhm_pwr_method_msk, bb->phy_idx);
 }
 
 void rtw89_phy_nhm_setting_init(struct rtw89_dev *rtwdev)
@@ -6706,25 +6931,23 @@ static u8 rtw89_nhm_weighted_avg(struct rtw89_dev *rtwdev, struct rtw89_bb_ctx *
 	return (nhm_weighted_sum / env->nhm_sum) >> RTW89_NHM_TH_FACTOR;
 }
 
-static void __rtw89_phy_nhm_get_result(struct rtw89_dev *rtwdev,
-				       struct rtw89_bb_ctx *bb, enum rtw89_band hw_band,
-				       u16 ch_hw_value)
+static bool __rtw89_phy_nhm_read_result(struct rtw89_dev *rtwdev,
+					struct rtw89_bb_ctx *bb)
 {
 	const struct rtw89_phy_gen_def *phy = rtwdev->chip->phy_def;
 	struct rtw89_env_monitor_info *env = &bb->env_monitor;
 	const struct rtw89_chip_info *chip = rtwdev->chip;
 	const struct rtw89_ccx_regs *ccx = phy->ccx;
-	struct ieee80211_supported_band *sband;
 	const struct rtw89_reg_def *nhm_rpt;
-	enum nl80211_band band;
 	u32 sum = 0;
-	u8 chan_idx;
-	u8 nhm_pwr;
 	u8 i;
 
 	if (!rtw89_phy_read32_idx(rtwdev, ccx->nhm, ccx->nhm_ready, bb->phy_idx)) {
 		rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,  "[NHM] Get NHM report Fail\n");
-		return;
+		if (rtw89_chip_support_dtp(rtwdev))
+			rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+				    "NHM phy %u report not ready\n", bb->phy_idx);
+		return false;
 	}
 
 	for (i = 0; i < RTW89_NHM_RPT_NUM; i++) {
@@ -6736,6 +6959,38 @@ static void __rtw89_phy_nhm_get_result(struct rtw89_dev *rtwdev,
 		sum += env->nhm_result[i];
 	}
 	env->nhm_sum = sum;
+
+	if (!rtw89_chip_support_dtp(rtwdev) ||
+	    !rtw89_debug_is_enabled(rtwdev, RTW89_DBG_PHY_TRACK))
+		return true;
+
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+		    "NHM phy %u bins 0-5: %u,%u,%u,%u,%u,%u\n",
+		    bb->phy_idx, env->nhm_result[0], env->nhm_result[1],
+		    env->nhm_result[2], env->nhm_result[3],
+		    env->nhm_result[4], env->nhm_result[5]);
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+		    "NHM phy %u bins 6-11: %u,%u,%u,%u,%u,%u\n",
+		    bb->phy_idx, env->nhm_result[6], env->nhm_result[7],
+		    env->nhm_result[8], env->nhm_result[9],
+		    env->nhm_result[10], env->nhm_result[11]);
+
+	return true;
+}
+
+static void __rtw89_phy_nhm_get_result(struct rtw89_dev *rtwdev,
+				       struct rtw89_bb_ctx *bb, enum rtw89_band hw_band,
+				       u16 ch_hw_value)
+{
+	struct rtw89_env_monitor_info *env = &bb->env_monitor;
+	struct ieee80211_supported_band *sband;
+	enum nl80211_band band;
+	u8 chan_idx;
+	u8 nhm_pwr;
+
+	if (!__rtw89_phy_nhm_read_result(rtwdev, bb))
+		return;
+
 	nhm_pwr = rtw89_nhm_weighted_avg(rtwdev, bb);
 
 	if (!ch_hw_value)
@@ -6962,7 +7217,7 @@ static int rtw89_phy_nhm_set(struct rtw89_dev *rtwdev,
 		rtw89_phy_write32_idx(rtwdev, ccx->nhm_config,
 				      ccx->nhm_period_mask, period, bb->phy_idx);
 		rtw89_phy_write32_idx(rtwdev, ccx->nhm_config,
-				      ccx->nhm_unit_mask, period, bb->phy_idx);
+				      ccx->nhm_unit_mask, unit_idx, bb->phy_idx);
 
 		env->nhm_mntr_time = para->mntr_time;
 		env->ccx_period = period;
@@ -6982,6 +7237,62 @@ static int rtw89_phy_nhm_set(struct rtw89_dev *rtwdev,
 	return 0;
 }
 
+static u8 rtw89_phy_nhm_get_ratio(struct rtw89_dev *rtwdev,
+				  struct rtw89_bb_ctx *bb)
+{
+	struct rtw89_env_monitor_info *env = &bb->env_monitor;
+	struct rtw89_entity_conf conf;
+	const struct rtw89_chan *chan;
+	u8 first_idx = RTW89_NHM_RPT_NUM;
+	u32 non_noise = env->nhm_sum;
+	u16 period = env->ccx_period;
+	u8 noise_th;
+	u8 weight;
+	u8 ratio;
+	u8 i;
+
+	if (!period || env->nhm_sum > period) {
+		rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+			    "NHM phy %u invalid period=%u sum=%u\n",
+			    bb->phy_idx, period, env->nhm_sum);
+		return RTW89_NHM_RATIO_FAIL;
+	}
+
+	rtw89_entity_get_conf(rtwdev, &conf);
+	chan = conf.chans[bb->phy_idx];
+
+	noise_th = chan->band_width == RTW89_CHANNEL_WIDTH_160 ||
+		   chan->band_width == RTW89_CHANNEL_WIDTH_80_80 ? 70 : 60;
+
+	/* Exclude the first low-power cluster (up to three bins). */
+	for (i = 0; i < RTW89_NHM_RPT_NUM; i++) {
+		if (first_idx == RTW89_NHM_RPT_NUM &&
+		    DIV_ROUND_CLOSEST((u32)env->nhm_result[i] * 100, period))
+			first_idx = i;
+
+		if (i == 0)
+			weight = env->nhm_th[0] - RTW89_NHM_WEIGHT_OFFSET;
+		else if (i == RTW89_NHM_RPT_NUM - 1)
+			weight = env->nhm_th[i - 1] + RTW89_NHM_WEIGHT_OFFSET;
+		else
+			weight = (env->nhm_th[i - 1] + env->nhm_th[i]) / 2;
+
+		if (i < first_idx + 3 && weight <= noise_th)
+			non_noise -= env->nhm_result[i];
+	}
+
+	ratio = DIV_ROUND_CLOSEST(non_noise * 100, period);
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+		    "NHM phy %u bw=%u period=%u sum=%u first=%u floor=%u\n",
+		    bb->phy_idx, chan->band_width, period, env->nhm_sum,
+		    first_idx, noise_th);
+	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+		    "NHM phy %u non_noise=%u ratio=%u\n",
+		    bb->phy_idx, non_noise, ratio);
+
+	return ratio;
+}
+
 static void __rtw89_phy_nhm_trigger(struct rtw89_dev *rtwdev, struct rtw89_bb_ctx *bb)
 {
 	struct rtw89_ccx_para_info para = {
@@ -7062,6 +7373,15 @@ static void __rtw89_phy_env_monitor_track(struct rtw89_dev *rtwdev,
 
 	env->ccx_watchdog_result = RTW89_PHY_ENV_MON_CCX_FAIL;
 	if (env->ccx_manual_ctrl) {
+		if (rtw89_chip_support_dtp(rtwdev)) {
+			env->nhm_bg_ongoing = false;
+			env->nhm_ratio = RTW89_NHM_RATIO_FAIL;
+			rtw89_phy_dtp_update_is_noisy(rtwdev, bb);
+
+			rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+				    "NHM phy %u suspended by manual CCX control\n",
+				    bb->phy_idx);
+		}
 		rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
 			    "CCX in manual ctrl\n");
 		return;
@@ -7077,6 +7397,22 @@ static void __rtw89_phy_env_monitor_track(struct rtw89_dev *rtwdev,
 	if (rtw89_phy_edcca_clm_get_result(rtwdev, bb))
 		env->ccx_watchdog_result |= RTW89_PHY_ENV_MON_EDCCA_CLM;
 
+	if (rtw89_chip_support_dtp(rtwdev)) {
+		if (!env->nhm_bg_ongoing)
+			rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+				    "NHM phy %u no background sample\n", bb->phy_idx);
+		if (env->nhm_bg_ongoing && __rtw89_phy_nhm_read_result(rtwdev, bb)) {
+			env->nhm_ratio = rtw89_phy_nhm_get_ratio(rtwdev, bb);
+			if (env->nhm_ratio != RTW89_NHM_RATIO_FAIL)
+				env->ccx_watchdog_result |= RTW89_PHY_ENV_MON_NHM;
+		} else {
+			env->nhm_ratio = RTW89_NHM_RATIO_FAIL;
+		}
+
+		env->nhm_bg_ongoing = false;
+		rtw89_phy_dtp_update_is_noisy(rtwdev, bb);
+	}
+
 	rtw89_phy_ccx_racing_release(rtwdev, bb);
 	para.mntr_time = 1900;
 	para.rac_lv = RTW89_RAC_LV_1;
@@ -7084,6 +7420,18 @@ static void __rtw89_phy_env_monitor_track(struct rtw89_dev *rtwdev,
 
 	if (rtw89_phy_ifs_clm_set(rtwdev, bb, &para) == 0)
 		chk_result |= RTW89_PHY_ENV_MON_IFS_CLM;
+
+	if (rtw89_chip_support_dtp(rtwdev)) {
+		if (!rtw89_phy_nhm_set(rtwdev, bb, &para))
+			chk_result |= RTW89_PHY_ENV_MON_NHM;
+
+		env->nhm_bg_ongoing = !!(chk_result & RTW89_PHY_ENV_MON_NHM);
+		rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,
+			    "NHM phy %u armed=%d period=%u unit=%u include_cca=%d\n",
+			    bb->phy_idx, env->nhm_bg_ongoing, env->ccx_period,
+			    env->ccx_unit_idx, env->nhm_include_cca);
+	}
+
 	if (chk_result)
 		rtw89_phy_ccx_trigger(rtwdev, bb, chk_result);
 
@@ -8217,6 +8565,9 @@ static void __rtw89_phy_env_monitor_init(struct rtw89_dev *rtwdev,
 
 	rtw89_phy_ccx_top_setting_init(rtwdev, bb);
 	rtw89_phy_ifs_clm_setting_init(rtwdev, bb);
+
+	if (rtw89_chip_support_dtp(rtwdev))
+		__rtw89_phy_nhm_setting_init(rtwdev, bb);
 }
 
 static void rtw89_phy_env_monitor_init(struct rtw89_dev *rtwdev)
@@ -8283,6 +8634,7 @@ void rtw89_phy_dm_init(struct rtw89_dev *rtwdev)
 	rtw89_phy_cfo_init(rtwdev);
 	rtw89_phy_bb_wrap_init(rtwdev);
 	rtw89_phy_edcca_init(rtwdev);
+	rtw89_phy_dtp_init(rtwdev);
 	rtw89_phy_ch_info_init(rtwdev);
 	rtw89_phy_ul_tb_info_init(rtwdev);
 	rtw89_phy_antdiv_init(rtwdev);
@@ -9035,6 +9387,8 @@ static const struct rtw89_ccx_regs rtw89_ccx_regs_ax = {
 	.nhm_en_mask = B_NHM_EN_MSK,
 	.nhm_method = R_NHM_TH9,
 	.nhm_pwr_method_msk = B_NHM_PWDB_METHOD_MSK,
+	.nhm_filter = 0,
+	.nhm_filter_mask = 0,
 	.edcca_clm_rdy = R_CLM_EDCCA_RDY,
 	.edcca_clm_rdy_mask = B_CLM_EDCCA_RDY,
 	.edcca_clm_cnt = R_CLM_EDCCA_RESULT,
diff --git a/drivers/net/wireless/realtek/rtw89/phy.h b/drivers/net/wireless/realtek/rtw89/phy.h
index 84eb1defaaf2..c290aea51937 100644
--- a/drivers/net/wireless/realtek/rtw89/phy.h
+++ b/drivers/net/wireless/realtek/rtw89/phy.h
@@ -223,6 +223,9 @@ enum rtw89_env_monitor_result_level {
 #define RTW89_NOISE_DEFAULT -96
 #define RTW89_NHM_MNTR_TIME 40
 #define RTW89_NHM_TH_FACTOR 1
+#define RTW89_NHM_RATIO_TH 2
+#define RTW89_NHM_RATIO_TH_GAP 1
+#define RTW89_NHM_RATIO_FAIL U8_MAX
 
 #define CCX_US_BASE_RATIO 4
 enum rtw89_ccx_unit {
@@ -455,6 +458,8 @@ struct rtw89_ccx_regs {
 	u32 nhm_en_mask;
 	u32 nhm_method;
 	u32 nhm_pwr_method_msk;
+	u32 nhm_filter;
+	u32 nhm_filter_mask;
 	u32 edcca_clm_rdy;
 	u32 edcca_clm_rdy_mask;
 	u32 edcca_clm_cnt;
@@ -1254,6 +1259,13 @@ void rtw89_phy_config_edcca(struct rtw89_dev *rtwdev,
 			    struct rtw89_bb_ctx *bb, bool scan);
 void rtw89_phy_edcca_track(struct rtw89_dev *rtwdev);
 void rtw89_phy_edcca_thre_calc(struct rtw89_dev *rtwdev, struct rtw89_bb_ctx *bb);
+void rtw89_phy_dtp_track(struct rtw89_dev *rtwdev);
+void rtw89_phy_dtp_set_pwr_ctrl(struct rtw89_dev *rtwdev, u8 mac_id,
+				bool enable_pwrctrl);
+int rtw89_phy_bb_wrap_dtp_en(struct rtw89_dev *rtwdev,
+			     enum rtw89_phy_idx phy_idx, bool en);
+void rtw89_phy_bb_wrap_dtp_set_pwr_ctrl(struct rtw89_dev *rtwdev, u8 mac_id,
+					bool en, s8 dbm);
 enum rtw89_rf_path_bit rtw89_phy_get_kpath(struct rtw89_dev *rtwdev,
 					   enum rtw89_phy_idx phy_idx);
 enum rtw89_rf_path rtw89_phy_get_syn_sel(struct rtw89_dev *rtwdev,
diff --git a/drivers/net/wireless/realtek/rtw89/phy_be.c b/drivers/net/wireless/realtek/rtw89/phy_be.c
index 0571e18f69c8..a9ea15556b10 100644
--- a/drivers/net/wireless/realtek/rtw89/phy_be.c
+++ b/drivers/net/wireless/realtek/rtw89/phy_be.c
@@ -74,6 +74,8 @@ static const struct rtw89_ccx_regs rtw89_ccx_regs_be = {
 	.nhm_en_mask = B_NHM_EN_MSK,
 	.nhm_method = R_NHM_TH9,
 	.nhm_pwr_method_msk = B_NHM_PWDB_METHOD_MSK,
+	.nhm_filter = 0,
+	.nhm_filter_mask = 0,
 	.edcca_clm_rdy = R_CLM_EDCCA_RDY_V1,
 	.edcca_clm_rdy_mask = B_CLM_EDCCA_RDY,
 	.edcca_clm_cnt = R_CLM_EDCCA_RESULT_V1,
@@ -137,6 +139,17 @@ static const struct rtw89_ccx_regs rtw89_ccx_regs_be_v1 = {
 	.ifs_total_addr = R_IFS_TOTAL_BE4,
 	.ifs_cnt_done_mask = B_IFS_CNT_DONE_BE4,
 	.ifs_total_mask = B_IFS_TOTAL_BE4,
+	.nhm = R_NHM_BE4,
+	.nhm_ready = B_NHM_READY_BE_MSK,
+	.nhm_config = R_NHM_CFG_BE4,
+	.nhm_period_mask = B_NHM_PERIOD_MSK,
+	.nhm_unit_mask = B_NHM_COUNTER_MSK,
+	.nhm_include_cca_mask = B_NHM_INCLUDE_CCA_MSK,
+	.nhm_en_mask = B_NHM_EN_MSK,
+	.nhm_method = R_NHM_TH9_BE4,
+	.nhm_pwr_method_msk = B_NHM_PWDB_METHOD_MSK,
+	.nhm_filter = R_NHM_FILTER_BE4,
+	.nhm_filter_mask = B_NHM_RSSI_TH_EN_BE4 | B_NHM_NAV_EN_BE4,
 	.edcca_clm_rdy = R_CLM_EDCCA_RDY_BE4,
 	.edcca_clm_rdy_mask = B_CLM_EDCCA_RDY,
 	.edcca_clm_cnt = R_CLM_EDCCA_RESULT_BE4,
@@ -559,6 +572,71 @@ void rtw89_phy_bb_wrap_pwr_by_macid_init(struct rtw89_dev *rtwdev)
 	}
 }
 
+int rtw89_phy_bb_wrap_dtp_en(struct rtw89_dev *rtwdev,
+			     enum rtw89_phy_idx phy_idx, bool en)
+{
+	u32 addr, val;
+	int ret;
+
+	ret = rtw89_mac_txpwr_write32_mask(rtwdev, phy_idx,
+					   R_BE_PWR_MACID_CTRL_BE4,
+					   B_BE_PWR_BY_MACID_EN_BE4, en);
+	if (!rtw89_debug_is_enabled(rtwdev, RTW89_DBG_TXPWR))
+		return ret;
+
+	addr = rtw89_mac_reg_by_idx(rtwdev, R_BE_PWR_MACID_CTRL_BE4, phy_idx);
+	if (ret) {
+		rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+			    "BB wrap phy %u en=%d addr=0x%x write failed: %d\n",
+			    phy_idx, en, addr, ret);
+		return ret;
+	}
+
+	val = rtw89_read32(rtwdev, addr);
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+		    "BB wrap phy %u en=%d addr=0x%x readback=0x%08x (en=%d)\n",
+		    phy_idx, en, addr, val, !!(val & B_BE_PWR_BY_MACID_EN_BE4));
+
+	return 0;
+}
+
+void rtw89_phy_bb_wrap_dtp_set_pwr_ctrl(struct rtw89_dev *rtwdev, u8 mac_id,
+					bool en, s8 dbm)
+{
+	const struct rtw89_bb_wrap_regs *bb_wrap = rtwdev->chip->phy_def->bb_wrap;
+	u32 addr, val, old, readback;
+	u8 pwr;
+
+	if (mac_id >= rtwdev->chip->support_macid_num) {
+		rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+			    "BB wrap invalid macid %u\n", mac_id);
+		return;
+	}
+
+	addr = bb_wrap->pwr_macid_lmt + mac_id * 4;
+	val = rtw89_read32(rtwdev, addr);
+	old = val;
+	pwr = en ? clamp_t(s8, dbm, -64, 63) * 2 : 0; /* S(8,1) */
+	val = u32_replace_bits(val, pwr, B_BE_PWR_MACID_LMT0);
+	val = u32_replace_bits(val, pwr, B_BE_PWR_MACID_LMT1);
+	if (en)
+		val |= B_BE_PWR_MACID_LMT0_EN | B_BE_PWR_MACID_LMT1_EN;
+	else
+		val &= ~(B_BE_PWR_MACID_LMT0_EN | B_BE_PWR_MACID_LMT1_EN);
+
+	rtw89_write_bb_wrap_flush(rtwdev, addr, val);
+	if (!rtw89_debug_is_enabled(rtwdev, RTW89_DBG_TXPWR))
+		return;
+
+	readback = rtw89_read32(rtwdev, addr);
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+		    "BB wrap macid %u en=%d dbm=%d raw=%u addr=0x%x\n",
+		    mac_id, en, dbm, pwr, addr);
+	rtw89_debug(rtwdev, RTW89_DBG_TXPWR,
+		    "BB wrap macid %u old=0x%08x write=0x%08x readback=0x%08x\n",
+		    mac_id, old, val, readback);
+}
+
 static
 void rtw89_phy_bb_wrap_tx_path_by_macid_init(struct rtw89_dev *rtwdev)
 {
diff --git a/drivers/net/wireless/realtek/rtw89/reg.h b/drivers/net/wireless/realtek/rtw89/reg.h
index fc71d8d87b57..cc7fb2471049 100644
--- a/drivers/net/wireless/realtek/rtw89/reg.h
+++ b/drivers/net/wireless/realtek/rtw89/reg.h
@@ -6570,6 +6570,10 @@
 #define R_BE_PWR_MACID_PATH_BASE_V1 0x1C000
 #define R_BE_PWR_MACID_LMT_BASE 0x0ED00
 #define R_BE_PWR_MACID_LMT_BASE_V1 0x1C800
+#define B_BE_PWR_MACID_LMT0 GENMASK(7, 0)
+#define B_BE_PWR_MACID_LMT1 GENMASK(15, 8)
+#define B_BE_PWR_MACID_LMT0_EN BIT(24)
+#define B_BE_PWR_MACID_LMT1_EN BIT(25)
 
 #define R_BE_CMAC_FUNC_EN 0x10000
 #define R_BE_CMAC_FUNC_EN_C1 0x14000
@@ -8512,6 +8516,9 @@
 #define B_BE_PWR_BT_VAL GENMASK(8, 0)
 #define B_BE_PWR_FORCE_COEX_ON GENMASK(29, 27)
 
+#define R_BE_PWR_MACID_CTRL_BE4 0x11A58
+#define B_BE_PWR_BY_MACID_EN_BE4 BIT(13)
+
 #define R_PWR_BOOST_BE4 0x11A64
 #define B_PWR_BOOST_BE4 BIT(8)
 
@@ -8990,25 +8997,32 @@
 #define B_CCX_TRIG_OPT_MSK BIT(1)
 #define B_CCX_EN_MSK BIT(0)
 #define R_NHM_CFG 0x0C08
+#define R_NHM_CFG_BE4 0x20C08
 #define B_NHM_PERIOD_MSK GENMASK(15, 0)
 #define B_NHM_COUNTER_MSK GENMASK(17, 16)
 #define B_NHM_EN_MSK BIT(18)
 #define B_NHM_INCLUDE_CCA_MSK BIT(19)
 #define B_NHM_TH0_MSK GENMASK(31, 24)
 #define R_NHM_TH1 0x0C0C
+#define R_NHM_TH1_BE4 0x20C0C
 #define B_NHM_TH1_MSK GENMASK(7, 0)
 #define B_NHM_TH2_MSK GENMASK(15, 8)
 #define B_NHM_TH3_MSK GENMASK(23, 16)
 #define B_NHM_TH4_MSK GENMASK(31, 24)
 #define R_NHM_TH5 0x0C10
+#define R_NHM_TH5_BE4 0x20C10
 #define B_NHM_TH5_MSK GENMASK(7, 0)
 #define B_NHM_TH6_MSK GENMASK(15, 8)
 #define B_NHM_TH7_MSK GENMASK(23, 16)
 #define B_NHM_TH8_MSK GENMASK(31, 24)
 #define R_NHM_TH9 0x0C14
+#define R_NHM_TH9_BE4 0x20C14
 #define B_NHM_TH9_MSK GENMASK(7, 0)
 #define B_NHM_TH10_MSK GENMASK(15, 8)
 #define B_NHM_PWDB_METHOD_MSK GENMASK(17, 16)
+#define R_NHM_FILTER_BE4 0x20C80
+#define B_NHM_RSSI_TH_EN_BE4 BIT(4)
+#define B_NHM_NAV_EN_BE4 BIT(5)
 #define R_FAHM 0x0C1C
 #define B_RXTD_CKEN BIT(2)
 #define R_IFS_COUNTER 0x0C28
@@ -9244,24 +9258,31 @@
 #define B_CNT_AMPDU_RX_CRC32_OK GENMASK(15, 0)
 #define B_CNT_AMPDU_RX_CRC32_ERR GENMASK(31, 16)
 #define R_NHM_CNT0 0x1A88
+#define R_NHM_CNT0_BE4 0x20E88
 #define B_NHM_CNT0_MSK GENMASK(15, 0)
 #define B_NHM_CNT1_MSK GENMASK(31, 16)
 #define R_NHM_CNT2 0x1A8C
+#define R_NHM_CNT2_BE4 0x20E8C
 #define B_NHM_CNT2_MSK GENMASK(15, 0)
 #define B_NHM_CNT3_MSK GENMASK(31, 16)
 #define R_NHM_CNT4 0x1A90
+#define R_NHM_CNT4_BE4 0x20E90
 #define B_NHM_CNT4_MSK GENMASK(15, 0)
 #define B_NHM_CNT5_MSK GENMASK(31, 16)
 #define R_NHM_CNT6 0x1A94
+#define R_NHM_CNT6_BE4 0x20E94
 #define B_NHM_CNT6_MSK GENMASK(15, 0)
 #define B_NHM_CNT7_MSK GENMASK(31, 16)
 #define R_NHM_CNT8 0x1A98
+#define R_NHM_CNT8_BE4 0x20E98
 #define B_NHM_CNT8_MSK GENMASK(15, 0)
 #define B_NHM_CNT9_MSK GENMASK(31, 16)
 #define R_NHM_CNT10 0x1A9C
+#define R_NHM_CNT10_BE4 0x20E9C
 #define B_NHM_CNT10_MSK GENMASK(15, 0)
 #define B_NHM_CNT11_MSK GENMASK(31, 16)
 #define R_NHM_AX 0x1AA4
+#define R_NHM_BE4 0x20EA4
 #define B_NHM_READY_MSK BIT(16)
 #define R_CLM_EDCCA_RESULT 0x1AC8
 #define R_CLM_EDCCA_RESULT_V1 0x0EC8
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8851b.c b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
index 4f08084026b9..a80e51916da2 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8851b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
@@ -2618,6 +2618,7 @@ const struct rtw89_chip_info rtw8851b_chip_info = {
 	.wde_qempty_mgq_grpsel	= 4,
 	.rf_base_addr		= {0xe000},
 	.thermal_th		= {0x32, 0x35},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= &rtw89_8851b_phy_bb_table,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852a.c b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
index 8742adcb1b83..b0f30b88cc08 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
@@ -2388,6 +2388,7 @@ const struct rtw89_chip_info rtw8852a_chip_info = {
 	.wde_qempty_mgq_grpsel	= 16,
 	.rf_base_addr		= {0xc000, 0xd000},
 	.thermal_th		= {0x32, 0x35},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= pwr_on_seq_8852a,
 	.pwr_off_seq		= pwr_off_seq_8852a,
 	.bb_table		= &rtw89_8852a_phy_bb_table,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852b.c b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
index 0265026c3450..af4be6f4a5ed 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
@@ -994,6 +994,7 @@ const struct rtw89_chip_info rtw8852b_chip_info = {
 	.wde_qempty_mgq_grpsel	= 4,
 	.rf_base_addr		= {0xe000, 0xf000},
 	.thermal_th		= {0x32, 0x35},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= &rtw89_8852b_phy_bb_table,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852bt.c b/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
index 7306ae7db096..d3c7f3e4a30f 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852bt.c
@@ -835,6 +835,7 @@ const struct rtw89_chip_info rtw8852bt_chip_info = {
 	.wde_qempty_mgq_grpsel	= 4,
 	.rf_base_addr		= {0xe000, 0xf000},
 	.thermal_th		= {0x32, 0x35},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= NULL,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852c.c b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
index ab2694095951..ff2a1ff13604 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852c.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
@@ -3189,6 +3189,7 @@ const struct rtw89_chip_info rtw8852c_chip_info = {
 	.wde_qempty_mgq_grpsel	= 16,
 	.rf_base_addr		= {0xe000, 0xf000},
 	.thermal_th		= {0x32, 0x35},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= &rtw89_8852c_phy_bb_table,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922a.c b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
index 5521a6a78318..37eb5ed3659b 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
@@ -3238,6 +3238,7 @@ const struct rtw89_chip_info rtw8922a_chip_info = {
 	.wde_qempty_mgq_grpsel	= 4,
 	.rf_base_addr		= {0xe000, 0xf000},
 	.thermal_th		= {0xad, 0xb4},
+	.dtp_thermal_th		= 0,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= NULL,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index eaa12f7562b0..69eb1740ebf9 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -225,6 +225,35 @@ static const struct rtw89_rrsr_cfgs rtw8922d_rrsr_cfgs = {
 	.rsc = {R_BE_PTCL_RRSR1, B_BE_RSC_MASK, 2},
 };
 
+static const struct rtw89_reg_def rtw8922d_nhm_th[RTW89_NHM_TH_NUM] = {
+	{R_NHM_CFG_BE4, B_NHM_TH0_MSK},
+	{R_NHM_TH1_BE4, B_NHM_TH1_MSK},
+	{R_NHM_TH1_BE4, B_NHM_TH2_MSK},
+	{R_NHM_TH1_BE4, B_NHM_TH3_MSK},
+	{R_NHM_TH1_BE4, B_NHM_TH4_MSK},
+	{R_NHM_TH5_BE4, B_NHM_TH5_MSK},
+	{R_NHM_TH5_BE4, B_NHM_TH6_MSK},
+	{R_NHM_TH5_BE4, B_NHM_TH7_MSK},
+	{R_NHM_TH5_BE4, B_NHM_TH8_MSK},
+	{R_NHM_TH9_BE4, B_NHM_TH9_MSK},
+	{R_NHM_TH9_BE4, B_NHM_TH10_MSK},
+};
+
+static const struct rtw89_reg_def rtw8922d_nhm_rpt[RTW89_NHM_RPT_NUM] = {
+	{R_NHM_CNT0_BE4, B_NHM_CNT0_MSK},
+	{R_NHM_CNT0_BE4, B_NHM_CNT1_MSK},
+	{R_NHM_CNT2_BE4, B_NHM_CNT2_MSK},
+	{R_NHM_CNT2_BE4, B_NHM_CNT3_MSK},
+	{R_NHM_CNT4_BE4, B_NHM_CNT4_MSK},
+	{R_NHM_CNT4_BE4, B_NHM_CNT5_MSK},
+	{R_NHM_CNT6_BE4, B_NHM_CNT6_MSK},
+	{R_NHM_CNT6_BE4, B_NHM_CNT7_MSK},
+	{R_NHM_CNT8_BE4, B_NHM_CNT8_MSK},
+	{R_NHM_CNT8_BE4, B_NHM_CNT9_MSK},
+	{R_NHM_CNT10_BE4, B_NHM_CNT10_MSK},
+	{R_NHM_CNT10_BE4, B_NHM_CNT11_MSK},
+};
+
 static const struct rtw89_rfkill_regs rtw8922d_rfkill_regs = {
 	.pinmux = {R_BE_GPIO8_15_FUNC_SEL,
 		   B_BE_PINMUX_GPIO9_FUNC_SEL_MASK,
@@ -3780,6 +3809,7 @@ const struct rtw89_chip_info rtw8922d_chip_info = {
 	.wde_qempty_mgq_grpsel	= 8,
 	.rf_base_addr		= {0x3e000, 0x3f000},
 	.thermal_th		= {0xac, 0xb4},
+	.dtp_thermal_th		= 0xa2,
 	.pwr_on_seq		= NULL,
 	.pwr_off_seq		= NULL,
 	.bb_table		= NULL,
@@ -3882,8 +3912,8 @@ const struct rtw89_chip_info rtw8922d_chip_info = {
 	.cfo_hw_comp            = true,
 	.dcfo_comp		= NULL,
 	.dcfo_comp_sft		= 0,
-	.nhm_report		= NULL,
-	.nhm_th			= NULL,
+	.nhm_report		= &rtw8922d_nhm_rpt,
+	.nhm_th			= &rtw8922d_nhm_th,
 	.imr_info		= NULL,
 	.imr_dmac_table		= &rtw8922d_imr_dmac_table,
 	.imr_cmac_table		= &rtw8922d_imr_cmac_table,

base-commit: badf4c3c7679871a50cff1150f66e63187201757
-- 
2.53.0

