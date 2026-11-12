Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463611;
	b=WnXNzTzcKHM6bp2wcolBLD0Lo8GHaH/fLH846qVhKowhqY2IP42MJDinwzshWkCJDkt4
	 8G1m+8AVMGAehwZ3QrnKU/kqghyTLOj0hXDEqp3FH9c4qfOXW/hy81fGvfnHixNy13HWK
	 DcJRS7Tr+y1eH8gUCPzVIRTw68VV7DMObCU8fXnCce/k1XXW5XYmATZoDjhRI8VoKqZaD
	 4RzBMXpmNeEGlmntHWKUHeOtDtqpyje/omz4mJz2Grdj7VQARU2h+z+AWU25GpmEdhj2r
	 55j9oYLgMRSWZS34fzZjFG8NFgf/NJqIuUrv4m6I77Q6evU6gENLAeA5oio+7z4qZyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463611;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=HqJ9qIHfGXcfVqjVDNgAOg2p82Anci8J69nGpkkoVt4=;
	b=tkA2UQZtXpo/nNlqzDWB3x22KPs5rparSUVPeqV2xgq5cyOKbBczfAuAAxzP88HfptWO
	 aCk0SA4IQ0YOk7uPfQ7XQaYPtcj90RoBoUH55GMMGfrYjZDun+WZ7igopf3NXxaucI2Hs
	 D7wbEvwrYAzqTyv+d9l8EOuT4q9ztlY3YWktGv3zD+dpMm0NNp+EoPFc5CasctfsllihM
	 46P7FgHOmWcJ10TC2QPqHQkUNXvJUj76xpaVLMy7CbGoUrduTukc2oQ9Zpm6/Z1oM3PhA
	 oPfdcb21kIy/b6+8oG/O5xeOEuj7jZ0flnPeXuaLE5KFdd645Kx/urmCKwJIntIg2vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SUqYXIPq;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88184606A32E
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88184606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SUqYXIPq
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66mg263489526, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463608; bh=HqJ9qIHfGXcfVqjVDNgAOg2p82Anci8J69nGpkkoVt4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=SUqYXIPqxvF7lEazPyq1MM16jmTw/NdXfrHSkxzSvhQLtYAYp1GikzbvoRGV/xh3K
	 pSqv/zuFtVi2JT2C9b+6XseQxjF70EFLuzQ6UsIFZ/mWoCSEfE7D2CDSHdXcCCjTVt
	 9di2ofezazsP+pitIIcR7uJ7r3DooMDXFTIUXeAEjliWDWOrq0OVp1qVkXcs4kN21j
	 2b5cXIh6KHANtGpJ6o1li5SB+nZX4dz+9j3bLiT+pMWdFVYIbYvXGyvnvF3ZnnsmWp
	 9vxnDM9MCRiS2IgxiRquZIJrkMilihO0Rm/kr2lZmi1383YQ16sjOUrY94QvKKXo5U
	 wvI3pUl2vEN+g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66mg263489526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:48 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:48 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:48 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 07/11] wifi: rtw89: get default channel based on supported bands
Date: Thu, 12 Nov 2026 14:05:56 +0800
Message-ID: <20261112060600.71784-8-pkshih@realtek.com>
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

Previously, because all chipsets support 2 GHz, default channel was
always one of 2 GHz. However, after adding RTW89_QUIRK_DISABLE_2GHZ,
wiphy might not really register NL80211_BAND_2GHZ.

Refine logic to get default channel based on bitmap of supported bands.
Besides, throw an error if there is no any supported bands to use.

Fixes: 355626a2c232 ("wifi: rtw89: 8852cu: add quirk to disable 2.4 GHz band")
Signed-off-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/chan.c | 15 +++++++----
 drivers/net/wireless/realtek/rtw89/chan.h |  2 +-
 drivers/net/wireless/realtek/rtw89/core.c | 32 ++++++++++++++++++++---
 drivers/net/wireless/realtek/rtw89/core.h |  2 +-
 4 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/chan.c b/drivers/net/wireless/realtek/rtw89/chan.c
index a7ba47bd9abd..6a4ea1c3f9ca 100644
--- a/drivers/net/wireless/realtek/rtw89/chan.c
+++ b/drivers/net/wireless/realtek/rtw89/chan.c
@@ -293,15 +293,20 @@ void rtw89_config_roc_chandef(struct rtw89_dev *rtwdev,
 	}
 }
 
-static void rtw89_config_default_chandef(struct rtw89_dev *rtwdev)
+static int rtw89_config_default_chandef(struct rtw89_dev *rtwdev)
 {
-	struct cfg80211_chan_def chandef = {0};
+	struct cfg80211_chan_def chandef = {};
+	int ret;
+
+	ret = rtw89_get_default_chandef(rtwdev, &chandef);
+	if (ret)
+		return ret;
 
-	rtw89_get_default_chandef(&chandef);
 	__rtw89_config_entity_chandef(rtwdev, RTW89_CHANCTX_0, &chandef);
+	return 0;
 }
 
