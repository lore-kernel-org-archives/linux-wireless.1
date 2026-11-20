Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=yUJj6uhZsQVFQx2yJZc7json6lczBw2j6oAvh/C/roYnHepHEtpryP8ucw6F+mhi4tNZ
	 MtKDsL12OyN/F6y9QO2zoBj4m73iXHNacK2W6vKl02kVVes7q77Sa+jLtyIO7eVM2v9C7
	 4ylgCZkNFJx/IvaKdi2oEbHpUBMvhPefO5XptMTJJrU6+SA2MSv1mR2Qkrap0pDQMVTeE
	 AbXrnwWVqZuvHxElomjDK+86h3tztzF8dAwjTXuQJ8QMf6+UOa/axAByaTRVVOkBIC5cg
	 ZPdjecsFtMaHmaNzk2Fpj8sIzo4vfNsNLytznDuJRpA3ul1nyWl3PNe4WkDwV7EuDKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E8nHGfR+4hvsWIfkCf0MdXtlTPfgVYwX0uYbZ9zPrLE=;
	b=NBR+0Gg+t5umBUU6OoyAcYvoCmRTDkxcHSgUnZ8weZ23FmkBSvqVqPPvyi8WbDyltq5n
	 eHMy6X9DKlDM/PDuxRILFU5heBQJ/JJbZXF2oRsg4T3v7ZAlQEDdIuim4Y6iGFsXvZYhu
	 sDCrP3s5uBHGlNNYRw3gtIqPh3Ttg55QibPZiJMxtdaXf4g9rNCijsl7CDGRt1MMZltjn
	 7WrfiSDdDLtiZ/m0wQY4iYcsqcN1WSjIXSApaVMgI0G6XrAgDQ8OB9G4xkpBvKUrCCSrM
	 VoHM8D023MEtL6KQwVqqkYQA53zYKEbU+aNePTmCr3SYYrirmOId8TtN9YgB4q+iuxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=RFJdaOuU;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969560A263E
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4969560A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=RFJdaOuU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=E8nHGfR+4hvsWIfkCf0MdXtlTPfgVYwX0uYbZ9zPrLE=; b=RFJdaOuUHHhs3BAl1QMRZEXPCL
	ZymtGi4yh9UiXNLL4LowIzwqf2Y5iWd7zOq/fnyWPtilXl3NdlzjOi0ToUH1/0LKtUwMeme7MkO9m
	4HfjOf55GfZxto4Zh1YH6GY64cP5a+ReWZJCqHR9RDmSGTBTDcrRwo00bz/2/6eZ3DpU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfZ-0065GI-2u
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/20] wifi: mt76: mt792x: handle all interfaces of a channel context
Date: Fri, 20 Nov 2026 18:44:53 +0100
Message-ID: <20261120174459.1657382-14-nbd@nbd.name>
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

Since commit f3898da2e86e ("wifi: mt76: mt792x: add struct
mt792x_chanctx"), a channel context records only the link that was
assigned to it last. Removing any link clears the record, but a switch
of the recorded link to another context leaves it in place. A bandwidth
change of a context that a station and an AP share thus reaches the
firmware for at most one of them. After such a switch and the removal of
that link, the next change of the old context is a use after free.

Walk the active interfaces when a channel context changes, as the
driver did before that commit.

Fixes: f3898da2e86e ("wifi: mt76: mt792x: add struct mt792x_chanctx")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 28 +++----
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 83 +++++++++----------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  4 -
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  5 --
 4 files changed, 53 insertions(+), 67 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 6207a875996c..a89b4c7f2239 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1413,25 +1413,25 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
 		      struct ieee80211_chanctx_conf *ctx,
 		      u32 changed)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct ieee80211_vif *vif;
-	struct mt792x_vif *mvif;
-
-	if (!mctx->bss_conf)
-		return;
-
-	mvif = container_of(mctx->bss_conf, struct mt792x_vif, bss_conf);
-	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
 
 	mt792x_mutex_acquire(phy->dev);
-	if (vif->type == NL80211_IFTYPE_MONITOR) {
-		mt7921_mcu_set_sniffer(mvif->phy->dev, vif, true);
-		mt7921_mcu_config_sniffer(mvif, ctx);
-	} else {
-		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+	for_each_active_interface(vif, hw) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+		if (mvif->bss_conf.mt76.ctx != ctx)
+			continue;
+
+		if (vif->type == NL80211_IFTYPE_MONITOR) {
+			mt7921_mcu_set_sniffer(mvif->phy->dev, vif, true);
+			mt7921_mcu_config_sniffer(mvif, ctx);
+		} else {
+			mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76,
+						      &mvif->bss_conf.mt76, ctx);
+		}
+		mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
 	}
