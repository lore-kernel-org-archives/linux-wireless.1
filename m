Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711402;
	b=VPi61LBlk+mLpuoTQ2pTwGo07h+ImfF2ut8YkZfJaIHQ3K6PuyMUe6TcCIyFRIkCL8MY
	 YSeamR7H7LbowcrX/xGC7o6w5W/VjhgMr48ssYX+AOD/ovpDpX/0Ebiq4jQTSCRG7PQ0O
	 ZlwkNoRALzzG5G4FQ9BZARYHBMKvh5M+o34Z6pd8ltX0vDas7t91yjwtSUz0Jmy173EH3
	 XFr3dq/qnjB842qsUWRsjB+65TNHCHMiygXE4xBJQaEnj29zVqjJzEM55ZAcS4Oxxaxco
	 1jm1xH+wPphsT8PDN2U2SApK5UvZ6UCYa3DLerY3+N5OEHyj6eCpFlZMXcfmKzHu2vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711402;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QYEGvgSdxQ8U3djeHKTUQY2ce1MOijW0LyJ5MpM8sO0=;
	b=xBJIkWeM89MDIGKRd3aaG9Mk+4NLVg4zt+4oqnOXzlJhpGRnJNCXiv06F7+NmgpDaW6O
	 IDmq6szAVAfbvPMcPwviGiVEqZqShSlzKDFaN3AfcpDY9w4YtC/P/k0ia3pfBc/UZMQnN
	 ggJq0uzSu8T3MsRHLM0/YYpYWvUKWM4Gyu38G+Btrzn8+1C/ryulx2PbxxPAbRwxw8lrq
	 B2/FwZuwTzccwqYD49I1p0xUHURTP81P9MFE/69ZQm9jhFwFDtSRFSnhiy7O03CYdCpPE
	 xBcphc8A5kxhROc2FZuzvBfhLxS7JpINUP2YXxF+od3V2fHFmDXNT0zOF06MwvkmpFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=nHTmt9R1;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03626606A323
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 02:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03626606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=nHTmt9R1
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vRqoqx8hkHUYBgFfeeFzBBNZiqYNKcMLvyuFnQrmDRs=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794711399; v=1; x=1795316199;
 b=nHTmt9R1FK9e9eFlPcxJqvam0uduZhuLasYyX/kHaMo+5IY/CqKaI2VB01cIx1QQRkK/SFHz
 uJe8kFoFl7kJaQIvAlXXeJJ21BBN1ZevCUC9JeMySsnJPzK0fJu6z1hb0nYUZGJ20toQQhRh8vU
 4M8551xIvraNGiWSim84kwIJMGdr6rp04F8jB94GHbhBVx7eyrRFpRntzFT+XgB6xLJ1TlniFMg
 gzEDm41VjyZtZCsFbhB8+8dVlvF/hyQWlh+r6ImDR2KevEnlIu/tmCOc9Dj1gBXhU4V5qzFrBlw
 H+zk/xZSm2Q5wU3ZGUyQcOGX2xDG9KODfbkhFhCgM3PSg==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8170185ba6c032c3;
	Sun, 15 Nov 2026 02:56:38 +0000
X-Mizu-Trace-ID: 8170185ba6c032c3
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Michael Shih <michael.shih@mediatek.com>,
	Javier Tia <floss@jetm.me>,
	Chris Kelly <hoopyfrood42@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable+noautosel@kernel.org
Subject: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime from the firmware
Date: Sat, 14 Nov 2026 19:56:35 -0700
Message-ID: <20261115025635.40010-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Busy time in the mt7925 survey is bogus. Its register doesn't work on
this chip, so busy outgrows the time on the channel, and transmit time
comes out far too low.

Ask the firmware, as mt7996 does. Busy wraps at 32 bits, so subtract
in 32 bits. The MT7927 counts 5 and 6 GHz on a second band, so read
both and add the one in use.

Over USB 2.0 a full-speed download can hold the answer past the
timeout. The chip is fine then, so wait a few seconds instead of
resetting it. The next read catches up.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Fixes: 05fd14885303 ("wifi: mt76: mt7925: sync MT7927 BSS band assignment")
Reported-by: Chris Kelly <hoopyfrood42@gmail.com>
Closes: https://lore.kernel.org/linux-wireless/CAHaeJsT8O8Nhq351hFp3NAL8e0iU85N-LBdYZ9nYHFHVy7t_hQ@mail.gmail.com/
Cc: <stable+noautosel@kernel.org> # needs a backport, older trees have no MT7927 support
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
v2:
- subtract in 32 bits, Chris saw busy wrap
- no chip reset when this answer is late [1]

