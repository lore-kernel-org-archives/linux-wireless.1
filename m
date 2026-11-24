Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508931;
	b=yLyWuJCXw9OOZqLE7ofZdEKRkLt9KlYgMKUGu0USEjb6Fe3OM5IFrKU1gyEIUGJPOW2D
	 N9/Bgo88Xz7Cw+L9JxfVc1pfg2NKHyOK+SkAHab3b9/27t7MHM+nVzWaFx5u8U5haWr/q
	 ZAg+DtV3Pk4O/t2v5giC5VBT1zLJOfYRlb19PjaofT+/RidfSnd9x8c2LPtHbccKu6hBd
	 zdOf5GhZa7TNyVAFKAP5kjVX6kf/JLG6YcyESCVW3spXHcy7K1wySDSS6i6hj234J+iM2
	 ecpR7eaVTvUtnVksANb5ytyvNleHScJZDQ3RnnhYDEguJLD5DPbTMpdvZE3XcTEzhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508931;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=OXcMY0PUYZ4v16w5ytVkmnKz+TrL0J2iuFlkplUiRUc=;
	b=O2NnEM9xKvb+n793+4RMkVLs+49z1r0rY3YNWjCk6mm6/1ii1+g4HXhg1oec4ujpmVgP
	 ai/isxcXTVFjL/pwrVRlezky8n51U4SH6o4yIJLgeRSYvTGBvUshVfDg2pgtl1hQMRjQH
	 s4abbcwxama9/bh8uHCTJYCa1i+K1HgvMMk2PuffvAbWijZ+HQxZkG+/cuC1WTe4qoBW7
	 TqLZ70amf72ufmjUnMejxmQFD9eK+GIzg8mwgrqADU5GSiPTZCOOL25zEpblSFYytDWAy
	 AuheNsfzM9FSLk8pmFGX5S5iwgO5PAodsJgErQv+QjNi6i8nXAwvkUhJwJkenuhKOhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=A9OXMyxm;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC2606A322
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=A9OXMyxm
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO8SmTB22381909, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795508928; bh=OXcMY0PUYZ4v16w5ytVkmnKz+TrL0J2iuFlkplUiRUc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=A9OXMyxmEGNJdNs/SXwyi77sHl3jk82i86kdmA3ZXJF3SRNDfwKP2ETErhzY5bZhL
	 +R6FUO2JjUtBxIuDwOoaK833Npi7beRU45lkymcQVfKTQIXbbQGOA76fPdAxH96MfD
	 UQFkvBWCbAY3R3e2JaEvH6WcyQLnR3IOf6elyTxfU3fcXPVxWLF3m1pAbWGdCdZclI
	 2IsVHGJzS2fiSu9j8taazfK67C4ImXoBD8M//8ivIc1lUU6msF5r3VX5r5khYGzJgN
	 F/mFotbexBwlFe6qepGaeIC+0mp1W5t8Xtogm46yWFby23DVEthyAm/Pbp31/Vw+9z
	 iTHyPnRXz31Gg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO8SmTB22381909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 16:28:48 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 16:28:43 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 16:28:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <echuang@realtek.com>
Subject: [PATCH rtw-next] wifi: rtw89: 8922d: write path diff registers per PHY
Date: Tue, 24 Nov 2026 16:28:25 +0800
Message-ID: <20261124082825.27916-1-pkshih@realtek.com>
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

From: Eric Huang <echuang@realtek.com>

The path diff tracking runs for each active PHY, but its registers are
written without a PHY index, so PHY1 results overwrite PHY0 and PHY1 is
never updated. Use rtw89_phy_write32_idx() instead.

