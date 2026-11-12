Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463594;
	b=EvD+iOFPg99DlmeQ9hr5y23Y0q2ZEmRNtDSYRqI7BkkCSBfEiOxQ/Svun6qkuz6yFmtq
	 cSMVMMJXfKuKUa4C4wVnmNhKH8sD+G9qSJrB3hzbIY4UbW3vO5gMCQHHQNCMWWXtdFXtV
	 /DbcsvjxMh/F13X/eIiLXUJxng+pfBrPciQ01I/GemVhzw1n4R99SmX+o/lTD5J/5dD0d
	 CGaXmZCe+44CK/pqaEGBeKl83cc5yR1ETbxQOxXX2Z77IHfMdqeS0iZ9CQVpLMausmfy8
	 AfHObO45Shn8hhO7b29nJa7tf8t1h+WQuzXgJs+BZImjTHITb/evTEnGCoua0BPWMvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463594;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=G/KJ4MVnwvJk0T2kEqLKDbEkxUvlytiuvFYRPBQU4i0=;
	b=3n5RdQZsxINFYIGCozYGp/vzBYFnbjMYooI60UJrmLoap4uiV0CtGFProvNX7pLM8Owk
	 ZiVIjug3zEOQvBdsYlWUUDexHa4MaVhbBStJsJENlclfeicParkLdEFp3UmgHjMK8u2pU
	 yRUIwkzpg/xyRjdXSczmwaGR0fb1xCN5ZFzQXOX99r0qISNveykmYJE3VoajVB5LHqcUt
	 f4M6a3cx9T9AnhGCUmJO+GDywzouYYHTEEnBqONGhqEHZDcZlNKpLyAy/c1KEYJUWGaLt
	 cZ0DxcUFjsG2UWkboqAxiIHXuHga7RB5GgSY6chXxUaabaAzvLjd16DIRX0BtDEK49Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IHHNPCib;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DCD606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IHHNPCib
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66VM503489232, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463591; bh=G/KJ4MVnwvJk0T2kEqLKDbEkxUvlytiuvFYRPBQU4i0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=IHHNPCibc+BXFXF0wqPpI+TLeA2HcN32K3FP2G6UbvkoxtTqawIoX2KANeDQjW5lr
	 fOoUo8GsLop2X+y9rPmW7jpKk6e6yoginrnrN2PD4gpViO6P2kVqOqVq7RE2BabwuS
	 Y6MHb2I+bhG6DNMrAGmBRz0k3dEwqAoud1B7iiwMF25fNktCZ8zRPNp7u7OqAtjh7R
	 D5R/iMMGf9Z8OSn5wx941TPu4pByUryhR4/4lXWSVQkMpuQaHV/DsMkDMiymNz0q5l
	 6U3Ewxt5++zrFAp+MG6bBgzMxsvY3dv+WulRlJLqxQE5W5ZV8m6VEXLJUDFLQ7MbCY
	 LFX6t7NKtqa+w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66VM503489232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:31 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:31 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:31 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:31 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 04/11] wifi: rtw89: 8922d: set CFR clip threshold while setting channel
Date: Thu, 12 Nov 2026 14:05:53 +0800
Message-ID: <20261112060600.71784-5-pkshih@realtek.com>
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

Set thresholds to let CFR circuit to clip TX peak amplitudes per band.

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/reg.h      |  3 +++
 drivers/net/wireless/realtek/rtw89/rtw8922d.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/reg.h b/drivers/net/wireless/realtek/rtw89/reg.h
index edbfc9514a08..4bee9f66038c 100644
--- a/drivers/net/wireless/realtek/rtw89/reg.h
+++ b/drivers/net/wireless/realtek/rtw89/reg.h
@@ -10967,6 +10967,9 @@
 #define R_OFDM_RPL_BIAS_P1_BE4 0x2460C
 #define B_OFDM_RPL_BIAS_P1_BE4 GENMASK(11, 2)
 #define R_TX_CFR_MANUAL_EN_BE4 0x2483C
+#define B_TX_CFR_CLIP_TH0_BE4 GENMASK(19, 15)
+#define B_TX_CFR_CLIP_TH1_BE4 GENMASK(24, 20)
+#define B_TX_CFR_CLIP_TH2_BE4 GENMASK(29, 25)
 #define B_TX_CFR_MANUAL_EN_BE4_M BIT(30)
 #define R_PCOEFF0_BE4 0x24880
 #define B_PCOEFF01_BE4 GENMASK(23, 0)
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index b874bac9bfee..ca7491bb9045 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -1969,6 +1969,23 @@ static void rtw8922d_ctrl_bw(struct rtw89_dev *rtwdev, u8 pri_sb, u8 bw,
 	}
 }
 
+static void rtw8922d_cfr_clip_th(struct rtw89_dev *rtwdev,
+				 const struct rtw89_chan *chan,
+				 enum rtw89_phy_idx phy_idx)
+{
+	static const u32 clip_th0[RTW89_BAND_NUM] = {0x8, 0x8, 0x8};
+	static const u32 clip_th1[RTW89_BAND_NUM] = {0x18, 0x14, 0x14};
+	static const u32 clip_th2[RTW89_BAND_NUM] = {0x8, 0x8, 0x8};
+	u8 band = chan->band_type;
+
+	rtw89_phy_write32_idx(rtwdev, R_TX_CFR_MANUAL_EN_BE4, B_TX_CFR_CLIP_TH0_BE4,
+			      clip_th0[band], phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_TX_CFR_MANUAL_EN_BE4, B_TX_CFR_CLIP_TH1_BE4,
+			      clip_th1[band], phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_TX_CFR_MANUAL_EN_BE4, B_TX_CFR_CLIP_TH2_BE4,
+			      clip_th2[band], phy_idx);
+}
+
 static const u16 spur_nbi_a[] = {6400};
 static const u16 spur_csi[] = {6400};
 
@@ -2551,6 +2568,7 @@ static void rtw8922d_set_channel_bb(struct rtw89_dev *rtwdev,
 
 	rtw8922d_ctrl_ch(rtwdev, chan, phy_idx);
 	rtw8922d_ctrl_bw(rtwdev, pri_sb, chan->band_width, phy_idx);
+	rtw8922d_cfr_clip_th(rtwdev, chan, phy_idx);
 	rtw89_phy_bb_wrap_set_rfsi_bandedge_ch(rtwdev, chan, phy_idx);
 
 	if (cck_en)
-- 
2.53.0

