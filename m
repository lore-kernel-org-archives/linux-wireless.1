Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196557;
	b=2qgQGWHLDE5wHKfF3Mo9eOENN3H4IoC/P5TkGM+vOqNSnwVTrLl0puw9pn6y97mQXf0C
	 cTwAAb/o8L5JxCbZcsmEFhD7FpAmY+JXVWsdJh3GjATH61v7SEKqcw8XAooilJl+dZ3Ui
	 diD19d0EmTBrQgBvq3OLlPXlMQ6D2Bvvp87KON8N+HT/Ggs3SFmTFGIyVGTCld5vZ9v+z
	 RQku4Bt3qX2nbwsk0HW7YBWAEAHDTt+WPkZ2B0iRcRI8HjShjcSKzi5d77FZaiTOmGKkx
	 vuer1zJy/7sSveMLsBx3TQPfQGcGdsKKh3al4C7i1Wy4IiEK2LCOhf06DVC3CN2mQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
	b=Wu+HIhWzTdlAWmpfw4uQbTN6PQfTjXhPlI7bmeqDNRF37lErxwjb8NKoqJA1JALNNUVe
	 EGyqgQe9PUyIAW0Vh0FEXdv+EGZIfhtLMxn6+RYzAV+W9BbYMKmkU1519AjBCPCh/NOKO
	 JMLT7fOau4U4BZNgYgo+5tc1dQ7zZyX5JdpJlKKkncyd4bBx60LftSfackBAFmBDXdOCF
	 A/h8cvQ80BBRud0A77lM4HwJ3yaKGNYKzV3pbTKp2Obu3LPOrmbAULbFFUv7hMA8A90Wb
	 sqXhNRl9+NNE2yiVNscakm1ms3vemqvXX7Mgden5aj0CwT4nQRWLLxyzKfwqYmIuXYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=dothBp3r;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BD606B065
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477BD606B065
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=dothBp3r
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so789677f8f.3
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795196556; x=1795801356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
        b=dothBp3r0726IrSCWAX08EYvioo4cffqghvF5G6GmLQS8uKw+MYIbm2jUHYsXYhI/n
         BUZt9IaV54Y0YRulxSYeKILxEaipbNywSvkDJzcGDUsnXRzz4nbQE4LMBgmHjV6WFzBG
         /+a+0n61eiSMsxetVWrYdBCQ9Q97mMLwUvMao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196556; x=1795801356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
        b=X3k64UyxDaHzKuZ9E7n6YP3zKwUOhXOCeFC/h4XTADU4x9uydgrPoiSmJzkUfbhPWG
         H1UGmMQivzl8OKP5UrkntykJ3Pm8NK4CtDtpb2XZJBLW8EDhr0lCiPaF5MLZVZixm/wd
         +N9CRw0mMx9vq4moyH1wHzs80TIKQ+fARhBzIl2rf38tUCiUVG9rT7gvDYbihrzRokJy
         abRzR0ghwn8SRWEjRpy8H+c4r+BLfTMXpFKxy3+an4VevV68JqqpH3L0F23VhbSAmIrR
         Kk2nVh2pjxKOE6TejYAEOunRJFui+4V+WKmlmNWG1j20AybxmsWPoLlDr8OSSzzw/gxc
         8gnA==
X-Forwarded-Encrypted: i=1; AL+hErFS0cLmu7Y2+fB2Tqu/q0fHqy0FC9EnaY1ekYdPEKOI1OocdmLmPf0/C3VnB0+iL2DJhbBTnPIlZYgY4SQyZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8C69gQPgNVCkJE7zdUbcVZ6CmYQmlJwHwPVViUP4CIXKyU/0Tl
	YUcqpcKU3gwdxAATfAR+lxns8Vjznm8c5GavwE6TWDl9i91EbR8jXi/Mp/Fx5Uz3+Qo=
