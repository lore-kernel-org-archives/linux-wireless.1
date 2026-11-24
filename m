Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=JnWnpBIZ3+qhCgd4DLvvNINl2VyoAPc88aQZoMQY1uJyWx2q22Z4Do8C1qqx6Yw2J+iY
	 qPG/UNsDCIatO3U+RxSPXcDN0fHnXpzObUXxFWLPGanSyI3xBQcgULmWE3UgJef6tg5fM
	 4a83HjmTpf7j0WlAZoNBNxi2ls8M0ktSatBKTTdRWjv2/yzIk0/PMzL6txaMkRuqxrpf7
	 mUfB45BAMSZGAZ3Mq7pVStYc4rW+NjC94IhegbNtFnp2vP2udm09H1Ii4KZkPWsom4giB
	 lE/xh5NU2rQJBQ6MsGr41qzunxRtfn23Z/Ktr8mCKjynlpOq9rjC0YnFyVe9RhDc2ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1PbR/9snvKgdA7D39KLOeqo5rgV5g7ouw/WZYFfAdAc=;
	b=utzUXbGIZI49+aYdCYNzAvT89875abJ5Vx62XwUBk/k6d0KGyCb+RkzQn4LLff53HoBs
	 MjMKz6247egV5Eo+RIxQL/OjlLGV0VBv4OknznFlEj/9lEYsVKEFzhqSe1zOJuk35j/5p
	 C03VMh5ujCRKFkVFpyijN0u3HDJja7ODx8+IwlOn7294wwwNghHzGhFFQNY5r4fdcSqWv
	 1lDKH46aDjuwFBWa9O5dzSqpI4vR4D87Rrq5yj6SGvnC7C6/5FIV6szbnkBhHefABfuwn
	 0a/ViHwnzl5qyCJpr1q/DoRVSHlKc80h1EtnoNJ5y+GTJNXqeGY2TaNiYir7sMPibEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=SgiHSduO;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98239606A685
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98239606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=SgiHSduO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1PbR/9snvKgdA7D39KLOeqo5rgV5g7ouw/WZYFfAdAc=; b=SgiHSduO8/UnSwJ/Uc2umPEq4H
	dlRF+NGVHIGTK5MxqyjRDHCuvsNRqefK3Pv2B6ot2vG9sLQqZybnmABOFWi2F1hxMbblR0iT2Qcao
	hL/azIkh9p25rIi7TLls5MrCuA9law7H1JaErp2TEcst9BX5AP4huI1lbeaVUq95tnXs=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-0Z
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/20] wifi: mt76: mt7915: reset after an MCU reset lost a state command
Date: Tue, 24 Nov 2026 09:43:01 +0100
Message-ID: <20261124084309.1981968-12-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

An L1 SER sets MT76_MCU_RESET, which ends each command wait and refuses
each new command. The firmware can have run a command that it took
just before the recovery. The state that a cut or refused command sets
is thus unknown or missing. mt7915_mcu_parse_response() starts a full
reset only for a timeout with the bit clear.

Start a full reset where the core reports such a command, unless one is
already queued. Leave out a beacon template, as the L1 work uploads
each template again, and an L1 trigger, as the pending reset that
refuses it takes its place.

Leave the L1 handshake for the full reset where a wait times out or a
reset is requested. Otherwise the L1 work goes on, clears the bit and
sends the templates before the full reset runs. Enable NAPI and the TX
worker again before the work returns, since mt7915_mac_restart()
disables them itself.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 94 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 31 ++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  5 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 4 files changed, 96 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 110d5368a8ee..cc3ef641d1c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1251,11 +1251,12 @@ mt7915_wait_reset_state(struct mt7915_dev *dev, u32 state)
 	bool ret;
 
 	ret = wait_event_timeout(dev->reset_wait,
-				 (READ_ONCE(dev->recovery.state) & state),
+				 (READ_ONCE(dev->recovery.state) & state) ||
+				 dev->recovery.restart,
 				 MT7915_RESET_TIMEOUT);
 
 	WARN(!ret, "Timeout waiting for MCU reset state %x\n", state);
