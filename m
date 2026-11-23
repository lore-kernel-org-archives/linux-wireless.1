Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=0cQgdV/euOQqUUcFCPVG0J58Reuny9cKkR/7pZ3SCBuKR1YRsYXLV7cZt39ExROItkfP
	 NEeizYqoHu/QSAp8R6WIV6rZNsw83hBazA1jMaY69xQvCF1YiUkw+R7bZOgf1Mm4T6HK2
	 N2Xeribr5q2kQs/IMAxC2SY0l/+DC8pYpTtkAG11JxYR5JdAOPeSpIgmACOjlZfTLxnSe
	 Rf6dtws11b1uLqsCbMnvQ9/a0k+JIBdOCHuuupPZ/NUZP7qCAS7hrFnePHjZ9hJ/peGPw
	 /GqPlZyx+Phc8FNdcA9C7f+GoVIu8W3Q7UKV9a/BIDbYSURZcLtiMFpbnUlRFEzxgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2CJxxlBed7smSXqxwkCeFc21b6jM+eop411ykGn1QZM=;
	b=P7ZhY+/qzkObSD2kIhKp3gsVMgQJe27BU5rKacUX51gzz2UxHR4eFvhiaOkfTsC1txv1
	 F0lVUYqAU++xJfAwuumsiOJIqMEn7iPeT4jur5IVYj9JuJwXQZSygFmXzoWgPCqVbeZij
	 A+7mgTntrieOps25qjyH0DeUJu1+g+rC5A9gKgw3BERZ1LaSM2IzXlVCBtOkpBMOCjxmn
	 FKb4X8WSf0K4Use90e7BWrdEADslLGUmTpbCqehHOHyK+IU1u6Y/UIPTtiitTsZriKIzs
	 vGMGGcNFBCrx7wOR94rum2SOe8GlH0cUwRqsgGoyf7qnG4Y5exsAThdyq3KT3ahe2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XDCKoFxt;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D2606A681
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5D2606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XDCKoFxt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2CJxxlBed7smSXqxwkCeFc21b6jM+eop411ykGn1QZM=; b=XDCKoFxtWD1IQl+k9uB7WqBjUG
	9MihqWUHm2OwedSbCCgM2WR94Fdn7hnp7ftjkXMzk6ttbIfbwbKORMRrX7ryLbVKEIQcQ3QVyJI4D
	gQsV7iuaKY86yuudSAuEJcMi7kDqUnSdutiYLRsMQl4QcHopecKhlOJ0ycaDSNqG5ydw=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-2K
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/20] wifi: mt76: take the DFS state from the off-channel flag
Date: Mon, 23 Nov 2026 14:49:11 +0100
Message-ID: <20261123134920.154270-12-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt76_phy_dfs_state() gives MT_DFS_STATE_DISABLED while MT76_SCANNING is
set, which a software scan holds for its whole length. The scan end sets
the operating channel before drv_sw_scan_complete() clears the bit. So a
software scan on a DFS channel leaves the radar detector off. A
remain-on-channel sets no such bit, so the detector follows the radio to
the ROC channel.

Give MT_DFS_STATE_DISABLED where the current channel is off the
operating chandef, which phy->offchannel records at each channel set.
The return to the operating chandef then starts the detector again in
the same channel set. On mt7996 the detector now keeps running during a
hardware scan dwell on the operating chandef. During a ROC off a DFS
channel it is off, until mt76_roc_complete() starts it again.

Fixes: 3f3064486b1a ("mt76: mt7915: fix/rewrite the dfs state handling logic")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 +--
 drivers/net/wireless/mediatek/mt76/scan.c     | 4 ----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 948f9ed26095..e554f2eea7cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -2225,8 +2225,7 @@ enum mt76_dfs_state mt76_phy_dfs_state(struct mt76_phy *phy)
 	struct ieee80211_hw *hw = phy->hw;
 	struct mt76_dev *dev = phy->dev;
 
-	if (dev->region == NL80211_DFS_UNSET ||
-	    test_bit(MT76_SCANNING, &phy->state))
+	if (dev->region == NL80211_DFS_UNSET || phy->offchannel)
 		return MT_DFS_STATE_DISABLED;
 
 	if (!phy->radar_enabled) {
diff --git a/drivers/net/wireless/mediatek/mt76/scan.c b/drivers/net/wireless/mediatek/mt76/scan.c
index 51b182ee99e2..0a5fea9e7454 100644
--- a/drivers/net/wireless/mediatek/mt76/scan.c
+++ b/drivers/net/wireless/mediatek/mt76/scan.c
@@ -28,10 +28,6 @@ static void mt76_scan_phy_complete(struct mt76_phy *phy, bool abort)
 
 	clear_bit(MT76_SCANNING, &phy->state);
 
-	/* Re-program the operating channel even when the scan never left it:
-	 * any channel set during the scan ran with MT76_SCANNING held, which
-	 * left DFS radar detection disabled
-	 */
 	if (phy->main_chandef.chan &&
 	    !test_bit(MT76_MCU_RESET, &dev->phy.state)) {
 		bool offchannel = phy->offchannel;
-- 
2.47.3

