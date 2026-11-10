Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280417;
	b=G5kYMz8JCsYxRg/hkIbTWzRTBffbAScOdeL75JH73jmnWoF78biNAgmpzGpJoMv7U1eh
	 IOEml2ZLN/odJ4sFwfyvExgowv172PX0lYcf2Nd1jqh8YFk9WKraN0MndB3BLg5QziUSA
	 bgYu/94CL23p4xMdAHPwcxRPqo04C6G19eOTx+qSJNvPbMytAITS9F2zqZnW2FvTx0pdg
	 XmI1FTFldAyNVan8etOSjQSE+1QSzyam0doY18XZbNYYrQ/R3Z/QxnxHGW5H5WlyBcVGB
	 sWqxvAkUP641zjTRJLaE78BOI5iluv2RC9wSnEb0GvJQA5TXVAK5RKIp+5Y0torKLsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280417;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=7H5UtNcHviCYGBonP2azZWOv9srx2QTyPR2V3JVqJtg=;
	b=OLje7uDfe32uyAGQkkbi9WTpFzzEj4jY/Awlo7ee3XBDzXVtjnuWttFGiijHAnS31bpz
	 YB0or5ECCLDVO2n7ZFquQv8FoE7hdeSsSTxuX8MsVaRrC4COufa4PF93UdhVVXKd1UBvz
	 Tp8U8zt55HPFbG6+2Ra97txMgbS4To+3/5OY5EFKcovTHput0fYBCTdZpLKK3E0nKNjKs
	 eApkZuN3pGPgiF76d4HCGDt63Y76g12KwbPNtVVVvm4thE5vh8mph8uTTieEFWNF4CSUc
	 1DnBccTn9ARC0GCIutIjS4LL9FJwj1rB8Z9WgBT08RMmAu2TiUFUVT9ZUl5LBPE0TFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uflqXTR3;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98360A3814
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD98360A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uflqXTR3
X-UUID: b4011f2edcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7H5UtNcHviCYGBonP2azZWOv9srx2QTyPR2V3JVqJtg=;
	b=uflqXTR3we7eErw9ff9T9CrQ0OrjKVwvdNYQYzMB7DTPYWnWz66PiWq+vCW5QIgbNUElwvAQYfQGZrqml2mCX9q0DjMKWrdfoCeQnMwkrzU48Fq16PqgX1ZmcbgkWzadrAtWGVHROV7pgQBt3JqUfHU+O8PRdUr5L+d64ZzfJA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f1ff5b52-058a-45c6-a208-4b6d52e290e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:051ec3ad-afa0-4bf3-b532-2de0befc3869,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4011f2edcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1241429613; Tue, 10 Nov 2026 11:13:29 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:29 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>,
	Allen Chien <yung-lun.chien@mediatek.com>
Subject: [PATCH 06/28] wifi: mt76: mt7925: factor out mt7925_mac_link_sta_free_wcid()
Date: Tue, 10 Nov 2026 11:12:22 +0800
Message-ID: <20261110031244.369014-7-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
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
Content-Type: text/plain
X-MTK: N

The host-side wcid unwind (clear the rcu wcid pointer, run
mt76_wcid_cleanup() and release the wcid mask bit) was open-coded in three
places. Pull it into a single helper and call it from all of them.

No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Co-developed-by: Allen Chien <yung-lun.chien@mediatek.com>
Signed-off-by: Allen Chien <yung-lun.chien@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4d593291a23a..a39ebc55afbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1001,6 +1001,17 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+/* Undo the host-side wcid publish done by mt7925_mac_link_sta_alloc(). */
+static void mt7925_mac_link_sta_free_wcid(struct mt76_dev *mdev,
+					  struct mt792x_link_sta *mlink)
+{
+	struct mt76_wcid *wcid = &mlink->wcid;
+
+	rcu_assign_pointer(mdev->wcid[wcid->idx], NULL);
+	mt76_wcid_cleanup(mdev, wcid);
+	mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
+}
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1131,13 +1142,8 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	if (pm_woken)
 		mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 out_wcid:
-	if (wcid_published) {
-		u16 idx = wcid->idx;
-
-		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-		mt76_wcid_cleanup(mdev, wcid);
-		mt76_wcid_mask_clear(mdev->wcid_mask, wcid->idx);
-	}
+	if (wcid_published)
+		mt7925_mac_link_sta_free_wcid(mdev, mlink);
 	return ret;
 }
 
@@ -1159,7 +1165,6 @@ mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
 
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt792x_link_sta *mlink;
-		u16 idx;
 
 		mlink = rcu_replace_pointer(msta->link[link_id], NULL,
 					    lockdep_is_held(&dev->mt76.mutex));
@@ -1170,10 +1175,7 @@ mt7925_mac_sta_unwind_links_host(struct mt792x_dev *dev,
 		if (msta->deflink_id == link_id)
 			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 
-		idx = mlink->wcid.idx;
-		rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-		mt76_wcid_cleanup(&dev->mt76, &mlink->wcid);
-		mt76_wcid_mask_clear(dev->mt76.wcid_mask, idx);
+		mt7925_mac_link_sta_free_wcid(&dev->mt76, mlink);
 
 		if (mlink != &msta->deflink)
 			kfree_rcu(mlink, rcu_head);
@@ -1385,7 +1387,6 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	struct mt76_wcid *wcid = &mlink->wcid;
 	struct ieee80211_bss_conf *link_conf;
 	u8 link_id = link_sta->link_id;
-	u16 idx = wcid->idx;
 
 	mt7925_roc_abort_sync(dev);
 
@@ -1416,9 +1417,7 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 		list_del_init(&mlink->wcid.poll_list);
 	spin_unlock_bh(&mdev->sta_poll_lock);
 
-	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
-	mt76_wcid_cleanup(mdev, wcid);
-	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	mt7925_mac_link_sta_free_wcid(mdev, mlink);
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
-- 
2.45.2

