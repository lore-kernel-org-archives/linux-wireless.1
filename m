Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504785;
	b=U1oi9dVoFJ5WWOWaXO1hrfZrhfAEzdGezXOPi3B4C5zbbkRNip5486eWqY/sxELOnNEe
	 t1Dq7xTrMqYyaleWRqq86SAZKTktPDs///+iq5434YIRtM+8jlkjPpwtYBwKB7a+pKJvO
	 bQrof7+ajSj4H0Aj8X66kIqdmCBUWLaOioezTy6Q4MpjBKT97/Ck/jx5INGXdEGaExjSK
	 xHiV2u4HSC+Trg7PH9956fqArQdnrLfQ7cJaJOIp4GwUChu3M4JD9tgm8I7LqE0SpZKNM
	 JCjzyV7dX53co98+VnR2hXmyzdzvyLpmHimWF3NDtZolHjKEPB1pviIJnh6A6iyzaEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hOxu4M78NjSn5FUcEecCKp0wcdYFhbhxLgNytgIQ9Is=;
	b=p+jH+hzauUw/bPNbg5RkOGxH3vHyQl1k3zI6lhleTfLgzjNeVNZrxm8L8Ut0TrEhb0rG
	 AwWG4jEXXCrJ06yoiZZLboSwZBc3K+TtReDGee+7qOh5d86OybnNAjkoZIU5wjlfZ21mY
	 VIFjFXqKGkN/9s6Lp6+BDLXISjc3HgJC+vmDovEsQENThgNcK+WkOuUsk31KlUcdcRQWg
	 zks/zLuoQ/XNkFJFg22GXOJmo7BlqmCGXNsJ3FG/IY59ciXttAbcyMUdIG9h3jyN/rHzX
	 S5420EpgnF38/MASr2UGtucy5H2JcKo39tyHzBMQ381fJTtEdQNJfhMnjifZx9dEN8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RsmdILo6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6F606A885
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B6F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RsmdILo6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso5465a91.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794504784; x=1795109584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOxu4M78NjSn5FUcEecCKp0wcdYFhbhxLgNytgIQ9Is=;
        b=RsmdILo6c6cM9NdMf6WIFTVfi7NXeg54oU5w8Gq6QkbM1udMJKN1kweJS+xd6yG5wd
         Y5YvbBzfE7C1UMZiNKs5W48BqtaaRL2VXNcm/0usBRX7DXhlfm+MCcGSR/Yv2Eh70CM6
         I0EoS0TMTnc8C5FU3EZpYcBTsQyUfjMK8nkkvW+nkr3jm1xWgi/mv8eUCOVV9eXI4+e8
         uWWOLluDSh+7FKJVJTLVRd0sHMX8fVcX7Pb2HmNu0xOz74UZ7p/zP0CjSd9VxIwFuwrb
         lzpf03TJHrwV/QMz9WiOMKi+ziznYeWDFQzgsnjLmvk029ZSUq6Xqtm7PCMyjiofGopx
         ACHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504784; x=1795109584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOxu4M78NjSn5FUcEecCKp0wcdYFhbhxLgNytgIQ9Is=;
        b=j9L9Dy8PkrJJb7NB4AUAujXZRV5+t1hNUEiVNRtAga7TFTpfyXtEeob8cHLNqdPORU
         i4upzvfiiQWsGH+ZLrL3+jItTeY/WmYIR7QfA5hTHdWLLxDm+hTStK8zz9bzlX1rG+4k
         rqxfLJX1C/M1qf2lQBFpGVI6Ftavbwwjla+HrIZ2zS3qIN1TNu0Z2Q6qgc7UBvMEfALH
         i2oYzmi5xlcy2DBag8T0y4AZcDChXx0FhvSNr9QSF+bsBgaJoT6AJZFvIvoccYpzW9O0
         FJi9mYuCLVRH2C+BZwRJecTcOjRNzg1ylaOAuCmOQVJ9nUQczKdF7FUNjXCNBWiyC6wd
         26bw==
X-Gm-Message-State: APuU4Z+DcJfhrLos6HxvsWLWtEXsXn8BRDejI3mZzSDmDUmgcEhqll0Q
	VkY4F+PNMF3/ooQs4UGSmf2FAInaARxr1YWHXYIo2cfcHhHArUw8M1j6
