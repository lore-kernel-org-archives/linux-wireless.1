Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=YDby9xLuGup9tN5kgEPlvifvsDJsVamKYmq6BfIrfyICSP/T4I9BZAYNPD6aUxR/HAOx
	 s3cgZtc+hWiqQ2S65hl+PWqfcggS8gxzVA0fUYdidpaq04MPVxHdaFCYCHad54GqYYnLy
	 GeAiEnKFtJDafGzJLf9wFzVRy6pZMml09GqZ0nXUxDKLiDl0ECWEH74/+TwemJl+OcHKC
	 O8aRSjgINMuDpgp521an45KBJ8mr5iFeP8vjo1GGbLif+1/H3ly3eIHj07Gn4JoHGhVrJ
	 rhlgtvcQemeIGuPI74AQJBVoAQQ5DVqodU/Wk8G2IuMY7NEb65oF9T7W51EvbiKgMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ePyVuWROZV239WU5XiUqug3/JkDSHRSWn7WvbanEhvI=;
	b=Vy2r4Uc3x+2ZwRiShap0hyFhImZZjzjWALj8T6mRFBt2OxgDOd4Gpwo7/NT/qdiiY90N
	 2a8U61pI6la30uo46FGPEcEF4It3AKaGeXNOFYcEpupNvLBIK1TDqZVZqOPIa0u7APWRr
	 D5qPM81x5S8q3mOC0nkpOI/yDqakbrgLtPAoAqFsrMbO5eXa/UT3rpDRswJKq8+002cWi
	 hdFxrzL95dZ+k92aRirVj6LZa/BFj2P8T98vuZ/+CTlHDvFa3VnTgKPnO92OebxJDJk8a
	 NkQ5tbQGCKD0z7N7yRVgsV1Y1BvKktuY3l19mvKSXrXWS6Zyt2n/TIntEXsS3KrakSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pr2PMPoZ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA1606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=pr2PMPoZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ePyVuWROZV239WU5XiUqug3/JkDSHRSWn7WvbanEhvI=; b=pr2PMPoZay7qakIke7Pf85W4d8
	FJ/uRQKZ+UtXjdRm0tmqNxe/1xbEYi388vZ1OoCGEchaL74fIcBw28r8LaE1oUaEnh3gu1BL8grOF
	wFIcg0SZdai9tinZnkvzIqEXeWR7lRcEei3KT2wPOFUu/1ESvA/taMQuAtlXeMKrOEW8=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-2H
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/16] wifi: mt76: free a replayed 802.3 frame with all its subframes
Date: Wed, 18 Nov 2026 17:18:17 +0100
Message-ID: <20261118161827.1208649-6-nbd@nbd.name>
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

mt76_check_ccmp_pn() marks a replayed frame with RX_FLAG_ONLY_MONITOR,
as the drivers mark a frame with an ICV or MIC error. mac80211 honours
the flag only in its monitor path. A frame in 802.3 format does not take
that path, so such a frame reaches the network stack. The flag also sits
on the first subframe of an A-MSDU only, and mac80211 does not check the
other subframes, because the IV is stripped.

Free an 802.3 frame that is marked for monitor interfaces only, with all
its subframes, and mark each subframe of such a frame in 802.11 format.

Fixes: 3c1032e12217 ("mt76: allow receiving frames with invalid CCMP PN via monitor interfaces")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 5dbedbca838f..a677c05abe46 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1629,9 +1629,17 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
 
 	spin_lock(&dev->rx_lock);
 	while ((skb = __skb_dequeue(frames)) != NULL) {
+		struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 		struct sk_buff *nskb = skb_shinfo(skb)->frag_list;
+		bool only_monitor;
 
 		mt76_check_ccmp_pn(skb);
+		only_monitor = status->flag & RX_FLAG_ONLY_MONITOR;
+		if (only_monitor && (status->flag & RX_FLAG_8023)) {
+			dev_kfree_skb(skb);
+			continue;
+		}
+
 		skb_shinfo(skb)->frag_list = NULL;
 		mt76_rx_convert(dev, skb, &hw, &link_sta);
 		if (nskb)
@@ -1644,6 +1652,10 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
 			nskb = nskb->next;
 			skb->next = NULL;
 
+			status = (struct mt76_rx_status *)skb->cb;
+			if (only_monitor)
+				status->flag |= RX_FLAG_ONLY_MONITOR;
+
 			mt76_rx_convert(dev, skb, &hw, &link_sta);
 			if (nskb)
 				IEEE80211_SKB_RXCB(skb)->flag |= RX_FLAG_AMSDU_MORE;
-- 
2.47.3

