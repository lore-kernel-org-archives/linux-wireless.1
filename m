Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=KSyRWt7TSKestyAmsu/fynHWOuhAyPrUR3ZfWcFX2nVB9jxxCZknfohVUcBasnq49w/N
	 I0+MRBgbaFKp31geitYPcONoKyLp0fETP1kE2H3CZyAL/FCgRtP/9jxJr9llwr2leYE0O
	 EOrx7k+M1chF2OJYdLLJAU1q1Bbr2gy31OUDEKs8PsPAXejyqNsX39zaauFiu6ceU2zD3
	 OLtKYixwZyoCGzBbAJpTAKK4ZZSx5cfA8idt/xYMf+FcFaXge3CrTS2O6JpVBFSzgsLba
	 qXBwoEkX5QUI+TX1fL6hAIxCORUKrGTDEUjxiAPiiIZd3PXQptzqLY4M8Tga9URgaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WB4aUmoqctBRu0Ez6ON76JyxpFzYYFtnqcP/+3mKCuU=;
	b=IcqmABeKZZL5wxOq7HDws3zNe2wfqHstxgLSty1ENdTuJdLfAuumzy5hUzn1FU7XNDGC
	 Lgyh/Hw+iW8lPoOEiCvILxm4g5v81R3tJsRP6l4u71qGn0zaouhWPZRR3ETPE34uU9jDL
	 /FXdaShBUZujkK5pmhxPgas/wMqw3y9a/OVhY0rljnNnIX95IEmv9GOR5GcjQL3KfPO+Q
	 pas+hprSmpJJISJduR9y9O8hMqCnmieaNVAIZCXBRZIZVao5UDjsye6d0wLNtEy3R1fEp
	 RoGJH+nwmumrY7iYO9S0LgKFR9ZxkYlezsGeQ4WPkvzqUpQRPsSnFr7XOPwbKg7V73g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VCRfvFO6;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2614606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2614606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VCRfvFO6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WB4aUmoqctBRu0Ez6ON76JyxpFzYYFtnqcP/+3mKCuU=; b=VCRfvFO67gIGF5CmihCSEEDzfn
	WwCRX/SRjO7lBcYcMrLANyoOXEZWFGtLjiRRuBtJdxEZMSR98PnN6G8aGDwAMwMBYCtHNGcPs0bDE
	Qw93uEXvvqQ2Bpl4VbaOvT7h2tq53QHp9KYWttd/VkUt126kZvgj3HvJwiQfoMJbpea8=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7M-007dJf-1a
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/20] wifi: mt76: mt7996: reset after an MCU reset lost a state command
Date: Tue, 24 Nov 2026 09:42:57 +0100
Message-ID: <20261124084309.1981968-8-nbd@nbd.name>
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
is thus unknown or missing. mt7996_mcu_parse_response() starts a full
reset only for a timeout with the bit clear.

Start a full reset where the core reports such a command, unless one is
already queued. The firmware load frees every record, and mac80211 sets
up each key, station and BSS again. Leave out a beacon template, as the
L1 work uploads each template again, and the L1 trigger of a WED reset,
as the pending reset that refuses it takes its place.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 12 +++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 35 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  5 +++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index d724ac425b42..e507bfd34372 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2615,6 +2615,18 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 	ieee80211_restart_hw(mt76_hw(dev));
 }
 
