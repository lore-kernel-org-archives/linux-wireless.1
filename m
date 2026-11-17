Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=TRrF53j8/UzEDJB5xTR3+3T/TXnQ6c6ek0GMaUIRjNWfQlJ8uD3w/OdxxMZLHPPYv0gm
	 GyfyJQjz/K/KBcaDBevLxWGdVpBaWWeO06NeyGRyAA/XXTHssoz7X678jUFvM+Qs2G+tM
	 KtSH/Ld+l4uivny9r5e6jhNsTay+sl7tjIUz90q/fGz3PGcfqcDBI9PRQoshNm2bXDjY8
	 Hsr28iLwpcr5hU95+I4AmD+wXW3V82AapXWiCWxCp2Q4AZJrmcygVZtYSpH4W7jlLAMpD
	 RBnohmLXlwx7pAbb3Z1Ty9LlLYuM+gJoOqrcEaW+6VYQqnXvlVOgtZ4qbNcoMwZPpww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thtWO1S70Hgu8a+AiMlskI0QjRWy1iKU2dF4+bfZYsg=;
	b=CvN//SuLp15cjWypui+ISQTQbrhI9gZuHvOvQXxdS5Sg3N9Mo3+213JEkYZxae4wUqMV
	 K+E8IIOFNmhO9S0E9epj2xSXdvdQAehtSTm6ws3PegpZ6qgJ2w4jG9apfMEGY7OMJQBLD
	 bGCZ1n0MHja5dfL8mpMDscFSfAtorjDIS57qvVY66PnIvx1hIifYPsW6p5kUGMO4/NNCg
	 FHkYi9QCn1Z7D8BPOUCNuhbzFrFrQhWVo3ps8evgT1Lv8uFLW1TDmACbaiJDfdhR0Qc7L
	 1+XN5GzR9kYENgUC+of077bfFZ47x1pYSXFV+vp09qUKaJAtd+cIAfOhbTgKO2ziYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lhct0TVO;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC9606A890
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBC9606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lhct0TVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=thtWO1S70Hgu8a+AiMlskI0QjRWy1iKU2dF4+bfZYsg=; b=lhct0TVOKaqNiCWl3xieSKVJpE
	OWfOFnFdgnsWPA63wiwG/bDmXZoUcUvXGw72lPbFKjpzMQMWU/OvzHOkCY7voVyY/L4hdv0eBdBf3
	PQ+tzN8/OAZHS6TgQosP+QG6v7oLKW6V2npTQUArGD0yHeOM3fQgSDPsrIy6IA94U6cw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-1f
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/19] wifi: mt76: guard the tx_list of every phy with one lock
Date: Tue, 17 Nov 2026 19:01:30 +0100
Message-ID: <20261117180134.2940930-15-nbd@nbd.name>
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

mt76_tx() lists a wcid on the tx_list of the phy its caller passes,
under the tx_lock of that phy, while mt76_wcid_cleanup() unlists it
under the tx_lock of wcid->phy_idx. mt7996_tx() and
mt76_offchannel_send_nullfunc() can list a wcid on the phy of another
link, so no common lock guards its node, and the tx_list gets corrupted.

Guard the tx_list of every phy with one lock per device.

Fixes: ce35ecffc96e ("wifi: mt76: mt7996: fix MLD ID in MAC TXD and HIF TXP")
Fixes: 381733b3a14a ("wifi: mt76: send nullfunc PS frames on offchannel transitions")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |  7 +++----
 drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++-
 drivers/net/wireless/mediatek/mt76/tx.c       | 13 +++++++------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 6b496dfda5cc..da1da160909a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -431,7 +431,6 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	int i;
 
 	INIT_LIST_HEAD(&phy->tx_list);
-	spin_lock_init(&phy->tx_lock);
 	for (i = 0; i < ARRAY_SIZE(phy->rx_amsdu); i++)
 		spin_lock_init(&phy->rx_amsdu[i].lock);
 	INIT_DELAYED_WORK(&phy->roc_work, mt76_roc_complete_work);
