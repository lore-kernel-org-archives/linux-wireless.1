Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280425;
	b=K2Qv3Y0EgW4HoyRzO6C1AsMKj+bxJLMl3iiawr3ROTLdhl4HGb7CsuQKsXng1eDzqIfL
	 w7QNlgfq1ToWAJdQaFYXPMeQW+d4y0TxRlweU//P2cDRRqOm8BZhC4War2zb8YCOzYREy
	 V5A32C1uJRyrxpUimvGaW2stbLT0RwBTt00amta3HD+1fFZJ9DIprYpRiSPzoCzvKDvRN
	 Cks/A8uXIU0GXScfDd8hifpDjKstQ+aSfcg27WqXh4xtMTCdP6EIHWCf8p3g25sKMzWgb
	 7crJtr3HZmDUDHjG9NrmwkV07EJqSMb04hL69NCQ+XKUKN9w1X5yzKJM3nymGRc5l9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280425;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=vc0krJKS1jb6X6mDS6QkL0ncMZIBoDhUCsXuAtLZ9LM=;
	b=gcXbo/XzxF1dfNWZly1mVOCbs0mB0yGvMptTCUW4v7Z6Asof9U1wOCjfUs+LEtX50Nch
	 2bArLGlG6+5rvFrIDEZg/yzbAVrbZ8wBwxamKIVwPoaP7pTNsmSbSCOUdu5KQN3noQmCp
	 lEvNDH9420YzW4N90I5x7s34/FmvT8FcyBoSldgs1M5CGQHiBLKHX6/72fpDW4avFt5/U
	 /52YC7NNjK3JtVymtMXm5PVfmXYjzq5aiMBTPcYZCq6fom/53JnQABbAdTwr0+b1vlxVJ
	 QFlw1z8YCq6enHeN4cdo5+KpBDJL1R9JFR4qtTNe8Poi/CoebhosAWW9daTth+gketw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="E3Bi6GF/";
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65D60A3831
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C65D60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=E3Bi6GF/
X-UUID: b841bd82dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vc0krJKS1jb6X6mDS6QkL0ncMZIBoDhUCsXuAtLZ9LM=;
	b=E3Bi6GF/raFgrCxVIYeMxstOoEVu3oUL/0JVS9268Dt8dNffnX1IZ3Pwtdl7vbfNy1v+D1igiUCf6DFbWotM5a0J93gn0ZSozJoisIchEGUfwUGNwETJI28nYEjsfsalxqrKgW1o6/s7JfUvz8dOhA5eIeLEaQ1+8QLi4DNrmFU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:46756822-5119-4a2a-8cca-7b33aa8dda91,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f0af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b841bd82dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 992964744; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:35 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 22/28] wifi: mt76: mt7925: add mt7925_set_links_key_iter() helper
Date: Tue, 10 Nov 2026 11:12:38 +0800
Message-ID: <20261110031244.369014-23-emery.hsin@mediatek.com>
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

Add a key iterator that (re)installs the existing keys on a given set of
MLO links, used when later links are brought up after the first key was
already programmed on the primary link.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0bff5863e01e..45d656cfee21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1377,6 +1377,35 @@ mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
 	ieee80211_set_active_links_async(vif, sel_links);
 }
 
+struct mt7925_set_links_key_iter {
+	unsigned long links;
+};
+
+/* Install the existing keys on the given links. */
+static void
+mt7925_set_links_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			  struct ieee80211_sta *sta,
+			  struct ieee80211_key_conf *key, void *data)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
+				 &mvif->sta;
+	struct mt7925_set_links_key_iter *it = data;
+	unsigned long links = key->link_id != -1 ? BIT(key->link_id) : it->links;
+	unsigned int link_id;
+
+	links &= it->links;
+
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_link_sta *mlink = mt792x_sta_to_link(msta, link_id);
+
+		if (!mlink)
+			continue;
+
+		mt7925_set_link_key(hw, SET_KEY, vif, sta, key, link_id, mlink);
+	}
+}
+
 static void mt7925_mac_link_sta_assoc(struct mt76_dev *mdev,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_link_sta *link_sta)
-- 
2.45.2

