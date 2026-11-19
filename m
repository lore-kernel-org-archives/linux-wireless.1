Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=fsbB0VKua5GbPy5I+hpA6l+s7+mUxbzuZ0N+ReXVggrbUHPjirKrP/03MIEUXWsZRwwc
	 4XAi3AijYytQ320cgVJ07YVq2VwpxusduRPd8TXAhBRM9/jh2OwYQCz5vR0dTnPUTqHuC
	 f1vByDZiiIaqo6EGwhniJp/xPfxq0SygNcV47QBXGH9UAfTvYQULqTWw9XAH/XI6pUdHO
	 /dD2XgygWf1Rbp1JsLVMkG9Ly3/V+QRitn9FpTriDQ0QgxTt5DS72S2sCqPI9JCcAnuzD
	 0LELHQAVYOT7gUEwGHmTn7sgx/5qPKQTnnx/W+vT38kPoP1WRsiGt8RnOTRpxo2CwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mTW8+mleSg/5G/y6ewlyPPtijcUvVcWCNBm4YH3NSRU=;
	b=yxLWkBVZlRjN+FQRAbdE6mA8XTxdBV3IBZ2Az1vFPR3bfHNwfInd3VPKuqpU83KQlfa+
	 ER281Q5PyLyZrBEUmMAW0Bc/rqEnWMBfMAz4yqQ6GhZYR1X3HsaYrnSnMh3CankuWzMdF
	 yXjWDvH2fnXsQ0j9qMPsr3QEQQ4EZhQN99dzUyctY/RsBxl2uA7soIrEvICXPWsc5RSD6
	 WIniGh3TOeuJbIRy4oheaaqQ2Cz1+vmxKTXaASuSq3b4NasYWIL3dF6GIA5Y9LHNn+8x9
	 5VGUNwzUT8/Qd43Is0HIIUnnuhskqZF1o2MFPhRhpSocyzjkpczna6j8Vtrjdm8GZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=J0Axp8x+;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F460A2600
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185F460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=J0Axp8x+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mTW8+mleSg/5G/y6ewlyPPtijcUvVcWCNBm4YH3NSRU=; b=J0Axp8x+IC2CjVNoJ/b3JqonsU
	BvkpxLw+kNRfe0z6h4ZsxknWNSsSRQkQbjV2D5GZbIHsdO7hOOWz9epu2WQmdrkRM+3w1jxla5ktG
	TeTQMGavIWTDuYuMbKPJkXYCV6wSzmkeDbrSiefrq9MZdYKJYOccCDK8VFeHwXWG2Jw4=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-1m
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/20] wifi: mt76: mt7996: drop the TWT agreements at a full reset
Date: Thu, 19 Nov 2026 13:43:43 +0100
Message-ID: <20261119124352.1842164-11-nbd@nbd.name>
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

The firmware that a full reset reloads holds no TWT agreement, but
mt7996_mac_full_reset() keeps those of the driver and only runs
INIT_LIST_HEAD() on dev->twt_list. The disassociation or the removal of
a station with a flow then corrupts the list.

Drop the TWT agreements of the driver at a full reset as well.

Fixes: 27015b6fbcca ("wifi: mt76: mt7996: enable full system reset support")
Fixes: ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index eb0f2dd7bb7f..db8ebbcafe13 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2493,6 +2493,7 @@ static void
 mt7996_mac_full_reset(struct mt7996_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
+	struct mt7996_twt_flow *flow, *tmp;
 	struct mt7996_phy *phy;
 	LIST_HEAD(list);
 	int i;
@@ -2537,7 +2538,16 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 		list_del_init(dev->sta_rc_list.next);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
-	INIT_LIST_HEAD(&dev->twt_list);
+	list_for_each_entry_safe(flow, tmp, &dev->twt_list, list) {
+		struct mt7996_sta_link *msta_link;
+
+		msta_link = container_of(flow, struct mt7996_sta_link,
+					 twt.flow[flow->id]);
+		msta_link->twt.flowid_mask &= ~BIT(flow->id);
+		list_del_init(&flow->list);
+	}
+	dev->twt.table_mask = 0;
+	dev->twt.n_agrt = 0;
 
 	spin_lock_bh(&dev->wed_rro.lock);
 	list_splice_init(&dev->wed_rro.poll_list, &list);
-- 
2.47.3

