Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938513;
	b=ea8LyqfK8kGRyPTpHda3mMYoY9A7sJYejHVfQCoDL3ohvbDltci2LDSJfPbsiH5TRVC8
	 Jq6Yda4LFTnHy2j5VQ4v4Qay43k/d3KuhwHUZJQUtB6Mm4tWuoreituTtn4h+HAzw5ZZh
	 bjfhh/k58NA2/0FSOIBZoC6XYJF4183UjWavgsvjINI30bmxD+AQa4EDzZcMGP+jdbU+y
	 luDeQrNf0aJL1eqZkDtXHQB1JIueen31BdxOb4Bb0Wf1IO1fSkG5ElwBmPZFm7d0bKs+K
	 y1nLRMETtD3aOYllqqHoujZZBbcM3JLBOZ4WjnWgx2yRekg3ZSwZkxuvDevAbT2i+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938513;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8op0WXjMTpMv2ooxehe9/7Hau03ytKnG1AeHY7OZ/UM=;
	b=TBsfT5nkt9t2DMFyLkp+LJQRjsL1dH15hYO8hWjE/QLmblwGnYzMz56LqALxIQ6JDqZy
	 pPQyCyR22DY6jA4hQs1fbS32HmjRTtMxn9E36wV5yHJcT2LjuJpKHcSHXYQ0kc1BEHZTG
	 x7KxzEAOq83xfQ6GRAhizitiFzeMkWwYDFUaaxQUGEdTb7UTLpGUqUD69qk7RyGH4gRjJ
	 eVdgYDgTD0u3HdJycnFMMpxZMhA6aBt4njODmULLwXcEoD/SrI3Z+zBGR5XiMrxxMGSOf
	 /up+T2AomYOdqRj7Phdh+50HGWIOfA5Emz3g4gY0MzWOkvL77SeUZ8K5L4X+KGhmd9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XCCTsCU3;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A89606A339
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A89606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XCCTsCU3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8op0WXjMTpMv2ooxehe9/7Hau03ytKnG1AeHY7OZ/UM=; b=XCCTsCU3Tvl64LlqS6Im7vTnkp
	nLIuWgbLESXPjsAbrN7w+osj0U4b88yhY9PA3sYRD9g9ErJTv6Br5wvxZOTohwkgTHGB8/maXPobN
	VSwTdXkSOMnH1Htd7shsaR+g44PdidK6WwaHqqEkTtPra7hLfyTjcTh0NLFWS7kl/Tzs=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-2D
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/19] wifi: mt76: keep an unpublished wcid off the TX and poll lists
Date: Tue, 17 Nov 2026 19:01:31 +0100
Message-ID: <20261117180134.2940930-16-nbd@nbd.name>
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

A TX or RX path that looked up a wcid before the driver unpublished it
can call mt76_tx() or mt76_wcid_add_poll() after mt76_wcid_cleanup().
This lists the wcid again, and where the driver frees the wcid after
the cleanup, the TX worker or the poll later uses freed memory.

Drop the frame and skip the poll for a wcid that dev->wcid[] no longer
holds, like mt76_tx_status_skb_add() does for a TX status request. Both
tests run under the lock that the cleanup takes to unlist the wcid. The
global wcid lives as long as the device, and mt76x02 never publishes
it, so its frames are always queued. mt7996 unpublishes a station link
that it removes outside of a station removal only after the cleanup, so
unpublish it before.

Fixes: 0335c034e726 ("wifi: mt76: fix race condition related to checking tx queue fill status")
Fixes: f520eceacd24 ("wifi: mt76: mt7996: Add mt7996_mac_sta_change_links callback")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |  3 ++-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  4 +++-
 drivers/net/wireless/mediatek/mt76/tx.c       | 20 +++++++++++++------
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index da1da160909a..12089dca01b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1886,7 +1886,8 @@ void mt76_wcid_add_poll(struct mt76_dev *dev, struct mt76_wcid *wcid)
 		return;
 
 	spin_lock_bh(&dev->sta_poll_lock);
-	if (list_empty(&wcid->poll_list))
+	if (rcu_access_pointer(dev->wcid[wcid->idx]) == wcid &&
+	    list_empty(&wcid->poll_list))
 		list_add_tail(&wcid->poll_list, &dev->sta_poll_list);
 	spin_unlock_bh(&dev->sta_poll_lock);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 90a074ffa7dc..ba7a0553e34a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1385,6 +1385,9 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 	if (!msta_link)
 		return;
 
+	if (flush)
+		rcu_assign_pointer(dev->mt76.wcid[msta_link->wcid.idx], NULL);
+
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	if (!list_empty(&msta_link->wcid.poll_list))
 		list_del_init(&msta_link->wcid.poll_list);
@@ -1411,7 +1414,6 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 			phy->mt76->num_sta--;
 
 		rcu_assign_pointer(msta->link[link_id], NULL);
-		rcu_assign_pointer(dev->mt76.wcid[msta_link->wcid.idx], NULL);
 		mt76_wcid_mask_clear(dev->mt76.wcid_mask, msta_link->wcid.idx);
 		if (msta_link != &msta->deflink)
 			kfree_rcu(msta_link, rcu_head);
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 9eafc86ec288..84ab3d428001 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -365,6 +365,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 {
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_hdr *hdr = (void *)skb->data;
+	struct mt76_dev *dev = phy->dev;
 	struct sk_buff_head *head;
 
 	if (mt76_testmode_enabled(phy)) {
@@ -388,16 +389,23 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	else
 		head = &wcid->tx_pending;
 
-	spin_lock_bh(&head->lock);
-	__skb_queue_tail(head, skb);
-	spin_unlock_bh(&head->lock);
+	spin_lock_bh(&dev->tx_lock);
+	if (wcid != &dev->global_wcid &&
+	    rcu_access_pointer(dev->wcid[wcid->idx]) != wcid) {
+		spin_unlock_bh(&dev->tx_lock);
+		ieee80211_free_txskb(phy->hw, skb);
+		return;
+	}
+
+	spin_lock(&head->lock);
+	__skb_queue_tail(head, skb);
+	spin_unlock(&head->lock);
 
-	spin_lock_bh(&phy->dev->tx_lock);
 	if (list_empty(&wcid->tx_list))
 		list_add_tail(&wcid->tx_list, &phy->tx_list);
-	spin_unlock_bh(&phy->dev->tx_lock);
+	spin_unlock_bh(&dev->tx_lock);
 
-	mt76_worker_schedule(&phy->dev->tx_worker);
+	mt76_worker_schedule(&dev->tx_worker);
 }
 EXPORT_SYMBOL_GPL(mt76_tx);
 
-- 
2.47.3

