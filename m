Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=2H+/2OEmDLZjXL4soYhQ0KX8Rs5BCGWnPzVih2IZvP4n/Dkj9yzVcqwM++Nfnj0CCV4R
	 1cGi/Cx58sVMeMtiXqd/ql1+it6bMBng8xIiJxFFDa/4/ePWGuCN66zr9gna7qzJVP7Ti
	 7znxwjamlnkJb/xsNtZcg+rkxoMPIMGVC0HuwCxQdwkqhl3LXCiZk2zIGpUZW7inqd9sa
	 EqDSUpZbzoLwK/32/mkEGNEe0y1QWZ4EAnlaKLzsOd4FuclnD15sxTovhVK379j1dNTHK
	 WgY86raylMKus7/Uv1/QjFVy9/uShbbVwe24h5ySTpKt6Z0eyVLggbeUmILmNv9skAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uVL9vCEuxd4Q8pVcrQZILFT9VlsHZuAJ/uinAPWqb3U=;
	b=Nnx1VUN48vFi8rUa6LrUgrqDdMtEQ/+J+HFSQMrl5zj1Pr2PR1wAxGh4o1fRr06OmpSM
	 INQ+SCIpWBKc3j08FGv6sCbPRkP8OVE9nHsiDpHwOt5oqvrUgsgFC5kDcr9CVWWvC3Abq
	 yjZL2Tp2Z3GkSe3AcsMO8equ2SRr21c61+xw45Kt+7bfbzW81GXRfImWFxyIbLyBThtmk
	 IWPkAVubEO0x4p2dj6IYgglbjIOvGKdppHNgaDLvZBAdVkzMBitDWDtLDBeP5jCm5R8BP
	 QaKOLmS97gXQ1Bf/7pA1UQdcA7DORZZ1VSrNp4crcAb1DqjyP1lWeX+tSDDYMjDTZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=G9e+A+6F;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE5606A891
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBE5606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=G9e+A+6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uVL9vCEuxd4Q8pVcrQZILFT9VlsHZuAJ/uinAPWqb3U=; b=G9e+A+6F/tS0z5wy1UVQT/LKJ0
	jbZluYNVyxZMBUzPOjmVPnXkyXsQ4TMsLU3Z1imbXIR9+ngnumjeXwTZv4UvamjucxN3/skjxKnoF
	ziowVeLeTgh2cqxkwz9qDCHx3Kc8UN6ehPRW7HVu6E4sCCebViaBoPlNHulxm6cwxdB4=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-0b
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/19] wifi: mt76: check the RX PN of CCMP-256, GCMP and GCMP-256 keys
Date: Tue, 17 Nov 2026 19:01:28 +0100
Message-ID: <20261117180134.2940930-13-nbd@nbd.name>
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

mt76_wcid_key_link_setup() enables the RX PN check for CCMP keys only.
mac80211 does not check the PN either, because the IV is stripped, so
on mt7996, whose hardware does not check it, replayed frames of the
other AES ciphers reach the stack.

Check the PN for all four ciphers. Keep the PN state of a wcid when an
IGTK or BIGTK is installed on it, since these keys do not use it.

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 13 +++++--
 drivers/net/wireless/mediatek/mt76/mt76.h     | 34 ++++++++++++++++++-
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index b1789be134d6..6b496dfda5cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1279,21 +1279,28 @@ void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
 			 struct ieee80211_key_conf *key)
 {
 	struct ieee80211_key_seq seq;
+	u8 *pn;
 	int i;
 
 	mt76_wcid_key_link_setup(wcid, key);
-	if (!wcid->rx_check_pn)
+	if (!key || !mt76_key_has_rx_pn(key))
 		return;
 
+	if (key->cipher == WLAN_CIPHER_SUITE_GCMP ||
+	    key->cipher == WLAN_CIPHER_SUITE_GCMP_256)
+		pn = seq.gcmp.pn;
+	else
+		pn = seq.ccmp.pn;
+
 	/* data frame */
 	for (i = 0; i < IEEE80211_NUM_TIDS; i++) {
 		ieee80211_get_key_rx_seq(key, i, &seq);
-		memcpy(wcid->rx_key_pn[i], seq.ccmp.pn, sizeof(seq.ccmp.pn));
+		memcpy(wcid->rx_key_pn[i], pn, sizeof(wcid->rx_key_pn[i]));
 	}
 
 	/* robust management frame */
 	ieee80211_get_key_rx_seq(key, -1, &seq);
-	memcpy(wcid->rx_key_pn[i], seq.ccmp.pn, sizeof(seq.ccmp.pn));
+	memcpy(wcid->rx_key_pn[i], pn, sizeof(wcid->rx_key_pn[i]));
 
 }
 EXPORT_SYMBOL(mt76_wcid_key_setup);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 0b16567920fa..7a2a6afc3c21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1590,11 +1590,43 @@ int mt76_rx_aggr_start(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tid,
 		       u16 ssn, u16 size);
 void mt76_rx_aggr_stop(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tid);
 
+static inline bool
+mt76_key_has_rx_pn(struct ieee80211_key_conf *key)
+{
+	switch (key->cipher) {
+	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
+	case WLAN_CIPHER_SUITE_GCMP:
+	case WLAN_CIPHER_SUITE_GCMP_256:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline bool
+mt76_key_is_bip(struct ieee80211_key_conf *key)
+{
+	switch (key->cipher) {
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
+	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
+	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static inline void
 mt76_wcid_key_link_setup(struct mt76_wcid *wcid,
 			 struct ieee80211_key_conf *key)
 {
-	wcid->rx_check_pn = key && key->cipher == WLAN_CIPHER_SUITE_CCMP;
+	/* an IGTK or BIGTK shares the wcid of the GTK */
+	if (key && mt76_key_is_bip(key))
+		return;
+
+	wcid->rx_check_pn = key && mt76_key_has_rx_pn(key);
 }
 
 void mt76_wcid_key_setup(struct mt76_dev *dev, struct mt76_wcid *wcid,
-- 
2.47.3

