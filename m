Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=d/zztbiG5eMcpJZGI8vOSf3Q6qYNtEaYdj/ggjekIJxefOZH89d91n1dmD31q9zwSfzr
	 1lnR//d77iX/KNkEglUO41u2Y7F+CxJUi5CUA3Jj+GRH949b7EpgrcuMZ6erYJuChpXCM
	 bVj+CrSg9hr1W+9E2HomrC4Lo5uDpuH1mAhPnn4jYnc1cb5wiehpPj7D0I1Of48IylSjv
	 n6mUTTjWomewCu99EyqRy57Pib/pwq8MQc8lmc/fK06gr8CQpUIGZl5rZ1sg8PiioQ1yz
	 AryFzcKcZLBZVxstEQKxJfel/PU4ztzZHVQnFBGtcatd38Rzc5TEn0KKysKhFYmtzAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ahNKfYf80BJ2bm9Oq/aXe5evrlk31g2pwNsWn13x+c0=;
	b=o3CI9tcrgGQ2rq36zahSLhcZDiDz97WpakrNi3P5kfjDDZHsXgX3RWNmhyjCaUj+SCgI
	 rsiOjtoWL//o3+zkfC91/y8IFP51REk2djgsXGdfb+KjGji47U/IIjKl9kFqKe2Ww2oqN
	 Swijw1TiPNBtJlh5kTsNiBdoFt5lCutEw5tPIJ1psoiHgkAzyq6hbBidfB5FK7xOxQqhB
	 PCdRg5b3fhzyE2MEaxmi8t0G74R9SobsfArB+4MYvJZqlbeMJZV8Evjyq89YtaPIDMtHB
	 Ztq2bASIkxZ/97HcbKeaipI0IOjdneyQlSCWiTcQpGmKov2/oDmXGb1XenrnSx4AUnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ZV7HyVxq;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E560A2605
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109E560A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ZV7HyVxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ahNKfYf80BJ2bm9Oq/aXe5evrlk31g2pwNsWn13x+c0=; b=ZV7HyVxqqqR+yguNZOJ/Q/9081
	3Mneqq1mAVB71DM15TC5enW2xcCfIWSuU2hIrPZR2MEqqXhQkzyBr4xtoT1omRhSVvuwdX280BZZt
	fiiGSlaqmSpPnOxvR6vyk6vtGAUSmLytBUKZkVJPB183IfYe5NnsZDStaEE+/tSmCros=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-1p
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/20] wifi: mt76: mt7915: take the remaining stations off sta_rc_list at reset
Date: Thu, 19 Nov 2026 13:43:37 +0100
Message-ID: <20261119124352.1842164-5-nbd@nbd.name>
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

mt7915_mac_full_reset() runs INIT_LIST_HEAD() on dev->sta_rc_list while
stations can still be on it. A removal of such a station before the
replay then corrupts the list.

Take the remaining stations off the list under sta_poll_lock, as
mt76_reset_device() does for sta_poll_list.

Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardware restart")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 24207880211e..cfa7433dc470 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1471,7 +1471,11 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 
 	mt76_reset_device(&dev->mt76);
 
-	INIT_LIST_HEAD(&dev->sta_rc_list);
+	spin_lock_bh(&dev->mt76.sta_poll_lock);
+	while (!list_empty(&dev->sta_rc_list))
+		list_del_init(dev->sta_rc_list.next);
+	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
 	INIT_LIST_HEAD(&dev->twt_list);
 
 	i = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
-- 
2.47.3

