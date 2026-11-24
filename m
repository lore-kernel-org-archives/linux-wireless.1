Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=smc8qJ77gkhQItucxGAklVR9NxlvTZiqCf93YLNPr5LKv0Q7zv1tpF1hcAB2RaG1uzvp
	 4lz4WtMvP9HnrGn4PIJC5fH7b+HAFTgN8EvGkJRNHmniJEEmk56B9x0gCi3aZaO9sKNGz
	 zBie26VW6ApEZha1KTNRoE+4NoQcOKEe6BqDHJPepFggBLtB24ytQUULUdQy7rGo2E7vb
	 UuVgM53iqIXoTk84teFSuAVRct0iRmSjhMcAsF1VEhInTW+OVWetrSzJ9H32YFJ3Rb6SP
	 QwAvuU8Gi4NAz3mbs/n+2qcDgMPw+FLp4inb/n0wWFv1ZFsh8TjmfQ8WNfxSgzlbMZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/U3PsiDAjKeEv9rXupPQbXGrZYOudyHc1oZFXCkBOCI=;
	b=nAdiQqayeHVxfhIqdOg0tZfVzMK6jsy3cVV/E0w2BlBMmZ5uy2TdGfKHvmpNS2jiGRL0
	 WOAeLK7dOoimHKJ9urjNsfWPl66bWyXv971s2si5l5RIOAVE9ynjWCp8LEgekmuIhgjdU
	 SSNZYOv41u+AdPKKYPjqldu0k0aHfdDO6OdEWia3qW9CgihXhZowhaMskHlwaK44Mri4m
	 a58L3DP5NCEl9rVFCZ0Ubok8plgyT7p5Pv+VdrsHf5Yzs27iGSZ3MaBG7odzNHOjtWc8t
	 nAegQABbDj9aStxQ5Kr4+JuASTmk/iTJPU9km1pVzmtHbLiUz+D50r2ol6iXOA1WQaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=imkaYtaN;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13A606A33E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C13A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=imkaYtaN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/U3PsiDAjKeEv9rXupPQbXGrZYOudyHc1oZFXCkBOCI=; b=imkaYtaNAB4qQHUeXLPLKwiwES
	j8hDKlNwsR1QTADt/AWGW87hEEfe/Ji0QpKXg6j5MJf1zD6vhp0/upKzXv31HbYX0+A2HNNsLrC/0
	UAewQGEjmNzbh9+rREBH7Sz1kP6Xsvf/gLUt7PGUHPVqX6O+1xTKibRd/5uDFVDG57lM=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-01
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/20] wifi: mt76: mt7915: hold the device mutex in the station and regd updates
Date: Tue, 24 Nov 2026 09:43:00 +0100
Message-ID: <20261124084309.1981968-11-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

The sta_set_4addr and sta_set_decap_offload ops and
mt7915_regd_notifier() send their MCU commands without dev->mt76.mutex.
The L1 SER work holds the mutex while MT76_MCU_RESET keeps commands from
the firmware. An update in that window is thus lost: the header
translation or the radar detector state.

Hold the mutex across the updates, as mt7996 does in its station ops.
mt7915_set_radar_background() already holds it for the background
chain. The callers then wait for the end of the L1 SER.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Fixes: e151d71e503d ("mt76: mt7915: add encap offload for 4-address mode stations")
Fixes: 90e3abf07c80 ("mt76: mt7915: add support for rx decapsulation offload")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c |  4 ++++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 16 ++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 1bb2a938c354..fb92a0b2e4ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -383,6 +383,8 @@ mt7915_regd_notifier(struct wiphy *wiphy,
 	struct mt76_phy *mphy = hw->priv;
 	struct mt7915_phy *phy = mphy->priv;
 
+	mutex_lock(&dev->mt76.mutex);
+
 	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
 	dev->mt76.region = request->dfs_region;
 
@@ -393,6 +395,8 @@ mt7915_regd_notifier(struct wiphy *wiphy,
 
 	mphy->dfs_state = MT_DFS_STATE_UNKNOWN;
 	mt7915_dfs_init_radar_detector(phy);
+
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index edbb921e63bc..47796e0fa506 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1294,15 +1294,17 @@ static void mt7915_sta_set_4addr(struct ieee80211_hw *hw,
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 
+	mutex_lock(&dev->mt76.mutex);
+
 	if (enabled)
 		set_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
 	else
 		clear_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
 
-	if (!msta->wcid.sta)
-		return;
+	if (msta->wcid.sta)
+		mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
 
-	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static void mt7915_sta_set_decap_offload(struct ieee80211_hw *hw,
@@ -1313,15 +1315,17 @@ static void mt7915_sta_set_decap_offload(struct ieee80211_hw *hw,
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 
+	mutex_lock(&dev->mt76.mutex);
+
 	if (enabled)
 		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
 	else
 		clear_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
 
-	if (!msta->wcid.sta)
-		return;
+	if (msta->wcid.sta)
+		mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
 
-	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 static int mt7915_sta_set_txpwr(struct ieee80211_hw *hw,
-- 
2.47.3

