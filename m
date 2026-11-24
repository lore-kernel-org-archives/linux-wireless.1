Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509795;
	b=ig4CV1264X8G/BotbhJ6Q/Rb6IZEw6IMahp4slq2BiIToOAE4jvFQwmpPDJ+PDofS+SP
	 np/PLy/vHmxKkSxozr53erIfCr+D0HY0U3pB9Wvruh8BVqr4zFGZTmo5SzSzzBgC/M4lk
	 j7Y6MEnC5lNFMK+dsvm123yEyJv3F/AcSLiHocAipCwZx/Wpwvx5P2YKqEdt+9PtXlsnA
	 q6k5MIbV5MNiaM0QwVMbIv45+Y7kHan5AJoseFUO91fZ1VjF38BCGO8rOoSyTTs3eFSBc
	 5q5Jwqb89sXSzHv+w+okxMNQ69uDqdmOvNWqeiRQuMzJq1XDGKpqNJ9CCYhly1Fdi4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509795;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xN8as0354DgXAwceWvMegCOReUOfOjRMwbsh8DssKu8=;
	b=f32R59+wFuujP9ugTJpU37Em+GSb3k05sl7LqGR9NA+Lr+hr50t/gJmkPN7kpssMAQ4b
	 gJPomv11gPhKxnf5ByzdM2s37TaMr8hD4LmqktSAtHmx2XGbUHPN91EbDBeZs+Fyirf5e
	 lcMRh5dgZpHLM+ZwEK8fxKu5KxMEjBAzqPYvkydXaP6Lw9hKpGD/GULavIT827DZjtDum
	 iZG2jXOb5QveEzpGpwNH6ofdQIE642pQ2+FFTRmaNP1fNmJkc3nhCELyMyFLxI58lfFYI
	 X0gJBQg5zN38T7Qpcsq1gCjGoOEGI7VRURxhjYaMQhiXLrZxCeQ0vEc10VCyoWHUu7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lQRDE04I;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C025B606A68D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C025B606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=lQRDE04I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xN8as0354DgXAwceWvMegCOReUOfOjRMwbsh8DssKu8=; b=lQRDE04IQHwk7ZNiO8Kkdd/XC+
	RbkefZjDH7g2jJbIfAqwPSgD6ZsHrHEIwOB8l2WblxBxc3559OJh0+gILoc8Hrfi0g60TIfQ2Nnn/
	35KZnVnhi3XJh+n1/RbFOCOqwh/Bj5zTTrjjxd6I2zyQeUHf56OJ+D15X7/FK2w0eS+A=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7N-007dJf-17
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:13 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/20] wifi: mt76: mt7996: clear the PS state of stations at a reset
Date: Tue, 24 Nov 2026 09:43:02 +0100
Message-ID: <20261124084309.1981968-13-nbd@nbd.name>
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

MT_WCID_FLAG_PS survives both recoveries: the full reset replay reuses
&msta->deflink in mt7996_mac_sta_init_link() with its flags, and the L1
branch of mt7996_mac_reset_work() writes no wcid flag. The firmware
holds no station in power save after a firmware load. An L1 recovery
clears the PS state of every record, but reports that for the link
records of an MLD alone. Any other station that is awake gets no PS
leave, and mt76 sends it one frame per pass until its next doze and
wake.

Clear the flag when the driver sets up a station link. At the end of an
L1 recovery, clear it for every station before RX takes the first
firmware event. The flag then matches the firmware, which holds no
station in power save after either reset. The next PS enter event of a
station sets the flag again.

Fixes: 2d16caccd278 ("wifi: mt76: mt7996: handle UNI PS sync events")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 19 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index e507bfd34372..1b133d74c175 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2506,6 +2506,24 @@ mt7996_mac_reset_sta_iter(void *data, struct ieee80211_sta *sta)
 		mt7996_mac_sta_remove_link(dev, sta, i, true);
 }
 
+static void
+mt7996_mac_reset_sta_ps(struct mt7996_dev *dev)
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
 mt7996_mac_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 {
@@ -2718,6 +2736,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
 
 	mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_RESET_DONE);
 	mt7996_wait_reset_state(dev, MT_MCU_CMD_NORMAL_STATE);
+	mt7996_mac_reset_sta_ps(dev);
 
 	/* enable DMA Rx/Tx and interrupt */
 	mt7996_dma_start(dev, false, false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 65b5012a0017..e129cd2cd73e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1385,6 +1385,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	msta_link->wcid.link_id = link_id;
 	msta_link->wcid.link_valid = !!sta->valid_links;
 	msta_link->wcid.def_wcid = &msta->deflink.wcid;
+	clear_bit(MT_WCID_FLAG_PS, &msta_link->wcid.flags);
 
 	if (link_sta->sta->tdls)
 		set_bit(MT_WCID_FLAG_TDLS_PEER, &msta_link->wcid.flags);
-- 
2.47.3

