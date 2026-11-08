Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122401;
	b=OYsAxKdg9WzZ2BmJkKi2OIlMdhQIbxovxci3l3ekI529ktyf/Npfgxx8hCmH1WUuU++g
	 uTwUPwsxp8tIO2ZW7Earddb7+b3B5U7cXu72iHsC1Fudag2yGmNbMwmfbvtbsrhG0Xpfz
	 vSheUXcjeAFHAg1YTaB0dKNROWiKJ5BG/bDGWVAXD4W/auy1pShKThGPQ3QYYfycPk178
	 ucs6cnifYhyezzTlSuxFAX9a5nisxNZjT3/IsZPSSYUT18fsQzI5MLThDX6/2WFDJvH5y
	 APL9Gywl7V4OGyx7gu33zOPd3AmdMLtRVOrmnDRFQzmABdWACJa0TdK4EhFg2hN1/Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
	b=0+6n/RxRAK4wbVMvMtKMKwuA1NkWYdL16zvXGDpBiv+Jh6yavm8eohKvRfn6AScPOfh9
	 SUOEGpxsXmBc2MQUaRQH54O44NKufgcmvUkmkXpKtChI09t+REZOEweG78Ue1y8gpObXK
	 goMT/yhgZtvaCobxeAYcPv7wsVtFtWQyxRZScCOnObT/PJd04/wUzYA5eSwV3ULnj1MSs
	 5ieUHPAc3dX3qRMjSPex5IT9+SxFb9T2DM3qSCG5Wn5kMCWOC7BpbhCI7o84At1r6/EOA
	 mqvGvfX6IJeBQxX19aj8AHDF7IF3xDTssXbh7f/DYDn+9xjcd6H/z5Q0Du+lKcGdPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfktjfN3;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D62606A321
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D62606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfktjfN3
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14fc585291cso73532c88.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 23:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122400; x=1794727200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=sfktjfN3V37CCy+hrbdEGwDMcQIioSmKt9TB+5jZ2nAWD43mk6QhkJKsqYQAAfMCON
         r/juE6uGaHSB4UZB2luTxhKhlk1zTpl4K01yrIjnCMKvJT9agskrvkF6NtftyMGeiled
         xhjzvplkwq63f8B8TRDysndylgpKERvoJbwQ3ZISBIjRkX9EGsWUg7bw0XoBgFeDuSyI
         MZSLZJ9C95YlE6mrS1oiuD1BIZw928vu7kXTqrjDWiGfD+XBecjtmoqp5g9pWQZBPbp+
         eehUHqKLQAEFoOojc4JULc/UC8i+5M/5EfQnj3SAkcCBnktMK2By/KE8rAO56m97T/fO
         zmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122400; x=1794727200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BAEkxNvBHvI4oVXleZQzH89SgumnMLG6pLMtheddDc=;
        b=oOZ+n1hhU46IHt6yfxdJyeWoLu5OJnscCtgqdWPjSNQ8g3tKgwrGzWFzd3b4cXLPFy
         i0xIFDP8+I+YABYTiptR6eMBvFnUvv/3IQjxO8KlBrUVhKgzS2HG62gg+ED6Wht+O3CO
         hbuQ/RUaI5PASmX0+PFqTOs+oH8lm4vRy/WRYpTJq+nACrcmoS/eQhEOFqvTfdS9lYgl
         p/rdcZSKIa28xy3gHrxCN0T7GGrMpr4+ay2hSP0i1OpwGlvxVKyy8zWxtTDcpYe+92ZB
         x8fv7bcXVZm3P/xHqHpVAJTgr+LFJEc4HTlZsN6eG6l47kC6TBA/iKPKTEL5SUEPY1i/
         DZ5Q==
X-Gm-Message-State: APuU4Z/kvWHmEpS5ZNrJNIXgFcWVN7HInFf3zUVTPLeNbl7Ljr/CaBlE
	iFB7Qe640KkwvKqNkJfXUhBCYW4v7324smWml775xMEsS0ByBQ2HixDzZ0x52q9NGlo=
