Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802465;
	b=qCTPpBnzmZ4Xgg4FAnj3yTLnXFgdRAYbKH4mYLn4tFm++zwjRRU99EihB0G6lxzsZzOx
	 ITQyRw+0QGFQlf6E3qnFLjXj/LtKwvpzqyY9C7UB2bJq0theTTrq/lkTwvCdM4Y/4YYHb
	 GoAWX97TggVfCk7+WuoKU8kI9m3mizcVUZ2EvmrsUDTV62XmRGGunlMZswUQRL6Bub2je
	 IiqccBEMghH4rEpBt6SikqF8slAozPrqhQsLjQ0HK2DT4pO6EO35NDdTkT4yLRpzs71pY
	 LIRmXwP7wIOW0f119+ExTZIdj75OPKr1bBDJLy/D3vbzKVT+gyLH8A6ywo1VE8N8JTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=krTW1A/eU8I5/V6j15d70FvAf6mhhqXLn0ClNzRY4GY=;
	b=zBam+1LyUNSivcvWtYDm216dOGz03J69My2rtb4L8P9AHKhrNjl0nwMQ5f1mSOf3X4N+
	 AAXSW6M3+jAcMZ4mb464T3Yn1BUzAAKQTD13UUtHkl0SO/blBQStcu1XxO9JG8QQRXwNx
	 /oU4cOC2v/IzSusy18ne27fvIdZWG4aHezfU7fxC8yg9wLa0vTU43lCRLVtm9efhgr+M8
	 BPV5zFakV2H79Z+5+wnyV4JfAsng7QFgmyEvdAHJmGOda/lKdRV6INXXsLzDGi+8lXEVS
	 2tiqtWcXPIWjaS6HJtL5HOUvm2RqrFouWDFk8niNXwuWoooXV8BK8vWM48twXl300dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBLCNVMS;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A68606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBLCNVMS
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so19424056c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802463; x=1796407263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krTW1A/eU8I5/V6j15d70FvAf6mhhqXLn0ClNzRY4GY=;
        b=UBLCNVMSe5q703tYeAttIrxnhbUYLFSDU1nQDQRKVxv11/p69dTOhjMIJp3IgR5hOG
         usQlGfepKKG3CwPigySiqtTvPY9Pn7ClQqNsy4+Iy7uEBVL8EiyCCsgc6Duq4meFBiSr
         CmNPibcPJdQL2MGnyTThlitFvTwZ+sw6eYMGIgIvKkPRJ8saGWcBSxjaTHYk5JOB/Tpy
         ZueTwMuArRdNLvn1LOZgfoAq2R/H77ZOluubadz/HB4j1fTURRhU4lHV7yADtK03T7FE
         /kxZmpewOWkXJVgUNnUgnL7cTlCni4YswTeTxD6SV2rMaNxhkXTKHWSsqArtkcZ5Et9S
         x2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802463; x=1796407263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krTW1A/eU8I5/V6j15d70FvAf6mhhqXLn0ClNzRY4GY=;
        b=H7yKCsaXUhr6FTXuOw7DuIltxbMcPXtfXjL67b9nycuhmLmpU7cbEUg95S/fPCQrij
         fHlsgmXegzK5dw92JcK9D1X0mX66Uj6CcjR1rK1vCVy3BMW2niJw7ikCwlRYCpxsYhGs
         LlZgG05/YawTl1T9OFprsF1ygaWKI9G1ZMyVk0EY+3k52oHW/pL3pBH9R0OxSSTs0tA/
         ogCESPA96KMt5iRXwTt0wBzDn/PaDLgtNxY//350l8SBSx9/t09UxHaRPkDzlwuJVjRG
         c6qd8v6L4xNaiyRTV2iCkUl42nJL7qbe7BYyzYfSUq31gKFjyD6RgW/aMJXGcEgSLtzu
         eSSw==
X-Gm-Message-State: APuU4Z+zRKbKkJh1H0gVEG/E1hb2fH/Re64jNCOBnIYp/NS6xPll5n0+
	x0ufsCaKVuyOCksoW3r6dZHZVlvEHS3Mf7P5XX2tsaNMFuUu3HkjArnz
X-Gm-Gg: AZFdTZe2QtlEE2WMYIFwrK5u8IuGrPf2GhVVGUCsnC7EScHVhlEZQq2ZQIAaG+JSVoy
	8Xy9xVHSDqgjSWQDJTmWqomlTUQr5MM2req304AWWrKQKXa78HetRY6DcntHcJQBNUkmptPLhw0
	E/QBbqViLRfMHfFgHzfSHbTK6Sz01hy2i8p10aMCp4euITEtiUu2DeOvVaEnTcLera5vo+5r6ZO
	X6+C/jQcdqCVcIb4F0bpheVHS9v7z7S9yKkUwkHhvSJXPf+sVfn2AhqWeTMTKCGro4pw0KJh0fk
	60o/trOILZWg5dHtiEIYgxbzO5UNJexVIOBlij6sEiJzkZcmD/389KptaHr5IrSY/uky66EMVLo
	t8zhLsD/vf8/mJAHW/BR9h44yLSpI1qWD5WqqZwvTeqAlcttVp4OgX1H0dkw1UeZj47OG588JkG
	xaoWeDHK0jJ0GdRhbrxqrOvS5KPyVe/kgcneGD0O63+q9KjLQKwr620DxlSeJhDq9BZkdI7QT5+
	TNg47eo2RmoWn1dJWS4ZgPMqBZrEWJP0rYBzU0D2CpA3cf54loViyjBda8tgyQpXHEfVmV0daSC
	4PBywMwGXRgCEKoTqIcFCbIbThv8WR1Ztmh9FSOCspRT5EgPUkFylGHSJiRqgnTrDuC6txmTi5b
	OL6o9eVWveMz0tjetPBDi4UTwkTMI7GS06frCj0w=
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr28184770eec.3.1795802462205;
        Fri, 27 Nov 2026 10:01:02 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:01 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 4/7] wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
