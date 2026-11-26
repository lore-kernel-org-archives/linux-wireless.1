Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=yzDUf2gvbQ/4LZ590zRSdEpbvOiUbX36QE8Qfgde2OkWKv6SO4SSajc7FIoL7/mcXO4P
	 bXcRwbOSwPMy2hKjlMR7L9k+zSrGs7IMipjFjZCmYb4php3mOesV7T8hrj2lqlQPWoKtz
	 F+gCOuKA9Rjz2GoEAxjiJwA6+Z1FTomxvEM5cNolU7Ol3amGyYpulLtBTnG00HATo2W+S
	 2CLVlXzbkWmqgwNGZV1LVkDeBM+UmCw5pP9UpC5OQp4wfKoONuhx3Syj1zyi/whNlHaZs
	 Jnq/2wytMLnnkjuc/vc9gNo0XfXtYW3q3zPvre6WY1AC3JR6UTHvI3RygsSS5cAbbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=esAGyIzDV98A9f8bPHBuKzZwWSCOF/fHWLXec6xJ2vU=;
	b=0INu9cthNRcumz/Kfu7INwpHC1gJ6wG2UvBcBVSBH9xBnR/ZOX189Sexatkqpq7vXr39
	 pGAoOeP3fgVBlvV7rxWv02lLe+Fgnj0xNRsCIry6UYYwhqYdzDMPWf0snWGdEfSy1WWD/
	 SwyFhw74Gsug8nB/EymMEXN5iyMKaRKcrNPOHoCsDCitgbG8/QymKy5LZR5pKeLFTpFq3
	 htHu+XGwAlAvWjL94K7jXmDqPu7XgyNPwlona/T9YbE8Bj4o9fYvwb34dlh3uthvZPveJ
	 BDCpW4EJUuiuK3zsCVe3kCUV3MXdko96k/NNmc8U/RqAE8tGYZ/evTzcIDg7tUlgORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tkuol0IJ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95BD606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tkuol0IJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=esAGyIzDV98A9f8bPHBuKzZwWSCOF/fHWLXec6xJ2vU=; b=tkuol0IJ158FIwvHx4CTFPis91
	UkHEnAmWsKHqgaXhocvU/TC/XImv3bmrfQ34OO17QnwXiCIntZfnntoVp5ARDjOA+qMoowe9XXQaR
	6UfHyloVvDEl5I9jBg/p1Ro7Wae/f+1DcW9+S1U45Rj1ue2mB1EIA4ZWij9xQndEQz7U=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-1B
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/16] wifi: mt76: mt7996: take the HE caps of the band of each link
Date: Thu, 26 Nov 2026 19:23:13 +0100
Message-ID: <20261126182325.2516607-4-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

mt76_connac_get_he_phy_cap() reads the band from the deflink of
vif->drv_priv, which on mt7996 is link 0. Every other link of an MLD
thus gets the HE caps of the band of link 0. In
mt7996_mcu_sta_bfer_he() these caps limit the sounding dimensions in
STA_REC_BF. With link 0 on 2.4 GHz, a 5 GHz HE peer without EHT gets
fewer, none above 80 MHz.

Take the HE caps of the band of the phy of the link, like
mt76_connac_get_eht_phy_cap() and mt7996_is_ebf_supported() do. Use
them for UNI_BSS_INFO_HE_BASIC as well, whose MCS and NSS fields came
from the same lookup.

Fixes: a9eae65d97f3 ("wifi: mt76: mt7996: Export MLO AP capabilities to mac80211")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index a3717dffe9ad..ba0e2a266d0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -123,6 +123,17 @@ mt7996_mcu_get_sta_nss(u16 mcs_map)
 	return nss ? nss - 1 : 0;
 }
 
+static const struct ieee80211_sta_he_cap *
+mt7996_mcu_get_he_phy_cap(struct mt7996_phy *phy, struct ieee80211_vif *vif)
+{
+	struct ieee80211_supported_band *sband;
+	struct mt76_phy *mphy = phy->mt76;
+
+	sband = mphy->hw->wiphy->bands[mphy->chandef.chan->band];
+
+	return ieee80211_get_he_iftype_cap(sband, vif->type);
+}
+
 static void
 mt7996_mcu_set_sta_he_mcs(struct ieee80211_link_sta *link_sta,
 			  struct mt7996_vif_link *link,
@@ -1144,7 +1155,7 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct bss_info_uni_he *he;
 	struct tlv *tlv;
 
-	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	cap = mt7996_mcu_get_he_phy_cap(phy, vif);
 	if (!cap)
 		return;
 
@@ -2052,7 +2063,7 @@ mt7996_mcu_sta_bfer_he(struct ieee80211_link_sta *link_sta,
 	const struct ieee80211_sta_he_cap *vc;
 	u8 snd_dim, sts;
 
-	vc = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	vc = mt7996_mcu_get_he_phy_cap(phy, vif);
 	if (!vc)
 		return;
 
-- 
2.47.3

