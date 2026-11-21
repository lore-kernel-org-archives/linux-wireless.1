Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262970;
	b=lhlRPvgIDq9hzlf1HPhBwsGJfbZ3flyHDJqYhmz5asX9wcMJswrwYFuhFmkSjXrDfa3P
	 nb6vvkh5w71AUsA1dy0SzSzGmAOIWjNLioN0mDo3IGoDFAAUFPI7/yUmJ/AoooaLdKJyc
	 vkaPef99bIcGUcUnlUvMCLNWwba3pIjfuMk+YMpE94dFt2ucrM9x5aRQEn7q7zv+3yvZU
	 mIJknMFYpO12qJpvYyE2YV5cB7cksrsu7AfFMziIQ1mrqsSJSOG0heYo8DUrFV48DD75c
	 uWrls9k94BP57KEH7Ea20uWDhE8x87ifRi+f2Gjgvig0xl+e24VPV6Kkqe7S4T/wypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262970;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LfbvamiXn96PuQeHQ7FO5o36cjzTLnWFrkkGEl8zySc=;
	b=Q16EBzcVoDfXtnmiXu/SNl5IJlIEPKJcdyuQbFynox+N3h/7LkqHQoV2UC9MrZSAefpv
	 JH2S+UoiJwlwbsXbcXfBwUBfLaUy1+vCHDXhy/eeqPMhTL9jiDdpCfWFvzEr09mQxwst9
	 +wtD/q2riLjxpDuib4iC7fDwswVgNz2/ozoci9F687ozWkQ8kxFl9gFMgemKui0yvkpvC
	 1L7EbEGviFy7/JKdztP9KyJVBZipM2mmgwPHGVC/MIJxLZEdvbrMjgebZDWk9lLMyqX3h
	 adVBtorT2Kcq3AviB/STBznd+ljrGIT9UX/2oHX8zWrg03joDaUgWQ224gri3/UKkKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tbAGOiuF;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3F606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB3F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tbAGOiuF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LfbvamiXn96PuQeHQ7FO5o36cjzTLnWFrkkGEl8zySc=; b=tbAGOiuFMi0RGlHwBNoG6f1Uk2
	FfU/fI0WzemEC2GIk/Sg7wum4zn/7eyeu8/Mu/MwMWlqgNFM4VQ38T94cG7tPDqhrkU8sw2uAGD7h
	FXvQ2/cTinsbnXgvY0FmB33b2YDm6EVUZXd/SVz/Hrmhi/3RJJmO0t4icmK3MZee2grQ=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuK-006Q1I-29
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/17] wifi: mt76: add a helper to point the TXQs of a station at a wcid
Date: Sat, 21 Nov 2026 13:09:11 +0100
Message-ID: <20261121120926.3603979-2-nbd@nbd.name>
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

The TXQs of a station name the wcid that the TX scheduler sends their
frames on. mt76_sta_add() sets it when the station is added. mt7996
adds its stations without mt76_sta_add() and sets it with a loop of its
own whenever it sets the default link of a station.

Move that loop into the core, so that other drivers can use it for the
same purpose, and use it in mt76_sta_add() too.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c  | 11 +----------
 drivers/net/wireless/mediatek/mt76/mt76.h      | 16 ++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/main.c   | 18 +-----------------
 3 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index b8a568e0ae27..db604ffde216 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1758,7 +1758,6 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct mt76_wcid *published;
 	bool registered;
 	int ret;
-	int i;
 
 	mutex_lock(&dev->mutex);
 
@@ -1772,15 +1771,7 @@ mt76_sta_add(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	if (ret)
 		goto out;
 
-	for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
-		struct mt76_txq *mtxq;
-
-		if (!sta->txq[i])
-			continue;
-
-		mtxq = (struct mt76_txq *)sta->txq[i]->drv_priv;
-		mtxq->wcid = wcid->idx;
-	}
+	mt76_sta_txq_wcid_set(sta, wcid->idx);
 
 	published = rcu_dereference_protected(dev->wcid[wcid->idx],
 					      lockdep_is_held(&dev->mutex));
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index ddada6834170..d82d22c14c9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1449,6 +1449,22 @@ mtxq_to_txq(struct mt76_txq *mtxq)
 	return container_of(ptr, struct ieee80211_txq, drv_priv);
 }
 
+static inline void
+mt76_sta_txq_wcid_set(struct ieee80211_sta *sta, u16 idx)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
+		struct mt76_txq *mtxq;
+
+		if (!sta->txq[i])
+			continue;
+
+		mtxq = (struct mt76_txq *)sta->txq[i]->drv_priv;
+		mtxq->wcid = idx;
+	}
+}
+
 /* peer-wide state uses the wcid of the primary link */
 static inline struct mt76_wcid *
 mt76_wcid_primary(struct mt76_wcid *wcid)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index d323557898b6..253603d25662 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1226,22 +1226,6 @@ mt7996_post_channel_switch(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return ret;
 }
 
-static void
-mt7996_sta_init_txq_wcid(struct ieee80211_sta *sta, int idx)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(sta->txq); i++) {
-		struct mt76_txq *mtxq;
-
-		if (!sta->txq[i])
-			continue;
-
-		mtxq = (struct mt76_txq *)sta->txq[i]->drv_priv;
-		mtxq->wcid = idx;
-	}
-}
-
 static void
 mt7996_sta_deflink_set(struct ieee80211_sta *sta, unsigned int link_id,
 		       int idx)
@@ -1251,7 +1235,7 @@ mt7996_sta_deflink_set(struct ieee80211_sta *sta, unsigned int link_id,
 	msta->deflink_id = link_id;
 	if (msta->seclink_id == IEEE80211_LINK_UNSPECIFIED)
 		msta->seclink_id = link_id;
-	mt7996_sta_init_txq_wcid(sta, idx);
+	mt76_sta_txq_wcid_set(sta, idx);
 }
 
 static void
-- 
2.47.3

