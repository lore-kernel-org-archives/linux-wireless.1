Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=CeYiVjjP/A/aKsTD8fO2rhNig0e3NXDRT+c99iTV7Nx9f6jRURTynDx5fy7ucqkRGZM+
	 YyuEitRuFOM4TfihPpkvuxqqhQYNQ+7XTfqvAjBw0GbT898ek6eS1ombwcrbmCRFWE10Q
	 SCjD6uyMmeBbZ5f3r/6vINEkMK0Zh6CA9zS0jBOu/VBoxwa5K+gDtYLzW0E3mgQi0EJPQ
	 25R1y4YyyAzfgnWHSQriRB/F/c27kYDFpOG0QhSGSlUliZyl/9VHOZ6LJN9gLutSnQC9Z
	 yWBqN6AgkUDnA4l5FZs0BXRXeLUUeBPfjtRuCSB+ciZxRSOw8guug2FS55OeCmtqk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fj3RMq5IxGtjf0tGADp5Q+j45HfvrI7Hk+c9t27dhl8=;
	b=KlmFTXba7iYeTZq0A+3sKMtd4lO+o/cYX7ro/wVRciTMkT3+bjhGyYbvrGI1BKgeZcns
	 i4VmIyAZGmdtEwz7GoX6jOIvekm7clt90J06F4oNxOO7DSO3c3DSfC8ROAaBcIUs96CmT
	 /G0qAZj7aoFKeyMfL/Lat9Xn78ldT1ghFx3uh7HHpZUoJlF5/vvrll8VxIhBPbUsNnZEQ
	 14ia+ZFRjIrl+SupCZPxpaCBl7qcUKfKWsAe4u60tG+0RH0TfTTDLHQbLofZmzhVbiEDM
	 4u6ObS6zs2rtiICebUQSAr7O6vVIVvoT4SQ1e+i8qxbYuUD8a07SFIslvtp4OaZ9sfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VKoXROkA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C8606A335
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24C8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VKoXROkA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fj3RMq5IxGtjf0tGADp5Q+j45HfvrI7Hk+c9t27dhl8=; b=VKoXROkAaC7RIUmk4W+ceh22ur
	y0WfstxInf4+WxMbfikvT/y41hbJWwRza/X6Zldh22hhw47EqrYKVE4m2nPnNaDdz7IiUNynv+HQ+
	AIIaqBHYscpgBq3cxX1cMc1d0Zc2SDBL3JI9PDKxzvo75ZaX6aRugy9Ag8UlDjkSCj04=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-0c
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/16] wifi: mt76: refuse a scan or ROC on a radio during a channel switch
Date: Wed, 18 Nov 2026 17:18:14 +0100
Message-ID: <20261118161827.1208649-3-nbd@nbd.name>
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

mac80211 starts a scan or a remain-on-channel without a check for a
channel switch in progress. On mt7996, mt7996_set_channel() then
disables the beacons of the radio for the offchannel dwell and uploads
them again on the return. During a CSA the upload carries the CSA
template with its initial count, so each scan or ROC on the radio
restarts the countdown in the firmware.

Refuse a scan or a ROC that needs a radio on which an AP, mesh or IBSS
link has csa_active set. Station links are left out, since they only
follow the channel switch of their AP and send no beacons.

Fixes: f30906c55a40 ("wifi: mt76: mt7996: disable beacons when going offchannel")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 48 ++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h    |  1 +
 drivers/net/wireless/mediatek/mt76/scan.c    |  3 +-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index da111d37c4f5..7847aafdbabd 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -313,6 +313,53 @@ void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	kfree_rcu(mlink, rcu_head);
 }
 
+struct mt76_csa_active_data {
+	struct mt76_phy *phy;
+	bool active;
+};
+
+static void
+mt76_csa_active_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt76_csa_active_data *data = priv;
+	struct ieee80211_bss_conf *link_conf;
+	struct mt76_vif_link *mlink;
+	unsigned int link_id;
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_ADHOC:
+		break;
+	default:
+		return;
+	}
+
+	for_each_vif_active_link(vif, link_conf, link_id) {
+		if (!link_conf->csa_active)
+			continue;
+
+		mlink = mt76_vif_link(data->phy->dev, vif, link_id);
+		if (mlink && mt76_vif_link_phy(mlink) == data->phy)
+			data->active = true;
+	}
+}
+
+bool mt76_phy_csa_active(struct mt76_phy *phy)
+{
+	struct mt76_csa_active_data data = {
+		.phy = phy,
+	};
+
+	lockdep_assert_held(&phy->dev->mutex);
+
+	ieee80211_iterate_active_interfaces_mtx(phy->hw,
+						IEEE80211_IFACE_ITER_NORMAL,
+						mt76_csa_active_iter, &data);
+
+	return data.active;
+}
+
 void mt76_roc_complete(struct mt76_phy *phy)
 {
 	struct mt76_vif_link *mlink = phy->roc_link;
@@ -379,6 +426,7 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_lock(&dev->mutex);
 
 	if (phy->roc_vif || mt76_phy_scanning(phy) ||
+	    mt76_phy_csa_active(phy) ||
 	    test_bit(MT76_MCU_RESET, &dev->phy.state) ||
 	    test_bit(MT76_RESTART, &dev->phy.state)) {
 		ret = -EBUSY;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8ebcd5365290..2a39729142af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1905,6 +1905,7 @@ struct mt76_vif_link *mt76_get_vif_phy_link(struct mt76_phy *phy,
 					    struct ieee80211_vif *vif);
 void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			   struct mt76_vif_link *mlink);
+bool mt76_phy_csa_active(struct mt76_phy *phy);
 void mt76_offchannel_notify(struct mt76_phy *phy, bool offchannel);
 
 /* usb */
diff --git a/drivers/net/wireless/mediatek/mt76/scan.c b/drivers/net/wireless/mediatek/mt76/scan.c
index 3271a2fa100d..51b182ee99e2 100644
--- a/drivers/net/wireless/mediatek/mt76/scan.c
+++ b/drivers/net/wireless/mediatek/mt76/scan.c
@@ -276,7 +276,8 @@ int mt76_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 
 	for_each_set_bit(i, &phy_mask, ARRAY_SIZE(dev->phys)) {
-		if (dev->phys[i]->roc_vif) {
+		if (dev->phys[i]->roc_vif ||
+		    mt76_phy_csa_active(dev->phys[i])) {
 			ret = -EBUSY;
 			goto out;
 		}
-- 
2.47.3

