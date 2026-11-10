Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280425;
	b=uW06JQVkOA0KIIWlisiMV65hjmvuNE+t58r7iinuJ+rsEUsit1uUDxNZcWi6RVvyEJOM
	 DnsEz2BF3fc7zXU5MoqxtxJ8Y/cACohyg8vnM5ndvbivXZr284FPziguyrDubANVBmV2Z
	 Ak7IyRp6GDDIZkIWVc1tSDUN1gyDS/cNOiDqyQeuXnevcF7fy9XCvNf6xgQCgTLotxm02
	 LW63PAuH07W/aJ+AL6xCUf4v4wXIkJD1pWrXgbrwRVrUO24E0s0lE80OpXs+ibCMreWbs
	 9mTQ4V557KkrpcJZrxFUTgmj82c0I1Knp0kl4XZCIyE9gE3fC52hG0MkoHnGXGl0/bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280425;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=ZL9dEC5RwujIpCJwXutuUogYXfkzDRLN6Je0wf3eTds=;
	b=f0GzvXzC7U7Vh5QlRQ0sPzfORGJJcWB1WXRuDKCxzzmKkuvNIzVHb9RQIDUXX6iagQXD
	 oFXPQ6vuEXCyOVu9DYcNhKMjjiWAwp6E+Q+6liqC+j8WLzKTilBkwoMgp/JBEh6H9wqYE
	 BL4qJlJ17QYZLnT4Zi68TVxJFl+Neq1ORi8rWNbh1sYiDjb5R8NBpmpzmduVewaCqz0eJ
	 DhNavSzOafA0elX011NiNlKqA05n9fOe1ziOLCZr/zIgtMJhjrUSC/Gb160ThTKZegf7Y
	 O1+YabdSRQQsXwrREQZ2cE9HtqUJD7UsbgEKktHbr/sAALmanZI9B9K3UydWaqGvFpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=A2KHIOu8;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C271C60A383A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C271C60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=A2KHIOu8
X-UUID: b7978222dcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZL9dEC5RwujIpCJwXutuUogYXfkzDRLN6Je0wf3eTds=;
	b=A2KHIOu8DPpYkHxsVY8+Q06jtRqJTNeM3yXAL3FMj0D8LjkqRYAmOtNRSL7vhh7t6odc+EjhYF1rEZ8Fwg4EzDuJbP/0TWQzzDerj4YfDjVb2ooSTfEM8+5CXAcv2rO2lHHh45yfI+TyyKhUIBCownQF/TuYkkKQsIbusgtq3gE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:58b7dfe3-1da3-4f9e-a57d-d9640649dfd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0f2b0f57-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7978222dcb411f1b1788b6acf885367-20261110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 907541278; Tue, 10 Nov 2026 11:13:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:34 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 12/28] wifi: mt76: mt7925: gate EMLSR by AP vendor OUI allowlist
Date: Tue, 10 Nov 2026 11:12:28 +0800
Message-ID: <20261110031244.369014-13-emery.hsin@mediatek.com>
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

To avoid unexpected IOT issues, only enable EMLSR for APs that advertise
a vendor IE whose OUI is on an allowlist. The emlsr_ap_gating and
emlsr_oui module parameters disable or extend it.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 76 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1d59c02645c6..8323c821d4d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -20,6 +20,75 @@ static bool mt7925_vif_is_nan(struct ieee80211_vif *vif)
 	       vif->type == NL80211_IFTYPE_NAN_DATA;
 }
 