-	return ret;
+	return ret && !dev->recovery.restart;
 }
 
 static void
@@ -1510,6 +1511,54 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 		ieee80211_restart_hw(ext_phy->hw);
 }
 
+static void
+mt7915_mac_reset_napi_enable(struct mt7915_dev *dev)
+{
+	int i;
+
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		napi_enable(&dev->mt76.napi[i]);
+	}
+
+	local_bh_disable();
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		napi_schedule(&dev->mt76.napi[i]);
+	}
+	local_bh_enable();
+
+	tasklet_schedule(&dev->mt76.irq_tasklet);
+
+	mt76_worker_enable(&dev->mt76.tx_worker);
+
+	napi_enable(&dev->mt76.tx_napi);
+	local_bh_disable();
+	napi_schedule(&dev->mt76.tx_napi);
+	local_bh_enable();
+}
+
+static void
+mt7915_mac_reset_l1_abort(struct mt7915_dev *dev)
+{
+	mt7915_mac_reset_napi_enable(dev);
+	mutex_unlock(&dev->mt76.mutex);
+
+	spin_lock_bh(&dev->mt76.lock);
+	mt7915_mac_full_reset_queue(dev);
+	spin_unlock_bh(&dev->mt76.lock);
+}
+
+/* MT76_MCU_RESET keeps every command from the firmware until the reload */
+void mt7915_mac_full_reset_queue(struct mt7915_dev *dev)
+{
+	lockdep_assert_held(&dev->mt76.lock);
+
+	set_bit(MT76_MCU_RESET, &dev->mphy.state);
+	dev->recovery.restart = true;
+	wake_up(&dev->mt76.mcu.wait);
+	queue_work(dev->mt76.wq, &dev->reset_work);
+	wake_up(&dev->reset_wait);
+}
+
 /* system error recovery */
 void mt7915_mac_reset_work(struct work_struct *work)
 {
@@ -1576,19 +1625,21 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		mtk_wed_device_stop(&dev->mt76.mmio.wed);
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_STOPPED);
+	if (!mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE))
+		goto abort;
 
-	if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
-		mt7915_dma_reset(dev, false);
+	mt7915_dma_reset(dev, false);
 
-		mt76_connac2_tx_token_put(&dev->mt76);
-		idr_init(&dev->mt76.token);
+	mt76_connac2_tx_token_put(&dev->mt76);
+	idr_init(&dev->mt76.token);
 
-		mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_INIT);
-		mt7915_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
-	}
+	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_INIT);
+	if (!mt7915_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE))
+		goto abort;
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
-	mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
+	if (!mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE))
+		goto abort;
 
 	/* enable DMA Tx/Rx and interrupt */
 	mt7915_dma_start(dev, false, false);
@@ -1598,24 +1649,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	if (phy2)
 		clear_bit(MT76_RESET, &phy2->mt76->state);
 
-	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_enable(&dev->mt76.napi[i]);
-	}
-
-	local_bh_disable();
-	mt76_for_each_q_rx(&dev->mt76, i) {
-		napi_schedule(&dev->mt76.napi[i]);
-	}
-	local_bh_enable();
-
-	tasklet_schedule(&dev->mt76.irq_tasklet);
-
-	mt76_worker_enable(&dev->mt76.tx_worker);
-
-	napi_enable(&dev->mt76.tx_napi);
-	local_bh_disable();
-	napi_schedule(&dev->mt76.tx_napi);
-	local_bh_enable();
+	mt7915_mac_reset_napi_enable(dev);
 
 	ieee80211_wake_queues(mt76_hw(dev));
 	if (ext_phy)
@@ -1631,6 +1665,10 @@ void mt7915_mac_reset_work(struct work_struct *work)
 		ieee80211_queue_delayed_work(ext_phy->hw,
 					     &phy2->mt76->mac_work,
 					     MT7915_WATCHDOG_TIME);
