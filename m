Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=zIk/PHGOo2K2ATplYrYGxdVphLYZ3IxUe5tiwCMIgjKmTZ5bBQNnyIJJDMycf0apqNGd
	 H4mLPbJu8WFkHHC6d+Fi0yiKVW/MsCso+4WLBhxyfvNkY1UH+1I8RCKezLwzoicvA1+qy
	 Vs8/J+nAHFeSmdb6fMldPAILgpbfvnrTZFpWtd139C8H4V+O3MwJNjaREUjtHWo18Plfa
	 VgutBrCfP4QFEdcUBug4sG6sYBNFjy3X3qytkJbIi00SNWof1l+jOTV9on9iLVo1JbX9f
	 dAzTDzk7gyE81GKMI5frG8OSK79Sbt/8lm3EuvG41/jFx2gP7oku+uhwtxrvd6PGZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meuyGDzNz4b3s6Orsf7Az6RG8jY5Nmx6bejj2+R8jvs=;
	b=33GhS4lKx4PkjVa8MhTwZvgcEOECH2YVdtccOdnrM4k0o/HvFdA0rj54gNGMYG66HHxG
	 lu+gaFWrA+hkqniWmgEEctZXspy4In+xZfCPhJzN/kG3LwWZYqCysCdRzsj3zaOZcskUU
	 60xkDzm/iW7EUm0cN7Q/TQMjOgYrK4MaadFBDSOR6FLLDTEnbtLPyA+IAEi+V/ryRc6is
	 wKXpcQAqLHTSCrnYPNGNjMnNusHQLVfbCm+OqBz7fKSq48zumguD2CpexHcI0eL4wORge
	 wGVe4PK/mm5gjXquYxJ1n5RLGd/omgtbirBEkEvYyIfY0Ssg0DqTfwsehiLiRfUd4dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=sfdTFAx+;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1937260A2608
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1937260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=sfdTFAx+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=meuyGDzNz4b3s6Orsf7Az6RG8jY5Nmx6bejj2+R8jvs=; b=sfdTFAx+XJ7GWUqag322DuR1Jj
	+n24bOAAGJngz1CgknOLUezWFy9i48ODk9ww9X7nRpwmn2P5AOws6Wj35aCoCBSlpdG81noL7FVsy
	8xCwodgMuFr34jgQmkLaiQYY3nS/ZIudkdw5GBkUg4AYbIp94Fe0gfuaDnAE1ZfQ8JJw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-2N
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/20] wifi: mt76: mt7996: list only published links on sta_rc_list
Date: Thu, 19 Nov 2026 13:43:38 +0100
Message-ID: <20261119124352.1842164-6-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt7996_mac_sta_remove_link() takes a link off dev->sta_rc_list while
msta->link[] still names it. An rc update that looked the link up can
thus list it again, and mt7996_mac_sta_rc_work() later uses the link
after kfree_rcu() freed it. Reachable via an HT SMPS action frame that
mac80211 receives while mt7996_mac_reset_sta_iter() runs.

Unpublish the link before it goes off the list, and only list a link
that msta->link[] still names, tested under sta_poll_lock, as
mt76_wcid_add_poll() does with dev->wcid[].

Fixes: ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 2c09351a56f3..3028c92c2efb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1396,8 +1396,10 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 	if (!msta_link)
 		return;
 
-	if (flush)
+	if (flush) {
+		rcu_assign_pointer(msta->link[link_id], NULL);
 		rcu_assign_pointer(dev->mt76.wcid[msta_link->wcid.idx], NULL);
+	}
 
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	if (!list_empty(&msta_link->wcid.poll_list))
@@ -1424,7 +1426,6 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 		if (phy)
 			phy->mt76->num_sta--;
 
-		rcu_assign_pointer(msta->link[link_id], NULL);
 		mt76_wcid_mask_clear(dev->mt76.wcid_mask, msta_link->wcid.idx);
 		if (msta_link != &msta->deflink)
 			kfree_rcu(msta_link, rcu_head);
@@ -2543,6 +2544,7 @@ static void mt7996_link_rate_ctrl_update(void *data,
 {
 	struct mt7996_sta *msta = msta_link->sta;
 	struct mt7996_phy *phy = mt7996_vif_link_phy(&msta->vif->deflink);
+	u8 link_id = msta_link->wcid.link_id;
 	struct mt7996_dev *dev;
 	u32 *changed = data;
 
@@ -2553,7 +2555,8 @@ static void mt7996_link_rate_ctrl_update(void *data,
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 
 	msta_link->changed |= *changed;
-	if (list_empty(&msta_link->rc_list))
+	if (list_empty(&msta_link->rc_list) &&
+	    rcu_access_pointer(msta->link[link_id]) == msta_link)
 		list_add_tail(&msta_link->rc_list, &dev->sta_rc_list);
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
-- 
2.47.3

