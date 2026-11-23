Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447347;
	b=Lo9v6DJytX7tPV6xO4BObdVRPpDkH82ialspXY62yt7gbTCtid1rEyGE9ZJ7vey3bmVK
	 v6buhW52nUZRh9nZOP65VSCUDGqhZaCKcxQ2xAK7NQ6DVPgAg0Uqh2T25ldQ6+cenOhN0
	 bxoCzWD0ZwELmL5n3AZEdm+X+9+afjMkzoUNHLaYmmI56+5Z179GCas8KER0WAHDFe/DS
	 ki1INc3yy/oE80g0tMfNBbW/LnIHf8xYZBAUq+IosVvdpWSZsSoNMu84DNvkri++sQS9A
	 47njm3+8WuFAQQ6GW4eOwvRq6SFcfehPJ5nMKMV0huWGbuHI6tluucaIOePFUp75MOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447347;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uEmIcA4u42Z9qeyvnoKEArIyxYyYC6zeHPEXXZ2YbSs=;
	b=QPQ7bQw6LcRCpb+VVbF7OklBtiGTM53egkLwEwm2hhOxafrjnd6Bt9L+fR8ACyfmO+au
	 5gMUT2p4blftZ6UGo5JFURIOHITMNFYNg5/8q7LkDSk3NcEYBCmn2Zmhou2GbCVrGBYaH
	 Mo0TxRUpj00H3U0dlmdt4nz3Gv7WD6OMJhbYsy1g3fSJ4vtBwP6Bm1KzPAQmkgNNskAWI
	 tcgWmh6ACZ8LxnDtp7RNAGAhq+b3GKzO+y/e0Iidi3B8L6hK5jW+oLdDp8Lp1gYw0x3a3
	 In45A7+B8gogkjaDWQ6Rqi5Ft/H95juCE3aFm/gzhH1nbkQ02JraiYlH1dqStLqNqnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=pu9K0J6f;
	arc=none smtp.remote-ip=95.215.58.227
Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B203606A327
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B203606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=pu9K0J6f
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0fJFoarfkDw25F9SrIg4i9jJZ381U0w0LxrLj8NhL7E=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447344; v=1; x=1796052144;
 b=pu9K0J6fSD0iW+JqMIdUYpUmHiWcaXDDUNh6dn3OTaNV+H3cbOUmupUYy8+p2X05THNjw3H1
 1BL1Un6Aj3pr3/UKdTUi+qKMdTbXCL6AClS+VZ1KRYFAW3uIfxwy3nN5AnUgTCuPCuuGRMJUB+l
 dgSN1J69yfB6EzdzmQSk3aOqPYWgENsdf+YCKExQivsR5mZb9oSPZhUtPtRtkov2rPigh7kSyL+
 vfPgTgqw/QmkLYForM1CA48YSTd16XZRhz9gwh5zq8xreFqY4/2uqzMffn5Ub8cxjpL/ItUhmxZ
 TGJaemitE57K0lySANbwRdAttMYmrs0o97Yax/Cd/5ZcQ==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f568d7c378977dc;
	Mon, 23 Nov 2026 15:22:24 +0000
X-Mizu-Trace-ID: 6f568d7c378977dc
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 3/4] wifi: mt76: mt792x: pass monitors to the driver as real vifs
Date: Mon, 23 Nov 2026 08:21:53 -0700
Message-ID: <20261123152154.99634-4-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123152154.99634-1-lucid_duck@justthetip.ca>
References: <20261123152154.99634-1-lucid_duck@justthetip.ca>
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

From: Mark Anthony Agarro <markanthonyagarro@gmail.com>

An active monitor on mt7921, and on mt7925 other than MT7927, never
gets a channel: its request goes to the shared virtual monitor, which
it does not use.

Pass every mt792x monitor to the driver as its own vif, as MT7927
already does. Commit 55e95ce469d0 ("wifi: mt76: mt792x: improve monitor
interface handling") did this and was reverted because capture stopped.
Commit a7d35545c2ce ("wifi: mt76: mt7921: assert sniffer on chanctx
change") and the previous two commits arm the sniffer it was missing.

Signed-off-by: Mark Anthony Agarro <markanthonyagarro@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 7dddce02d600..3b27bfcbdb83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -891,10 +891,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, HAS_RATE_CONTROL);
 	ieee80211_hw_set(hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
-	if (is_mt7927(&dev->mt76))
-		ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
-	else
-		ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
-- 
2.56.1

