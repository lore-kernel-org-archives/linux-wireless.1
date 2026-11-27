Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774539;
	b=J842X5JS1mneDQu0Io04IVXg5JiWDlC8IgeHkDnHoeQVr9HJeZsVImknJ/q0PDCVwya+
	 q4fwnTvkusglqVGVCectsWt5ahXuq77PSP+UwSuvVVIWes1xW+nTCdGgS0CXqVN+ouzR8
	 jedh7ffztXvm4CKPby/6b5g6XZ50Hl6My52wCqXyoB/9zqKqesXed/QKczqfQ75dwD2s1
	 YpoCqvzGvimcwGAPVA4XbP1dYscPsuAh3rLl4zB9QD9LP/xFi0th1GTiObhBSMsxhCAVZ
	 9ENmmGczhdxytUyV0vc6nN6PWGHkFYiZgFGDafPASbqs+leMba7PBLCg0IvADdy4dRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774539;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=qMDSrlM+SI93+u5mu3V2aV2rE42pcZ6M06xOmmqF0UU=;
	b=yz5H2MvTOPtwVSDFhy16t7pL1V9rKdDI2+cvqoyOkEu0+4mF4vYONYA1oADv7mXggues
	 YzBTEfMzBO4nPqWOq+ZRUPa9mR7nvz1nklHvwBrzgyEjt0zgpBruqcL+fzKD9/wykrLrl
	 Nk/qsWl9c7EQeQjAlRIxYuiP34TsYHgZD7lFtTSl4UMGhCl1NVTjoTZ7tWqk/WJkiyW3b
	 EkerA869ikXYS0lfFYPFkLsiejdoAcD39ZCQmR+IFLiJXuZcc8bQsikb947a7T9ktYqUh
	 0D/4hhYjN9uDxgB+T7sYn9UlXlpqSXM/3k1DHpy9EB6o5HpdYStR9RdJ5MWHopv+pRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=UXFaZbvY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55292606A330;
	Fri, 27 Nov 2026 10:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55292606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=UXFaZbvY
ARC-Seal: i=1; a=rsa-sha256; t=1795774396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iwdaZOPZH3Twll4i4ntCSA2KFfEJEL8Sr+xnl2pkwFZPRznpNVPnrN8RwyuFF+j0fMvn+yy+xKI1yf+KIC3LBEDW5udu5r3KofHp2F9G1hpUzSHJGVzEU8wGaREWI+kJXRygo1Ox1JvGfeiokNaysgONLzhlz7zCGXVxP9S2yJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795774396; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qMDSrlM+SI93+u5mu3V2aV2rE42pcZ6M06xOmmqF0UU=; 
	b=St3KMLFVKEMdQP1KZ5tv3mdqXYRYvE/rO4KIiLd2swd8ZfCiZCMxKVL+zztU6ppK/evYmpgRKIubKs2E9LZldDBSoUfxXj1Q3yHNyQw2sw+0FKa2lFGmU2yqV5bPPPz6cbRpLkx3cbLe4E9ALGDGg4mJsA50g/Mv2O7APCHzuOc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=UXFaZbvYMZjMavqD3y8Xpf4XGqxHpTod4SAee2mOBzJhK7JiRjLa5FY7a9cytxW1Vn1L26m3SZEB7YNPcQwokP4pWVAYAeQz20zvwMZvuYvI/84VG01HERwpJAjnmOPnZrB/z8vEzjdcF6yV1NYl7FCLCy+ZGSdpiPBpNAygIo1zPtXGrvq6KU7uRwB7L6QkO5Otsh2MvMc0FePz7v+Q/zw+i9tFWORiU+RS+WleKL/Uhai4R5+vIO4d76b0jWAklx1lJv8aD4M334CL9LdJd7B/DlQVhFwsL+h6uhJ3azzItULMiue38obsMuJm7w5ROBpOgHPOY8rR9c/pv+6TeQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=qMDSrlM+SI93+u5mu3V2aV2rE42pcZ6M06xOmmqF0UU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795774395751683.3448133009372;
	Fri, 27 Nov 2026 02:13:15 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v2 1/2] wifi: rtw89: fix retry limit and NO_ACK status for injected frames
Date: Fri, 27 Nov 2026 15:13:06 +0500
Message-ID: <20261127101307.15-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261127101307.15-1-owner@ph4ntom-rev.uz>
References: <20261127101307.15-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

mac80211 clears IEEE80211_TX_CTRL_RATE_INJECT if the injected rate is
unsupported, but still fills rates[0].count. Check RATE_INJECT before
applying rates[0].count in rtw89_core_tx_update_injection().

Cap hw->max_rate_tries at min(RTW89_TX_DATA_CNT_LMT_MAX,
IEEE80211_MAX_TX_RETRY) so radiotap retry counts do not overflow the
5-bit rates[0].count field.

In rtw89_tx_rpt_tx_status(), setting IEEE80211_TX_STAT_NOACK_TRANSMITTED
on dropped NO_ACK skbs (MACID_DROP or LIFE_TIME) makes mac80211 count
them as transmitted instead of failed. Only set NOACK_TRANSMITTED on
RTW89_TX_DONE, or on RTW89_TX_RETRY_LIMIT for AX unicast NO_ACK frames
sent once with tx_cnt_lmt = 1, and do not set IEEE80211_TX_STAT_ACK on
NO_ACK frames.

Fixes: 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/7904907C-A864-4DE9-AE9B-65082A38B29B@linux.dev/
Reported-by: Ahmet Zeren <niko3x@proton.me>
Closes: https://lore.kernel.org/linux-wireless/Qmyu_zaapR7fisQhYB1W9CDM3OG849otNXR4xWRbIaRocvy40VyY4N2Jte4IHqD33nCI_txHle2bL5F7S0b6Bv_uXvCyk9MJ35CFHWzopyE=@proton.me/
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c |  5 +++--
 drivers/net/wireless/realtek/rtw89/mac.h  | 11 ++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 31d52fb997..ce5c5ff5c8 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1274,7 +1274,8 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 		desc_info->no_ack = true;
 		desc_info->tx_cnt_lmt_en = true;
 		desc_info->tx_cnt_lmt = 1;
-	} else if (info->control.rates[0].count) {
+	} else if (info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT &&
+		   info->control.rates[0].count) {
 		desc_info->tx_cnt_lmt_en = true;
 		desc_info->tx_cnt_lmt = info->control.rates[0].count;
 	}
@@ -7561,7 +7562,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->max_rx_aggregation_subframes = chip->max_rx_agg_num;
 	hw->max_tx_aggregation_subframes = chip->max_tx_agg_num;
-	hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
+	hw->max_rate_tries = min(RTW89_TX_DATA_CNT_LMT_MAX, IEEE80211_MAX_TX_RETRY);
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
 
 	hw->radiotap_mcs_details |= IEEE80211_RADIOTAP_MCS_HAVE_FEC |
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index c94b34b927..748945bcda 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1896,12 +1896,13 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
-	if (tx_status == RTW89_TX_DONE)
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		if (tx_status == RTW89_TX_DONE ||
+		    tx_status == RTW89_TX_RETRY_LIMIT)
+			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+	} else if (tx_status == RTW89_TX_DONE) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
-	else
-		info->flags &= ~IEEE80211_TX_STAT_ACK;
+	}
 
 	ieee80211_tx_status_irqsafe(rtwdev->hw, skb);
 }
-- 
2.53.0

