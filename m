Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805912;
	b=ZrgroQnQzzzH7zHtIRA9LTe2RoytLe5N8yGyPghI5HWobnUtASJAAO+jZbHUTcyOoezV
	 bHPWlcuqNh6PwIJU7CkefjxSQ0MxHa3cewu4Z6uR6+ws8Q9duIAtk0kurISICjHLv5e6N
	 t4oRvRjFyd0DIl7T5rgF5CZXmRehjG1gZVr5CVc6Ij5p/9bdmt583IK54fiKPK8vveUQ6
	 v+c3N7g/sFxq0YRbQUrtvWyNOgEsXwq0S8vg9OsH3spIalhPABNjfZblXkBAdW7M1xfBt
	 YXU9sK/6FQlclLfcbFLzjbzrruSBaX+0spxB+xv9mOcdjEygbvx0Kh+FXIG6UqKHdwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805912;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:
	 DKIM-Signature;
	bh=XN9AeoCHh5uDtg6xfkBM1ykJ3IHRWDKfUxRaydoLhys=;
	b=H69kQr0Li/ydj3nkJLqpx2lYHIgXxCgmAc5DWrODk9Eqyrb2aLUG1a4khrWQWOpQ/rdi
	 x+7eMIj9wO67zx8iKuz+4OLlh6csz0XguqRwj7HXklnzygD8ItR8mqy5uQ4UmsxGC5hpn
	 E04ceiB8qX3pOUIniyP1X1MPwS6aiFAjWXTxTp8RU0ZJgXkvLYYWRJ+vfnm8jwuYfkN/7
	 tHR/fo3DDVY4KbfeXJmUYPOucEesegG3T7XZRcqRwGCtdALaLMw3cCArfTLphH2/Pke/S
	 OEeJRFOoXBKHlDX0ww53KaO5s9QG1y1LIENFfFCP+9KP51PMHSMndOsHsCnOZB98ogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=david-bauer.net;
	spf=pass smtp.mailfrom=david-bauer.net;
	dkim=pass header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=MAJUjlcc;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFA60A5BE7
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AFA60A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=MAJUjlcc
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id C2FED61B1C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 19:58:29 +0100 (CET)
Received: (qmail 18855 invoked by uid 988); 27 Nov 2026 18:58:29 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 27 Nov 2026 19:58:29 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76 2/2] wifi: mt76: mt7603: add dead broadcast recovery
Date: Fri, 27 Nov 2026 19:58:15 +0100
Message-ID: <20261127185819.1340117-2-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127185819.1340117-1-mail@david-bauer.net>
References: <20261127185819.1340117-1-mail@david-bauer.net>
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
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=rEohxessK+hTiJzHLgry3tO0c6xfZFIQL6UX5Z9n1Xo=;
	b=MAJUjlcchDE4fzL9hktCu8PgtQIERj1/ndImOiDz73TK5clEq6QDTvfSBtCibGBvXMf0sl8o1i
	8D76xxSucfoWpXkLgewhpXMb7frEQZrbFVgQiAK/S8PeWqLtSwkGYyGzmO8hAXc6mQrwSJpNFewU
	FdHYzyrzuQbkys0MTPB1QdznW1ASxmr0rwWHKA2RHUFMzqT931iWA1mjvsL3+3EZQEHoaeAXhfYr
	5o7yWwSDFh3j/rgVcU9Y3qgYCCAG1Fyb8uvkBBVxONPstszwyQLTm1eUBzOKnSu6LDPR59mLz5Sd
	nCj9u9phWeLjqSCE0dtwoFLoomSmwd4MAXZ8vm9K+eSur7nPsX8f5Pa5RUe9rzQp6IZ7y7sBI8Fc
	3S/BQcI8r3vzz/Cwr0YT3smUIymTA2xaRVR36FMplVHskQYY+LBnL7ZQ1RZuQgqvejdYBG0AJGan
	Ky9e+0tO687z/8+H2Sy0cSw3cRje/tXU6gCf1kVCWi5SZULDKFXpZE4n7bb+2u1RW2/+27RBwzRs
	/Kp0MAcwNWsRm29pjAEg0OmxKmValudF0vIQXnoEri+ImQDqUlVnYB0Ax+4izl34befwY8desjZX
	4c7rdVn01j2Um4l5UYVEOoLv6Mk7u7n/6NN3UZmupQZGIj4q19gG03esqF4X/mWkWEUuVwk0gCeU
	4=

