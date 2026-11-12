Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463578;
	b=eZXobUMrRiUhYslvlENoXK28+KpTxDSX6NDqx8MW9pvaALK1DP6QCiA/W4ppTopzPJfQ
	 PBwjf7MslBaRdEKRuo97SkbTyB3Rs75YpgtKuwqfMJC3UyxcQ2K3EFUndFwRDp6o06ILP
	 Nw3q8V6zY1v4M7v4sCi2l4JQp8Jm8xl6h5EnkMx1I07LVOBy3UxGutnXYsVn6McIalJNW
	 2EqcdgITbCzr/3q7dbs81m4dtu9HaQmBX8g6KKiAOw4R/z/ERdjYQYj8AIduSRhZSxDTO
	 5+O+i3DBwagjYXNgbikNuKfUpDUM3Zs/QTXBySxNcqCLeO1Z1qXg8Yo5gypEl7Jd91g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463578;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=lLne9e4p2iX1kIZ68Xh4Soquv6Y9ez3QWeI5vmvGAyI=;
	b=Z/ofVnJOKXQa7hPf5skiF/4jNuV7qBZ3+X2oMiLhyo8Fj/ArOuLRz2+5QxmcoqPopdNx
	 GkcGQWY7HPNTnxcEAExwfrzHkl8Iny3CxpGCNP9ZDOTXgF0rS5DO3SlTR+Z3ch3bXVeCq
	 dEoe7NJIKksBhykK97/JDIMxbK/QpFMI+Z9P/VObushvvovjFp3yGPuBGhryEWMRljkYJ
	 LGE+g2kCWUch+h+SXO8FlImbjTPTif5Ob6bcT35uLIB6iauxIiv/tR49d3ijVHHIvNquo
	 YeZ9g64ZugnaqMsg6EUc8rW/7r/Gk239xcWx9yRIzNUwAZpZzp/NV3xhH8IYQah5SVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=i1puXtxW;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F904606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F904606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=i1puXtxW
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66FWi83489077, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463575; bh=lLne9e4p2iX1kIZ68Xh4Soquv6Y9ez3QWeI5vmvGAyI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=i1puXtxW8gemZ6GwhOdm62gSohJXy2Abj+0GPqEf/K5DzTVTxTzkLEk8ML2HqWfDz
	 FFJGwtqoHNtyD9e7CIuD+nx3XPHbANFkv843QcN4luAEchHU7C/Lc5w9/p+sv/F4no
	 I36fvcK7cIzyto6aGKv5Xt8Pl/oTB1KExbshl0a8RyHd6408dxHo3OAsOTcUiJuZMH
	 8RE55Sqw+vHUMcrrMhSWfb8ReiG1zNbrNO9n9fq7Dey9wEZSU1Aa9GR9SKrX3bO8cn
	 IFquVPiyrfimBD0RXry7M0i2Cyrh3yuZcFtMVlhmInd0YA5/9jiM+ppNhVPK46FJTR
	 dXz1gSTjI+VVQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66FWi83489077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:15 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:15 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:14 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:14 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 01/11] wifi: rtw89: coex: add a notify entry for dynamic MLO RF-path switch
Date: Thu, 12 Nov 2026 14:05:50 +0800
Message-ID: <20261112060600.71784-2-pkshih@realtek.com>
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

From: Ching-Te Ku <ku920601@realtek.com>

MLO link combinations such as MLD2L1R_NONMLD let the firmware switch
the WL RF-path binding at runtime between 2+0, 0+2 and 1+1, instead of
keeping it fixed for the lifetime of the link. struct
rtw89_btc_wl_mlo_info already carries mrcx_mode, mrcx_act_hwb_map and
mrcx_bt_slot_rsp to describe that runtime state, and
rtw89_fw_h2c_cxdrv_mlo_v2() already forwards them to the firmware, but
nothing in the driver ever wrote these three fields. _set_bind_info()
and _set_coex_binding() both read mrcx_act_hwb_map to resolve which
HW-band a given WL RF-path currently serves while in this mode, and
with the field always zero they always resolved to the same band,
regardless of what the firmware actually switched to.

Add rtw89_btc_ntfy_mrcx_info(), a notify entry a caller can use to push
the current RF-path switch state into those three fields and let the
coex engine react to it. Mirroring the driver's existing per-HW-band
link_mode array, a mode change updates whichever MAC index the active
HW-band map selects, and a dual-band-MCC link mode is required before
any change is applied, since the RF-path binding is only ambiguous in
that state. A dedicated reason code and notify counter are added for
this entry so it can be told apart from other re-run triggers in coex
dumps.

This only adds the coex-internal entry point; nothing in the driver
calls it yet, since the trigger for a firmware-side RF-path switch
needs to be wired up from the MLO channel-context code.

Signed-off-by: Ching-Te Ku <ku920601@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/coex.c | 62 +++++++++++++++++++++++
 drivers/net/wireless/realtek/rtw89/coex.h | 11 ++++
 drivers/net/wireless/realtek/rtw89/core.h |  1 +
 3 files changed, 74 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
index 61e8b601ca34..751ad0cfd4ea 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.c
+++ b/drivers/net/wireless/realtek/rtw89/coex.c
@@ -978,6 +978,7 @@ enum btc_reason_and_action {
 	BTC_RSN_NTFY_SPECIFIC_PACKET,
 	BTC_RSN_NTFY_POWEROFF,
 	BTC_RSN_NTFY_ROLE_INFO,
+	BTC_RSN_NTFY_GENERIC,
 	BTC_RSN_CMD_SET_COEX,
 	BTC_RSN_ACT1_WORK,
 	BTC_RSN_BT_DEVINFO_WORK,
@@ -10529,6 +10530,67 @@ void rtw89_btc_ntfy_wl_sta(struct rtw89_dev *rtwdev)
 	}
 }
 
