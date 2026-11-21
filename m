Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262973;
	b=bKcB+Y1au4rNN8wtTc9OWFqOwIAUhICnedDoXOl5xqQB/hHgwo9kw4CZqTgsbPdwjgPG
	 3Yg8qcNKidVwFkF7U/Xvv3zeV+n+qKIw3xoSw8UkWgtmv9jjhzcTvRvMQ8UsvWIFZrodI
	 AYXRzqnjhzUvBONWc3PVnVrH6x0qKoFA5LPGkBcCMWfts4j68lp360vef53k98XbdcoIb
	 6kakKwkf15GH82xru9d0J98JfeJn65MJ2fTQx1oKrin8w3kx3ZagtW5KzXDKackvIOjWp
	 HVk6bVIawkKD+PVacXvWdxszVjkwzdL5wIwVzmgdLv3VjuIfrr9IR0lSD2hwHyfhk6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262973;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uAWrXx113kkT8XNlNv6lqSVIbKHpLUTQQyaY6yCEU44=;
	b=rOuvosq1oM81HBtFOeJv3TcqfzCzXahicYd9FsVpYT9T3toBOEyIgHyXyswNxasGhain
	 gw9X3jCdZDuj7VvXTzBLXgeU4+gsG43lxUL2Z6IEeotJDnt1Y6oYwujILu2wRrpFwa+4l
	 aJKEL8pIZsxeHdMIr0RYvEdsNK8z5QhLrfs6Rh1b175wsJxb3Rzyt5yM7yjyhOCqiOP2J
	 u8fiO9lZVtUNmgifzrgQjnormvK6aeGnUpO+wgCyRvRkeOEq06wrVLYTV8mYyhjn/jJGS
	 PXHC2oh+XyyRbnexaso5g/fhB/AXBGMLDP5kCQh0s20XZpYl28ZtR4Prsv2vWT8Q7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=IMGesXby;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324E606A338
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A324E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=IMGesXby
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uAWrXx113kkT8XNlNv6lqSVIbKHpLUTQQyaY6yCEU44=; b=IMGesXbySTUmp7I52GiQwEm+c+
	Pr4b+zEpbmeJ4qnSSoa2DwRzhgNqa1fAzLzpcZs5LAqmEM7Q25gFW+ss0AfNLFb9YyjhmwFIyFxEv
	sx/8uvkX5fLuF55XhtGWYE3v4HBn6HKkEsjJC7PO/e9jUmKoinKYCwvUF0mqUmB9EK9M=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuM-006Q1I-34
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/17] wifi: mt76: mt7996: drop the host WTBL write of a fixed GI
Date: Sat, 21 Nov 2026 13:09:25 +0100
Message-ID: <20261121120926.3603979-16-nbd@nbd.name>
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

mt7996_mcu_add_rate_ctrl_fixed() writes the GI of a fixed rate into
DW7 of the station's LMAC WTBL entry. On mt7996 the GI fields are in
DW6, and DW7 holds the BA window sizes. The write thus replaces the BA
window size of TID 3, or of TIDs 6 and 7 for an HE station, and sets
no GI.

Leave the GI to the firmware: the RATE_PARAM_FIXED_GI command already
writes the GI fields of DW6 with a masked update.

Fixes: 005c3f5914a8 ("wifi: mt76: mt7996: support more options for mt7996_set_bitrate_mask()")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index e4f52cb81470..ef48cad39d5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2395,7 +2395,7 @@ mt7996_mcu_add_rate_ctrl_fixed(struct mt7996_dev *dev, struct mt7996_sta *msta,
 	struct mt7996_vif_link *link;
 	struct sta_phy_uni phy = {};
 	struct ieee80211_sta *sta;
-	int ret, nrates = 0, idx;
+	int ret, nrates = 0;
 	enum nl80211_band band;
 	struct mt76_phy *mphy;
 	bool has_he;
@@ -2438,7 +2438,6 @@ mt7996_mcu_add_rate_ctrl_fixed(struct mt7996_dev *dev, struct mt7996_sta *msta,
 	band = mphy->chandef.chan->band;
 	has_he = link_sta->he_cap.has_he;
 	mask = link->bitrate_mask;
-	idx = msta_link->wcid.idx;
 
 	if (has_he) {
 		__sta_phy_bitrate_mask_check(he_mcs, he_gi, 0, 1);
@@ -2473,18 +2472,6 @@ mt7996_mcu_add_rate_ctrl_fixed(struct mt7996_dev *dev, struct mt7996_sta *msta,
 	/* fixed GI */
 	if (mask.control[band].gi != NL80211_TXRATE_DEFAULT_GI ||
 	    mask.control[band].he_gi != GENMASK(7, 0)) {
-		u32 addr;
-
-		/* firmware updates only TXCMD but doesn't take WTBL into
-		 * account, so driver should update here to reflect the
-		 * actual txrate hardware sends out.
-		 */
-		addr = mt7996_mac_wtbl_lmac_addr(dev, idx, 7);
-		if (has_he)
-			mt76_rmw_field(dev, addr, GENMASK(31, 24), phy.sgi);
-		else
-			mt76_rmw_field(dev, addr, GENMASK(15, 12), phy.sgi);
-
 		ret = mt7996_mcu_set_fixed_field(dev, msta, &phy, link_id,
 						 RATE_PARAM_FIXED_GI);
 		if (ret)
-- 
2.47.3

