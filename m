Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=1gKpxRVntkD+W8+Qci5gvhEYiuKRvTDEUJAsjGJxCErx9IO3Mcm2ffrNKNNNLyGBmCWG
	 WKDNrdjqjCC/1b8upDhV+AdhC3dsYHZ6BNw3768cO4b6irTtn3jtgIlaPanVfLjLOUgce
	 xXnKwN8QjzA9EkXjH0C+aWPnQLijHM6SRnkrFpdZxAV7Y2dTmSbdtt488UyLPqYIC/0ZL
	 +W/zdtXYi2OwMe2yS+jJIHBhQrzG9FVU+KibMBJ/sF5HHEmmTXzV15JeUGtBAfdGOeCFW
	 x2ZhZnOhLamhJNukQmls5IlWShDWGpAc6/Dg/rWjuDzKlyeIvXJ2IB7vs8cIMvTq4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=021HfDetMLp5GbwBQLac99TtGn+Z2Tk/BWuIUAtkbMU=;
	b=HFvPj5+wJQRpIwvVyYFRaC6hY5ln9LixNhJMwevWTPfB1YmCgLFyCDIqGNoW7SCgwlTQ
	 djm7OEFxrH10yQHf5+PKYs3/vLUH0uL3WyMlDME4th2MmyFCOEiu+RJr9Jw0j4uZUM6+K
	 5CB82M17o3dgiNZ8PUUoMOTub270pnm3FcFDcrDC/hNv6dC0JX+I+To/tGO0vdIdeKuNT
	 d2Seed547Xm5zwy0RN2iEg3Km7AagAdJsVbKv2sORY4TNz/GBU7dAzcKNqTEVL0pcc6Qw
	 5SQgERAzbLKox+vsY96p11BpsR6ZKDPIipS25kOmPoDoiXxBz0DQvIUslVQ1NB+7kTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="E0/rBDuE";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38476606A331
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38476606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=E0/rBDuE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=021HfDetMLp5GbwBQLac99TtGn+Z2Tk/BWuIUAtkbMU=; b=E0/rBDuEFOTxGRmm1L/oyIrhDR
	5BLK2jxEQjjDzZb7F/v037Nh2ciZHdB9zHQWojac351W2YyG6yB6mZ+28aUYTx7o+V9yDRFRF4sVt
	bxQ3jHFOd+r4ncKKcYKQ0txsr2JNETMn78g4Pv9Rcyfx0KxZXUjhtzwyPTSB43Pt3df0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-3C
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/19] wifi: mt76: mt7996: report radar on the channel context of its band
Date: Tue, 17 Nov 2026 19:01:21 +0100
Message-ID: <20261117180134.2940930-6-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt7996_mcu_rx_radar_detected() reports a radar with a NULL channel
context, so mac80211 marks every channel context of the multi-radio
wiphy. A radar on the 5 GHz band thus also ends the CAC on the other
bands and is reported on their channels.

Report the radar on the channel context of the radio that detected it.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index e56b60346fc4..b082998a4170 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -572,10 +572,16 @@ mt7996_mcu_rx_radar_detected(struct mt7996_dev *dev, struct sk_buff *skb)
 						&dev->rdd2_chandef,
 						GFP_ATOMIC);
 	} else {
+		struct mt76_chanctx *ctx = READ_ONCE(mphy->chanctx);
 		struct mt7996_phy *phy = mphy->priv;
+		struct ieee80211_chanctx_conf *conf;
 
 		phy->rdd_tx_paused = true;
-		ieee80211_radar_detected(mphy->hw, NULL);
+		if (ctx) {
+			conf = container_of((void *)ctx,
+					    struct ieee80211_chanctx_conf, drv_priv);
+			ieee80211_radar_detected(mphy->hw, conf);
+		}
 	}
 	dev->hw_pattern++;
 
-- 
2.47.3

