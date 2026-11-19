Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108465;
	b=OYmLCCuIEeAlFJe1rKDvpA54abExoaCs7ojWHGtWefU4Y+VxjnzmArNpE1l3FK9Fq8MS
	 NPWsT1MZvY2Gv0NcFQLZWzbM+adpFTRsYTeK1M3mM5blqtINoLTYNgwMpr/TRZqfYxIFD
	 DinZUG7ba+m2GPIEVh6FKmgiXJkJpkESH+Tukh2vCJMCN+2C81HxowgEKTAHI2PwW2gm+
	 InP5gxuVKRUB1e9yvgnGmbda1QA0a7zbKARjdZ9UDQoDKWJT/BGx7ZTLnY8XniPoaEGjV
	 YRWde1YS7AW8K8HoHbshIjaAk3t0I+uvBp0dUXS7kVujG0KMrJVnZfZG90/GJ2d8kLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
	b=l+w9DZzd+ziHepErW55jQjgVL5mKP7vrGCYopNlghOVW50hv4zLb90bb/Re7PA0gPkO3
	 zWcdSvnS1DljLdxc1tPQBWCwZ5lFCMOgzzFoB4ePSE8WM6ayC8GgCmdnTI/aL6+Waq4p3
	 L8G7A9zlQCxUsIx8ZG/lC/7w0RkZIF/qv0iPwdmOI9PxraO7JHqvi0j/0+gZ/e+8NzRWD
	 qlkVoiYBUp8tnTgesejNwXR0kaLLOsBG+EtKUvseUlcubf2Cv83w9kUxOPhwrtw6oWbSR
	 EOT0062zsMhr/wgWF+wIlNU3kHB4P99cPNHUmxNa+QmV0eqzG1yqDHtYXehew49N1TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TQPFaJn7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4FE606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=TQPFaJn7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2361091f8f.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795108463; x=1795713263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
        b=TQPFaJn7mE09goYV3+Xo8kUI/DygA1uaiFmHcXdW6I5NBDQXrr8J1t9AjPMEkS4TA4
         LoKDClkSBELPS28po3Y63QjJ+xaFpApUCrmbZeaaulgDJRKd5ILCidwwYqYwbXnWIpPr
         9b78y+4rgNrf/kN31Brr1P/2DgzLKjcStk2Z9OV31LyuPoQkh1uibGFzXPBeXiRuyFxa
         Jjt697hpVN4viiVTzBoMnQ5i+ddMRU1E9UGjMTOKeOFlFyV9wW/FA8vAGyN3O64aDVkg
         W89zZbxxPry+Ke0qfxFH0xOp87vWdjy6KaOUR53VqqAfthC9dGM+2pYzaXxgK0UNO/Dn
         0Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108463; x=1795713263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhZGlNLLUFACUzqnlk8PPKTHaglC19lgiNotXjp/ynI=;
        b=wxrdyVNikhvnCvoG3iajwSs426LypVudT7YXwn8kwfd3Y+XIy0KBtXB13hiQN/8IYG
         qirdCuwe2Yp+daQCSJ4q9viRCZCzhJHr6xFIULCPtbEgQAwg9JSR3yaDxMjtn3YOHr5W
         dlBMRcAsVzM0L2CbEfVH4zpWcqkR7PS+bZirhknnAfH0JWe4G5oAFFJyDVX6nbQuS9xN
         8lbupU5Yt/D9+HgR2Nqi4iu60ZH2oL393pKvBUDB23AP3789Wt1YOGqriNOAm+/sWMW1
         eNdlkvRkQVEHvMsS21mzVpN/IvGG7zOk0RpYg/+vaVB7poBdYM/ewXkaOzdO6IzIpkJC
         TM/Q==
X-Forwarded-Encrypted: i=1; AL+hErHoT/jiEq0NITRFrTGuTWnRlYdPOCEVSi4pukzVwEn1pi3XwUTsvFpPalhlfnWEwPk1IkXV2G+qkJmptDWjPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5WmvYlB+16+BQljl1uQ+Xa1/ndOvMCvnJwXcT4aRBWzoCMuyU
	H/9PuMH3Y0s8SDn7198+g7dcGIgWSWOR3EmzWkOTCtcCTHCM5i9IQpEqwbaVspbjlbo=
