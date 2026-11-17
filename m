Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=vARO5AR8IMyKqkZY+tCyiXKjeQAzCML9Rauh5ff4/QVZdoDyz43JWKaf3ZBAAeR0X8bS
	 Cwal6mL2qFULu4vtuPhZOrS3LcrLLB1giUFh6YYyNoLaKGGEoy+hWSgRl8TpDVt9HssAS
	 EdS+qTrvdRWa7eVA0SOvG9QCqzeUxiWq50jt2ZRKPE0ztBEUUDN25fnMtPiPzLR2U6O0B
	 o51er97Sym71jKHt3Fcc4IAOtvLJm8XkjULD9d/YeuJd63mD5+XYUf6ApMDEVzM7Nj5nY
	 oCKIeF7V/JDG0g8rx02q1wt9McA9WR0kSkmTgzMFyxoZw0a3MGHWBX1EVg9YXZVue/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pNlf/p34+gX43gKbPXdQvIdDLJE47RcsJW48qvpz2As=;
	b=G9/6jgM12WFbX/bP7sFbiRftAHbIeNsaeDcIUYlVZETZgLsXEyM7JGoVp9hDCLk5I17T
	 aC+36YFCdz2qMobOAFykpYgKtmWliUISnNG3v2h9C6IW4/R2+N3RnRRXrOsgTIbyURdIS
	 jxoQ62GC8AsobHpiT+0AdOzskisTBebNkxTwHeQl0FMW2yk0yy45ggY4W1hKDUI0XnCwF
	 fix+Ep/+jWQuamNuqtyYyKru4ThTcVb6jpHLNNcNhFH1Adr0CmnsDUmC9zAqJ86MwgQdK
	 v/2qyDjFJHJ3QMXsMxX2cSx/nmCH2SErz+uZjnqo1RAkDNXQBzJwZbRdWYluoRt/dAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=RbYP3uAC;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AD606A88F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0AD606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=RbYP3uAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pNlf/p34+gX43gKbPXdQvIdDLJE47RcsJW48qvpz2As=; b=RbYP3uACX4EGWf83+OWdmlr6o+
	1du/1stagQBWp4JzlRNRQOXrExrXOpenC8z/xQne7OtMSnB8gwzg6JQ3uyAZcO30seLcEN/qaO59D
	7yQbIE6SiMebEWCoc2fd9de+IL3LmkJxsBpNNd5PWHQAHNerFOz/ay4zC1MKuXpfBk7c=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV1-004eiZ-2D
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/19] wifi: mt76: mark all but the last subframe of an A-MSDU chain
Date: Tue, 17 Nov 2026 19:01:25 +0100
Message-ID: <20261117180134.2940930-10-nbd@nbd.name>
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

mt76_rx_complete() passes the subframes of a hardware-split A-MSDU to
mac80211 without RX_FLAG_AMSDU_MORE. They share the sequence control of
the MPDU, so in 802.11 format ieee80211_rx_h_check_dup() drops the later
subframes of a retransmitted A-MSDU as duplicates.

Set RX_FLAG_AMSDU_MORE on every subframe but the last.

Fixes: cc4b3c139ad3 ("mt76: mt7915: enable hw rx-amsdu de-aggregation")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 271fbd4711f7..d72ade2d46cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1625,6 +1625,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
 		mt76_check_ccmp_pn(skb);
 		skb_shinfo(skb)->frag_list = NULL;
 		mt76_rx_convert(dev, skb, &hw, &link_sta);
+		if (nskb)
+			IEEE80211_SKB_RXCB(skb)->flag |= RX_FLAG_AMSDU_MORE;
 		ieee80211_rx_list(hw, link_sta, skb, &list);
 
 		/* subsequent amsdu frames */
@@ -1634,6 +1636,8 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
 			skb->next = NULL;
 
 			mt76_rx_convert(dev, skb, &hw, &link_sta);
+			if (nskb)
+				IEEE80211_SKB_RXCB(skb)->flag |= RX_FLAG_AMSDU_MORE;
 			ieee80211_rx_list(hw, link_sta, skb, &list);
 		}
 	}
-- 
2.47.3

