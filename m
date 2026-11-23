Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=Ceu/F7bRHH4bcCUA22dZJ+O5xVDDzpelDB9XnNzsrI3hQnexHuZH1Eh5z2+FVHd55uJe
	 SjdpZJbMajJorslNM8HK3OvlEPgLTZmRD5XScbsbF9MWDkXWLQRpH0Ge5oiLrjnixGB42
	 HqTQAml90t+/kWDGDZHqdQs2pxST1Ap9aZqRstjLw9SHBC2ZQtBYRB7/B9pRUubGluYhM
	 aspr9tCbiZ7KAGvDUVTG2cMIPU/YeYzX/EZLU/+ksaBjENauZDsB8lQPWIksyK83B7saF
	 qBoQbZIKk6oxPDL/b8Q7omwQGg8bN3p14oHwEd/pi+OS6B948AdV1/LD3+hgvuAKl6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cAB3hDUAwcQSMy2wKxfkF09Ki0dKvgc4QVbbQKlTgkI=;
	b=osE7SgvkBWR9+qADXbKVNAix4FoHtxmChypZcYJuuSe96RdIT46ddyYO0c3+mN0Zchxd
	 JCLe3s5B9qtZPhhsUureeHIV2Le4xNjs81EBO0zdvh365s5UZrgu7Abzh87ch2U05ilKh
	 9vFOb9hhfnnsPTqwCwjZB3+s2nh/XLDLmBngWhurmFfFBhWpjjZsv2IF2pphleXGqZMKw
	 /Fl7Lkgd/kbFMmnjAkfc0XUQ27mxYV9hJtbh3lI0noM5Nu8lrqYX/KlWOj5u0S4tgLR4y
	 Le+gxuDFqIeXnXZilzVE5U+KNQD+GVXbxIRkcvTDSU85vVInkVjQGyo7QcdU1gKCclA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="Sm5qhcN/";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874B606A332
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B874B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Sm5qhcN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cAB3hDUAwcQSMy2wKxfkF09Ki0dKvgc4QVbbQKlTgkI=; b=Sm5qhcN/+QI7c0BnPsb9EVaCuE
	DM1dJgSHX9ZVQEejXiiid1jEACKkfzKN90rCZJMDqBpA0ghD85dynNkfaGFE2cso/gLUHxNTRXBTS
	O7JRcKLd7w3sDLBPAuVVnPMbY4VMjLL6tbne2jbSVQnOiIqM8LcQq2pyDxbtEDaRmI60=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-1E
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/20] wifi: mt76: mt7996: clear the ADM counters only in the airtime poll
Date: Mon, 23 Nov 2026 14:49:09 +0100
Message-ID: <20261123134920.154270-10-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

The driver clears the ADM counters of a WTBL entry with a
read-modify-write of MT_WTBL_UPDATE. It does so at each vif link add,
station link add and MLD link removal, and for every entry in
mt7996_mac_init(). The WM firmware writes the same register at any time
for its own WTBL updates. A host write that meets one in progress can
change the entry or the word of that update.

Leave these clears to the firmware. It clears the counters of each
entry at every WM start and at a station disconnect. At the MLD
teardown it clears them for every link wcid of the peer group, which
also holds a link that the driver removed earlier. A link that comes
back keeps its wcid and its last read, and a new station link starts
from a last read of 0.

Keep the clear of mt7996_mac_sta_poll() before a counter overflows,
since nothing else clears the counters while a station stays connected.
That clear keeps the race. The reads of the poll through the WTBL
window keep a similar race on the window register.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 4 ----
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 6 +-----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index a6168f36794f..e82bc9cbc59e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -626,10 +626,6 @@ void mt7996_mac_init(struct mt7996_dev *dev)
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
 
-	for (i = 0; i < mt7996_wtbl_size(dev); i++)
-		mt7996_mac_wtbl_update(dev, i,
-				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-
 	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
 		i = dev->mphy.leds.pin ? MT_LED_GPIO_MUX3 : MT_LED_GPIO_MUX2;
 		mt76_rmw_field(dev, i, MT_LED_GPIO_SEL_MASK, 4);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e883a58844e9..f2bc33db35fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -450,8 +450,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
 
-	mt7996_sta_link_airtime_clear(dev, msta_link);
-
 	if (vif->type != NL80211_IFTYPE_AP &&
 	    (!mlink->omac_idx || mlink->omac_idx > 3))
 		vif->offload_flags = 0;
@@ -1363,7 +1361,7 @@ mt7996_mac_sta_init_link(struct mt7996_dev *dev,
 
 	rcu_assign_pointer(msta->link[link_id], msta_link);
 
-	mt7996_sta_link_airtime_clear(dev, msta_link);
+	memset(msta_link->airtime_ac, 0, sizeof(msta_link->airtime_ac));
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], &msta_link->wcid);
 	mt76_wcid_init(&msta_link->wcid, phy->mt76->band_idx);
@@ -1397,8 +1395,6 @@ void mt7996_mac_sta_remove_link(struct mt7996_dev *dev,
 	mt76_wcid_cleanup(&dev->mt76, &msta_link->wcid);
 
 	if (msta_link->wcid.link_valid) {
-		mt7996_sta_link_airtime_clear(dev, msta_link);
-
 		mt7996_sta_deflink_release(dev, sta, link_id);
 		msta_link->wcid.link_valid = false;
 		/* the firmware keeps the link pair of its last MLD setup */
-- 
2.47.3

