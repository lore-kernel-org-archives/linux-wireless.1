Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717412;
	b=qFU73aA/8zCyBblZ8hyaafu81reJJzzDNraELPydUwFBshnrMwHZK13PDZq8owzkb+OF
	 foPshnsXeOedCphgNbUI5bVm+rxawfRQtzTD0jDlwKjXdDyalyY1qrneDWS1qStYXQrQ4
	 e9lwA1rIlpITgZix86AnZtX/mwgv4GWZ/k3NVMZodweO+x8Oq6NIPcmcvZSBXM81GUAQ9
	 ARTnI6yahc3aNCAV0uRBMSAU6p+6rqL+Y7LEoXHlFewNpQ2A1FkjWoi8i1ZmdmUKBvkKB
	 vjPmY6tctaKlen9rXviiBO7wVCQySJlREYvaFySojI7Fnqf0rWzC7J6970La+05w6eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717412;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U5RtEewp552wtnYLhjsXciS1KtnmNKtbjutlVxzRhJU=;
	b=WwULedDIxyBrBy3MTPsgY+9gQVXXjpqRxipIGcObm1SFLqTB01u+dNCRDt9+cI+3v6cY
	 Q0Qj+pRX8iSkUA6kBX/nu88cs8+TWCJIYAfhHBsSqaR5qKxYjybHrr6/eG3QgJWC6gxZ3
	 KxncgLw1PItQbSKbQYzJ+fWO/apPHIY5m5PTFZaI3Lzvb4iY6nY4083lm6UzRVJS12XrD
	 BZP5pqn70J61DZFgN1lB+XtW5oArG38WJJky7lOqenx5Dt+HlOWDgfmzgMB6GQpkC78nB
	 EHcAtZ2lLV4HfQmeL5BgmJrg5Vl9f1rGCuK4wfgssA/ABJbv0FK+h+IHr52OYJSRKEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jxE4LXpr;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD667606A696
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD667606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=jxE4LXpr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U5RtEewp552wtnYLhjsXciS1KtnmNKtbjutlVxzRhJU=; b=jxE4LXprluj1hHaBs06AsAH4iA
	cqUBnaDcFZlSsH8BGRaU2U16ehRxu7eTVWDKfRI9fyQXk4wpR08JDryry/O+diDXbzf4POz5dzVBx
	ARtWfM+PSN2hQGsFmHfNGrQmRS2Z0X7fLkgzFJAdXFHcZS9AZRr3Phle3blm2gsQMUM0=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe82-008icn-0r
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/16] wifi: mt76: mt7915: stop resets before the hw is unregistered
Date: Thu, 26 Nov 2026 19:23:24 +0100
Message-ID: <20261126182325.2516607-15-nbd@nbd.name>
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

recovery.hw_init_done stays set while mt7915_unregister_device() and
the late error path of mt7915_register_device() unregister the hw. The
MCU timeout path, the interrupt tasklet and debugfs can thus queue
reset_work or dump_work after the cancel, for example on an MCU timeout
in ieee80211_unregister_hw(). The work then runs from
destroy_workqueue() in mt76_free_device() and calls
ieee80211_restart_hw() on the unregistered hw.

Clear the flag before the hw is unregistered, as
mt7925e_unregister_device() does. Test the flag and queue the work
under dev->mt76.lock, and set and clear it under the same lock, so that
the cancels after the clear catch every queued work.

Also make the recovery flags plain bools, since the reset work writes
them without a lock and a bitfield write can undo another. In the error
path, also cancel init_work, as mt7996_register_device() does, and wait
for a reset or a dump queued before the error, since
mt7915_stop_hardware() cancels neither.

Fixes: 8a55712d124f ("wifi: mt76: mt7915: enable full system reset support")
Fixes: 10f73bb3938f ("wifi: mt76: mt7915: reset the device after MCU timeout")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 14 +++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  6 +++---
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index fb92a0b2e4ab..4b3bf2648d3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -1273,6 +1273,13 @@ static void mt7915_stop_hardware(struct mt7915_dev *dev)
 		mt7986_wmac_disable(dev);
 }
 
+static void mt7915_set_hw_init_done(struct mt7915_dev *dev, bool done)
+{
+	spin_lock_bh(&dev->mt76.lock);
+	dev->recovery.hw_init_done = done;
+	spin_unlock_bh(&dev->mt76.lock);
+}
+
 int mt7915_register_device(struct mt7915_dev *dev)
 {
 	struct mt7915_phy *phy2;
@@ -1324,7 +1331,7 @@ int mt7915_register_device(struct mt7915_dev *dev)
 
 	ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
 
-	dev->recovery.hw_init_done = true;
+	mt7915_set_hw_init_done(dev, true);
 
 	ret = mt7915_init_debugfs(&dev->phy);
 	if (ret)
@@ -1337,6 +1344,10 @@ int mt7915_register_device(struct mt7915_dev *dev)
 	return 0;
 
 unreg_ext_phy:
+	mt7915_set_hw_init_done(dev, false);
+	cancel_work_sync(&dev->init_work);
+	cancel_work_sync(&dev->dump_work);
+	cancel_work_sync(&dev->reset_work);
 	if (phy2) {
 		mt7915_unregister_ext_phy(dev);
 		phy2 = NULL;
@@ -1355,6 +1366,7 @@ int mt7915_register_device(struct mt7915_dev *dev)
 
 void mt7915_unregister_device(struct mt7915_dev *dev)
 {
+	mt7915_set_hw_init_done(dev, false);
 	cancel_work_sync(&dev->dump_work);
 	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->rc_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 0505d55f1c0a..dc23b8fcd216 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1765,11 +1765,13 @@ void mt7915_mac_dump_work(struct work_struct *work)
 
 void mt7915_reset(struct mt7915_dev *dev)
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
@@ -1780,7 +1782,7 @@ void mt7915_reset(struct mt7915_dev *dev)
 
 		mt7915_irq_disable(dev, MT_INT_MCU_CMD);
 		queue_work(dev->mt76.wq, &dev->dump_work);
-		return;
+		goto out;
 	}
 
 	if ((READ_ONCE(dev->recovery.state) & MT_MCU_CMD_STOP_DMA)) {
@@ -1790,6 +1792,8 @@ void mt7915_reset(struct mt7915_dev *dev)
 
 	queue_work(dev->mt76.wq, &dev->reset_work);
 	wake_up(&dev->reset_wait);
+out:
+	spin_unlock_bh(&dev->mt76.lock);
 }
 
 void mt7915_mac_update_stats(struct mt7915_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 42a59f9e3ba1..8ba11c457111 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -279,9 +279,9 @@ struct mt7915_dev {
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

