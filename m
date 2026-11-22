Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327247;
	b=YVV+P8x0UU1gWBY9E3u2WdknOPS6ZbgFH96d6DcpbsfQfbWjP2ewFomnc05m1UpB0quO
	 mE8RclL8pGrlSuzRK8c9+LNfLtQ9Q7GfbDphvTHbeUJHO5X/AWnb7QpxLtlxtrvtqi/Af
	 UJk0lLy4G2lyW4UXnlXwAkCvagh87wAMVknPyUP+jDpFMXVmWkfPy+cbOTjJWrfIwiJuH
	 Lb7fjxgvGedJfhJdhOnwJkHQKpcbU6epUp97362j8NSRSQ3Y415a2wnFVnXZ4BaP69jaT
	 7dQtckQZtadZYwTRDypv7t8KLlhCPWGNfXeevLpnwlmqCwK0qMCn7eEnUjDnJJx9Slg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327247;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1uOTpFPefSIhiOx92VMWYt0y9d2BuKAZx6GmdB1gij4=;
	b=Z70Tr7++P50TKuYH4Whyo3pw4GzGOlANQ5foCA+V+89Wxf8LdmX595N8hcS7IIs7rz0N
	 6hEa9jBPOacnpUmUjIFa++UGz29veXJg+b/l12JJH/l3NIW35RasKG9Zu5FxKt0+uPGKy
	 UpzBUuQogIPpBItnwgG5yl3vY8OvMtlcEp74qiJb8RmRzVXbiROvDjtfqUl8wWqOvCP0W
	 7Dy5IqkAxkqAqauKG9T020RlRqVjps4pb5gnkMEFzpR9iLH4s/uVLXltZBsV5CVB9WRWj
	 uHRcUquDMt3lRPlbthf78yfad9KFI6JBxZf/KataxaB/vepS1tBzFCECl4REtFpDTDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pz3/wGE+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E99606A339;
	Sun, 22 Nov 2026 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pz3/wGE+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327247;
	b=GKnvqe4NPRkCiFRgOMk/TeKvePiekyPUSJlNyXCzfDAN1/YOwLUHOIRuK/k5lab2ONye
	 OCsa9BY5fRWgs8XytfeKV9x4ApVBzGHIleYCRgFwDEeGVfZddWR1q+SGHbGtTPk7IeFI2
	 lXY2NL4Z6qzgHzKg6GSkGPUdam9t4BOw1tsXcNxM1KqrfEvXzbT1no/rA19ukeJJOGPUJ
	 ZsyKNEk4VOGFI06V01Jn+YQnNK4apZ8OarATs+jSzKlIK9qrAxViaBTOi+fRkvwabIR4d
	 lmqyuxfeFKkjoGlSC4oOaIdmWYFH+LHj6C46QxORoUykXhH6CeiQZunlpfNNL7g9l5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327247;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1uOTpFPefSIhiOx92VMWYt0y9d2BuKAZx6GmdB1gij4=;
	b=lVYDFiEBM2u3w0kqZmEXhbwnN08h0UuQITv/2sQfmQZI08+P6jFSgqtCLlh/kSaTjmWD
	 xZdmeiDfyF2xIRnGsuD/b3qE9uWmKRazILkjqs1LCXzlUfM/8zuqMbeQoj3gThGwqD2Bp
	 0Xtv/EM/psKvA0jrFFfJfB4NpI7AjmLkoVWWkYlgh/G/ny/Y/OZk+TVpDa1jj/7xkpj43
	 RIhKmIwD06cBKRIpRK198KwMdh/s+U/7y3sRJAdM+FIlGcIUd+lWaBfdi6/IBDT960bcJ
	 wYuXsYYQ2A/2nrg/ujHA0Vzf2XY9JKZpupTIOlxPXM/L5p44f2uhZaOj944ATpPVfhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40B111F000CF;
	Sun, 22 Nov 2026 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327247;
	bh=1uOTpFPefSIhiOx92VMWYt0y9d2BuKAZx6GmdB1gij4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Pz3/wGE+QgmdnCPTgkk5ziLG58m9unvEMKyKIy2eSHtekiBT+pIXSbvjeG8kb7qUG
	 RlRGM6GJdCmZogmqJP7Tum4Wxxta7TLZCdFCbQMesugH6fhzpiI8ys2O1xnkeqKdiO
	 aUpCAQB5oB+rqOAUYUbg1qcQyyeFR//Lhn2xa6PTKm/973NrVS0JRjsiXl9EnXOH2m
	 vXSsxrjykxY5h9wHi8fFnYN00efUZq+8nC+GZ1D1+EKvo6WVdxhFjf5BCGrPJD9tV0
	 ZOher9m589fAhdtddTQ+4zLXDbgb7JRcM+y5DT7djeIn/mX5M8d+VaZ9iEXHt76eHj
	 dwcNNTs74Ri2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C83BC4BF7B;
	Sun, 22 Nov 2026 06:00:45 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 09:00:39 +0300
