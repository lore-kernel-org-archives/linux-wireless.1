Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=VCWng2kFI8HbIwwKgXwHIzIbmUIsFRUO5VMnBYR09TtXzK4tghzpRbHoPqUy7oRLCtwM
	 GaY+kNC8AYsvNKOEEx10mGm4ZyN4+GKclychCOD5LrhSXm2JlQ3VY4l+fq7oTWgzLlIvM
	 UMdRVYp+m6Oh9+VsWMMVlYDUT56n2MYfip4vTUdV/jLHoEnYXYGLfTaoCErhBz1jKKvUe
	 3AGL9LoSLbgsJElwB2SEpZFrYAH6Zspcypue9fQvP7w0porsXC/xmevhXlksR6bOiniq+
	 JN9lcXrVDkqn8OY8qXromT3hnkYB3ObwoQ8PPh9K5NXCSoVynIdS442UCQyvlMy3Tig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5NWWleMzHxbE38dQkoVcFAwDIIh0Cjxs/yRf6+xAdH4=;
	b=HEoD7m+IP1jxsHEE0HWbhY53N/CApDEbDQEH0eDEdI+G+/sn47OSlXDCG3bH7bFkUPxm
	 dH+SvP+/VN6JSsfDoc2BgJ4a2r9TE9FcnbPsv3LR4mpGiya74g39ox64YY3flUpWIckVC
	 86zxLBEBkxI6OlSvCD44CxZf+NJ0tkgO+8rYXIBRIfPCVZzd2ToyuLxB7P8RdMf8MM9rN
	 uiZpmsXe7H6ziaMRjLD4654fINawzxmCfosxFwwUwWaYOPbWTgJMapxl+uvxxT/3P49Vo
	 3GsEoSY2wfmER1Rf/JXQHtnet1ciOHUXlhjjXywB+agS4BuddJwViJkaeTlNPJmyqhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=TNgIl1le;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA73606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA73606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=TNgIl1le
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5NWWleMzHxbE38dQkoVcFAwDIIh0Cjxs/yRf6+xAdH4=; b=TNgIl1ler6wyIQSj/AaWqkJfjO
	lMpMbeOFw4h5OyHZfkfH+U/pccGHkFq+U/QCCJKYTeHgLYvve6fVEo5TsiSfnXHEMG7Uwlbm12hWz
	9FDW9/zXSXPBed2ZzUVwagG/3LJP46U12cgUkItJ45mh0WbMjZWfEhZS/RLemRYIT2aU=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuw-008IWP-1k
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/18] wifi: mt76: mt7996: wait for the answer of each state command
Date: Wed, 25 Nov 2026 18:36:06 +0100
Message-ID: <20261125173616.3776951-8-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

An L1 SER can drop a state command that sits in the MCU ring without a
wait. The firmware sends no answer then, so the driver keeps a state
that the firmware does not have. The driver does not send the command
again. These commands are sent without a wait:

  - the stop of the background chain.
  - the thermal duty levels and protection.
  - the SKU power limit and the Beacon rate entry.

Wait for the answer of these commands. A lost answer then requests a
full reset, as for any other state command. The firmware answers each
of them.

A firmware error status now reaches the callers:

  - mt7996_run() disables the radio, as for its other commands.
  - the radar background op returns it before it records the chain.
  - the hwmon and cooling device writes keep their old state.
  - the rate table callers ignore it.

The firmware refuses a field out of range, which the driver does not
send, and an enable of a thermal protection that is already enabled.
The driver disables the protection before it enables it, under
dev->mt76.mutex.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Fixes: 21f290884bc1 ("wifi: mt76: connac: add thermal protection support for mt7996")
Fixes: 254ab81f3b82 ("wifi: mt76: connac: add beacon duplicate TX mode support for mt7996")
Fixes: 267424ac63aa ("wifi: mt76: mt7996: enable the SKU power limit table")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 671bbb741a46..c3a41935967e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4367,7 +4367,7 @@ mt7996_mcu_background_chain_ctrl(struct mt7996_phy *phy,
 	req.band = chandef ? chandef->chan->band == NL80211_BAND_5GHZ : 1;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(OFFCH_SCAN_CTRL),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
@@ -5073,7 +5073,7 @@ int mt7996_mcu_set_thermal_throttling(struct mt7996_phy *phy, u8 state)
 		state /= 2;
 
 		ret = mt76_mcu_send_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
-					&req, sizeof(req), false);
+					&req, sizeof(req), true);
 		if (ret)
 			return ret;
 	}
@@ -5105,7 +5105,7 @@ int mt7996_mcu_set_thermal_protect(struct mt7996_phy *phy, bool enable)
 	req.tag = cpu_to_le16(UNI_CMD_THERMAL_PROTECT_DISABLE);
 
 	ret = mt76_mcu_send_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
-				&req, sizeof(req) - sizeof(req.enable), false);
+				&req, sizeof(req) - sizeof(req.enable), true);
 	if (ret || !enable)
 		return ret;
 
@@ -5118,7 +5118,7 @@ int mt7996_mcu_set_thermal_protect(struct mt7996_phy *phy, bool enable)
 	req.len = cpu_to_le16(sizeof(req) - 4);
 
 	return mt76_mcu_send_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7996_mcu_set_ser(struct mt7996_dev *dev, u8 action, u8 val, u8 band)
@@ -5683,7 +5683,7 @@ int mt7996_mcu_set_fixed_rate_table(struct mt7996_phy *phy, u8 table_idx,
 	}
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(FIXED_RATE_TABLE),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7996_mcu_rf_regval(struct mt7996_dev *dev, u32 regidx, u32 *val, bool set)
@@ -5892,7 +5892,7 @@ int mt7996_mcu_set_tx_power_ctrl(struct mt7996_phy *phy, u8 power_ctrl_id, u8 da
 	}
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(TXPOWER),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy)
-- 
2.47.3