X-Gm-Gg: AYBFou2eDweNf0zdaHCJQBsaB6QZLKAxX7AXjlYsc6QTLErTUb6R/LE6ZRSTiTgvT79
	IIYatKCQzkRvO0KQI4wB/5a6xBhjUFxWFjdgpnHQTfLjZw/VQTGDeUdFa1xp3vNaWtqaRjTMpxg
	j+XP1U96ytC3o+XLBxUl4dgc9Q4S8xSzZiVjSBMMK0Vx52epwSsMr1UX749TbafxSr1b4lnGmQ2
	n8fhgqVn9ioiGbDksJiZv81o8q7q91c5pw6FcMK/+0NKFDMXKXj34sJKpCvaOh/JF0CkfbJPs3s
	gBzoBAqPxdgUcgOZqrr2cobsdtDXaeuae7/Rums+sbP8Y8rOIT6Yfn4sjCBHB4FCvnRzCCS4tYZ
	xK3qEtr3dFqnFRAh45SDyG1VpdVxSgMldVOwrkwdyxb8YflvJezjkRNWCIHQoSEjpE50ZitIwa3
	dDBMgEms7sY8CX9DS7n3NpDlFXrw/G1hyc74yWTxwdXlQCiWylRQgSyUUOGjZb1cnkrBlNO/MGi
	vQSzV6cX7Rwqqye5VOCdpnLzF3vRqbr15VEguWSsEiGX04DkDKmpYkAXpCP8Z5x0WBmXX6PztpQ
	wVrX2KOlwG44AfpvuwZlF4ho
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr4530775e9.1.1795108463295;
        Thu, 19 Nov 2026 09:14:23 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84cc09b1sm44392685e9.0.2026.11.19.09.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:14:22 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH] wifi: mac80211: reject zero or oversized fq_quantum in aqm debugfs
Date: Thu, 19 Nov 2026 18:14:07 +0100
Message-ID: <20261119171407.1975535-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

The aqm debugfs file lets you set fq.quantum, the byte budget a flow gets
each round in the transmit scheduler. aqm_write() accepts any u32 with no
check.

The scheduler keeps draining a flow until its budget runs out. A quantum of
0, or one above INT_MAX, makes that budget never go positive -- it stays 0,
or wraps negative in the signed counter. The loop then never moves on: it
spins forever holding fq->lock, and the first frame sent hangs the CPU:

  watchdog: BUG: soft lockup - CPU#1 stuck for 145s! [kworker/1:1]
  CPU: 1 PID: 22249 Comm: kworker/1:1
  Workqueue: mld mld_ifc_work
  RIP: 0010:__list_del_entry_valid+0x21/0x100
  Call Trace:
   fq_tin_dequeue.constprop.0+0x426/0x8d0 [mac80211]
   ieee80211_tx_dequeue+0x817/0x15d0 [mac80211]
   ieee80211_handle_wake_tx_queue+0x1ae/0x2a0 [mac80211]
   drv_wake_tx_queue+0x1a3/0x350 [mac80211]
   ieee80211_queue_skb+0x302/0x610 [mac80211]
   ieee80211_tx+0x261/0x3e0 [mac80211]
   ieee80211_xmit+0x18c/0x280 [mac80211]
   __ieee80211_subif_start_xmit+0x5a3/0xb90 [mac80211]
   ieee80211_subif_start_xmit+0xe2/0x7f0 [mac80211]
   dev_hard_start_xmit+0x157/0x420
   __dev_queue_xmit+0x1116/0x1770
   neigh_resolve_output+0x472/0x9c0
   ip6_finish_output2+0x87f/0x1320
   ip6_output+0x1dd/0x630
   mld_sendpack+0x94c/0xd40
   mld_ifc_work+0x42/0x270
   process_one_work+0x830/0x1330
   worker_thread+0x4f3/0xb40
   kthread+0x32a/0x410
   ret_from_fork+0x2c/0x50

The same lockup was fixed for the netlink knob by d1cba2ea8121, which caps it
at INT_MAX; the debugfs knob was left unchecked (netlink also cannot set 0,
where 0 means "keep"). The file is root-only (0600), so this is hardening.

Fix: read the value into a local and accept only 1..INT_MAX.

Fixes: 9399b86c0e9a ("mac80211: add debug knobs for fair queuing")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found while reviewing a backport.

Reproduced on almalinux9 5.14.0-503.11.1 debug over mac80211_hwsim: writing
'fq_quantum 0' is accepted and the next TX wedges a CPU as above; with the
fix 'fq_quantum 0' and 2147483648 both return -EINVAL and TX keeps running.

 net/mac80211/debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -117,6 +117,7 @@
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[100];
+	u32 quantum;
 
 	if (count >= sizeof(buf))
 		return -EINVAL;
@@ -133,8 +134,12 @@
 		return count;
 	else if (sscanf(buf, "fq_memory_limit %u", &local->fq.memory_limit) == 1)
 		return count;
-	else if (sscanf(buf, "fq_quantum %u", &local->fq.quantum) == 1)
+	else if (sscanf(buf, "fq_quantum %u", &quantum) == 1) {
+		if (!quantum || quantum > INT_MAX)
+			return -EINVAL;
+		local->fq.quantum = quantum;
 		return count;
+	}
 
 	return -EINVAL;
 }
