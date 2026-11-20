Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174302;
	b=FXOveKK3oTlaIJqRJoxdOH3u4pl74QFUoScAJzIil8N59b3Es4mJw5CdiV6iNBUfBb3J
	 M/ib0f2+lbY72ig4DCQdUO8VxZU3uU4mZgUm5UZK4X6X/xWhBjiIueTp30imZby+zc8YV
	 QhyHfqszWHqaB3cqXznwSbUVT0g+/ky3B46Oj2pw6TOHxYDq3j2ODP+C+04qsinwY71QJ
	 jW7drGfeNBJsWVXsx1xMQl1+CzXBKeCxMy/ElCwZR/E1Y1lBTZt5ISrb6k6K0+HWFTcum
	 Zfi3U9klw9kQOGHemd4YOPa3rOWfb1KBy7mJUsrQnYYeGgycC+D/eimiGscQsWtu6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
	b=GwNbRefPQVrm+2xGHZEkxZyPSd5AEcNBaMwAbkbaxEvs9SmvtnTKSrLud3V+McNlY2Qu
	 2FGKx7qEoQiqAoHqmFapo2wNLfBAcKCYy2XEcruqs9YHHyf9I54IWVkvEY50y2g8ZEy83
	 FiHeYapsr6OsZ+78pu9ReIWbnFpm0VhXq5dCrdFgkYZJNiRjtSAt8I4qWh/q2jSkS1O9S
	 mulCtTSlM1TXdtyHdP6eEEjZPXDObldMHHB9F1gyFADh82PlU6XxHYZ6E3S67cp0HeCp1
	 9AvAQ5Ju1yADyceqo0B4nCW6U7Ln3t5h8tOFLdYFTfk9bq1/QqRu7ct9AuxYwIXfIfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K31j6YOs;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0F60A3829
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A0F60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K31j6YOs
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so306543eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174301; x=1795779101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=K31j6YOs95IyG0QTJMmxOL2GCA0yai8HBZK4FJAOQmMFmhQkGyUrEl/Fx9Uc2EneUO
         9+GzQUgFRTymN7XThgVKVpYperPcD1P9alf31tdqzgleMgnmSViIkzJikSZDe+Kq12J3
         F6087Z9vJQL67MQEqOwP/cmfXMqTx45p31iH6QY24Lb11n6Tjx1FOm+hG+BgjxmGaSca
         ymB02MXEo3M0p5V3/V9Rmy77EmJxDW32iE0e/mK3PVX3QnRyOnfeE/rAlYnAwO7rcTTu
         NpGBe0qRJXZg6qM0DXlDfkBV9mgYb76FfLnX0+IeaqV4n9Mj2T/QtuhpzwWCqViNe4f+
         ElNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174301; x=1795779101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=RCZ+xMCOcQolu2X2+eeLVz/guqRY8SpaqK+t3NcZIxD3tVeAu8o8UmQM2e3U9yMWKW
         Fq42bMFXk7MHX+Ku6tmdNtTswI+PX2buuRvWL0Lq8r0Wm29V0Qu+eEOeDv14JCXiEiJD
         C/DJ7dppcES3ukH5mOoRHStVmmOCNLPD9m50OQTj2kQB/XC5oh4JgaTPzfM9EW9YtSMa
         4QLuS2i/okf5RSAJlt3bHPsr6yzcdKg5jkN/wuHXcBXN8kJvdKP5oJ7SNPYQ+Q/2cz0V
         oGZUxu8+M7xNzqZw0bjUfLVe46VR9PCaC3St+tXGJxPYUTk+qvXmrqFxRvsRypbQAyAN
         RUuA==
X-Forwarded-Encrypted: i=1; AL+hErG5d94s8K93Vq/K42Qyt5YeTWCd9bAonQd5vot/lELvLdv2jsOwVaajC4GzAzIy6m5rMT9y8irllUrTcX0w8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8oWFcZD86gyTAZWYDnOaEyjgHoo2oph5O7S2VYTLqfI3Umh+v
	bRp9NvHD7r6iFBAow5bjegQes97lNWtbpBKtCHWRJRK4R5d/v1Jv9FLt
