Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675900;
	b=B6w6SsWhdcFN663fMUUj5SsBGKlhE/xtwOtjdV6xj0tDrwUiwIDgQ5qupCQIHQx3z6iQ
	 KQTRp+6sAkQgMZPzqWqw5SWbD0N7xJ0zsm3w+QNf+3QFbU8DAB+zkBwSjtlNpIk1igEt0
	 K509TnZdW0ZoODvjTA0JfpSkMqV96fuRRDp2Wzs7v27rDUtOVSH0+KNq57lj8JH5eIFb+
	 w9/iW6RzXXrnJCYfAY3MUgA6cybhEjUbpMXFRYu9zYuwzuZIXJNGB+MLmJxG+iHwMxN8V
	 yKTw95gOgsu17m7N04/UpJOoKFrpMvq6dBLd5Vag+0nru+0+wxq+Omk9uHkAWdDBkeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
	b=ZrOfzRVqY6nPaLjhD52VYcAYTcagE4V0bzL16l39fMACW9JUscvpCYsZ4uYmJ9lBEJnk
	 th2frdLRnlq2w2sdy6lU7j6FgjwYBR0c+dsxRotqYqKOXSznGinO0nT0RpG0kc/oWIzst
	 ZL1hegiXwjisTte0TuaAV4q7LPu8Zc1cVRTfkjn04TkQLdTTHCw/yIfLG6by5+EnY/xh+
	 1fMbCehKTqS75LxOaYkHWp23QfnHQa0Ufc7CJ0FUha9EBHfcM14o8oRCW19Z12z1ZRXEU
	 2DoAqj780BKCuy97LuDTwocIpigWWCOC+ytCFGcU2slTA8XdkPILIx0IhQ21HJjfZpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GmtSUu//";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C37606A332
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C37606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmtSUu//
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2860191a91.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675900; x=1796280700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
        b=GmtSUu//MHseD16Q+WXmBG/a4G0emLEiXQJRuhGXOubj2mJQpur6EMboa5wXs6VOwg
         bmFcTNb6kY8KNANP2I1ZrhttcUHQ7f/sP8dKDPDRowMcF+d3Ru+GKDoEhYp8S0JqEP1A
         CPXV0UzLKiXHN9dTMg1MzzBE0Fdp8Yg4S4XmUQ+m4f3nqqY0imAKQZ4lT/PoYmrsOHpa
         MBiVx65yJlqlGWUlhc8x0zUKjGksph0Nni9UfW1DgkLudyeb8tifRVGGej7wtIrEwowY
         e3hZqLlej8XSB6tKwzmzPI355eDRcnWbxtwfEloy8tLx4WRhq9WqqIsqG9Vfu0Lp5Gn3
         y5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675900; x=1796280700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYTbVZm8c9pPfQXQr0mcNexiI7K3UauJcjFD8QyNtGY=;
        b=LwTessGz8Xsw8V4CZrDC/p2Mp46n2DfQ9YVJ5XFaUk58VRUyawWHs3UL0G0PGY/4qf
         4dLv3gVSdyOLOwLspyVwhGrp+NqFHut8cRypnF89TWHl4PST2yNFMFaCreBBI02GR+rL
         JLi45+aVoZTnYkkBtDk/ERoOIZQ6GoxwncKzhfw2D31bHq33vkIFp3hr+qxp6xq+WoBY
         mN8HBnysljIYq07fhVIw6lLCZqJ46TXgBZ1KoWNpRmePDLsxwrSOQGLHR3yolCHyWGpN
         Hz+od3BZbe+SwEdK4Qj1PoNn73CFeXN7QFK22q20noDbHvScmpyfg+DNQxF2l/dIthmf
         cjAg==
X-Gm-Message-State: APuU4Z+goOhQVy1Ee5Eoa+Ie2d7ck9aCOQYLKjOH4s1IR1qabd71hzsH
	UItU6ocE3uRZVjkvimrRi7OLnNqinoGEyhjJfUrGwAS3wV2dWUEI1NiT
X-Gm-Gg: AZFdTZcVIUqkxb7KY4SSYsnF8wS+yuYAxb0/BhQog4e6L3AY9tJEjP57fR46ueqlYU0
	AK9kEcy32FFzXDgzqsieiRIhjCCA11iLSZE3Op7kKOX4KBGxf0v3EyeUPrqcn4Yk/tn+GI31Zg5
	srsU827P2pqM+ikUcuc4i5uxqm5Y+dM9ffpKw2bWGSVTLoxnEXlkbI2UcMwQeS+uyZCiFk9uZCv
	As2fJACqiL3GLA/VoHhtuTq8EhYCJokhr094TGA1ZMXuuo53SU2843yJKAiGGoZ2y8M3jMERgWk
	n14mgNBLzX5q55NfwBL0U3OWo3Jf4WVoPF8gB2nLFIj6tvPACdF3ZCDZhjOOZG7ZngULbc+qGHa
	Mbpcm9ie3M5tJdGhRr0n+eKmNchPY/YzA4PIryYukJJK/3fvIjh37/f7ldk2vXYSbbGSaVDfVw+
	dK7tZfcG0vd27HZRNit29ZZ4mkaNeTAX99nLPZ3qHo0kulbYRPZOoVR9u3G/PLSwyrY4mDtesNt
	DgswEEw35UbP5Yu5sqYinq5IKOe+V8MPqmSsRj4V3puLaduU2xycvFSio38HPdn0JalO/VqZoCx
	Fb4VqN89JRTFgCD1xNwdFxBnl8nbFW/60vevw2fnLNWvNUhX1ff+eGtcBZ23DVI/wXiDTQPR9mH
	DL7vfncgEhxQonnbqlGZdmDNXXzHBryM1eBZNn0JUGsopOiTUuI5zm3MfcRzLTvdRLRf1RXclmL
	i5jh+4Gv1Y9LnH0/9AbfCf0DV0XZqFMNHYzAognUmY