@@ -753,6 +752,7 @@ mt76_alloc_device(struct device *pdev, unsigned int size,
 	spin_lock_init(&dev->cc_lock);
 	spin_lock_init(&dev->status_lock);
 	spin_lock_init(&dev->wed_lock);
+	spin_lock_init(&dev->tx_lock);
 	mutex_init(&dev->mutex);
 	init_waitqueue_head(&dev->tx_wait);
 
@@ -1837,7 +1837,6 @@ EXPORT_SYMBOL_GPL(mt76_wcid_init);
 
 void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 {
-	struct mt76_phy *phy = mt76_dev_phy(dev, wcid->phy_idx);
 	struct ieee80211_hw *hw;
 	struct sk_buff_head list;
 	struct sk_buff *skb;
@@ -1859,7 +1858,7 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 		list_del_init(&wcid->poll_list);
 	spin_unlock_bh(&dev->sta_poll_lock);
 
-	spin_lock_bh(&phy->tx_lock);
+	spin_lock_bh(&dev->tx_lock);
 
 	if (!list_empty(&wcid->tx_list))
 		list_del_init(&wcid->tx_list);
@@ -1872,7 +1871,7 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 	skb_queue_splice_tail_init(&wcid->tx_offchannel, &list);
 	spin_unlock(&wcid->tx_offchannel.lock);
 
-	spin_unlock_bh(&phy->tx_lock);
+	spin_unlock_bh(&dev->tx_lock);
 
 	while ((skb = __skb_dequeue(&list)) != NULL) {
 		hw = mt76_tx_status_get_hw(dev, skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 7a2a6afc3c21..77bfecb7d49b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -872,7 +872,6 @@ struct mt76_phy {
 	unsigned int num_sta;
 	u8 band_idx;
 
-	spinlock_t tx_lock;
 	struct list_head tx_list;
 	struct mt76_queue *q_tx[__MT_TXQ_MAX];
 
@@ -988,6 +987,8 @@ struct mt76_dev {
 
 	struct mt76_worker tx_worker;
 	struct napi_struct tx_napi;
+	/* protects the tx_list of every phy */
+	spinlock_t tx_lock;
 
 	spinlock_t token_lock;
 	struct idr token;
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 0085b7a29fce..9eafc86ec288 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -392,10 +392,10 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
 	__skb_queue_tail(head, skb);
 	spin_unlock_bh(&head->lock);
 
-	spin_lock_bh(&phy->tx_lock);
+	spin_lock_bh(&phy->dev->tx_lock);
 	if (list_empty(&wcid->tx_list))
 		list_add_tail(&wcid->tx_list, &phy->tx_list);
-	spin_unlock_bh(&phy->tx_lock);
+	spin_unlock_bh(&phy->dev->tx_lock);
 
 	mt76_worker_schedule(&phy->dev->tx_worker);
 }
@@ -740,6 +740,7 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 
 void mt76_txq_schedule_pending(struct mt76_phy *phy)
 {
+	struct mt76_dev *dev = phy->dev;
 	LIST_HEAD(tx_list);
 	int ret = 0;
 
@@ -749,7 +750,7 @@ void mt76_txq_schedule_pending(struct mt76_phy *phy)
 	local_bh_disable();
 	rcu_read_lock();
 
-	spin_lock(&phy->tx_lock);
+	spin_lock(&dev->tx_lock);
 	list_splice_init(&phy->tx_list, &tx_list);
 	while (!list_empty(&tx_list)) {
 		struct mt76_wcid *wcid;
@@ -757,19 +758,19 @@ void mt76_txq_schedule_pending(struct mt76_phy *phy)
 		wcid = list_first_entry(&tx_list, struct mt76_wcid, tx_list);
 		list_del_init(&wcid->tx_list);
 
-		spin_unlock(&phy->tx_lock);
+		spin_unlock(&dev->tx_lock);
 		if (ret >= 0)
 			ret = mt76_txq_schedule_pending_wcid(phy, wcid, &wcid->tx_offchannel);
 		if (ret >= 0 && !phy->offchannel)
 			ret = mt76_txq_schedule_pending_wcid(phy, wcid, &wcid->tx_pending);
-		spin_lock(&phy->tx_lock);
+		spin_lock(&dev->tx_lock);
 
 		if ((!skb_queue_empty(&wcid->tx_pending) ||
 		     !skb_queue_empty(&wcid->tx_offchannel)) &&
 		    list_empty(&wcid->tx_list))
 			list_add_tail(&wcid->tx_list, &phy->tx_list);
 	}
-	spin_unlock(&phy->tx_lock);
+	spin_unlock(&dev->tx_lock);
 
 	rcu_read_unlock();
 	local_bh_enable();
-- 
2.47.3

