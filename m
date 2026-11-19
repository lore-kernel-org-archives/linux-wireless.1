Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=hmvsbVwf7RWGmWrIcFl5KcHV8piVb+CAm5IJIehLsfw40+8nVBpIFCkmaCmeDvaa84Qv
	 npQgpGmaAkV9N34J4x0beJpzHLTx/6b/DG3NUj5T698zqomlusSuzEVwgNIP3CGPfZ93J
	 OObUeYcrWJ/J2YrXrhWDTA+bhFaoHHdTwliAd5f968nnmalMfCr5f8nZ7ybjhC/yAmhry
	 GVbZ6T0mmxwnDxUNhWGGUufRGHCW0JpfSgIDX1QCM6Utmq6f8A4x3YUDWCgS8n5r3rUSs
	 TgLw4XPn0H48Tsus95fQKZ3xGHBUtfI+nT8iABY+tGL/6jpPB4oY91wYHquD4Wj/N6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZnKWhnCSOqT9mY7s8FYNyymuXT8At7nROIFRINftduA=;
	b=NDuUwc9mEnPmAu41B/CHprjrEJeNGCtPm43z2Kt3ZOkc4rU2bOxRcxWDi+g/3J2GeO96
	 FagHUMPrw7cA0wtTL1Dkb+N9x3C/VF5FKQJbtjCa+OZrdN56ef0p+hOd44TLJl4jVUDGb
	 NmD+2CiHboATLNl7Z1aSMcsF0/CH6kSvddaRHv9M3FwPvkVY+TkbegvEwSY7fJ8t3BDn2
	 mYQVPmEHkVJcjztLB1vZlffdQlgQNPiSmDw3gK5JBWkIU0bNPfirDdUiM9TyssTXNj+J3
	 TndDMaM/maxOrLsawZ+PV4BsZyzR8HEE0fssSFgaNIj19SDZp5w5Cax8P9zeRaPWnMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WmVIJcmS;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9560A262B
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E9560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WmVIJcmS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZnKWhnCSOqT9mY7s8FYNyymuXT8At7nROIFRINftduA=; b=WmVIJcmSvOafPtSI1uENmS8Yoe
	GidQOkvVkKU5w71G+dUJz0XzitwA2sOMWpN0HybspXtIaeYvNRnG1PglxXftpYRxrjfjxm7L4JjAb
	njjJFNclAcuE+7KYIVtVPyQai01xeB5lbxC+tBtHxaW3k5TSY/wujbA2J4jafB1DB7bs=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-2o
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 19/20] wifi: mt76: mt792x: flush frames that still wait for the TX worker
Date: Thu, 19 Nov 2026 13:43:51 +0100
Message-ID: <20261119124352.1842164-19-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt792x_flush() waits for the hardware queues alone, but since
commit 0335c034e726 ("wifi: mt76: fix race condition related to
checking tx queue fill status"), a frame can also wait on the pending
list of its wcid until the TX worker moves it to a hardware queue. The
flush can thus return before a frame that mac80211 flushes reaches the
hardware. At a disconnection, the join ROC of the departure then ends
before the Deauthentication goes out.

Also flush the frames on the pending lists, as __mt76_set_channel()
does before a channel change, or drop them if mac80211 asks to drop
frames. Hold the mutex for it, since a chip reset parks the TX worker
under the mutex. A USB disconnect parks the worker without the mutex,
so leave the worker alone while MT76_RESET is set, and set the bit
under the mutex.

Fixes: 0335c034e726 ("wifi: mt76: fix race condition related to checking tx queue fill status")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 16 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   |  2 ++
 drivers/net/wireless/mediatek/mt76/tx.c       | 21 +++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 2a39729142af..548632fe884a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1568,6 +1568,7 @@ void mt76_tx_check_agg_ssn(struct ieee80211_sta *sta, struct sk_buff *skb);
 void mt76_txq_schedule(struct mt76_phy *phy, enum mt76_txq_id qid);
 void mt76_txq_schedule_all(struct mt76_phy *phy);
 void mt76_txq_schedule_pending(struct mt76_phy *phy);
+void mt76_txq_purge_pending(struct mt76_phy *phy);
 void mt76_tx_worker_run(struct mt76_dev *dev);
 void mt76_tx_worker(struct mt76_worker *w);
 void mt76_release_buffered_frames(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index a835c8d89618..2d39f18f4d43 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -435,9 +435,25 @@ void mt792x_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		  u32 queues, bool drop)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	bool park;
+
+	mt792x_mutex_acquire(dev);
+
+	park = !test_bit(MT76_RESET, &dev->mphy.state);
+	if (park) {
+		mt76_worker_disable(&dev->mt76.tx_worker);
+		if (drop)
+			mt76_txq_purge_pending(&dev->mphy);
+		mt76_txq_schedule_pending(&dev->mphy);
+	}
 
 	wait_event_timeout(dev->mt76.tx_wait,
 			   !mt76_has_tx_pending(&dev->mphy), HZ / 2);
+
+	if (park)
+		mt76_worker_enable(&dev->mt76.tx_worker);
+
+	mt792x_mutex_release(dev);
 }
 EXPORT_SYMBOL_GPL(mt792x_flush);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 5e19e64a9a00..feedb66d4b6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -501,7 +501,9 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 	if (!dev)
 		return;
 
+	mutex_lock(&dev->mt76.mutex);
 	set_bit(MT76_RESET, &dev->mphy.state);
+	mutex_unlock(&dev->mt76.mutex);
 	clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
 
 	cancel_work_sync(&dev->init_work);
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 2d74958893c5..72d1021a940f 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -804,6 +804,27 @@ void mt76_txq_schedule_pending(struct mt76_phy *phy)
 	rcu_read_unlock();
 	local_bh_enable();
 }
+EXPORT_SYMBOL_GPL(mt76_txq_schedule_pending);
+
+void mt76_txq_purge_pending(struct mt76_phy *phy)
+{
+	struct mt76_dev *dev = phy->dev;
+	struct sk_buff_head list;
+	struct mt76_wcid *wcid;
+
+	__skb_queue_head_init(&list);
+
+	spin_lock_bh(&dev->tx_lock);
+	list_for_each_entry(wcid, &phy->tx_list, tx_list) {
+		spin_lock(&wcid->tx_pending.lock);
+		skb_queue_splice_tail_init(&wcid->tx_pending, &list);
+		spin_unlock(&wcid->tx_pending.lock);
+	}
+	spin_unlock_bh(&dev->tx_lock);
+
+	ieee80211_purge_tx_queue(phy->hw, &list);
+}
+EXPORT_SYMBOL_GPL(mt76_txq_purge_pending);
 
 void mt76_txq_schedule_all(struct mt76_phy *phy)
 {
-- 
2.47.3

