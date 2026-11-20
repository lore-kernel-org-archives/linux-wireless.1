Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196707;
	b=pUyu6Fv0he/McAo8A6Ms7padIj1kXOiGgG+F0lGKRb2sdrTtVc4PXJxST0oevXslnfqj
	 JbMNsPq4xizpsx/rRIM27TlxkyYFSx5FzimGEeC0491MEabnw82+3unWkJOPDdyxy3bBN
	 uPah1Jt3alDGPXsLJUTVPd39N8APM72tjSaeikd8RgeU6tg7wTbRkl9TaVNdITRVbaK9/
	 Gisws5Soy+M3cFP1VsHjcNrtBbleSJ2ZK58m6OGDDK0gAMuVJme9Y6bfBMPGGO3RsJwLT
	 +Kiw+4WZdNB7/Y6y/5QKgxORd5mETxYYpa3+uG6wGuRDlhWOnZ2hd8kEE4nfpgVx02Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196707;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O3dbXlZ6Mq4LAMAorrSsE3m5LNOO8sSZFFiIma3n/uo=;
	b=VtkoLIMeWzuKYTcqKISLwNI7eJBhuaM8dztS94VlooLWjuoUyVDC01j8CIPEvDfaUipl
	 SiftVxADmQQOalQbVpBpK0a2iowiZgcVzS4PU5q6FN1Y6/JwiALWRFIdPjRgeGn6peTzB
	 nhptpP31Xilm4LxRBHLG9nSdZjwUssh4m32EbbpEJMoxlRQBF0nj7jl+nOO8a+xVa7frE
	 BcG6VunFHJRxRzSE/cXDMAaxu1jqwk49vChXS8wOFJbVpLDwXQPBEXfXi0D9OhqKDZc3+
	 OQTUc7ZY6xBES0OV5LTF23bUT41uzmFJpQx5bM90wNNWrNmwzOq9U8M8gj7h6m4V5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=GBI3d71E;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DA606A33C
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25DA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=GBI3d71E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=O3dbXlZ6Mq4LAMAorrSsE3m5LNOO8sSZFFiIma3n/uo=; b=GBI3d71EDFaJUVlps9SiuXheBq
	48GbYtkOQ5hCX7HIaj+NAJORDohHNiSrlLEUWtheMEgKov3vAPahwUYlT6MnMf7KXCvPgUB5U9B9b
	BjqjIsWF1X/mqfaxRfqgmwYMyGOXPTF/ZyLRVpXqHfyrg8Mmc5llrdGLPoHnemc1NWsA=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-0w
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/20] wifi: mt76: mt7925: take the mutex before the link_info_changed lookup
Date: Fri, 20 Nov 2026 18:44:44 +0100
Message-ID: <20261120174459.1657382-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

mt7925_link_info_changed() looks up the driver link before it takes
dev->mt76.mutex, which mt792x_vif_to_link() requires. The first link
info change of an MLD interface thus triggers a suspicious RCU usage
warning. The link stays valid, as its only writer,
mt7925_change_vif_links(), runs under the wiphy lock that this op
holds.

Look up the link under the mutex, like commit beec58f36983 ("wifi: mt76:
mt7925: resolve link after acquiring mt76 mutex") did for the station
links, and like mt7996_link_info_changed() does.

Fixes: 3fa01f055c41 ("wifi: mt76: mt7925: update rate index according to link id")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 61dc02e8aa68..71e441f631d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2432,10 +2432,10 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	struct mt792x_bss_conf *mconf;
 
-	mconf = mt792x_vif_to_link(mvif, info->link_id);
-
 	mt792x_mutex_acquire(dev);
 
+	mconf = mt792x_vif_to_link(mvif, info->link_id);
+
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
-- 
2.47.3