X-Gm-Gg: AYBFou0+C4X9R+uy/rVN6Emwdvqldq8fK2dLNUPfEFL8dSeW+cS5ILJvDiECbJ9ufZl
	Q5Tvo1uRgSFq3OYv62+kAzkK9Ssu93GWlvXNo4cqY6wLuGLL9xaIQm2tSR+tXxQfEAtyz9mjiNb
	GxS34v2p2iFYKVaUrtyg3BycJwXdjCpQ1luNEE9JalFJRVp5OEcW1EfOUfupnT7cMhWWU0z4BXI
	em9YzQOpZiXp/c7Po+VwfWHlyPVxjFME2w7/3ccpsvM3ALDP9Sw/4LvlLSeVmwVDMgPpbqe0vMR
	xitqeigqX5K9C84iqwDO5GIUqSGr3wCX/c+CCA2SOxWKU9hDBCKHrht9ZacCNhTSh+8sh55EncH
	ouFa59NlocnqF/LzSPizXJFHCbDb3VXImEeRLHmiXdD6eCkWdCJRyg+xsWS1MFrUA1CRg/Y+n7/
	mgApFyltxNLIDrx5gBd1nFzcsh6Z5cueN4retdtWOGa3RsBaHJMQNyOh8QDxvF1IgE9vZs3C9Vn
	ei4/pxplUcwRYu3HMFf8XqOQAv6DxpO3FUy/BxBbeLD/qvVfmyQT82JJgEVA4+445RS7diSBZl5
	0JNjXgAJSB2rYgQWf8JQE7EHJOvssLJ9RsEnNSLEpVHRyoXm3jnm/eCxBBC8XDX4k+Fh0atbRxP
	KDODTPAQVZbJkViNElWLznwLJ8pWYn+10GH41iFdOJw8A
X-Received: by 2002:a17:90b:1642:b0:3b0:9941:ec79 with SMTP id 98e67ed59e1d1-3b182f85322mr5927650a91.53.1794504783968;
        Thu, 12 Nov 2026 09:33:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm383532a91.0.2026.11.12.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:33:03 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
Date: Fri, 13 Nov 2026 01:32:41 +0800
Message-ID: <20261112173246.3201729-3-hjf3108@gmail.com>
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

Implement beamformee support for 88xxa since they have
support for it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/bf.h       |  2 +
 drivers/net/wireless/realtek/rtw88/main.c     | 12 ++--
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 37 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 61 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  2 +
 8 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/bf.h b/drivers/net/wireless/realtek/rtw88/bf.h
index a5d3010e6b..0aa78fb6a7 100644
--- a/drivers/net/wireless/realtek/rtw88/bf.h
+++ b/drivers/net/wireless/realtek/rtw88/bf.h
@@ -12,6 +12,8 @@
 #define REG_ASSOCIATED_BFMER0_INFO	0x06E4
 #define REG_ASSOCIATED_BFMER1_INFO	0x06EC
 #define REG_TX_CSI_RPT_PARAM_BW20	0x06F4
+#define REG_TX_CSI_RPT_PARAM_BW40	0x06F8
+#define REG_TX_CSI_RPT_PARAM_BW80	0x06FC
 #define REG_SND_PTCL_CTRL		0x0718
 #define BIT_DIS_CHK_VHTSIGB_CRC		BIT(6)
 #define BIT_DIS_CHK_VHTSIGA_CRC		BIT(5)
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index e243738809..fe93c93b1a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1603,6 +1603,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1621,10 +1622,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (rtw_bf_support && chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (rtw_bf_support && chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb..f8ec1e2931 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -671,6 +671,7 @@
 #define REG_IQK_COM96		0x0984
 
 #define REG_FAS			0x09a4
+#define REG_CSI_CONTENT_VALUE	0x09b4
 #define REG_RXSB		0x0a00
 #define BIT_RXSB_ANA_DIV	BIT(15)
 #define REG_CCK_RX		0x0a04
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 55f1d3d324..5d58dff4fc 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
 	.pwr_track		= rtw8812a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw88xxa_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8812a_led_set,
@@ -1084,6 +1084,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.old_datarate_fb_limit = true,
 	.usb_tx_agg_desc_num = 1,
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index e35c57c9d1..c2a18f6be8 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -4,6 +4,7 @@
 
 #include <linux/usb.h>
 #include "main.h"
+#include "bf.h"
 #include "coex.h"
 #include "tx.h"
 #include "phy.h"
@@ -115,10 +116,13 @@ static void rtw8814a_init_hwcap(struct rtw_dev *rtwdev)
 			   BIT(RTW_CHANNEL_WIDTH_80);
 	efuse->hw_cap.ptcl = EFUSE_HW_CAP_PTCL_VHT;
 
-	if (hal->rf_type == RF_3T3R)
+	if (hal->rf_type == RF_3T3R) {
 		efuse->hw_cap.nss = 3;
-	else
+		hal->bfee_sts_cap = 2;
+	} else {
 		efuse->hw_cap.nss = 2;
+		hal->bfee_sts_cap = 1;
+	}
 
 	rtw_dbg(rtwdev, RTW_DBG_EFUSE,
 		"hw cap: hci=0x%02x, bw=0x%02x, ptcl=0x%02x, ant_num=%d, nss=%d\n",
@@ -2039,6 +2043,32 @@ static void rtw8814a_led_set(struct led_classdev *led,
 	rtw_write32(rtwdev, REG_GPIO_PIN_CTRL_2, led_gpio_cfg);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_8814A	0x40
+#define RTW_SND_CTRL_SOUNDING_8814A	0xDB
+
+static void rtw8814a_bf_enable_bfee_su(struct rtw_dev *rtwdev,
+				       struct rtw_vif *vif,
+				       struct rtw_bfee *bfee)
+{
+	rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
+
+	rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2,
+			 0x0202);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL, RTW_SND_CTRL_SOUNDING_8814A);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 3,
+		   RTW_NDP_RX_STANDBY_TIME_8814A);
+}
+
+static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
+				    struct rtw_vif *vif,
+				    struct rtw_bfee *bfee, bool enable)
+{
+	if (enable)
+		rtw8814a_bf_enable_bfee_su(rtwdev, vif, bfee);
+	else
+		rtw_bf_remove_bfee_su(rtwdev, bfee);
+}
+
 static void rtw8814a_fill_txdesc_checksum(struct rtw_dev *rtwdev,
 					  struct rtw_tx_pkt_info *pkt_info,
 					  u8 *txdesc)
