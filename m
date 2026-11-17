Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938512;
	b=ZpC+lIz1OTA5VkmBS+QBkYwL5WyxLnb8bmNE+PljFY1REJ1M/A73tR2ia0h0sHfVlScj
	 S0yFBv4zRYi45IJd82Np0cplYUDjO0hwodi0JzfuMLyRGA4EtAbLKLHlGJVEYxwWdco0J
	 KkPT7kopb+wTZlC3rAE5R2v3EGpaxuHE2QswMqM8Z55XmvAegL+q4MEFRQiD+L34gs2LS
	 dyrVTv5S4a1mIHLFVc95ujLLavY49tVwUSRnfuCxuCBnJXUWC6f3f40GkO4kxjji32kay
	 r1jjf5oiHRlCX4o2QTzNNc2Vq0Xjz0vaPWrh//+jwmHrbwi80ACWZkqvr8fS8QJmZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938512;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+v3m+Doyzw7zLzGi1qhKdhsMLfRTBSIyxZKaWFaCGA=;
	b=L3r8I1X5cZxWUBfGidlsYqYeaW0y4O1+zmr1t51TE7CCQuGIEPuRK2oeYM0LjxlekyVQ
	 KNsEajwH7Qu+7QmS2vyeO0dNMk1HCcX0/zp6aJbFMb5nKwPKFEVCleaQKefnOOfMm6lBq
	 SSs3lO2P9TOR3g2M5Bj24IR/vWAv91M5WfSYr84G4Fg+oEtF4TXGhDdTutII18+xUtWdP
	 LuUj4do+O8+LyghM/Ga4IAEYIFAZxx0tofHoXPlaeAiHcGIyo2bnCOBiNxotadieTgjOS
	 DSvMAw/XmsaepWMHU6d49WrZyH6d2xIGqfr/xYBaDkeyHMwiWQsdg3jmsB+xqWA5DxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=SxIObFCH;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C69606A896
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C69606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=SxIObFCH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i+v3m+Doyzw7zLzGi1qhKdhsMLfRTBSIyxZKaWFaCGA=; b=SxIObFCHGPGlxPhP2pGz/JCYB1
	YDcHjXNHs3h0MKSebgJX0zc95okz/Hjqm+gvr6r0xsYn0VVy+oE2rUzZ0IcC7FabauVhNur9CiOvZ
	5gsy3EfPHcc1UeLrM4ixPGg8rUYS5n7A3SBiitWY/yRh2LTuyRSJUCGlORSDfWdZL+mk=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV1-004eiZ-1e
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:43 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/19] wifi: mt76: find the first A-MSDU subframe behind the radiotap data
Date: Tue, 17 Nov 2026 19:01:24 +0100
Message-ID: <20261117180134.2940930-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt76_rx_release_amsdu() reads the first subframe relative to
skb->data, which points to the radiotap data where the driver pushed HE
fields or EHT TLVs. It then misses an RFC1042 header in place of the
destination address, so an A-MSDU of an HE or EHT PPDU in 802.11 format
passes the mitigation of CVE-2020-24588.

Locate the subframe behind the header that mt76_skb_get_hdr() returns.

Fixes: 2c2bdd2372af ("mt76: validate rx A-MSDU subframes")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index bd822193e769..271fbd4711f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -965,18 +965,21 @@ static void mt76_rx_release_amsdu(struct mt76_phy *phy, enum mt76_rxq_id q)
 	 * address.
 	 */
 	if (skb_shinfo(skb)->frag_list) {
-		int offset = 0;
+		u8 *subframe = skb->data;
 
 		if (!(status->flag & RX_FLAG_8023)) {
-			offset = ieee80211_get_hdrlen_from_skb(skb);
+			struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
+
+			subframe = (u8 *)hdr +
+				   ieee80211_hdrlen(hdr->frame_control);
 
 			if ((status->flag &
 			     (RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED)) ==
 			    RX_FLAG_DECRYPTED)
-				offset += 8;
+				subframe += 8;
 		}
 
-		if (ether_addr_equal(skb->data + offset, rfc1042_header)) {
+		if (ether_addr_equal(subframe, rfc1042_header)) {
 			dev_kfree_skb(skb);
 			return;
 		}
-- 
2.47.3

