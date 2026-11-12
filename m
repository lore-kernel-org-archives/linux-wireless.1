Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463622;
	b=GnhxERzNfuCP/CLlyrPb+q0G8DTQZGOu/Y1YqXp+LpVfnplOBdcapzBOf8wgcN0hxOTN
	 n6H9Y7s+KsyRi2wfutc/ljAULt/H3e/cpeC30HpbO7xt7qTLYxLS5bR+CuANCuKXlHN1C
	 cIggHhG0oYGUaGsaZyFGcbpCIHTupoj4r85Oz1Wp1rgynnv/3h0JNH+PfVjxCWmSW5QKz
	 eqCKVGY9zoN9V0MGXuDE3JgC8Vz3vDPlmZWnLS/rTUvIAXzFuhfQgMQYl8cwVh5KXDecz
	 UgIExz7EaQltKwclaZy68Q0SEhYlJA4PNsQwEJSFZwV05USQaSg2uUcgu7U0/W1vZ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463622;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=4EUJRHbf8N5rOP2GQfAojj40tIHQzMRTeZLrteid7mk=;
	b=qWfbOkLRDojWkTp801ai9oyPoDdUKs2sWArSYI7xoVJlGNiw+kBeRes4QeEq+2BbEknu
	 0LeTiTu6u6EUvcR/EV48unInV1vfHyvFh41JCrIrwCf1necJsiSP/46T1ih35XwL4BiZN
	 SDnUkjA5eujJQq3vY32eeLVhHUOBGfyArmrszFDFpu8XdF4x41tEgp1RZLIxjeyvXC7ib
	 phQiXXWTnYyb9ow4EKG8p0nBLdrEGPl7XgGmgPfHXZ5v36aD9OKFoXEa/ZBUtFKFZDMLq
	 zFt9fijaCIG/51jFBtgJSRA5MGbKdm+6l8x1nUbeEoA/FdA8VWD8ft10t+rbJiS4tEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NfquqNWk;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBB606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=NfquqNWk
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66xX023489671, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463619; bh=4EUJRHbf8N5rOP2GQfAojj40tIHQzMRTeZLrteid7mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=NfquqNWkWLMXHkJnhG2eR9XWYkcXpmIfdHNIc3+bZebDsu1G4sa7ZVianYn7WiuSD
	 V26jBZ192s9hsIW6JcTW3T/LDRaFM9xscuctIBimkm4KCN2QKfhgJA3PSrF8fXxGq0
	 4JN6HaHOq+nJBnLKZLSFYEUcGzn90NcCqh9YLW5NyaFw79hQlWfy3llOuexbSnmaLt
	 bs/QlraHNXwYjHV1oKt1U6PMRaRoMX0zn+x1ZX11noYfBTcnUc/CC6QElrHDREVinr
	 wROGRBmMI5qC8VANqx5InP9LCS003E59kK6bUZ1KWOU7QCEdZlUWrwaA8kDsAEkCNQ
	 EPzjfzs6uSZjw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66xX023489671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:58 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:58 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 09/11] wifi: rtw89: Update sequence for MLO link switch
Date: Thu, 12 Nov 2026 14:05:58 +0800
Message-ID: <20261112060600.71784-10-pkshih@realtek.com>
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

From: Po-Hao Huang <phhuang@realtek.com>

Add missing flow when switching MLO links. Fix unexpected RTL8922D
FW behavior. In MLSR mode, when only single link information is
initialized, enabling hardware to switch link arbitrarily causes FW
errors. This register will be set only in the future patches where
change link is a must, e.g. eMLSR.

Recalculate the current active band and do corresponding TX
settings before authentication and returning from power save mode,
to keep hardware from sending packets from inactive bands.

Signed-off-by: Po-Hao Huang <phhuang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/core.c     |  6 +++
 drivers/net/wireless/realtek/rtw89/core.h     | 12 +++++
 drivers/net/wireless/realtek/rtw89/mac.c      |  2 +
 drivers/net/wireless/realtek/rtw89/mac.h      | 24 +++++++++
 drivers/net/wireless/realtek/rtw89/mac80211.c |  4 +-
 drivers/net/wireless/realtek/rtw89/mac_be.c   | 49 ++++++++++++++++---
 drivers/net/wireless/realtek/rtw89/ps.c       |  2 +-
 drivers/net/wireless/realtek/rtw89/reg.h      |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8851b.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852a.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852b.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852c.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8922a.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8922d.c |  7 +++
 14 files changed, 101 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 67e84bcdc631..b26964f09679 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5488,6 +5488,12 @@ static void rtw89_core_mlo_track(struct rtw89_dev *rtwdev)
 	}
 }
 
