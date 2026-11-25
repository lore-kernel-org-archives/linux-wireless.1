Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=5kEHZ/kbHIncu7bsepnTvJoSARDpQH8vBEJLieGpUihivBUvyY5lp2IlQNfR7VzJrhsP
	 EfmZ91jLEpgF8FMgtuF+0HsuAlG3XeYPshGxm4syve/U8LdCznX89WLQoM4yKp1VCUzHs
	 6uylTF9g/w2sPURq9SZSQxwSaVDWTE0QihMla0IQA229H9L4mk+C1pOJpOgGlNFVXlLWm
	 loXEuLQ7/yLHqU5K1EQqNPJPXVteomuNcpl0mXZPE1Qxd4FJId110rDrSi0emoWlA5P+8
	 p7Sj+BXafpomAz2X3wkYaqt2EttUL1mxEcWcUH+L2lT/ReBVM1+NIKWua4KEYiaa/jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mBS2c8GwMHtFLzD3O7FFuX8W2ORpT2tw0BIjW1YgfGo=;
	b=Z2LuRYpEGWMKRHFlLpVhTSjPl1UGPaaNLbOHyTH3yFBkm/ZRuaL1YrnBbNCqeciGNzzW
	 gfdDo1btiB9dWmsYcYRQDetwnDLmXpdx+m/aEJ/Ia/kYJ36oxXxCKer4szKqyMJfaGXsQ
	 Iu5Oyzvqcm/VaE3mX2B4zvUnR2PmuoL4cjFzpXf4UyNbnjnxC2/FxDRQ789RTkuUMbh3j
	 dFez3YpZpNEEE/NB0uIKlwrgV8FmjfJCF5ovGUaqrfdB2mt8641Cs0EVUDJhS6uGalukh
	 ZC0tEyok5FcqrpQQUe8QdeFh9bVaNEOIBtHL+cUjtadYPp36imeZif8F8yRBiBeUUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bnRp1FbF;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E77606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bnRp1FbF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mBS2c8GwMHtFLzD3O7FFuX8W2ORpT2tw0BIjW1YgfGo=; b=bnRp1FbFUq+QKhNql2hDlxr43R
	yhz8nAhwDbi6xQ0SXb3i40PzFP6Xv20RVIqKJocCRyaamRcQ6is/TPPxa9tNwRJxMW3QJAqSGI732
	anglpd8l22wgxghEzAfBBnbR5Ca/SJcUqJUwIeJXOh8OjFWrFaNy3/RZBZarl0oOKaL4=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuv-008IWP-1R
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/18] wifi: mt76: mt7915: hold the rate update of a station in power save
Date: Wed, 25 Nov 2026 18:36:00 +0100
Message-ID: <20261125173616.3776951-2-nbd@nbd.name>
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

At each STA_REC_RA the firmware clears every stop reason of the TX
queue of the wlan index. It also clears the power save reason, and it
stops the queue again only at the next enter. mt7915_mac_sta_rc_work()
sends STA_REC_RA for a sleeping station too, so its frames go out while
it sleeps and are lost. Reachable via a channel width change, an
Operating Mode Notification and mt7915_set_bitrate_mask().

Keep the update of a station in power save in the work. Send it when
the PS state clears: at the leave, a TWT add or an L1 recovery. An
SMPS change of a sleeping station waits too.

While the update waits, PS-Poll and U-APSD deliveries use the old rate
state. Whether the hardware limits the width to the channel is not
read. A fixed rate from user space reaches a sleeping station at its
wake. An enter that the host did not see before the send can still
restart the queue once.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 27 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  4 +--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 ++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 84f75526da58..e458661d750b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1524,7 +1524,7 @@ mt7915_mac_reset_sta_ps(struct mt7915_dev *dev)
 		    !test_bit(MT_WCID_FLAG_PS, &wcid->flags))
 			continue;
 
-		mt76_sta_ps_transition(&dev->mt76, wcid, false);
+		mt7915_mac_sta_ps_transition(dev, wcid, false);
 	}
 	rcu_read_unlock();
 }
@@ -2074,6 +2074,10 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 	while (!list_empty(&list)) {
 		msta = list_first_entry(&list, struct mt7915_sta, rc_list);
 		list_del_init(&msta->rc_list);
+
+		if (test_bit(MT_WCID_FLAG_PS, &msta->wcid.flags))
+			continue;
+
 		changed = msta->changed;
 		msta->changed = 0;
 		spin_unlock_bh(&dev->mt76.sta_poll_lock);
@@ -2097,6 +2101,27 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+void mt7915_mac_sta_ps_transition(struct mt7915_dev *dev,
+				  struct mt76_wcid *wcid, bool ps)
+{
+	struct mt7915_sta *msta = container_of(wcid, struct mt7915_sta, wcid);
+	bool held;
+
+	mt76_sta_ps_transition(&dev->mt76, wcid, ps);
+	if (ps)
+		return;
+
+	spin_lock_bh(&dev->mt76.sta_poll_lock);
+	held = msta->changed && list_empty(&msta->rc_list);
+	if (held)
+		list_add_tail(&msta->rc_list, &dev->sta_rc_list);
+	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
+	if (held)
+		ieee80211_queue_work(mt76_phy_hw(&dev->mt76, wcid->phy_idx),
+				     &dev->rc_work);
+}
+
 void mt7915_mac_work(struct work_struct *work)
 {
 	struct mt7915_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 59042d043481..bb71e6437a62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -456,11 +456,11 @@ mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	if (path == MT7915_PS_SYNC_TWT || path == MT7915_PS_SYNC_TWT_MANY) {
 		if (ps)
-			mt76_sta_ps_transition(&dev->mt76, wcid, false);
+			mt7915_mac_sta_ps_transition(dev, wcid, false);
 		return;
 	}
 
-	mt76_sta_ps_transition(&dev->mt76, wcid, ps);
+	mt7915_mac_sta_ps_transition(dev, wcid, ps);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index cab0ed54ca84..42a59f9e3ba1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -613,6 +613,8 @@ void mt7915_mac_work(struct work_struct *work);
 void mt7915_mac_reset_work(struct work_struct *work);
 void mt7915_mac_dump_work(struct work_struct *work);
 void mt7915_mac_sta_rc_work(struct work_struct *work);
+void mt7915_mac_sta_ps_transition(struct mt7915_dev *dev,
+				  struct mt76_wcid *wcid, bool ps);
 void mt7915_mac_update_stats(struct mt7915_phy *phy);
 void mt7915_mac_twt_teardown_flow(struct mt7915_dev *dev,
 				  struct mt7915_sta *msta,
-- 
2.47.3

