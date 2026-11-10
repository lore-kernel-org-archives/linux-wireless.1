Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280427;
	b=QkrS7eGMcdjoyNkBQedQ8vrhHVHodmFGphc81LupgkK9GHfMi5ENcoaZp4Do9dLD5See
	 5ksVL3tVpezhIleIhFAIdZKgqhneFBZosMy7Bx0AbH39zwO8diiJXNHonDfcX9sC83UPk
	 62AmKMJb3q9C8Z13mlt1h1L8LZoPKSxqQzQ4g+dQvajkDiHZEU2SGcNpFT+3jeFBc8okF
	 DTZIT8en244ydswNPMy4b95fXmEVJPREEyBlAxSIuV8fKlUFineZ72qw2F0NI6l86QMq7
	 hihLKYwtRF+Ac8RiReMZj6HYnkXfN+7CcZYfJUM2RwckzYQhAD3KBZnwr79zu8rEn+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280427;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=lm5/2N9BWFM5VQSPD7ar6wivD5L2gI/noX/Y7OQqZ9Q=;
	b=oDPugtOWvFWmOFYVH5LXouid75X9Dim5Au/Zua1SUsiYiuygCG5Viahwg1ZJQRHSPmdd
	 1bwS04zP8zv8CiD8KNbWBwDSrB1wE3MAZR6C8iwC4jQRXBetyv90CzgkifhO5s+SP4nfS
	 7w+k6jWIkzDcNfi0JSxXSl0ip6LiA0Cxe31knxcpw1cJ9rKql13ymN31H/CkaaGO6cm1p
	 CBSa3+UVI5xESeZ8QdK4y0y8BVdQI7kpCLt0YM3IEl9zXdAmbSZmHNSffqiX4GQazgyvY
	 NUXBuY1WTGIU5/53RwGdpwd0tzF/yFmTkYxr3YvxcjzQ05TtApM/bYdxwEWamQeyYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eU81EQGY;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B4606A91A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06B4606A91A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eU81EQGY
X-UUID: b815376cdcb411f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lm5/2N9BWFM5VQSPD7ar6wivD5L2gI/noX/Y7OQqZ9Q=;
	b=eU81EQGYOSTcLSMNluKprG8D9raVduYnCbQtS9S5MtB47FRpBzLXA4nb7cRUwEePZO+SlpN9jEksTMtqLtZtCMiYrLCQ5V+SjrgVNfCFpSwNpH+aoBIP2tSL+Dj0LChYKRLPj62Dk44MkZdjPVtnMYVaMAtZzlddXviWRG06etk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:eb8310ee-fe24-48fa-b18b-27b3482bb1d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:18941366-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b815376cdcb411f1b1788b6acf885367-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 671784107; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH 20/28] wifi: mt76: mt7925: add mt7925_mcu_add_bss_sec() helper
Date: Tue, 10 Nov 2026 11:12:36 +0800
Message-ID: <20261110031244.369014-21-emery.hsin@mediatek.com>
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

Add a helper that pushes only the SEC (cipher) TLV of an active BSS via
BSS_INFO_UPDATE instead of re-sending the whole BSS_INFO; the firmware
processes BSS_INFO TLVs independently. The MLO set_key path will use it.


Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 22 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 27410eb940ea..b502f93166e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3391,6 +3391,28 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 					   mlink->wcid.idx, enable);
 }
 
+/* Update only the SEC (cipher) tag of an active BSS, without re-pushing the
+ * whole BSS_INFO. The firmware processes BSS_INFO TLVs independently, so a
+ * SEC-only update leaves the rest untouched. Used by the set_key path.
+ */
+int mt7925_mcu_add_bss_sec(struct mt792x_phy *phy,
+			   struct ieee80211_bss_conf *link_conf)
+{
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt792x_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
+					 MT7925_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7925_mcu_bss_sec_tlv(skb, link_conf);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7925_mcu_set_dbdc(struct mt76_phy *phy, bool enable)
 {
 	struct mt76_dev *mdev = phy->dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index dea93f4186ff..ae403c04e436 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -737,6 +737,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    struct ieee80211_bss_conf *link_conf,
 			    struct ieee80211_link_sta *link_sta,
 			    int enable);
+int mt7925_mcu_add_bss_sec(struct mt792x_phy *phy,
+			   struct ieee80211_bss_conf *link_conf);
 int mt7925_mcu_add_bss_info_sta(struct mt792x_phy *phy,
 				struct ieee80211_chanctx_conf *ctx,
 				struct ieee80211_bss_conf *link_conf,
-- 
2.45.2