+void rtw89_btc_ntfy_mrcx_info(struct rtw89_dev *rtwdev,
+			      enum rtw89_mlo_coex_mode mode,
+			      u8 act_hwb_map, u8 bt_slot_rsp)
+{
+	struct rtw89_btc *btc = &rtwdev->btc;
+	struct rtw89_btc_wl_info *wl = &btc->cx.wl;
+	struct rtw89_btc_wl_role_info *wl_rinfo = &wl->role_info;
+	struct rtw89_btc_wl_mlo_info *mlo_info = &wl->mlo_info;
+	bool link_mode_chg;
+	u8 link_mode;
+
+	rtw89_debug(rtwdev, RTW89_DBG_BTC,
+		    "[BTC], %s(): mode=%d, act_hwb_map=0x%x, bt_slot_rsp=%d\n",
+		    __func__, mode, act_hwb_map, bt_slot_rsp);
+	btc->dm.cnt_notify[BTC_NCNT_GENERIC]++;
+
+	mlo_info->mrcx_mode = mode;
+	mlo_info->mrcx_act_hwb_map = act_hwb_map;
+	mlo_info->mrcx_bt_slot_rsp = bt_slot_rsp;
+
+	if (wl_rinfo->link_mode[RTW89_MAC_0] != BTC_WLINK_DB_MCC &&
+	    wl_rinfo->link_mode[RTW89_MAC_1] != BTC_WLINK_DB_MCC)
+		return;
+
+	link_mode_chg = true;
+
+	/* the driver may change link mode to relieve band-switch effort */
+	switch (mode) {
+	case RTW89_MRCX_1CH_WB_H0:
+	case RTW89_MRCX_1CH_WB_H1:
+	case RTW89_MRCX_TDMRA_2CH_WB_WB:
+		link_mode = BTC_WLINK_STA;
+		break;
+	case RTW89_MRCX_TDMRA_1CH_W_B:
+		/*
+		 * both WL ports share one 2.4 GHz channel (W), BT
+		 * time-shares the remaining slots (B); treat as SCC.
+		 */
+		link_mode = BTC_WLINK_SCC;
+		break;
+	case RTW89_MRCX_TDMRA_2CH_W_W_B:
+		link_mode = BTC_WLINK_SB_MCC;
+		break;
+	default:
+		link_mode_chg = false;
+		break;
+	}
+
+	wl->link_mode_chg = link_mode_chg;
+
+	if (link_mode_chg) {
+		if (act_hwb_map & BIT(RTW89_MAC_0))
+			wl_rinfo->link_mode[RTW89_MAC_0] = link_mode;
+
+		if (act_hwb_map & BIT(RTW89_MAC_1))
+			wl_rinfo->link_mode[RTW89_MAC_1] = link_mode;
+	}
+
+	_run_coex(rtwdev, BTC_RSN_NTFY_GENERIC);
+}
+
 static u8 rtw89_btc_c2h_get_index_by_ver(struct rtw89_dev *rtwdev, u8 func)
 {
 	struct rtw89_btc *btc = &rtwdev->btc;
diff --git a/drivers/net/wireless/realtek/rtw89/coex.h b/drivers/net/wireless/realtek/rtw89/coex.h
index 38ffd0eff2c3..c3779cff9538 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.h
+++ b/drivers/net/wireless/realtek/rtw89/coex.h
@@ -314,6 +314,14 @@ enum btc_mlo_rf_combin {
 	BTC_MLO_RF_2_PLUS_2 = 3,
 };
 
+enum rtw89_mlo_coex_mode {
+	RTW89_MRCX_1CH_WB_H0,
+	RTW89_MRCX_1CH_WB_H1,
+	RTW89_MRCX_TDMRA_1CH_W_B,
+	RTW89_MRCX_TDMRA_2CH_WB_WB,
+	RTW89_MRCX_TDMRA_2CH_W_W_B,
+};
+
 void rtw89_btc_init(struct rtw89_dev *rtwdev);
 void rtw89_btc_ntfy_poweron(struct rtw89_dev *rtwdev);
 void rtw89_btc_ntfy_poweroff(struct rtw89_dev *rtwdev);
@@ -336,6 +344,9 @@ void rtw89_btc_ntfy_wl_rfk(struct rtw89_dev *rtwdev, u8 phy_map,
 			   enum btc_wl_rfk_type type,
 			   enum btc_wl_rfk_state state);
 void rtw89_btc_ntfy_wl_sta(struct rtw89_dev *rtwdev);
+void rtw89_btc_ntfy_mrcx_info(struct rtw89_dev *rtwdev,
+			      enum rtw89_mlo_coex_mode mode,
+			      u8 act_hwb_map, u8 bt_slot_rsp);
 void rtw89_btc_c2h_handle(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 			  u32 len, u8 class, u8 func);
 ssize_t rtw89_btc_dump_info(struct rtw89_dev *rtwdev, char *buf, size_t bufsz);
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7f84ee59f825..01da0b30a7ab 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1364,6 +1364,7 @@ enum rtw89_btc_ncnt {
 	BTC_NCNT_RFK_TIMEOUT,
 	BTC_NCNT_SHOW_COEX_INFO,
 	BTC_NCNT_ROLE_INFO,
+	BTC_NCNT_GENERIC,
 	BTC_NCNT_CONTROL,
 	BTC_NCNT_RADIO_STATE,
 	BTC_NCNT_CUSTOMERIZE,
-- 
2.53.0

