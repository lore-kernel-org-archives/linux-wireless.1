Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628190;
	b=zYjb1qvIgypI9ib/LjrPaL0lkO/jh3mXSes4qcyjA73xC9CU75VDiX+wD1i5gPFKWdXK
	 YkqdgZojZFlAi1MlgMHZ3JiGi1aUuO/0EtSrTWJ+eH6VWub8WSRolhHLM1yGZZY4hMPKw
	 hl/+OzL2GjuxFpIiyfr8t34pNG7ESStANoNf8V6kIoH4PDJ9siS6gcNlqPUWwjYppMdTY
	 gjhMdgz9YIWP5Qoai87BOQOCRq8qern1BBl3XbCNUj05CR7jDELITNYdNG6EVAPd+UW1x
	 1edCvUTk8cv6W6Uvn1vG224R8OM/VDVUIRY+ORKMOxKkCQJgP2XCH8IZyMzWeaKLgnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628190;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0AP7J2EwnI0xLRAKSfhD9uhmBxeMqeT9p8bIYAga290=;
	b=aN2cTlDfmYH6nHGx8+bhJbwBIiO5trKUNf7hi+aYaBxORe1GD/TZHF0YmTwYG6b4+Q17
	 CRHEGYYVaz9eJlzVZzS8EVPAMsOE8O+49YTsYlAEiAgeyov98XtsGZuWvStS0sk0lkfQq
	 6zsvjbasar+8EwgxecSr1yexERibKsT6HZ4Fgnb3KD5sr8jqCccVqvtG93FE4WVBAqBpp
	 thWk4bS6xtrb3HjXKdwcUaY1DsmsFezk0Y1y+QK/XpA7FCxQKWWZeSSUk34TltBb9E+vD
	 EQSmGRpJoS/YJlMRF6PltpkgpIboMVI8W/Bm4qca0WIfJtzrqf8J3j3QsdPEm2cuUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jCqTB9ET;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C1606A330
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680C1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jCqTB9ET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0AP7J2EwnI0xLRAKSfhD9uhmBxeMqeT9p8bIYAga290=; b=jCqTB9ETwJBJf6Z8Np3HMxdZ3J
	NeQu6X9HAuPq5n4LNkJCphNgl5aOcmHJQecihUNP3B7MQExOva5t4MFsmN4Q7lp7Ej9UTsOAnNyY6
	Di68mJqQj6ceT9AVTKnA7DkGX5hWEWTKKvkR4m5DMoENMz6K2ShxpbPhe67AWXRlKMRQ=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuy-008IWP-0D
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/18] wifi: mt76: mt7996: set the duplicate WTBL range again after a reset
Date: Wed, 25 Nov 2026 18:36:15 +0100
Message-ID: <20261125173616.3776951-17-nbd@nbd.name>
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

The firmware holds the duplicate WTBL range in RAM. A firmware load
starts the range with a count of 0, which turns the feature off.
mt7996_init_work() sets the range once at probe. mt7996_mac_restart()
loads the firmware again without it, so a full reset leaves the feature
off until the next probe.

Set the range again in each round of the full reset. Send it after the
beamforming init as at probe, before the replay of the stations. Like
the probe, go on if the firmware refuses it.

Fixes: 7f3ec778593f ("wifi: mt76: mt7996: add duplicated WTBL command")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 4 +---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c  | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f05231ce81ff..ec20fc8d823b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -792,9 +792,7 @@ static void mt7996_init_work(struct work_struct *work)
 	mt7996_mcu_set_eeprom(dev);
 	mt7996_mac_init(dev);
 	mt7996_txbf_init(dev);
-
-	if (!is_mt7990(&dev->mt76))
-		mt7996_mcu_set_dup_wtbl(dev);
+	mt7996_mcu_set_dup_wtbl(dev);
 }
 
 void mt7996_wfsys_reset(struct mt7996_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 6d3061c64e30..62e16e3c989b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2460,6 +2460,8 @@ mt7996_mac_restart(struct mt7996_dev *dev)
 	if (ret)
 		goto out;
 
+	mt7996_mcu_set_dup_wtbl(dev);
+
 	mt7996_for_each_phy(dev, phy) {
 		if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 			continue;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index df08c4bba0e7..f7c08bc4a588 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -6024,6 +6024,9 @@ int mt7996_mcu_set_dup_wtbl(struct mt7996_dev *dev)
 		.num = cpu_to_le16(DUP_WTBL_NUM),
 	};
 
+	if (is_mt7990(&dev->mt76))
+		return 0;
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(CHIP_CONFIG), &req,
 				 sizeof(req), true);
 }
-- 
2.47.3

