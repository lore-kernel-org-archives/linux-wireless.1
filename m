Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196708;
	b=au/4Ipu3LUc4gj8OClymGDbpo09Yw8RwL5Ev6+9Vx0/tQb+UaqqEt8prXx3zPXGBTBot
	 Ynv86Qsj3VvK4IIz+8EIot32DEdyNIfb88H5hkLFNgMG+RW/JRHU4/Ybs45ZY5P9Ree2I
	 FV5bHGnnR/0+WznJyqi8NukAhk/T2dKVR9DlfedvTrpje9zckrDisseCJXYTda+jd8YZ0
	 HrC7B1HUQljayTR7oawN05L+QIel4bfaJexVBlLu4eipx0Hy1F7+Tycy4LVndbnFl6d9y
	 JN9tFByc702qIQP50SGsv6C6W+fpPzQpClY2SiEPd0JonwGbbxD0Q6pYCX6dGuANHVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196708;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jKP0lTYNqFuhKm/OGNAGEs31wUgyrPH4hGbRsFst+tw=;
	b=dGOcs+hFQcfaePpE64GgR3ZSYQ1ChaKpZ3q8AoSsj+sGYuHIendsiSxKpgwduR+Bex6C
	 gzwSYUNfAbtSjCqg9SuMQ0NFcKWCvzrqc2AUhUt1s7a7gF9ODc02WnVV00WFcHbqx1uPC
	 DZ+Jvk8OaQnOG++LijCA0CGCezwKn81jA8wBvgCNuOtv74pmp04fMFVSi3R0NnPVZA5sb
	 rORxiTI6zTXNo7TDXCGxaUOsOYunAcglSYhP69rJrJ5UMNFlU7zqnAkZEf4opdExY0Dv9
	 pvZwdt9UkjhiSjfgbLjBZ1qJt0I2z5MlJiURuttlJepuXG4ciSQ5L5ObGwge34gN13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=isCguXHc;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324EE60A2604
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324EE60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=isCguXHc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jKP0lTYNqFuhKm/OGNAGEs31wUgyrPH4hGbRsFst+tw=; b=isCguXHcWqx9/zahQegPxkozXS
	wLANpi3ttz/k77KSykiOfA8ZQoy3hH0aL1QpDwzQllwuQFUQ+mlymBVekk70gfX5YvC4hGS5CU0dp
	1oNKkmjInp7ZuhW0HE1RCnCqLcqY+tV/WTh/ZVxcv8eED5OO3U8cx7CKGBX/uD7VsQqg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-2V
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 08/20] wifi: mt76: mt7925: skip a link without a link conf in the MLO PS update
Date: Fri, 20 Nov 2026 18:44:47 +0100
Message-ID: <20261120174459.1657382-8-nbd@nbd.name>
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

During a link removal, mvif->valid_links still holds the link after
mac80211 cleared its link conf, until mt7925_change_vif_links() runs.
mt7925_mlo_pm_work() runs without the wiphy lock, so
mt7925_mlo_pm_iter() can pass the NULL link conf of such a link to
mt7925_mcu_uni_bss_ps(), which dereferences it. Reachable through the
power save update that mt7925_link_info_changed() schedules after a PS
change of an MLO station.

Skip a link without a link conf, as mt7925_vif_connect_iter() does. A
link conf that the iterator finds under dev->mt76.mutex stays valid,
since mac80211 frees it only after mt7925_change_vif_links(), which
takes the mutex.

While here, read the PS state and the links under the mutex that their
writers hold.

Fixes: 276a56883257 ("wifi: mt76: mt7925: update the power-saving flow")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 644591b994ec..188e3ad06c37 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1736,19 +1736,24 @@ mt7925_mlo_pm_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt792x_dev *dev = priv;
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	unsigned long valid = ieee80211_vif_is_mld(vif) ?
-				    mvif->valid_links : BIT(0);
 	struct ieee80211_bss_conf *bss_conf;
+	unsigned long valid;
 	int i;
 
-	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
-		return;
-
 	mt792x_mutex_acquire(dev);
+
+	if (mvif->mlo_pm_state != MT792x_MLO_CHANGED_PS)
+		goto out;
+
+	valid = ieee80211_vif_is_mld(vif) ? mvif->valid_links : BIT(0);
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
+		if (!bss_conf)
+			continue;
+
 		mt7925_mcu_uni_bss_ps(dev, bss_conf);
 	}
+out:
 	mt792x_mutex_release(dev);
 }
 
-- 
2.47.3

