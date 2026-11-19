Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=gidk5HTTK1hP4Q9p8iT9xHnsaB8AJDFHhMgccXStNrndsKSMGvz98iVsFrBEScJUl20i
	 AXBjnqoeJYknTHTLv4u6pYQYsvw54LwweNILlYjmd4CUX7hQb42K9vQtfedvD356GrHHB
	 WFGBDYFOoE3TFfCOnbAlM+IOGCHwk8lx3kGPw+Q7HMwo/BI2X/x85/uHPYfvB5ufXdX8z
	 5nONkuoguUI8Rz4zd5o40qqD6+mNHpdiFzM3w7m+EnUozMrYwybJOkmf8UqULCPrNLHW+
	 AUcPnC768qxjBTLWBI3HYQS6brAaukrwiq75ViNswvWfqGSyA4mwaMySMI5sL00Se2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qS3abKtA6/dRWyY3F1F1kHd2Lc6r5ZUXndvrdl5OgHY=;
	b=KroMbLVGKLbGTd9bEaIf40BximTgDy6thCERIu4FC0EekdPGmBupNTLcKP4T4unQ9E5f
	 us2P0frJlCqgQTw8DjnnPCPVwrW9Lo/uapUZnA9pqCv+WMmey7CbTfV9VZypP35ygvTL3
	 zQDE8FsW+WsM04HUMzOfP46qXQX6pvncijNlqF/pJkzlNLaF6UZpSEeLiOzrDIPolLzKp
	 Pvy9JHAZonrrW2GiAR0GKQqw+tktM7g6H88CWKixCLiZ3Nqxa2eFi77A6xBzDd01lxRSS
	 BM+gisDnQB+bWc5E/mAA22R1WKz+MSa9XyIKwayWJk0dW4EOs5GQZpKF60/V4QXcg7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Mp7TAOce;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121CB60A2607
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121CB60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Mp7TAOce
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qS3abKtA6/dRWyY3F1F1kHd2Lc6r5ZUXndvrdl5OgHY=; b=Mp7TAOce6MeS+fWBW7vnZoTmoL
	Cj5xhihT8h/x8FSUYPXJHjEftOditeYu8V2onSgulXEdY/T3hY5ZRlbep3nWubsvvX878GSelFgkO
	Fbb7uc7CvnyH17cJCCdArndWii64ygo7Jjv3xN/osDvtrPOFfaBjAHPAAKYm4pVo6T/0=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-1I
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/20] wifi: mt76: take the remaining wcids off sta_poll_list at reset
Date: Thu, 19 Nov 2026 13:43:36 +0100
Message-ID: <20261119124352.1842164-4-nbd@nbd.name>
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

mt76_reset_device() runs INIT_LIST_HEAD() on dev->sta_poll_list while
wcids that are not in dev->wcid[] can still be on it, such as a station
between .sta_pre_rcu_remove and its removal. The later removal of such
a station then corrupts the list.

Take the remaining wcids off the list under sta_poll_lock. While here,
drop the comment in mt76_wcid_cleanup() that names the
re-initialisation.

Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardware restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 85491727dc30..3f31ce188276 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -922,7 +922,12 @@ void mt76_reset_device(struct mt76_dev *dev)
 	rcu_read_unlock();
 
 	INIT_LIST_HEAD(&dev->wcid_list);
-	INIT_LIST_HEAD(&dev->sta_poll_list);
+
+	spin_lock_bh(&dev->sta_poll_lock);
+	while (!list_empty(&dev->sta_poll_list))
+		list_del_init(dev->sta_poll_list.next);
+	spin_unlock_bh(&dev->sta_poll_lock);
+
 	dev->vif_mask = 0;
 	memset(dev->wcid_mask, 0, sizeof(dev->wcid_mask));
 
@@ -1864,11 +1869,6 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 	idr_destroy(&wcid->pktid);
 	mt76_tx_status_unlock(dev, &list);
 
-	/* Remove from sta_poll_list to prevent list corruption after reset.
-	 * Without this, mt76_reset_device() reinitializes sta_poll_list but
-	 * leaves wcid->poll_list with stale pointers, causing list corruption
-	 * when mt76_wcid_add_poll() checks list_empty().
-	 */
 	spin_lock_bh(&dev->sta_poll_lock);
 	if (!list_empty(&wcid->poll_list))
 		list_del_init(&wcid->poll_list);
-- 
2.47.3

