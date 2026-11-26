Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717412;
	b=CQlxpR3eSoc2R+y2yPl+2zB/h/rWICT3gdRdhBefnV01vI1JLWP1Fpyp+eV2BODpQ43o
	 ZUwBeJlBotrYeBg+YiPEycywdamymM+BQCpxN40jMB/6ZsaHpXCD8YXQzZ1ebP7MAX85W
	 uOMzdGGdWHuF9cH78X0HKR/Ets9Ke7sEjqdfUWaIMmV/+oqixM/r+vI/Jg/GBjGPNGZcI
	 nRbAwByVtZX9EYPC9Era7QltdeQuj9LqSfEyHjXXfkNm/IO3IwNamkY+Cg9W4BTXUNnS6
	 7miVyA9BTn07dMQer99uZfbtpyTGogi53aq/GpuNs5IF8eF4AKIVCh7ibQffh7CZLrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717412;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ESBRnyuo4KAj85o1OUW0Jp3Rd5EkpXxUzunYWwU7PHw=;
	b=k9EAPthZ6HrsvQfPIEC7BbKiEB1R1lnjOBE3i5WwyzazWh8pnXtQLtinct0IYwc9OYJA
	 uAYLRXHl2gOBTG9dme4H9J6VmGN8mZ7xhqkORKn7mHuU09Ijw7gP2X/XNFRv6MuRlwIzH
	 HYEGjrbfBuj/XfYuc6D5NALG3Thh2G9pfkoLCIKW5YgBiB8+GnvxQqLYMuy4gxL1G2Rv2
	 LeTx2ZGJ+YddeAPoq3KJlE2TP+IOa+xi0Z1GIsFfPQEC4ka56x57PeLF6SC5LaaLdBi67
	 vermChwZLkzdiacZJ7QibDLHwn1BwoGsR/k40rJhEcsIXsDj7Z2EdX0t1GaMKMNnJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=t1oqlIgz;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30656606A682
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30656606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=t1oqlIgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ESBRnyuo4KAj85o1OUW0Jp3Rd5EkpXxUzunYWwU7PHw=; b=t1oqlIgz10v+59ESgDeRTWdIal
	5oYv9An7nmDUR9ZYTIQwCg/ZP6/5XuHMdkHviI4HzPGPGIIx4ujsQDd0aN0GjXGLHB1X6A1HXieFW
	R/dUU13BlVmoHUk37kXY/2sh+qadfEezXaqiJaOg5Bfeqbsc5QGiHybWcVy53aoCYzNE=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe81-008icn-2R
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/16] wifi: mt76: mt792x: reset the group RX PN counters at WoWLAN resume
Date: Thu, 26 Nov 2026 19:23:21 +0100
Message-ID: <20261126182325.2516607-12-nbd@nbd.name>
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

At resume, zero the group counters of each link of an interface that
gave rekey data to the firmware. Where a link held a group key with a PN
check, also check key ids 1 to 3, since the new key can use any of them.
Forget the key ids at the end of an association, so that a reassociation
without such a key arms no check. After resume, a replay with a nonzero
PN passes until the first genuine frame of its key id and TID.

Pass no key at a key removal in mt7921_set_key(), as
mt7925_set_link_key() does, since the keys of an association go after
its end and would mark their key ids again.

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 10 +++++-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  8 +++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  4 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 36 +++++++++++++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index eaf8e5098b0c..23f92ce01080 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -562,7 +562,7 @@ static int mt7921_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			goto out;
 	}
 
-	mt76_wcid_key_setup(&dev->mt76, wcid, key);
+	mt76_wcid_key_setup(&dev->mt76, wcid, cmd == SET_KEY ? key : NULL);
 	err = mt76_connac_mcu_add_key(&dev->mt76, vif, &msta->deflink.bip,
 				      key, MCU_UNI_CMD(STA_REC_UPDATE),
 				      &msta->deflink.wcid, cmd);
@@ -731,6 +731,8 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		mt7921_mcu_sta_update(dev, NULL, vif, true,
 				      MT76_STA_INFO_STATE_ASSOC);
 		mt7921_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
+		if (!vif->cfg.assoc)
+			mt792x_rx_group_pn_forget(vif);
 	}
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
@@ -1182,6 +1184,10 @@ static int mt7921_resume(struct ieee80211_hw *hw)
 	mt792x_mutex_acquire(dev);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt792x_rx_group_pn_reset_iter,
