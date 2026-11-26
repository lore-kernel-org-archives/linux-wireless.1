Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682000;
	b=baiUufLGcWCQ1zlMwiq0xkkjLqGV54HNuxMZHh3aYzEMji4FGTlh5gCySqynT2xYqcN8
	 cfSxB82aXM8XsYJA4t+h4KZFS2x/smipHIls3ckCYhHNNl5agWTWqI/dASDQwrXBwpv9d
	 vWfN1ZyGZvkhFrZ2sXf/v2bV+0aXB30+zUKBhpifplHPZ97JXl/qOhcQwgDNAzJtlJgp2
	 sLsAdjHWxNmvWo+gxFMTVJmeHt4s7aIGHjWv1+x3R59zu+cWR0YDeQk5RovnqqDaV+gjs
	 w+h41Gd81o6OcLbuMp289GPvwHj4ihhS5YI0HeQDCKZixp4cua4PKk9ea7xDlLF9JDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682000;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=YrHi3lnVLAyHuMC7PGUtpzbWe+RBGUYunHVWGMqGXa4=;
	b=LTmnoNyYGGXvawm14sqK8BWtJwUkHfxdWYQbCWM/64DBo4aAHXfBNuTnToZREeWquFD+
	 jsv2uJO3PoKC0rDHk1If9D5svb5fzznoIMH97Xcv9mpX2pacSXQdvKup2J9UA0L1kKP0o
	 x5R/zEwCsMYjiDKDaUMPuSq6jS1zgrUHAyL/QWe8lsWIPkCdwo0omgmAhsOr4gwjVVBGz
	 FB1I9lFSvJHjXwmfazvb/PyhUWwQiCqpLCVE1QUMUA7M1BaO3NXJUc8DYt3OBulZcr98t
	 zO+niU9Ss4UVT/bhxX/6JJ8CgJPf0I90vrvBegdLQBzHA0xju4M2UfdIH6ciRyyVUPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=MH3WNyqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95F606A31E;
	Thu, 26 Nov 2026 08:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A95F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=MH3WNyqS
ARC-Seal: i=1; a=rsa-sha256; t=1795681938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B+ZKOUTaAJQ134Sq0oXks9qGCiTjUmhJSCDcwyClKl1VslFY5rgWDoiC4H/17KYxIj9uSAWurPq7u8LQ3PALYec2qPhRv2cz/plKKfnJ+wBRtEx5cvfXRS45DNPR+7qQC3BN1cefYbgbk7qjU9xKGDRhjYJo5FaAOfyyMRpztyU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795681938; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YrHi3lnVLAyHuMC7PGUtpzbWe+RBGUYunHVWGMqGXa4=; 
	b=bCJRTzfL147CAvgih0n1bzL/vqpsnTm3J7YN1T9A7NTyBFeQj9sD8dtZF4DI/WfvS5yOvt6P1dWQ5kpUYN0wt1VU8hVtjvx1ousGDMkdk30c3ou8c19XkBL6ey4xjyauFf6AK4E7K8B2l1p7C4soR6Wau6ljy6eYVZ/JsSyn9+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=MH3WNyqS4twpHrUknplKUzXai5dKfgFP+8lrwRO3f94LNIYVlHWyHhCrNxMK7Xx9scncTYqZTLUg4Aej8LaY/LJ5hnCT2Hln98MqMk/kNE+5TjLVeaWDgv9qsW7in5eGom2zpj4YGVUH1F9qg3PRdm/lEpnv3peH/jdlkUAcDEgnOZIOiYBu/J2PhGfwsbiZEaEDlRdOrNjxFYY3E+PbUiVoYszuJPRHyHDCL24jrsGcuQTimOX9igR3hePAeM4eqItlRRDU5Q/nPpfpipE88P4SFizvaeo+8cHEQ2EYtKnKRrdLKfSZenW6h3OIDsgo4bDpIIpw3qINxE46Lmq6Lg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=YrHi3lnVLAyHuMC7PGUtpzbWe+RBGUYunHVWGMqGXa4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795681935888938.2172003281665;
	Thu, 26 Nov 2026 00:32:15 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next 1/2] wifi: rtw89: fix retry limit and NO_ACK status for injected frames
Date: Thu, 26 Nov 2026 13:31:40 +0500
Message-ID: <20261126083141.1470-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
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

