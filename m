Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075593;
	b=NEwMLK+Q16YIkU9laeQ2JFfwI6zvcK6me7MvxT7dZxf8WNeRnPhoZoipvbU+Z4abCzjj
	 RAq0YiwDFYPlrEDpuBK6rAzRAhZV2mga/UQBAahhxXz1ZX8Ij7CNHpz+5py++ZL/MN8cz
	 /OgVHHi2pIXqzbh1vOUnRZIiJXZ+WEphXqVdgJ+AOIiGze/MEKsdjJO1aEbGDVou5BYzr
	 SUI3LF8PFszauxMJCPQGmaUBZfIwZ5QTbtDNbVU/nUEn7ddp7YYyzDskNaliCDIbzzMRX
	 gOaLxq5oM1QDuJe0aadd7oLupjQLAmwZ3EaCauqracfiXYRmmBdTTIZAty5G1c17d3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075593;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=x592QlCqP3NAGS66BQvh5Y/fK6YpFNE8n+7UoNyzVos=;
	b=1m4EsG+x48t1ICwVyrF8rDxcl+ZF5pChzwcj2cKFdGVrIe0tVGiF3uwC3j1fogTYhgKH
	 jjBOB+6dTg72+0sp2hpLq4xUYHMq0Vz3qofWkYNMY/BAF+Hy7ZWFiazJrcUXSsXG2RBOT
	 Rr+FyqdAEiKYEFHdZAhtxQb7Pr5hF2z1KzHQGeWfUMQyquZ8MqBnDgkhCJGiYivdxCTtf
	 +N+RkR8HGysWnuoI8RS+YVvl+c3MI1sWeYXJS6icmA9WMms9iRfZ2caCxzSsivJzrhLny
	 mD6YmfaMeWYliiIxpaD+5LhUT+c3d2+Jwwn1mUQJA7o32J6G3hir+/ACyfZ3WBCrt7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=kKZnk4Hs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FFE606A320;
	Thu, 19 Nov 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FFE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=kKZnk4Hs
ARC-Seal: i=1; a=rsa-sha256; t=1795075426; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SUd2iF6Ke2Ss2YeOQ+P6vICL6GSS7L3UNC0kYI2LZhhuASi7TUAvSO6Dug7Slybm/5rOrA6pX3PyVNAehOLVaGFpWyS7hj9XdNtWhIMd0KnBzar2GsEGV0dzgGod4GzFxaBt/ZtpIqshgWUHmdhgXM/rz8xz44Zv0ZIr1qmDLQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795075426; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x592QlCqP3NAGS66BQvh5Y/fK6YpFNE8n+7UoNyzVos=; 
	b=E2VolWbnjzTaBYQyvY8RjNZqHlomiVF19n1Zw786tKrzyNMuL+BsTJzUuqGQPXE3uazSbPCMah2tngqI8OP2PYeVDPmby02rEjz+GZmYnHBkL89/A3y2CPFvUgERzVB1Lm7EZ6ECWb/v2fyYRc+FN/3e8cjJgVvotvh0ip71uzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=kKZnk4Hs9YwG/ezT9Sb7hPa0rkUW76M5Mj8U7xF4rsLpu9PYIChzTmJx4hbPNeWzKBJkGfo4RCz8VzFywt0aYJgdyJiTkLdaqN1MhpMdtS7zlY+DOmW4riGOONG9wMhpHw1JSBv5XNMt0VzAeGYOjAnoUEiWwOXRUhFv0WPvJCUOdJIC/wrr7+eRGmSikKL4BylXEFYFEMXX5SV7eLwwIaNsKih+L1MpWjb/ZNjdJILUEOVWO+0UQvIZi7H8Vd9PNkTQRBfykLBFOUYVymQ44leVedoS1Fp42PpFIp305fUqUeJK4HRWkuAPfMyQN4cr0fbHPGd8ZMLXXXh2Ut19oA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=x592QlCqP3NAGS66BQvh5Y/fK6YpFNE8n+7UoNyzVos=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795075423505170.84166691530243;
	Thu, 19 Nov 2026 00:03:43 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v8 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Thu, 19 Nov 2026 13:03:28 +0500
Message-ID: <20261119080328.391-6-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261119080328.391-1-owner@ph4ntom-rev.uz>
References: <20261119080328.391-1-owner@ph4ntom-rev.uz>
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
is not set, honor radiotap retry counts up to RTW89_TX_DATA_CNT_LMT_MAX
(63), and report IEEE80211_TX_STAT_NOACK_TRANSMITTED for NO_ACK frames.
Set BE_TXD_BODY6_NO_ACK on Wi-Fi 7 chips that carry NO_ACK in the TX
descriptor; Wi-Fi 6 chips such as RTL8852AE do not have a TX descriptor
NO_ACK field and only limit transmission to a single attempt via
tx_cnt_lmt = 1.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 18 +++++++++++++++++-
 drivers/net/wireless/realtek/rtw89/core.h |  2 ++
 drivers/net/wireless/realtek/rtw89/mac.h  |  2 ++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 3d1fed6..3771f50 100644
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
@@ -1801,7 +1815,8 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_info)
 {
-	u32 dword = FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
+	u32 dword = FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) |
+		    FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
 
 	return cpu_to_le32(dword);
 }
@@ -7541,6 +7556,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
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

