Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=TIyZSDRGgKnsai9XFxF/cS2kCNlkLtZDEwaeaKPrDr6MNcDk+hcg7761PUaq06P2zwHS
	 cfMn3C4VufVbFGaKld9Px8WKERpd+WsrvSXfzDmcdb4qmrxMurz5taUV2XGYFzX6aWTah
	 G2YDxFhTcc/u8de9uOjR6VKQ7mR/LFPMT8Ji7CliBQuvAb70oHs9w2D3G2I6qtartrTnA
	 AJatrZdiNwQJB/VcOnjflmciyohpfDN9OUjpI/xWEcjAVyD6z0P6Yus6CvVG9ALLRMZJI
	 +ynDrMNrNNqPsbHTm6vCxMolzT0E5So9wLystZ/wcwgDs2XE1q54INleCN15D/Hr7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qzEojvzTmWwijEZrsnu38A1uVqvJ67lmCiDEEbSHti0=;
	b=BQIf9WaiSYC6Vc0MnmY95OkNttP75878s1ot3NYJe0Jzb05HVjHFfoy6YKabkbTwfKin
	 8bmydv0/sYt5K9qpCep80TQCfntt0pYhYvSyG46VhkXcAxGYvTFi6POEuBp2qyx/mFOaQ
	 gAiKgBnqZwOvx6fepN7OiNznvGJbxauZwOqx6PyOWudQNs3qUzwIL0MNkFsXWlETHCuji
	 dOx5hfxTgnbWxlohFl2fw/qAcpkFskS4YGLFZvHm+P2Z6ry/Lznm8K4Egl7cJdYhNP3lA
	 gY6K9IpomZZfJK1BXeHjBiVbd80a0s+Z6+BNfLMBUnEuxFnn/KI41Oyx+zI0Czxuqeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=o4Wv9gwu;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CC606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=o4Wv9gwu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qzEojvzTmWwijEZrsnu38A1uVqvJ67lmCiDEEbSHti0=; b=o4Wv9gwuDGPkMwoo5a3XP/4B4k
	G6b+EZLMq4LGKUTSuWJuQilkTKRNHKVg3E6HmsUl4PclT3VcWEbGL9AhAW/K2hUEb+WV1K7wJlqf8
	W+0ZJRhrKih9V7g1nEQKl2UyIYudLw3bryuR5k2bJXrEEtoF0kNbvkRMYUHOYjCQspMM=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-06
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/20] wifi: mt76: mt7925: use wcid_to_sta() in mt7925_mac_write_txwi_8023()
Date: Mon, 23 Nov 2026 14:49:07 +0100
Message-ID: <20261123134920.154270-8-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7925_mac_write_txwi_8023() gets the station from the wcid with
container_of(). This is only valid for the wcid at the start of struct
mt792x_sta. The wcid of any other link of an MLO station is part of a
separately allocated struct mt792x_link_sta. For such a wcid, the
function reads sta->wme from memory in front of that allocation.

Use wcid_to_sta(), which follows wcid->def_wcid, like
mt76_connac_pm_dequeue_skbs() does.

This is currently not reachable. mac80211 queues every 802.3
encapsulated frame of a station to a TXQ. The TXQs name the wcid at
the start of struct mt792x_sta until mt7925_mac_sta_deflink_move()
moves them to another link. That move does not happen, because
mt7925_can_activate_links() keeps the default link of a station
interface active, and an AP MLD on mt7925 has one link. Found by
inspection.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index cc8ea0d37430..1adec01f6832 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -686,7 +686,7 @@ mt7925_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
 	if (wcid->sta) {
 		struct ieee80211_sta *sta;
 
-		sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);
+		sta = wcid_to_sta(wcid);
 		wmm = sta->wme;
 	}
 
-- 
2.47.3

