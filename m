Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=yJRIEIy1y8NRDSyTyBOyVza7kG35BN5kZYd+gRmetCTqhA+VMKswBpgSPtcxK+RYRGes
	 OG0QTpRaz1FbHn74lJ8/dVdesf4AbYEse2DGS6RuKrAAMxRW8Zg2m7lBdkArq4LoqAWup
	 7cjaib5o2nGyJvMf/aUqxLyDnaZUU1tGkrUy14A2Lh6du0ZUOc2QvHWOO/2Q68b1a4wJO
	 aAQwFJDKcAZuA/e7mu7+MJ3qA1Ymte5Z5c/sJceKJo5LKbXoqRvNmwAZdckr2X/JEA82o
	 bXcGCJksutK3QtFF5LVeDIcxSNhJbkXu1mYA3qIAsfcyP20P0x0jiK+uBoe0503TNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NP9w3UXG9nqRoIY3nbTbR8YkCY5F8G+nyyG71WmBc2c=;
	b=M2owjdAuuRXck/ZZUWRlABDeLAhCtVIsOglGQ+jExpFL0w9CBBUpDdq+zxEPQ4HfmsJz
	 Ic/ZBm3DPb5iWFFRRqwmQ9ak8IhW3YosJLXlVRDfPR6CVkzo7qKFpeeR+kndh/ZwcSgwT
	 C1osYjW8L6tl7f6v4zG4W1qH+pZdwfpMrIEu1sgHtOALMLo98myUHtngEbwvrf0e0ubLg
	 uYLXg2/b39CkPXyhyLLemYf4hudKKdruVyI84PtQepPIb7qvRk2K9ISf13o6g5/2/gKZP
	 mnCVlGGLTanfY2dPtrmfQ1F71jsM/E5MlHh6WMBVFWRWN6+7ysn+p4Ui6411s5sbIiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VJBqLIyg;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7F606A893
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC7F606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=VJBqLIyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NP9w3UXG9nqRoIY3nbTbR8YkCY5F8G+nyyG71WmBc2c=; b=VJBqLIygpY07u5yNYwfg0VGABf
	u/umhi1+6Q4DAlks14QTLrfpudeT2gCX5s7hk20BlFX55PUE+XHuqxYhKd6idlwRRVtgGXoHN3yel
	18Li0OTjm7D4gavYWoAXt3L7ZLQqmvrCD8+3hmdlYi3yenafeE6HztIMP/xk9wGYVZkY=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV2-004eiZ-03
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:44 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/19] wifi: mt76: check the PN of a BA session frame at its release
Date: Tue, 17 Nov 2026 19:01:27 +0100
Message-ID: <20261117180134.2940930-12-nbd@nbd.name>
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

mt76_rx_complete() checks the PN after a frame left the reorder buffer,
outside tid->lock. The links of an MLD peer share one PN state, so a
frame released on one RX ring can be checked before an earlier frame of
the same TID on another ring, which then reads as a replay. The reorder
work has the same gap on a single link.

Check the PN of a BA session frame where it leaves the reorder buffer,
under tid->lock. mt76_rx_complete() still checks all other frames.

Fixes: 30ce7f4456ae ("mt76: validate rx CCMP PN")
Fixes: 62694ed0b76f ("wifi: mt76: check the RX PN of an MLD peer once per peer")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/agg-rx.c   | 11 +++++++++++
 drivers/net/wireless/mediatek/mt76/mac80211.c |  6 ++++--
 drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
index bf1babac3895..49721b4faab1 100644
--- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
+++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
@@ -12,6 +12,15 @@ static unsigned long mt76_aggr_tid_to_timeo(u8 tidno)
 	return HZ / (tidno >= 4 ? 25 : 10);
 }
 
+static void
+mt76_rx_aggr_pn_check(struct sk_buff *skb)
+{
+	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
+
+	mt76_check_ccmp_pn(skb);
+	status->skip_pn_check = true;
+}
+
 static void
 mt76_aggr_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames, int idx)
 {
@@ -25,6 +34,7 @@ mt76_aggr_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames, int idx)
 
 	tid->reorder_buf[idx] = NULL;
 	tid->nframes--;
+	mt76_rx_aggr_pn_check(skb);
 	__skb_queue_tail(frames, skb);
 }
 
@@ -204,6 +214,7 @@ void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames)
 	}
 
 	if (seqno == head) {
+		mt76_rx_aggr_pn_check(skb);
 		tid->head = ieee80211_sn_inc(head);
 		if (tid->nframes)
 			mt76_rx_aggr_release_head(tid, frames);
diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index d72ade2d46cb..b1789be134d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1387,8 +1387,7 @@ mt76_rx_convert(struct mt76_dev *dev, struct sk_buff *skb,
 	*hw = mt76_phy_hw(dev, mstat.phy_idx);
 }
 
-static void
-mt76_check_ccmp_pn(struct sk_buff *skb)
+void mt76_check_ccmp_pn(struct sk_buff *skb)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct mt76_wcid *wcid = status->wcid;
@@ -1403,6 +1402,9 @@ mt76_check_ccmp_pn(struct sk_buff *skb)
 	if (status->flag & RX_FLAG_ONLY_MONITOR)
 		return;
 
+	if (status->skip_pn_check)
+		return;
+
 	if (!wcid || !wcid->rx_check_pn)
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8f8388d44aa9..0b16567920fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -774,7 +774,7 @@ struct mt76_rx_status {
 		} eht;
 	};
 
-	u8 amsdu:1, first_amsdu:1, last_amsdu:1;
+	u8 amsdu:1, first_amsdu:1, last_amsdu:1, skip_pn_check:1;
 	u8 rate_idx;
 	u8 nss:5, band:3;
 	u8 chains;
@@ -1842,6 +1842,7 @@ void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
 void mt76_rx_poll_complete(struct mt76_dev *dev, enum mt76_rxq_id q,
 			   struct napi_struct *napi);
 void mt76_rx_aggr_reorder(struct sk_buff *skb, struct sk_buff_head *frames);
+void mt76_check_ccmp_pn(struct sk_buff *skb);
 void mt76_testmode_tx_pending(struct mt76_phy *phy);
 void mt76_queue_tx_complete(struct mt76_dev *dev, struct mt76_queue *q,
 			    struct mt76_queue_entry *e);
-- 
2.47.3