-void rtw89_entity_init(struct rtw89_dev *rtwdev)
+int rtw89_entity_init(struct rtw89_dev *rtwdev)
 {
 	struct rtw89_hal *hal = &rtwdev->hal;
 	struct rtw89_entity_mgnt *mgnt = &hal->entity_mgnt;
@@ -321,7 +326,7 @@ void rtw89_entity_init(struct rtw89_dev *rtwdev)
 
 	hal->entity_force_hw = RTW89_PHY_NUM;
 
-	rtw89_config_default_chandef(rtwdev);
+	return rtw89_config_default_chandef(rtwdev);
 }
 
 static bool rtw89_vif_is_active_role(struct rtw89_vif *rtwvif)
diff --git a/drivers/net/wireless/realtek/rtw89/chan.h b/drivers/net/wireless/realtek/rtw89/chan.h
index e9df90c4ce3c..509e64dfcd6d 100644
--- a/drivers/net/wireless/realtek/rtw89/chan.h
+++ b/drivers/net/wireless/realtek/rtw89/chan.h
@@ -172,7 +172,7 @@ void rtw89_config_entity_chandef(struct rtw89_dev *rtwdev,
 void rtw89_config_roc_chandef(struct rtw89_dev *rtwdev,
 			      struct rtw89_vif_link *rtwvif_link,
 			      const struct cfg80211_chan_def *chandef);
-void rtw89_entity_init(struct rtw89_dev *rtwdev);
+int rtw89_entity_init(struct rtw89_dev *rtwdev);
 enum rtw89_entity_mode rtw89_entity_recalc(struct rtw89_dev *rtwdev);
 bool rtw89_entity_check_hw(struct rtw89_dev *rtwdev, enum rtw89_phy_idx phy_idx);
 void rtw89_entity_force_hw(struct rtw89_dev *rtwdev, enum rtw89_phy_idx phy_idx);
diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 4467ca25f1b0..1ef8cf5f2dfd 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -401,10 +401,30 @@ static void rtw89_traffic_stats_accu(struct rtw89_dev *rtwdev,
 	}
 }
 
-void rtw89_get_default_chandef(struct cfg80211_chan_def *chandef)
+static struct ieee80211_channel *rtw89_core_get_default_channel(struct rtw89_dev *rtwdev)
 {
-	cfg80211_chandef_create(chandef, &rtw89_channels_2ghz[0],
-				NL80211_CHAN_NO_HT);
+	if (test_bit(NL80211_BAND_2GHZ, rtwdev->supported_bands))
+		return &rtw89_channels_2ghz[0];
+	if (test_bit(NL80211_BAND_5GHZ, rtwdev->supported_bands))
+		return &rtw89_channels_5ghz[0];
+	if (test_bit(NL80211_BAND_6GHZ, rtwdev->supported_bands))
+		return &rtw89_channels_6ghz[0];
+
+	return NULL;
+}
+
+int rtw89_get_default_chandef(struct rtw89_dev *rtwdev, struct cfg80211_chan_def *chandef)
+{
+	struct ieee80211_channel *dflt;
+
+	dflt = rtw89_core_get_default_channel(rtwdev);
+	if (unlikely(!dflt)) {
+		rtw89_err(rtwdev, "no valid default channel\n");
+		return -EINVAL;
+	}
+
+	cfg80211_chandef_create(chandef, dflt, NL80211_CHAN_NO_HT);
+	return 0;
 }
 
 void rtw89_get_channel_params(const struct cfg80211_chan_def *chandef,
@@ -6987,6 +7007,7 @@ int rtw89_core_init(struct rtw89_dev *rtwdev)
 	const struct rtw89_mac_gen_def *mac = rtwdev->chip->mac_def;
 	struct rtw89_btc *btc = &rtwdev->btc;
 	u8 band;
+	int ret;
 
 	rtwdev->io = rtw89_fw_cmd_ofld_alloc_and_get_io_ops(rtwdev);
 
@@ -7062,8 +7083,11 @@ int rtw89_core_init(struct rtw89_dev *rtwdev)
 
 	schedule_work(&rtwdev->load_firmware_work);
 
+	ret = rtw89_entity_init(rtwdev);
+	if (ret)
+		return ret;
+
 	rtw89_ser_init(rtwdev);
-	rtw89_entity_init(rtwdev);
 	rtw89_sar_init(rtwdev);
 	rtw89_phy_ant_gain_init(rtwdev);
 
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 2a691daf7dab..48ef07b1d48f 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -9534,7 +9534,7 @@ void rtw89_chip_rfk_channel(struct rtw89_dev *rtwdev,
 			    struct rtw89_vif_link *rtwvif_link);
 const struct rtw89_6ghz_span *
 rtw89_get_6ghz_span(struct rtw89_dev *rtwdev, u32 center_freq);
-void rtw89_get_default_chandef(struct cfg80211_chan_def *chandef);
+int rtw89_get_default_chandef(struct rtw89_dev *rtwdev, struct cfg80211_chan_def *chandef);
 void rtw89_get_channel_params(const struct cfg80211_chan_def *chandef,
 			      struct rtw89_chan *chan);
 int rtw89_set_channel(struct rtw89_dev *rtwdev);
-- 
2.53.0

