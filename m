Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=C/OYKuGNjyzurdT1PWaTurgRCFGvSj4A8oHhzE62eNz2sdwfefvbu6taOowdMU4um+/m
	 OUE+mwQAEENyd9xGKVToPBhMLi4qUrerDfybXXF5MbNPG9vAa5+iY5NpcLck/rjktFlrX
	 zsQNdLP//KB3s9d3bcSwfuOkjBP1VkCCKQhj8TA7R1NccP5aFhCRA9YMNlB2u+vg21/Tw
	 /B0NoCdf7NOn5/qDzjXWbL48Fm5R1lGZuIY3dr+rUs6EhM+aJl9IvjVZZ1QNDYAMiiFqk
	 jAw2UmaL5lU+cj8eHtmFB07dz8DvNtHiSGeOkRI3qsTcxm01XIeTQdpaiCmtDXYFtyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cDx0XUb87JLfv4RcDnigUPclO/Typ7f4xap3HzUgxFc=;
	b=uoQNjI40Leyv0xMnLiDG8WsYZyjQH0wdL69ObyB8JfUErHHk5Z7xRpF7lzSLCtHpiPOA
	 KD3Pa46FeIR6k0/nuS3FbiHM1U0e55uLzrOH8+xrXKgEksaZvEHC0pTcx7UgHmOtVL4oo
	 zHM+wntas5Z5q7s+P5jCJ/aNHzZm2flHGrc60WIEBCS0XJltLG7KEsvpgywao+/bfEJLm
	 lhBWMmuzM1xJmZ19mQX9UkZ9o8scbQLq81SllivHhB9rXe+5K1yQDgExQ5bGFAfKGbKC3
	 wsqUv8TzBMKtYHTpMmUcHaxSZIV2XNKvu+CbLzmyXD7JBhMF6A1Z1B3vw+TRSuhEnKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="nnre8V/h";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7260A2604
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA7260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nnre8V/h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cDx0XUb87JLfv4RcDnigUPclO/Typ7f4xap3HzUgxFc=; b=nnre8V/hJsBrfRShrt/tYO/S9/
	/fJtlYitmygSpVlq1c+i6Ug9hF4hqhaaTNLjgK2mAGIQ8TCmIfXlLfWCVtRrndWB8Ti0hc0HAThjv
	souOufFd9bJnoJMUiPsJS/Ow1rST2rVCYyRmKhqd4ur3DeB54EKMAosScWwOh1500IVw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-2s
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/20] wifi: mt76: mt7996: take the remaining links off sta_rc_list at reset
Date: Thu, 19 Nov 2026 13:43:39 +0100
Message-ID: <20261119124352.1842164-7-nbd@nbd.name>
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

mt7996_mac_full_reset() runs INIT_LIST_HEAD() on dev->sta_rc_list while
links can still be on it. mt7996_mac_reset_sta_iter() takes the links of
a station off the list, but it does not see a station that mac80211
took off its station list before the reset. The later
mt7996_mac_sta_remove() of such a station then corrupts the list.

Take the remaining links off the list under sta_poll_lock, as
mt76_reset_device() does for sta_poll_list.

Fixes: ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 8a8098f4fc82..eb0f2dd7bb7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2532,7 +2532,11 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 						   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER,
 						   mt7996_mac_reset_vif_iter, dev);
 
-	INIT_LIST_HEAD(&dev->sta_rc_list);
+	spin_lock_bh(&dev->mt76.sta_poll_lock);
+	while (!list_empty(&dev->sta_rc_list))
+		list_del_init(dev->sta_rc_list.next);
+	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
 	INIT_LIST_HEAD(&dev->twt_list);
 
 	spin_lock_bh(&dev->wed_rro.lock);
-- 
2.47.3