Date: Sat, 28 Nov 2026 02:00:24 +0800
Message-ID: <20261127180034.1058591-5-hjf3108@gmail.com>
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

RTL8812A, RTL8821A and RTL8814A can be a VHT SU beamformee, but they
have no config_bfee callback and bfer_su_max_num is 0, so
rtw_bf_assoc() never sets them up.

This adds the SU beamformee setup for these chips, for up to two
beamformers. This is done by enabling sounding to the AP and
setting the correct CSI report parameters.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/bf.h       |  7 ++
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 42 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 73 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  2 +
 7 files changed, 126 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/bf.h b/drivers/net/wireless/realtek/rtw88/bf.h
index a5d3010e6b..3a53e69d01 100644
--- a/drivers/net/wireless/realtek/rtw88/bf.h
+++ b/drivers/net/wireless/realtek/rtw88/bf.h
@@ -12,9 +12,16 @@
 #define REG_ASSOCIATED_BFMER0_INFO	0x06E4
 #define REG_ASSOCIATED_BFMER1_INFO	0x06EC
 #define REG_TX_CSI_RPT_PARAM_BW20	0x06F4
+#define REG_TX_CSI_RPT_PARAM_BW40	0x06F8
+#define REG_TX_CSI_RPT_PARAM_BW80	0x06FC
 #define REG_SND_PTCL_CTRL		0x0718
+#define BIT_USE_NSTS			BIT(7)
 #define BIT_DIS_CHK_VHTSIGB_CRC		BIT(6)
 #define BIT_DIS_CHK_VHTSIGA_CRC		BIT(5)
+#define BIT_BFPARAM_SEL			BIT(4)
+#define BIT_CSISEQ_SEL			BIT(3)
+#define BIT_HT_NDPA_EN			BIT(1)
+#define BIT_VHT_NDPA_EN			BIT(0)
 #define BIT_MASK_BEAMFORM		(GENMASK(4, 0) | BIT(7))
 #define REG_MU_TX_CTL			0x14C0
 #define REG_MU_STA_GID_VLD		0x14C4
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index 877b82640e..afb6d762a2 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -672,6 +672,7 @@
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
index e35c57c9d1..13c22d2e50 100644
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
@@ -2039,6 +2043,37 @@ static void rtw8814a_led_set(struct led_classdev *led,
 	rtw_write32(rtwdev, REG_GPIO_PIN_CTRL_2, led_gpio_cfg);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_8814A	0x40
+#define RTW_SND_CTRL_SOUNDING_8814A	(BIT_USE_NSTS | \
+					 BIT_DIS_CHK_VHTSIGB_CRC | \
+					 BIT_BFPARAM_SEL | BIT_CSISEQ_SEL | \
+					 BIT_HT_NDPA_EN | BIT_VHT_NDPA_EN)
+#define RTW_CSI_RPT_OFFSET_VHT_8814A	2
+#define RTW_CSI_RPT_OFFSET_HT_8814A	2
+
+static void rtw8814a_bf_enable_bfee_su(struct rtw_dev *rtwdev,
+				       struct rtw_vif *vif,
+				       struct rtw_bfee *bfee)
+{
+	rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 1, RTW_CSI_RPT_OFFSET_VHT_8814A);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 2, RTW_CSI_RPT_OFFSET_HT_8814A);
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
@@ -2068,7 +2103,7 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.phy_calibration	= rtw8814a_phy_calibration,
 	.cck_pd_set		= rtw8814a_phy_cck_pd_set,
 	.pwr_track		= rtw8814a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw8814a_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
@@ -2231,6 +2266,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
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
index 5ffa29d181..9780999a9b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -138,6 +138,7 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.nss = 1;
 	else
 		efuse->hw_cap.nss = 2;
+	hal->bfee_sts_cap = 1;
 
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8821A)
 		goto print_hw_cap;
@@ -197,6 +198,78 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.ant_num, efuse->hw_cap.nss);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_88XXA	0x50
+#define RTW_SND_CTRL_REMOVE_88XXA	(BIT_USE_NSTS | \
+					 BIT_DIS_CHK_VHTSIGB_CRC | \
+					 BIT_CSISEQ_SEL)
+#define RTW_SND_CTRL_SOUNDING_88XXA	(RTW_SND_CTRL_REMOVE_88XXA | \
+					 BIT_HT_NDPA_EN | BIT_VHT_NDPA_EN)
+/* REG_CSI_CONTENT_VALUE from the 8812a (2T2R) and 8821a (1T1R) bb tables */
+#define RTW_CSI_CONTENT_2T2R_88XXA	0x00000000
+#define RTW_CSI_CONTENT_1T1R_88XXA	0x01081008
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
+	u8 nc_index = rtwdev->efuse.hw_cap.nss - 1;
+	u8 nr_index = 1, grouping = 0, codebookinfo = 1, coefficientsize = 0;
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
+	if (rtwdev->efuse.hw_cap.nss == 2)
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE,
+			    RTW_CSI_CONTENT_2T2R_88XXA);
+	else
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE,
+			    RTW_CSI_CONTENT_1T1R_88XXA);
+
+	csi_param = (coefficientsize << 10) | (codebookinfo << 8) |
+		    (grouping << 6) | (nr_index << 3) | nc_index;
+	/* same parameters for both beamformer slots */
+	csi_param |= csi_param << 16;
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

