Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628189;
	b=hqrW+G+3ScSSdz8elES9gLhblV6eCj9ORiM3E/9osYlaGrRJzakoQKdgucpPu68prSDN
	 17ZXYKktrA5Bb0TuFzhMFT/NzWkF5pWd/0ru1uxIeCHpznExYr3VIXN5GPoyQOdH1s2nB
	 trTZK3/wzF6CpeAGBJ3lgsKI4eEIzpZa+fAUijSiws/8dh5SALoTuZaBKwq9WInskcyBE
	 jMrBJC/ZFBDx3jSQzm3mZd4LKMf7lriUshOpjxXAPqYMDOVXQPCAVR8HiAThFZ4i0jH52
	 wU9ceBEvMqUbr8uwyDyNVVp9dlWKQpg0zHDBI6TlEiBSPIrFLSh582v4n30g2rxkmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628189;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YwjL5x5pDOSk4Aq+7iw2qsKukJXkaae2PzvV37qSG3M=;
	b=xFek1LeLOKiFSWEke9GaxuTLkIYczUqrfuBZUFT6lp0dO7wrKSw6IWCHwEkiehx5PDyI
	 3bT7XNGU6EMO02W4Tito8QJ7w2sTOF6wfIPsBkXamlMYCvzKNX7KoMSneLWTWO8sHQFAl
	 U4pPET8e24RJ1QyBTNQjZVfJfQFQfZ2MlUdj+oupf7z+dUP75VdcF13VhmIzQrI9rxLFc
	 ot2PunKKytQUJwJU2m4oTwmXW/x7HebWK7u9/2g2dKDU5QCSSEwlT/PQ57tUArsBOfWHR
	 PNv41DhG5tlIBnbvKjAG9ETdXob5ZefgDJMTPnecyUGYZfLioJeFVzXU4851a9eRCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gOvJslaC;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB18606A69F
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB18606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=gOvJslaC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YwjL5x5pDOSk4Aq+7iw2qsKukJXkaae2PzvV37qSG3M=; b=gOvJslaCBWqyxr5/GY1MJ5deCy
	RQF8zu8zlbF0qUPOimkmITZiB4yvNtTruhuqF4D6ne4v7DJwX7mUdMRHY6eJW0/GGKvAmt0i3GNnd
	QO29eM4eujKQBFIbomXcL2y9DOv4p88BDeNYIMkGYldGV2QYinXhh64lxbVxB96laRPw=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-2s
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/18] wifi: mt76: restore the operating channel after a failed ROC start
Date: Wed, 25 Nov 2026 18:36:14 +0100
Message-ID: <20261125173616.3776951-16-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

A remain-on-channel request whose channel set fails leaves the phy off
channel on the ROC chandef. mac80211 ends such a request without a
driver call. The band thus stays off channel until a later ROC or scan,
a chanctx change or a full reset. Until then it sends no beacons and no
station data, and the radar detector stays off.

Go back to the operating chandef and notify the return, as the end of
a ROC does.

Fixes: 6939b97ddad3 ("wifi: mt76: fix deadlock in remain-on-channel")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 22 +++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 6d9ca6dfecb7..b3c17f76b101 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -392,6 +392,19 @@ mt76_vif_roc_phy(struct mt76_dev *dev, struct ieee80211_vif *vif)
 	return NULL;
 }
 
+static void mt76_roc_chandef_restore(struct mt76_phy *phy)
+{
+	struct mt76_dev *dev = phy->dev;
+
+	if (phy->chanctx && phy->main_chandef.chan && phy->offchannel &&
+	    !test_bit(MT76_MCU_RESET, &dev->phy.state)) {
+		__mt76_set_channel(phy, &phy->main_chandef, false);
+		mt76_offchannel_notify(phy, false);
+	} else {
+		phy->offchannel = false;
+	}
+}
+
 void mt76_roc_complete(struct mt76_phy *phy)
 {
 	struct mt76_vif_link *mlink = mt76_dereference(phy->roc_link, phy->dev);
@@ -402,13 +415,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
 
 	if (mlink && mlink->mvif->roc_phy == phy)
 		WRITE_ONCE(mlink->mvif->roc_phy, NULL);
-	if (phy->chanctx && phy->main_chandef.chan && phy->offchannel &&
-	    !test_bit(MT76_MCU_RESET, &dev->phy.state)) {
-		__mt76_set_channel(phy, &phy->main_chandef, false);
-		mt76_offchannel_notify(phy, false);
-	} else {
-		phy->offchannel = false;
-	}
+	mt76_roc_chandef_restore(phy);
 	rcu_assign_pointer(phy->roc_link, NULL);
 	mt76_put_vif_phy_link(phy, phy->roc_vif, mlink);
 	phy->roc_vif = NULL;
@@ -485,6 +492,7 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	ret = __mt76_set_channel(phy, &chandef, offchannel);
 	if (ret) {
 		WRITE_ONCE(mlink->mvif->roc_phy, NULL);
+		mt76_roc_chandef_restore(phy);
 		phy->roc_vif = NULL;
 		rcu_assign_pointer(phy->roc_link, NULL);
 		mt76_put_vif_phy_link(phy, vif, mlink);
-- 
2.47.3

