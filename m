Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=MvSUeXLC0dfGQ1WTBagQvQ23voL8mZDb50tXAvgADBGk0h50G51bQ3iqqVhAaZHUeuZj
	 f7Fo5FAUlCPXIctxZkn/ckUiyzJbu1rufJ+WSi3JO5ACZB5+QWBQSjnUWRtpcTRAbTIAg
	 91WFd5b8L8jfWhL1yjCJYIbIeoFMD+3oy2WdtxwXB6+9I+VADDxPYWs102qjyBDcYl99k
	 oMx+OkIpshGKv3DXq8mG5FOaxOg5doRKhMdmKxlwpjX/kjTQUBQOgOlo/J2y6waw9c4l7
	 czbYqcUQUsSB4nNfBr43QVL1h8QEB+ze6Mry2o33YFdoMmaSlofsBz9MAitM/9MFPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RuETWdCRG8dk+LKOxm70acWjMFd3eXv1QhBG2u/ySuo=;
	b=qozy9Hv7n5UYLbqVVJ6p5jyxKAvsbcvp958WcjVt2pmObaLipxmmDwOui/u9kgBbIVO5
	 Kth6+lzh0gIDnNzQ2o2shJygBA82ynxEWVnL3fmeiIvNbtRwK8O54EWoBxdnGM7WhLjBn
	 9bCSuVOqMB8ThCO2i8gprqK5060VCSkY5zPyYWF3dUS1mqAGHt9tIVuF79JjkRqo8OCL9
	 L/bLkolMY7MNaYUx2HOZlL/gNEZ/Lgg327yLpyCwWY102eYOGp6GJ46IA02Li+J9jDzv2
	 8KKFWIz222hco2+mC8B3RrhC6UVjxSqBFy7qKG0zVRqGCsPeDzkpLOb6HM5HYhEpdmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=OBws8ua7;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A760A260D
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41A760A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=OBws8ua7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RuETWdCRG8dk+LKOxm70acWjMFd3eXv1QhBG2u/ySuo=; b=OBws8ua7VOU4tgK5Xz3I4+tyaI
	W0awD/0VhMbIjn6GRawGPiR1+NMOubNdzfM3CUG7V56f0qlT59uruBed0dT9gb0JS0WrkW3MTSJfI
	1AkcQ07WTPoB0PpDRMIJxAkEjxBCH8QxL2t/KKuJqXsrzNi1Ga17UHHJRkJ8iVpe/5P8=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-0h
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/16] wifi: mt76: mt7996: keep the fw_mld_idx link in the MLD setup
Date: Wed, 18 Nov 2026 17:18:20 +0100
Message-ID: <20261118161827.1208649-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt7996_mcu_sta_mld_setup_tlv() names the WTBL of msta->fw_mld_idx as
the primary WTBL of the MLD peer, but lists the active links only. A
station that deactivates the link it associated on, which holds that
WTBL, and then adds another link thus gets a setup without its primary
WTBL in the list. The firmware then counts the TX sequence numbers and
PNs of at least TID 7 on the WTBL of a listed link, where both start
again at 0, and the peer drops these frames as old in its reorder
buffer, EAPOL-Key Requests included.

List the link of the primary WTBL as well, while its station link and
vif link exist. The firmware record of the MLD still holds that link,
since its deactivation sends no MLD setup.

Fixes: 2f3d7e0ad329 ("wifi: mt76: mt7996: describe an MLD peer with the PEER_MLD command")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 57b16f1f5c1d..627ca3e93e51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2781,13 +2781,40 @@ int mt7996_mcu_mld_link_oper(struct mt7996_dev *dev,
 				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+static unsigned long
+mt7996_mcu_sta_mld_setup_links(struct mt7996_dev *dev,
+			       struct ieee80211_vif *vif,
+			       struct ieee80211_sta *sta)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	unsigned long links = mt7996_mac_sta_links(dev, vif, sta);
+	unsigned int link_id;
+
+	if (!msta->peer_mld_links)
+		return links;
+
+	for (link_id = 0; link_id < ARRAY_SIZE(msta->link); link_id++) {
+		struct mt7996_sta_link *msta_link;
+
+		msta_link = mt7996_sta_link_protected(dev, msta, link_id);
+		if (!msta_link || msta_link->wcid.idx != msta->fw_mld_idx)
+			continue;
+
+		if (mt7996_vif_link(dev, vif, link_id))
+			links |= BIT(link_id);
+		break;
+	}
+
+	return links;
+}
+
 static void
 mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 			     struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta)
 {
+	unsigned long links = mt7996_mcu_sta_mld_setup_links(dev, vif, sta);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	unsigned long links = mt7996_mac_sta_links(dev, vif, sta);
 	unsigned int nlinks = hweight16(links);
 	struct mld_setup_link *mld_setup_link;
 	struct sta_rec_mld_setup *mld_setup;
-- 
2.47.3

