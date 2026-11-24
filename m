Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=Tj74wAGCzHMRS740Qkknyw3Nhnd5jnOpEpnGwECLcPyAwz5KUIL8ZB/iAX++mZlCvmRC
	 SJb5SPe4i9xRrbNPLX2gk+XQIW7w7/D1rMHXze4/LT+n+nywpdqsDK+PU8h+b3Mihb3oE
	 KQuQIZDA/GT1s3EGA9DJgn7B/RBl28S10ypLdIFLn9OoVhesuzjmZ4fehrnuszYPmdyIB
	 WLcS5UIP8UNNaNBzHN07jX17AbP1pGrMsy90vQ/g3rIhRgogTIia3/fJedicyYLfE6qR9
	 hzvMU//f8MSM+Hq8fRH210aAEU39WbgbBTkMT48n/6GL866CC04CG6W5lvMcPfMioog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lPHDPO57r6By1id+s9skSVVMSCXsv+JutA0A0z9wu1s=;
	b=bbehWPLaXi0jreIBFlw8rgjwcfWn+8rKSIhPBkafmU2NRku1v2ZJhVHvU/Ms+0xrum4X
	 7RmNug7ra2+PqnJvHgvri56VqqRvqZ+zN5hpq4KclRCxYmBAiNyEN+UxOEV4Pa+OiaS5w
	 vY9f/WkqST/uOOVtHX6oWRsiyCFtc7Uc0pLiXNPdsJ/hCfYuwe2AElvZqM72anutP7nAC
	 6V28e3Rg0y++G11W2S/ezqhBktaIfNNehSubLhginLGaFB3E8f6rJoKSKbGofT8dGNPPd
	 6D+Bv8HDUTnlB8OGk2rJldKKCHiy0Q2nCNCc/abi9B9CaGxm6+n+jW+TwGG2nyBo7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Jy1cuTsN;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA975606A32D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA975606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Jy1cuTsN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lPHDPO57r6By1id+s9skSVVMSCXsv+JutA0A0z9wu1s=; b=Jy1cuTsNdGgGhf9HUaHIQyc3Br
	e/vL+iaEkp2W/Uvc7b2SS9ZrN1zWsYm8O6lrJGEWeVhd5lKg96hQdbEerV23gYIcuLAmI9lL9YY2n
	lejiY7xbjGl3RGJirPxFbsULOgGwP+GbCyccCgR42sm6QIcmFqJyulptFEVNmiclfpmc=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7M-007dJf-11
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/20] wifi: mt76: mt7996: mark the MCU commands that only read
Date: Tue, 24 Nov 2026 09:42:56 +0100
Message-ID: <20261124084309.1981968-7-nbd@nbd.name>
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

A command that only reads firmware state needs the read flag. Without
it, the core takes the loss of its answer as an unknown firmware state.

Set the flag on the reads of the efuse, the chip capabilities, the MIB
counters and the temperature. Set it on the register read, the station
statistics and the WA state query as well.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 37 +++++++++++++------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 28f932fe049e..52465006a40b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -409,16 +409,19 @@ int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3)
 			cpu_to_le32(a3),
 		},
 	};
+	int read = 0;
+
+	if (cmd == MCU_WA_PARAM_CMD(QUERY))
+		read = MT76_MCU_CMD_READ;
 
 	if (mt7996_has_wa(dev))
-		return mt76_mcu_send_msg(&dev->mt76, cmd, &req.args,
+		return mt76_mcu_send_msg(&dev->mt76, cmd | read, &req.args,
 					 sizeof(req.args), false);
 
-	req.tag = cpu_to_le16(cmd == MCU_WA_PARAM_CMD(QUERY) ? UNI_CMD_SDO_QUERY :
-							       UNI_CMD_SDO_SET);
+	req.tag = cpu_to_le16(read ? UNI_CMD_SDO_QUERY : UNI_CMD_SDO_SET);
 	req.len = cpu_to_le16(sizeof(req) - 4);
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_UNI_CMD(SDO), &req,
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_UNI_CMD(SDO) | read, &req,
 				 sizeof(req), false);
 }
 
@@ -4714,8 +4717,8 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 	}
 
 	req.info.addr = cpu_to_le32(addr);
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, cmd, &req, sizeof(req),
-					true, &skb);
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, cmd | MT76_MCU_CMD_READ,
+					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
 
@@ -4806,7 +4809,9 @@ int mt7996_mcu_get_efuse_free_block(struct mt7996_dev *dev, u8 *block_num)
 	struct sk_buff *skb;
 	int ret;
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL), &req,
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(EFUSE_CTRL) |
+					MT76_MCU_CMD_READ, &req,
 					sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -4838,7 +4843,8 @@ int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap)
 	int ret;
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
-					MCU_WM_UNI_CMD_QUERY(CHIP_CONFIG), &req,
+					MCU_WM_UNI_CMD_QUERY(CHIP_CONFIG) |
+					MT76_MCU_CMD_READ, &req,
 					sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -4917,7 +4923,9 @@ int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch)
 		req.data[i].offs = cpu_to_le32(offs[i]);
 	}
 
-	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO),
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -4992,7 +5000,9 @@ int mt7996_mcu_get_temperature(struct mt7996_phy *phy)
 	int ret;
 	u32 temp;
 
-	ret = mt76_mcu_send_and_get_msg(&phy->dev->mt76, MCU_WM_UNI_CMD(THERMAL),
+	ret = mt76_mcu_send_and_get_msg(&phy->dev->mt76,
+					MCU_WM_UNI_CMD(THERMAL) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -5671,7 +5681,8 @@ int mt7996_mcu_rf_regval(struct mt7996_dev *dev, u32 regidx, u32 *val, bool set)
 					 &req, sizeof(req), true);
 
 	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
-					MCU_WM_UNI_CMD_QUERY(REG_ACCESS),
+					MCU_WM_UNI_CMD_QUERY(REG_ACCESS) |
+					MT76_MCU_CMD_READ,
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
@@ -5769,7 +5780,9 @@ int mt7996_mcu_get_all_sta_info(struct mt7996_phy *phy, u16 tag)
 		.len = cpu_to_le16(sizeof(req) - 4),
 	};
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(ALL_STA_INFO),
+	return mt76_mcu_send_msg(&dev->mt76,
+				 MCU_WM_UNI_CMD(ALL_STA_INFO) |
+				 MT76_MCU_CMD_READ,
 				 &req, sizeof(req), false);
 }
 
-- 
2.47.3

