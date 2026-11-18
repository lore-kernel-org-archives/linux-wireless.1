Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018713;
	b=Ky2L77h8lq9d/6xaMUU8e7Zgc1M0DtzP5qbzqtiGPMB5BeBeRCxGQdF1JaPxuAUf3Ba2
	 rafB4T75OD7qjUbSq9uHhL/z/ZPH2r7HT+EV7JDc25el/IeJlKxUfepbrAi+om53Uvyn6
	 IEszxighAyPHPLqA0dn3Le1HT6cpS1xalYQX/alCsavFyTujINYzyQyM4dDD4myHXmiN9
	 H46X7IrPyPzB+q1T7szieGERnTwxdk+TUJWvgwyr0cWjcxJJH4EuSske0XPNFdOwf3E4N
	 azUVXo5b87vl9oLvI5YzNeZVfkVFQUA2RYOUqns5HS0kCRr98CqyQQvt0fw8cNKX0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018713;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6aoqDbZr5czF1n7AbBQiL+5y3Azit+LsSoTTFiv1ac4=;
	b=5sORMkL+/hICs0CP8bJ8PV3Hl/hFEM79vmcQB/bHXwvQO2R1V4rV7Cy8dHXhDx0St4c7
	 wx6kN4ZeSBJqxQs9OCXzZclS61WpjEI02t1SJkEALSJd/Wmh/hEiPFWmvDUvRn+pHuM6z
	 FsFd3qJ1yzQUFEcn7b/VZh37HrcYpi/X/uN2XEnzGQUXt1e0dV4ISd4usy5sIrVnDku15
	 DS3RU8V+6HgLszi0ILyyjvNHavUF7Zh5kc+rjbL4xZH14MuRUNFnTWCTLDi5f/Vsinu9u
	 3IyunEYyoZRnQJ6Rc6zPqjnOywAKKLjOnXCaxhL/mrWe/00WVuPUZZS13Z2EmEcsTCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=F8akQ7J9;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119AE60A261B
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119AE60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=F8akQ7J9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6aoqDbZr5czF1n7AbBQiL+5y3Azit+LsSoTTFiv1ac4=; b=F8akQ7J9GihHPBWhZUxZYggPrf
	j1u6WhIUL50jAxbAOEm6tZyvYCeMKeOQ6qng0qN/MPFY8rdOtJ191/nnWsJkCkAhHqs12zfc+xAau
	hL7CSd2yRQ/GfwRg3HdopV1lb8G5qTcxZRu3/yKkYjaJEheQ9l5eNd3qrostlFXh4fYc=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTiMh-00552s-1m
	for linux-wireless@vger.kernel.org;
	Wed, 18 Nov 2026 17:18:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/16] wifi: mt76: keep mac_work running when a chanctx switch fails
Date: Wed, 18 Nov 2026 17:18:22 +0100
Message-ID: <20261118161827.1208649-11-nbd@nbd.name>
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

mt76_switch_vif_chanctx() cancels mac_work of each radio whose channel
context changes, before it takes dev->mutex. Only the set_channel op of
the driver queues mac_work again. If the channel update or the link
move of a vif fails, or a later vif names no radio, the function
returns before it sets the channel of the other radios, and their
mac_work stays stopped until their next channel change. Station links
on these radios then do not detect beacon loss. Reachable via a channel
switch of vifs on several radios whose MCU command fails.

Queue mac_work again for each radio whose channel the function did not
set, as mt76_remain_on_channel() does for a request that it refuses.

Fixes: 70869cc429ff ("wifi: mt76: fix handling channel context with different bands in mt76_switch_vif_chanctx()")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 23066307c92a..df655cc56349 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -216,8 +216,10 @@ int mt76_switch_vif_chanctx(struct ieee80211_hw *hw,
 		else
 			phy = new_ctx->phy;
 
-		if (!phy)
-			return -EINVAL;
+		if (!phy) {
+			ret = -EINVAL;
+			goto restart_mac_work;
+		}
 
 		if (need_update[phy->band_idx])
 			continue;
@@ -273,6 +275,11 @@ int mt76_switch_vif_chanctx(struct ieee80211_hw *hw,
 out:
 	mutex_unlock(&dev->mutex);
 
+restart_mac_work:
+	for (i = 0; i < ARRAY_SIZE(need_update); i++)
+		if (need_update[i] && dev->phys[i])
+			mt76_phy_mac_work_restart(dev->phys[i]);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mt76_switch_vif_chanctx);
-- 
2.47.3