Commit 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and
NO_ACK for injected frames") has three issues:

1. rtw89_core_tx_update_injection() uses info->control.rates[0].count
   without checking IEEE80211_TX_CTRL_RATE_INJECT. When a radiotap rate
   is unsupported on the current band or stream capability,
   ieee80211_parse_tx_radiotap() clears IEEE80211_TX_CTRL_RATE_INJECT
   while still populating rates[0].count. Gate the per-packet retry
   override on IEEE80211_TX_CTRL_RATE_INJECT.

2. hw->max_rate_tries is set to RTW89_TX_DATA_CNT_LMT_MAX (63), which
   exceeds the 5-bit struct ieee80211_tx_rate::count field and causes
   radiotap retry counts above 30 to wrap around. Set
   hw->max_rate_tries to IEEE80211_MAX_TX_RETRY (31) and drop the
   unused macro.

3. rtw89_tx_rpt_tx_status() sets IEEE80211_TX_STAT_NOACK_TRANSMITTED
   unconditionally for NO_ACK frames (including RTW89_TX_MACID_DROP and
   RTW89_TX_LIFE_TIME) and also sets IEEE80211_TX_STAT_ACK when
   tx_status == RTW89_TX_DONE. Because Wi-Fi 6 AX chips lack a TX
   descriptor NO_ACK bit and implement NO_ACK via tx_cnt_lmt = 1,
   unacknowledged unicast NO_ACK frames complete with
   RTW89_TX_RETRY_LIMIT, whereas broadcast, QoS No-Ack, and Wi-Fi 7 BE
   NO_ACK frames complete with RTW89_TX_DONE. Clear stale status bits
   and report IEEE80211_TX_STAT_NOACK_TRANSMITTED exclusively on
   RTW89_TX_DONE or RTW89_TX_RETRY_LIMIT, reserving
   IEEE80211_TX_STAT_ACK for frames without IEEE80211_TX_CTL_NO_ACK.

Fixes: 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/7904907C-A864-4DE9-AE9B-65082A38B29B@linux.dev/
Reported-by: Ahmet Zeren <niko3x@proton.me>
Closes: https://lore.kernel.org/linux-wireless/Qmyu_zaapR7fisQhYB1W9CDM3OG849otNXR4xWRbIaRocvy40VyY4N2Jte4IHqD33nCI_txHle2bL5F7S0b6Bv_uXvCyk9MJ35CFHWzopyE=@proton.me/
Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c |  5 +++--
 drivers/net/wireless/realtek/rtw89/core.h |  1 -
 drivers/net/wireless/realtek/rtw89/mac.h  | 13 ++++++++-----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 31d52fb99..8421c78c2 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1274,7 +1274,8 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 		desc_info->no_ack = true;
 		desc_info->tx_cnt_lmt_en = true;
 		desc_info->tx_cnt_lmt = 1;
-	} else if (info->control.rates[0].count) {
+	} else if ((info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT) &&
+		   info->control.rates[0].count) {
 		desc_info->tx_cnt_lmt_en = true;
 		desc_info->tx_cnt_lmt = info->control.rates[0].count;
 	}
@@ -7561,7 +7562,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->max_rx_aggregation_subframes = chip->max_rx_agg_num;
 	hw->max_tx_aggregation_subframes = chip->max_tx_agg_num;
-	hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
+	hw->max_rate_tries = IEEE80211_MAX_TX_RETRY;
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
 
 	hw->radiotap_mcs_details |= IEEE80211_RADIOTAP_MCS_HAVE_FEC |
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 87a832b5c..612389f32 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1278,7 +1278,6 @@ struct rtw89_tx_desc_info {
 	bool tx_cnt_lmt_en;
 	u8 sn: 4;
 	u8 tx_cnt_lmt: 6;
-#define RTW89_TX_DATA_CNT_LMT_MAX	0x3f
 	u8 addr_info_nr;
 	u8 sec_keyid;
 	u8 sec_type;
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index c94b34b92..5c3af59d1 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1896,12 +1896,15 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
-	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
-	if (tx_status == RTW89_TX_DONE)
+	info->flags &= ~(IEEE80211_TX_STAT_NOACK_TRANSMITTED |
+			 IEEE80211_TX_STAT_ACK);
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

