Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=PTvI6zdTAvALirtNVq7sr/2aWKbxipcmsn69PKi2HwLQyyKmWekgsa+wf8Z0VG/lanZv
	 VNL2npAE41ur0WlhMioWun+YOb31vYdVsEV2uHiSLIerIkFnH7uK0/AW0sIvHS7t86muZ
	 EEKKbpBKj7zeGCRZAllmSBxS/4BloV3elJmB0GLFJ/rvei0U+TwMJp4E9Lfbx4TieRmAP
	 DkzfIPvMBBm2c8nJ8oplYj4HeMfOCerVXMC8Jme1XlnrJgYw0Yif2yir2sVZdpuRPpR6l
	 mNS0AlbJTNSwNvwxAt56ftiBv1dOc/C+pR8qDUpCaV2gFmEj5dH0Omxyfb8obUZb82g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yMZPiRXOVlUOkXnk9VjoFrhbkGSQMwehLifpaqybl5I=;
	b=4w/hoNg/UlLPP77XNC2MCPkli4F04EabUQM69EB+p6NMU5xd6lJCU8CMO/1RbAbf6bUq
	 JgewKtSflYG2WDqRvgAapUnucIEvBhv5Qd9R1wjHrEO3dXo4i441Jf1sTCP8QiAt2+Eat
	 0R94umdSZib86D9u5NXphelLyBrQqQP6aOqlrj5IrqA3p69QK35HOj8ePrxZWmpI9p2j+
	 7Cobx/TW3/i4WRhUEjqrTf51DWpN347uf9dXm0bJvKpSZSVNVBkvBBdbIYLdIXJEaPf1S
	 2HNJfLu7O1ORYb8L6raWKO50Qx8O+2+gE4B55IW/tB49iAaT5+aXe5JCT4DrME8yDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=goX0zWYh;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C15606A332
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C15606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=goX0zWYh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yMZPiRXOVlUOkXnk9VjoFrhbkGSQMwehLifpaqybl5I=; b=goX0zWYh6i+S68TVUQx9mx7ldL
	wC6drvqkev7R+U5H8hGY7yIdMsBS+o26rgO6PEOvP0QRK6jEBXWRgexDa51i0mAfsI0BakOFH5Jl1
	hcjCPZUPKV6TeHVuKrLu/H9fJZgxtoeK0iwEYlUPN0ISWBgNC2tUw8vWjdL2tZX6BjII=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-0w
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/17] wifi: mt76: mt7925: read the links under RCU in the IPv6 notifier
Date: Sat, 21 Nov 2026 13:09:15 +0100
Message-ID: <20261121120926.3603979-6-nbd@nbd.name>
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

mt7925_ipv6_addr_change() runs from the inet6addr notifier of mac80211,
an atomic notifier chain, so it holds RCU but neither the wiphy lock nor
dev->mt76.mutex. Still it reads vif->link_conf[] with
mt792x_vif_to_bss_conf() and the driver link with
mt792x_link_conf_to_mconf(), whose checks name those locks. When
mac80211 removes the links at a disassociation, it clears
vif->link_conf[] before drv_change_vif_links() updates
mvif->valid_links. An address change in that window makes
mt792x_vif_to_bss_conf() return NULL, which __mt7925_ipv6_addr_change()
dereferences.

Read both links with the RCU accessors and skip a link that mac80211
already removed, like mt7925_vif_connect_iter(). The driver frees a
removed link after a grace period, so the read section of the notifier
keeps it valid. For a non-MLD interface, vif->link_conf[0] holds
&vif->bss_conf, except while mac80211 adds the first MLD links; the
notifier then skips it.

Fixes: 9f8f587cab69 ("wifi: mt76: mt7925: add link handling in the mt7925_ipv6_addr_change")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5a185d7422f0..b78823e161ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2082,7 +2082,9 @@ static void __mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 				      struct ieee80211_bss_conf *link_conf,
 				      struct inet6_dev *idev)
 {
-	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf =
+		mt792x_vif_to_link_rcu(mvif, link_conf->link_id);
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct inet6_ifaddr *ifa;
 	struct sk_buff *skb;
@@ -2147,7 +2149,10 @@ static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 		return;
 
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
-		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		bss_conf = rcu_dereference(vif->link_conf[i]);
+		if (!bss_conf)
+			continue;
+
 		__mt7925_ipv6_addr_change(hw, bss_conf, idev);
 	}
 }
-- 
2.47.3

