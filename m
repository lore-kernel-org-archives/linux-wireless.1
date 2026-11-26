Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=TXndYnsazIba63yy9ErIXaLEaeiTh+XtOx14Cc0b5Q3qch26X27kCSs5cxQu7VY1GRt0
	 LYQhdKDXIo+LCV1D+9I4g+4I59/5lrrucpslCtA1/ic9XQrATufhhRaW/X+k/vWofTF2Y
	 HnTBjIJKgpiArfWoEpm6EiSvrw3IYFTTBlnND/l1DBZbJJwze3afGug4ZS8y7S61YARx5
	 N/Hb/TPWyyXqco9GIupmbq3UbW4TDZlcmIcIrN8Vf7zFaiHtE7smDelgFwY8yEY1o7O+I
	 jOxX6jj7Pj2sgq78aalz4OLAtRqHumnZDavyQr/EBd1Y7BoObrtY06wnPeo3OC84smA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PxFUzenTZe741DcbwsPTdFp3gVwDpQ1X2PSbgohdVhs=;
	b=Ybjvzn/GuY/S16wCiRENKtjNdZHu2bsjyNMLyMGLYXl9LRkLbP9lUivVsbHOjO+c6g5q
	 rZqaKJFQO9wYyLzWU/XNW/NIEqmSJMsE4tzx2yQvO1KRcahWU80Eikv+dCZDgaIgpOvoY
	 /K3iV2FrHqIPSprRExXsvPsbe2xzNsQN+fAZbggnbKPE+bjW34gMZp0GWArnKuvotpr1/
	 ElexBLjJBZwNpcXd7k9mD5hHEgo+VepWajChK8WcPzr7Tfw4ewbUdQzBT8ombSuPsAX3p
	 tRvEV5h3R0Q44aqpG/aaZbpZn7kcCLnY+rqeU7N9CKZB4bN30HiluY9TeOtoFpsE5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=EmVMhNVn;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D5606A331
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A72D5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=EmVMhNVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PxFUzenTZe741DcbwsPTdFp3gVwDpQ1X2PSbgohdVhs=; b=EmVMhNVnGLjlL3brGId/hwISXY
	m7gr8hQGcgMsCDT301uoZMTeIYDfwjHD3HIvsDnZBgA2jqPcElH6AOaKfFMFE1eKLaPCsjdxJ3cv/
	k6FLdEuxPlGMOtjBWdG5LB3lcJMf+gFivm0ANAlcBas6ttFr7pyYV2UFSSy/1ouZrLko=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-0k
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/16] wifi: mt76: mt7615: reset the group RX PN counters at WoWLAN resume
Date: Thu, 26 Nov 2026 19:23:18 +0100
Message-ID: <20261126182325.2516607-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

With GTK rekey offload, the firmware can renew the GTK during WoWLAN
suspend without reporting it. If the new key reuses a key id whose
counters hold the PN of an earlier key, its frames read as replays after
resume.

At resume, zero the group counters of an interface that gave rekey data
to the firmware. Where the link held a group key with a PN check, also
check key ids 1 to 3, since the new key can use any of them. Forget the
key ids at the end of an association, so that a reassociation without
such a key arms no check. After resume, a replay with a nonzero PN
passes until the first genuine frame of its key id and TID.

Fixes: b47e21e75c80 ("mt76: mt7615: add gtk rekey offload support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 10 +++++++
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 28 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  1 +
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e2156d7c1108..d635df2cece2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1679,6 +1679,16 @@ mt76_rx_group_wcid(struct mt76_wcid *wcid)
 	return wcid;
 }
 
+static inline void
+mt76_rx_group_pn_reset(struct mt76_rx_group_pn *group_pn)
+{
+	memset(group_pn->pn, 0, sizeof(group_pn->pn));
+
+	/* the firmware can renew the GTK in suspend under another key id */
+	if (group_pn->key_mask)
+		group_pn->key_mask |= GENMASK(3, 1);
+}
+
 void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
 			 struct ieee80211_key_conf *key);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 7af53894edd1..425640b575d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -573,6 +573,7 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_bss_conf *info,
 				    u64 changed)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
 
@@ -607,15 +608,17 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 		mt76_connac_mcu_set_vif_ps(&dev->mt76, vif);
 
 	if ((changed & BSS_CHANGED_ARP_FILTER) &&
-	    mt7615_firmware_offload(dev)) {
-		struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-
+	    mt7615_firmware_offload(dev))
 		mt76_connac_mcu_update_arp_filter(&dev->mt76, &mvif->mt76,
 						  info);
-	}
 
-	if (changed & BSS_CHANGED_ASSOC)
+	if (changed & BSS_CHANGED_ASSOC) {
 		mt7615_mac_set_beacon_filter(phy, vif, vif->cfg.assoc);
+		if (!vif->cfg.assoc) {
+			mvif->gtk_rekey_offload = false;
+			mvif->mt76.rx_group_pn.key_mask = 0;
+		}
+	}
 
 	if (changed & BSS_CHANGED_MU_GROUPS)
 		 mt7615_update_mu_group(hw, vif, info);
@@ -1264,6 +1267,15 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 	return err;
 }
 
+static void
+mt7615_rx_group_pn_reset_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+
+	if (mvif->gtk_rekey_offload)
+		mt76_rx_group_pn_reset(&mvif->mt76.rx_group_pn);
+}
+
 static int mt7615_resume(struct ieee80211_hw *hw)
 {
 	struct mt7615_phy *phy = mt7615_hw_phy(hw);
@@ -1287,6 +1299,10 @@ static int mt7615_resume(struct ieee80211_hw *hw)
 	}
 
 	clear_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
+	ieee80211_iterate_active_interfaces(hw,
+					    IEEE80211_IFACE_ITER_RESUME_ALL,
+					    mt7615_rx_group_pn_reset_iter,
+					    NULL);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt76_connac_mcu_set_suspend_iter,
@@ -1312,10 +1328,12 @@ static void mt7615_set_rekey_data(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif,
 				  struct cfg80211_gtk_rekey_data *data)
 {
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 
 	mt7615_mutex_acquire(dev);
 	mt76_connac_mcu_update_gtk_rekey(hw, vif, data);
+	mvif->gtk_rekey_offload = true;
 	mt7615_mutex_release(dev);
 }
 #endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 391928405f32..121a4fb690ef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -143,6 +143,7 @@ struct mt7615_vif {
 	struct mt76_vif_link mt76; /* must be first */
 	struct mt7615_sta sta;
 	bool sta_added;
+	bool gtk_rekey_offload;
 };
 
 struct mib_stats {
-- 
2.47.3

