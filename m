Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=BPU6/KtygaM/N1HFLmECgJIG+m+8oQzCT7F5HQkIum91Ic0kzLkvnrDSmdOMH5rgSSTs
	 suJL2/Cc7j5z1A6/4yo5LzgRpfmrl3UrtnQg8WGeyNGmTI2EJngf/G+w7Z0OsdLYFJx/N
	 H6/86quzq6X/KtpOKvWYLEWN/BZy7CHPizb4DJFv5yoztCgG1JH9GUJvk3VSFVff0hlZK
	 YRL+hf4U51nPdCgK5rU+UXDFEFRWnpAt3pfg/4UlhnOrlJi8GBdk/leMykV4g6yOTawr0
	 iZTdYTTwvL6wxq06y/ZrMOxlx9+Gys+hyXqOsZjS+ASpIEOxg8s4s1WL+jlR7SGG1AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0fCn3i8ISCP/qYWLpNAX71sHbkVViVHM3figbVBIWz4=;
	b=5Fci0FB0zmrtR8A+GNRDy6NBj1SZmLmf59YwKZO2sqQa9anAQnx/gcZvjHWeSITxYa3f
	 VmXwq8HCmac35tQxZ1PAnoEUY6NSSU6/iqE+eNfMwkS5OOscjby47H1rWbgZx0bhI/lCw
	 v/NPMvDb0TZrpFY4hWtpakQS25RnKmNdQCBQjnNn4uaBMPTWPbEdTgQz195jWuUVe6QHF
	 t98aRrGAZAqk/ZMvr1Mc1+jxKiTAJ0uO5dimnLwxrOBsJxA8RzcyjrxWouLlH+TvoI5nc
	 17llGbCdmkPBwUzSCcvm927G4/Cg+6QGbh8u0ZPNVu370UxfarBhiXgHmFpFGagjQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bJ9qTdB9;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156DD606A33B
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 156DD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bJ9qTdB9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0fCn3i8ISCP/qYWLpNAX71sHbkVViVHM3figbVBIWz4=; b=bJ9qTdB9ehcA1eIT2hYH3KFoiK
	kpEmJnCcd+vjrEn2DvImEzMgVGKdF8AJ+9m+nzudIT9KNAJWyQznl5dtnl0UPaE6uMVUNnx3ATBWY
	DSB2mvnLHMbD5SvckIu4/s6uz6zSRt7J9Buv7ixiIVAPMVB77XXZEyfUJbEhgAK1TqnA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-24
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/17] wifi: mt76: mt7925: take the link conf of a removed link from old[]
Date: Sat, 21 Nov 2026 13:09:17 +0100
Message-ID: <20261121120926.3603979-8-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121120926.3603979-1-nbd@nbd.name>
References: <20261121120926.3603979-1-nbd@nbd.name>
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

mt7925_change_vif_links() deactivates a removed link through
mt792x_mac_link_bss_remove(), which looks up the link conf in
vif->link_conf[]. ieee80211_vif_update_links() clears that entry before
it calls the driver. If an AP MLD removes a non-default link while
another link stays, the lookup returns NULL, and
mt76_connac_mcu_uni_add_dev() dereferences it. When a non-AP MLD
disassociates, mac80211 removes all links, so the DEV_INFO deactivation
of a non-default link carries the MLD address of vif->bss_conf.

Take the link conf of a removed link from old[], as the
.change_vif_links text in include/net/mac80211.h describes: "The @old
array contains pointers to the old bss_conf structures that were
already removed, in case they're needed." The DEV_INFO deactivation
then carries the link address of its activation. Whether the firmware
reads that address at a deactivation is not known.

