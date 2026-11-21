Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=pB4e3o7m2gavRjfFEDbV4CcbP3IwaFbdzYMNiPcWoLWVlNiCr+2M1c+ynuhZfkfz/UCe
	 cpI21gslph0VkSor44TnD5RtFVWwkMVsC5fwuYHNHGYihezdGbE7hY/I+ed0f76ECozoK
	 vL8UyJvplH6Gy+FwCrdVfsR29n/LgOamuIh3sgOiexxE8ITUQfblLiDqL/i9s5oIQ1TRA
	 ftZjyaubIguRONj0NBw2eYQO9c86lIa64o3hkgQVj98Z0k6IXIDLKYV7SOMo4DOd4YVvS
	 +HSRlnBInxEJWNYZjfuar7pJybrBolKTxivhNjE7FUyA/OCjtp2qaCTa4M+BOhs4iSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4G6R/ul7xTBRJk8bilDD/PpsaRNGVDQzW0SXeG/keXk=;
	b=CgWeFKLREwto0r2rdnygNAdwyYCUG7avLUveehls//yBojztAbwPHMHOxjYl4CgaGf5j
	 /8tWFN3+vPHM2oCJcufyrih/klKGCqH700xfHKYfeb258g19cD9gW4gxNDnxdjuSBhX8+
	 d5j9IGrfEGz8fUYDNfNoHHiZivP/Lc3CSWxrhxEHoR17+ygPxjBXzes3nzCGQpBLd4qs+
	 7dfR95pBJhS6RoM85K+yFCApOpYfVEWjNi5l04l9Ob7il6eaW2icozpEITMg80/PAtODE
	 /UNdmXpHtEwf/Zj1Gq7LSJ0fPhL/5thJRGcyz0MtzkgQhP3DWGPSCU6gkGYOeA10G0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=i623hfZ7;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7675F606A68A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7675F606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=i623hfZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4G6R/ul7xTBRJk8bilDD/PpsaRNGVDQzW0SXeG/keXk=; b=i623hfZ7VveawhH4gnwU4yWq7x
	jUcXbRbYJRQ81ghZiPFSIJu8dAkzSScrjzof9t8iFaaMLFP1hIJz3HaTpbkuAOl56cAiHzCHL2Evq
	6BMNSIWDp9nytOowFC4RPSSw3DmQobZjHAdTRvOXx1uS7o1mHtrW0ORLDLOoHwvXtA+Q=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-0P
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/17] wifi: mt76: mt7996: restore the operating channel after an L1 SER
Date: Sat, 21 Nov 2026 13:09:20 +0100
Message-ID: <20261121120926.3603979-11-nbd@nbd.name>
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

Since commit b36d55610215 ("wifi: mt76: abort scan/roc on hw restart"),
the L1 SER aborts a running ROC or scan with MT76_MCU_RESET set. Neither
the completion nor the rest of the recovery then sets a channel, so the
firmware stays on the off-channel in its scan state. In that state the
firmware keeps the station queues of the band stopped until the next
channel switch. A ROC or scan that ends between the SER interrupt and
the reset work has the same effect. A scan of a DFS operating channel
also leaves radar detection off, since only the channel set that the
aborted completion skips would start it again.

After the recovery, switch each band that the firmware still holds in
the scan state back to its operating channel. Also switch back a band
whose DFS state the aborted scan left stale. Count a scan switch as
soon as it is sent, since the firmware can act on a switch whose answer
the reset loses.

Fixes: b36d55610215 ("wifi: mt76: abort scan/roc on hw restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |  1 +
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 46 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 17 ++++++-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 4 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index db604ffde216..77116d9f4125 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1179,6 +1179,7 @@ int __mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *chandef,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__mt76_set_channel);
 
 int mt76_set_channel(struct mt76_phy *phy, struct cfg80211_chan_def *chandef,
 		     bool offchannel)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 7873b87c74d7..62f3ac2b2cd2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2263,19 +2263,50 @@ void mt7996_mac_update_beacons(struct mt7996_phy *phy)
 }
 
 static void
