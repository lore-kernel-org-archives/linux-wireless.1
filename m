Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628189;
	b=yBuaqcoam8RGMhqenVDCMz2V3z3pb1LrFiq8KYG9samgWafNtqFjNIBkbOmgebFp+wjk
	 DsvMp/Hw01fpeHOXZhBJqvHZEI4HVsLObnvVt1zQbtOhvcXwhPpWkQWZ+MzN1uuF8Iuy4
	 8z5jC608OsoKX7UAz1wyEihd7UBkLcIFFtak97F0aIelD1WMU2T2DO9NYRzrOX7zKsJuZ
	 H3/EBZpmqkFz7+IzNeQ8JEaRoK6h0zoxu8fTbpzEovXJ5/Z5/PYFB9OPhMkY+C+cxgmVY
	 koKHdH5hSN+d1Ku3ZbYunIbg9fWXwC0bQz4bSATXusd9K//qS/5bLLR9ZFnf7VwZY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628189;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b6FUKGBvyJJSdUC3KjhCN80EJT62PDbuUyexxagDjtU=;
	b=HOXz3wTOPTH4jWemUTtqgP16mMy8tOyEFvdcbHeEbDDUt3ipQVgzKvZ0cVPcSk4fdtqL
	 Hv7y8n5Ied8A3mgIzK0IjNP+WAw7IqkvcnLv9LHMVyNlsXtT+o0tHurpmLhtB1R9e+J0Z
	 ztEBQb/YCgw20JWgmHQODKzwsDdAK3aq+ABwMEReI5busVzSWlT3PQ+qmTyPXs3mmCzMn
	 AEOiPoBkxfCt+vTtjAqReCi+2XSV5jKt4oNWWptHl9GQxNHrVEjYyVEkvUdRFRo1ICKqi
	 r4fxceZIKv4v1ceFoVxvqiIJBxzl4ajICwJdlsIkatSQpD5eJg3GdtDUq/5qJgVZM9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=V62easH6;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F25606A687
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F25606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=V62easH6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b6FUKGBvyJJSdUC3KjhCN80EJT62PDbuUyexxagDjtU=; b=V62easH6hqXsS24EC1raCnIuWx
	pWK1+otVpON4Mpc/MgAt9Fx1qKpkaXGFjlhHGiMabPiSSyteL6j1mHcFbmq40m3rFdidtdhK+1K1l
	4HM2XnFRXg/vkf9DZteeSIf+MFgyUqFIZ3Ggr06h36K9z++ftBSn5DouR+Bvs8iFIeUY=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuy-008IWP-0m
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/18] wifi: mt76: mt7996: keep station wcids out of the duplicate WTBL range
Date: Wed, 25 Nov 2026 18:36:16 +0100
Message-ID: <20261125173616.3776951-18-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7996_mcu_set_dup_wtbl() places the duplicate WTBL range at the top of
the station range. mt7996_global_wcid_init() and
mt7996_mac_sta_init_link() still allocate wcids up to MT7996_WTBL_STA.
The firmware repeats each WTBL write of a wcid below the range size on
its duplicate entry. A station with an index in the range thus shares
its WTBL entry with the duplicate of another station. On the largest
tables the firmware also moves the range down, so the range it uses is
not the one that the driver sends.

Send the base that the firmware uses, and allocate station wcids below
it. This lowers the station capacity by the size of the range, and on
the largest tables by a few more indexes. mt7990 gets no range, so its
station range does not change.

Fixes: 7f3ec778593f ("wifi: mt76: mt7996: add duplicated WTBL command")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    |  5 ++---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 14 ++++++++++++++
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index ec20fc8d823b..18eab0eaaaad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1260,7 +1260,8 @@ static int mt7996_variant_fem_init(struct mt7996_dev *dev)
 
 int mt7996_global_wcid_init(struct mt7996_dev *dev)
 {
-	int idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
+	int idx = mt76_wcid_alloc(dev->mt76.wcid_mask,
+				  mt7996_wtbl_sta_limit(dev));
 
 	if (idx)
 		return -ENOSPC;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index bcae654a2b47..bcecd6558fda 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1378,7 +1378,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 	if (!phy)
 		return -EINVAL;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, mt7996_wtbl_sta_limit(dev));
 	if (idx < 0)
 		return -ENOSPC;
 
@@ -3110,7 +3110,8 @@ mt7996_net_fill_forward_path(struct ieee80211_hw *hw,
 	if (!msta_link)
 		return -EIO;
 
-	if (!msta_link->wcid.sta || msta_link->wcid.idx > MT7996_WTBL_STA)
+	if (!msta_link->wcid.sta ||
+	    msta_link->wcid.idx >= mt7996_wtbl_sta_limit(dev))
 		return -EIO;
 
 	if (dev->hif2 &&
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index f7c08bc4a588..e4fd4b672e22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -6008,7 +6008,6 @@ int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode)
 
 int mt7996_mcu_set_dup_wtbl(struct mt7996_dev *dev)
 {
-#define DUP_WTBL_NUM	80
 	struct {
 		u8 _rsv[4];
 
@@ -6020,8 +6019,8 @@ int mt7996_mcu_set_dup_wtbl(struct mt7996_dev *dev)
 	} __packed req = {
 		.tag = cpu_to_le16(UNI_CHIP_CONFIG_DUP_WTBL),
 		.len = cpu_to_le16(sizeof(req) - 4),
-		.base = cpu_to_le16(MT7996_WTBL_STA - DUP_WTBL_NUM + 1),
-		.num = cpu_to_le16(DUP_WTBL_NUM),
+		.base = cpu_to_le16(mt7996_dup_wtbl_base(dev)),
+		.num = cpu_to_le16(MT7996_DUP_WTBL_NUM),
 	};
 
 	if (is_mt7990(&dev->mt76))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index e6bf1151447f..1354bd82808c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -18,6 +18,7 @@
 #define MT7996_WTBL_RESERVED		(mt7996_wtbl_size(dev) - 1)
 #define MT7996_WTBL_STA			(MT7996_WTBL_RESERVED - \
 					 mt7996_max_interface_num(dev))
+#define MT7996_DUP_WTBL_NUM		80
 
 #define MT7996_WATCHDOG_TIME		(HZ / 10)
 #define MT7996_RESET_TIMEOUT		(30 * HZ)
@@ -872,6 +873,19 @@ static inline u16 mt7996_wtbl_size(struct mt7996_dev *dev)
 	return (dev->wtbl_size_group << 8) + MT7996_WTBL_BMC_SIZE;
 }
 
+static inline u16 mt7996_dup_wtbl_base(struct mt7996_dev *dev)
+{
+	return min_t(u16, MT7996_WTBL_STA + 1, 0x400) - MT7996_DUP_WTBL_NUM;
+}
+
+static inline u16 mt7996_wtbl_sta_limit(struct mt7996_dev *dev)
+{
+	if (is_mt7990(&dev->mt76))
+		return MT7996_WTBL_STA;
+
+	return mt7996_dup_wtbl_base(dev);
+}
+
 void mt7996_dual_hif_set_irq_mask(struct mt7996_dev *dev, bool write_reg,
 				  u32 clear, u32 set);
 
-- 
2.47.3

