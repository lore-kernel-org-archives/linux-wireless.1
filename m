Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=JhTK3zr8NDJVGes3AM/3g8hzNrpCgpN/N5dW+kqmozxEL3OCRI2i+PKef+WejAO2C0oT
	 xJKty6Qyd/ehqWQ7eMWxg5R+PzYWhZTndMdRaItloY3NTHzvmVYKRwciVbAvn1eNXIxu5
	 kBnrE9CcREZ5E5WRzLfErBe72YB7vuR+/1oVBh8g2vOZP5AxPSV5TL4cCT15UWS2yX7TJ
	 W4AuZSUQV1j2ZgTQ/raeHRPHgqDloxx69gK1Tt07jaUkefOqR6x1Yr7bskDC0GFOTKalH
	 SxBOK9a5aFqiGkENSof5RcQhoqD0UPAScXmRKeiHDF0SxNpWpAMdUw1VvL4Y8mKXfLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oVyaIowqjtaFAktc5E0xA8t+kYXVqxq4oD2vAuhhbCw=;
	b=anSNgWVB8T8SaSRkQipIPjS8DY88rBLWRtNOGC8zf0psX5ueI/Z8n8MAvr5iu6UQCqzD
	 Mba2g4UZkvl0wdjmWfNcLvooCAG02YZ8S8dxYikjT8CUnLER7eM7OM2cEka58UB7PL0S9
	 +GF9XgwAeOQ+4iaXzrDeWJOSHGp11DgxhuVQx87RyjkmsZbwisr0UBgovIvCwm8TN8YAY
	 MEPAYzzW0hswbT1bJgREcAVjMRMpKQbbWfV3SMWrB0aQ5oe1+EapCuggzbP3sYFHdwGtz
	 nIdzUfTvwPp0Y+1/lYiLPsARPSZUneIrjuMgJXUuSimm1Cqq/tC5s1hXAIR7uHTkLkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nY8jQVEr;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BEE606A8B1
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BEE606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nY8jQVEr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oVyaIowqjtaFAktc5E0xA8t+kYXVqxq4oD2vAuhhbCw=; b=nY8jQVErkIxgATnoEGJTd3tnCl
	AUgHq7uhrlzWQo3mHQlZ+79zlL89k44cXtFXhh7cdv62kE/B9Cs4hIFy+eYVv2s3xwtJuZXIX7j3Y
	J3+CmbpqCPq5ZcU5Jl7IClgLPro7aEKZxGZC/SiKWvrnhQlcCtpdFIMQE4mvSxIyS/EA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-2k
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/19] wifi: mt76: mt7925: do not take iflist_mtx under the mutex
Date: Tue, 17 Nov 2026 19:01:32 +0100
Message-ID: <20261117180134.2940930-17-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

The ROC abort paths and the runtime PM write of debugfs walk the
interfaces with iterators that take iflist_mtx while they hold
dev->mt76.mutex. mac80211 calls driver ops under iflist_mtx, and
mt7925_mlo_pm_iter() takes the mutex inside an interface walk, so a ROC
request that reclaims a stale ROC deadlocks against
mt7925_mlo_pm_work().

Collect the BSS indexes with the atomic iterator and send the aborts
after the walk, which leaves out interfaces that are not running. In
the runtime PM write, take the mutex in the walk callback for each
interface, and read the monitor state under it.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Fixes: 45064d19fd3a ("wifi: mt76: mt7925: fix a potential association failure upon resuming")
Fixes: 7e54ebad64d8 ("wifi: mt76: mt7925: harden the ROC channel-grant handshake")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  5 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 75 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  5 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +-
 4 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..d0677a24e080 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -203,8 +203,11 @@ mt7925_pm_set(void *data, u64 val)
 	mt76_connac_pm_wake(&dev->mphy, pm);
 
 	pm->enable_user = val;
+	mutex_unlock(&dev->mt76.mutex);
+
 	mt7925_set_runtime_pm(dev);
