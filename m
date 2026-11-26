Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=UpvP6nW7UYgG331N5sFUwuNz/jDkqNyoJXREXbKB3j0crUrbqQg0nj+0i86HhwDJVZlw
	 YIx6wInkUz96auryG82I74xJeDl1unuAgFcYsUZD3vJy7582I2ATvUts7VF/YykEYIJHh
	 OgaRxwXVNa2FPyaO6BhJhZha2wTOvM+KOvRqQKcNZ4beYoD9E+l0qzbX43FdidD/6mXWM
	 hduThSq6EEeFbB8jK1j1GYUJUw/Lpb2DRtK/daPaihI+MtcTR9OpyuXg6V0XXj+qNvaID
	 LRJyYPVjqsd9cBks4R/BVsoi3DRzrHPwxUUq3pS0cTD5zBhm3h/ZyBkrsPIouHcxYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fvEdvVaIGwiK2ti/r1xHJ+THd5Wz9UYXsXqHwKhzmVk=;
	b=3o0cO5OPdXjHmoHGWvbvH3RQtYs1ps+t7lyw/2L+SLx9fIQZEPMwXT+VjS2yxN8LCNdy
	 Kbd9W5ymLW1km3Awu8fRpZGa06FAjmsUawKjdznGz6deEB0ZfJ6xI4yW2g0qDQ+lr4r1k
	 aOPXrlykc5DWDyirYzCo5HYhdpspcxM0V8a3+8VXUJgv+2n6+mAM/3Y1+tFHeKLa5r2xE
	 XTwfOzGE2ulx7t50DUI7Pkqjivf/EXziqM9CWP0a2E+wAHCVcdhLZyCDMV6iv5G2XBWDq
	 1lmjIDXcu+eh76iktpb08rGoeK3Niw9YGikUb4beyApU6IHuILBCQaEj9rtL/BEjvSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=IDadNEjg;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94DF606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=IDadNEjg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fvEdvVaIGwiK2ti/r1xHJ+THd5Wz9UYXsXqHwKhzmVk=; b=IDadNEjgoei8mp/Wr6TFaWo9pp
	UdeJQuh7ULsMyIevnd79aSZN6h5LGWNlT1isP7ZmsnXPbn0KFmw/fU+QKFrz7YXw5s+JEE8Xar/uS
	gaN8oxxXz/MbKZMTnstlrl70xVuv6LqXnxVb66BzVWqsHONqOqroxgp2oW94/6uUmbRo=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe80-008icn-06
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:28 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/16] wifi: mt76: mt7996: limit the HE and EHT maps of a peer to its rx_nss
Date: Thu, 26 Nov 2026 19:23:11 +0100
Message-ID: <20261126182325.2516607-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

The firmware takes the stream count of an HE or EHT peer from its MCS
maps. mt7996_mcu_set_sta_he_mcs() keeps the peer codes of the streams
from rx_nss up, and mt7996_mcu_sta_eht_tlv() copies the peer EHT maps.
A lower rx_nss from an Operating Mode Notification thus never reaches
the firmware.

Limit both maps to rx_nss. A 6 GHz HE peer without EHT that has fewer
streams at 160 MHz than at 80 MHz now gets the 160 MHz count at every
width. The rate update after a notification sends no EHT maps, so for
EHT only the notification in the association request takes effect.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Fixes: 92aa2da9fa49 ("wifi: mt76: mt7996: enable EHT support in firmware")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index e4fd4b672e22..a3717dffe9ad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -176,9 +176,26 @@ mt7996_mcu_set_sta_he_mcs(struct ieee80211_link_sta *link_sta,
 		mcs_map |= mcs << (nss * 2);
 	}
 
+	mcs_map |= GENMASK(15, 2 * max_nss);
+
 	*he_mcs = cpu_to_le16(mcs_map);
 }
 
+static void
+mt7996_mcu_set_sta_eht_mcs(struct ieee80211_link_sta *link_sta,
+			   u8 *eht_mcs, const u8 *mcs_map, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++) {
+		u8 nss = u8_get_bits(mcs_map[i], IEEE80211_EHT_MCS_NSS_RX);
+
+		nss = min(nss, link_sta->rx_nss);
+		eht_mcs[i] = u8_replace_bits(mcs_map[i], nss,
+					     IEEE80211_EHT_MCS_NSS_RX);
+	}
+}
+
 static void
 mt7996_mcu_set_sta_vht_mcs(struct ieee80211_link_sta *link_sta,
 			   __le16 *vht_mcs, const u16 *mask)
@@ -1735,14 +1752,21 @@ mt7996_mcu_sta_eht_tlv(struct sk_buff *skb,
 	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
 	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
 	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)) == 0) {
-		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz,
-		       sizeof(eht->mcs_map_bw20));
+		mt7996_mcu_set_sta_eht_mcs(link_sta, eht->mcs_map_bw20,
+					   (const u8 *)&mcs_map->only_20mhz,
+					   sizeof(eht->mcs_map_bw20));
 		return;
 	}
 
-	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
-	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
-	memcpy(eht->mcs_map_bw320, &mcs_map->bw._320, sizeof(eht->mcs_map_bw320));
+	mt7996_mcu_set_sta_eht_mcs(link_sta, eht->mcs_map_bw80,
+				   (const u8 *)&mcs_map->bw._80,
+				   sizeof(eht->mcs_map_bw80));
+	mt7996_mcu_set_sta_eht_mcs(link_sta, eht->mcs_map_bw160,
+				   (const u8 *)&mcs_map->bw._160,
+				   sizeof(eht->mcs_map_bw160));
+	mt7996_mcu_set_sta_eht_mcs(link_sta, eht->mcs_map_bw320,
+				   (const u8 *)&mcs_map->bw._320,
+				   sizeof(eht->mcs_map_bw320));
 }
 
 static void
-- 
2.47.3

