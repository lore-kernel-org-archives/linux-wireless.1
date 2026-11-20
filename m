Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=RA1RCubelyBvBMxrxr+jbNzRUDRs7cbf/JokqQd7qfbeuY6TbU5fxEPcoiYxZ1/E+l/I
	 fW1XRtCR3p6AhmIYtdyjlWWOX1lHFunRBpsHdujglURzzi39TlvwHSDhyydbs0u6+fVSS
	 pEEyOrqi6h5hJZ4D8XRDql5MsJbHiRPCtleU37vv2aw8jkfZ24/lw7B1CMqRIkoWNAkD9
	 ptqJ3zLU//NwTTOlRM+mK1Eiu1lxbN3L6rFfE6C39Vc4p61DF+J40+WKAC9DyxF65gl6G
	 8VJzxZM/W05cPXLnjTYFBM6jh7ArHnAg9XCrXtCQGcLL47QZ62/g3YH/lJXiZ8JFJ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CHeQKN9mrBX0We67oAHwuqsejZ5OtEdi+/kXvrVlfPY=;
	b=zBrzP9Fo23kJ0cxgrTapMjmE6XPY2m84nk66iqBLuisGwQbeH81cJUiEucCOwJXytm6m
	 mxavmnEMMZoRdDPcR/XNhvSQcLuc6SlaOaDY6+KrmI/u8veUwXGagbR/5Re28BRdF27D6
	 XEXOw36x7eJAoqVL71rzFkg2yUanjuP1wkt2ZoJ0zGf9M5mYhs6C1HJWYi19GltdVcES9
	 +xtk25V3gaJjuE1UsSJ2mNOM+FpS3i4bWYdL98RpCdlUy2qimVL3HP0Wv5MZpeI10TFOn
	 hlaPHN4nDBCmP5erbpxyvLCy2uQpIigwcThN9kVUK2ARfSzFmpsynZAcEa+sduVn4gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QmfE3sXk;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2560A2618
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD2560A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=QmfE3sXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CHeQKN9mrBX0We67oAHwuqsejZ5OtEdi+/kXvrVlfPY=; b=QmfE3sXk/c+gwKe9BDxkpZEYMC
	CtlvHpD1ET9KVesuwqmaQopout43Eb8uQp9QoJZrhHo0pv258fvnP9CfBI8TwgeNVzRpaIZDTQvh1
	ZI7gZNDES2BjFihJn5bnGMm3CbGzGBslzE4amBULfzWKW4RyhXILCg6EYuNXSRY+ukg8=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfa-0065GI-0j
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:06 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/20] wifi: mt76: buffer Disassociation frames for stations in power save
Date: Fri, 20 Nov 2026 18:44:55 +0100
Message-ID: <20261120174459.1657382-16-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

Since commit 3999d15cfcc7 ("wifi: mt76: fix queue assignment for
disassoc packets"), a Disassociation frame to an associated station goes
to the ALTX queue. The hardware sends ALTX frames at once, also to a
station in power save. A sleeping station thus misses the frame and
stays associated until it detects the disconnection by itself.

Send Disassociation frames on the AC queue like other bufferable MMPDUs,
so that they wait until the station wakes. If the station does not wake,
hostapd removes it when the wait for the TX status ends. Keep
Deauthentication frames on the ALTX queue, so that hostapd removes a
deauthenticated station at once.

Fixes: 3999d15cfcc7 ("wifi: mt76: fix queue assignment for disassoc packets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 72d1021a940f..d8036466f495 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -729,7 +729,6 @@ mt76_txq_schedule_pending_wcid(struct mt76_phy *phy, struct mt76_wcid *wcid,
 		    (!(wcid->tx_info & MT_WCID_TX_INFO_SET) ||
 		     !ieee80211_is_bufferable_mmpdu(skb) ||
 		     ieee80211_is_deauth(hdr->frame_control) ||
-		     ieee80211_is_disassoc(hdr->frame_control) ||
 		     head == &wcid->tx_offchannel))
 			qid = MT_TXQ_PSD;
 
-- 
2.47.3