+/* MT76_MCU_RESET keeps every command from the firmware until the reload */
+void mt7996_mac_full_reset_queue(struct mt7996_dev *dev)
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
 void mt7996_mac_reset_work(struct work_struct *work)
 {
 	unsigned long bcn_restored = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 52465006a40b..fc56ce723de5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -215,6 +215,21 @@ mt7996_mcu_set_sta_ht_mcs(struct ieee80211_link_sta *link_sta,
 		ht_mcs[nss] = link_sta->ht_cap.mcs.rx_mask[nss] & mask[nss];
 }
 
+/* only the firmware load gives a known state again */
+static void
+mt7996_mcu_cmd_lost(struct mt76_dev *mdev, int cmd)
+{
+	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+
+	if (cmd & (MT7996_MCU_CMD_BCN_TEMPLATE | MT7996_MCU_CMD_L1_TRIGGER))
+		return;
+
+	spin_lock_bh(&dev->mt76.lock);
+	if (dev->recovery.hw_init_done && !dev->recovery.restart)
+		mt7996_mac_full_reset_queue(dev);
+	spin_unlock_bh(&dev->mt76.lock);
+}
+
 static int
 mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			  struct sk_buff *skb, int seq)
@@ -230,12 +245,10 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
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
+			mt7996_mac_full_reset_queue(dev);
+		spin_unlock_bh(&dev->mt76.lock);
 
 		return -ETIMEDOUT;
 	}
@@ -3444,7 +3457,8 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 out:
 	dev_kfree_skb(skb);
 	ret = mt76_mcu_skb_send_msg(&dev->mt76, rskb,
-				    MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
+				    MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE) |
+				    MT7996_MCU_CMD_BCN_TEMPLATE, true);
 	link->csa_bcn_uploaded = !ret && enabled && link_conf->csa_active;
 
 	return ret;
@@ -4044,6 +4058,7 @@ int mt7996_mcu_init(struct mt7996_dev *dev)
 		.headroom = sizeof(struct mt76_connac2_mcu_txd), /* reuse */
 		.mcu_skb_send_msg = mt7996_mcu_send_message,
 		.mcu_parse_response = mt7996_mcu_parse_response,
+		.mcu_cmd_lost = mt7996_mcu_cmd_lost,
 	};
 
 	dev->mt76.mcu_ops = &mt7996_mcu_ops;
@@ -5114,6 +5129,7 @@ int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 val, u8 band)
 		.tag = cpu_to_le16(action),
 		.len = cpu_to_le16(sizeof(req) - 4),
 	};
+	int cmd = MCU_WM_UNI_CMD(SER);
 
 	switch (action) {
 	case UNI_CMD_SER_SET:
@@ -5122,13 +5138,14 @@ int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 val, u8 band)
 	case UNI_CMD_SER_TRIGGER:
 		req.trigger.method = val;
 		req.trigger.band = band;
+		if (val == UNI_CMD_SER_SET_RECOVER_FROM_ETH)
+			cmd |= MT7996_MCU_CMD_L1_TRIGGER;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SER),
-				 &req, sizeof(req), false);
+	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
 }
 
 int mt7996_mcu_set_txbf(struct mt7996_dev *dev, u8 action)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 2fdf82394355..a97fbcce1d47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -30,6 +30,11 @@ struct mt7996_mcu_uni_event {
 	__le32 status; /* 0: success, others: fail */
 } __packed;
 
+/* host flag: an L1 SER frees every template and the L1 work uploads it again */
+#define MT7996_MCU_CMD_BCN_TEMPLATE		BIT(22)
+/* host flag: the pending reset that refuses an L1 trigger takes its place */
+#define MT7996_MCU_CMD_L1_TRIGGER		BIT(23)
+
 struct mt7996_mcu_thermal_ctrl {
 	u8 ctrl_id;
 	u8 band_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index a9d265c90234..f5bca533c3e1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -735,6 +735,7 @@ int mt7996_init_tx_queues(struct mt7996_phy *phy, int idx,
 void mt7996_init_txpower(struct mt7996_phy *phy);
 int mt7996_txbf_init(struct mt7996_dev *dev);
 void mt7996_reset(struct mt7996_dev *dev);
+void mt7996_mac_full_reset_queue(struct mt7996_dev *dev);
 int mt7996_run(struct mt7996_phy *phy);
 int mt7996_mcu_init(struct mt7996_dev *dev);
 int mt7996_mcu_init_firmware(struct mt7996_dev *dev);
-- 
2.47.3