X-Received: by 2002:a17:90b:390b:b0:3b4:1336:4f6c with SMTP id 98e67ed59e1d1-3b41c7b6994mr18471889a91.2.1795675899422;
        Wed, 25 Nov 2026 22:51:39 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm34380982a91.2.2026.11.25.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:51:39 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: stf_xl@wp.pl,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: rt2x00: prevent txstatus_timer rearm during USB uninitialize
Date: Thu, 26 Nov 2026 14:51:32 +0800
Message-ID: <20261126065132.971-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

rt2x00usb_uninitialize() cancels rt2x00dev->txstatus_timer before
calling cancel_work_sync(&rt2x00dev->txdone_work). Because
rt2800usb_work_txdone() calls rt2800usb_async_read_tx_status() and
rearms txstatus_timer, the timer can remain armed after
rt2x00usb_uninitialize() frees queue entries via
rt2x00usb_free_entries(), allowing rt2800usb_tx_sta_fifo_timeout() to
submit new async register-read URBs and queue txdone_work on torn-down
queues.

Because rt2x00lib_uninitialize() clears DEVICE_STATE_INITIALIZED before
calling rt2x00usb_uninitialize(), guard txstatus_timer rearming and
timer-driven async register reads with DEVICE_STATE_INITIALIZED and
cancel txstatus_timer after cancel_work_sync(&rt2x00dev->txdone_work).

Fixes: 6232c17438ed ("rt2x00: avoid introducing a USB dependency in the rt2x00lib module")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN (drivers/net/wireless/ralink/rt2x00/rt2800usb.o and rt2x00usb.o); not runtime-tested on Ralink USB hardware.

 drivers/net/wireless/ralink/rt2x00/rt2800usb.c | 10 +++++++++-
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
index 15de3db..57e04c6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -118,7 +118,8 @@ static bool rt2800usb_tx_sta_fifo_read_completed(struct rt2x00_dev *rt2x00dev,
 	if (rt2800_txstatus_timeout(rt2x00dev))
 		queue_work(rt2x00dev->workqueue, &rt2x00dev->txdone_work);
 
-	if (rt2800_txstatus_pending(rt2x00dev)) {
+	if (rt2800_txstatus_pending(rt2x00dev) &&
+	    test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags)) {
 		/* Read register after 1 ms */
 		hrtimer_start(&rt2x00dev->txstatus_timer,
 			      TXSTATUS_READ_INTERVAL,
@@ -142,6 +143,8 @@ stop_reading:
 
 static void rt2800usb_async_read_tx_status(struct rt2x00_dev *rt2x00dev)
 {
+	if (!test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags))
+		return;
 
 	if (test_and_set_bit(TX_STATUS_READING, &rt2x00dev->flags))
 		return;
@@ -164,6 +167,11 @@ static enum hrtimer_restart rt2800usb_tx_sta_fifo_timeout(struct hrtimer *timer)
 	struct rt2x00_dev *rt2x00dev =
 	    container_of(timer, struct rt2x00_dev, txstatus_timer);
 
+	if (!test_bit(DEVICE_STATE_INITIALIZED, &rt2x00dev->flags)) {
+		clear_bit(TX_STATUS_READING, &rt2x00dev->flags);
+		return HRTIMER_NORESTART;
+	}
+
 	rt2x00usb_register_read_async(rt2x00dev, TX_STA_FIFO,
 				      rt2800usb_tx_sta_fifo_read_completed);
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index c9fbc37..bfd5a81 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -746,9 +746,9 @@ void rt2x00usb_uninitialize(struct rt2x00_dev *rt2x00dev)
 	struct data_queue *queue;
 
 	usb_kill_anchored_urbs(rt2x00dev->anchor);
-	hrtimer_cancel(&rt2x00dev->txstatus_timer);
 	cancel_work_sync(&rt2x00dev->rxdone_work);
 	cancel_work_sync(&rt2x00dev->txdone_work);
+	hrtimer_cancel(&rt2x00dev->txstatus_timer);
 
 	queue_for_each(rt2x00dev, queue)
 		rt2x00usb_free_entries(queue);
-- 
2.43.0