+	return;
+
+abort:
+	mt7915_mac_reset_l1_abort(dev);
 }
 
 /* firmware coredump */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ea79eb85d683..981135c23723 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -153,6 +153,21 @@ mt7915_mcu_set_sta_ht_mcs(struct ieee80211_sta *sta, u8 *ht_mcs,
 		ht_mcs[nss] = sta->deflink.ht_cap.mcs.rx_mask[nss] & mask[nss];
 }
 
+/* only the firmware load gives a known state again */
+static void
+mt7915_mcu_cmd_lost(struct mt76_dev *mdev, int cmd)
+{
+	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
+
+	if (cmd & (MT7915_MCU_CMD_BCN_TEMPLATE | MT7915_MCU_CMD_L1_TRIGGER))
+		return;
+
+	spin_lock_bh(&dev->mt76.lock);
+	if (dev->recovery.hw_init_done && !dev->recovery.restart)
+		mt7915_mac_full_reset_queue(dev);
+	spin_unlock_bh(&dev->mt76.lock);
+}
+
 static int
 mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			  struct sk_buff *skb, int seq)
@@ -165,12 +180,10 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
 			cmd, seq);
 
-		if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state)) {
-			dev->recovery.restart = true;
-			wake_up(&dev->mt76.mcu.wait);
-			queue_work(dev->mt76.wq, &dev->reset_work);
-			wake_up(&dev->reset_wait);
-		}
+		spin_lock_bh(&dev->mt76.lock);
+		if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state))
+			mt7915_mac_full_reset_queue(dev);
+		spin_unlock_bh(&dev->mt76.lock);
 
 		return -ETIMEDOUT;
 	}
@@ -2131,7 +2144,8 @@ int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 out:
 	return mt76_mcu_skb_send_msg(&phy->dev->mt76, rskb,
-				     MCU_EXT_CMD(BSS_INFO_UPDATE), true);
+				     MCU_EXT_CMD(BSS_INFO_UPDATE) |
+				     MT7915_MCU_CMD_BCN_TEMPLATE, true);
 }
 
 static int mt7915_driver_own(struct mt7915_dev *dev, u8 band)
@@ -2559,6 +2573,7 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 		.mcu_skb_prepare_msg = mt76_connac2_mcu_fill_message,
 		.mcu_skb_send_msg = mt7915_mcu_send_message,
 		.mcu_parse_response = mt7915_mcu_parse_response,
+		.mcu_cmd_lost = mt7915_mcu_cmd_lost,
 	};
 
 	dev->mt76.mcu_ops = &mt7915_mcu_ops;
@@ -3769,6 +3784,8 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 	/* action 0 writes the SER statistics to the firmware log */
 	if (!action)
 		cmd |= MT76_MCU_CMD_READ;
+	else if (action == SER_RECOVER && set == SER_SET_RECOVER_L1)
+		cmd |= MT7915_MCU_CMD_L1_TRIGGER;
 
 	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 7dbe43200fb4..456c452e07c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -6,6 +6,11 @@
 
 #include "../mt76_connac_mcu.h"
 
+/* host flag: an L1 SER frees every template and the L1 work uploads it again */
+#define MT7915_MCU_CMD_BCN_TEMPLATE	BIT(21)
+/* host flag: the pending reset that refuses an L1 trigger takes its place */
+#define MT7915_MCU_CMD_L1_TRIGGER	BIT(22)
+
 enum {
 	MCU_ATE_SET_TRX = 0x1,
 	MCU_ATE_SET_FREQ_OFFSET = 0xa,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index afb856febe3a..cab0ed54ca84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -472,6 +472,7 @@ int mt7915_dma_start(struct mt7915_dev *dev, bool reset, bool wed_reset);
 int mt7915_txbf_init(struct mt7915_dev *dev);
 void mt7915_init_txpower(struct mt7915_phy *phy);
 void mt7915_reset(struct mt7915_dev *dev);
+void mt7915_mac_full_reset_queue(struct mt7915_dev *dev);
 int mt7915_run(struct ieee80211_hw *hw);
 int mt7915_mcu_init(struct mt7915_dev *dev);
 int mt7915_mcu_init_firmware(struct mt7915_dev *dev);
-- 
2.47.3

