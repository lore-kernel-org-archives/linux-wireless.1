Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196714;
	b=czHYUMcEovA6734AxIlaKms5ruBlNAc+VZJ0tbAo4qXOvqWMOcIarwwf/Zock4t/p/g/
	 0wV3nvIqJ8TXDeC6L748eOPu1IcScsfgcW2oJ4oc92VJYCpeDC68xo7F6Fb2Mw1HEvofy
	 aAsmfQuopB9s8NskiETWo+JHQwWtdhgaK2SwX4b8w1xdX5Z99ztrXDEIRC9kWRRcvxjxm
	 g/zn/8t0p/KiDehi9Lp+Zy0XWoo8w1O05qf0S4uPAoj/pGk/BYXNOJuGk4/Gk59p9ATzA
	 4xY3UwQi/h2aZeVrOPVejSzXXoGrvNZjkyC+PPz9UNxM3ctv32tv2g332dQBaZOzP/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196714;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hmf/hL1eJsuAMDGpfnH9hLfFpFFJjsZsE/eUa7PsTNc=;
	b=QiqJITj7w/rGUayKzTC4/e2CSMU2RVqai/aW74t6rpj2DL6Sybnn8Xdgb3MlUNqY5h7Y
	 kZnFrVdi8Tm2L7ZPlWDRrcvxrVPAwep9UIfBsl+SzMfPgPfuaIFHPatgIy7i3uL/vEM13
	 gsvCeI3JSFMRmUwSpxc9CdGJrsMQs3ULWm5SPaFDktS5Go7ZBjSw2pdiyIzSyM8AtbA/2
	 nG2/WS5O25czZxKLYYXX3LvxRQMd5Z5O/JcqgjlgVknipw4kGTYW1964B+b7ApsGOMJ3W
	 XND1rTwU+nnzI/tgBVr4nwFn3NHF+YaKBOJG+ya/mNp6pG2wFliZpp7TJcqUpW6BxOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=kFn3Wkov;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442A60A380F
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2442A60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=kFn3Wkov
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hmf/hL1eJsuAMDGpfnH9hLfFpFFJjsZsE/eUa7PsTNc=; b=kFn3Wkovg/1nulkgII7WzwtMzh
	604nrArEbuw+GrK7/rkNXX6K2A9YEWLZZLL+oD7IsSXuk5k94fZOlwrCsDOlPsOy0+lVIDL5ABtwr
	oJLb0XNOjgMAiOgBP6EPAXa2slJXr/VschDeGhWO4nEdVTvBNxYjTA9ZRR5TZUZOIs3s=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-2D
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 19/20] wifi: mt76: mt7996: keep the firmware log settings across a reload
Date: Fri, 20 Nov 2026 18:44:58 +0100
Message-ID: <20261120174459.1657382-19-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

mt7996_mcu_init_firmware() turns the WM and WA firmware log off after
each firmware load, while dev->fw_debug_wm, dev->fw_debug_wa and
dev->fw_debug_bin keep the debugfs settings. Since the full system reset
loads the firmware again, a reset silently stops firmware logging, and
the debugfs files still report it as enabled.

