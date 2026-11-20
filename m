Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196710;
	b=Q35YyqVak+CPgCnyKmfQNOYJoEJpOVvYo0zFxm4LUuhngPjf6CTQs/v1FCvZjuAQF+hn
	 EhFfmMFSuCfRMvsRx0VukMEiGT+c652tyFb6KRK2vq8BK2E8ODw2yOw1gYbMgfy99AgKU
	 WerDoo7yL9S3K+wZDKzrllixLaaSBIe2xgdCo/bw5Rhg8SlEymJPWRLEfYwCtLEzArbqT
	 gI2Kef3tdxSDc3HMowkF4pgWQdInyiQZQzkc6zZcYKBJn8wJHUoErs5PDquhNYzyUCvjx
	 5qqdBnac9t70435it5MIA2TK78cS2UtyCjFpvqjajc3wm3Sg4f8f0sqKPv5Yd2aUTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196710;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZixWZffnAmE5yq28srMD+bUKk3yuKREmBLRaHJ566Yk=;
	b=zlv/GBAp97oEhZNhcc+FaV+k/eDtNiVNQl5W9XXFhUb2wNk8D8HeZ2BnOynMe/bmAIiW
	 ksuAe0M/rJ1/APWqZJLQB/cMxPCCW62sLwhTL6tB9TNEQxkOG7KZq2RsX25ZC0d7DR8U1
	 nvkzAD2px+n0F7FuLRH5bXLWJdZWNW696xBKHw6fiQdlQm8HOWpDHdi3LvetcZfjoHauB
	 qMXksHGBOe0MYcvujxlPLSVy1P3lhPoTPc6HVMDTg/HU0Ifuf3/Rb6ZBtGPBDCeMg+Oy/
	 1gkEHThbsiOsLHNp+Dt29MCzdLkMpL/+UdnNmDpIxT0GAMigqoYn81UUTKI8U3835eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=T6LGmg8e;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BCF60A262A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BCF60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=T6LGmg8e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZixWZffnAmE5yq28srMD+bUKk3yuKREmBLRaHJ566Yk=; b=T6LGmg8evtxfRiw/qiyWbTP7MX
	kvrjpZAmZrbedY6Y1A8TMkjTwOIbCD6gF7NPcm0iqNk6FrrFu73Cbs8kSlFIqHEYcuzRYfI86C++y
	oDjiop992OQRKLJhONE33zzZfAGDT7++T2NwZYZCLJglTigOLnHolQ6IKKdbyipu6kkU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-0E
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/20] wifi: mt76: mt792x: set up the sniffer when a monitor gets its channel
Date: Fri, 20 Nov 2026 18:44:54 +0100
Message-ID: <20261120174459.1657382-15-nbd@nbd.name>
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

mt7921 and mt7925 tune the sniffer of a monitor only in change_chanctx.
For the new channel context of a monitor, mac80211 calls change_chanctx
only on a device with more than one RX chain. On a device with one RX
chain, the sniffer thus stays off the channel of the monitor.

Set up the sniffer when the channel context is assigned.

Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 25 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  8 ++++--
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index a89b4c7f2239..9b13e9c25cf3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1469,12 +1469,33 @@ static void mt7921_mgd_complete_tx(struct ieee80211_hw *hw,
 	mt7921_abort_roc(mvif->phy, mvif);
 }
 
+static int mt7921_assign_vif_chanctx(struct ieee80211_hw *hw,
+				     struct ieee80211_vif *vif,
+				     struct ieee80211_bss_conf *link_conf,
+				     struct ieee80211_chanctx_conf *ctx)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	int ret;
+
+	ret = mt792x_assign_vif_chanctx(hw, vif, link_conf, ctx);
+	if (ret || vif->type != NL80211_IFTYPE_MONITOR)
+		return ret;
+
+	mt792x_mutex_acquire(dev);
+	mt7921_mcu_set_sniffer(dev, vif, true);
+	mt7921_mcu_config_sniffer(mvif, ctx);
+	mt792x_mutex_release(dev);
+
+	return 0;
+}
+
 static int mt7921_switch_vif_chanctx(struct ieee80211_hw *hw,
 				     struct ieee80211_vif_chanctx_switch *vifs,
 				     int n_vifs,
 				     enum ieee80211_chanctx_switch_mode mode)
 {
-	return mt792x_assign_vif_chanctx(hw, vifs->vif, vifs->link_conf,
+	return mt7921_assign_vif_chanctx(hw, vifs->vif, vifs->link_conf,
 					 vifs->new_ctx);
 }
 
@@ -1620,7 +1641,7 @@ const struct ieee80211_ops mt7921_ops = {
 	.add_chanctx = mt7921_add_chanctx,
 	.remove_chanctx = mt7921_remove_chanctx,
 	.change_chanctx = mt7921_change_chanctx,
-	.assign_vif_chanctx = mt792x_assign_vif_chanctx,
+	.assign_vif_chanctx = mt7921_assign_vif_chanctx,
 	.unassign_vif_chanctx = mt792x_unassign_vif_chanctx,
 	.mgd_prepare_tx = mt7921_mgd_prepare_tx,
 	.mgd_complete_tx = mt7921_mgd_complete_tx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index bd5375705e98..8c9c77bd97b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2760,7 +2760,7 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct mt792x_bss_conf *mconf;
 	u8 band_idx;
 
-	mutex_lock(&dev->mt76.mutex);
+	mt792x_mutex_acquire(dev);
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
@@ -2782,7 +2782,11 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	mconf->mt76.ctx = ctx;
 	mt76_phy_chandef_set(mvif->phy->mt76, &ctx->def);
-	mutex_unlock(&dev->mt76.mutex);
+	if (vif->type == NL80211_IFTYPE_MONITOR) {
+		mt7925_mcu_set_sniffer(dev, vif, true);
+		mt7925_mcu_config_sniffer(mvif, ctx);
+	}
+	mt792x_mutex_release(dev);
 
 	return 0;
 }
-- 
2.47.3

