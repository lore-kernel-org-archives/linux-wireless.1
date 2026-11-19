Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=TxiCAEMs+QrGliNq+GpcPQgM+bLJ6jzLR2788Qdzy6HFzUuasGEl7uBqz/qNKX2XlSv/
	 WgDgE+pr7FehYH0vfjvzNzPbkWOS79Tm633tpenDqkWZOyWo8W/36++aF9muK49Q2UZ3w
	 OfCaATdCHfGz52ke73qh8+Ulsudvd3WOp9uWVZu0QMMDG5sKgZ8F4sWoTyXY/vFQ6eB/Y
	 mDE/X9ha8jvM615IBiqhzSs6VtYSeSZDb/EDIfsVqzf6Ygaj4766n7coFb1ZtnGiliN83
	 Vg7ueYAdnc6qxMIWb8HiqXtyWmlMsjrmYwUUqJtxI59rVgc2cXV6XbNBxwvdLsvtAFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vcEAKLycSR9kD+nQ2L7Ffa3WPYERGXBtLGCxkfbRVB8=;
	b=1tB8my0Th7AcefQsEtJQF6q1XusCzbhwcs2xfX2Ua83WGdI+imlPAfcS7qbVHnl9vjCN
	 hulCS1Us1ApZVkRYw3e0ci38X2ptZVlCKr+vdj6dCL+GZ9qtRxTkWApzmf9n2N+4X78cE
	 YOA2iZV+QEgp4XDZHvpJoF48pO8c5kLFXSYWpSUoRYcDgKuM4Xx+vD3rBxN4BS9PJOjXz
	 FQfWbPLThVEfHa200E9KUcvu+8S5aPFd5IlskdS6S2/Nbd/ojNDzIVxwWvmgHYB4DHTMj
	 hSbFhpsnWvok20PI16XT+yZt2CjJwyiYnppWz440kR701kSQy/5ic31xUvEFYbZeXrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YyfbXkbU;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E360A2616
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65E360A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YyfbXkbU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vcEAKLycSR9kD+nQ2L7Ffa3WPYERGXBtLGCxkfbRVB8=; b=YyfbXkbUTyf2/pNYsLy9z/PP9d
	sZ9THydfpeB/6e9ZHmtBlpQHG5AJtDObTtvDbtgq+wOaX6URPdNIoLfG70iaxd7Kw9Sd4b53A8q8z
	PoJEwxgx8s6nE076Bhy5YX8CdPVNPSbR3v/b8c/fflk99GdiorXVqExZAYtd6LlY7bAo=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-0i
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 15/20] wifi: mt76: mt7996: publish the global wcid again after a full reset
Date: Thu, 19 Nov 2026 13:43:47 +0100
Message-ID: <20261119124352.1842164-15-nbd@nbd.name>
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

After a full reset, dev->wcid[] no longer holds the global wcid.
mt76_reset_device() unpublishes it with every other wcid, and
mt7996_mac_full_reset() only allocates its index again. A frame on the
global wcid that requests a TX status then reports no ACK, since
mt76_tx_status_skb_add() does not find the wcid in dev->wcid[].

Set up the global wcid in the full reset as at probe time.

Fixes: ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 29 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  3 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 +
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 655023578b3e..a6168f36794f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1265,9 +1265,24 @@ static int mt7996_variant_fem_init(struct mt7996_dev *dev)
 	return 0;
 }
 
+int mt7996_global_wcid_init(struct mt7996_dev *dev)
+{
+	int idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
+
+	if (idx)
+		return -ENOSPC;
+
+	dev->mt76.global_wcid.idx = idx;
+	dev->mt76.global_wcid.hw_key_idx = -1;
+	dev->mt76.global_wcid.tx_info |= MT_WCID_TX_INFO_SET;
+	rcu_assign_pointer(dev->mt76.wcid[idx], &dev->mt76.global_wcid);
+
+	return 0;
+}
+
 static int mt7996_init_hardware(struct mt7996_dev *dev)
 {
-	int ret, idx;
+	int ret;
 
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
 	if (is_mt7992(&dev->mt76)) {
@@ -1306,17 +1321,7 @@ static int mt7996_init_hardware(struct mt7996_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	/* Beacon and mgmt frames should occupy wcid 0 */
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
-	if (idx)
-		return -ENOSPC;
-
-	dev->mt76.global_wcid.idx = idx;
-	dev->mt76.global_wcid.hw_key_idx = -1;
-	dev->mt76.global_wcid.tx_info |= MT_WCID_TX_INFO_SET;
-	rcu_assign_pointer(dev->mt76.wcid[idx], &dev->mt76.global_wcid);
-
-	return 0;
+	return mt7996_global_wcid_init(dev);
 }
 
 void mt7996_set_stream_vht_txbf_caps(struct mt7996_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index db8ebbcafe13..751aaacee7a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2562,8 +2562,7 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 		kfree(e);
 	}
 
-	i = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
-	dev->mt76.global_wcid.idx = i;
+	mt7996_global_wcid_init(dev);
 	dev->recovery.hw_full_reset = false;
 
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 0c6a3dba2e03..24048a5ede31 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -711,6 +711,7 @@ irqreturn_t mt7996_irq_handler(int irq, void *dev_instance);
 u64 __mt7996_get_tsf(struct ieee80211_hw *hw, struct mt7996_vif_link *link);
 int mt7996_register_device(struct mt7996_dev *dev);
 void mt7996_unregister_device(struct mt7996_dev *dev);
+int mt7996_global_wcid_init(struct mt7996_dev *dev);
 int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 			struct ieee80211_bss_conf *link_conf,
 			struct mt76_vif_link *mlink);
-- 
2.47.3

