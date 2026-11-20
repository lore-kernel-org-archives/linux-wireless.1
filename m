Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196715;
	b=N1KHou1lD0EyHOUcvsGWaS6W4sAb/qPGVTa1+OmaH3SUk+6sNWP/v9jP9CEI7FH5ttdq
	 548L6TJCwwu3MWRoYEQ67FylhRuIeM2bYRi38aMC1nwtCGukpAWlI5RcXRC58YjWv7s4x
	 rEfCK2cBPA/EmspZh8fCv8MA7Rw1b92W6oTG5e1YBPLbAGZ8FXRq/QtnLAwZT4rzrbDyl
	 LjYfMMIRjDALWlpkCEYVP87TRii2y9dErTXLPdxj+WlKcSVReVBS3wx8lYIEI+iAwIRDR
	 z68UnuHdfrjyDiVKo6vC1Qiwat1VP/0u4i+/efk/vWIJIifHJwh5PpafcxRMUduYf4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196715;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x+WGBWLhGY+OdGFd4ky6l5kH4UnsyRwj2sDQFNy2myk=;
	b=0USzuws5WOH+piITG1ZsTfZH12W77cyglMsGgACGH48oDrwHXQjjDG9VarQTl79a9mLt
	 DBjQNQDa+YColA0L9rWlBtosz9yuT2DHNEN9zO3u+lXQu8oXR69ExG7btMV+d/Qokhp4Y
	 LQTD0ycJ68E6qMDjrHp7z83BTwgOt0rgxD5Bhz2dTDSCMUt3j71DatNSivVuZa8Es8X7K
	 QU+xrw6uNJL5p1AKmH3ZOjDyDDkOrA6M86nAPijUK5ahDuIGqU1vfi5KeDjpJ+jkJRqfv
	 OcwHhGqSkJZRE0OyJH9wFC4Hh6qNKJNOxZCvi5/HXvPho8TPemvEVyDmXqpRC07PT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=k7bzyC41;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EBD60A261F
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80EBD60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=k7bzyC41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x+WGBWLhGY+OdGFd4ky6l5kH4UnsyRwj2sDQFNy2myk=; b=k7bzyC41sp1BPUZp0qw0J8u6MB
	FOxSiVlVJ6Vsv3j/irfQZIcjrKwv1h0dEFUmOgOoXClCBrZQ9RkRdN+7huABb1FOIi8yzzZ0PR4nm
	vokKFkQthZDQ8BDsOvQahDJ9FXooWte2M1T8ITFItVpBJ/GiiwuQUOsgOro21hI+8oNM=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfX-0065GI-37
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/20] wifi: mt76: remove a replayed station from the driver before the add
Date: Fri, 20 Nov 2026 18:44:42 +0100
Message-ID: <20261120174459.1657382-3-nbd@nbd.name>
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

A write to the mac80211 debugfs file "reset" leaves the stations of
every interface other than a managed one in place.
ieee80211_reconfig() then adds them again on their old drv_priv, and
the sta_add of most drivers allocates a new WLAN index for them. The
old index leaks, and its dev->wcid[] entry still points at the station
after the station is freed.

Treat the replay of a station that the driver still holds as a removal
followed by a fresh add. The driver holds a station whose sta flag is
set or whose wcid is published, since a new station has a zeroed
drv_priv. Unpublish the wcid for an RCU grace period first, as for a
station that mac80211 destroys. The station keeps its count, since
mac80211 removes it through the driver later, also if the add fails.
mt76x0 and mt76x2 opt out, since their sta_add restores a replayed
station.

Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 58 ++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt76x0/pci.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   |  3 +-
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   |  3 +-
 6 files changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 2957f5694dc2..b8a568e0ae27 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1713,6 +1713,42 @@ void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 }
 EXPORT_SYMBOL_GPL(mt76_rx_poll_complete);
 
+static void
+mt76_sta_teardown(struct mt76_phy *phy, struct ieee80211_vif *vif,
+		  struct ieee80211_sta *sta)
+{
+	struct mt76_dev *dev = phy->dev;
+	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
+	int i, idx = wcid->idx;
+
+	for (i = 0; i < ARRAY_SIZE(wcid->aggr); i++)
+		mt76_rx_aggr_stop(dev, wcid, i);
+
+	if (dev->drv->sta_remove)
+		dev->drv->sta_remove(dev, vif, sta);
+
+	mt76_wcid_cleanup(dev, wcid);
+
+	mt76_wcid_mask_clear(dev->wcid_mask, idx);
+}
+
+static void
+mt76_sta_replay_drop(struct mt76_phy *phy, struct ieee80211_vif *vif,
+		     struct ieee80211_sta *sta)
+{
+	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
+	struct mt76_dev *dev = phy->dev;
+
+	spin_lock_bh(&dev->status_lock);
+	if (rcu_access_pointer(dev->wcid[wcid->idx]) == wcid)
+		rcu_assign_pointer(dev->wcid[wcid->idx], NULL);
+	spin_unlock_bh(&dev->status_lock);
+	synchronize_net();
+
+	mt76_sta_teardown(phy, vif, sta);
+	wcid->sta = 0;
+}
+
 static int
 mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	     struct ieee80211_sta *sta)