A9000 on USB 2.0, full-speed downloads:

  driver                 length   late answers   chip resets   busy reported
  stock                  60 s     -              0             2346 s
  RFC with 32-bit fix    60 s     3              3             33 s
  v2                     60 s     0              0             56 s
  v2                     10 min   22             0             558 s

Other commands answered late still reset the chip, as today; it
happened once, when the AP changed bandwidth mid-download.

Clean on USB 3.0, as an AP, across suspend, and over PCIe.

With runtime PM, the default on MT7925 PCIe, the periodic work doesn't
run (same on mt7921e): the survey updates when read, and busy tops out
at 16.8 s between reads.

Michael, this sets the same survey hook as patch 2 of your v5.

Chris, your readings near 2^64 match the RFC's math at a wrap. v2
can't go backwards.

[1] https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_duck@justthetip.ca/
RFC: https://lore.kernel.org/linux-wireless/20261023180554.7266-1-lucid_duck@justthetip.ca/

 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 53 +++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 78 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 17 ++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 8 files changed, 155 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe294..9749bcf668e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1470,6 +1470,59 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 }
 EXPORT_SYMBOL_GPL(mt7925_queue_rx_skb);
 
+int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset)
+{
+	struct ieee80211_channel *chan = phy->mt76->chandef.chan;
+	struct mt76_channel_state *state = phy->mt76->chan_state;
+	struct mt792x_dev *dev = phy->dev;
+	int i, ret = 0, n_bands = 1, band = 0;
+
+	/* The MT7927 counts 2.4 GHz on band 0 and 5/6 GHz on band 1, and
+	 * the band not in use keeps counting, so read both every time and
+	 * only add the band the channel is on.
+	 */
+	if (is_mt7927(&dev->mt76)) {
+		n_bands = ARRAY_SIZE(phy->state_ts);
+		if (chan)
+			band = mt7927_band_idx(chan->band);
+	}
+
+	for (i = 0; i < n_bands; i++) {
+		bool add = !reset && i == band;
+		u32 bss_rx;
+
+		bss_rx = mt76_get_field(dev, MT_MIB_SDR37(i),
+					MT_MIB_SDR37_RXTIME_MASK);
+		if (add)
+			state->cc_bss_rx += bss_rx;
+
+		ret = mt7925_mcu_get_chan_mib_info(phy, i, add);
+		if (ret == -ETIMEDOUT)
+			break;
+	}
+
+	return ret;
+}
+
+void mt7925_update_channel(struct mt76_phy *mphy)
+{
+	struct mt792x_dev *dev = container_of(mphy->dev, struct mt792x_dev, mt76);
+	struct mt792x_phy *phy = mphy->priv;
+
+	/* give a busy link a few seconds after a late reply */
+	if (phy->survey_hold && time_before(jiffies, phy->survey_hold))
+		return;
+	phy->survey_hold = 0;
+
+	if (mt76_connac_pm_wake(mphy, &dev->pm))
+		return;
+
+	if (mt7925_mac_update_chan_time(phy, false) == -ETIMEDOUT)
+		phy->survey_hold = jiffies + 5 * HZ;
+	mt76_connac_power_save_sched(mphy, &dev->pm);
+}
+EXPORT_SYMBOL_GPL(mt7925_update_channel);
+
 static void
 mt7925_vif_connect_iter(void *priv, u8 *mac,
 			struct ieee80211_vif *vif)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 15d95ad32636..16dc974a1122 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -351,6 +351,7 @@ int __mt7925_start(struct mt792x_phy *phy)
 		return err;
 
 	mt792x_mac_reset_counters(phy);
+	mt7925_mac_update_chan_time(phy, true);
 	set_bit(MT76_STATE_RUNNING, &mphy->state);
 
 	ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 26cdb3f0a98a..1bfa4ec404b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -28,7 +28,12 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 	if (!skb) {
 		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n", cmd, seq);
-		mt792x_reset(mdev);
+		/* The counters come back behind received data, so a full
+		 * USB 2.0 download can hold the answer past the timeout.
+		 * Nothing is wrong with the firmware then, don't reset it.
+		 */
+		if (cmd != MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO))
+			mt792x_reset(mdev);
 
 		return -ETIMEDOUT;
 	}
@@ -1019,6 +1024,77 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *phy)
 	return temperature;
 }
 