-mt7996_update_beacons(struct mt7996_dev *dev)
+mt7996_update_band_beacons(struct mt7996_phy *phy, unsigned long skip)
+{
+	if (!test_bit(phy->mt76->band_idx, &skip))
+		mt7996_mac_update_beacons(phy);
+}
+
+static void
+mt7996_update_beacons(struct mt7996_dev *dev, unsigned long skip)
 {
 	struct mt76_phy *phy2, *phy3;
 
-	mt7996_mac_update_beacons(&dev->phy);
+	mt7996_update_band_beacons(&dev->phy, skip);
 
 	phy2 = dev->mt76.phys[MT_BAND1];
 	if (phy2)
-		mt7996_mac_update_beacons(phy2->priv);
+		mt7996_update_band_beacons(phy2->priv, skip);
 
 	phy3 = dev->mt76.phys[MT_BAND2];
 	if (phy3)
-		mt7996_mac_update_beacons(phy3->priv);
+		mt7996_update_band_beacons(phy3->priv, skip);
+}
+
+static bool
+mt7996_mac_reset_channel_restore(struct mt7996_phy *phy)
+{
+	bool bcn_stopped = phy->offchan_bcn_stopped;
+	bool offchannel = phy->fw_offchannel;
+	struct mt76_phy *mphy = phy->mt76;
+
+	if (!mphy->chanctx)
+		return false;
+
+	if (!offchannel &&
+	    (mt7996_get_rdd_idx(phy, false) < 0 ||
+	     mphy->dfs_state == mt76_phy_dfs_state(mphy)))
+		return false;
+
+	if (__mt76_set_channel(mphy, &mphy->main_chandef, false))
+		return false;
+
+	if (offchannel)
+		mt76_offchannel_notify(mphy, false);
+
+	return bcn_stopped;
 }
 
 void mt7996_tx_token_put(struct mt7996_dev *dev)
@@ -2579,6 +2610,7 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 
 void mt7996_mac_reset_work(struct work_struct *work)
 {
+	unsigned long bcn_restored = 0;
 	struct ieee80211_hw *hw;
 	struct mt7996_dev *dev;
 	struct mt7996_phy *phy;
@@ -2724,8 +2756,12 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	napi_schedule(&dev->mt76.tx_napi);
 	local_bh_enable();
 
+	mt7996_for_each_phy(dev, phy)
+		if (mt7996_mac_reset_channel_restore(phy))
+			bcn_restored |= BIT(phy->mt76->band_idx);
+
 	ieee80211_wake_queues(hw);
-	mt7996_update_beacons(dev);
+	mt7996_update_beacons(dev, bcn_restored);
 
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 0eeac9084de7..e4f52cb81470 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4394,6 +4394,8 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
 	int freq1 = chandef->center_freq1;
 	u8 band_idx = phy->mt76->band_idx;
+	bool scan;
+	int ret;
 	struct {
 		/* fixed field */
 		u8 __rsv[4];
@@ -4448,8 +4450,19 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 		req.center_ch2 = ieee80211_frequency_to_channel(freq2);
 	}
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_WMWA_UNI_CMD(CHANNEL_SWITCH),
-				 &req, sizeof(req), true);
+	/* the firmware stops the station queues of the band at a scan switch
+	 * and starts them again only at a normal or DFS switch
+	 */
+	scan = req.switch_reason == CH_SWITCH_SCAN_BYPASS_DPD;
+	if (tag == UNI_CHANNEL_SWITCH && scan)
+		phy->fw_offchannel = true;
+
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_WMWA_UNI_CMD(CHANNEL_SWITCH),
+				&req, sizeof(req), true);
+	if (!ret && tag == UNI_CHANNEL_SWITCH && !scan)
+		phy->fw_offchannel = false;
+
+	return ret;
 }
 
 int mt7996_mcu_set_punct(struct mt7996_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 5ee8bf12f73b..1e01e6075193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -421,6 +421,7 @@ struct mt7996_phy {
 	bool counter_reset;
 	bool rdd_tx_paused;
 	bool offchan_bcn_stopped;
+	bool fw_offchannel;
 };
 
 struct mt7996_dev {
-- 
2.47.3

