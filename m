Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=P60oR5AwiDVai3GB0QAx2bhza1VNV8tpt3hgU496wXGFAh4lQWHBi7zkxYPOloM0TJvi
	 jdO8VDarBLi4G8H+uHAJ8YFb5ZEdmhBnvTMIxYVpme3Z4zuv5ILXuS7T+l21Zq+tJk/qT
	 S/yP68BanIjlDC30yCt2lOucwyC3C8gEZ7jjG2tFfeWGec2IMhXKEb/ep61nliBmlCXsE
	 HfP/HJ+U8to31UGyO98SxVM5xv6T0yjQmoBxCOYFfcDh5THx2FynX1htbu56BswEm6dbi
	 xFMo41BEeaZBufXFBSOfNPszrdvm3FBQfDRJEOMY5rO83NT+IqB6sGxqVZcmdmdsrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0clXHTxSBWQcaxmW8kdaMvUmLcUFskYXc90c5KIGml0=;
	b=U0myHGh+dbkA1BJjpEzVqBaLb33CRaUV/ELnywXHSCdG0qf26iBu954mSUcBM68JkrGP
	 SFhPWGR7QtjjPEuWa4R+PeNhIp/BGOjOPuKGdS0HY0wAfNCWFzYUsJ0SU8R1BVrxiPekR
	 Nrq208wFv53PguLS4M/lQ/bUMd9Fwfc0qeXWC1EPmYSqo6SOfxLXTij7aSVZa1xD0gaGH
	 2bfiE41B+UuawDPRqrcoF1w39Mcvn9u3CD+9HyNiV0rHU2NpeeFYDUijmFsbF8weVab7V
	 SkYSwLvKD0CucOxLSBWxhmyuVbq8+veUV6fMnBEQXk+pUf21+1UZp/LAEsEX0Vt1wjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mLrzE3ih;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A3606A32C
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mLrzE3ih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0clXHTxSBWQcaxmW8kdaMvUmLcUFskYXc90c5KIGml0=; b=mLrzE3ih/a6W1eRYI+GgAeJuEX
	7ocVc6M/dCqpABrm+yZigJUUUIwWz0hZUqpC6dqyNIjfIvWdqmuhVNJ3dyuMyjrJDEc0ndXoHqqw2
	DLdATFFHZCxpu4g9+O24iX0BsCbtP73h4xa9TWlLfrqNB3F/6cAESe2szpYHHZef0O/g=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuK-006Q1I-2f
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/17] wifi: mt76: mt7925: move the default link to a remaining link
Date: Sat, 21 Nov 2026 13:09:12 +0100
Message-ID: <20261121120926.3603979-3-nbd@nbd.name>
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

mt7925_change_sta_links() can remove the default link of an MLD
station, but no remaining link takes its place. The TXQs of the station
keep the index of the removed wcid, so mt76_txq_schedule_list() skips
them. The data of the station stays queued until another wcid takes the
index, and then goes out on that wcid.

Make a remaining link the default link before the old one goes. Send
the TXQs and the frames without a link on it. Keep def_wcid on the
embedded wcid, which holds the RX PN, reorder and aggregation state,
like mt7996_sta_deflink_release(). Take the primary of STA_REC_MLD and
of a link add from the default link. After a move, that is no longer
the embedded wcid.

Also drop a frame whose link the driver no longer holds. A frame
without a link can now look up the default link while that link goes.

This is currently not reachable. On a station interface,
mt7925_can_activate_links() keeps the default link active, and an AP
MLD has one link, because mt7925_change_vif_links() fails its second
ADD_LINK. Found by inspection.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 46 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 31 ++++++++-----
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  3 +-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  6 +++
 4 files changed, 59 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index fa5628c06b04..534f412579b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1134,7 +1134,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
