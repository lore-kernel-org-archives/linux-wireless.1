Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092252;
	b=mPcDttDyUmtbgeenRR+oZ4fqXONBu7N3v30ChKmkehWxDvhD9uSsjJop1aUXXO6rgDqj
	 jLs+7aOKAnTLeCAHiB7N4myORxTpjoNJRGmrQ/XgD9i0w8G62KbCNsrAdA8zdNByoM1S4
	 jM4fLa6ylY7S/RCeJZy9woOprvG32yy0lh6YhwC4Jq8rtIgoRQwpvIq3QmsGR7ypuGXx3
	 UWKxsCVjygwG+jsN8exHwxHPn/aB7plMfYKu4FXngdbLko+Ec8ywjYAyBOAVv7BDUFhaQ
	 tmVYUjX19Rsr1OhxvY878SUaLzVSDFhtwle2EnHi6AZhwO7TWIFCEG92Nuth7+RAWMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092252;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0mOs1N47Wk7rWpQEJG4ugP+mkBxqezEkMFAOGepD7v8=;
	b=oILp0TC72TFM9mCfuqERtlXQ560OPgh1pqoMOD3my05OvM7b3RC/enLuZDrVio/5nSfQ
	 au8lFLeOog5Gc/wEzHlInjcp5S1tMa9kZl3G00hOMIPpm8a2HlwrBwF/5QaHYiaNt53Tl
	 1G8r6d8L63p8MC343a56Dc8+hgYbZlTgc7BpP7m66CMLSdIjR7PwmGVtkgdhD0nGEJBfT
	 Fmuv4p1xZhSgqXb2s0C+mhkqA3yEBkE+2CALB4aY5sEtVRil3TEg+sWvSXHj+F97YJi8m
	 78JYXzQ58b7NaIscGCdTwu15LwEablmZlEb3U5fMHEj0MSmYctV409WCwFOmhaCHg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=buD4dSt6;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364460A2613
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A364460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=buD4dSt6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0mOs1N47Wk7rWpQEJG4ugP+mkBxqezEkMFAOGepD7v8=; b=buD4dSt6Ms7AL46R8yWXOQXrA4
	QYZejldK41KL3SUyJssswMasiKZuXkug4xzr2iKYXINRF21jqlLdhEbn1mUD6TIfNwM8DKrDNxF9z
	V3AHZgY85q+I3aMzEYoXUbW3NRetvYkT1aeNzpOz5Kraom5pVDpZCXWylsjuyMgpedsg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-0A
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/20] wifi: mt76: mt7915: publish the global wcid again after a full reset
Date: Thu, 19 Nov 2026 13:43:46 +0100
Message-ID: <20261119124352.1842164-14-nbd@nbd.name>
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
mt7915_mac_full_reset() only allocates its index again. A frame on the
global wcid that requests a TX status then reports no ACK, since
mt76_tx_status_skb_add() does not find the wcid in dev->wcid[].

Set up the global wcid in the full reset as at probe time.

Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardware restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 29 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  3 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 358c45acf79b..6d09718ec585 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -865,10 +865,25 @@ static bool mt7915_band_config(struct mt7915_dev *dev)
 	return ret;
 }
 
+int mt7915_global_wcid_init(struct mt7915_dev *dev)
+{
+	int idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
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
 static int
 mt7915_init_hardware(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 {
-	int ret, idx;
+	int ret;
 
 	mt76_wr(dev, MT_INT_MASK_CSR, 0);
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
@@ -895,17 +910,7 @@ mt7915_init_hardware(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 			return ret;
 	}
 
-	/* Beacon and mgmt frames should occupy wcid 0 */
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
-	if (idx)
-		return -ENOSPC;
-
-	dev->mt76.global_wcid.idx = idx;
-	dev->mt76.global_wcid.hw_key_idx = -1;
-	dev->mt76.global_wcid.tx_info |= MT_WCID_TX_INFO_SET;
-	rcu_assign_pointer(dev->mt76.wcid[idx], &dev->mt76.global_wcid);
-
-	return 0;
+	return mt7915_global_wcid_init(dev);
 }
 
 void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 6e2b26017692..0c03199a55a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1487,8 +1487,7 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 	dev->twt.table_mask = 0;
 	dev->twt.n_agrt = 0;
 
-	i = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
-	dev->mt76.global_wcid.idx = i;
+	mt7915_global_wcid_init(dev);
 	dev->recovery.hw_full_reset = false;
 
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index ec1d10832b27..1a0aeed5073e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -455,6 +455,7 @@ u32 mt7915_wed_init_buf(void *ptr, dma_addr_t phys, int token_id);
 
 int mt7915_register_device(struct mt7915_dev *dev);
 void mt7915_unregister_device(struct mt7915_dev *dev);
+int mt7915_global_wcid_init(struct mt7915_dev *dev);
 int mt7915_eeprom_init(struct mt7915_dev *dev);
 void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *dev,
 				struct mt7915_phy *phy);
-- 
2.47.3

