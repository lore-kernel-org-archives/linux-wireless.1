Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025289;
	b=k7CuN/Tqg0SgH6lESk4mjFJ8m4D+xhHj7e2yMHn9M8vRO0AentWMIiVvsi4laSkjZuAa
	 mkcFmKJkkZ0GbXamScMoC/AbT1AOjxaBYM1kWlHnbWoMLHOYg0NygIJ3bJmjCd6W3m24l
	 oE+FtHPHFc9LXMvvj8FfRBCZVEK/b3UmrPfwn6oVR/gsYz+x6p/cyxovHgTnN7UAV9NNG
	 GARdIz7omzQTvzor3thzTeF1uLFHQHmVLiJeUMEWQRSUjjnQKIyX7LrEuSpN0Fq+U/IR2
	 OgTDQu3foLiChthWIdKc8gp5hmRjG8XYGzH/NIJCaKR/zRY3J6fAJjjUTw9/dl9a1dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025289;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=;
	b=ujzrLP3ETDOpknUF9WTG2hNbpnJeta5iFuUETjyixqx/nV+ismw79AdLKrXSmXrbwrwX
	 Nm194xfwewYffXvFLKfi3vHhRQryv3J/55oqMd8DsHn4OrvG2t/0FH358UWyLDP21CKPL
	 ziAgfHmsstxOlO2erntwxx/us9FDf7E5VRFVLWpVNfODEDyQNJj5mOiRqdmFWTGlsfarr
	 F17EDhWmbqA5iVUOdYaLasCvx8HGYDiUwCMxXteehiMP5c8mLsYS+66ggl+UPriq3/se+
	 k94YoYTYfDDikjOEyrCnuAiBrtH2tOgeJzvz6g7gXA0+JUkUp89KpTyW16NPtf0NKCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=3pPBhleh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F73606A32C;
	Wed, 18 Nov 2026 18:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F73606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=3pPBhleh
ARC-Seal: i=1; a=rsa-sha256; t=1795025094; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L/wXWlfI1cJQIBt4wbpNkMJZrR+0KPBqGw01O/j3nGJiMhY0/HdOH3AzQ5zouaJTSzMliv4ERzMgotLs7OeLcyNCQhYnFLJHhuMRXeCgzWW0uLOOVxVphh+56uwANhQfc0zznXyz4r504BgH/6HguIJbPQbAjKBqaAqgXyN8RVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025094; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=; 
	b=HWEIRT+MVkMlIr/H/PyUTuqxmC4TSKSwtpSVBLFGUEMWAN6jIF2ZLgVNIqzsPP3P2H99KnDotFooujNzbfhx090niaOKgWvz+NJGMRss27FLfcTnxUg3CGKZurEurmvWXwb3Puqk1uDOoIl00CkYSFEVIguucE6QOK1nMAxH4ig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=3pPBhleh2q+f5qORP6HOy2ZqkA9sxeGRWXAmxMEsu6IQuZ+teH2u2Dqo5JNt5VGFUazUuYsuFIDImp9sTaXP7zOKCYv3MD88fVy6amU+8KiZeXqxgUINC7iZNSZgOo1DZxwaf76wm7kacrxpnv2zgfTtkb57eYBGgXg/gCtRZK6w+reKH0ELp4la7LuMqhsCzqUBstDql4aaqbrwI2bA6IOcwtGuguho76Mu2ztoYFx00swgX+ADeQQfBice9yUq3YchiIxi4FhBuplTbuqt4cgFs0H6omolf0+rpda7Tf7+CcrsALo5a+J+z+qpNDjywvq4Pzr8FSs17YyzvRIUMQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=OlyMmO6Vn/I3Rs9BXj39mfUFUrSrnIgjPAkfDIS4HjI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025092762967.9656945883261;
	Wed, 18 Nov 2026 10:04:52 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v7 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Wed, 18 Nov 2026 23:04:35 +0500
Message-ID: <20261118180435.904-6-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261118180435.904-1-owner@ph4ntom-rev.uz>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz>
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

Injected management frames currently overwrite caller-supplied sequence
numbers because hardware sequence numbering remains enabled when
IEEE80211_TX_CTL_ASSIGN_SEQ is unset, and injected frames ignore NO_ACK
and explicit radiotap retry limits.

Preserve the caller's sequence number when IEEE80211_TX_CTL_ASSIGN_SEQ
is not set, apply NO_ACK in TX descriptors and completion status, and
honor radiotap retry counts up to RTW89_TX_DATA_CNT_LMT_MAX (63).

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 19 ++++++++++++++++++-
 drivers/net/wireless/realtek/rtw89/core.h |  2 ++
 drivers/net/wireless/realtek/rtw89/mac.h  |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index e599058..712c10a 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1265,6 +1265,20 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	desc_info->use_rate = true;
 	desc_info->dis_data_fb = true;
 
+	if (!(info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)) {
+		desc_info->hw_ssn_sel = 0;
+		desc_info->hw_seq_mode = 0;
+	}
+
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		desc_info->no_ack = true;
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = 1;
+	} else if (info->control.rates[0].count) {
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = info->control.rates[0].count;
+	}
+
 	if (flags & IEEE80211_TX_RC_160_MHZ_WIDTH)
 		desc_info->data_bw = 3;
 	else if (flags & IEEE80211_TX_RC_80_MHZ_WIDTH)
@@ -1800,7 +1814,9 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_info)
 {
-	u32 dword = FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
+	u32 dword = FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) |
+		    FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR,
+			       desc_info->upd_wlan_hdr);
 
 	return cpu_to_le32(dword);
 }
@@ -7540,6 +7556,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->max_rx_aggregation_subframes = chip->max_rx_agg_num;
 	hw->max_tx_aggregation_subframes = chip->max_tx_agg_num;
+	hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
 
 	hw->radiotap_mcs_details |= IEEE80211_RADIOTAP_MCS_HAVE_FEC |
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 780ec47..3065e11 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1278,6 +1278,7 @@ struct rtw89_tx_desc_info {
 	bool tx_cnt_lmt_en;
 	u8 sn: 4;
 	u8 tx_cnt_lmt: 6;
+#define RTW89_TX_DATA_CNT_LMT_MAX	0x3f
 	u8 addr_info_nr;
 	u8 sec_keyid;
 	u8 sec_type;
@@ -1300,6 +1301,7 @@ struct rtw89_tx_desc_info {
 	bool stbc;
 	bool ldpc;
 	bool upd_wlan_hdr;
+	bool no_ack;
 	bool mlo;
 	bool sw_mld;
 };
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index 2e76bb1..c94b34b 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1896,6 +1896,8 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 	if (tx_status == RTW89_TX_DONE)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 	else
-- 
2.56.0.windows.4

