Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=Nu0Ie9fJLJHws4gkSzwTUVxlh580C4TscgDwTs4jwq8P3vJ0WUaCxCFUPbltZ6Rp/mKn
	 ftaaAzfniBJVk2rKgME79ypaXzmrJ4pC75itpWaAN2c9GcN1bp8BYpdQgvEjF/aNS/LZd
	 vInWin90+MtiXHIjcd3MA8pLuV/0UzDjoTeiOhjG+gHHz7ecexZT7TAoOrl0bhPgoYZ3l
	 CumQX5ws7ovqFtumUVCDB+X0E0DOQ8MZ6GoH3dboHjMannS9nXZK/3MmzoCIh2dpkEw6z
	 eX81t9f2b9TPqUhpGnElBhLo3DXTTgh83vFxaa51/1NnuCMB2ZL8kDnnxLjmK5dH/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mrklqxY1RcZSByGNB5Rj1arGOix+6/HcC6Uv8l14KH0=;
	b=rQczBfpxBOSmtOHOE3s+gm6BppmJeWO9NdKkS+P60ZpWMkPSUuj0Gb83G0YODvl3yHrb
	 aRew0Adycm/qnOx79fqkdrqkFilxzjHBWFlIQId/YOnxXtiownF0HFiKN1C1014d9sExJ
	 avdwWP+z2G6eYYDHfh43JhDH4YopmlUrgrba7Ok+T5CDdbWpy+Lw3e9wqdWg/ekSzgRo/
	 OPADfxj2psitWonJ4g3KJ2ulYedwfSAHCr2VoD65asl/menrL4sy8a74D/X6H2mwRKhiw
	 K/YlOjeBZvCaux7Q5caZjQ+F2vYY9v2rg9ZNtUsi07eQ82juABUK0IiVYjKBBRsGy8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WqzN9R+6;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED4606A336
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1ED4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WqzN9R+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mrklqxY1RcZSByGNB5Rj1arGOix+6/HcC6Uv8l14KH0=; b=WqzN9R+6SB5GyNx/Egpcb3Mf69
	oaADMm6U1B9/H4p2a2DF96AaYTGoPEZj2K2zKmkRrmujfxnfQnRb3XYSJs3tFN87QhAAfPlhM3SyV
	b1wXkdwgMhUte9/xfj/XRqWGZoVB5Tdz2hu/4XGSLePll576wydyWiB6qmII44q5i5c8=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-1m
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/20] wifi: mt76: mt7915: send mt7981 only the group units its firmware holds
Date: Mon, 23 Nov 2026 14:49:10 +0100
Message-ID: <20261123134920.154270-11-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

Since the mt7981 group pre-calibration size follows the vendor flash
layout, mt7915_mcu_apply_group_cal() sends 144 units of 1024 bytes on
mt7981. The group store of the mt7981 firmware holds 94 units, as on
mt7986. Its handler checks neither the index nor the length of a chunk.

The units with index 94 to 143 thus overwrite 50 KiB of firmware memory
behind the store. This happens at each probe of a board with group
pre-calibration data.

Send only the units that the firmware stores. Keep the trailer and the
DPD data at their offsets of the flash layout.

Fixes: 2b660ee10a0c ("wifi: mt76: mt7915: fix mt7981 pre-calibration")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  2 ++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 28 ++++++++++---------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 1dc285c72991..bfba4fce3f6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -51,6 +51,8 @@ enum mt7915_eeprom_field {
 #define MT_EE_CAL_GROUP_SIZE_7976		(94 * MT_EE_CAL_UNIT + 16)
 #define MT_EE_CAL_GROUP_SIZE_7916_6G		(94 * MT_EE_CAL_UNIT + 16)
 #define MT_EE_CAL_GROUP_SIZE_7981		(144 * MT_EE_CAL_UNIT + 16)
+/* the mt7981 firmware stores fewer group units than its flash layout holds */
+#define MT_EE_CAL_GROUP_FW_UNITS_7981		94
 #define MT_EE_CAL_DPD_SIZE_V1			(54 * MT_EE_CAL_UNIT)
 #define MT_EE_CAL_DPD_SIZE_V2			(300 * MT_EE_CAL_UNIT)
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 02426feb6182..e9a10606c6aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3105,33 +3105,35 @@ static int mt7915_mcu_set_pre_cal(struct mt7915_dev *dev, u8 idx,
 
 int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev)
 {
-	u8 idx = 0, *cal = dev->cal, *eep = dev->mt76.eeprom.data;
-	u32 total = mt7915_get_cal_group_size(dev);
+	u8 idx, units, *cal = dev->cal, *eep = dev->mt76.eeprom.data;
+	u32 size = mt7915_get_cal_group_size(dev);
 	u32 offs = is_mt7915(&dev->mt76) ? MT_EE_DO_PRE_CAL : MT_EE_DO_PRE_CAL_V2;
+	u32 trailer = size % MT_EE_CAL_UNIT;
+	int ret;
 
 	if (!(eep[offs] & MT_EE_WIFI_CAL_GROUP))
 		return 0;
 
+	units = size / MT_EE_CAL_UNIT;
+	if (is_mt7981(&dev->mt76))
+		units = MT_EE_CAL_GROUP_FW_UNITS_7981;
+
 	/*
 	 * Items: Rx DCOC, RSSI DCOC, Tx TSSI DCOC, Tx LPFG
 	 * Tx FDIQ, Tx DCIQ, Rx FDIQ, Rx FIIQ, ADCDCOC
 	 */
-	while (total > 0) {
-		int ret, len;
-
-		len = min_t(u32, total, MT_EE_CAL_UNIT);
-
-		ret = mt7915_mcu_set_pre_cal(dev, idx, cal, len,
+	for (idx = 0; idx < units; idx++) {
+		ret = mt7915_mcu_set_pre_cal(dev, idx,
+					     cal + idx * MT_EE_CAL_UNIT,
+					     MT_EE_CAL_UNIT,
 					     MCU_EXT_CMD(GROUP_PRE_CAL_INFO));
 		if (ret)
 			return ret;
-
-		total -= len;
-		cal += len;
-		idx++;
 	}
 
-	return 0;
+	/* the trailer follows all units of the flash layout */
+	return mt7915_mcu_set_pre_cal(dev, idx, cal + size - trailer, trailer,
+				      MCU_EXT_CMD(GROUP_PRE_CAL_INFO));
 }
 
 static int mt7915_find_freq_idx(const u16 *freqs, int n_freqs, u16 cur)
-- 
2.47.3

