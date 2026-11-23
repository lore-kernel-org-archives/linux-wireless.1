Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=jjW7qA0touQMmTKPyDiJu2aDD4NP1pIiJ/UmHypvM3g6mGadyvhl65rIgec6budMyHYq
	 BgE+u40kp4UdcXQVlDdEpJfB1Geodw5SV9G6Q9J7CZlpkIr8H+vwzAgYmmu/MoHaTIba/
	 ci4yHrXXCdSa69fBZAdPVBFwH+pptkBhgOOVnIMmyNZ/wOIr+OgX+Y2PW3gVtUuE6HJnf
	 9IL1ry5tNlq0hkp+JVV1AgvxUiBaPBoA8ggnw6JZC0sQyXFmK1Tj/wd6MwcamVJyeDIRC
	 kSBDBBFxHaSZFbX/T1iFk+c7REvcCOYnm4AwOiqr8VlXzVfSffDXxAPP/N5aavLqoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nz+tMF/P1erdLsk2YWhyRizpzEOuYr+ZV+DsPFeYc8Y=;
	b=uV9VUeAAcs0WETJflckE700aNbrkE8UwSfuah6elGFojbEMtcelGSxUoJG/xnQzVj+Xy
	 D58uN8ADGoBTvrHoEtZ4i9DvKT7+8SZgY+oQwQZPQphfLoDnT/NhyAw3oThvAakQe0/Dr
	 0LnuhJQP0omNF3h/U3YjoLBUoMXUsgWdfEVJbXFdOsCpl1xIKuMD8diVmRUfOep4quEnY
	 jMaCBfBSUm4svDVn3r8uJNsmeqJilgHCoAJbQ59gs2z4c5V4aD70D6rByOHreytQbn9k6
	 YT5RVpi1qRfdkgu0mXn/47v4PXX9T/1Zy+BSuJguBC4Ns8lWsA7Vve7uiyv5+SLy6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VwBN5GG5;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB909606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB909606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VwBN5GG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Nz+tMF/P1erdLsk2YWhyRizpzEOuYr+ZV+DsPFeYc8Y=; b=VwBN5GG5/9tS1MER87CiYFt7JF
	Vk8DYAOBErtUTpIxxupOJixRQPZGftD361tfOUwqCSno/0WDEDukkhlLDMEicYJHhMZq69uDSvquY
	8CowDwzPUmFuoQMfvPMWxubsto5E0kemNKwYllwWtlUW0nd0Dg84/bf4ANU6mAngUS2s=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ5-007NFk-2o
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:21 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/20] wifi: mt76: mt7925: undo the BSS of a failed interface add
Date: Mon, 23 Nov 2026 14:49:00 +0100
Message-ID: <20261123134920.154270-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

mt7925_mac_link_bss_add() publishes the wcid of the interface and takes
its vif_mask and omac_mask bits before it sends the firmware command,
and it undoes that setup for an allocated link alone. When the command
fails in mt7925_add_interface(), mac80211 calls no remove_interface, so
dev->mt76.wcid[] keeps naming the wcid inside vif->drv_priv, which
mac80211 frees with the interface, and the BSS index stays taken.

Undo the setup of the BSS in mt7925_add_interface() when the add
published its wcid. A failure before that point sets nothing up, and
the index it computed can belong to a P2P device. The add itself still
leaves the BSS of the embedded link set up for
mt7925_change_vif_links(), because the next association or
mt7925_remove_interface() removes that BSS later.

Fixes: ac03e5b82bc6 ("wifi: mt76: mt7925: Enhance mt7925_mac_link_bss_add to support MLO")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d99d86bf5be8..0908c22c3dff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -376,6 +376,16 @@ static int mt7925_start(struct ieee80211_hw *hw)
 	return err;
 }
 
+static void mt7925_mac_link_bss_unwind(struct mt792x_dev *dev,
+				       struct mt792x_bss_conf *mconf,
+				       struct mt792x_link_sta *mlink)
+{
+	rcu_assign_pointer(dev->mt76.wcid[mlink->wcid.idx], NULL);
+	mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
+	dev->mt76.vif_mask &= ~BIT_ULL(mconf->mt76.idx);
+	mconf->vif->phy->omac_mask &= ~BIT_ULL(mconf->mt76.omac_idx);
+}
+
 static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 				   struct ieee80211_bss_conf *link_conf,
 				   struct mt792x_link_sta *mlink)
@@ -449,12 +459,8 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
 					  &mlink->wcid, true);
 	if (ret) {
-		if (mconf != &mvif->bss_conf) {
-			rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-			mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
-			dev->mt76.vif_mask &= ~BIT_ULL(mconf->mt76.idx);
-			mvif->phy->omac_mask &= ~BIT_ULL(mconf->mt76.omac_idx);
-		}
+		if (mconf != &mvif->bss_conf)
+			mt7925_mac_link_bss_unwind(dev, mconf, mlink);
 		mt7925_p2p_bmc_remove(dev, mconf);
 		goto out;
 	}
@@ -496,8 +502,15 @@ mt7925_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mvif->mlo_pm_state = MT792x_MLO_LINK_DISASSOC;
 
 	ret = mt7925_mac_link_bss_add(dev, &vif->bss_conf, &mvif->sta.deflink);
-	if (ret < 0)
+	if (ret < 0) {
+		struct mt76_wcid *wcid = &mvif->sta.deflink.wcid;
+
+		/* mac80211 calls no remove_interface after a failed add */
+		if (rcu_access_pointer(dev->mt76.wcid[wcid->idx]) == wcid)
+			mt7925_mac_link_bss_unwind(dev, &mvif->bss_conf,
+						   &mvif->sta.deflink);
 		goto out;
+	}
 
 	vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
 	if (phy->chip_cap & MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN)
-- 
2.47.3