@@ -2068,7 +2098,7 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.phy_calibration	= rtw8814a_phy_calibration,
 	.cck_pd_set		= rtw8814a_phy_cck_pd_set,
 	.pwr_track		= rtw8814a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw8814a_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
@@ -2231,6 +2261,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.rfe_defs = rtw8814a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8814a_rfe_defs),
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
 	.coex_para_ver = 0,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6096d3b8e4..6d106ae70d 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -877,7 +877,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
 	.pwr_track		= rtw8821a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw88xxa_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8821a_led_set,
@@ -1188,6 +1188,7 @@ const struct rtw_chip_info rtw8821a_hw_spec = {
 	.old_datarate_fb_limit = true,
 	.usb_tx_agg_desc_num = 6,
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
index 5ffa29d181..128a18ee33 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -138,6 +138,7 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.nss = 1;
 	else
 		efuse->hw_cap.nss = 2;
+	hal->bfee_sts_cap = 1;
 
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8821A)
 		goto print_hw_cap;
@@ -197,6 +198,66 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.ant_num, efuse->hw_cap.nss);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_88XXA	0x50
+#define RTW_SND_CTRL_REMOVE_88XXA	0xC8
+#define RTW_SND_CTRL_SOUNDING_88XXA	0xCB
+
+void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
+			     struct rtw_bfee *bfee, bool enable)
+{
+	static const u32 csi_rpt_regs[] = {
+		REG_TX_CSI_RPT_PARAM_BW20,
+		REG_TX_CSI_RPT_PARAM_BW40,
+		REG_TX_CSI_RPT_PARAM_BW80,
+	};
+	struct rtw_bf_info *bf_info = &rtwdev->bf_info;
+	u8 slot = bfee->su_reg_index;
+	u32 addr_bfer_info;
+	u32 csi_param;
+	int i;
+
+	if (bfee->role != RTW_BFEE_SU || slot >= 2)
+		return;
+
+	addr_bfer_info = slot ? REG_ASSOCIATED_BFMER1_INFO :
+				REG_ASSOCIATED_BFMER0_INFO;
+
+	rtw_dbg(rtwdev, RTW_DBG_BF, "SU beamformee %s slot %u\n",
+		enable ? "enable" : "disable", slot);
+
+	if (!enable) {
+		rtw_write32(rtwdev, addr_bfer_info, 0);
+		rtw_write16(rtwdev, addr_bfer_info + 4, 0);
+
+		clear_bit(slot, bf_info->bfer_su_reg_maping);
+		bfee->su_reg_index = 0xff;
+
+		if (!bf_info->bfer_su_cnt)
+			rtw_write8(rtwdev, REG_SND_PTCL_CTRL,
+				   RTW_SND_CTRL_REMOVE_88XXA);
+		return;
+	}
+
+	if (rtwdev->efuse.hw_cap.nss == 2) {
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
+		csi_param = 0x01090109;
+	} else {
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
+		csi_param = 0x01080108;
+	}
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL, RTW_SND_CTRL_SOUNDING_88XXA);
+	for (i = 0; i < ETH_ALEN; i++)
+		rtw_write8(rtwdev, addr_bfer_info + i, bfee->mac_addr[i]);
+
+	for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
+		rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 3,
+		   RTW_NDP_RX_STANDBY_TIME_88XXA);
+}
+EXPORT_SYMBOL(rtw88xxa_bf_config_bfee);
+
 int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
index 6597ca0dfc..150e86ea74 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
@@ -170,5 +170,7 @@ bool rtw88xxa_iqk_finish(int average, int threshold,
 void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 			   void (*do_lck)(struct rtw_dev *rtwdev),
 			   void (*do_iqk)(struct rtw_dev *rtwdev));
+void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
+			     struct rtw_bfee *bfee, bool enable);
 
 #endif
-- 
2.53.0