With a Access Point located in a busy pub the associated client count on
a mt7603 radio often declined to single-digits. In this case, IPv6
connectivity also broke down.

Upon further investigation the issue was found in the AP not
broadcasting any non-unicast traffic anymore. This includes data frames
as well as beacon frames. The single-digit clients were clients which
practiced active probing.

In case the radio enters this faulty state, TX status reports for
broadcast traffic also stopped entirely. Applying a full reset procedure
including the PSE returns the radio to full operation again.

Use the absence of TX status reports for broadcast frames as a indicator
for a full reset. Introduce a new reset-cause for this error.

The trigger after 100 failed TXS reports was determined by running the
patch on a AP while observing client-count in a busy environment. The
value of 100 results in permanently working WiFi for clients, resulting
in 4 reset triggers over a timespan of 4 weeks.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../net/wireless/mediatek/mt76/mt7603/beacon.c    | 11 +++++++++--
 .../net/wireless/mediatek/mt76/mt7603/debugfs.c   |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c   | 15 ++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7603/mt7603.h    |  9 +++++++--
 4 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index acca98139f92e..184d3b732e381 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -71,6 +71,8 @@ mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	mt76_tx_queue_skb(dev, dev->mphy.q_tx[MT_TXQ_BEACON],
 			  MT_TXQ_BEACON, skb, &mvif->sta.wcid, NULL);
 
+	dev->bcast_queued = true;
+
 out:
 	spin_unlock_bh(&dev->ps_lock);
 }
@@ -127,6 +129,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		dev->beacon_check = 0;
 	mt7603_mac_stuck_beacon_recovery(dev);
 
+	dev->bcast_queued = false;
 	q = dev->mphy.q_tx[MT_TXQ_BEACON];
 	spin_lock(&q->lock);
 	ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
@@ -137,7 +140,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 
 	mt76_csa_check(mdev);
 	if (mdev->csa_complete)
-		return;
+		goto out;
 
 	q = dev->mphy.q_tx[MT_TXQ_CAB];
 	do {
@@ -149,7 +152,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		 skb_queue_len(&data.q) < 8);
 
 	if (skb_queue_empty(&data.q))
-		return;
+		goto out;
 
 	for (i = 0; i < ARRAY_SIZE(data.tail); i++) {
 		if (!data.tail[i])
@@ -165,6 +168,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		struct mt7603_vif *mvif = (struct mt7603_vif *)vif->drv_priv;
 
 		mt76_tx_queue_skb(dev, q, MT_TXQ_CAB, skb, &mvif->sta.wcid, NULL);
+		dev->bcast_queued = true;
 	}
 	mt76_queue_kick(dev, q);
 	spin_unlock(&q->lock);
@@ -177,6 +181,9 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		MT_WF_ARB_CAB_START_BSSn(0) |
 		(MT_WF_ARB_CAB_START_BSS0n(1) *
 		 ((1 << (MT7603_MAX_INTERFACES - 1)) - 1)));
+out:
+	if (dev->bcast_queued)
+		dev->bcast_check++;
 }
 
 void mt7603_beacon_set_timer(struct mt7603_dev *dev, int idx, int intval)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
index c891ad5498e61..7baabd09d57c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
@@ -14,6 +14,7 @@ mt7603_reset_read(struct seq_file *s, void *data)
 		[RESET_CAUSE_BEACON_STUCK] = "Beacon stuck",
 		[RESET_CAUSE_MCU_HANG] = "MCU hang",
 		[RESET_CAUSE_RESET_FAILED] = "PSE reset failed",
+		[RESET_CAUSE_BCAST_TXS_TIMEOUT] = "Broadcast TXS timeout",
 	};
 	int i;
 
@@ -21,7 +22,7 @@ mt7603_reset_read(struct seq_file *s, void *data)
 		if (!reset_cause_str[i])
 			continue;
 
