Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018714;
	b=R6G3XQOqoM9LxqxzPwGlfV1ZOnk5q5JUPgvULuzJvzOQKIux2rvRj6BD4os+d9DbWi+F
	 AdpbISITqOzpEEbeHUsWRBJQ4JP6zfEAkl+WivDdC5P+4+qkJWgGfPmgz+Vh8ydFuXQ/h
	 qGT3SKqY0T6VSf+WY+vWr/ebH1uVIkam3QBfr7N69F8Nz8MeWjW1VVuqpntYfjNdV8uV7
	 ee3s34G+Qemvi01woNZTWXVuW5FX6tPWgD6CeG5BIsMpzY71zhujR1rO4xOSJ/LVcN1Xr
	 O908i/L1nA+pwfI5N19wDHdUe+1HnCbPsAa2rR5/uXTP1oFy4OyQVifFwB2n+M4Ze5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018714;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kwMsNWR1X7FGK3c7jiuHAz0C12wwyWc1ClYr7w6VJrE=;
	b=OYwTekpIDMuofqm3Fj1eBdXf20VQLeOQFhYsMgrvAdRdDbeps+W5E7/lmonlT9qEvPDk
	 Qc0h0skn10nnk3FddoqOH8314MGHKoj43+xeiZ94rgcRKkeRrn7BcGUT+ZK81CIhSziC9
	 cFnBEj/xZJ+kBMRTiu0vSziXSZJsPZ5JhHFadhgZ8KM46y/YeF/JvAaIeZ+PWRX/3EG/+
	 ZaU4zPSKp4peLNQJFC4CdyQZH7ahUUk7cnTGSqfal6ymnZFQQ3iFsm8eEJRK+a7EAvOGx
	 qwRHZedkG3jO5FBgv8ef6UANawUv9h5Ya0EcmFy/DoLz+Retvte+K/zhH2RjnzaP9sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VLSsVBJk;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3960A2604
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C3960A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VLSsVBJk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kwMsNWR1X7FGK3c7jiuHAz0C12wwyWc1ClYr7w6VJrE=; b=VLSsVBJk8RutiTmPFiuPT5JD0p
	gqYqOrfVzTVC8VwW24dlqkA6YgixR6/i0Zck88QzQ1S+aoBMLJMm2oQFV2rE8bJKNChOaVKe4cpqQ
	PaPAKsjmNZHaXi7pSmpXo6r8p4Xh+sbwawgAkSfhCqPwXTLblPi0+SZr4MAyc4sWixbA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-2q
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/16] wifi: mt76: wait for a ROC completion in progress on cancel
Date: Wed, 18 Nov 2026 17:18:24 +0100
Message-ID: <20261118161827.1208649-13-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt76_cancel_remain_on_channel() reads mvif->roc_phy and phy->roc_vif
without dev->mutex, while mt76_roc_complete() clears both under the
mutex before it reports the expiry. A cancel during a completion thus
returns before the expiry reaches mac80211, and the late expiry ends the
next request. ieee80211_cancel_roc() relies on the opposite:

  Note that this assumes that by the time the driver returns
  from drv_cancel_remain_on_channel, it has completed all
  the processing of related notifications.

Look up the request of the interface under dev->mutex, so that a
completion in progress has reported the expiry before the cancel
returns.

Fixes: a8f424c1287c ("wifi: mt76: add multi-radio remain_on_channel functions")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index df655cc56349..9638f65a679e 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -507,14 +507,16 @@ EXPORT_SYMBOL_GPL(mt76_remain_on_channel);
 int mt76_cancel_remain_on_channel(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif)
 {
-	struct mt76_vif_link *mlink = (struct mt76_vif_link *)vif->drv_priv;
-	struct mt76_vif_data *mvif = mlink->mvif;
-	struct mt76_phy *phy = mvif->roc_phy;
+	struct mt76_phy *phy = hw->priv;
+	struct mt76_dev *dev = phy->dev;
 
-	if (!phy || phy->roc_vif != vif)
-		return 0;
+	/* a completion holds the mutex until it reported the expiry */
+	mutex_lock(&dev->mutex);
+	phy = mt76_vif_roc_phy(dev, vif);
+	mutex_unlock(&dev->mutex);
 
-	mt76_abort_roc(phy);
+	if (phy)
+		mt76_abort_roc(phy);
 
 	return 0;
 }
-- 
2.47.3

