Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262972;
	b=VTvBHTDmZpW5H4nCZsVSafL5CB5WXDSUs/laG2OC7mnb5+nfl9z4AizkuurF5G48kRbH
	 gcRc/yWMef6PC9RPwJ5cU4LPg5CCjBaFABhSigh8+DVEL1CeNKo22wJ3Vj6LRVfj258aF
	 dPSan0IEyWpmmqNWm2fW6iwkS2GGT7XDSrI3HLk5pHc2Dz8c8eZajNbkjkxTfru9wdYiY
	 lYs5C/Wk51LCE7S/VsEQYgTfDcmtMMrbKBf/zf+BbIlNIO2ImojmOybbdreQn5DmV1QdH
	 xzizF+gXnp9AOfndjeEAFGhsZ6OF4wYxhV7rvZ7CqwxRLs/d2FnYOywIBcW7214eWig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262972;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h3XNdovKqYRZxPEqKcIRPeIICdZp2hno7M+l/lqbgxk=;
	b=wqnnIoTxJKQdbEGTYMNvutur6wvhhnfHnutpzz2kiN5KZHkcTvfNePsst9c6O3MpcQgL
	 yMOhn4k7795CV62IXt9dttjoQOjwVQglIw7BXcyWwLNWzAe6nkC7QN6hZD5Jr8QktmkMd
	 MI8GwlVOXeyxghBWg3VpsEquBH0hcY4qJNk6p6au8WzZZR5bHo1ZBQ/2B2NpvUPq9JzxT
	 sG/5mOB3NOw/FPUohjryHqP5qTgBELXfQWY7SFwwRmENtKx4qhH5p1RgCHxWj4FxR3VMA
	 +Q8R95AcjmOs6HOJu9AD7eZ5FrxSiA3E8dM1xWepv4nVt3KCmHmpTxM4KNWLiGy+iJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=AUlwmBj1;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6E606A6A9
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B6E606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=AUlwmBj1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=h3XNdovKqYRZxPEqKcIRPeIICdZp2hno7M+l/lqbgxk=; b=AUlwmBj1psBvRMlw7FskH2endh
	VWSFOYjya6dC1tZf+UIlyLkG8b+WNyY8i9oQ5AD32HbfGkd6w8XWW98cTA3sYRh2QZlkGb1yoKFr6
	mNO/j9L8G5QmZzxr0A4ryj+f1aY9f9LeW1f7RzyjTeByQCPyxk8yKja7lAcLqm2a9MZQ=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-2U
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/17] wifi: mt76: mt7996: clear the airtime counts with the WTBL counters
Date: Sat, 21 Nov 2026 13:09:24 +0100
Message-ID: <20261121120926.3603979-15-nbd@nbd.name>
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

mt7996_mac_sta_poll() reports the airtime of a link as the difference
between the ADM counters of its WTBL entry and msta_link->airtime_ac[].
The driver clears the counters when it sets up or removes a link, but
keeps airtime_ac[]. A link that the driver uses again thus starts with
stale values: msta->deflink after a full reset, when the restart adds
each station again on its old drv_priv, and a link that
mt7996_mac_sta_change_links() removes and later adds back. The first
poll then gives a u32 difference that wraps, and
ieee80211_sta_register_airtime() adds up to about 2^32 microseconds to
the airtime of the station.

Clear airtime_ac[] whenever the driver clears the counters of a link.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Fixes: f520eceacd24 ("wifi: mt76: mt7996: Add mt7996_mac_sta_change_links callback")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 16 ++++++++++------
 drivers/net/wireless/mediatek/mt76/mt7996/main.c |  8 +++-----
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h   |  2 ++
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index cf8d57b7b5bb..229f797f4302 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -64,6 +64,14 @@ bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask)
 			 0, 5000);
 }
 
+void mt7996_sta_link_airtime_clear(struct mt7996_dev *dev,
+				   struct mt7996_sta_link *msta_link)
+{
+	mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
+			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta_link->airtime_ac, 0, sizeof(msta_link->airtime_ac));
+}
+
 u32 mt7996_mac_wtbl_lmac_addr(struct mt7996_dev *dev, u16 wcid, u8 dw)
 {
 	mt76_wr(dev, MT_WTBLON_TOP_WDUCR,
@@ -135,12 +143,8 @@ static void mt7996_mac_sta_poll(struct mt7996_dev *dev)
 			addr += 8;
 		}
 
-		if (clear) {
-			mt7996_mac_wtbl_update(dev, idx,
-					       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-			memset(msta_link->airtime_ac, 0,
-			       sizeof(msta_link->airtime_ac));
-		}
+		if (clear)
+			mt7996_sta_link_airtime_clear(dev, msta_link);
 
 		if (!wcid->sta)
 			continue;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 253603d25662..e883a58844e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -450,8 +450,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
 
-	mt7996_mac_wtbl_update(dev, idx,
-			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mt7996_sta_link_airtime_clear(dev, msta_link);
 
 	if (vif->type != NL80211_IFTYPE_AP &&
 	    (!mlink->omac_idx || mlink->omac_idx > 3))
@@ -1364,7 +1363,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 
 	rcu_assign_pointer(msta->link[link_id], msta_link);
 
-	mt7996_mac_wtbl_update(dev, idx, MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	mt7996_sta_link_airtime_clear(dev, msta_link);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], &msta_link->wcid);
 	mt76_wcid_init(&msta_link->wcid, phy->mt76->band_idx);
@@ -1398,8 +1397,7 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 	mt76_wcid_cleanup(&dev->mt76, &msta_link->wcid);
 
 	if (msta_link->wcid.link_valid) {
-		mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
-				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+		mt7996_sta_link_airtime_clear(dev, msta_link);
 
 		mt7996_sta_deflink_release(dev, sta, link_id);
 		msta_link->wcid.link_valid = false;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 1e01e6075193..a9d265c90234 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -917,6 +917,8 @@ static inline bool mt7996_has_ext_eeprom(struct mt7996_dev *dev)
 void mt7996_mac_init(struct mt7996_dev *dev);
 u32 mt7996_mac_wtbl_lmac_addr(struct mt7996_dev *dev, u16 wcid, u8 dw);
 bool mt7996_mac_wtbl_update(struct mt7996_dev *dev, int idx, u32 mask);
+void mt7996_sta_link_airtime_clear(struct mt7996_dev *dev,
+				   struct mt7996_sta_link *msta_link);
 void mt7996_mac_reset_counters(struct mt7996_phy *phy);
 void mt7996_mac_cca_stats_reset(struct mt7996_phy *phy);
 void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band);
-- 
2.47.3

