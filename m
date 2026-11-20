Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=TCNuUYfvm+tZTRWpEs/ZtlgToE2nLeQ1HECEDbCYusXf26i/abSmRj88Cz/RyMnHMBdy
	 T6QRXcTzEZe6QTF5L0veOR5YNFU0Nab+6HWL4s3BiSRbEz/2fTQxj52oHwCV6XtsKTM2l
	 anHrvJDfT5qALj6feEuLV/2AXtQc8x9HGGn+UXP4JFiK6yI3Pt91FVOsE8iq5774+0tt/
	 yUNorQFs+EBKYLAkEDrMa9ET+fNFqEXJ7XI59Z+6pZybs9Dng46qwu8PNqEFSi0tYdHUx
	 Shsu1s5cbuR3EuTtpi/fRpRMBiMPsZywi15FnJj/qkSxy4Rmm6Tn12iXoa/Jt60pLig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qUfL25IwhWoRHH+kh/Ql+tjymHBJwdKsNZGXz9csJxw=;
	b=sBmof42o86SIsbFisjM7HysFOoaaQ2mZt938slXVfNa4lnuWrS2EO+6iQPXq2+iHVYbL
	 UB+86WfKVs6FZ4nFvcF9v7PHlhmpJ4vNYlsB+lARAw9UKIKzYMKb7d1g9I37Wl7cQuM6p
	 qJdcTk+WpvCppSsfT+7jmaZPVxY3jimeTEpq82woLrxkEwOoS6kQAZXitTCpLbbF3SlDw
	 QQSrPD9sngKqADIwGoh8NWQcGB2jzghzpjO/clvgcKpSJP54F8YiY+T3GvScEVQFJ0ZNL
	 cOy3vQs2riVurAHZi2lFgqn6/TiuSKtdF0vDgrz06+AEhRyBRYetR7d8QJib3YwVjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="D0oGsgK/";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3B60A2624
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB3B60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D0oGsgK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qUfL25IwhWoRHH+kh/Ql+tjymHBJwdKsNZGXz9csJxw=; b=D0oGsgK/H7gt+Z7jBu5uLp6TB9
	g128SjlkWZl9fjjWGJdsKQAUmetg2dQxEWfyL/m52GtvpAI4iFrHlhp32Pw5LVUZgMmG0i4jJJFv1
	glWFwmcCKCX2iwwpD36aLiTQsyU28zD4kgx9atMhJVPnKYXOKxvokww9IFvIdyeMV9b0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-2h
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 20/20] wifi: mt76: mt7915: keep the firmware log settings across a reload
Date: Fri, 20 Nov 2026 18:44:59 +0100
Message-ID: <20261120174459.1657382-20-nbd@nbd.name>
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

mt7915_mcu_init_firmware() turns the WM and WA firmware log off after
each firmware load, while dev->fw.debug_wm, dev->fw.debug_wa and
dev->fw.debug_bin keep the debugfs settings. Since the full system reset
loads the firmware again, a reset silently stops firmware logging, and
the debugfs files still report it as enabled.

Send the stored settings at each firmware load, and, where WM or WA
logging is enabled, the other commands and register writes that the
debugfs write sends. With logging off a load sends the same commands as
before, so probe is unchanged.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 49 +--------------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 63 ++++++++++++++++++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 64 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index a4e95073001d..f69457b0154f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -495,50 +495,11 @@ static int
 mt7915_fw_debug_wm_set(void *data, u64 val)
 {
 	struct mt7915_dev *dev = data;
-	enum {
-		DEBUG_TXCMD = 62,
-		DEBUG_CMD_RPT_TX,
-		DEBUG_CMD_RPT_TRIG,
-		DEBUG_SPL,
-		DEBUG_RPT_RX,
-	} debug;
-	bool tx, rx, en;
 	int ret;
 
 	dev->fw.debug_wm = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	if (dev->fw.debug_bin)
-		val = 16;
-	else
-		val = dev->fw.debug_wm;
-
-	tx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(1));
-	rx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(2));
-	en = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(0));
-
-	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, val);
-	if (ret)
-		goto out;
-
-	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++) {
-		if (debug == DEBUG_RPT_RX)
-			val = en && rx;
-		else
-			val = en && tx;
-
-		ret = mt7915_mcu_fw_dbg_ctrl(dev, debug, val);
-		if (ret)
-			goto out;
-	}
-
-	/* WM CPU info record control */
-	mt76_clear(dev, MT_CPU_UTIL_CTRL, BIT(0));
-	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) |
-		(dev->fw.debug_wm ? 0 : BIT(0)));
-	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
-	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
-
-out:
+	ret = mt7915_mcu_fw_debug_set(dev, MCU_FW_LOG_WM, false);
 	if (ret)
 		dev->fw.debug_wm = 0;
 