Send the stored settings at each firmware load, and, where WM or WA
logging is enabled, the other commands that the debugfs write sends.
With logging off a load sends the same commands as before, so probe is
unchanged.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt7996/debugfs.c   | 47 +-------------
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 61 ++++++++++++++++++-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 3 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 8f1ef19c3876..2ca594618f3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -306,47 +306,10 @@ static int
 mt7996_fw_debug_wm_set(void *data, u64 val)
 {
 	struct mt7996_dev *dev = data;
-	enum {
-		DEBUG_TXCMD = 62,
-		DEBUG_CMD_RPT_TX,
-		DEBUG_CMD_RPT_TRIG,
-		DEBUG_SPL,
-		DEBUG_RPT_RX,
-		DEBUG_RPT_RA = 68,
-	} debug;
-	bool tx, rx, en;
-	int ret;
 
 	dev->fw_debug_wm = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	if (dev->fw_debug_bin)
-		val = MCU_FW_LOG_RELAY;
-	else
-		val = dev->fw_debug_wm;
-
-	tx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(1));
-	rx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(2));
-	en = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(0));
-
-	ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, val);
-	if (ret)
-		return ret;
-
-	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RA; debug++) {
-		if (debug == 67)
-			continue;
-
-		if (debug == DEBUG_RPT_RX)
-			val = en && rx;
-		else
-			val = en && tx;
-
-		ret = mt7996_mcu_fw_dbg_ctrl(dev, debug, val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return mt7996_mcu_fw_debug_set(dev, MCU_FW_LOG_WM, false);
 }
 
 static int
@@ -366,16 +329,10 @@ static int
 mt7996_fw_debug_wa_set(void *data, u64 val)
 {
 	struct mt7996_dev *dev = data;
-	int ret;
 
 	dev->fw_debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
-	if (ret)
-		return ret;
-
-	return mt7996_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_PDMA_RX,
-				 !!dev->fw_debug_wa, 0);
+	return mt7996_mcu_fw_debug_set(dev, MCU_FW_LOG_WA, false);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 627ca3e93e51..d82a1f659366 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3885,6 +3885,63 @@ int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level)
 				 sizeof(data), false);
 }
 
+int mt7996_mcu_fw_debug_set(struct mt7996_dev *dev, u8 type, bool load)
+{
+	enum {
+		DEBUG_TXCMD = 62,
+		DEBUG_CMD_RPT_TX,
+		DEBUG_CMD_RPT_TRIG,
+		DEBUG_SPL,
+		DEBUG_RPT_RX,
+		DEBUG_RPT_RA = 68,
+	} debug;
+	bool tx, rx, en;
+	u8 ctrl;
+	int ret;
+
+	if (type == MCU_FW_LOG_WA) {
+		ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA,
+					       dev->fw_debug_wa);
+		if (ret || (load && !dev->fw_debug_wa))
+			return ret;
+
+		return mt7996_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+					 MCU_WA_PARAM_PDMA_RX,
+					 !!dev->fw_debug_wa, 0);
+	}
+
+	if (dev->fw_debug_bin)
+		ctrl = MCU_FW_LOG_RELAY;
+	else
+		ctrl = dev->fw_debug_wm;
+
+	tx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(1));
+	rx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(2));
+	en = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(0));
+
+	ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, ctrl);
+	if (ret || (load && !en))
+		return ret;
+
+	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RA; debug++) {
+		u8 level;
+
+		if (debug == 67)
+			continue;
+
+		if (debug == DEBUG_RPT_RX)
+			level = en && rx;
+		else
+			level = en && tx;
+
+		ret = mt7996_mcu_fw_dbg_ctrl(dev, debug, level);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mt7996_mcu_set_mwds(struct mt7996_dev *dev, bool enabled)
 {
 	struct {
@@ -3963,12 +4020,12 @@ int mt7996_mcu_init_firmware(struct mt7996_dev *dev)
 		return ret;
 
 	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
-	ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, 0);
+	ret = mt7996_mcu_fw_debug_set(dev, MCU_FW_LOG_WM, true);
 	if (ret)
 		return ret;
 
 	if (mt7996_has_wa(dev)) {
-		ret = mt7996_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
+		ret = mt7996_mcu_fw_debug_set(dev, MCU_FW_LOG_WA, true);
 		if (ret)
 			return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 24048a5ede31..c50fd3c15728 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -835,6 +835,7 @@ int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u16 val);
 int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7996_mcu_fw_log_2_host(struct mt7996_dev *dev, u8 type, u8 ctrl);
 int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level);
+int mt7996_mcu_fw_debug_set(struct mt7996_dev *dev, u8 type, bool load);
 int mt7996_mcu_trigger_assert(struct mt7996_dev *dev);
 void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb);
 void mt7996_mcu_exit(struct mt7996_dev *dev);
-- 
2.47.3

