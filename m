Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018712;
	b=vOKpmNvrTL6NpswrP2O/l87wA3gtnFTaQY4trglqgr33BuI/zNeRiL2+/kDx5L46+NaN
	 wAtZGixcCJ1NoixHvwanTW6HVBQ+PVTJcXa0RO+K2zPD6GjBGqpD/duGWxpdE/IReNXs0
	 WMNNCDbR4ikt9uupud9QU9MpSL4FgF2qDZLiuedz8vEBv7gC3NR+3EZ12+8f7xikpZK/P
	 b2vrrHBl8inETmU/k7RHUwsb04OiCQKTvKxRLtQEMe1N2GZ4iTJO7eMx6mPhCYF9uPmwr
	 sj45Zm0YYbyfFOyvSKLAyVcE4y3rO4ihfLLh9Zodx0k2bVouPlScKLXcmJ4LD+qmMaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018712;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hMjXmIAfDqtjDdVCF2ILQxAzDMlGlXsThUSKcyxoHBI=;
	b=RjIMTAIPdQsvnQ7hlOi1cxvJ2yqWM5DK4lGMQNJ/TkjDJ/5aqxRH4lzeEB5ovmPYp1Bn
	 N+I/CmBpsp13TUTd+XyXzuF7oKUOfwq6nb/w6hesxibzWtGIGt2pVMaTG3e8RXTG18UPS
	 GMyA0P7rCFARmFbvnwhVdqLzXG+v64oICPGZATTkoe9jcUY9LGLsMfbemkaACrM5yJcyn
	 Vu4Kz0DZuB34REKczxyqf+l5s8cyGXD+S0WeLxGkVsgFtlau3nEk+BM5f4nn949Sb6nWC
	 8gBv2NfpPUdvJIvKC7qQtnr4xJ+GpbkqokBzlLLsE1PtusPWE4qz8zgr9OD4g+qcUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qPH40ZSx;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2532606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2532606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qPH40ZSx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hMjXmIAfDqtjDdVCF2ILQxAzDMlGlXsThUSKcyxoHBI=; b=qPH40ZSx2+FhJ6yJnSJYFRSw6x
	YIOr1+8M9GFZy5Uu7CSTrsaiYUUj4cLptp+Z/mMdqDrxiA8pv98MtRXj7gas3HRYLcBTwIBxL+lpe
	OLS/aFNDTn+ClCopPQo8Sy+A707l0Tt/GfX64V0E55vFhU+DkjwjZjddNIgdbUM13u2w=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMg-00552s-04
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/16] wifi: mt76: use the link struct of a primary station link other than 0
Date: Wed, 18 Nov 2026 17:18:13 +0100
Message-ID: <20261118161827.1208649-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118161827.1208649-1-nbd@nbd.name>
References: <20261118161827.1208649-1-nbd@nbd.name>
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

mt76_offchannel_notify_iter(), mt76_rx_beacon_iter() and
mt76_beacon_mon_iter() take vif->drv_priv for the link that equals
mvif->deflink_id. vif->drv_priv is the link 0 struct, so this is only
right while the primary link is link 0. A station MLD whose primary
link is link 1 or higher uses the link 0 struct in place of its own:
that link sends no PM nullfunc before the radio leaves the channel, and
its beacon loss monitor never runs.

mt76_vif_init() puts vif->drv_priv into mvif->link[0] for the lifetime
of the interface, so take every link from mvif->link[], like mt7996
already does in its TX and RX paths.

Fixes: 381733b3a14a ("wifi: mt76: send nullfunc PS frames on offchannel transitions")
Fixes: 4df75606ece5 ("wifi: mt76: add per-link beacon monitoring for MLO")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 12089dca01b2..5dbedbca838f 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -2336,10 +2336,7 @@ mt76_offchannel_notify_iter(void *_data, u8 *mac, struct ieee80211_vif *vif)
 	}
 
 	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
-		if (link_id == mvif->deflink_id)
-			mlink = (struct mt76_vif_link *)vif->drv_priv;
-		else
-			mlink = rcu_dereference(mvif->link[link_id]);
+		mlink = rcu_dereference(mvif->link[link_id]);
 		if (!mlink)
 			continue;
 		if (mt76_vif_link_phy(mlink) != data->phy)
@@ -2389,10 +2386,7 @@ static void mt76_rx_beacon_iter(void *_data, u8 *mac,
 	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
 		struct ieee80211_bss_conf *link_conf;
 
-		if (link_id == mvif->deflink_id)
-			mlink = (struct mt76_vif_link *)vif->drv_priv;
-		else
-			mlink = rcu_dereference(mvif->link[link_id]);
+		mlink = rcu_dereference(mvif->link[link_id]);
 		if (!mlink || !READ_ONCE(mlink->beacon_mon_interval))
 			continue;
 
@@ -2450,10 +2444,7 @@ static void mt76_beacon_mon_iter(void *data, u8 *mac,
 	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
 		u16 interval;
 
-		if (link_id == mvif->deflink_id)
-			mlink = (struct mt76_vif_link *)vif->drv_priv;
-		else
-			mlink = rcu_dereference(mvif->link[link_id]);
+		mlink = rcu_dereference(mvif->link[link_id]);
 		if (!mlink)
 			continue;
 
-- 
2.47.3