+void rtw89_core_config_active_bands(struct rtw89_dev *rtwdev)
+{
+	rtw89_fw_h2c_init_trx_protect(rtwdev);
+	rtw89_mac_init_drv_txen(rtwdev);
+}
+
 static void rtw89_track_ps_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct rtw89_dev *rtwdev = container_of(work, struct rtw89_dev,
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 48ef07b1d48f..b7f889d55f60 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -4991,6 +4991,7 @@ struct rtw89_chip_ops {
 	void (*fem_setup)(struct rtw89_dev *rtwdev);
 	int (*data_setup)(struct rtw89_dev *rtwdev);
 	void (*rfe_gpio)(struct rtw89_dev *rtwdev);
+	void (*cfg_hw_mlo)(struct rtw89_dev *rtwdev);
 	void (*rfk_hw_init)(struct rtw89_dev *rtwdev);
 	void (*rfk_init)(struct rtw89_dev *rtwdev);
 	void (*rfk_init_late)(struct rtw89_dev *rtwdev);
@@ -8871,6 +8872,14 @@ static inline void rtw89_chip_rfe_gpio(struct rtw89_dev *rtwdev)
 		chip->ops->rfe_gpio(rtwdev);
 }
 
+static inline void rtw89_chip_cfg_hw_mlo(struct rtw89_dev *rtwdev)
+{
+	const struct rtw89_chip_info *chip = rtwdev->chip;
+
+	if (chip->ops->cfg_hw_mlo)
+		chip->ops->cfg_hw_mlo(rtwdev);
+}
+
 static inline void rtw89_chip_rfk_hw_init(struct rtw89_dev *rtwdev)
 {
 	const struct rtw89_chip_info *chip = rtwdev->chip;
@@ -9443,6 +9452,7 @@ static inline u32 rtw89_bytes_to_mbps(u64 bytes, enum rtw89_tfc_interval interva
 
 int rtw89_core_tx_write(struct rtw89_dev *rtwdev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, struct sk_buff *skb, int *qsel);
+void rtw89_core_init_drv_txen(struct rtw89_dev *rtwdev);
 int rtw89_h2c_tx(struct rtw89_dev *rtwdev,
 		 struct sk_buff *skb, bool fwdl);
 void rtw89_core_tx_kick_off(struct rtw89_dev *rtwdev, u8 qsel);
@@ -9532,6 +9542,7 @@ void rtw89_sta_unset_link(struct rtw89_sta *rtwsta, unsigned int link_id);
 void rtw89_core_set_chip_txpwr(struct rtw89_dev *rtwdev);
 void rtw89_chip_rfk_channel(struct rtw89_dev *rtwdev,
 			    struct rtw89_vif_link *rtwvif_link);
+void rtw89_chip_hw_mlo_config(struct rtw89_dev *rtwdev);
 const struct rtw89_6ghz_span *
 rtw89_get_6ghz_span(struct rtw89_dev *rtwdev, u32 center_freq);
 int rtw89_get_default_chandef(struct rtw89_dev *rtwdev, struct cfg80211_chan_def *chandef);
@@ -9599,6 +9610,7 @@ void rtw89_core_ntfy_btc_event(struct rtw89_dev *rtwdev,
 			       enum rtw89_phy_idx phy_idx);
 int rtw89_core_mlsr_switch(struct rtw89_dev *rtwdev, struct rtw89_vif *rtwvif,
 			   unsigned int link_id);
+void rtw89_core_config_active_bands(struct rtw89_dev *rtwdev);
 void rtw89_core_dm_disable_cfg(struct rtw89_dev *rtwdev, u32 new);
 void rtw89_core_dm_disable_set(struct rtw89_dev *rtwdev, enum rtw89_dm_type type);
 void rtw89_core_dm_disable_clr(struct rtw89_dev *rtwdev, enum rtw89_dm_type type);
diff --git a/drivers/net/wireless/realtek/rtw89/mac.c b/drivers/net/wireless/realtek/rtw89/mac.c
index 11b6c6510050..598ce5e93ad7 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.c
+++ b/drivers/net/wireless/realtek/rtw89/mac.c
@@ -7568,6 +7568,8 @@ const struct rtw89_mac_gen_def rtw89_mac_gen_ax = {
 	.dle_func_en = dle_func_en_ax,
 	.dle_clk_en = dle_clk_en_ax,
 	.bf_assoc = rtw89_mac_bf_assoc_ax,
+	.mlo_link_cfg = NULL,
+	.init_drv_txen = NULL,
 
 	.typ_fltr_opt = rtw89_mac_typ_fltr_opt_ax,
 	.cfg_ppdu_status = rtw89_mac_cfg_ppdu_status_ax,
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index db42e33e694c..2e76bb1d1519 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1095,6 +1095,10 @@ struct rtw89_mac_gen_def {
 	void (*bf_assoc)(struct rtw89_dev *rtwdev,
 			 struct rtw89_vif_link *rtwvif_link,
 			 struct rtw89_sta_link *rtwsta_link);
+	void (*mlo_link_cfg)(struct rtw89_dev *rtwdev,
+			     struct rtw89_vif_link *rtwvif_link,
+			     bool enable);
+	void (*init_drv_txen)(struct rtw89_dev *rtwdev);
 
 	int (*typ_fltr_opt)(struct rtw89_dev *rtwdev,
 			    enum rtw89_machdr_frame_type type,
@@ -1545,6 +1549,26 @@ void rtw89_mac_bf_assoc(struct rtw89_dev *rtwdev,
 		mac->bf_assoc(rtwdev, rtwvif_link, rtwsta_link);
 }
 
+static inline
+void rtw89_mac_mlo_link_cfg(struct rtw89_dev *rtwdev,
+			    struct rtw89_vif_link *rtwvif_link,
+			    bool enable)
+{
+	const struct rtw89_mac_gen_def *mac = rtwdev->chip->mac_def;
+
+	if (mac->mlo_link_cfg)
+		mac->mlo_link_cfg(rtwdev, rtwvif_link, enable);
+}
+
+static inline
+void rtw89_mac_init_drv_txen(struct rtw89_dev *rtwdev)
+{
+	const struct rtw89_mac_gen_def *mac = rtwdev->chip->mac_def;
+
+	if (mac->init_drv_txen)
+		mac->init_drv_txen(rtwdev);
+}
+
 void rtw89_mac_bf_disassoc(struct rtw89_dev *rtwdev,
 			   struct rtw89_vif_link *rtwvif_link,
 			   struct rtw89_sta_link *rtwsta_link);
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 9134cdce2f47..c85ea82860c0 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -548,7 +548,7 @@ static int __rtw89_ops_sta_add(struct rtw89_dev *rtwdev,
 	if (vif->type == NL80211_IFTYPE_AP || sta->tdls)
 		rtw89_queue_chanctx_change(rtwdev, RTW89_CHANCTX_REMOTE_STA_CHANGE);
 
-	rtw89_fw_h2c_init_trx_protect(rtwdev);
+	rtw89_core_config_active_bands(rtwdev);
 
 	return 0;
 
@@ -1716,7 +1716,7 @@ static void rtw89_vif_update_fw_links(struct rtw89_dev *rtwdev,
 		if (unlikely(!rtwvif_link))
 			continue;
 
-		rtw89_fw_h2c_mlo_link_cfg(rtwdev, rtwvif_link, en);
+		rtw89_mac_mlo_link_cfg(rtwdev, rtwvif_link, en);
 	}
 }
 
diff --git a/drivers/net/wireless/realtek/rtw89/mac_be.c b/drivers/net/wireless/realtek/rtw89/mac_be.c
index fa35cafd7074..2b874825f503 100644
--- a/drivers/net/wireless/realtek/rtw89/mac_be.c
+++ b/drivers/net/wireless/realtek/rtw89/mac_be.c
@@ -1093,9 +1093,7 @@ static int txpktctrl_init_be(struct rtw89_dev *rtwdev)
 
 static int mlo_init_be(struct rtw89_dev *rtwdev)
 {
-	const struct rtw89_chip_info *chip = rtwdev->chip;
 	u32 val32;
-	u32 reg;
 	int ret;
 
 	rtw89_io_pack(rtwdev);
@@ -1114,14 +1112,8 @@ static int mlo_init_be(struct rtw89_dev *rtwdev)
 	if (ret)
 		rtw89_err(rtwdev, "[MLO]%s: MLO init polling timeout\n", __func__);
 
-	if (chip->chip_id == RTL8922A)
-		reg = R_BE_SS_CTRL;
-	else
-		reg = R_BE_SS_CTRL_V1;
-
 	rtw89_io_pack(rtwdev);
 
-	rtw89_write32_set(rtwdev, reg, B_BE_MLO_HW_CHGLINK_EN);
 	rtw89_write32_set(rtwdev, R_BE_CMAC_SHARE_ACQCHK_CFG_0, B_BE_R_MACID_ACQ_CHK_EN);
 
 	rtw89_io_unpack(rtwdev);
@@ -2949,6 +2941,45 @@ static void rtw89_mac_bf_assoc_be(struct rtw89_dev *rtwdev,
 	}
 }
 
+static void rtw89_mac_mlo_link_cfg_be(struct rtw89_dev *rtwdev,
+				      struct rtw89_vif_link *rtwvif_link,
+				      bool enable)
+{
+	u32 reg, tx_en;
+
+	if (enable) {
+		rtw89_chip_cfg_hw_mlo(rtwdev);
+		rtw89_chip_resume_sch_tx(rtwdev, rtwvif_link->phy_idx,
+					 B_BE_CTN_TXEN_ALL_MASK);
+		rtw89_fw_h2c_mlo_link_cfg(rtwdev, rtwvif_link, enable);
+	} else {
+		rtw89_fw_h2c_mlo_link_cfg(rtwdev, rtwvif_link, enable);
+		rtw89_chip_stop_sch_tx(rtwdev, rtwvif_link->phy_idx, &tx_en,
+				       RTW89_SCH_TX_SEL_ALL);
+	}
+
+	if (rtwdev->chip->chip_id == RTL8922A)
+		reg = R_BE_SS_CTRL;
+	else
+		reg = R_BE_SS_CTRL_V1;
+
+	rtw89_write32_clr(rtwdev, reg, B_BE_MLO_HW_CHGLINK_EN);
+}
+
+static void rtw89_mac_init_drv_txen_be(struct rtw89_dev *rtwdev)
+{
+	u8 active_bands = rtw89_get_active_phy_bitmap(rtwdev);
+	u32 tx_en;
+	int i;
+
+	for (i = 0; i < RTW89_PHY_NUM; i++) {
+		if (active_bands & BIT(i))
+			rtw89_chip_resume_sch_tx(rtwdev, i, B_BE_CTN_TXEN_ALL_MASK);
+		else
+			rtw89_chip_stop_sch_tx(rtwdev, i, &tx_en, RTW89_SCH_TX_SEL_ALL);
+	}
+}
+
 static void dump_err_status_dispatcher_be(struct rtw89_dev *rtwdev)
 {
 	rtw89_info(rtwdev, "R_BE_DISP_HOST_IMR=0x%08x ",
@@ -3313,6 +3344,8 @@ const struct rtw89_mac_gen_def rtw89_mac_gen_be = {
 	.dle_func_en = dle_func_en_be,
 	.dle_clk_en = dle_clk_en_be,
 	.bf_assoc = rtw89_mac_bf_assoc_be,
+	.mlo_link_cfg = rtw89_mac_mlo_link_cfg_be,
+	.init_drv_txen = rtw89_mac_init_drv_txen_be,
 
 	.typ_fltr_opt = rtw89_mac_typ_fltr_opt_be,
 	.cfg_ppdu_status = rtw89_mac_cfg_ppdu_status_be,
diff --git a/drivers/net/wireless/realtek/rtw89/ps.c b/drivers/net/wireless/realtek/rtw89/ps.c
index 40bac65dd8ed..47e055b38b14 100644
--- a/drivers/net/wireless/realtek/rtw89/ps.c
+++ b/drivers/net/wireless/realtek/rtw89/ps.c
@@ -223,7 +223,7 @@ void rtw89_leave_lps(struct rtw89_dev *rtwdev)
 		rtw89_vif_for_each_link(rtwvif, rtwvif_link, link_id)
 			rtw89_leave_lps_vif(rtwdev, rtwvif_link);
 
-	rtw89_fw_h2c_init_trx_protect(rtwdev);
+	rtw89_core_config_active_bands(rtwdev);
 }
 
 void rtw89_enter_ips(struct rtw89_dev *rtwdev)
diff --git a/drivers/net/wireless/realtek/rtw89/reg.h b/drivers/net/wireless/realtek/rtw89/reg.h
index 4bee9f66038c..fc71d8d87b57 100644
--- a/drivers/net/wireless/realtek/rtw89/reg.h
+++ b/drivers/net/wireless/realtek/rtw89/reg.h
@@ -6917,6 +6917,7 @@
 #define B_BE_CTN_TXEN_CPUMGQ BIT(10)
 #define B_BE_CTN_TXEN_MGQ1 BIT(9)
 #define B_BE_CTN_TXEN_MGQ BIT(8)
+#define B_BE_CTN_TXEN_ACQ GENMASK(7, 0)
 #define B_BE_CTN_TXEN_VO_1 BIT(7)
 #define B_BE_CTN_TXEN_VI_1 BIT(6)
 #define B_BE_CTN_TXEN_BK_1 BIT(5)
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8851b.c b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
index a7facfe96884..4f08084026b9 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8851b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8851b.c
@@ -2510,6 +2510,7 @@ static const struct rtw89_chip_ops rtw8851b_chip_ops = {
 	.read_phycap		= rtw8851b_read_phycap,
 	.fem_setup		= NULL,
 	.data_setup		= NULL,
+	.cfg_hw_mlo		= NULL,
 	.rfe_gpio		= rtw8851b_rfe_gpio,
 	.rfk_hw_init		= NULL,
 	.rfk_init		= rtw8851b_rfk_init,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852a.c b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
index 3b5e3c178440..8742adcb1b83 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852a.c
@@ -2290,6 +2290,7 @@ static const struct rtw89_chip_ops rtw8852a_chip_ops = {
 	.fem_setup		= rtw8852a_fem_setup,
 	.data_setup		= NULL,
 	.rfe_gpio		= NULL,
+	.cfg_hw_mlo		= NULL,
 	.rfk_hw_init		= NULL,
 	.rfk_init		= rtw8852a_rfk_init,
 	.rfk_init_late		= NULL,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852b.c b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
index 138f499af677..0265026c3450 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852b.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852b.c
@@ -883,6 +883,7 @@ static const struct rtw89_chip_ops rtw8852b_chip_ops = {
 	.fem_setup		= NULL,
 	.data_setup		= NULL,
 	.rfe_gpio		= NULL,
+	.cfg_hw_mlo		= NULL,
 	.rfk_hw_init		= NULL,
 	.rfk_init		= rtw8852b_rfk_init,
 	.rfk_init_late		= NULL,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852c.c b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
index bdcce2e94f99..ab2694095951 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852c.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852c.c
@@ -3091,6 +3091,7 @@ static const struct rtw89_chip_ops rtw8852c_chip_ops = {
 	.fem_setup		= NULL,
 	.data_setup		= NULL,
 	.rfe_gpio		= NULL,
+	.cfg_hw_mlo		= NULL,
 	.rfk_hw_init		= NULL,
 	.rfk_init		= rtw8852c_rfk_init,
 	.rfk_init_late		= NULL,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922a.c b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
index a3b5da979768..5521a6a78318 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922a.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922a.c
@@ -3141,6 +3141,7 @@ static const struct rtw89_chip_ops rtw8922a_chip_ops = {
 	.fem_setup		= NULL,
 	.data_setup		= NULL,
 	.rfe_gpio		= NULL,
+	.cfg_hw_mlo		= NULL,
 	.rfk_hw_init		= rtw8922a_rfk_hw_init,
 	.rfk_init		= rtw8922a_rfk_init,
 	.rfk_init_late		= rtw8922a_rfk_init_late,
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index 2bc46be72e0a..4175aeceef8d 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -2702,6 +2702,12 @@ static void __rtw8922d_rfk_init_late(struct rtw89_dev *rtwdev,
 		rtw89_phy_rfk_dack_and_wait(rtwdev, phy_idx, chan, 58);
 }
 
+static void rtw8922d_cfg_hw_mlo(struct rtw89_dev *rtwdev)
+{
+	rtw8922d_ctrl_mlo(rtwdev, rtwdev->mlo_dbcc_mode, true);
+	rtw8922d_rfk_mlo_ctrl(rtwdev);
+}
+
 static void rtw8922d_rfk_init_late(struct rtw89_dev *rtwdev)
 {
 	const struct rtw89_chan *chan = rtw89_chan_get(rtwdev, RTW89_CHANCTX_0);
@@ -3683,6 +3689,7 @@ static const struct rtw89_chip_ops rtw8922d_chip_ops = {
 	.fem_setup		= NULL,
 	.data_setup		= rtw8922d_data_setup,
 	.rfe_gpio		= NULL,
+	.cfg_hw_mlo		= rtw8922d_cfg_hw_mlo,
 	.rfk_hw_init		= rtw8922d_rfk_hw_init,
 	.rfk_init		= rtw8922d_rfk_init,
 	.rfk_init_late		= rtw8922d_rfk_init_late,
-- 
2.53.0