-	mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
 	mt792x_mutex_release(phy->dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f8ad3bd16931..bd5375705e98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2287,58 +2287,57 @@ mt7925_remove_chanctx(struct ieee80211_hw *hw,
 }
 
 static void
-mt7925_change_chanctx(struct ieee80211_hw *hw,
-		      struct ieee80211_chanctx_conf *ctx,
-		      u32 changed)
+mt7925_link_change_chanctx(struct ieee80211_vif *vif,
+			   struct mt792x_bss_conf *mconf,
+			   struct ieee80211_chanctx_conf *ctx, u32 changed)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
-	struct mt792x_phy *phy = mt792x_hw_phy(hw);
-	struct mt792x_bss_conf *mconf;
-	struct ieee80211_vif *vif;
-	struct mt792x_vif *mvif;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct ieee80211_bss_conf *link_conf;
 
-	if (!mctx->bss_conf)
+	if (!mconf || mconf->mt76.ctx != ctx)
 		return;
 
-	mconf = mctx->bss_conf;
-	mvif = mconf->vif;
-	vif = container_of((void *)mvif, struct ieee80211_vif, drv_priv);
-
-	mt792x_mutex_acquire(phy->dev);
 	if (vif->type == NL80211_IFTYPE_MONITOR) {
 		mt7925_mcu_set_sniffer(mvif->phy->dev, vif, true);
 		mt7925_mcu_config_sniffer(mvif, ctx);
 	} else {
-		if (ieee80211_vif_is_mld(vif)) {
-			unsigned long valid = mvif->valid_links;
-			u8 i;
+		link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
+		if (mt7925_p2p_chanctx_bss_programmed(vif, link_conf))
+			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76,
+					     link_conf, ctx);
 
-			for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-				mconf = mt792x_vif_to_link(mvif, i);
-				if (mconf && mconf->mt76.ctx == ctx)
-					break;
-			}
-
-		} else {
-			mconf = &mvif->bss_conf;
-		}
-
-		if (mconf) {
-			struct ieee80211_bss_conf *link_conf;
-
-			link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
-
-			if (mt7925_p2p_chanctx_bss_programmed(vif, link_conf))
-				mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76,
-						     link_conf, ctx);
-
-			if (changed & IEEE80211_CHANCTX_CHANGE_PUNCTURING)
-				mt7925_mcu_set_eht_pp(mvif->phy->mt76, &mconf->mt76,
-						      link_conf, ctx);
-		}
+		if (changed & IEEE80211_CHANCTX_CHANGE_PUNCTURING)
+			mt7925_mcu_set_eht_pp(mvif->phy->mt76, &mconf->mt76,
+					      link_conf, ctx);
 	}
 	mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
+}
 
+static void
+mt7925_change_chanctx(struct ieee80211_hw *hw,
+		      struct ieee80211_chanctx_conf *ctx,
+		      u32 changed)
+{
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct ieee80211_vif *vif;
+
+	mt792x_mutex_acquire(phy->dev);
+	for_each_active_interface(vif, hw) {
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+		unsigned long valid = mvif->valid_links;
+		u8 i;
+
+		if (!ieee80211_vif_is_mld(vif)) {
+			mt7925_link_change_chanctx(vif, &mvif->bss_conf, ctx,
+						   changed);
+			continue;
+		}
+
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS)
+			mt7925_link_change_chanctx(vif,
+						   mt792x_vif_to_link(mvif, i),
+						   ctx, changed);
+	}
 	mt792x_mutex_release(phy->dev);
 }
 
@@ -2755,7 +2754,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 				     struct ieee80211_bss_conf *link_conf,
 				     struct ieee80211_chanctx_conf *ctx)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct ieee80211_bss_conf *pri_link_conf;
@@ -2783,7 +2781,6 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	}
 
 	mconf->mt76.ctx = ctx;
-	mctx->bss_conf = mconf;
 	mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -2795,7 +2792,6 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 					struct ieee80211_bss_conf *link_conf,
 					struct ieee80211_chanctx_conf *ctx)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
@@ -2813,7 +2809,6 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		mconf = &mvif->bss_conf;
 	}
 
-	mctx->bss_conf = NULL;
 	mconf->mt76.ctx = NULL;
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8dfe10cbb6d1..e37d901575e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -163,10 +163,6 @@ struct mt792x_sta {
 
 DECLARE_EWMA(rssi, 10, 8);
 
-struct mt792x_chanctx {
-	struct mt792x_bss_conf *bss_conf;
-};
-
 struct mt792x_bss_conf {
 	struct mt76_vif_link mt76; /* must be first */
 	struct mt792x_vif *vif;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 2d39f18f4d43..5743c5437863 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -503,13 +503,11 @@ int mt792x_assign_vif_chanctx(struct ieee80211_hw *hw,
 			      struct ieee80211_bss_conf *link_conf,
 			      struct ieee80211_chanctx_conf *ctx)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
 	mvif->bss_conf.mt76.ctx = ctx;
-	mctx->bss_conf = &mvif->bss_conf;
 	mt76_phy_chandef_set(&dev->mphy, &ctx->def);
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -522,12 +520,10 @@ void mt792x_unassign_vif_chanctx(struct ieee80211_hw *hw,
 				 struct ieee80211_bss_conf *link_conf,
 				 struct ieee80211_chanctx_conf *ctx)
 {
-	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
-	mctx->bss_conf = NULL;
 	mvif->bss_conf.mt76.ctx = NULL;
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -810,7 +806,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	hw->sta_data_size = sizeof(struct mt792x_sta);
 	hw->vif_data_size = sizeof(struct mt792x_vif);
-	hw->chanctx_data_size = sizeof(struct mt792x_chanctx);
 
 	if (dev->fw_features & MT792x_FW_CAP_CNM)
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-- 
2.47.3

