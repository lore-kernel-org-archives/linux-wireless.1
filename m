Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196706;
	b=bwwP9z2gFpyyiOEEmJQsAIdm4D/5qj8HZU56rkn32In8ONLOy0cNLYIiVa8dtgPndC91
	 FqpccgOiG3FbLGTM4XcFII73t9z5FD3ifJxrgztFIcFcFNcxJjpF9sdrVSL2XNHJp9ZIg
	 7uv5IHNVTmDdPkdXPVQ+Y0+4ztR5Zwoo3jRSVEAQihIEAEAfWyDMmel+skMueicgBjAYk
	 gLChqDLDCXD43Ge4nJ/m6HtbUyNHjio07b6zlcG7i9Mqp2T7aazX0mqYcK48T4VpmKWeJ
	 yyRrmekUBTve+Vy4gQk/EOpUkLUVPMPweqvHSa1iZjdyjaWYN+iV5TuDFvD/t0AIx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196706;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s/uv69kdZ4C8REFi8CYd8WU2TBL//5ZWN/Fxues86ns=;
	b=D+cHquoJ6HRoizItZnyH2zvSUFn4H3Xja4huWtqEATFis+3IjntzpBhVrAX5e8y3u19T
	 9p5JO5Lbw43Ptw6lNvy9+Bz7QPETd2+ah8QADPP1/mE6tJrQGj/wBDk8Ut+xGQeCezyBW
	 E/6aWL9vCQLGmB/P+OEz57hBcPoU+n2IB+/Bcm4/jgLusxAl8jOSB0SmFLLGhm0MFZeUd
	 jfwGm1glwE1VxXfVPHgaLhEQ4TRXyQDwn0tKI+W+6e3AEXCi5sqFlbd9NTV8gzLDrRMFB
	 Bq+NEA7diqBv2ZkWl1c5bGKFr4GknCxdJlbZMBv4vdSRvTha3tzTNbKFLVXsPW2dBjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=OHFNngqz;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943160A262B
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7943160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=OHFNngqz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s/uv69kdZ4C8REFi8CYd8WU2TBL//5ZWN/Fxues86ns=; b=OHFNngqzsMMrVtWvAi+HaTRbMn
	B7vam1jwgbFmkueOHEL32giF+mkcuhmGP01kolD3hjQd91YLJOyLtI+DwkE4CUr8nWal9bh2X4jqZ
	2pfUHxeyGnnIxTEFiH5V/VWB1rYhGUkNHRIZqi7kdhVZqGFMG/bMakipVpphv0Co7Ssw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfZ-0065GI-0K
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:05 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/20] wifi: mt76: usb: do not park the TX worker again under MT76_RESET
Date: Fri, 20 Nov 2026 18:44:49 +0100
Message-ID: <20261120174459.1657382-10-nbd@nbd.name>
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

When the wait for pending TX in mt76u_stop_tx() times out, its cleanup
parks the TX worker also where the caller parked it already. This is the
case for mt792xu_disconnect(), which reaches mt76u_stop_tx() through
mt76_unregister_device(), and for mt7921u_mac_reset() and
mt7925u_mac_reset(). The second park triggers a WARN, and the cleanup
then unparks the worker, which runs again during the teardown or the
chip reset:

  mt7925u 2-4:1.0: timed out waiting for pending tx
  WARNING: CPU: 1 PID: 15805 at kthread_park+0x73/0x90
  Call Trace:
   ...
   mt792xu_stop+0x15/0x30 [mt792x_usb]
   ...
   drv_stop+0x33/0xd0 [mac80211]
   ...
   ieee80211_unregister_hw+0x45/0x140 [mac80211]
   mt76_unregister_device+0x70/0xf0 [mt76]
   mt792xu_disconnect+0x7a/0x1c0 [mt792x_usb]
   ...

Park and unpark the worker in the cleanup only while MT76_RESET is
clear, as mt792x_flush() does. Every caller that holds MT76_RESET has
parked the worker already, or runs before mt76_register_device() starts
it.

Fixes: 7910bd565d8b ("wifi: mt76: mt792x: quiesce USB paths on disconnect")
Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index be48a88a3ad0..9a701840d23a 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1070,6 +1070,7 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 	if (!ret) {
 		struct mt76_queue_entry entry;
 		struct mt76_queue *q;
+		bool park;
 		int i, j;
 
 		dev_err(dev->dev, "timed out waiting for pending tx\n");
@@ -1083,7 +1084,9 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 				usb_kill_urb(q->entry[j].urb);
 		}
 
-		mt76_worker_disable(&dev->tx_worker);
+		park = !test_bit(MT76_RESET, &dev->phy.state);
+		if (park)
+			mt76_worker_disable(&dev->tx_worker);
 
 		/* On device removal we maight queue skb's, but mt76u_tx_kick()
 		 * will fail to submit urb, cleanup those skb's manually.
@@ -1100,7 +1103,8 @@ void mt76u_stop_tx(struct mt76_dev *dev)
 			}
 		}
 
-		mt76_worker_enable(&dev->tx_worker);
+		if (park)
+			mt76_worker_enable(&dev->tx_worker);
 	}
 
 	cancel_work_sync(&dev->usb.stat_work);
-- 
2.47.3

