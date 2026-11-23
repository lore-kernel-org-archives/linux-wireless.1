Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447354;
	b=1sTw1PvBqpOZwY2Ds9ylO81et0MoIsuK1Hy45psE+fmXCAsTQzIxjsdpiisTA7ZXcSLR
	 zB8e3EnuETE0cWe/WgwQBnpkyDnu1f6RKF0GCgcvXbezYUG26AkX3pr/ja5h1tjLvO0w0
	 t5NMaaxVbAVziPzYvgDqBSAHVCz1qvSObsaLqvsuNt5JBNirhoL0ZBO5LI84zwFvxFoCB
	 Mr0qx6VUMHVjsxuI5TY+RabECluwV3ktISa7x4vRxVBkGFiab6VGafYX6h+0o1o9kfAyo
	 Pn8mfOZbMYfCrBuQq3HA7kUS2Ao6/iN378WBpks8hEKPBWAvRtWNyjB6iaGUZO84OSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447354;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HcS5wYysNaCbBqnajE5qCH0++TXiV2CXFNiPR/dWTg4=;
	b=jz4CurB5qZqpl7AfO9M2KmhcPF33k4nESO5C7Nhnn7QjR01Y0wAr+k+iBV7U9C/aveoV
	 YTSWXBW3UexT2p2vNJK2h7L5akh7W6ncRbRN1TMu0O+LgNiyq/DmJQ8nguKUkb2iwqJJS
	 Td1/uMgO3V/FKbOWkdWQfaIeOtpl7l99O48HNlLlBj0yTU9OaQORdcym7Pd+Iv0aJQzUu
	 4IIJm1B50+MuE8NvNNexaqYF3mkZFXBWJEhZuFxH23D+YI9j3JcP9KLfTPLrKyOtIseF/
	 F03jv40GyQP50e+tXqI/5o6+U0idoxaDof4utRTNz+khTTucN7G9ySa9bdWXWTj6S8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=GjscUUnK;
	arc=none smtp.remote-ip=95.215.58.233
Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3236606A331
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3236606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=GjscUUnK
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ggMBGZ+Z9UM8meVF2o4NGJejb8CFU+fXep/TM9+RzTo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447352; v=1; x=1796052152;
 b=GjscUUnK5h3480NsoT3JZrgZX+qldzRh4W80nya0djMieDx4qGRpP1cJT+HZ0+fGohc4KR+G
 F8jfnIW1QP+QQhTOoeQoN/7YRFnDihVJ9VgR5uyF4ckYTRbgmbvYKwz0CuCwHc0ApfmzbGoWVMS
 cE3ESNfN2oH387iHE5cR2FpzP9sl29f4lmVGeupNG2wfMGtj56yhTaT9M8fiQPD+R5VNA1i8gQb
 HxmLJmARWHF7llnW3q8fu3VeQIUQTVrb06Sz5VcjvfSFQ5M2mn/tRPr65LX34zsztdbrfCXhzMe
 k6X6ZQAXRe8cVTAPBdcm03ILZhb1pQ98ylgTzxDJ/YTfA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2039d1af0ca240b7;
	Mon, 23 Nov 2026 15:22:31 +0000
X-Mizu-Trace-ID: 2039d1af0ca240b7
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 4/4] Revert "wifi: mt76: mt792x: do not advertise active monitor"
Date: Mon, 23 Nov 2026 08:21:54 -0700
Message-ID: <20261123152154.99634-5-lucid_duck@justthetip.ca>
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

This reverts commit 6f6c9800e54c ("wifi: mt76: mt792x: do not advertise
active monitor").

That commit hid active monitor, saying the firmware stops receiving in
that mode. The monitor was missing a channel, which the previous commit
gives it. Since 7.3, tools that ask for one, like owly and hcxdumptool
-A, are refused.

Advertise it again. Without the previous commits a lone active monitor
is accepted but hears nothing.

Fixes: 6f6c9800e54c ("wifi: mt76: mt792x: do not advertise active monitor")
Link: https://github.com/t4t5/owly/pull/24
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 5 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 1 -
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 948f9ed26095..cc551c7992ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -449,9 +449,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	SET_IEEE80211_DEV(hw, dev->dev);
 	SET_IEEE80211_PERM_ADDR(hw, phy->macaddr);
 
-	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
-	if (!phy->no_active_monitor)
-		wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
+	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR |
+			   NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
 			WIPHY_FLAG_SUPPORTS_TDLS |
 			WIPHY_FLAG_AP_UAPSD;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d82d22c14c9f..d122e59a5ffc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -883,7 +883,6 @@ struct mt76_phy {
 	struct cfg80211_chan_def main_chandef;
 	bool offchannel;
 	bool radar_enabled;
-	bool no_active_monitor;
 
 	struct delayed_work roc_work;
 	struct ieee80211_vif *roc_vif;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 3b27bfcbdb83..1cc4539845dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -877,7 +877,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
 			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
-	phy->mt76->no_active_monitor = true;
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
-- 
2.56.1

