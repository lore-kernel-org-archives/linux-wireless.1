Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509796;
	b=fd0jYZkoL5ud28hEWqZF3RGFSglaTqCegmlC+l08v0ysksskiYF5Ce4AssrxlkGJeAAd
	 MMcW8ejjoXaBpCqa4jvsP3oWiyM+v3bVfRy1ltYdVVax+0RomMAz8zadnOIJiiylr06Z5
	 vD9EXzvwk4JAbynz2ivb1dsQ7FjMCqSc6r4AZQVcLQvUyPfd6qC9kvy/SHleOaeIBSENX
	 VvZ8Y6ypoctaUyL/Vl93LH6MAzU658jbiwKK/1z6ElOR68PtH37PtHVisvTHSgbV/mFM7
	 SOx2k1XXkBq6Mx2EcIJSwCR+69jr+OoCMswimzjBthgdhQQq8LrQ6p2o+5j21WWV1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509796;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IOXlHeajwoUYisXlc2rU4eIAtHEqspD4H0c9oZwZaoo=;
	b=ziFg848slmSYahmUby4om1o1X1Sx5H6yU949x0WOam+bdSFQ4ycO4K4k/LVCNhJa+7IS
	 ynqsXspGeeoNvRIIq7zZauGxoZ1iD+sqt2IBdBMLK1CBAh8CUN/rY0kpgcwkPFm0/z2ZI
	 SsqyyWhpdUip3GuDyCmtUaoywtb2KxTZUMvw7PNDvAzgKv3c4bvePC1r1uUXmdeal1ksh
	 WOjix2aWV0rFKaNVUCTrqKaaWJc0kZ1w5v47PWnEFNiqXB1iglgqvBf4zIKY3xf2JmJXW
	 nxNTcRtsZHfmCcrK7xpOzlNR4CYrIfmCR5cXHknslDs/+XFyC3o2bRre6s7+qu6Kx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gDjrbHOg;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5E606A6BD
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC5E606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gDjrbHOg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IOXlHeajwoUYisXlc2rU4eIAtHEqspD4H0c9oZwZaoo=; b=gDjrbHOghi5CWGxc7u/q3itK7m
	LdUhJtGsDrpZvvQF9stdGmpq8cz8LHxEufwXZUsh6y8JQHl4EFaskvtv52q8faRm9OygMeBb5gdeJ
	Z4LeMQ0Zht8vd3EX6MNoLE6sFL096VRd9UJ7iVJCXxqpe10HAhFN20QE/ZORLjOcFIfk=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7O-007dJf-1T
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:14 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 19/20] wifi: mt76: mt7915: clear the PS flag of a station at a reset
Date: Tue, 24 Nov 2026 09:43:08 +0100
Message-ID: <20261124084309.1981968-19-nbd@nbd.name>
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

MT_WCID_FLAG_PS survives a full reset. The replay of a station keeps
wcid->flags. The reloaded firmware holds no PS state and reports no
leave when the station wakes.

The station then gets one frame per AC per TX status until its next
enter and leave. The L1 branch of the reset work writes no flag either.

Clear the flag when a station is added, like mt7996_mac_sta_init_link()
does. Also clear it for every station at the end of an L1 recovery,
like mt7996_mac_reset_sta_ps(). A station that still sleeps gets a new
enter from the firmware.

Fixes: dc930cf883c8 ("wifi: mt76: mt7915: handle MCU PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 20 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cc3ef641d1c1..84f75526da58 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1511,6 +1511,24 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 		ieee80211_restart_hw(ext_phy->hw);
 }
 
+static void
+mt7915_mac_reset_sta_ps(struct mt7915_dev *dev)
+{
+	int i;
+
+	rcu_read_lock();
+	for (i = 0; i < ARRAY_SIZE(dev->mt76.wcid); i++) {
+		struct mt76_wcid *wcid = mt76_wcid_ptr(dev, i);
+
+		if (!wcid_to_sta(wcid) ||
+		    !test_bit(MT_WCID_FLAG_PS, &wcid->flags))
+			continue;
+
+		mt76_sta_ps_transition(&dev->mt76, wcid, false);
+	}
+	rcu_read_unlock();
+}
+
 static void
 mt7915_mac_reset_napi_enable(struct mt7915_dev *dev)
 {
@@ -1641,6 +1659,8 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	if (!mt7915_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE))
 		goto abort;
 
+	mt7915_mac_reset_sta_ps(dev);
+
 	/* enable DMA Tx/Rx and interrupt */
 	mt7915_dma_start(dev, false, false);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 47796e0fa506..50e67a209693 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -759,6 +759,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->wcid.idx = idx;
 	msta->wcid.phy_idx = ext_phy;
 	msta->jiffies = jiffies;
+	clear_bit(MT_WCID_FLAG_PS, &msta->wcid.flags);
 
 	if (sta->tdls)
 		set_bit(MT_WCID_FLAG_TDLS_PEER, &msta->wcid.flags);
-- 
2.47.3