-	is_secondary_link_sta = ieee80211_vif_is_mld(vif) && link_sta != mlink->pri_link;
+	is_secondary_link_sta = ieee80211_vif_is_mld(vif) &&
+				msta->deflink_id != IEEE80211_LINK_UNSPECIFIED;
 
 	/* NAN_DATA (NDI) peers skip association - fill link_sta caps
 	 * from sband and push BSS_INFO with correct phymode + RLM.
@@ -1172,22 +1173,18 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 		if (ret)
 			goto out_pm;
 	} else {
+		struct ieee80211_link_sta *pri_link_sta;
 		struct mt792x_link_sta *pri_mlink;
-		struct mt76_wcid *pri_wcid;
 
-		/* alternative lookup via def_wcid */
-		pri_wcid = mlink->wcid.def_wcid;
-
-		pri_mlink = pri_wcid ?
-			    container_of(pri_wcid, struct mt792x_link_sta, wcid) :
-			    NULL;
-
-		if (WARN_ON_ONCE(!pri_mlink)) {
+		pri_link_sta = mt792x_sta_to_link_sta(vif, link_sta->sta,
+						      msta->deflink_id);
+		pri_mlink = mt792x_sta_to_link(msta, msta->deflink_id);
+		if (WARN_ON_ONCE(!pri_link_sta || !pri_mlink)) {
 			ret = -EINVAL;
 			goto out_pm;
 		}
 
-		ret = mt7925_mcu_sta_update(dev, mlink->pri_link, vif,
+		ret = mt7925_mcu_sta_update(dev, pri_link_sta, vif,
 					    pri_mlink, true,
 					    MT76_STA_INFO_STATE_ASSOC, mlink);
 		if (ret)
@@ -1286,7 +1283,6 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		}
 
 		mlink->sta = msta;
-		mlink->pri_link = &sta->deflink;
 		mlink->wcid.def_wcid = &msta->deflink.wcid;
 
 		link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
@@ -1327,6 +1323,7 @@ int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+		msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
 
 		err = mt7925_mac_sta_add_links(dev, vif, sta, sta->valid_links);
 	} else {
@@ -1545,11 +1542,32 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
+static void
+mt7925_mac_sta_deflink_move(struct ieee80211_sta *sta, unsigned long links)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_link_sta *mlink;
+	unsigned int link_id;
+
+	/* prefer the secondary of the firmware's MLD record, so that the TXDs
+	 * keep naming a link of its pair until a link add sends a new record
+	 */
+	if (links & BIT(msta->seclink_id))
+		link_id = msta->seclink_id;
+	else
+		link_id = __ffs(links);
+
+	mlink = mt792x_sta_to_link(msta, link_id);
+	msta->deflink_id = link_id;
+	mt76_sta_txq_wcid_set(sta, mlink->wcid.idx);
+}
+
 static int
 mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, unsigned long old_links)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long links = msta->valid_links & ~old_links;
 	struct mt76_dev *mdev = &dev->mt76;
 	unsigned int link_id;
 
@@ -1593,6 +1611,9 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 					link_sta, false);
 	}
 