-		seq_printf(s, "%20s: %u\n", reset_cause_str[i],
+		seq_printf(s, "%23s: %u\n", reset_cause_str[i],
 			   dev->reset_cause[i]);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 634bb67b57d52..76ee5dc332709 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1279,8 +1279,13 @@ void mt7603_mac_add_txs(struct mt7603_dev *dev, void *data)
 	pid = le32_get_bits(txs_data[4], MT_TXS4_PID);
 	wcidx = le32_get_bits(txs_data[3], MT_TXS3_WCID);
 
-	if (pid == MT_PACKET_ID_NO_ACK)
+	if (pid == MT_PACKET_ID_NO_ACK) {
+		if (wcidx >= MT7603_WTBL_STA) {
+			/* Reset broadcast check */
+			dev->bcast_check = 0;
+		}
 		return;
+	}
 
 	rcu_read_lock();
 
@@ -1340,6 +1345,9 @@ static void mt7603_pse_reset(struct mt7603_dev *dev)
 	/* Reset PSE */
 	mt76_set(dev, MT_MCU_DEBUG_RESET, MT_MCU_DEBUG_RESET_PSE);
 
+	/* Reset broadcast TXS loss trigger */
+	dev->bcast_check = 0;
+
 	if (!mt76_poll_msec(dev, MT_MCU_DEBUG_RESET,
 			    MT_MCU_DEBUG_RESET_PSE_S,
 			    MT_MCU_DEBUG_RESET_PSE_S, 500)) {
@@ -1475,6 +1483,7 @@ static void mt7603_mac_watchdog_reset(struct mt7603_dev *dev)
 	}
 
 	if (dev->failed_pse_reset_attempts ||
+	    dev->cur_reset_cause == RESET_CAUSE_BCAST_TXS_TIMEOUT ||
 	    dev->cur_reset_cause == RESET_CAUSE_RX_PSE_BUSY)
 		mt7603_pse_reset(dev);
 
@@ -1900,6 +1909,10 @@ void mt7603_mac_work(struct work_struct *work)
 				  RESET_CAUSE_RX_PSE_BUSY,
 				  MT7603_WATCHDOG_TIMEOUT,
 				  mt7603_rx_pse_busy) ||
+	    mt7603_watchdog_check(dev, &dev->bcast_check,
+				  RESET_CAUSE_BCAST_TXS_TIMEOUT,
+				  MT7603_WATCHDOG_BCAST_TIMEOUT,
+				  NULL) ||
 	    mt7603_watchdog_check(dev, &dev->beacon_check,
 				  RESET_CAUSE_BEACON_STUCK,
 				  MT7603_WATCHDOG_TIMEOUT,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 6c89e087d57d4..e40b887914ff4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -31,8 +31,9 @@
 
 #define MT7603_PRE_TBTT_TIME	5000 /* ms */
 
-#define MT7603_WATCHDOG_TIME	100 /* ms */
-#define MT7603_WATCHDOG_TIMEOUT	10 /* number of checks */
+#define MT7603_WATCHDOG_TIME		100 /* ms */
+#define MT7603_WATCHDOG_TIMEOUT		10 /* number of checks */
+#define MT7603_WATCHDOG_BCAST_TIMEOUT	100 /* number of checks */
 
 #define MT7603_EDCCA_BLOCK_TH	10
 
@@ -98,6 +99,7 @@ enum mt7603_reset_cause {
 	RESET_CAUSE_RX_PSE_BUSY,
 	RESET_CAUSE_MCU_HANG,
 	RESET_CAUSE_RESET_FAILED,
+	RESET_CAUSE_BCAST_TXS_TIMEOUT,
 	__RESET_CAUSE_MAX
 };
 
@@ -142,7 +144,10 @@ struct mt7603_dev {
 	s8 sensitivity;
 	u8 sensitivity_limit;
 
+	bool bcast_queued;
+
 	u8 beacon_check;
+	u8 bcast_check;
 	u8 tx_hang_check;
 	u8 tx_dma_check;
 	u8 rx_dma_check;
-- 
2.53.0

