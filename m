Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=hmib7j0D4Wf2hEbG4tyIUKS97R+BLyf4+AUX8mxLWkqe504fopvpmf1qx0elqE2Denmk
	 Vkw8qlHBXz0RnjNPuhuDHsGBvATs3S7hR0Ws8OZIo3yk4+c1P+i7BRoAS+0W7DtGVBMti
	 1q4FKkRgMJFwH/XxXSVkNG1Fy3Tf12xKpQz0vTST0dWBSE+q3fD6s3xnC5jM9r1IbNzU7
	 5w6VVS40Uw2xxhJim8Wr9QbcsUdej59e7NU7yKAR1wMaJkP00XBh1T0RMtHqoGOrIw5b+
	 mVK6pGqyKOb4/gO2sfIY7MyKMNb1fyVAntcGzhx6HamURGWTcTUqtnia5UikfAqCaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyje2KgwcB/po4hvmF0OL6Sy1Q5C4tm8xsVXE1lZkOo=;
	b=iUlXAUEd6U1AlPQ/m3Q+HiwENr5xKv7d42tM84Zz51PVVy/Rbi4qa1igUY4VtiG290EG
	 Ba/XKuDySu+J/VWLHBo4VMnZl9aChV7cvlXtrJJP9dG5P3ocvWsSB/Luso3u16xnX/Q12
	 DfePMxW+67hye/Bjk5B9phlTDDc25jSFo/9Heh/vYKH+lHHfvw3uBLI18ogNWZfaPvL2G
	 FbcpYiIqUzlmv8laaHAXYJnuSm/NzlvfnOsbAOdqTq+nRdX5YYUKd3NquIDlhM0+TKmGH
	 JoOnnf5MaTJL7V2YzJYHx219cAUUsP0RlmJ1jHKFH6ssnz4qDf6x141eWUa8kypr9Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MuHcVo7A;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71D606A682
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B71D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MuHcVo7A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vyje2KgwcB/po4hvmF0OL6Sy1Q5C4tm8xsVXE1lZkOo=; b=MuHcVo7A5Dib3QJyIDfijIiio8
	FRb0yhUssTYq500sATiokX2AjEZkk4FXGqDf1+AVMKXbD7X+yluCVS2G3LiLHZcoKOXCL/JGHMSL8
	Z2IR4qqYeoiw16tQiSFzyw/Zi7WGWNlDA7ASiPevbBYE1w5SQBkE0AUGbAKjCQr19FyQ=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-2c;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Cc: stable+noautosel@kernel.org
Subject: [PATCH mt76-next 09/17] wifi: mt76: mt7925: send the MLO ROC only for a station vif
Date: Sat, 21 Nov 2026 13:09:18 +0100
Message-ID: <20261121120926.3603979-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121120926.3603979-1-nbd@nbd.name>
References: <20261121120926.3603979-1-nbd@nbd.name>
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

The MLO ROC asks the firmware for channel time on the links of an MLSR
non-AP MLD. mt7925_change_vif_links() also sends it for an AP MLD.
mac80211 adds an AP link without a channel, so the second ADD_LINK of an
AP MLD hits WARN_ON_ONCE(!links[i].chan) in mt7925_mcu_set_mlo_roc().
The ROC then fails, and with it the ADD_LINK, so an AP MLD cannot get a
second link.

Only send the MLO ROC for a station interface, which includes a P2P
client. Check the type before mt7925_mac_set_links() looks up the link
conf of the default link, which an AP MLD can remove while other links
stay. An mt7925 AP MLD can then add more than one link. Whether the
firmware runs such an AP MLD correctly is untested.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Cc: <stable+noautosel@kernel.org> # enables untested AP MLD links
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 27a622beb147..d99d86bf5be8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1446,7 +1446,8 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 			link_sta = mt792x_sta_to_link_sta(vif, sta,
 							  msta->deflink_id);
-			mt7925_mac_set_links(mdev, vif);
+			if (vif->type == NL80211_IFTYPE_STATION)
+				mt7925_mac_set_links(mdev, vif);
 		}
 
 		mt7925_mac_link_sta_assoc(mdev, vif, link_sta);
@@ -2644,7 +2645,8 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 		added |= BIT(link_id);
 
-		if (mconf != &mvif->bss_conf) {
+		if (mconf != &mvif->bss_conf &&
+		    vif->type == NL80211_IFTYPE_STATION) {
 			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
 						 vif->active_links);
 			if (err < 0)
-- 
2.47.3