-	mt76_connac_power_save_sched(&dev->mphy, pm);
+
+	return 0;
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 222836699d15..56d2c79cd232 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -520,23 +520,25 @@ static void mt7925_roc_iter(void *priv, u8 *mac,
 			    struct ieee80211_vif *vif)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt792x_phy *phy = priv;
+	u64 *bss_mask = priv;
 
-	mt7925_mcu_abort_roc(phy, &mvif->bss_conf, phy->roc_token_id);
+	*bss_mask |= BIT_ULL(mvif->bss_conf.mt76.idx);
 }
 
-struct mt7925_roc_abort_data {
-	struct mt792x_phy *phy;
-	u8 token;
-};
-
-static void mt7925_roc_token_iter(void *priv, u8 *mac,
-				  struct ieee80211_vif *vif)
+static void mt7925_roc_abort_all(struct mt792x_phy *phy, u8 token)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt7925_roc_abort_data *data = priv;
+	u64 bss_mask = 0;
+	u8 bss_idx;
 
-	mt7925_mcu_abort_roc(data->phy, &mvif->bss_conf, data->token);
+	ieee80211_iterate_active_interfaces_atomic(phy->mt76->hw,
+						   IEEE80211_IFACE_ITER_RESUME_ALL,
+						   mt7925_roc_iter, &bss_mask);
+
+	while (bss_mask) {
+		bss_idx = __ffs64(bss_mask);
+		bss_mask &= ~BIT_ULL(bss_idx);
+		mt7925_mcu_abort_roc(phy, bss_idx, token);
+	}
 }
 
 void mt7925_roc_abort_sync(struct mt792x_dev *dev)
@@ -550,22 +552,19 @@ void mt7925_roc_abort_sync(struct mt792x_dev *dev)
 
 	cancel_work(&phy->roc_work);
 
-	ieee80211_iterate_interfaces(mt76_hw(dev),
-				     IEEE80211_IFACE_ITER_RESUME_ALL,
-				     mt7925_roc_iter, (void *)phy);
+	mt7925_roc_abort_all(phy, phy->roc_token_id);
 }
 EXPORT_SYMBOL_GPL(mt7925_roc_abort_sync);
 
 void mt7925_roc_work(struct work_struct *work)
 {
-	struct mt7925_roc_abort_data data;
 	struct mt792x_phy *phy;
+	u8 token;
 
 	phy = (struct mt792x_phy *)container_of(work, struct mt792x_phy,
 						roc_work);
 
-	data.phy = phy;
-	data.token = phy->roc_token_id;
+	token = phy->roc_token_id;
 
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
@@ -574,9 +573,7 @@ void mt7925_roc_work(struct work_struct *work)
 	ieee80211_remain_on_channel_expired(phy->mt76->hw);
 
 	mt792x_mutex_acquire(phy->dev);
-	ieee80211_iterate_active_interfaces(phy->mt76->hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_roc_token_iter, &data);
+	mt7925_roc_abort_all(phy, token);
 	mt792x_mutex_release(phy->dev);
 }
 
@@ -590,7 +587,8 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
 
 	mt792x_mutex_acquire(phy->dev);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
-		err = mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
+		err = mt7925_mcu_abort_roc(phy, mconf->mt76.idx,
+					   phy->roc_token_id);
 	mt792x_mutex_release(phy->dev);
 
 	return err;