Subject: [PATCH rtw-next v2 2/2] wifi: rtl8xxxu: report real TX status on
 RTL8188CU/RTL8192CU
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-tx-status-v2-2-bbfdbd880acf@proton.me>
References: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
In-Reply-To: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327244; l=9371;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=sMl6jRC+pF3fcimkRsqou6eKkdQbiBUgIBwUg4wnorA=;
 b=w7TH/qhlySC2lPo5XnYQh2tpAsW6Hoe9Lx76avnYO8EeJT5XKMT91q7tqhWSlEckv/qGgbGW8
 lAoH/Qu414xBebdW0vYVsRg1sdOVlxHQ1QrwIHOIKNdZFt4xl7s5PZQ
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

The driver reports every frame as acked once its USB transfer is done.

The firmware of these chips can send a CCX TX report with the ACK status
and retry count of a frame through the C2H event mailbox. The report
does not say which frame it is for, so request it for only one frame at
a time, poll the mailbox after the frame was sent and report its status
from there. Frames that request status while another one is pending are
reported as before.

Tested on RTL8192CU (0bda:8178) with unicast frames: frames to a present
station are reported acked, frames to an absent station are reported
failed with the retry count the hardware used, also when that takes
seconds.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/8192c.c    |   1 +
 drivers/net/wireless/realtek/rtl8xxxu/core.c     | 120 +++++++++++++++++++++++
 drivers/net/wireless/realtek/rtl8xxxu/regs.h     |   9 ++
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h |   6 ++
 4 files changed, 136 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/8192c.c b/drivers/net/wireless/realtek/rtl8xxxu/8192c.c
