Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297730;
	b=eWpZmBQCWO0137S8/XHNxkKPnUDDEHCHNoYPiDhrTBWUBcnqZta0sdvfHHW024tf9+U9
	 g/SpvBFKTf28nlb7Aoq51zkKr3fgTSzQUxvwEuI5qna7KMWsjF+YQyKHKcra6LKm8XnXX
	 TCVMvTTNH3cfT6NjC+QbVcmQW9ikTKbNs4D4vCuMEgrUn19mZPkrQsQqfWRhGG3JpKeDi
	 bLHwuciznDBd3SfRyBxC8Hw/REuBFTz2jo+tIs4kqFM25ZUY4O5t0kHXMHcK5P44MlmVH
	 zRBAdl5NVC7g90mt1v1i0MHzfwmNyTZzsf+tRirHUxsIOKtnQrA9ZQlsLsviXocsuQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
	b=lJzURCg6OsEQkovh9+ObaS7mN+xcb5UJZOWJSWIf457DKJpSxqY+YkWnILQ5AfZJqeA0
	 KT2I+v0eicI5g60d4pCbCnnpKZhVGjWOquwznYjnh20RTZBh7dOysXpCigHAqR/rmq9v3
	 fWYurITVpre/zP/zpv43ImVvXwvtieXGL4S9WBjxUG766Cp/GlvAbfkSUHp9yOkhTkGoK
	 zGojy92wEYBvFvK1OOOWITiBIvhw3hr+1jWJbTj6wrly9lA+jGLKcvYa52dyFbEzL+PQf
	 fod7H7bW7LcK83Qoha8/66C1IBCqPilxfZfQgdMvNjfmHbbtczAwqapx3/a5jaPDvBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkmUX8fS;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBB60A260E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FBB60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkmUX8fS
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1000845a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297729; x=1794902529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=XkmUX8fS3amNZJIYM2vhvIltjBGKUy3zMAGUEvjuatbZZYo9txfUM0C57kUAXY+rJC
         w5clIc84LOencQfONzujEGlRaIcwlRO4Wuadds1Kgzh0Mv8Eh4ud+oHNW3llvyf4Bpf3
         Dby1UxuwY2foOM4CwYBYg6QnDu1u89IfA+mm0vO/84sZtD7qqwZrWhC5KyE1MKd0ok9X
         USAwZoPgxti77zQ2dvK+tjuZ3WnK9XqpfTnepFns8sSo7SE/6JjWGVPyzP8V8/eu9LdF
         wipBZsWkXc8xst6MVOAdWgJ12BLtLdk1iykqQhebtLXC2lAEIXLi+OoO5SUDKFUyvE8r
         UC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297729; x=1794902529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=NEl1pjZn7283l7lbyUQAwTkjAv+/cSQQt8hgyaKiRpjj0+h/Hya7aLbHE33t3r+p5Y
         gTFDZmO8JrVR07nls9r2ubDOEJjFrASnKMoSZWK+XeRHhQ5A1SgJMeWoViz0Drs3JOOF
         qa+xeZMpOf+t855MbOXRQ3grvkNrNuhX82kF8ctPwHc428NbaZfe4TEXuwLy4Fulc9M0
         PVc7A3TqH/sp6ZahZseafN02Cp3Il5YkqMUYenSDi80mqRZvGdJila468+g9zGFmlyrs
         cPSOORpr+yGk29A+BEs/soykM33MggP2VSINOstKmmqht1oh5xd3abHNdsixy/8wgyvx
         uqCA==
X-Forwarded-Encrypted: i=1; AL+hErEBy7s3TucJQo7UJhgqomeU8TyhYsZR2iUyIAUtBFSY3kYAETI15vgOXeGtfi+Q5SJDZPjvqR72LTiryvJvuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/FAwIHJOnawYaqRIsTM7tNDAnbZFFXzRfwm+nKK5zouk961kv
	d3Sd6em6WaGev7DzKFgHr8rqZUEXuZdHHKXPIndgMqJwoZmNuAm/dY7q
X-Gm-Gg: AYBFou0NCvTcluxGQZDHGB1mw1ZeL+eL+MIl+KnV+j8gsyqD5ceJwpS1Bu6W/co294S
	t8SeIL1YYdLtqd6JiEtSflXrX08kR1OefVDB2Z0CUkdLya85oSUt9/E6F8aj+igSFaLdU2AhWfr
	k3XFTEa9LXs/nUbZNHfL48pFbjzGTNT4fj8KrgJpxlM9xypcnFlg+M+aHDVq+8idP7xRmjUjF8X
	bPlD2Po5nWsKXUDgWJVP6DR/9yotIh/ItdONsTyTYijJPe1uG24n/hS/NUhUJAzzRMXh8IjWqTC
	z2SeNDhodkRu7hB9BN7Cj1eKjq/g3LWce0KP2H/zHu7Y4UNQqNEPWmNbq7ikz0nQjpDbeCqYU/e
	yUE3M+iM/5dYXI+76fAy53cJN4NsxYI7mrciWs77revA3jvjPWM2iquIwi8A7ul3wkwdI03qr75
	rDQMXEfnEbuv9+z1abaVdstkXlS6TFWL9vaURMqpr8oqlOXYk0zf8sHdbvkZu6lN9+ITd21vx6s
	Dp8IM8kM7nVGhXaXZQDWOwiTTkE1108YYuRmTgFiuRbWcdEOh9Z2ohuAB3BRa5Xv2VSFl5CRKlD
	SVzqnEHBHbYpdCiOpzWgLd7EtlTxYIzgVaVEeeRLzRfTtE0HhyQKLyOCS4qRUh3hvxP7KEpolOm
	AnogXQ5OJ
X-Received: by 2002:a17:90b:2790:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b166cef551mr2011651a91.24.1794297729263;
        Tue, 10 Nov 2026 00:02:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 5/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
Date: Tue, 10 Nov 2026 16:01:41 +0800
Message-ID: <20261110080143.1362021-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

