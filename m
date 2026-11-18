Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018714;
	b=2orW7p392Kos22/6iHKv2ByzicIZ00PeWLnxv0XMbkgj5Oyq7BSTyRnroZ6F+GkxVbg6
	 Hx8mA0zxRUy1TqqXRr47jg4+H5sCc7iGeYwMlSyHA22VX3p3c+UzR2fZaa0W6sUihn1iO
	 s1lE2xBGaADZ0BFu3hmdluPjk4plDWQfbw8VavKVh7k6PG+B/tDwnsoLUmV6dKlKo3KS2
	 OeIgNs4n3B1wImoRf5mPu1NzxY3kIB1pdGWDXED2RSJ74c6uiJTSVegm5fNn0P3zjEzzi
	 47DfOA1YrtiwHZ0pPALZnZCRJt8pK77YftnsyvZLooa4D32vCLkAlsLSjOSnwDLMfPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018714;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J+8Tw/bzgy1gqgFqp5alPl3q7LSk263fygq90YkBW0o=;
	b=e7culv0eBC35vxXxo7cYe7VNMdjrUURiCAk/jVJuezdeSxBHAfnFog0+JWSjyS2sL9qq
	 mowpladCjLqVrnDhA/o9W1F/OY9sjGomjB6MSz/j/241YG1V9w1aDPeySpUXiUcHStyXE
	 IvCDm87ZQz4UqnKZmyxTLAdOpSNklYh7NFXPGmLV0tmJVoc0UilAgKMI0sqDRKpvQTrQk
	 2TDNXN88oo+V06hwf2MhCgvnrMEbsxzy6vT6W/ox0OH5cUWHyBlF8awMf2OUgWzycFEjI
	 hJQQ71RAgZPKrlcPy2ef0csgL7zSPhlGPOUXqBOyF6+32EAZipyAMqc3gdRqx8gb4Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=d2HqqzUS;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE660A2635
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EE660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=d2HqqzUS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J+8Tw/bzgy1gqgFqp5alPl3q7LSk263fygq90YkBW0o=; b=d2HqqzUSFI3KQ7lgGMgKGrje+v
	XdQ1miQt7drtb2PxVT6Ud4CjyNtPqQCucmEw7mxKGeu9c386BWre2sIc5kCoUg7CYx+b9CsCc5igI
	5jCjOcAjeW5OcZoYneA3Xn/lqK1IJ5D8yA9e5gEGCz1twdycCm/M3T6pb+8/ktLvtnfc=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMi-00552s-1E
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:32 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/16] wifi: mt76: mt7915: read a new MIB baseline after the firmware reload
Date: Wed, 18 Nov 2026 17:18:27 +0100
Message-ID: <20261118161827.1208649-16-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7915_mcu_get_chan_mib_info() adds the difference between the MIB
airtime counters of the firmware and the baseline in phy->state_ts to
the channel state. Since the full system reset was added,
mt7915_mac_restart() loads the firmware again, which counts from zero,
but only the phy that mt7915_run() starts first reads a new baseline.
On a DBDC chip the first survey update of the other phy after the reset
thus subtracts the counts of the old firmware, and the busy, rx and tx
times of a survey dump can wrap below zero.

Read a new baseline for each running phy at the end of a successful
restart. A phy that does not run reads it at its first start instead,
as on mt7996, since the reloaded firmware has not started it. This also
gives the ext phy a baseline when it starts while the main phy runs.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index b3d4abf6a9ed..24207880211e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1404,6 +1404,17 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 			goto out;
 	}
 
+	/* the reloaded firmware counts the MIB airtime from zero */
+	if (!run_main)
+		dev->phy.counter_reset = false;
+	else if (!ret)
+		ret = mt7915_mcu_get_chan_mib_info(&dev->phy, true);
+
+	if (phy2 && !run_ext)
+		phy2->counter_reset = false;
+	else if (run_ext && !ret)
+		ret = mt7915_mcu_get_chan_mib_info(phy2, true);
+
 out:
 	/* reset done */
 	clear_bit(MT76_RESET, &dev->mphy.state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 8cf7fde1a197..7a2e759181ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -87,8 +87,10 @@ int mt7915_run(struct ieee80211_hw *hw)
 		ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 					     MT7915_WATCHDOG_TIME);
 
-	if (!running)
+	if (!running || !phy->counter_reset) {
 		mt7915_mac_reset_counters(phy);
+		phy->counter_reset = true;
+	}
 
 out:
 	return ret;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 30fb119ce872..ec1d10832b27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -227,6 +227,7 @@ struct mt7915_phy {
 	struct mt76_mib_stats mib;
 	struct mt76_channel_state state_ts;
 
+	bool counter_reset;
 	bool sku_limit_en:1;
 	bool sku_path_en:1;
 
-- 
2.47.3