+int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool add)
+{
+	enum {
+		IDX_BUSY_TIME,
+		IDX_TX_TIME,
+		IDX_RX_TIME,
+		IDX_NUM
+	};
+	struct {
+		struct {
+			u8 band;
+			u8 __rsv[3];
+		} hdr;
+		struct {
+			__le16 tag;
+			__le16 len;
+			__le32 offs;
+		} data[IDX_NUM];
+	} __packed req = {
+		.hdr.band = band,
+	};
+	static const u32 offs[] = {
+		[IDX_BUSY_TIME] = UNI_MIB_BUSY_TIME,
+		[IDX_TX_TIME] = UNI_MIB_TX_TIME,
+		[IDX_RX_TIME] = UNI_MIB_RX_TIME,
+	};
+	struct mt76_channel_state *state = phy->mt76->chan_state;
+	struct mt76_channel_state *state_ts = &phy->state_ts[band];
+	struct mt792x_dev *dev = phy->dev;
+	struct mt7925_mcu_mib *res;
+	struct sk_buff *skb;
+	int i, ret;
+
+	for (i = 0; i < IDX_NUM; i++) {
+		req.data[i].tag = cpu_to_le16(UNI_CMD_MIB_DATA);
+		req.data[i].len = cpu_to_le16(sizeof(req.data[i]));
+		req.data[i].offs = cpu_to_le32(offs[i]);
+	}
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+	if (skb->len < sizeof(req.hdr) + IDX_NUM * sizeof(*res)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
+
+	skb_pull(skb, sizeof(req.hdr));
+	res = (struct mt7925_mcu_mib *)skb->data;
+
+	if (!add)
+		goto out;
+
+#define __res_u64(s) le64_to_cpu(res[s].data)
+	/* busy wraps at 32 bits */
+	state->cc_busy += (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc_busy);
+	state->cc_tx += (u32)(__res_u64(IDX_TX_TIME) - state_ts->cc_tx);
+	state->cc_rx += (u32)(__res_u64(IDX_RX_TIME) - state_ts->cc_rx);
+out:
+	state_ts->cc_busy = __res_u64(IDX_BUSY_TIME);
+	state_ts->cc_tx = __res_u64(IDX_TX_TIME);
+	state_ts->cc_rx = __res_u64(IDX_RX_TIME);
+#undef __res_u64
+
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
 static void
 mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..f3e892dbb74c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -57,6 +57,23 @@ struct mt7925_mcu_reg_event {
 	__le32 val;
 } __packed;
 
+enum {
+	UNI_CMD_MIB_DATA,
+};
+
+enum {
+	UNI_MIB_BUSY_TIME = 19,
+	UNI_MIB_RX_TIME = 20,
+	UNI_MIB_TX_TIME = 28,
+};
+
+struct mt7925_mcu_mib {
+	__le16 tag;
+	__le16 len;
+	__le32 offs;
+	__le64 data;
+} __packed;
+
 struct mt7925_mcu_ant_id_config {
 	u8 ant_id[4];
 } __packed;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 636efe038392..b9083e5892f6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -375,6 +375,9 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
 			      struct ieee80211_chanctx_conf *ctx);
 int mt7925_mcu_get_temperature(struct mt792x_phy *phy);
+int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool add);
+int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset);
+void mt7925_update_channel(struct mt76_phy *mphy);
 
 int mt7925_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..939a46c0428b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -604,7 +604,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		.sta_add = mt7925_mac_sta_add,
 		.sta_event = mt7925_mac_sta_event,
 		.sta_remove = mt7925_mac_sta_remove,
-		.update_survey = mt792x_update_channel,
+		.update_survey = mt7925_update_channel,
 	};
 	static const struct mt792x_hif_ops mt7925_pcie_ops = {
 		.init_reset = mt7925e_init_reset,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index f97f787b2198..2d3bf035fdfc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -174,7 +174,7 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 		.sta_add = mt7925_mac_sta_add,
 		.sta_event = mt7925_mac_sta_event,
 		.sta_remove = mt7925_mac_sta_remove,
-		.update_survey = mt792x_update_channel,
+		.update_survey = mt7925_update_channel,
 	};
 	static const struct mt792x_hif_ops hif_ops = {
 		.mcu_init = mt7925u_mcu_init,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..b70b9f9e241a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -221,6 +221,8 @@ struct mt792x_phy {
 	u32 ampdu_ref;
 
 	struct mt76_mib_stats mib;
+	struct mt76_channel_state state_ts[2];
+	unsigned long survey_hold;
 
 	u8 sta_work_count;
 	u8 clc_chan_conf;

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1

