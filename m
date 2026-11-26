Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717410;
	b=k62irJj845thdPmY7KTs2+/mthr9Lr/dzcTNzE9B1CdeWDy+GCVP/Sfckozaq/9T7g0U
	 xEPht/tLaiR/Jvv+dhW2+52XO07rrNsPsGAbZyFic89Hm0z6xC1m0AZbIv4gFra/jFm/b
	 hjInC4T/YK66jc18zUXObd3pOTVD6e8ymxV0Q33fhRv6PT5NK0GvG4t4gzdC8pM+dwGlX
	 31MP0y2W+dsMfKVdnX4oRw6QvUsbih1VaYoPSY3AcjEjQuWVpjrXoxk9+9LfCQ5SuecMn
	 z7vlaK0hvP/Fq7tC0kloS8IRV8zuEiQ8y8ee8bJcuNTODGcvy8B+GxuXhQ9hfj12JRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717410;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RtpsKKkSA1llx+VeQ6cO79rCzBm46QiZ0W5c/XhRwaE=;
	b=fPkCirjKr3f/M0VN1BakD9+nmA1so+JQsADMnh/qe2LsHuha2FFaoPwf14fILXv83dmP
	 JtvG6sL2/BdhSHOVYIXlmLvEzbSOM8lhLmRh3NVIg45GFjok72Z7QysV49DAHwaAL3Wqt
	 s3Fyxi5zeM7LfZex5/KbaJKTmLV2e4GbTnMcXRVGej/QEXv/f6r9cFuNH2I6/qm8ZmHSj
	 QjATAkzsrWs16Bc+/vSlMdO2w2CRYBGpUtxadRdV93lOiuUI2T3YcwfVx/8iefc38aEYB
	 K4Pz0JcV8lrvKvIuhMCbJPZZQDN5eiwI6SEDlie0m+gyftfFHmyXecUB9IMJlratV4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QZnjVVE1;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583D606A329
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5583D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QZnjVVE1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RtpsKKkSA1llx+VeQ6cO79rCzBm46QiZ0W5c/XhRwaE=; b=QZnjVVE13xNt+M02iX5yeQFbx6
	jfuQOivhULZ3N6ESI1E/fHRZo1nhH0aDwSesA10uWrEhhNy7Md3tTq+Or0rGKM6mFFggi5VkZqucr
	76ZLw1Rk1bEN+T9uxjyJBF03GXcDrwCCz7LZ8BpZFT7dDc0nYTQbhfjfA1ENjjE9Nq4M=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-2s
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/16] wifi: mt76: mt7996: check the RX PN of group addressed frames
Date: Thu, 26 Nov 2026 19:23:16 +0100
Message-ID: <20261126182325.2516607-7-nbd@nbd.name>
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

The RX descriptor of a decrypted group addressed frame names the vif
link wcid, which has no station, so mt7996_rx_get_wcid() gives the frame
no wcid. With the IV stripped, the frame gets no replay check.

Give such a frame the vif link wcid and check it against the counters of
its key id. Seed the counters only when mac80211 sets the group key, not
when the driver installs the key again at a link add, since mac80211
does not advance the RSC of a frame with a stripped IV.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 62e16e3c989b..ec4c8118d679 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -478,6 +478,8 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 		status->flag |= RX_FLAG_ONLY_MONITOR;
 
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
+	status->group = !unicast;
+	status->key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
 	status->wcid = mt7996_rx_get_wcid(dev, idx, band_idx);
 
@@ -519,6 +521,9 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
 		status->flag |= RX_FLAG_MMIC_STRIPPED | RX_FLAG_MIC_STRIPPED;
 	}
 
+	if (!unicast && !status->wcid && (status->flag & RX_FLAG_DECRYPTED))
+		status->wcid = mt76_rx_group_wcid(mt76_wcid_ptr(dev, idx));
+
 	remove_pad = FIELD_GET(MT_RXD2_NORMAL_HDR_OFFSET, rxd2);
 
 	if (rxd2 & MT_RXD2_NORMAL_MAX_LEN_ERROR)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index bcecd6558fda..7e5bf40c257d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -469,6 +469,7 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	msta_link->wcid.link_valid = ieee80211_vif_is_mld(vif);
 	msta_link->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&msta_link->wcid, band_idx);
+	mt76_wcid_rx_group_pn_set(&msta_link->wcid, vif, &mlink->rx_group_pn);
 
 	if (vif->type != NL80211_IFTYPE_AP &&
 	    (!mlink->omac_idx || mlink->omac_idx > 3))
@@ -900,6 +901,12 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt7996_vif_link *link = mt7996_vif_link(dev, vif, link_id);
+
+		/* a replay of the key at a link add must keep the counters */
+		if (!sta && link && cmd == SET_KEY)
+			mt76_wcid_key_setup(&dev->mt76, &link->msta_link.wcid, key);
+
 		err = mt7996_set_hw_key(hw, cmd, vif, sta, link_id, key);
 		if (err)
 			break;
-- 
2.47.3

