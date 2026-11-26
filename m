Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717412;
	b=g65QJF2G5xj24mkhzBD53arA+r3Q/ehDRXxdxpb1s7knKFzwjnMJMIAfj1gFSbIZRt7N
	 ScOuWZYNImylFliLriZl/uAiY4el4LUP9dPHtT4ZUd5/9AdZLzT7riKOprn6jYbf0vO5j
	 HxrKbDzreEsHLgbf50tPv3fBHRuWUMqJ5rLhYNOGm7wVMe09MXJZdVMoCbCv65IPgZZDC
	 +rqRoLfKHGBzfJ2hrkcHdG5KEvsCw6md0EDrsoLCOf6GCeY+8n8OAmAc8B3OI0qoXrrau
	 h+Hs9VNBMUJEozFVTih2Mhc6OOdQ79IFxLpTTMQJZvnn2HSU+ZZ+Q1mGrviYASzd27Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717412;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G8B8aYI1geQU5hQvWvCZIVWcZqHObxakfOydZ0K0nm8=;
	b=JutadFvP/0XSYnaX8FX4UPR0CkdXZIXNp4VvZsOhZGqJfYvANDWuhOypYaRtcZoN6Vz3
	 OSpWDM0EDnL60HkNAmaWTMIPmw8Gk/Wuf1OPpow1ijGxZfff4MoYgf9SQ3Plh4KZ19d4F
	 nBJUDRtH9u2jkPVzhTiH/OLDRtknPm/rUqKcTOiPmCpqbrA5vZ01U6/GGk9lpx6Q5Liqn
	 OHkGJPbMlWCp8uMeaxw4iunD5hOyK4uK2+zHvcR2pYQ1IcsxKrKg97+c+iiqN67ZDOflq
	 IL8C4wpHlxDzzrIYHFS7wrvP7UHoKxJr24hDK+XiSuFdwYlCuzC4oWQQGjel2HPWhPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=s5qMRMHZ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0089606A69A
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0089606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=s5qMRMHZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=G8B8aYI1geQU5hQvWvCZIVWcZqHObxakfOydZ0K0nm8=; b=s5qMRMHZC/TzrlWT1RFhwbCq4m
	KQ63lkTgjb7pefzk+ukxuxQq1mt9ZEEId3wUlYFRnuiagLG8YPpoFUTWjbfoRjd8L+t/BYEkT/g8H
	gBtK+VQv1ivDH3YRRiv5LIOHiT2YXDadk2wAk216t2mCKpIAjLzeBUHwFHuCzEpYekXY=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe82-008icn-1P
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/16] wifi: mt76: mt7996: stop resets before the hw is unregistered
Date: Thu, 26 Nov 2026 19:23:25 +0100
Message-ID: <20261126182325.2516607-16-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

recovery.hw_init_done stays set while mt7996_unregister_device()
unregisters the hw. The MCU timeout path, the interrupt tasklet and
debugfs can thus queue reset_work or dump_work after the cancel, for
example on an MCU timeout in ieee80211_unregister_hw(). The work then
runs from destroy_workqueue() in mt76_free_device() and calls
ieee80211_restart_hw() on the unregistered hw.

Clear the flag before the hw is unregistered, as
mt7925e_unregister_device() does. Test the flag and queue the work
under dev->mt76.lock, and set and clear it under the same lock, so that
the cancels after the clear catch every queued work.

Also make the recovery flags plain bools, since the reset work writes
them without a lock and a bitfield write can undo another.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Fixes: d2b860454ea2 ("wifi: mt76: mt7996: reset device after MCU message timeout")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 10 +++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  6 +++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 18eab0eaaaad..dd7755f3258b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1743,6 +1743,13 @@ void mt7996_set_stream_he_eht_caps(struct mt7996_phy *phy)
 						NL80211_BAND_6GHZ);
 }
 
+static void mt7996_set_hw_init_done(struct mt7996_dev *dev, bool done)
+{
+	spin_lock_bh(&dev->mt76.lock);
+	dev->recovery.hw_init_done = done;
+	spin_unlock_bh(&dev->mt76.lock);
+}
+
 int mt7996_register_device(struct mt7996_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
@@ -1792,7 +1799,7 @@ int mt7996_register_device(struct mt7996_dev *dev)
 
 	ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
 
-	dev->recovery.hw_init_done = true;
+	mt7996_set_hw_init_done(dev, true);
 
 	ret = mt7996_init_debugfs(dev);
 	if (ret)
@@ -1814,6 +1821,7 @@ void mt7996_unregister_device(struct mt7996_dev *dev)
 {
 	int i;
 
+	mt7996_set_hw_init_done(dev, false);
 	cancel_work_sync(&dev->dump_work);
 	cancel_work_sync(&dev->wed_rro.work);
 	cancel_work_sync(&dev->reset_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ec4c8118d679..1a9e2a2db7a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2889,11 +2889,13 @@ void mt7996_mac_dump_work(struct work_struct *work)
 
 void mt7996_reset(struct mt7996_dev *dev)
 {
+	spin_lock_bh(&dev->mt76.lock);
+
 	if (!dev->recovery.hw_init_done)
-		return;
+		goto out;
 
 	if (dev->recovery.hw_full_reset)
-		return;
+		goto out;
 
 	/* wm/wa exception: do full recovery */
 	if (READ_ONCE(dev->recovery.state) & MT_MCU_CMD_WDT_MASK) {
@@ -2904,7 +2906,7 @@ void mt7996_reset(struct mt7996_dev *dev)
 
 		mt7996_irq_disable(dev, MT_INT_MCU_CMD);
 		queue_work(dev->mt76.wq, &dev->dump_work);
-		return;
+		goto out;
 	}
 
 	if (READ_ONCE(dev->recovery.state) & MT_MCU_CMD_STOP_DMA) {
@@ -2914,6 +2916,8 @@ void mt7996_reset(struct mt7996_dev *dev)
 
 	queue_work(dev->mt76.wq, &dev->reset_work);
 	wake_up(&dev->reset_wait);
+out:
+	spin_unlock_bh(&dev->mt76.lock);
 }
 
 void mt7996_mac_update_stats(struct mt7996_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 1354bd82808c..86c718d6ec82 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -468,9 +468,9 @@ struct mt7996_dev {
 		u32 state;
 		u32 wa_reset_count;
 		u32 wm_reset_count;
-		bool hw_full_reset:1;
-		bool hw_init_done:1;
-		bool restart:1;
+		bool hw_full_reset;
+		bool hw_init_done;
+		bool restart;
 	} recovery;
 
 	/* protects coredump data */
-- 
2.47.3

