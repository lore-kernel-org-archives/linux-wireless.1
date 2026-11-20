Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196709;
	b=UY8iWF766yo84oAEEXwdEWieIIlGqaegb+4s8Lbmc4+cs4tb1mmMMlAlbr2gs+8wyRDu
	 m2rTjFmKaF8ccIAM1x9a5ou7GLJu8EGbVdKOx3pujzqx3a5Js9CqFihMDm/EXPPiDcWqL
	 KkFCth/+Im4QLD8GR3IKQD8rSKW54TXSJlzgfNkr0rNY9BJa+XkzXVqcLKf5KwBdhSwYr
	 xychhzYbNPZsVsrhogov0TndQ9cgZVYgaxPybidQvZXswPzzdBO618zTf99IHisBCkRCD
	 7Egbxelre6H7wep2OG+/xSNYNZtKvRqbjAw0SJULywpEnH5n3iEgKUlFd4xbjL/xstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196709;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5BEGOHiOs52oc2/Tg/Ak75FTOC0J4+pocD/KZ8kWvmc=;
	b=QBpGO10D4V+Ro2HqK9HUNK+cwX3tR1pWdZU4kms1kvmqCug29MPJSDkMLnmLRZo9P8J4
	 OjBhVj0Tu0CIyLAFY7enxxOTO5/bV52kykohBtzHMsKrsRStnZG/4ajvTRD4IucRRvxN1
	 0mVYhLC63t1iBsmiYU7U4kvfUHTj3TgRZbFmiphntpKR/pu8iPqTU9njKKcA8lIFoxwVc
	 6CchGWos5pQ6+l3rI45HXJwPZP6RPtdMEjpa7JJIuwRyIUkyjfTXqmHRMnAYbZLMhYFMr
	 Uhyu/di+fZLfwhw1kL1mXuYBWcV6hf44SE0QKDtjPAA70Zzf6gEDaOUqT+h3fcIIn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="CTC0r/S/";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034E60A261D
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8034E60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=CTC0r/S/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5BEGOHiOs52oc2/Tg/Ak75FTOC0J4+pocD/KZ8kWvmc=; b=CTC0r/S/j4J4aV3gktM1rydi2v
	ZM1RKdhZW3DPnUXmwSKHg3fgFzObvqtT2HPrjWyF3c0n0w/Rz3TCAXwJg1aNiBWOhCtdqciecNB66
	UnIa+QmKo1SWXSDyKPhJvV4FHjqzx3mpJxPGyJCKX24LC8PPgsbURdgYSu//OFRa89GI=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-0P
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/20] wifi: mt76: mt7925: run the reset link replay under the wiphy lock
Date: Fri, 20 Nov 2026 18:44:43 +0100
Message-ID: <20261120174459.1657382-4-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

mt7925_mac_reset_work() replays the links of each interface without the
wiphy lock or dev->mt76.mutex, so a link can go while
mt7925_vif_connect_iter() still uses it. For a station, the replay
itself queues the disconnect that removes the links. The check that
commit bd8b2ec83818 ("wifi: mt76: mt7925: fix crash in reset link
replay") added only skips a link that is gone before the replay, so a
use after free remains.

Run the replay as a wiphy work, with the mutex held. Every link change
runs under the wiphy lock, so the links stay valid until the replay
ends. The reset work cannot take the wiphy lock itself, since
mt792x_stop() waits for it under that lock.

Fixes: 14061994184d ("wifi: mt76: mt7925: add link handling in mt7925_vif_connect_iter")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 20 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  1 +
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 10 ++++++++++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   |  2 ++
 8 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 5c81574e5283..ad51f71babd7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -320,6 +320,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	skb_queue_head_init(&dev->coredump.msg_list);
 
 	INIT_WORK(&dev->reset_work, mt7925_mac_reset_work);
+	wiphy_work_init(&dev->reset_vif_work, mt7925_mac_reset_vif_work);
 	INIT_WORK(&dev->init_work, mt7925_init_work);
 	INIT_WORK(&dev->nan_deferred_work, mt7925_nan_deferred_work);
 	spin_lock_init(&dev->nan_deferred_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index c342559a133b..30deb675c5ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1640,10 +1640,22 @@ void mt7925_mac_reset_work(struct work_struct *work)
 		return;
 
 	ieee80211_wake_queues(hw);
-	ieee80211_iterate_active_interfaces(hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_vif_connect_iter, NULL);
-	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
+	wiphy_work_queue(hw->wiphy, &dev->reset_vif_work);
+}
+
+void mt7925_mac_reset_vif_work(struct wiphy *wiphy, struct wiphy_work *work)
+{
+	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
+					      reset_vif_work);
+
+	if (test_bit(MT76_REMOVED, &dev->mphy.state))
+		return;
+
+	mt792x_mutex_acquire(dev);
+	ieee80211_iterate_active_interfaces_mtx(mt76_hw(dev),
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt7925_vif_connect_iter, NULL);
+	mt792x_mutex_release(dev);
 
 	mt7925_regd_change(&dev->phy, "00");
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 1fac66e8c50a..61dc02e8aa68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -3063,6 +3063,7 @@ static void mt7925_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 
 	mt792x_stop(hw, suspend);
+	wiphy_work_cancel(hw->wiphy, &dev->reset_vif_work);
 }
 
 const struct ieee80211_ops mt7925_ops = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 1710d97c5d25..228b74721ed7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -333,6 +333,7 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 void mt7925_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta);
 void mt7925_mac_reset_work(struct work_struct *work);
+void mt7925_mac_reset_vif_work(struct wiphy *wiphy, struct wiphy_work *work);
 int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			   enum mt76_txq_id qid, struct mt76_wcid *wcid,
 			   struct ieee80211_sta *sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 736457aa10bb..a7877c408736 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -120,6 +120,7 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 	cancel_work_sync(&dev->reset_work);
+	mt792x_reset_vif_work_cancel(dev);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index f97f787b2198..ee5306c29427 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -154,6 +154,7 @@ static void mt7925u_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 
 	mt792xu_stop(hw, suspend);
+	wiphy_work_cancel(hw->wiphy, &dev->reset_vif_work);
 }
 
 static int mt7925u_probe(struct usb_interface *usb_intf,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index c2d6ebb2ca3a..8dfe10cbb6d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -374,6 +374,7 @@ struct mt792x_dev {
 	struct mt792x_phy phy;
 
 	struct work_struct reset_work;
+	struct wiphy_work reset_vif_work;
 	bool hw_full_reset:1;
 	bool hw_init_done:1;
 	bool fw_assert:1;
@@ -526,6 +527,15 @@ mt792x_hw_phy(struct ieee80211_hw *hw)
 	return phy->priv;
 }
 
+static inline void mt792x_reset_vif_work_cancel(struct mt792x_dev *dev)
+{
+	struct wiphy *wiphy = mt76_hw(dev)->wiphy;
+
+	wiphy_lock(wiphy);
+	wiphy_work_cancel(wiphy, &dev->reset_vif_work);
+	wiphy_unlock(wiphy);
+}
+
 static inline void
 mt792x_get_status_freq_info(struct mt76_rx_status *status, u8 chfreq)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index feedb66d4b6e..d5a6fe33d09c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -524,6 +524,8 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 	wake_up(&dev->mt76.mcu.wait);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 	cancel_work_sync(&dev->reset_work);
+	if (!is_connac2(&dev->mt76))
+		mt792x_reset_vif_work_cancel(dev);
 	mt792xu_cleanup(dev);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
 
-- 
2.47.3