X-Gm-Gg: AZFdTZeYGpylK+MBbC2MF8wnT7kQx4EM44WO8uSqeDJ4lQnSsGLp+Sm/+HBabOAaYbB
	kkKY8PQLFYJ2acd+1DEhCBJrf6L/trciElSCDBrXgdFhTjD9rFjyQjlOTBkxCIX7QgO7PiOBtFK
	8KW1UCTntRgSom2hB7UUdSWTu2fpOhAA/QlEaOgnYPYc8l8UqDILRcRJQ8OxQcGCDpwNKws+OK9
	ucMlfLfjGTJp66DFeUvEqGwHjbThsqyGmvWYda4nC02hybUfCU6rjTC3sy7XmzTF4wAsPH9ZpJy
	ihhuk/tEFGLr2cqHUJUrQHhAWot6fselvi0X2ZFvaB/1h6Ro7BWc7r3V3mbzUXnhhpxxnSg+9Hc
	tRp2zVvlS3gpp2JNLS8VHQfh57pigD9Zp/8eOPvTXMNRDEo4iEzuDgC7wjXyURpeEHkRiHDVa1U
	unrht+l5WdtsNyAiuMPPvowrf87PbBdkA6QtXA/x22HnbpGxr+IoGq7N6e7ngCF1J3UIMA7nNfU
	bLSw4igJsBX1ye4GE0Alr3SufibAS1pzkjD1A4XZzeZYyMPchxRAsly7XP3qKqK6VRjI7yPRciq
	pWZoZyxOS2SzWPG6h+a+4DmgSTW0XpvYOdim3WRPLz1euufw+L2vi+OFiDYu5FtOxGT4T0St85i
	/9nixwCDep+a92B5RWjzPuEigMjNLEeaSQNPGZb0LHQ/qxzH83V2rbAsqv2g48MlKCNDhixQ=
X-Received: by 2002:a05:6000:470e:b0:4aa:323a:d7b7 with SMTP id ffacd0b85a97d-4abb16e310bmr8421955f8f.23.1795196555630;
        Fri, 20 Nov 2026 09:42:35 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm6597356f8f.38.2026.11.20.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:42:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Benjamin Drung <benjamin.drung@canonical.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: brcmfmac: fix use-after-free of the watchdog task_struct
Date: Fri, 20 Nov 2026 18:42:27 +0100
Message-ID: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

The watchdog thread exits as soon as it receives a SIGTERM, also from
userspace, e.g. when init kills all the processes at reboot. If the
driver is removed afterwards, the reference taken right before sending
the signal by commit c623b6358088 ("wifi: brcmfmac: Fix potential
use-after-free issue when stopping watchdog task") comes too late, and
kthread_stop() runs on a task_struct already freed.

  WARNING: kernel/kthread.c:84 at kthread_stop+0xd8/0x190
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  Call trace:
   kthread_stop+0x148/0x190 (P)
   kthread_stop_put+0x14/0xb0
   brcmf_sdio_remove+0x58/0x1d0
   brcmf_sdiod_remove+0x20/0xa0
   brcmf_ops_sdio_remove+0x5c/0x90

Take the reference before the thread is started and drop it with
kthread_stop_put() when it is stopped.

Fixes: c623b6358088 ("wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task")
Cc: stable@vger.kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index cea52d408817..67b2291f8ee5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -2478,7 +2478,6 @@ static void brcmf_sdio_bus_stop(struct device *dev)
 	brcmf_dbg(TRACE, "Enter\n");
 
 	if (bus->watchdog_tsk) {
-		get_task_struct(bus->watchdog_tsk);
 		send_sig(SIGTERM, bus->watchdog_tsk, 1);
 		kthread_stop_put(bus->watchdog_tsk);
 		bus->watchdog_tsk = NULL;
@@ -4500,12 +4499,16 @@ int brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
 	timer_setup(&bus->timer, brcmf_sdio_watchdog, 0);
 	/* Initialize watchdog thread */
 	init_completion(&bus->watchdog_wait);
-	bus->watchdog_tsk = kthread_run(brcmf_sdio_watchdog_thread,
-					bus, "brcmf_wdog/%s",
-					dev_name(&sdiodev->func1->dev));
+	bus->watchdog_tsk = kthread_create(brcmf_sdio_watchdog_thread,
+					   bus, "brcmf_wdog/%s",
+					   dev_name(&sdiodev->func1->dev));
 	if (IS_ERR(bus->watchdog_tsk)) {
 		pr_warn("brcmf_watchdog thread failed to start\n");
 		bus->watchdog_tsk = NULL;
+	} else {
+		/* The thread may exit on a SIGTERM before it is stopped */
+		get_task_struct(bus->watchdog_tsk);
+		wake_up_process(bus->watchdog_tsk);
 	}
 	/* Initialize DPC thread */
 	bus->dpc_triggered = false;
@@ -4576,7 +4579,6 @@ void brcmf_sdio_remove(struct brcmf_sdio *bus)
 	if (bus) {
 		/* Stop watchdog task */
 		if (bus->watchdog_tsk) {
-			get_task_struct(bus->watchdog_tsk);
 			send_sig(SIGTERM, bus->watchdog_tsk, 1);
 			kthread_stop_put(bus->watchdog_tsk);
 			bus->watchdog_tsk = NULL;
---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: brcmfmac-wdog-uaf

-- 
2.43.0