+						NULL);
 	ieee80211_iterate_active_interfaces_mtx(hw,
 						IEEE80211_IFACE_ITER_RESUME_ALL,
 						mt76_connac_mcu_set_suspend_iter,
@@ -1199,10 +1205,12 @@ static void mt7921_set_rekey_data(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif,
 				  struct cfg80211_gtk_rekey_data *data)
 {
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mt792x_mutex_acquire(dev);
 	mt76_connac_mcu_update_gtk_rekey(hw, vif, data);
+	mvif->gtk_rekey_offload = true;
 	mt792x_mutex_release(dev);
 }
 #endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3e614af35141..6b3f2dafae4d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2027,6 +2027,10 @@ static int mt7925_resume(struct ieee80211_hw *hw)
 	mt792x_mutex_acquire(dev);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt792x_rx_group_pn_reset_iter,
+						NULL);
 	ieee80211_iterate_active_interfaces_mtx(hw,
 						IEEE80211_IFACE_ITER_RESUME_ALL,
 						mt7925_mcu_set_suspend_iter,
@@ -2044,10 +2048,12 @@ static void mt7925_set_rekey_data(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif,
 				  struct cfg80211_gtk_rekey_data *data)
 {
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mt792x_mutex_acquire(dev);
 	mt76_connac_mcu_update_gtk_rekey(hw, vif, data);
+	mvif->gtk_rekey_offload = true;
 	mt792x_mutex_release(dev);
 }
 #endif /* CONFIG_PM */
@@ -2468,6 +2474,8 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 				      &mvif->sta.deflink, true,
 				      MT76_STA_INFO_STATE_ASSOC, NULL);
 		mt7925_mcu_set_beacon_filter(dev, vif, vif->cfg.assoc);
+		if (!vif->cfg.assoc)
+			mt792x_rx_group_pn_forget(vif);
 
 		if (ieee80211_vif_is_mld(vif))
 			mvif->mlo_pm_state = MT792x_MLO_LINK_ASSOC;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 260abdc978f8..fa64dd2ae28a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -250,6 +250,7 @@ struct mt792x_vif {
 
 	struct mt792x_phy *phy;
 	bool roc_join_held; /* join ROC kept until the STA is authorized */
+	bool gtk_rekey_offload;
 	u16 valid_links;
 	u8 deflink_id;
 	enum mt792x_mlo_pm_state mlo_pm_state;
@@ -622,6 +623,9 @@ void mt792x_unassign_vif_chanctx(struct ieee80211_hw *hw,
 				 struct ieee80211_bss_conf *link_conf,
 				 struct ieee80211_chanctx_conf *ctx);
 void mt792x_set_wakeup(struct ieee80211_hw *hw, bool enabled);
+void mt792x_rx_group_pn_reset_iter(void *priv, u8 *mac,
+				   struct ieee80211_vif *vif);
+void mt792x_rx_group_pn_forget(struct ieee80211_vif *vif);
 void mt792x_get_et_strings(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   u32 sset, u8 *data);
 int mt792x_get_et_sset_count(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 7dddce02d600..99bcd90f8e1a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -559,6 +559,42 @@ void mt792x_set_wakeup(struct ieee80211_hw *hw, bool enabled)
 }
 EXPORT_SYMBOL_GPL(mt792x_set_wakeup);
 
+void mt792x_rx_group_pn_reset_iter(void *priv, u8 *mac,
+				   struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+			      mvif->valid_links : BIT(0);
+	unsigned int link_id;
+
+	if (!mvif->gtk_rekey_offload)
+		return;
+
+	for_each_set_bit(link_id, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, link_id);
+
+		mt76_rx_group_pn_reset(&mconf->mt76.rx_group_pn);
+	}
+}
+EXPORT_SYMBOL_GPL(mt792x_rx_group_pn_reset_iter);
+
+void mt792x_rx_group_pn_forget(struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+			      mvif->valid_links : BIT(0);
+	unsigned int link_id;
+
+	mvif->gtk_rekey_offload = false;
+	mvif->bss_conf.mt76.rx_group_pn.key_mask = 0;
+	for_each_set_bit(link_id, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif, link_id);
+
+		mconf->mt76.rx_group_pn.key_mask = 0;
+	}
+}
+EXPORT_SYMBOL_GPL(mt792x_rx_group_pn_forget);
+
 static const char mt792x_gstrings_stats[][ETH_GSTRING_LEN] = {
 	/* tx counters */
 	"tx_ampdu_cnt",
-- 
2.47.3