@@ -566,13 +527,7 @@ mt7915_fw_debug_wa_set(void *data, u64 val)
 
 	dev->fw.debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw.debug_wa);
-	if (ret)
-		goto out;
-
-	ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
-				MCU_WA_PARAM_PDMA_RX, !!dev->fw.debug_wa, 0);
-out:
+	ret = mt7915_mcu_fw_debug_set(dev, MCU_FW_LOG_WA, false);
 	if (ret)
 		dev->fw.debug_wa = 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9b748b37624d..6e1c3e5e2fe9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2221,6 +2221,65 @@ int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level)
 				 sizeof(data), false);
 }
 
+int mt7915_mcu_fw_debug_set(struct mt7915_dev *dev, u8 type, bool load)
+{
+	enum {
+		DEBUG_TXCMD = 62,
+		DEBUG_CMD_RPT_TX,
+		DEBUG_CMD_RPT_TRIG,
+		DEBUG_SPL,
+		DEBUG_RPT_RX,
+	} debug;
+	bool tx, rx, en;
+	u8 ctrl;
+	int ret;
+
+	if (type == MCU_FW_LOG_WA) {
+		ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA,
+					       dev->fw.debug_wa);
+		if (ret || (load && !dev->fw.debug_wa))
+			return ret;
+
+		return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+					 MCU_WA_PARAM_PDMA_RX,
+					 !!dev->fw.debug_wa, 0);
+	}
+
+	if (dev->fw.debug_bin)
+		ctrl = 16;
+	else
+		ctrl = dev->fw.debug_wm;
+
+	tx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(1));
+	rx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(2));
+	en = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(0));
+
+	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, ctrl);
+	if (ret || (load && !en))
+		return ret;
+
+	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++) {
+		u8 level;
+
+		if (debug == DEBUG_RPT_RX)
+			level = en && rx;
+		else
+			level = en && tx;
+
+		ret = mt7915_mcu_fw_dbg_ctrl(dev, debug, level);
+		if (ret)
+			return ret;
+	}
+
+	mt76_clear(dev, MT_CPU_UTIL_CTRL, BIT(0));
+	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) |
+		(dev->fw.debug_wm ? 0 : BIT(0)));
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
+	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
+
+	return 0;
+}
+
 int mt7915_mcu_muru_debug_set(struct mt7915_dev *dev, bool enabled)
 {
 	struct {
@@ -2441,11 +2500,11 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 		return ret;
 
 	set_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state);
-	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, 0);
+	ret = mt7915_mcu_fw_debug_set(dev, MCU_FW_LOG_WM, true);
 	if (ret)
 		return ret;
 
-	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, 0);
+	ret = mt7915_mcu_fw_debug_set(dev, MCU_FW_LOG_WA, true);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 1a0aeed5073e..afb856febe3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -551,6 +551,7 @@ int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
 int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7915_mcu_fw_log_2_host(struct mt7915_dev *dev, u8 type, u8 ctrl);
 int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level);
+int mt7915_mcu_fw_debug_set(struct mt7915_dev *dev, u8 type, bool load);
 void mt7915_mcu_rx_event(struct mt7915_dev *dev, struct sk_buff *skb);
 void mt7915_mcu_exit(struct mt7915_dev *dev);
 
-- 
2.47.3

