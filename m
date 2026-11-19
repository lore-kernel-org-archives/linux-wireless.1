Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=FJUN1ctKa9vsA/70t8ItxhU9Xudq7fVSUk6xd3LiQxo4s6NWBOmrdSVp9yC9k2PVtrw+
	 8av3mHH56GRfwCu3UqesnN0vXOuoVZRCGcousxlVuq40wURuK/cWey/fasQATH2J8AO4y
	 iVFML8EfEKX5bblnODh5boqdxQ9A6boNfWpee/ogyBoavBX3yfOFjy1xKtjWts51aTjTq
	 fPuKbP9p+e6q0irm28q4WO3oP465AKm/mGU9fquy2ObVFI40RjUraNaXaVff5MpHKzkHG
	 j4ZJvmeke86HvGdpk6MXBw1aShlw2SOwkni92LHNIejd0xuTzqbynEvYs+YY/7bBKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=odzehRMrAyjSdHZmcAs/6JJtHpOX3bbPb75u10ke2sU=;
	b=LdQQBtKIAhPwRvGj0KGD26Os7AdzK1wGdeaD2jycRXKf6pBr5igkG8DspxidDKPGJK9D
	 g3bJzW+efDdW6O+zLkz1BhlrBugcFi7Ms5zhm/GfdfbfsA3aeVCLD6z9wToVKsz1y0wzI
	 CWIr9z8lzzNHDdDW+CP7mNKM8nakBlTc20TOTohPAagBl+aATITNndvVP9hQ4ggWzlbMm
	 xzrvOJ9AV29YBfyZKdWKYgAt65ropcRG5ZgfADYCRAD4YME19TUrdlgXJspJAoGd6DDDA
	 tt8eB4O4S174hJ6Ko4quH6UZwk5VqgX/1+l2fQ48OFo+0c/D7NoiC8uZ9Ebiz9DIoFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JoRYMlnz;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51460A262D
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A51460A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JoRYMlnz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=odzehRMrAyjSdHZmcAs/6JJtHpOX3bbPb75u10ke2sU=; b=JoRYMlnzh4O3AeYUjJNjz9Mbnd
	XJkgyf2tNidj3rEUxapUMoE6hCqP0CgVK0LtYrz4zUAYbtrEfuazeihsMVesSoRmm84J4B09azJp2
	E4vFL6z2K/GXmMmye8IFyufxrKAKrcoDmNQ45Myk79OJgQMt6Y6zmrdEZJAWbIz1McZE=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ug-005VJk-2G
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:02 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/20] wifi: mt76: mt7921: keep the antenna mask across a firmware reload
Date: Thu, 19 Nov 2026 13:43:50 +0100
Message-ID: <20261119124352.1842164-18-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt7921_mcu_parse_phy_cap() sets antenna_mask and chainmask to every
chain that the firmware reports, also when the chip reset of
mt7921_mac_reset_work() loads the firmware again. A mask that
mt7921_set_antenna() set is thus lost, while the stream caps of each
band still follow it.

Only set the mask of every chain at the first firmware load. On a
reload, keep the current mask, limited to the chains of the reloaded
firmware, and build the stream caps again if that limit changes it.

Fixes: 8c94f0e63bb3 ("mt76: connac: extend mcu_get_nic_capability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a16f41eda2bb..9f1410c4cdb5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -582,9 +582,10 @@ static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
 	sdio->sched.deficit = tx_res->pp_padding;
 }
 
-static void mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
+static void mt7921_mcu_parse_phy_cap(struct mt76_dev *mdev,
 				     struct sk_buff *skb, int len)
 {
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt7921_phy_cap {
 		u8 ht;
 		u8 vht;
@@ -604,16 +605,28 @@ static void mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
 		WF0_24G,
 		WF0_5G
 	};
+	bool changed;
+	u8 mask;
 
 	if (len < offsetofend(struct mt7921_phy_cap, hw_path))
 		return;
 
 	cap = (struct mt7921_phy_cap *)skb->data;
 
-	dev->phy.antenna_mask = BIT(cap->nss) - 1;
-	dev->phy.chainmask = dev->phy.antenna_mask;
-	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
-	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+	mask = BIT(cap->nss) - 1;
+	if (dev->hw_init_done)
+		mask &= mdev->phy.antenna_mask;
+	changed = mask != mdev->phy.antenna_mask;
+
+	mdev->phy.antenna_mask = mask;
+	mdev->phy.chainmask = mask;
+	mdev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
+	mdev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+
+	if (dev->hw_init_done && changed) {
+		mt76_set_stream_caps(&mdev->phy, true);
+		mt7921_set_stream_he_caps(&dev->phy);
+	}
 }
 
 static int mt7921_mcu_get_nic_capability(struct mt792x_phy *mphy)
-- 
2.47.3

