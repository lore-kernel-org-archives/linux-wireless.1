Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795894943;
	b=of+fWbfsKel2SAAQFxqIEsKeW36bTwreJybeKIiMEKpNeLfsM079nUiG5sytqMV1/w9c
	 VX2EzpLyim9wCzBd0ll9Yz/7+9sJqOraX4HaL+2ZKmaD79yoHCsGUaceopVNJ7FdM4geX
	 J2Y7h+bnamiWX9BW0f7B/UMvyDNKrbS4MooL1mdnRp0vuQKncntvELbMWOSC9W7Et2hVA
	 bwEKaJGimynfK3ve51trpx+uhC/V2qJ+3nVwHGOACbUWgZ+x8JpstiHZMnoKNrxNuiF8f
	 xzj0h7UBfvd+z3KYS7AmMtXvXGF5EFoM0VoaEJ+QbbxRwKckXkmYwr4MStCnk8cQCUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795894943;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bV4jycjfC0LF0lAfr6wM+Ip828npTrvPKNEwF/bPf9A=;
	b=USBxZNmsQFsLZVroeeesiRdSkhcxebvXyBBcdalCeuC394QQ+CZY0IminFDS3SBxvgEU
	 4DTma5EL2ZFT1ZO2uSo4OPiy2lLa1TQewZTa3bkN3Mrvz3k/q98f+E1MoRXjHIFAahqwR
	 ITIJB7+BrL2tPpOE1samq4JIqTSuvaBeSzY0qHphElx73aD+iQHOqwJREcd3qQ8le+6Ir
	 pxNo0r/IRaBmPJ/lJ6uxKov4wKYKedgxHJbZ3YzHooi+DhQ8SssEG9IfR8bKftSKye27+
	 ch2Plq+FAZvCS5EPHNNOGgeEHgJC3/MjZNVPt2PjXNaZx4AR7zZ8W19jri+9SojvlSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=LXfmFo5a;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11872606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11872606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=LXfmFo5a
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4aUho+mbUahBAkAfjPMuEq2B7kraoAvR4J+yDxhxnZU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795894941; v=1; x=1796499741;
 b=LXfmFo5ajJIgrv/FDIRJgqPy1fvjHyw6loxNbHGXD4Z3tfeahDPIxMqrRpoGZsWXrRtRVAlt
 H7VXKqh/oVmiyT4zSjKtgeRSvlL+68OG9eS6fc/TIr/VW8gCXsY58IxcBTVsqwiVkzhqM/pDwWQ
 YnTbswpf0DkQ86yuAe/JQ+cQ0FnfRxat/NbpKY3ybEabOtr4d1l0Jr5pzthAQ2CTzvdj7Rp9gF0
 HZMBP+V7oVocIQjaoIqU76ELTDf0wtOvK5K7GwpfeZrUBEdBXMMaJ86mMpKU0FZYc/JhhaGdqJt
 1rKUqesfR+HbmEa9+AseXoVzC4evkUXNFYYDSeFKrMsQQ==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a5f6d226ac8b44c;
	Sat, 28 Nov 2026 19:42:20 +0000
X-Mizu-Trace-ID: 0a5f6d226ac8b44c
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
Subject: [PATCH mt76-next 4/4] wifi: mt76: connac: send an injected no-ack frame unprotected
Date: Sat, 28 Nov 2026 12:41:56 -0700
Message-ID: <20261128194156.112602-5-lucid_duck@justthetip.ca>
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

An injected unicast frame that asks for no ack can wait behind dozens
of RTS frames on MT7922, or be held for good on a data queue: when the
chip protects unicast frames, the RTS goes to the empty peer address of
the interface's station entry, and nobody answers it.

Send such a frame the way group addressed frames are sent, once and
without protection, which is what it asked for.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---

Notes:
    Changing the RTS threshold, raising the RTS packet threshold to 0xff, or
    turning protection off for the monitor's BSS all left the RTS in place.

 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 0a272ee879e3..3cfffaa40584 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -461,6 +461,15 @@ mt76_connac2_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	     info->control.rates[0].idx >= 0))
 		val |= MT_TXD2_FIX_RATE;
 
+	/* An injected frame that asks for no ack is sent the way group
+	 * addressed frames are: once, without RTS protection. A unicast
+	 * one is otherwise protected with RTS to the empty peer address of
+	 * the interface's station entry, which nobody answers.
+	 */
+	if ((info->flags & IEEE80211_TX_CTL_INJECTED) &&
+	    (info->flags & IEEE80211_TX_CTL_NO_ACK))
+		val |= MT_TXD2_MULTICAST;
+
 	if (ieee80211_has_morefrags(fc) && ieee80211_is_first_frag(sc))
 		val |= FIELD_PREP(MT_TXD2_FRAG, MT_TX_FRAG_FIRST);
 	else if (ieee80211_has_morefrags(fc) && !ieee80211_is_first_frag(sc))
-- 
2.56.1

