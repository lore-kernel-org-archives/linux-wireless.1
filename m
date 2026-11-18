Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=H3v+pAEA1jF69Qnmn0/zznvIaXgbXVVxmnkJmH9dHgNE1I4vq6nvv6nif5JmyJCc4hoq
	 kpxj/lAtTf/4e4pu4pBLCYE9X4s34VGx13+T40ZscKTaY1IhoqVvgbft2LxoaOA6/4uKh
	 SN3gsR6n5dnGIVYYW8NEJlPJXspaWbih0rt4QA+D5xGPXcNu3aBnVUEUWJ/WQB0mlx5Ij
	 2MqLtnpHsQPqsFj0XE2Cxuvbe7qvt6rrXSpfgoPMekCi0k5hZKu+pGp3jikTAmD7uqcDK
	 BzB5mYvB1cggPaF2XxiOfcY98PdCA4Xq2IQHuOB6kykDh4moT98ewtMM+jnUcaP65oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=atty5VjjxsIkGyTrhR+UBgtQocRVbelRzBoZ/NMMHTs=;
	b=uf0td/oynQQa3V2dFFt6RtBi3RhwGE0idsNTFgIShq8WfwOEn1sdQcymhozVn7jqHab5
	 tZ7+WEE1a7GUgCCXvIzkW9V6qwcadtjy8WJKY/B5d7nbxg9nFPGq6E0kFVORA4YxBrGlZ
	 dLmPvYAfQ4risdIlB87J6fKmaSJ5hRhQzuqZqTinP33W4vnNMsV0brz7Hmxm66qOC0eWj
	 jstAeopZjjESO/GRP0FQMVWFs1igldlY4oFklNQauZzJHKQfgdAq8MJCWBGMzuj8nRBFM
	 ocdIH2RUc/swNNTSJyvxeWmXdAKReNhQbcEG605g3dyWG/IeDtWGMgOKZ1dq8kQgLJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bCsT0opr;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8AC606A33F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8AC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=bCsT0opr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=atty5VjjxsIkGyTrhR+UBgtQocRVbelRzBoZ/NMMHTs=; b=bCsT0oprFlUkisDvRASZc1PdYL
	/H0dB34LdM3WTeZa8bMcECYafeY0ciiKhmFQ7qnnfSrFlu+biMmzMWB7w29xynUhIqZv2qFR4gU/z
	NkBr6LsG1uxHJ2qwcM99/cIvz0YoGjo6AmBGnpY6cwvj0MH2D5GADApd0V8qnFrmz0+k=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-2n
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/16] wifi: mt76: keep one remain-on-channel request per interface
Date: Wed, 18 Nov 2026 17:18:18 +0100
Message-ID: <20261118161827.1208649-7-nbd@nbd.name>
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

mt76_remain_on_channel() only checks the target phy for a pending
request, so an interface can hold requests on two phys while
mvif->roc_phy names only one of them. mac80211 hands such a second
request to the driver when a late expiry ends a request that the
driver still runs. When the interface goes down, the other request is
not aborted, and its completion uses the freed interface:

  Unable to handle kernel paging request at virtual address 0002001400000048
  pc : mt7996_mcu_add_bss_info+0x124/0x4d8 [mt7996e]
  Call trace:
   mt7996_mcu_add_bss_info+0x124/0x4d8 [mt7996e]
   mt7996_vif_link_remove+0x98/0x1fc [mt7996e]
   mt76_put_vif_phy_link+0x3c/0x58 [mt76]
   mt76_roc_complete+0x60/0xb0 [mt76]
   mt76_roc_complete_work+0x28/0x40 [mt76]

Allow one request per interface across all phys, and only clear
mvif->roc_phy for the request it names.

Fixes: a8f424c1287c ("wifi: mt76: add multi-radio remain_on_channel functions")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 21 +++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 7847aafdbabd..0de7907b4fb4 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -360,6 +360,21 @@ bool mt76_phy_csa_active(struct mt76_phy *phy)
 	return data.active;
 }
 
+static struct mt76_phy *
+mt76_vif_roc_phy(struct mt76_dev *dev, struct ieee80211_vif *vif)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->phys); i++) {
+		struct mt76_phy *phy = dev->phys[i];
+
+		if (phy && phy->roc_vif == vif)
+			return phy;
+	}
+
+	return NULL;
+}
+
 void mt76_roc_complete(struct mt76_phy *phy)
 {
 	struct mt76_vif_link *mlink = phy->roc_link;
@@ -368,7 +383,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
 	if (!phy->roc_vif)
 		return;
 
-	if (mlink)
+	if (mlink && mlink->mvif->roc_phy == phy)
 		mlink->mvif->roc_phy = NULL;
 	if (phy->chanctx && phy->main_chandef.chan && phy->offchannel &&
 	    !test_bit(MT76_MCU_RESET, &dev->phy.state)) {
@@ -425,8 +440,8 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mutex);
 
-	if (phy->roc_vif || mt76_phy_scanning(phy) ||
-	    mt76_phy_csa_active(phy) ||
+	if (phy->roc_vif || mt76_vif_roc_phy(dev, vif) ||
+	    mt76_phy_scanning(phy) || mt76_phy_csa_active(phy) ||
 	    test_bit(MT76_MCU_RESET, &dev->phy.state) ||
 	    test_bit(MT76_RESTART, &dev->phy.state)) {
 		ret = -EBUSY;
-- 
2.47.3