+/* Only APs advertising a vendor IE with one of these OUIs may use EMLSR. */
+static bool mt7925_emlsr_ap_gating = true;
+module_param_named(emlsr_ap_gating, mt7925_emlsr_ap_gating, bool, 0644);
+MODULE_PARM_DESC(emlsr_ap_gating,
+		 "gate EMLSR by the AP OUI allowlist (default on; set 0 to allow all)");
+
+static u32 mt7925_emlsr_oui_allowlist_extra[8];
+static unsigned int mt7925_emlsr_oui_num;
+module_param_array_named(emlsr_oui, mt7925_emlsr_oui_allowlist_extra, uint,
+			 &mt7925_emlsr_oui_num, 0644);
+MODULE_PARM_DESC(emlsr_oui,
+		 "extra EMLSR-permitted AP OUIs, e.g. 0x000ce7,0x00037f");
+
+static const u32 mt7925_emlsr_oui_allowlist_default[] = {
+	0x000ce7, 0x000a00, 0x0017a5, 0x000c43, 0x00620b, 0x5c6f69,
+	0xbc97e1, 0x001be9, 0x0005b5, 0x8c8474, 0x1423f3, 0x405b7f,
+	0xd404e6, 0xe03e44, 0x6c92cf, 0x043201, 0x70b7e4, 0x1423f2,
+	0x4857d2, 0x9c2183, 0x84160c, 0xe43d1a, 0x000db6, 0x000af7,
+	0xd40129, 0x6c8375, 0xb02628, 0x001018, 0x18c086, 0x38bab0,
+};
+
+static bool mt7925_emlsr_oui_match(const struct cfg80211_bss_ies *ies,
+				   const u32 *oui, unsigned int num)
+{
+	unsigned int i;
+
+	/* oui_type -1 matches any vendor-specific type */
+	for (i = 0; i < num; i++) {
+		if (cfg80211_find_vendor_ie(oui[i], -1, ies->data, ies->len))
+			return true;
+	}
+
+	return false;
+}
+
+/* Return true if EMLSR is permitted for the associated AP. */
+static bool mt7925_emlsr_oui_allowed(struct wiphy *wiphy,
+				     struct ieee80211_channel *chan,
+				     const u8 *bssid)
+{
+	const struct cfg80211_bss_ies *ies;
+	struct cfg80211_bss *bss;
+	bool allowed = false;
+
+	if (!mt7925_emlsr_ap_gating)
+		return true;
+
+	/* a NULL chan matches the BSS on any channel */
+	bss = cfg80211_get_bss(wiphy, chan, bssid, NULL, 0,
+			       IEEE80211_BSS_TYPE_ESS, IEEE80211_PRIVACY_ANY);
+	if (!bss)
+		return false;
+
+	rcu_read_lock();
+	ies = rcu_dereference(bss->beacon_ies);
+	if (!ies)
+		ies = rcu_dereference(bss->ies);
+	if (ies)
+		allowed = mt7925_emlsr_oui_match(ies, mt7925_emlsr_oui_allowlist_default,
+						 ARRAY_SIZE(mt7925_emlsr_oui_allowlist_default)) ||
+			  mt7925_emlsr_oui_match(ies, mt7925_emlsr_oui_allowlist_extra,
+						 mt7925_emlsr_oui_num);
+	rcu_read_unlock();
+
+	cfg80211_put_bss(wiphy, bss);
+
+	return allowed;
+}
+
 int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq)
 {
@@ -3056,6 +3125,7 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	struct bss_mld_tlv *mld;
 	struct tlv *tlv;
 	bool is_mld;
+	bool is_supported_ap = false;
 
 	is_mld = ieee80211_vif_is_mld(link_conf->vif) ||
 		 (hweight16(mvif->valid_links) > 1);
@@ -3070,8 +3140,12 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	mld->remap_idx = 0xff;
 
 	if (phy->chip_cap & BIT(MT792x_CHIP_CAP_MLO_EML_EN)) {
+		is_supported_ap = mt7925_emlsr_oui_allowed(phy->mt76->hw->wiphy,
+							   link_conf->chanreq.oper.chan,
+							   link_conf->bssid);
 		mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
-				     IEEE80211_EML_CAP_EMLSR_SUPP);
+				     IEEE80211_EML_CAP_EMLSR_SUPP) &&
+				  is_supported_ap;
 	} else {
 		mld->eml_enable = 0;
 	}
-- 
2.45.2