Signed-off-by: Eric Huang <echuang@realtek.com>
Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/rtw8922d.c | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index 69eb1740ebf9..2c568bd67747 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -1857,23 +1857,23 @@ static void rtw8922d_path_diff_update(struct rtw89_dev *rtwdev,
 	else
 		ewma_path_diff_add(&bb->path_diff.avg, bb->path_diff.raw);
 
-	rtw89_phy_write32_mask(rtwdev, R_CL_MODE_TRIG_BE4, B_CL_MODE_TRIG_BE4, 1);
-	rtw89_phy_write32_mask(rtwdev, R_CL_MODE_TRIG_BE4, B_CL_MODE_TRIG_BE4, 0);
+	rtw89_phy_write32_idx(rtwdev, R_CL_MODE_TRIG_BE4, B_CL_MODE_TRIG_BE4, 1, phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_CL_MODE_TRIG_BE4, B_CL_MODE_TRIG_BE4, 0, phy_idx);
 
 	bf_smo_lmt = ewma_path_diff_read(&bb->path_diff.avg) < BF_SMOOTH_TH;
 	bb->path_diff.bf_smo_en = !bf_smo_lmt;
 
-	rtw89_phy_write32_mask(rtwdev, R_BF_SMO_PDP_LMT_EHT_BE4,
-			       B_BF_SMO_PDP_LMT_EHT_BE4, bf_smo_lmt);
-	rtw89_phy_write32_mask(rtwdev, R_BF_SMO_PDP_LMT_HE_BE4,
-			       B_BF_SMO_PDP_LMT_HE_BE4, bf_smo_lmt);
-	rtw89_phy_write32_mask(rtwdev, R_BF_SMO_PDP_LMT_VHT_BE4,
-			       B_BF_SMO_PDP_LMT_VHT_BE4, bf_smo_lmt);
+	rtw89_phy_write32_idx(rtwdev, R_BF_SMO_PDP_LMT_EHT_BE4,
+			      B_BF_SMO_PDP_LMT_EHT_BE4, bf_smo_lmt, phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_BF_SMO_PDP_LMT_HE_BE4,
+			      B_BF_SMO_PDP_LMT_HE_BE4, bf_smo_lmt, phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_BF_SMO_PDP_LMT_VHT_BE4,
+			      B_BF_SMO_PDP_LMT_VHT_BE4, bf_smo_lmt, phy_idx);
 
-	rtw89_phy_write32_mask(rtwdev, R_OS_TRIG_BY_SW_BE4,
-			       B_OS_TRIG_BY_SW_BE4, !bf_smo_lmt);
-	rtw89_phy_write32_mask(rtwdev, R_OS_TRIG_SOURCE_BE4,
-			       B_OS_TRIG_SOURCE_BE4, !bf_smo_lmt);
+	rtw89_phy_write32_idx(rtwdev, R_OS_TRIG_BY_SW_BE4,
+			      B_OS_TRIG_BY_SW_BE4, !bf_smo_lmt, phy_idx);
+	rtw89_phy_write32_idx(rtwdev, R_OS_TRIG_SOURCE_BE4,
+			      B_OS_TRIG_SOURCE_BE4, !bf_smo_lmt, phy_idx);
 
 	rtw89_entity_get_conf(rtwdev, &conf);
 	chan = conf.chans[phy_idx];
@@ -1882,8 +1882,8 @@ static void rtw8922d_path_diff_update(struct rtw89_dev *rtwdev,
 			sel_tone = he_eht_sel_tone[chan->band_width];
 		else if (bb->path_diff.link_mode == 1)
 			sel_tone = vht_sel_tone[chan->band_width];
-		rtw89_phy_write32_mask(rtwdev, R_SELECTED_TONE_IDX_BE4,
-				       B_SELECTED_TONE_IDX_BE4, sel_tone);
+		rtw89_phy_write32_idx(rtwdev, R_SELECTED_TONE_IDX_BE4,
+				      B_SELECTED_TONE_IDX_BE4, sel_tone, phy_idx);
 	}
 
 	rtw89_debug(rtwdev, RTW89_DBG_PHY_TRACK,

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.53.0

