Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262970;
	b=Tpz1vcKoCWkIPDC1W3VSDa9Q2RP3XVh75O4EuheV+ClhXyKRfpB1lyKXthshJYSVW2A3
	 MiFAb+vQ+7ZDWG4LOpkR5h1X/Gu8f/wtGl7UFp6OUorCwPCZHk6WpSGuzBDUkT8BpLupH
	 cX/G+dEUwGPNXuS66FWlKuQ8utFISIftN0597QzdAXtMD/zzyOYMLomkulQmg9/6smG43
	 +S0kzvtPn6d9KZW3fi9ZqkDbcFfy6PTn552ln/6nOGtRfohdkoo7txnSti2QjaZmU491v
	 xezX4ZlD+6gPmk8NCWPKOrrigeaS3JBV5ImFEIFoqD1Zb2cigXbvCFHqPaLVMQAtu5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262970;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sS8u+RMpZbqaZKYxNrdDxqjiWkskGNcvDeJ9Q7fFHq0=;
	b=EN7Ca9JE+PpuFQwHXHfp1NY0lz4yj88mCZxHZyc2N+w39wYbW6a4f1CZAb9JolDX36Yv
	 3DiAHFYCh6mRyHeVNkdz+DbvzpzK7WzovwoW43wjBBE0St1lhZf6ireZyiUDupqENRHhj
	 np2RyqUGywUHTmeL1rdqZcEuhZwu5BZ/obQxb/qC2tMfZ82B+CzxnqnrThWLiLoHQGJxn
	 0+ww8Q3prj1OGI3Rdbjna/KDC9oDPs9wfA/JtkkUItEQibvsDjRrih/8esM+U+2tDuj2d
	 2397oAnFfq2WUl8Rz1xVVQoxVDJPJNbfu2D7uV0LOdAhmbOhAlObcm6+Pw0fjErA6mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="XH54ho/o";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55605606A330
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55605606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XH54ho/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sS8u+RMpZbqaZKYxNrdDxqjiWkskGNcvDeJ9Q7fFHq0=; b=XH54ho/oDRx7zzf3HCg20QzwBo
	ELKAoW9PUtLF47krHb35oTjGwOYXeF3qk0GmGQuxRosCqN6KwUho1I4Hjk3up4SLTmQW4rhVitd21
	+FUR6ljN31cwAEh6x3HcJBq4aderoiQsZY8dAPIhMpveSp9WagWhWVWnsIuD0YJwlzdU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuK-006Q1I-39
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/17] wifi: mt76: mt7925: keep the deflink wcid index until station removal
Date: Sat, 21 Nov 2026 13:09:13 +0100
Message-ID: <20261121120926.3603979-4-nbd@nbd.name>
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

Since mt7925_change_sta_links() was added, the driver frees the WLAN
index of msta->deflink.wcid, the wcid in drv_priv, when the link of
msta->deflink goes. A failed add of that link to a station that stays
frees its new index the same way. __mt76_sta_remove() frees the index
again when the station goes, also when another wcid holds it by then.
The next allocation then gives that WTBL entry to a second wcid.
Reachable when mac80211 deactivates the only link of a TDLS peer on an
MLD interface, since user space removes the peer later.

Leave the index of msta->deflink.wcid to __mt76_sta_remove(), which
then frees it once. The link removal still unpublishes and cleans up
the wcid, so no live pointer refers to the reserved index. This costs
one index for each station whose deflink link went, until the station
goes. mt7996 likewise keeps the index of a removed station link until
the station goes.

If a station loses every driver link and stays, the next link add takes
msta->deflink again. Give it the kept index then, and keep that index
when the add fails. The first add of a station still frees its index on
failure, since mac80211 removes nothing after a failed station add.

Fixes: 43aa4033eb18 ("wifi: mt76: mt7925: add mt7925_change_sta_links")
Fixes: 75e2d6bfd9ac ("wifi: mt76: mt7925: unwind WCID setup on link STA add failure")
Fixes: 9fc83205a62e ("wifi: mt76: mt7925: host-only unwind published links on add failure")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 30 +++++++++++++++----
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 534f412579b1..5a185d7422f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1078,6 +1078,12 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta);
 
+static bool
+mt7925_sta_link_idx_kept(struct mt792x_sta *msta, struct mt792x_link_sta *mlink)
+{
+	return mlink == &msta->deflink && msta->deflink_idx_kept;
+}
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1100,7 +1106,10 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (WARN_ON_ONCE(!mlink))
 		return -EINVAL;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
+	if (mt7925_sta_link_idx_kept(msta, mlink))
+		idx = mlink->wcid.idx;
+	else
+		idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
@@ -1213,7 +1222,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 		mt76_wcid_cleanup(mdev, wcid);
-		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+		if (!mt7925_sta_link_idx_kept(msta, mlink))
+			mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
 	}
 	return ret;
 }
@@ -1250,7 +1260,8 @@ mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
 		idx = mlink->wcid.idx;
 		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 		mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
-		mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+		if (!mt7925_sta_link_idx_kept(msta, mlink))
+			mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
 
 		if (mlink != &msta->deflink)
 			kfree_rcu(mlink, rcu_head);
@@ -1293,8 +1304,10 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			break;
 		}
 
-		if (is_deflink)
+		if (is_deflink) {
 			msta->deflink_id = link_id;
+			mt76_sta_txq_wcid_set(sta, mlink->wcid.idx);
+		}
 
 		rcu_assign_pointer(msta->link[link_id], mlink);
 		msta->valid_links |= BIT(link_id);
@@ -1321,6 +1334,8 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
 
+	msta->deflink_idx_kept = false;
+
 	if (ieee80211_vif_is_mld(vif)) {
 		msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 		msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
@@ -1497,6 +1512,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct ieee80211_link_sta *link_sta,
 				       struct mt792x_link_sta *mlink)
 {
+	struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt76_wcid *wcid = &mlink->wcid;
 	struct ieee80211_bss_conf *link_conf;
@@ -1534,7 +1550,11 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 	mt76_wcid_cleanup(mdev, wcid);
-	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	/* __mt76_sta_remove() frees the index of the embedded wcid */
+	if (mlink == &msta->deflink)
+		msta->deflink_idx_kept = true;
+	else
+		mt76_wcid_mask_clear(mdev->wcid_mask, idx);
 
 	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
 		mt7925_nan_peer_wcids_free(mdev, vif, link_sta->sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 10175875e76b..b142be13ab78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -151,6 +151,7 @@ struct mt792x_sta {
 	u16 valid_links;
 	u8 deflink_id;
 	u8 seclink_id;
+	bool deflink_idx_kept;
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
-- 
2.47.3

