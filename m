Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=Nq2D3GdDZWRsdKyL1s+Q/PYWwybml0+7uoIh9vsKw3q7tMIjayo1Ozd/qceUeVxxJUsm
	 Q8fBFBZtOXjEp8xUvevBR9Hl4HfKChflmN5T0+Z6xZyJY3TfnWhnisSdhvMzxsoNUDvWj
	 Ws7wrmxg+vYhsx0HlmDFg5ZjAK6YJJfYT+1K7ZibnkKLm1BR81Ol3sccB3leg94IV5mUU
	 JT8QZ8p63bh7UoeDDaf3bqNWHZeNemUX14O/ywyApLab263aeAnr8orwX1Bauhl2NTksX
	 e/9I1j0JlcL0BsiktOyQ/SClXvAeYO4tsG4sHnkP65c/XoCIbXQxVA+ZcvGdVrmbTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=64wwmRFE1xICWIjHatpwu2ZyjC2p4ZVWvywXMpeI8OQ=;
	b=w2OoOB+e7f4SmAZOE/j9ZiTOU/Wzw3TmEDWyGt5ZmqgY45kcbCEWu1JvjtlmC7L1jp7V
	 MvVjUYomPVzJtoQYzn1iBqzrpud+w2AWGloXvVvyIpb4RO2MbR9fri7SYpA6d9nzbOsfS
	 KVLuIeM3NIQJAW0sXJK9fBfQrSqL9hCMvgCWiN8k2FMQbVINvp82J0wSu3iaFHvn+Ekwh
	 qTCN9Cgvyv/f0oVio/LU7pp9WQ0nXcgLv0ceZ2v0CMYB5FyqLy8ZHfjM7mQQoSboXUOcl
	 6UM3uske46WzJuZRWvLBGgveVZZG553zbWZZkDhMSykzAF8FaKUR7iuut7gPlIJi+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eKG3olKj;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25060A2609
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A25060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eKG3olKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=64wwmRFE1xICWIjHatpwu2ZyjC2p4ZVWvywXMpeI8OQ=; b=eKG3olKjyg9q7na56tjOBTdC+T
	X6XAkxlDnB76pCLUWU96v6dTmjSIn7mx0qUovc+YVgTHqCk7vU2Xkeq4ojKab9AvBnst+oiAtvnL5
	dBWWuVLB9UNFiWL4UtzabKcoNZqgWlBsicD4uo8lNUBJ85F4n0VIS2H3ntRI6cA5ZNh4=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-0A
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/20] wifi: mt76: mt7915: take the TWT flows of a removed station off twt_list
Date: Thu, 19 Nov 2026 13:43:40 +0100
Message-ID: <20261119124352.1842164-8-nbd@nbd.name>
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

mt7915_mac_twt_teardown_flow() keeps a flow on dev->twt_list if the
delete command fails, for example while a reset is pending, and
mt7915_mac_sta_remove() does not take the remaining flows off the list.
The list then holds flows inside a station that mac80211 frees, and the
next TWT setup reads them in mt7915_mac_twt_sched_list_add().

Take the remaining flows of a station off the list at its removal.

Fixes: 3782b69d03e7 ("mt76: mt7915: introduce mt7915_mac_add_twt_setup routine")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 7a2e759181ad..edbb921e63bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -876,10 +876,20 @@ void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 {
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	int i;
 
 	mt7915_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
+	/* the firmware can still hold an agreement whose delete failed, so
+	 * its table entry stays counted
+	 */
+	for (i = 0; i < ARRAY_SIZE(msta->twt.flow); i++) {
+		if (msta->twt.flowid_mask & BIT(i))
+			list_del_init(&msta->twt.flow[i].list);
+	}
+	msta->twt.flowid_mask = 0;
+
 	spin_lock_bh(&mdev->sta_poll_lock);
 	if (!list_empty(&msta->wcid.poll_list))
 		list_del_init(&msta->wcid.poll_list);
-- 
2.47.3

