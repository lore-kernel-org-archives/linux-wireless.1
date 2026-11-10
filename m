Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280419;
	b=aN8x81EKt9z61O1l58P+auhsyrmTpiI8mV/zFdj83BZllqHz27kGd5n3e1IHehLfBHql
	 nQZmlvVSjUB/EQ2Sk/1v4jyDSR628XZbb7ApUDoM7ADqplPjI2X3HPGCLvMDwtgu9ZJIF
	 chjB0CcZ8ZoIJLtMYAXz3ylisEoiadEJyRQnfjVXaYLLmu7a5W3f7CmTeUdl4TqeKxqqV
	 1Bp69/Sje4a/QZPUenoEIC9CWZ7PcQVv3LNriU0OtoptBauMvxM78JEsH1rzADGEpAGcM
	 xAgWlsKltIsNunBUWltci1AX+euYUj48rjXo83Nzk9icQ2e4CCH3sUId2XKqGoKbLbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280419;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=/gRcLg520dGXayeFXMNBI71v5TIL1pzeehdMXikKsuQ=;
	b=s0mGdSleWQUx0viJxUdlpqMSuIYVzWwH2PfvN2xe5i1FbzY1ARORkSb0cA7tgBzSqg0l
	 2Nxl7fuqoCEZDvhWl/KArkjLYqR0Fo1sxKKN3xBa7vc12Zm+Y85yXMyulVhEDMpoJTcm2
	 vcuHiB78zjGwhmiyh4EzMdNUBxguwyWU1ga5vVC6n2t2zA8lSTk7o/wcU45ywOt4qjtQU
	 oL0yU4p66+SCjnnAneFsesgODxyuXy6JkIbKQrDaimpHr9O1CjBhTcc+8lNaNjYbYoq5/
	 jfR82zzppOwb9fcesC3mLGhro/n1kdN8MQnDP7yYwW+kENyMeTG8RbmFw3eGgEbU2/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="iLT/JwKn";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCC60A3812
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFCC60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=iLT/JwKn
X-UUID: b4587558dcb411f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/gRcLg520dGXayeFXMNBI71v5TIL1pzeehdMXikKsuQ=;
	b=iLT/JwKn44+SNSp3Fv+GY/oTthkjDSkPHsH3YayrkdLvcFAjv72tSQe/GsmC3ckvprV04MRHsbqixsxnMI/2PD7ibufHTLyNhDEg8e3YDj+4FHBI/UQF5IrdP5E5wzoJqHLmMxqhraB3AYLnS4Mkq247hxchIYNP0bpyV7/iwb0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:11dfc17a-5421-4293-a2e9-84db30b830cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:91af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4587558dcb411f18dc8c9802ae25ab1-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2011467894; Tue, 10 Nov 2026 11:13:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:30 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 07/28] wifi: mt76: mt792x: add a gated mt792x_mcu_set_dev_active() helper
Date: Tue, 10 Nov 2026 11:12:23 +0800
Message-ID: <20261110031244.369014-8-emery.hsin@mediatek.com>
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

Add a per-vif dev_active flag and a wrapper around
mt76_connac_mcu_uni_add_dev() that skips a redundant DEV (de)activation
command and keeps the flag in sync with the firmware DEV state.

This is a preparation patch before the MT7925 MLO DEV (de)activation work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  5 +++++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8a366356e560..b9bcc5e1197c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -181,6 +181,7 @@ struct mt792x_bss_conf {
 	struct ewma_rssi rssi;
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
 	unsigned int link_id;
+	bool dev_active;
 
 	bool absent;
 
@@ -586,6 +587,10 @@ int mt792x_mcu_fw_pmctrl(struct mt792x_dev *dev);
 void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_bss_conf *mconf,
 				struct mt792x_link_sta *mlink);
+int mt792x_mcu_set_dev_active(struct mt792x_dev *dev,
+			      struct ieee80211_bss_conf *link_conf,
+			      struct mt792x_bss_conf *mconf,
+			      struct mt76_wcid *wcid, bool enable);
 void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 1965e9de7099..420aba8519e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -302,6 +302,26 @@ void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 }
 EXPORT_SYMBOL_GPL(mt792x_mac_link_bss_remove);
 
+int mt792x_mcu_set_dev_active(struct mt792x_dev *dev,
+			      struct ieee80211_bss_conf *link_conf,
+			      struct mt792x_bss_conf *mconf,
+			      struct mt76_wcid *wcid, bool enable)
+{
+	int ret;
+
+	/* skip a redundant command when already in the requested state */
+	if (mconf->dev_active == enable)
+		return 0;
+
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf,
+					  &mconf->mt76, wcid, enable);
+	if (!ret)
+		mconf->dev_active = enable;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_set_dev_active);
+
 void mt792x_remove_interface(struct ieee80211_hw *hw,
 			     struct ieee80211_vif *vif)
 {
-- 
2.45.2

