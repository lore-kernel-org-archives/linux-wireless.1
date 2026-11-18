Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=y5ZyfEwZGKcBd8KaL3LEEvAnt1w94pC2JgmXB6NFYEcNYfrmZJwAbg9mV2TGvR5NDJsk
	 fIuxeXlmq8yc6o2EViCBOJTZiIK4iAWMia67EjAZcxXy8lc3Z4E0tWy30R3ctPvdu8/7S
	 IOQ3nAATVv6gRGCDfq2XplS0RHdoid21nYcjOzDIvRrI4ksCMtXjnFCNJZPuiTGkBrJDE
	 k6rY0bvd/IC2Zz2ccViRal4q6QqBWN0HDUwzl03vc8cFV+roExp2fSlSmNvFipCMFXbB/
	 iksuWwYaHCvvzNsWQdmKG4/9x8irwIi8ul1HRUg4pbQoDnvrz1R/Drh3cIJqdHm7Dkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BKCgSr5FBCAOaN4Uhpl8/wqH3Lp4j5s/ranlv+W/8/w=;
	b=vyPFvKsl/N21QkmKQpKjpkbzj/kopG+ZmZmQ0NT/boH7WrrFz5RcQOj+wtp12UPbah/h
	 hF2RYlMuaHLdjI/15mkOwjyR9C0gT9kDX14NusdhyrKQphpTYvZy1gXJL7puWaIUT+Rou
	 Gkit87G39DQoBas83SXf7BiH2gU8SkDuxlHa5kvxkthLPPmOnPYTGoELmkHleJIbC+ntX
	 UPquHLt6BXjjPDXQ1qYy5oOOl+oC7F59xBBJCWGNoJygJP6IG0S8uBF321M8FPrMU5nNj
	 DZEwbMD45Or2O9JgiPz0rHMkQsvWkg231/TE0KJmC3JAtElR305ibRTXtFBPHgLUVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XzGlNl4s;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F402B606A33A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F402B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XzGlNl4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BKCgSr5FBCAOaN4Uhpl8/wqH3Lp4j5s/ranlv+W/8/w=; b=XzGlNl4svl/11ZXoXSUys5ayZR
	KqsYci7IJxh6sUmFOahJ94mBVwVi7cCxIaoZhWmjjwUULIEpeeAVVwC6DZSZV9CK8Pb6464bVC5Mb
	KSyDHKFGHv/PGd4KrbrhQjdoUHsh2zosZ3vXgbIEV3b0Z7C+swEuVheIZN8zAvqlKNnk=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-1C
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/16] wifi: mt76: mt7996: keep RX running on a monitor with fcsfail
Date: Wed, 18 Nov 2026 17:18:15 +0100
Message-ID: <20261118161827.1208649-4-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7996_mcu_set_sniffer_mode() makes the firmware clear the upper bits of
MT_WF_RFCR1, MT_WF_RFCR1_DROP_NO2ME_TF among them, so the band passes on
trigger frames for other stations. With MT_WF_RFCR_DROP_FCSFAIL also
clear, the band stops receiving after some FCS-failed frames:
rx_fifo_full_cnt rises, rx_mpdu_cnt freezes and the host gets no more
frames from that band. Deleting the monitor does not recover it, and
neither does a SER L3 RX abort or L4 MDP recovery; only a reboot does.
Reachable through a monitor interface with the fcsfail flag.

Drop the trigger frames for other stations again while the band accepts
FCS-failed frames. A monitor that drops FCS-failed frames still gets
the trigger frames for other stations, as the firmware leaves the bit.
Send the sniffer command before the filter write, so that the firmware
does not overwrite the bit.

Fixes: e48da5c9ca29 ("wifi: mt76: mt7996: fix monitor mode")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 13 ++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/regs.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ba7a0553e34a..e6b81aa890f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -610,6 +610,17 @@ static void mt7996_phy_set_rxfilter(struct mt7996_phy *phy)
 		mt76_set(dev, MT_WF_RFCR1(phy->mt76->band_idx), ctl_flags);
 	else
 		mt76_clear(dev, MT_WF_RFCR1(phy->mt76->band_idx), ctl_flags);
+
+	/* Firmware sniffer mode clears the drop of trigger frames for other
+	 * stations, and the band's RX stops where it accepts FCS-failed
+	 * frames without it.
+	 */
+	if (!(filter & MT_WF_RFCR_DROP_FCSFAIL))
+		mt76_set(dev, MT_WF_RFCR1(phy->mt76->band_idx),
+			 MT_WF_RFCR1_DROP_NO2ME_TF);
+	else if (!(filter & MT_WF_RFCR_DROP_OTHER_UC))
+		mt76_clear(dev, MT_WF_RFCR1(phy->mt76->band_idx),
+			   MT_WF_RFCR1_DROP_NO2ME_TF);
 }
 
 static bool mt7996_monitor_active(struct mt7996_dev *dev)
@@ -644,8 +655,8 @@ static void mt7996_set_monitor(struct mt7996_phy *phy, bool enabled)
 		       MT_DMA_DCR0_RXD_G5_EN, enabled);
 	mt76_rmw_field(dev, MT_MDP_DCR0,
 		       MT_MDP_DCR0_RX_HDR_TRANS_EN, !mt7996_monitor_active(dev));
-	mt7996_phy_set_rxfilter(phy);
 	mt7996_mcu_set_sniffer_mode(phy, enabled);
+	mt7996_phy_set_rxfilter(phy);
 }
 
 static int mt7996_add_interface(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index e82a281a773a..b89ac39ad7af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -426,6 +426,7 @@ enum offs_rev {
 #define MT_WF_RFCR1_DROP_BA			BIT(6)
 #define MT_WF_RFCR1_DROP_CFEND			BIT(7)
 #define MT_WF_RFCR1_DROP_CFACK			BIT(8)
+#define MT_WF_RFCR1_DROP_NO2ME_TF		BIT(22)
 
 #define MT_WF_RMAC_MIB_AIRTIME0(_band)		MT_WF_RMAC(_band, 0x0380)
 #define MT_WF_RMAC_MIB_RXTIME_CLR		BIT(31)
-- 
2.47.3

