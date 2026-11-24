Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=eB3SUWhxENKOuBZ/A9U83fClbPIqTpzcVNlWWRdagkpkbVLYRBseYTnNoCbxPNLLOiYs
	 syabkKI9gErd/KENd+tiuOjINglL4JpLZAzlvUY6te44O8jPSGOdCL54Gg+fgi0IvjiKi
	 InIAIPIbhqXypPIX/V4byauVUeLELK35OuupSJWY4nwdZe5GEbnK+Cp7ZSGq+eHOy3R4r
	 5Rd7IAsoS/keUa+NWSiLpi2lJ/ewkTPL9UqZPsCBQbGWgxl5i1l9N3bBlHv1awMR7EiEz
	 /QjxJk6yow9ZxRiClA3liH68UahSXxgDCVXkZYDYZ+2aMrww6zx1frwBrJAdFlZHouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uzQ0uT1KhSl3WeDX7HboDsoLVysirGzMGMgkwBDJskw=;
	b=mByn8cw1MY8Ex0VdiXQMvjvzMbujwcjUtJ7TwLmHmycFAuTSjOdtOmw8wDwGjBs1Fsi3
	 NHfGwAOoFTzSlhDtILZq80qRkrsRmXMLaAZctRpu/a03wLfU6GjBlOxiTJYQrnYTF6HVc
	 mVjQvpvhL79JRL5CVYiaEbaf/su9XhbHYYosWDcF6gq30JaCQ3aHOQUAP7WOoWBcfpSIc
	 ykTUHRvUsRvpxaL8unHkhqwhO1kYDPJ+jpUvyCDnVjdxr3gyuJZS69p15Sje5zKThKizf
	 SfOaYjNcNsMLlEXOqrLzhe0FSGp3dQaLw4F0nHW+rGrMPHEnaJQ9nn/FgMYNCwSGs3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=C9xpjjwC;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72C606A334
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C72C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=C9xpjjwC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uzQ0uT1KhSl3WeDX7HboDsoLVysirGzMGMgkwBDJskw=; b=C9xpjjwCuPy5uJbC7jqIEyHj5p
	rJfnka4vZcq/S2lBA7w2jNzOACN7sjo0PPSvsPsg4YWfs8QCOYH1ekFVnnK1hjEYoTm2VYjWyUbl/
	Nlc7SUqlu9OquSNLSbywrz1e4qIDZcfFAY8i08KG0TvpLM1y290sL9d7Xw9QUFkMhQx4=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7M-007dJf-29
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/20] wifi: mt76: mt7915: mark the MCU commands that only read
Date: Tue, 24 Nov 2026 09:42:58 +0100
Message-ID: <20261124084309.1981968-9-nbd@nbd.name>
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

The core retries a lost answer only for a command with the read flag.
Without the flag, the core takes the loss as an unknown firmware state.

Set the flag on the reads of the efuse, the MIB counters and the
temperature. Set it on the reads of the TX power table, the RX rate,
an RF register and the MU statistics. Set it on the WA queries and the
SER query as well.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 40 +++++++++++++------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index e9a10606c6aa..ea79eb85d683 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -255,6 +255,9 @@ int mt7915_mcu_wa_cmd(struct mt7915_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 		},
 	};
 
+	if (cmd == MCU_WA_PARAM_CMD(QUERY))
+		cmd |= MT76_MCU_CMD_READ;
+
 	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
 }
 
@@ -2325,7 +2328,8 @@ int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy)
 		.band_idx = phy->mt76->band_idx,
 	};
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -3015,7 +3019,8 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset, u8 *read_buf)
 	int ret;
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
-					MCU_EXT_QUERY(EFUSE_ACCESS),
+					MCU_EXT_QUERY(EFUSE_ACCESS) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -3060,7 +3065,8 @@ int mt7915_mcu_get_eeprom_free_block(struct mt7915_dev *dev, u8 *block_num)
 	int ret;
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
-					MCU_EXT_QUERY(EFUSE_FREE_BLOCK),
+					MCU_EXT_QUERY(EFUSE_FREE_BLOCK) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -3316,7 +3322,8 @@ int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
 		req[i].offs = cpu_to_le32(offs[i]);
 	}
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO) |
+					MT76_MCU_CMD_READ,
 					req, len * sizeof(req[0]), true, &skb);
 	if (ret)
 		return ret;
@@ -3370,8 +3377,8 @@ int mt7915_mcu_get_temperature(struct mt7915_phy *phy)
 		.band_idx = phy->mt76->band_idx,
 	};
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_CTRL), &req,
-				 sizeof(req), true);
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_CTRL) |
+				 MT76_MCU_CMD_READ, &req, sizeof(req), true);
 }
 
 int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
@@ -3664,7 +3671,8 @@ int mt7915_mcu_get_txpower_sku(struct mt7915_phy *phy, s8 *txpower, int len,
 	int ret, i;
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
-					MCU_EXT_CMD(TX_POWER_FEATURE_CTRL),
+					MCU_EXT_CMD(TX_POWER_FEATURE_CTRL) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -3756,9 +3764,13 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 		.set = set,
 		.band = band,
 	};
+	int cmd = MCU_EXT_CMD(SET_SER_TRIGGER);
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_SER_TRIGGER),
-				 &req, sizeof(req), false);
+	/* action 0 writes the SER statistics to the firmware log */
+	if (!action)
+		cmd |= MT76_MCU_CMD_READ;
+
+	return mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), false);
 }
 
 int mt7915_mcu_set_txbf(struct mt7915_dev *dev, u8 action)
@@ -4019,7 +4031,8 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 	int ret;
 	bool cck = false;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(PHY_STAT_INFO),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(PHY_STAT_INFO) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -4276,7 +4289,8 @@ int mt7915_mcu_wed_wa_tx_stats(struct mt7915_dev *dev, u16 wlan_idx)
 		len = sizeof(req);
 	}
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WA_PARAM_CMD(QUERY) |
+					MT76_MCU_CMD_READ,
 					&req, len, true, &skb);
 	if (ret)
 		return ret;
@@ -4333,7 +4347,9 @@ int mt7915_mcu_rf_regval(struct mt7915_dev *dev, u32 regidx, u32 *val, bool set)
 		return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(RF_REG_ACCESS),
 					 &req, sizeof(req), false);
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_QUERY(RF_REG_ACCESS),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_EXT_QUERY(RF_REG_ACCESS) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
-- 
2.47.3