The NULL dereference is currently not reachable, because
mt7925_change_vif_links() fails the second ADD_LINK of an AP MLD. Found
by inspection.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 15 ++++++-----
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  4 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 25 +++++++++++++------
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ec4f3db23c07..27a622beb147 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2550,14 +2550,15 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 
 static void
 mt7925_vif_link_remove(struct mt792x_dev *dev, struct mt792x_vif *mvif,
-		       unsigned int link_id, struct mt792x_bss_conf *mconf,
+		       unsigned int link_id, struct ieee80211_bss_conf *link_conf,
+		       struct mt792x_bss_conf *mconf,
 		       struct mt792x_link_sta *mlink, bool bss_remove)
 {
 	rcu_assign_pointer(mvif->link_conf[link_id], NULL);
 	rcu_assign_pointer(mvif->sta.link[link_id], NULL);
 
 	if (bss_remove)
-		mt792x_mac_link_bss_remove(dev, mconf, mlink);
+		__mt792x_mac_link_bss_remove(dev, link_conf, mconf, mlink);
 
 	if (mconf != &mvif->bss_conf) {
 		mt7925_p2p_bmc_remove(dev, mconf);
@@ -2596,8 +2597,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		if (!mconf || !mlink)
 			continue;
 
-		mt7925_vif_link_remove(dev, mvif, link_id, mconf, mlink,
-				       mconf != &mvif->bss_conf);
+		mt7925_vif_link_remove(dev, mvif, link_id, old[link_id], mconf,
+				       mlink, mconf != &mvif->bss_conf);
 	}
 
 	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
@@ -2671,8 +2672,10 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 free:
 	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS)
-		mt7925_vif_link_remove(dev, mvif, link_id, mconfs[link_id],
-				       mlinks[link_id], added & BIT(link_id));
+		mt7925_vif_link_remove(dev, mvif, link_id,
+				       mt792x_vif_to_bss_conf(vif, link_id),
+				       mconfs[link_id], mlinks[link_id],
+				       added & BIT(link_id));
 	goto out;
 
 free_unpublished:
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 07c5e67db8cd..260abdc978f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -661,6 +661,10 @@ mt792x_get_mac80211_ops(struct device *dev,
 int mt792x_init_wcid(struct mt792x_dev *dev);
 int mt792x_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792x_mcu_fw_pmctrl(struct mt792x_dev *dev);
+void __mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
+				  struct ieee80211_bss_conf *link_conf,
+				  struct mt792x_bss_conf *mconf,
+				  struct mt792x_link_sta *mlink);
 void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_bss_conf *mconf,
 				struct mt792x_link_sta *mlink);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 5babfc00dee1..6a9c0e92cd1a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -281,17 +281,13 @@ void mt792x_stop(struct ieee80211_hw *hw, bool suspend)
 }
 EXPORT_SYMBOL_GPL(mt792x_stop);
 
-void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
-				struct mt792x_bss_conf *mconf,
-				struct mt792x_link_sta *mlink)
+void __mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
+				  struct ieee80211_bss_conf *link_conf,
+				  struct mt792x_bss_conf *mconf,
+				  struct mt792x_link_sta *mlink)
 {
-	struct ieee80211_vif *vif = container_of((void *)mconf->vif,
-						 struct ieee80211_vif, drv_priv);
-	struct ieee80211_bss_conf *link_conf;
 	int idx = mlink->wcid.idx;
 
-	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
-
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &mlink->wcid);
 	mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 				    &mlink->wcid, false);
@@ -308,6 +304,19 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 
 	mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
 }
+EXPORT_SYMBOL_GPL(__mt792x_mac_link_bss_remove);
+
+void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
+				struct mt792x_bss_conf *mconf,
+				struct mt792x_link_sta *mlink)
+{
+	struct ieee80211_vif *vif = container_of((void *)mconf->vif,
+						 struct ieee80211_vif, drv_priv);
+
+	__mt792x_mac_link_bss_remove(dev,
+				     mt792x_vif_to_bss_conf(vif, mconf->link_id),
+				     mconf, mlink);
+}
 EXPORT_SYMBOL_GPL(mt792x_mac_link_bss_remove);
 
 void mt792x_remove_interface(struct ieee80211_hw *hw,
-- 
2.47.3

