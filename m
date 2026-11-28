Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795894941;
	b=kSGIb0ObJBeYw1+E7EYJGY3S88CHN8TNn8K0R3phPf5HKWVqr9/BC1/KvS15wHesEIxg
	 P/6/uOLuhfBh5ySQc1K6R1jRZilnyxmBo53SpocvG5BJv4h+m/saAdp0I6aAqja/W8wC/
	 UWYUDMqtnUcDKpY8T0SI+tCSf58MizWi+bUttV6GRKweFpTRRmPGgDsTlbP+3VdeS5+ZT
	 pWimCWy/oJlcLJpS7gFDg/5/IytUyzqDPhwRu56n+6iHRBJtWQliIRd6Gm0CFuYWN1INN
	 kFRlpQSWBrBpnkYHiiRNzlib74Ezd/eo4fBEf6TWbmkmOUUpJcb0pKpaXEwj8OFDYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795894941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cPRPZ0t1pSypTUsSdsCNumZannb4eqp56UqEute52nw=;
	b=ftuZYOQyvM2IE7sqMsrJ0jENapITxUo2L3M+Uf/OBqyVrnCEKj66HEmq9FDr8UMCw4yC
	 C3N4m+76a3Urm8O9aYjkSm+KLwLtYKGSVLKkXfoLOHQIbArQlrIVOcfBJggz/u45CI3IX
	 Bp7YmohHRXZjZFrrkHsqrSxjUWKqwa6D4TQE/uxZ78b2fsH+EpxyRG0DvwmpPuC7Zt6Yv
	 LWOAi5BW7+zY4JkX437ReukYxwiFDBr0GXiS+3O6v1dTVEa0RRRdrZp+UW5dlxflb2zQD
	 bAxXw6dEqgwwnE1XzQwVplOFCdQO3PVX8RAnIPg5iK8/wmPmeu06OfoKn1IzO9fqdYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=ssSY8Vfe;
	arc=none smtp.remote-ip=95.215.58.96
Received: from mta1.migadu.com (out-96.mta1.migadu.com [95.215.58.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3C606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=ssSY8Vfe
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qfk4juzHEwE7YVbEhBKsJ+IV9Ovvv8CfuOORRV+XpGc=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795894939; v=1; x=1796499739;
 b=ssSY8VfeY3E3c7cFAqwikWbG1nPhOYMmBdyzjkKuHIW2YLCrQzbF5sAEIFFU3K1Ikwqzibb6
 X7wAVHSvmfeMo8fXCkaYZY4OTTwpuhNl2QGxj8emE6/mbYTqy1YRnDPf2MSicTfOLd858eWhuk7
 XfxmQsAI1lcrSJsMW6pT6NcFMSCGB/74YRzk6/8Y78A0v74KYjUIdZtnQe59emknpAuqWlPSdj2
 EkciQGVTRJTCKnCkJ6TMH3lNASJRyIJf2zd3qTrXQUdbGJRrGd/NifEnqRBBFgj8qkNlOyFmQRo
 5ADHW78GUawpw2xBH884JKNAQONi5aeOJSd7viPrgRmWw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bdd9a5bd1e1e6bc3;
	Sat, 28 Nov 2026 19:42:18 +0000
X-Mizu-Trace-ID: bdd9a5bd1e1e6bc3
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Aaron Beckendorf <albecken@mtu.edu>,
	martin@rfdeck.de,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next 3/4] wifi: mt76: connac: send an injected unicast frame at its injected rate
Date: Sat, 28 Nov 2026 12:41:55 -0700
Message-ID: <20261128194156.112602-4-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128194156.112602-1-lucid_duck@justthetip.ca>
References: <20261104142737.186484-1-albecken@mtu.edu>
 <20261128194156.112602-1-lucid_duck@justthetip.ca>
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

An injected unicast data frame never takes the fixed rate path, so the
rate it asks for is ignored: no receiver hears it on 5 GHz, and on
2.4 GHz it goes out at 1 Mbit/s. A management or multicast frame with
the same request is sent as asked.

Take the fixed rate path for an injected frame that carries a rate, as
mt7615 does.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 0be7efef02e1..0a272ee879e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -456,7 +456,9 @@ mt76_connac2_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	}
 
 	if (!ieee80211_is_data(fc) || multicast ||
-	    info->flags & IEEE80211_TX_CTL_USE_MINRATE)
+	    info->flags & IEEE80211_TX_CTL_USE_MINRATE ||
+	    (info->flags & IEEE80211_TX_CTL_INJECTED &&
+	     info->control.rates[0].idx >= 0))
 		val |= MT_TXD2_FIX_RATE;
 
 	if (ieee80211_has_morefrags(fc) && ieee80211_is_first_frag(sc))
-- 
2.56.1

