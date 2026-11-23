Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441766;
	b=jEYRHHF5a/D2kAqTxui0OQbw14EX6ydHwd4WOS8L7RF6Lpu19x9prsDhV6xyNn2YIVDC
	 m2pZb7/ftly4ft9mrv5JVLD8s+o4hk99B25NV3+1+Id0UtmLDfl1Sd9aM0GHYP43u0YJ+
	 qCrCnC1CxZI0jNGcfBdC6tnpmVWhiyOpzDUwgNq3T/Tzb4fbt9uU4nWxSOi7wL6452FRB
	 JCsRm8M/P45PYJmMg4fTR8HWEJzrPJcgMmDxkICVB1yIWSYVjThf8icl8rAyjFdWchuge
	 Xa18uDG5d266dZubQO378q1q7bTDwQeSEu3OlkTlX3Z/59Ekkaky/lZERsB+16QG2pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S7r7Nq4bl3TbwPMkKibzRaSAMxNXbMQbr9+AWhms2Bg=;
	b=ikC0QcEcWp7Z/fVuBVKsF2QhR/xQnWozng4rsGFy/9Jp85HlOk+tbzZk7wROX5kZWIb2
	 OMjn22LqQM9LDKBHvXjHsgp/+VOkVvKCJAVTHLn3IpDntXcmWIDGOZX7sQyGscDHQDt6M
	 j0p73/5BVjuJfqQl5NmtwsZo/2LpYmEwXSedwWQeIZpyZ5boh1lLTcoVYyurl2dDy98wD
	 azqJuYVEHaLJHHHBWQKwwJ3W29FxzqE6fDOsTBe/7yltYwbwP7h51t/5z7Om/pMB+YKZU
	 vwl0g/4Tdlw2NKY0oasbom+M/k+sebkDDQLui3actPymhb5M2AP8dmKhoi8dTFOXApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mWJKXsrB;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232F606A6A2
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7232F606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=mWJKXsrB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=S7r7Nq4bl3TbwPMkKibzRaSAMxNXbMQbr9+AWhms2Bg=; b=mWJKXsrB3JKGxnLykXpEbZ0uXj
	fOcOZckMpwB0CQa0+md5WkSCYwsQ+CDY3I2R140+3V8PuGrHWp7WHHlcf8ypPEDnR27ktFHbTX4ni
	AugKvFRhG9Io5d/JmY4xviONrV6VIaH/80/emYV/b77AeexURpiX/zJ2A0BNVBZbd8FU=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ9-007NFk-0B
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 20/20] wifi: mt76: mt7915: reset the CCA statistics of band 1 on mt7916
Date: Mon, 23 Nov 2026 14:49:19 +0100
Message-ID: <20261123134920.154270-20-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7915_mac_cca_stats_reset() takes MT_WF_PHY_RX_CTRL1() on every chip,
which spaces the bands 0x10000 apart as on MT7915. On mt7916, mt7981 and
mt7986 the bands are 0x100000 apart.

A channel set of band 1 thus writes the statistics enable bits into a
band 0 register. That register lies outside the RX control block. The
restart of the band 1 counters at a channel set does not reach the
band 1 register.

Use the MT7916 register form on the chips other than MT7915, as
mt7915_mac_enable_nf() does.

Fixes: 2e30db0dde61 ("mt76: mt7915: add device id for mt7916")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index d444073af4ea..e9b1704d1289 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1099,8 +1099,11 @@ void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 void mt7915_mac_cca_stats_reset(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
-	u32 reg = MT_WF_PHY_RX_CTRL1(phy->mt76->band_idx);
+	u8 band = phy->mt76->band_idx;
+	u32 reg;
 
+	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_RX_CTRL1(band) :
+				      MT_WF_PHY_RX_CTRL1_MT7916(band);
 	mt76_clear(dev, reg, MT_WF_PHY_RX_CTRL1_STSCNT_EN);
 	mt76_set(dev, reg, BIT(11) | BIT(9));
 }
-- 
2.47.3