@@ -599,10 +597,7 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
 /* Callers hold the mutex that mt7925_roc_work() takes, so no cancel_work_sync() */
 static void mt7925_roc_stale_reclaim(struct mt792x_phy *phy)
 {
-	struct mt7925_roc_abort_data data = {
-		.phy = phy,
-		.token = phy->roc_token_id,
-	};
+	u8 token = phy->roc_token_id;
 
 	if (!test_bit(MT76_STATE_ROC, &phy->mt76->state) ||
 	    timer_pending(&phy->roc_timer))
@@ -614,9 +609,7 @@ static void mt7925_roc_stale_reclaim(struct mt792x_phy *phy)
 	if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		return;
 
-	ieee80211_iterate_active_interfaces(phy->mt76->hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_roc_token_iter, &data);
+	mt7925_roc_abort_all(phy, token);
 
 	if (phy->roc_notify)
 		ieee80211_remain_on_channel_expired(phy->mt76->hw);
@@ -649,7 +642,7 @@ static int mt7925_set_roc(struct mt792x_phy *phy,
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
 		timer_delete_sync(&phy->roc_timer);
-		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
+		mt7925_mcu_abort_roc(phy, mconf->mt76.idx, phy->roc_token_id);
 		err = -ETIMEDOUT;
 	}
 
@@ -680,7 +673,7 @@ static int mt7925_set_mlo_roc(struct mt792x_phy *phy,
 	if (!wait_event_timeout(phy->roc_wait, phy->roc_grant, 4 * HZ)) {
 		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
 		timer_delete_sync(&phy->roc_timer);
-		mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
+		mt7925_mcu_abort_roc(phy, mconf->mt76.idx, phy->roc_token_id);
 		err = -ETIMEDOUT;
 	}
 
@@ -872,12 +865,16 @@ mt7925_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt792x_dev *dev = priv;
 	struct ieee80211_hw *hw = mt76_hw(dev);
-	bool pm_enable = dev->pm.enable;
+	bool pm_enable;
 	int err;
 
+	mt792x_mutex_acquire(dev);
+
+	pm_enable = dev->pm.enable_user &&
+		    !(hw->conf.flags & IEEE80211_CONF_MONITOR);
 	err = mt7925_mcu_set_beacon_filter(dev, vif, pm_enable);
 	if (err < 0)
-		return;
+		goto out;
 
 	if (pm_enable) {
 		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
@@ -886,6 +883,8 @@ mt7925_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 		vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
 		__clear_bit(IEEE80211_HW_CONNECTION_MONITOR, hw->flags);
 	}
+out:
+	mt792x_mutex_release(dev);
 }
 
 static void
@@ -910,14 +909,22 @@ void mt7925_set_runtime_pm(struct mt792x_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct mt76_connac_pm *pm = &dev->pm;
-	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
+	bool monitor;
 
+	mutex_lock(&dev->mt76.mutex);
+	monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 	pm->enable = pm->enable_user && !monitor;
+	mutex_unlock(&dev->mt76.mutex);
+
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_pm_interface_iter, dev);
+
+	mt792x_mutex_acquire(dev);
+	monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
 	pm->ds_enable = pm->ds_enable_user && !monitor;
 	mt7925_mcu_set_deep_sleep(dev, pm->ds_enable);
+	mt792x_mutex_release(dev);
 }
 
 static int mt7925_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bf8cc4b1f539..54e504a76812 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1714,8 +1714,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 				 &req, sizeof(req), true);
 }
 
-int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
-			 u8 token_id)
+int mt7925_mcu_abort_roc(struct mt792x_phy *phy, u8 bss_idx, u8 token_id)
 {
 	struct mt792x_dev *dev = phy->dev;
 	struct {
@@ -1735,7 +1734,7 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			.tag = cpu_to_le16(UNI_ROC_ABORT),
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
-			.bss_idx = mconf->mt76.idx,
+			.bss_idx = bss_idx,
 			.dbdcband = 0xff, /* auto*/
 		},
 	};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 1c20b4ae7497..b18fb5d5bb6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -416,8 +416,7 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		       struct ieee80211_channel *chan, int duration,
 		       enum mt7925_roc_req type, u8 token_id);
-int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
-			 u8 token_id);
+int mt7925_mcu_abort_roc(struct mt792x_phy *phy, u8 bss_idx, u8 token_id);
 void mt7925_roc_abort_sync(struct mt792x_dev *dev);
 int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq);
-- 
2.47.3

