Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=IRf71mXw4OUhKKzfdwEhENTqC2t5SArPPyx7+C5xzXJK+BVfJV3IKqZo6iyQUd3RJewK
	 vag9QuLaXtGFJ4PkTRqaYq+jDQ5kKsLo/slCgxv4+U+tyo2f2wQy9Vk4PcoUUxaA85KiD
	 7Ys/K2yqMPqzpAe+8k1qwDfevBZRKmojJTy8dnNsFSPgHpwbmbCxMBsX8hzeQT/6f/Egu
	 V974+Xut63auBhyfVkiongLEsMfoHWuAPlB53s1NWZidBpyDIWTE7hQ2TSlx3PDTkB7fA
	 EGg9djN/4eM3GGgvxE3BpaErYcfidYmB6ILTEz7a+3DhvOi0E1g5zNLe4Vl0yMSoLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yNQnsdqQkTlzUCwxnCqbBDWFjA5xfgEux7cnpSo+2Rg=;
	b=2pPRgFgqV3y0WpktRIJsjwlikd5gqTVGtohtM8YzYozt2A0sqvT2BPjt041v9fgCnx53
	 C5Jgch6C/myljDqtqid44RL/zf7O7VZ1OcS1/W7NzNc+sCWzx2ENLqk7ZEWvcWi+YCn7R
	 uI7xQUNTr4TMm3TaTd/v255+5pKlUOskU0fFWT9uzZWFQlNwUJ6paY6qElzJ0WW57lLQJ
	 8Ahbr7DJwb+wya3CjYs5KgyZHgsxfI/TsmmDAVK2ePaSV6jXtx+qw31B1SDEwIONcKagS
	 bmuTXu+6Ip8u4g27D0h0+k3fvA4O+rrO7c4hkE3UtsbibNQtwSLfXJD3oxWapKLPqtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JWtMXFxK;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D423606A68D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D423606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=JWtMXFxK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yNQnsdqQkTlzUCwxnCqbBDWFjA5xfgEux7cnpSo+2Rg=; b=JWtMXFxK0mGl6sqs9R9vb+3z1E
	9pkkL7J1PvIX3q591BSWfWb39Gx+aUgvgHXqEJzuTq+XoOBDuq0GE40W1gRM0GNgcPNe0/guThKRP
	qVl2haO6IeDC0YsRbcXlFFfFnNVSUyina+MvXvD7s+x14CvGSqcAHhCMWVTOnWc4T21M=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-0B
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/20] wifi: mt76: mt7996: add only the active links of a station MLD's peer
Date: Mon, 23 Nov 2026 14:49:13 +0100
Message-ID: <20261123134920.154270-14-nbd@nbd.name>
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

mt7996_mac_sta_add() adds a station link for every link in
sta->valid_links. After a full reset, ieee80211_reconfig() replays a
station-mode MLD interface with only its lowest active link and no vif
link for the others. The add of the AP station, which still holds every
link of the association, then fails, and mac80211 warns in
ieee80211_reconfig_stations(). The peer gets no PEER_MLD_INFO, and when
mac80211 activates the other links, the lowest link stays active
without a STA_REC.

Add only the links that are both valid and active, as
drv_change_sta_links() does. The other links come back through
change_sta_links, as after a normal association. An AP interface has all
of its links active, so the stations of an AP MLD keep every link. A
TDLS peer on a link that is not active at the add now gets no link
there. Before this change, the add failed.

Fixes: ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index c39e0ac9176c..5676379b2ca1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1528,9 +1528,12 @@ mt7996_mac_sta_add(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	unsigned long links = sta->valid_links ? sta->valid_links : BIT(0);
+	unsigned long links = BIT(0);
 	int err;
 
+	if (sta->valid_links)
+		links = sta->valid_links & vif->active_links;
+
 	mutex_lock(&dev->mt76.mutex);
 
 	msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
-- 
2.47.3

