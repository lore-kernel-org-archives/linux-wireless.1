Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628187;
	b=cu8v96ZlYfd000JiRTw0SEU80gtyQou0gZ73KR3XDFky+dXLoa9RWMapwldzOZKwNvaz
	 BSxVAwgj4r6ZPwKluSFcmz5L45ginUNvuHQRlVxG3AnnaEYOm/EM41OZAosyQ+NzLjN32
	 +CAysOvzUV3pm6ZYMNTWr4ik8BCF3GDUFC8D175junSLhS+zXEMeXmauY5OIW1cDhS/Xp
	 +wfHYFyPh6Mu7718aSxjRLpUVfhyJYtBdX/lVqQsrtgKjK6melE2ie3mP7JgtEB9T3Msl
	 SmcI2WhG1RBipFcPXfK1edfvUOZ2rC2lfltB5xHBunZt39YzmSi7hItR5ylx8rq8EUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628187;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=owdb37qeIY2RfuCQ4GfdGnL2yBpNzhtSicEvaX4/qqU=;
	b=iFCe5BnJr3D0bXCbHMPeI763AhO99CvVPmt851LK5j/uP025D4AuDWDkcP+AthfA4wN+
	 lAOuXaxfH/katHZFIBTexa5brJfaAT7vRlASoZd+N2jTdUIVmU0BGxu5arcmydrPs21mv
	 Q/Q91esdwPsBAS8l+0X8lsW7mF+NBLtPeKu/k3HKQQX1j8TOVElk/OYtfP/p5N8Z9J/SA
	 6wVcS0aOaoYw1iPk2iSKMcGFdIf5t5pnx7gNg5yiUx7YuyWHsTISvEz1OfRaiwnlgIE6k
	 SBMrnXh9Eob3oKITH+tTNw38ddeVn4LC5X8NS6A6YlE7L72d4zqtRx+sDd2xMJUnxyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="PrRC5X1/";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA7606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52FA7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=PrRC5X1/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=owdb37qeIY2RfuCQ4GfdGnL2yBpNzhtSicEvaX4/qqU=; b=PrRC5X1/UvWAv/6ShQ7ZYNPh+X
	p709IiN/+m/QV8n5PJB8OW2PuMIYpX2hqq+w6BFSD2r9gC5W5uEIo81840LIprPlA+PKwvoKnKPmJ
	G8NcJz910pjP2i1SRZ1mjY9a24UVN7MhxI4fEzhbzpSIxVnd0Ie/0CI/K22lVIB3YVuc=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuv-008IWP-36
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/18] wifi: mt76: mt7996: report the tx power of the requested link
Date: Wed, 25 Nov 2026 18:36:03 +0100
Message-ID: <20261125173616.3776951-5-nbd@nbd.name>
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

mt7996_get_txpower() ignores its link_id and takes the phy of link 0.
Every link of an MLD thus reports the tx power of the band of link 0.
Where link 0 has no channel context, each link reports the power of the
last radio of the interface. Reachable via the per-link tx power of
NL80211_CMD_GET_INTERFACE.

Take the phy of the requested link, like mt7996_sta_hw_queue_read()
does. A link without a channel context keeps the fallback to a radio of
the interface. That fallback serves an interface without a channel.

Fixes: 86db2c5d4ed3 ("wifi: mt76: mt7996: implement driver specific get_txpower function")
Fixes: a9eae65d97f3 ("wifi: mt76: mt7996: Export MLO AP capabilities to mac80211")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ac4f8b89bd90..bcae654a2b47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -985,11 +985,21 @@ mt7996_get_txpower(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		   unsigned int link_id, int *dbm)
 {
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_phy *phy = mt7996_vif_link_phy(&mvif->deflink);
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct mt7996_phy *phy = NULL;
+	struct mt76_vif_link *mlink;
 	struct wireless_dev *wdev;
 	int n_chains, delta, i;
 
+	rcu_read_lock();
+	mlink = link_id ? rcu_dereference(mvif->mt76.link[link_id]) :
+			  &mvif->deflink.mt76;
+	if (mlink)
+		phy = mt7996_vif_link_phy(container_of(mlink,
+						       struct mt7996_vif_link,
+						       mt76));
+	rcu_read_unlock();
+
 	if (!phy) {
 		wdev = ieee80211_vif_to_wdev(vif);
 		for (i = 0; i < hw->wiphy->n_radio; i++)
-- 
2.47.3

