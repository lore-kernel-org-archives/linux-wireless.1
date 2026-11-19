Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092253;
	b=jKfyNPIbAcoV/K3whupd7hTcpq4bro/giI+1jzELhSdBQ6gGrRmihO9G1l/VETk3BtUo
	 MQn9ZVuwpCKs+VvI2zjeq93jvx/EerJVbkIVtjn1hEyFmiSEyX2FMrA/RlTTlgf8+La9m
	 tcR8GL+dHaeWlSIU4lkhtC6ELw6hN3vFhh5uGyY05Vk2hTPm/0r2lFpih1cmZQsvFzZ3S
	 SzxQO4mEg2lDGa+G/69Wot0RCTiHxE6+KIFR1SJ3wL3joOHCPY5ZcxRw8o5Rx/FaPyVsQ
	 ZoSMKbSYON2r9JSi3Zvt/Br2Ay34iZbSulna2FhEx809RnqGP36+tmuRfVXdz7C7GfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092253;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XUOqkv/RYP48SKVuANoFJUwKOzKASRzYPnRl3z2/9Z4=;
	b=l+ZXFjCRGBGC1GnkbEBWZ1TPEwmJ1L5LP25EWnN6jmlmZbiAyquMCiNVkoL5pIQnm+wZ
	 KDzTe7ZZ3yNzwDkrFNd6FXXZ/z0rj7agzjrUGOZ7HNNNzX4gffEATW4yyS8vzJ2hc6VgP
	 AsVwGCB4FVV1xkTXTlOsMBkYTn6ySQ8ZXJQdwwbmfVJ21+0Is8YjIE8JQ8dT5gfWoAydz
	 dpjn7WUHo76xzk8gMlUBmuB61aDF5mW6W4ltUiryhHlwoqV9A4VvYjhwlj7P6i/AY5LBH
	 bPvsyxPSP7sarLo8wfleE6r8auBIGnCEFE/asrmOeJ9AxbDG2VmaDP2unFbv0KcP0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=r0sN4lRY;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CAC60A262A
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CAC60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=r0sN4lRY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XUOqkv/RYP48SKVuANoFJUwKOzKASRzYPnRl3z2/9Z4=; b=r0sN4lRYgWQV8LN8eptPnYw4Ux
	3dhsIiDsJ1zqyj4azouRlqLMHMGatwtT8SeJ4TjbeMkn/Bz1HQF6JB7oHpWVYkzoECnimJo6b4aZz
	7lnZNEce9BbXEQvWv5Vv9YDmoXlqsYLolsN0iF2eE9sBcKHhf7Isno3/5iXxfQf/vTX8=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uh-005VJk-04
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:03 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 20/20] wifi: mt76: mt7925: send the deauth of an MLD station on its AC queue
Date: Thu, 19 Nov 2026 13:43:52 +0100
Message-ID: <20261119124352.1842164-20-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

Since commit dedf2ec30fe4 ("wifi: mt76: fix queue assignment for deauth
packets"), the Deauthentication that an associated MLD station sends
when it leaves goes out on the ALTX queue of its default link, without
the MLD address translation. With single-radio MLO, the firmware holds
the links that the radio does not serve in power save, and it drops an
ALTX frame for such a link. The AP then keeps the station.

Send the Deauthentication of an associated MLD station on its AC queue
with the address translation, like its Action frames. A
Deauthentication that ends an authentication or an association stays
on ALTX, since it goes out under the join ROC of
mt7925_mgd_prepare_tx().

Fixes: dedf2ec30fe4 ("wifi: mt76: fix queue assignment for deauth packets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index b3fdb63088e3..8e6ca09d7235 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -765,6 +765,16 @@ mt7925_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	}
 }
 
+static bool
+mt7925_mac_deauth_on_ac(struct ieee80211_vif *vif, struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	return vif && vif->type == NL80211_IFTYPE_STATION &&
+	       ieee80211_vif_is_mld(vif) && vif->cfg.assoc &&
+	       ieee80211_is_deauth(hdr->frame_control);
+}
+
 void
 mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		      struct sk_buff *skb, struct mt76_wcid *wcid,
@@ -799,7 +809,7 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	} else if (beacon) {
 		p_fmt = MT_TX_TYPE_FW;
 		q_idx = MT_LMAC_BCN0;
-	} else if (qid >= MT_TXQ_PSD) {
+	} else if (qid >= MT_TXQ_PSD && !mt7925_mac_deauth_on_ac(vif, skb)) {
 		p_fmt = mt76_is_mmio(dev) ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
 		q_idx = MT_LMAC_ALTX0;
 	} else {
-- 
2.47.3