X-Gm-Gg: AZFdTZfCVD/3Ge/8kge3mOC82ulwVRtFgSMaHxpJcasjyV+7G4K6RRX9rhM2homeK4R
	g2bRLaYzUeaSB15XIBPQR51pjlp3juUlSjCWMoVPy1gqJpQr8Fp2S0SwPUFtUcdHeOrziJ3w1ce
	vk8ypxGfkLQftV3nFWvQBdr58/Lb81E7x5T5tdUsEAXancl9x5RIZaeuY/NDIBOttXwF56GNUxq
	BQ5UlXE1VhCE4bpEuM5F9CRwRTkOeT/aOmhTPSklgUPGlM0kCl8BitGblxauRfIVBp7KC4CLbbg
	MTMBvKFfGTiqpt9R8pH9AGDKZDsd8g1VcLMGtTmhIvVEzexIvoojJ9BwJ8jJnmHhmdiaftYjbn2
	U70hYWL9VMLdzAat+8FDkM1XcKCP5zTK4Z5VdNL9juXDkYDNrtkjiFIQ3Db3TRD8uqUE/8379WB
	Du7ICfqiGSR/g2d0tnG5exEUk8hhF43zCUt5J1MiJhLD+AAp6YLF80dur9gt4mpCZjSDatQOvJk
	bN2/LmOm5tr2QITwwvyrQxaIYLg9cA3y0gMU4WHUg/lk5mAACRgU+3D5A03y+Sp3uPDT/c46Ybc
	aLh/2kidFcz2fPV72Hs5//BUFQJA+ntutH2nIvOmopdhi4dDkj11/z0UNbnuuvolSSJP+irMqgW
	k9IxUOW6dSl26LVPfDNsRkwrb8GXeuNCtLrrV46kaWABZ6I0UcrMiOIK+O79OvCz+Sw==
X-Received: by 2002:a05:7301:182b:b0:381:2f5d:a696 with SMTP id 5a478bee46e88-38571414835mr2600667eec.34.1795174301099;
        Fri, 20 Nov 2026 03:31:41 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:fe98:6351:c2cf:22c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7134347eec.16.2026.11.20.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:40 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v3 5/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
Date: Fri, 20 Nov 2026 19:31:14 +0800
Message-ID: <20261120113116.153232-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120113116.153232-1-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com>
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

Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.

In an aggregated transfer, rtl92du_rx_segregate_hdl() copies each
frame into a new skb with room for the radiotap header like in usb.c.
The last frame reuses the original skb by pulling it to the frame's start
and trimmed to its length.

Test results (2.4 GHz):
   before after
TX 5.2    6.4
RX 27.1   32.0

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 .../wireless/realtek/rtlwifi/rtl8192d/reg.h   |  4 ++
 .../wireless/realtek/rtlwifi/rtl8192du/hw.c   | 18 +++++++-
 .../wireless/realtek/rtlwifi/rtl8192du/sw.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192du/trx.c  | 45 +++++++++++++++++++
 .../wireless/realtek/rtlwifi/rtl8192du/trx.h  |  4 ++
 5 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
index 639aa0d92e..7cc46f411a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
@@ -329,6 +329,7 @@
 
 #define REG_USB_Queue_Select_MAC0	0xFE44
 #define REG_USB_Queue_Select_MAC1	0xFE47
+#define REG_USB_DMA_AGG_TO		0xFE5B
 
 /* ----------------------------------------------------- */
 /*	Redifine 8192C register definition for compatibility */
@@ -940,6 +941,9 @@
 #define ENSWBCN					BIT(8)
 #define ENSEC					BIT(9)
 
+/* REG_TRXDMA_CTRL */
+#define RXDMA_AGG_EN				BIT(2)
+
 #define HQSEL_VOQ				BIT(0)
 #define HQSEL_VIQ				BIT(1)
 #define HQSEL_BEQ				BIT(2)
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
index ff458fb851..3edd5bc432 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
@@ -489,6 +489,22 @@ static void _rtl92du_init_retry_function(struct ieee80211_hw *hw)
 	rtl_write_byte(rtlpriv, REG_ACKTO, 0x40);
 }
 