index 508322a8f31..e31bf16d0ee 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/8192c.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/8192c.c
@@ -722,6 +722,7 @@ struct rtl8xxxu_fileops rtl8192cu_fops = {
 	.rx_agg_buf_size = 16000,
 	.tx_desc_size = sizeof(struct rtl8xxxu_txdesc32),
 	.rx_desc_size = sizeof(struct rtl8xxxu_rxdesc16),
+	.has_c2hevt_tx_report = 1,
 	.supports_ap = 1,
 	.hw_feature_report = 0,
 	.max_macid_num = 32,
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index ab2818986cc..bbe6cae8cb8 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5148,6 +5148,105 @@ static void rtl8xxxu_free_tx_urb(struct rtl8xxxu_priv *priv,
 	spin_unlock_irqrestore(&priv->tx_urb_lock, flags);
 }
 
+/*
+ * Gen1 chips can report the ACK status of a frame through the C2H event
+ * mailbox. There is no way to tell which frame a report belongs to, so
+ * only one frame at a time asks for one, until its report arrives. The
+ * report comes when the frame is done, which can take seconds with many
+ * retries, so wait for it rather than risk taking it for the next frame.
+ */
+#define RTL8XXXU_TX_REPORT_TIMEOUT	msecs_to_jiffies(10000)
+
+static bool rtl8xxxu_tx_report_claim(struct rtl8xxxu_priv *priv,
+				     struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(skb);
+	bool claimed = false;
+	unsigned long flags;
+
+	if (!priv->fops->has_c2hevt_tx_report ||
+	    !(tx_info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) ||
+	    (tx_info->flags & IEEE80211_TX_CTL_NO_ACK) ||
+	    is_multicast_ether_addr(hdr->addr1))
+		return false;
+
+	spin_lock_irqsave(&priv->tx_report_lock, flags);
+	if (!priv->tx_report_skb) {
+		priv->tx_report_skb = skb;
+		claimed = true;
+	}
+	spin_unlock_irqrestore(&priv->tx_report_lock, flags);
+
+	return claimed;
+}
+
+static bool rtl8xxxu_tx_report_release(struct rtl8xxxu_priv *priv,
+				       struct sk_buff *skb)
+{
+	unsigned long flags;
+	bool claimed;
+
+	spin_lock_irqsave(&priv->tx_report_lock, flags);
+	claimed = priv->tx_report_skb == skb;
+	if (claimed)
+		priv->tx_report_skb = NULL;
+	spin_unlock_irqrestore(&priv->tx_report_lock, flags);
+
+	return claimed;
+}
+
+static void rtl8xxxu_tx_report_poll_work(struct work_struct *work)
+{
+	struct rtl8xxxu_priv *priv = container_of(work, struct rtl8xxxu_priv,
+						  tx_report_poll_work.work);
+	struct ieee80211_tx_info *tx_info;
+	unsigned long flags, elapsed;
+	u8 retry = 0, status = 0;
+	bool reported = false;
+	struct sk_buff *skb;
+
+	if (rtl8xxxu_read8(priv, REG_C2HEVT_CLEAR) == C2H_EVT_FW_CLOSE) {
+		u8 id = rtl8xxxu_read8(priv, REG_C2HEVT_MSG_NORMAL);
+
+		if ((id & C2H_EVT_ID_MASK) == C2H_EVT_CCX_TX_RPT) {
+			retry = rtl8xxxu_read8(priv, REG_C2HEVT_MSG_NORMAL +
+						     C2H_EVT_CCX_RETRY_OFFSET);
+			status = rtl8xxxu_read8(priv, REG_C2HEVT_MSG_NORMAL +
+						      C2H_EVT_CCX_STATUS_OFFSET);
+			reported = true;
+		}
+		rtl8xxxu_write8(priv, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
+	}
+
+	elapsed = jiffies - priv->tx_report_start;
+	if (!reported && elapsed < RTL8XXXU_TX_REPORT_TIMEOUT) {
+		/* Most frames are done within a few ms, poll often at first */
+		ieee80211_queue_delayed_work(priv->hw, &priv->tx_report_poll_work,
+					     elapsed < msecs_to_jiffies(20) ?
+					     1 : msecs_to_jiffies(10));
+		return;
+	}
+
+	spin_lock_irqsave(&priv->tx_report_lock, flags);
+	skb = priv->tx_report_skb;
+	priv->tx_report_skb = NULL;
+	spin_unlock_irqrestore(&priv->tx_report_lock, flags);
+
+	if (!skb)
+		return;
+
+	tx_info = IEEE80211_SKB_CB(skb);
+	ieee80211_tx_info_clear_status(tx_info);
+	if (!(tx_info->flags & IEEE80211_TX_CTL_INJECTED))
+		tx_info->status.rates[0].idx = -1;
+	tx_info->status.rates[0].count = (retry & CCX_RETRY_CNT_MASK) + 1;
+	if (status & CCX_PKT_OK)
+		tx_info->flags |= IEEE80211_TX_STAT_ACK;
+
+	ieee80211_tx_status_irqsafe(priv->hw, skb);
+}
+
 static void rtl8xxxu_tx_complete(struct urb *urb)
 {
 	struct sk_buff *skb = (struct sk_buff *)urb->context;
@@ -5163,6 +5262,16 @@ static void rtl8xxxu_tx_complete(struct urb *urb)
 
 	skb_pull(skb, priv->fops->tx_desc_size);
 
+	if (READ_ONCE(priv->tx_report_skb) == skb) {
+		if (!urb->status) {
+			priv->tx_report_start = jiffies;
+			ieee80211_queue_delayed_work(hw, &priv->tx_report_poll_work, 0);
+			rtl8xxxu_free_tx_urb(priv, tx_urb);
+			return;
+		}
+		rtl8xxxu_tx_report_release(priv, skb);
+	}
+
 	ieee80211_tx_info_clear_status(tx_info);
 	tx_info->status.rates[0].idx = -1;
 	tx_info->status.rates[0].count = 0;
@@ -5592,6 +5701,9 @@ static void rtl8xxxu_tx(struct ieee80211_hw *hw,
 	priv->fops->fill_txdesc(hw, hdr, tx_info, tx_desc, sgi, short_preamble,
 				ampdu_enable, rts_rate, macid);
 
+	if (rtl8xxxu_tx_report_claim(priv, skb))
+		tx_desc->txdw2 |= cpu_to_le32(TXDESC32_ACK_REPORT);
+
 	rtl8xxxu_calc_tx_desc_csum(tx_desc);
 
 	/* avoid zero checksum make tx hang */
@@ -5606,6 +5718,7 @@ static void rtl8xxxu_tx(struct ieee80211_hw *hw,
 	if (ret) {
 		usb_unanchor_urb(&tx_urb->urb);
 		rtl8xxxu_free_tx_urb(priv, tx_urb);
+		rtl8xxxu_tx_report_release(priv, skb);
 		goto error;
 	}
 	return;
@@ -7539,6 +7652,11 @@ static void rtl8xxxu_stop(struct ieee80211_hw *hw, bool suspend)
 
 	usb_kill_anchored_urbs(&priv->rx_anchor);
 	usb_kill_anchored_urbs(&priv->tx_anchor);
+	cancel_delayed_work_sync(&priv->tx_report_poll_work);
+	if (priv->tx_report_skb) {
+		ieee80211_free_txskb(hw, priv->tx_report_skb);
+		priv->tx_report_skb = NULL;
+	}
 	if (priv->usb_interrupts)
 		usb_kill_anchored_urbs(&priv->int_anchor);
 
@@ -7851,6 +7969,8 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	INIT_DELAYED_WORK(&priv->rx_urb_wq, rtl8xxxu_rx_urb_work);
 	INIT_DELAYED_WORK(&priv->ra_watchdog, rtl8xxxu_watchdog_callback);
 	INIT_DELAYED_WORK(&priv->update_beacon_work, rtl8xxxu_update_beacon_work_callback);
+	spin_lock_init(&priv->tx_report_lock);
+	INIT_DELAYED_WORK(&priv->tx_report_poll_work, rtl8xxxu_tx_report_poll_work);
 	skb_queue_head_init(&priv->c2hcmd_queue);
 
 	usb_set_intfdata(interface, hw);
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/regs.h b/drivers/net/wireless/realtek/rtl8xxxu/regs.h
index 2131d07c580..508f1b042b1 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/regs.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/regs.h
@@ -447,11 +447,20 @@
 /* 8188EU */
 #define REG_32K_CTRL			0x0194
 #define REG_C2HEVT_MSG_NORMAL		0x01a0
+#define  C2H_EVT_ID_MASK		GENMASK(3, 0)
+#define   C2H_EVT_CCX_TX_RPT		3
+#define  C2H_EVT_PAYLOAD_OFFSET		2
+#define  C2H_EVT_CCX_RETRY_OFFSET	(C2H_EVT_PAYLOAD_OFFSET + 0)
+#define   CCX_RETRY_CNT_MASK		GENMASK(5, 0)
+#define  C2H_EVT_CCX_STATUS_OFFSET	(C2H_EVT_PAYLOAD_OFFSET + 7)
+#define   CCX_PKT_OK			BIT(6)
 #define C2H_HW_FEATURE_REPORT		0x19
 #define C2H_HW_FEATURE_DUMP		0xfd
 /* 8192EU/8723BU/8812 */
 #define REG_C2HEVT_CMD_ID_8723B		0x01ae
 #define REG_C2HEVT_CLEAR		0x01af
+#define  C2H_EVT_HOST_CLOSE		0x00
+#define  C2H_EVT_FW_CLOSE		0xff
 #define REG_C2HEVT_MSG_TEST		0x01b8
 #define REG_MCUTST_1			0x01c0
 #define REG_FMTHR			0x01c8
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
index 8cbadcf7190..1e20cece59e 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
@@ -1811,6 +1811,11 @@ struct rtl8xxxu_priv {
 	bool shutdown;
 	struct delayed_work rx_urb_wq;
 
+	spinlock_t tx_report_lock; /* protects tx_report_skb */
+	struct sk_buff *tx_report_skb;
+	unsigned long tx_report_start;
+	struct delayed_work tx_report_poll_work;
+
 	u8 mac_addr[ETH_ALEN];
 	char chip_name[8];
 	char chip_vendor[8];
@@ -2009,6 +2014,7 @@ struct rtl8xxxu_fileops {
 	char rx_desc_size;
 	u8 has_s0s1:1;
 	u8 has_tx_report:1;
+	u8 has_c2hevt_tx_report:1;
 	u8 gen2_thermal_meter:1;
 	u8 needs_full_init:1;
 	u8 init_reg_rxfltmap:1;

-- 
2.56.1