+	if (links && (old_links & BIT(msta->deflink_id)))
+		mt7925_mac_sta_deflink_move(sta, links);
+
 	for_each_set_bit(link_id, &old_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct ieee80211_link_sta *link_sta;
 		struct mt792x_link_sta *mlink;
@@ -1608,7 +1629,6 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 
 		msta->valid_links &= ~BIT(link_id);
 		mlink->sta = NULL;
-		mlink->pri_link = NULL;
 
 		mt7925_mac_link_sta_remove(&dev->mt76, vif, link_sta, mlink);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5df5a315c4b9..a8faf76b5d0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2227,24 +2227,28 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_link_sta *mlink_pri = NULL;
+	struct mt792x_bss_conf *mconf_pri = NULL;
 	struct mt792x_dev *dev = mvif->phy->dev;
 	unsigned long valid = msta->valid_links;
-	struct mt792x_bss_conf *mconf_pri;
 	struct sta_rec_mld *mld;
 	unsigned int link_id;
 	struct tlv *tlv;
 	u8 max_links;
 	u8 cnt = 0;
 
-	/* Primary link always uses driver's deflink WCID. */
-	mconf_pri = (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED) ?
-		    mt792x_vif_to_link(mvif, msta->deflink_id) : NULL;
+	if (msta->deflink_id != IEEE80211_LINK_UNSPECIFIED) {
+		mlink_pri = mt792x_sta_to_link(msta, msta->deflink_id);
+		mconf_pri = mt792x_vif_to_link(mvif, msta->deflink_id);
+	}
 
 	/* If caller is operating on deflink, reuse its mconf as primary. */
-	if (!mconf_pri && mlink == &msta->deflink)
+	if (!mlink_pri && mlink == &msta->deflink) {
+		mlink_pri = mlink;
 		mconf_pri = mconf;
+	}
 
-	if (!mconf_pri) {
+	if (!mlink_pri) {
 		dev_warn_ratelimited(dev->mt76.dev,
 				     "mt7925: MLD_TLV_LINK skip (no primary mconf) sta=%pM\n",
 			sta->addr);
@@ -2255,19 +2259,20 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 	mld = (struct sta_rec_mld *)tlv;
 	memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
 
-	mld->primary_id = cpu_to_le16(msta->deflink.wcid.idx);
-	mld->wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->primary_id = cpu_to_le16(mlink_pri->wcid.idx);
+	mld->wlan_id = cpu_to_le16(mlink_pri->wcid.idx);
 
 	/* Always encode primary link first. */
-	mld->link[cnt].wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->link[cnt].wlan_id = cpu_to_le16(mlink_pri->wcid.idx);
 	mld->link[cnt++].bss_idx = mconf_pri->mt76.idx;
 
 	max_links = ARRAY_SIZE(mld->link);
 
 	/* A link being added is not set in msta->valid_links yet */
-	if (pending && pending != &msta->deflink)
+	if (pending && pending != mlink_pri)
 		valid |= BIT(pending->wcid.link_id);
 
+	msta->seclink_id = IEEE80211_LINK_UNSPECIFIED;
 	for_each_set_bit(link_id, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt792x_link_sta *mlink_sec;
 		struct mt792x_bss_conf *mconf_sec;
@@ -2281,7 +2286,7 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		mlink_sec = mt792x_sta_to_link(msta, link_id);
 		if (!mlink_sec && pending && link_id == pending->wcid.link_id)
 			mlink_sec = pending;
-		if (!mlink_sec || mlink_sec == &msta->deflink)
+		if (!mlink_sec || mlink_sec == mlink_pri)
 			continue;
 
 		mconf_sec = rcu_dereference_protected(mvif->link_conf[link_id],
@@ -2289,8 +2294,10 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		if (!mconf_sec)
 			continue;
 
-		if (cnt == 1)
+		if (cnt == 1) {
 			mld->secondary_id = cpu_to_le16(mlink_sec->wcid.idx);
+			msta->seclink_id = link_id;
+		}
 
 		mld->link[cnt].wlan_id = cpu_to_le16(mlink_sec->wcid.idx);
 		mld->link[cnt++].bss_idx = mconf_sec->mt76.idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index e37d901575e5..10175875e76b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -125,8 +125,6 @@ struct mt792x_link_sta {
 	struct mt76_connac_sta_key_conf bip;
 
 	struct mt792x_sta *sta;
-
-	struct ieee80211_link_sta *pri_link;
 };
 
 struct mt792x_sta_nan_sched {
@@ -152,6 +150,7 @@ struct mt792x_sta {
 
 	u16 valid_links;
 	u8 deflink_id;
+	u8 seclink_id;
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 5743c5437863..8dbc5e84cd48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -195,7 +195,13 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		link_id = u32_get_bits(info->control.flags,
 				       IEEE80211_TX_CTRL_MLO_LINK);
 		sta = (struct mt792x_sta *)control->sta->drv_priv;
+		if (link_id >= IEEE80211_LINK_UNSPECIFIED)
+			link_id = sta->deflink_id;
 		mlink = mt792x_sta_to_link(sta, link_id);
+		if (!mlink) {
+			ieee80211_free_txskb(hw, skb);
+			return;
+		}
 		wcid = &mlink->wcid;
 	}
 
-- 
2.47.3