+static void _rtl92du_init_usb_aggregation(struct ieee80211_hw *hw)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	u8 page_count = 48;
+
+	if (rtlpriv->rtlhal.macphymode != SINGLEMAC_SINGLEPHY)
+		page_count = 24;
+
+	rtl_write_byte(rtlpriv, REG_TRXDMA_CTRL,
+		       rtl_read_byte(rtlpriv, REG_TRXDMA_CTRL) | RXDMA_AGG_EN);
+	/* unit: 128 bytes */
+	rtl_write_byte(rtlpriv, REG_RXDMA_AGG_PG_TH, page_count);
+	/* A larger value is a shorter timeout. */
+	rtl_write_byte(rtlpriv, REG_USB_DMA_AGG_TO, 6);
+}
+
 static void _rtl92du_init_operation_mode(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
@@ -712,7 +728,7 @@ int rtl92du_hw_init(struct ieee80211_hw *hw)
 	rtl_write_dword(rtlpriv, REG_RARFRC + 4, 0x08070605);
 
 	_rtl92du_init_retry_function(hw);
-	/* _InitUsbAggregationSetting(padapter); no aggregation for now */
+	_rtl92du_init_usb_aggregation(hw);
 	_rtl92du_init_operation_mode(hw);
 	_rtl92du_init_beacon_parameters(hw);
 	_rtl92du_init_ampdu_aggregation(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
index 88e8cc590c..6b90002b69 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
@@ -238,7 +238,7 @@ static const struct rtl_hal_usbint_cfg rtl92du_interface_cfg = {
 	.rx_urb_num = 8,
 	.rx_max_size = 15360,
 	.usb_rx_hdl = NULL,
-	.usb_rx_segregate_hdl = NULL,
+	.usb_rx_segregate_hdl = rtl92du_rx_segregate_hdl,
 	/* tx */
 	.usb_tx_cleanup = rtl92du_tx_cleanup,
 	.usb_tx_post_hdl = rtl92du_tx_post_hdl,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
index c608c51f1b..1641099368 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
@@ -19,6 +19,51 @@ int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 	return 0;
 }
 
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	unsigned int offset = 0, pkt_size;
+	struct sk_buff *new_skb;
+	__le32 *rxdesc;
+
+	while (skb->len - offset >= RTL_RX_DESC_SIZE) {
+		rxdesc = (__le32 *)(skb->data + offset);
+		pkt_size = RTL_RX_DESC_SIZE +
+			   get_rx_desc_drv_info_size(rxdesc) *
+			   RX_DRV_INFO_SIZE_UNIT +
+			   get_rx_desc_shift(rxdesc) +
+			   get_rx_desc_pkt_len(rxdesc);
+
+		if (get_rx_desc_pkt_len(rxdesc) == 0 ||
+		    pkt_size > skb->len - offset) {
+			rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
+				"bad frame at %u of %u, size %u\n",
+				offset, skb->len, pkt_size);
+			break;
+		}
+
+		/* The last frame keeps the original skb. */
+		if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >= skb->len - offset) {
+			skb_pull(skb, offset);
+			skb_trim(skb, pkt_size);
+			__skb_queue_tail(queue, skb);
+			return;
+		}
+
+		new_skb = dev_alloc_skb(pkt_size + RTL_RADIO_TAP_SIZE_RSV);
+		if (!new_skb)
+			break;
+		skb_reserve(new_skb, RTL_RADIO_TAP_SIZE_RSV);
+		skb_put_data(new_skb, rxdesc, pkt_size);
+		__skb_queue_tail(queue, new_skb);
+
+		offset += ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
+	}
+
+	dev_kfree_skb_any(skb);
+}
+
 struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 					 struct sk_buff_head *list)
 {
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
index 8c3d24622f..47d7d6ad8c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
@@ -18,6 +18,8 @@
 
 #define WMM_NORMAL_TX_TOTAL_PAGE_NUMBER			0xF5
 
+#define RTL92DU_RX_AGG_ALIGN				128
+
 #define WMM_NORMAL_PAGE_NUM_PUBQ_92D			0x65
 #define WMM_NORMAL_PAGE_NUM_HPQ_92D			0x30
 #define WMM_NORMAL_PAGE_NUM_LPQ_92D			0x30
@@ -56,5 +58,7 @@ struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 void rtl92du_tx_cleanup(struct ieee80211_hw *hw, struct sk_buff  *skb);
 int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 			struct sk_buff *skb);
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue);
 
 #endif
-- 
2.53.0