@@ -1726,8 +1762,12 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mutex);
 
-	/* drv_priv of a new station is zeroed, so only a replay has it set */
-	registered = wcid->sta;
+	published = rcu_dereference_protected(dev->wcid[wcid->idx],
+					      lockdep_is_held(&dev->mutex));
+	registered = wcid->sta || published == wcid;
+	if (registered && !(dev->drv->drv_flags & MT_DRV_KEEP_REPLAYED_STA))
+		mt76_sta_replay_drop(phy, vif, sta);
+
 	ret = dev->drv->sta_add(dev, vif, sta);
 	if (ret)
 		goto out;
@@ -1765,19 +1805,7 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 void __mt76_sta_remove(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
-	struct mt76_dev *dev = phy->dev;
-	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
-	int i, idx = wcid->idx;
-
-	for (i = 0; i < ARRAY_SIZE(wcid->aggr); i++)
-		mt76_rx_aggr_stop(dev, wcid, i);
-
-	if (dev->drv->sta_remove)
-		dev->drv->sta_remove(dev, vif, sta);
-
-	mt76_wcid_cleanup(dev, wcid);
-
-	mt76_wcid_mask_clear(dev->wcid_mask, idx);
+	mt76_sta_teardown(phy, vif, sta);
 	phy->num_sta--;
 }
 EXPORT_SYMBOL_GPL(__mt76_sta_remove);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 548632fe884a..ddada6834170 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -541,6 +541,7 @@ struct mt76_hw_cap {
 #define MT_DRV_AMSDU_OFFLOAD		BIT(5)
 #define MT_DRV_IGNORE_TXS_FAILED	BIT(6)
 #define MT_DRV_HW_PS_BUFFERING		BIT(7)
+#define MT_DRV_KEEP_REPLAYED_STA	BIT(8)
 
 struct mt76_driver_ops {
 	u32 drv_flags;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 3c4948522c5b..49ff52fe2ccb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -158,7 +158,8 @@ mt76x0e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		.txwi_size = sizeof(struct mt76x02_txwi),
 		.drv_flags = MT_DRV_TX_ALIGNED4_SKBS |
 			     MT_DRV_SW_RX_AIRTIME |
-			     MT_DRV_IGNORE_TXS_FAILED,
+			     MT_DRV_IGNORE_TXS_FAILED |
+			     MT_DRV_KEEP_REPLAYED_STA,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x0_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index 2acce121fb14..f51a7e0d147f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -215,7 +215,8 @@ static int mt76x0u_probe(struct usb_interface *usb_intf,
 {
 	static const struct mt76_driver_ops drv_ops = {
 		.drv_flags = MT_DRV_SW_RX_AIRTIME |
-			     MT_DRV_IGNORE_TXS_FAILED,
+			     MT_DRV_IGNORE_TXS_FAILED |
+			     MT_DRV_KEEP_REPLAYED_STA,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x0_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index 491a32921a06..6df9f5110b7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -23,7 +23,8 @@ mt76x2e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		.txwi_size = sizeof(struct mt76x02_txwi),
 		.drv_flags = MT_DRV_TX_ALIGNED4_SKBS |
 			     MT_DRV_SW_RX_AIRTIME |
-			     MT_DRV_IGNORE_TXS_FAILED,
+			     MT_DRV_IGNORE_TXS_FAILED |
+			     MT_DRV_KEEP_REPLAYED_STA,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x2e_set_channel,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index ade15bddefc5..23b4e020c5b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -34,7 +34,8 @@ static int mt76x2u_probe(struct usb_interface *intf,
 {
 	static const struct mt76_driver_ops drv_ops = {
 		.drv_flags = MT_DRV_SW_RX_AIRTIME |
-			     MT_DRV_IGNORE_TXS_FAILED,
+			     MT_DRV_IGNORE_TXS_FAILED |
+			     MT_DRV_KEEP_REPLAYED_STA,
 		.survey_flags = SURVEY_INFO_TIME_TX,
 		.update_survey = mt76x02_update_channel,
 		.set_channel = mt76x2u_set_channel,
-- 
2.47.3

