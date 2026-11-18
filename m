Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=DEbaCmSv7iEfjYpXsdapqMDXH4E5oj/l2Mw0CEErvaD6ZU0g26ss1cb8iCcATYJhiUdf
	 UYRYCy2GdRk7Oz5Z1Siro35JuceUsBsUR43gweOMkOhPT1FIHP1RGUitdWT8pKJTNuiRp
	 5WX9ZZ5FurNf/uHhqx1sQXXHdcOIMNPFRD7ome+4Hsj7TrgshRirQtw/ztrRQTZwAoi87
	 6J8KZkjJtVHXGcydSeICasKwkXZb9VlNu0O4QT+7vnp5T57P9EuSg+50p0OYfhhbLmo8B
	 v5BCULKoNuq7jq2AdFOYcTr0WG97ojG4oOIsQJyAfJKGueXPkMz057iC63ZziLLWLoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EXvJAId+ydlGYjsRCG0GWq6aYO2N+uB8mbCtilumCt8=;
	b=3sUdVeFRyuOvpbdClfka7UNAkf8LLI405qrDNM1jLrktbUOqDpFTw2tPbPoyATuKs+ZH
	 XR6R2Z0TGCcNmR2C73WfXxKE19dXsFZI3EVbuli0W0u8dSbLih+Hq3Wlg82oFuKEgvtFv
	 PqovIHWh0G9pgpkU4PNlrhd2IyX4OulRy5MWR+A+juVioWDo5w329oPXT6KivX1RFWIZ/
	 ZaWM8w9rVASTkiFjCDL1AxxrKJ3/bgIsoVUQzJSDfLjHC3qawiZ13KrrIPlRy2tOkhyMi
	 nMbJOSBPHkgghe/RSHqmbmV4Ul5j6YBUTtQneSo/z8vAWhxxQ9JPTMRiF8S8RIxIleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JKY39sOy;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CF160A2614
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CF160A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JKY39sOy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EXvJAId+ydlGYjsRCG0GWq6aYO2N+uB8mbCtilumCt8=; b=JKY39sOy8EU1y9v7XwsFpbGf7t
	bfIEMC/+p5NtI5n+owWUst9sGmEfbF9Hgx8KoyPllnFtIbbUv+r2UgwMqF3hrqLIWF93twtVxUrkn
	iTRfWQ6dvMEyylozgxF79PXirszev0lVnLS3Qe/1rKUiV9dOFh1pTJMuOqaNFtQF4MOo=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-1E
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/16] wifi: mt76: keep mac_work running when a ROC request fails
Date: Wed, 18 Nov 2026 17:18:21 +0100
Message-ID: <20261118161827.1208649-10-nbd@nbd.name>
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

Since the cancel of mac_work moved in front of dev->mutex,
mt76_remain_on_channel() cancels mac_work before it checks whether it
can start the request. Only the set_channel op of the driver queues
mac_work again. A request that the function refuses, or whose link
setup fails, thus leaves mac_work stopped until the next channel change
of the radio, for example a request during a channel switch. Until
then, station links on the radio do not detect beacon loss.

Queue mac_work again on these paths if the radio is running. Run it at
once, since only the driver knows its interval, and mac_work queues
itself again with that interval. Leave it stopped when a reset refuses
the request, since the reset queues mac_work again itself.

Fixes: 6939b97ddad3 ("wifi: mt76: fix deadlock in remain-on-channel")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 26 +++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 0de7907b4fb4..23066307c92a 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -29,6 +29,16 @@ mt76_phy_update_channel(struct mt76_phy *phy,
 	return __mt76_set_channel(phy, &phy->main_chandef, false);
 }
 
+static void mt76_phy_mac_work_restart(struct mt76_phy *phy)
+{
+	struct mt76_dev *dev = phy->dev;
+
+	if (test_bit(MT76_STATE_RUNNING, &phy->state) &&
+	    !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
+	    !test_bit(MT76_RESTART, &dev->phy.state))
+		ieee80211_queue_delayed_work(phy->hw, &phy->mac_work, 0);
+}
+
 int mt76_add_chanctx(struct ieee80211_hw *hw,
 		     struct ieee80211_chanctx_conf *conf)
 {
@@ -440,18 +450,22 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mutex);
 
-	if (phy->roc_vif || mt76_vif_roc_phy(dev, vif) ||
-	    mt76_phy_scanning(phy) || mt76_phy_csa_active(phy) ||
-	    test_bit(MT76_MCU_RESET, &dev->phy.state) ||
+	if (test_bit(MT76_MCU_RESET, &dev->phy.state) ||
 	    test_bit(MT76_RESTART, &dev->phy.state)) {
 		ret = -EBUSY;
 		goto out;
 	}
 
+	if (phy->roc_vif || mt76_vif_roc_phy(dev, vif) ||
+	    mt76_phy_scanning(phy) || mt76_phy_csa_active(phy)) {
+		ret = -EBUSY;
+		goto restart_mac_work;
+	}
+
 	mlink = mt76_get_vif_phy_link(phy, vif);
 	if (IS_ERR(mlink)) {
 		ret = PTR_ERR(mlink);
-		goto out;
+		goto restart_mac_work;
 	}
 
 	mlink->mvif->roc_phy = phy;
@@ -473,6 +487,10 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	ieee80211_queue_delayed_work(phy->hw, &phy->roc_work,
 				     msecs_to_jiffies(duration));
 
+	goto out;
+
+restart_mac_work:
+	mt76_phy_mac_work_restart(phy);
 out:
 	mutex_unlock(&dev->mutex);
 	return ret;
-- 
2.47.3

