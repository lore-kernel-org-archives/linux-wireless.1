Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=v2fv5X2GpYxhZjM8exkoamOPHp+V39DnIialISZ+C5ineihYp4AuV4nJARkB4Rt+hgBM
	 XsHQ8M3J5oBEmmYIJO+7k/bcNlERotcFUO0/2uTGb16KlMEc1iKSQhGmploT6Ryg5u62h
	 ECGtKqtvFZ0MzybldZN4XLBsiTYMKaSRJ+oyoW02aVoJ6P70GvuB42OvAjFJl/xi8COdz
	 ZPB0erhqHHt8q5wo0e0kBUa6ljjz239uWsXDe1DwwttKSjiT2wNj7LCp/yvepEKE2IeCO
	 LwWhO9m7UyBCmt1135Y0Bt/4d0CZgEHbIukHGYVtwagKNaiOoPzLc6J89f/nSINhfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S1oiyyuGUCAhuOXwSypHIp/Amc83b4rn30Mj/R9+toI=;
	b=WD27CnODecOxjh+wg1dgA6DxcOxeBlXEKI/dxz20IjJxNorY7YeflYasK9OS4aSpiQqx
	 MRtTnDlgdJjmUiuGcHc96AS/pqwhxlAeWW/mPq9AXr9MpeapfN7JpiIfB449dBrSg5BlO
	 q+OQKhBXNrKu3n4FaKm0oDPNqgAmw+cmvo0fjIT4cAy/B5dOTrGXAyjUTTHc0h+hRzJ3b
	 MRZWZWSCe+dohK3hmoXFTUe3qwmOPXitVtWr/o3Cq7Dke3dq7Z2nYi0ru7x+/A2GYVtC+
	 4GjfsD+cShAh4XK1XcAFC3p7asHADziBCaVtnKb+hm/iSuZ7PSdot1RnHMdCSj5qFdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="sLFqhJz/";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507DE606A6A2
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 507DE606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=sLFqhJz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=S1oiyyuGUCAhuOXwSypHIp/Amc83b4rn30Mj/R9+toI=; b=sLFqhJz/P83pHE+HYnHldgXIdd
	lkyz4RzHofqZeq4Oa1paxdpaghPCd5MM9oAZnpVogPM8E1NpK50cy79GjXVb1UQ8xu2sL2ZSHPMF1
	wogPr4iX8Qr+I1YZ52J1nci7LZOq/gHGKpEA/wneBU8FAmXikCMllHPfsFsPG/ypB/Qo=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-2q
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/20] wifi: mt76: mt7996: read the TSF twice against the firmware's latch
Date: Tue, 24 Nov 2026 09:43:05 +0100
Message-ID: <20261124084309.1981968-16-nbd@nbd.name>
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

__mt7996_get_tsf() latches the timer into the UTTR0/UTTR1 register pair
of the band and reads the pair. The firmware reads the TSF through the
same pair, with no lock. It does so in its pre-TBTT work, for Critical
Update, TTLM and TWT, and for a few commands. A firmware latch between
the latch and the reads of the host gives the host the value of the
firmware. That value can belong to another timer of the band, or be off
by 2^32 us at a low word wrap. Reachable via mt7996_get_tsf(), the TWT
setup and the TTLM and AP Removal Timer code.

Latch and read twice, and take the second value only if it is at most
about 1 ms later. Retry a pair that does not agree a few times, then
warn once and return the last value. This lowers the rate of the race
and does not remove it, since two reads with the same value of the
firmware still agree. The firmware holds no lock or semaphore for the
register pair, so the host cannot exclude it. The GET_TSF command of
the firmware queues behind a deferred beacon template, which breaks the
pairing of the TSF with ktime_get_boottime_ns() that the TTLM and AP
Removal Timer code needs.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 39 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  2 +
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 3486781609e3..b778728bcecc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2350,15 +2350,29 @@ mt7996_get_stats(struct ieee80211_hw *hw,
 	return 0;
 }
 
-u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link)
+static u64 mt7996_tsf_latch(struct mt7996_dev *dev, u8 band, u16 n)
 {
-	struct mt7996_phy *phy = mt7996_vif_link_phy(link);
-	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 	union {
 		u64 t64;
 		u32 t32[2];
 	} tsf;
+
+	mt76_rmw(dev, MT_LPON_TCR(band, n), MT_LPON_TCR_SW_MODE,
+		 MT_LPON_TCR_SW_READ);
+	tsf.t32[0] = mt76_rr(dev, MT_LPON_UTTR0(band));
+	tsf.t32[1] = mt76_rr(dev, MT_LPON_UTTR1(band));
+
+	return tsf.t64;
+}
+
+u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link)
+{
+	struct mt7996_phy *phy = mt7996_vif_link_phy(link);
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	u64 first = 0, tsf = 0;
+	u8 band;
 	u16 n;
+	int i;
 
 	if (!phy)
 		return 0;
@@ -2367,13 +2381,20 @@ u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link)
 
 	n = link->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0
 					       : link->mt76.omac_idx;
-	/* TSF software read */
-	mt76_rmw(dev, MT_LPON_TCR(phy->mt76->band_idx, n), MT_LPON_TCR_SW_MODE,
-		 MT_LPON_TCR_SW_READ);
-	tsf.t32[0] = mt76_rr(dev, MT_LPON_UTTR0(phy->mt76->band_idx));
-	tsf.t32[1] = mt76_rr(dev, MT_LPON_UTTR1(phy->mt76->band_idx));
+	band = phy->mt76->band_idx;
 
-	return tsf.t64;
+	for (i = 0; i < MT7996_TSF_READ_TRIES; i++) {
+		first = mt7996_tsf_latch(dev, band, n);
+		tsf = mt7996_tsf_latch(dev, band, n);
+		if (tsf - first <= MT7996_TSF_READ_SPAN_US)
+			return tsf;
+	}
+
+	dev_warn_once(dev->mt76.dev,
+		      "TSF reads of band %u do not agree: %llu, %llu\n",
+		      band, first, tsf);
+
+	return tsf;
 }
 
 static u64
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index f5bca533c3e1..65a0ef6b1161 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -21,6 +21,8 @@
 
 #define MT7996_WATCHDOG_TIME		(HZ / 10)
 #define MT7996_RESET_TIMEOUT		(30 * HZ)
+#define MT7996_TSF_READ_TRIES		3
+#define MT7996_TSF_READ_SPAN_US		1000
 
 #define MT7996_TX_RING_SIZE		2048
 #define MT7996_TX_MCU_RING_SIZE		256
-- 
2.47.3