X-Gm-Gg: AYBFou3Gm2Kq7P1AS4lrtU+havJ4/Zf42bZHLR09bMRC7h1doSOpNKO9/psgBQ3lsbI
	kaEPyJioGW6o4Mx9cML9YaubAuCCixdK/sw8ND+rAzFyGbtZhE8PJDrhfv/VafEWVYyA05+xoPL
	cAIc/TYTGGjb9QfV3WjKKjIjjHVdKyxzzrzA/Z9NlLEiVk4Za2Xp04lLNT8jhYLeYWaRfbyGXxQ
	2u2PbVBuTb8TJDqYMSp7LIxjHVnhbh+Dpm6/gXoVpE+MIOTbPiTKpRidmw4f9VGszmiupy8O31b
	vnwwFOABU1WiTM5XyaS1GpZQ5Is2Lbvc8KxS1To1zzPM9Iq6BOa+ATJ9xSGPVS2YbY+NljsDEHs
	+L49gOoT6Uv80kjQF7wndBHr1mrXYk0hkWwZYfqtaIgydthhvOE6+j6PTgkTTftpPWcKL6q+e3D
	0JLl8k52deCQB9NwnoYXtUIpjvN6mr3LFbj+g9V8IGvBz2EbdmMWTycKimf5Gx58SZVE6mFkFWi
	Am4xw4LgvJFPapVnYxaXoFDhn2ouog2ROCOnnoJqFIXyMS94yLTnLO7/jlcOiLDcr46cNf8KVhh
	W/jBtjK5lYV9gExdr2aEVvPHpEOiQ28//pa4KfXI1yugvTYu/w0FpI+X75Z5/IEtWeY=
X-Received: by 2002:a05:7022:7e8e:b0:188:e51:e86a with SMTP id a92af1059eb24-1b39fe307e4mr1220936c88.2.1794122400254;
        Sat, 07 Nov 2026 23:20:00 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:59 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 4/4] wifi: mt7601u: optimize management frame routing and queues
Date: Sun,  8 Nov 2026 12:47:46 +0530
Message-ID: <20261108071820.35303-5-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

Route management and injected frames specifically to the Voice (VO)
hardware queue. This bypasses potential firmware queue suspension
issues. Furthermore, avoid requesting ACKs for multicast frames and
skip the standard data rate fallback logic for management frames to
ensure stable transmission.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/tx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/tx.c b/drivers/net/wireless/mediatek/mt7601u/tx.c
index 5aeeac0dd9fe7..47c78c4ff5144 100644
--- a/drivers/net/wireless/mediatek/mt7601u/tx.c
+++ b/drivers/net/wireless/mediatek/mt7601u/tx.c
@@ -27,6 +27,14 @@ static u8 q2hwq(u8 q)
 static u8 skb2q(struct sk_buff *skb)
 {
 	int qid = skb_get_queue_mapping(skb);
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (ieee80211_is_mgmt(hdr->frame_control) ||
+	    (info->flags & IEEE80211_TX_CTL_INJECTED)) {
+		skb_set_queue_mapping(skb, MT_TXQ_VO);
+		return q2hwq(MT_TXQ_VO);
+	}
 
 	if (WARN_ON(qid >= MT_TXQ_PSD)) {
 		qid = MT_TXQ_BE;
@@ -134,6 +142,9 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mgmt = ieee80211_is_mgmt(hdr->frame_control);
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	unsigned long flags;
 	bool is_probe;
 	u32 pkt_id;
@@ -148,14 +159,14 @@ mt7601u_push_txwi(struct mt7601u_dev *dev, struct sk_buff *skb,
 				       info->control.rates, 1);
 
 	spin_lock_irqsave(&dev->lock, flags);
-	if (rate->idx < 0 || !rate->count)
+	if (!is_mgmt && (rate->idx < 0 || !rate->count))
 		rate_ctl = wcid->tx_rate;
 	else
 		rate_ctl = mt76_mac_tx_rate_val(dev, rate, &nss);
 	spin_unlock_irqrestore(&dev->lock, flags);
 	txwi->rate_ctl = cpu_to_le16(rate_ctl);
 
-	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK))
+	if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) && sta && !is_mcast)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_REQ;
 	if (info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ)
 		txwi->ack_ctl |= MT_TXWI_ACK_CTL_NSEQ;
@@ -197,6 +208,8 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	struct mt76_sta *msta = NULL;
 	struct mt76_wcid *wcid = dev->mon_wcid;
 	struct mt76_txwi *txwi;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	bool is_mcast = is_multicast_ether_addr(hdr->addr1);
 	int pkt_len = skb->len;
 	int hw_q = skb2q(skb);
 
@@ -211,7 +224,7 @@ void mt7601u_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	if (sta) {
 		msta = (struct mt76_sta *) sta->drv_priv;
 		wcid = &msta->wcid;
-	} else if (vif) {
+	} else if (vif && is_mcast) {
 		struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
 
 		wcid = &mvif->group_wcid;
-- 
2.56.0

