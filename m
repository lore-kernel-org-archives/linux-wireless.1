Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796505;
	b=Z9n4RlbrhWz/7vU5Cyl/1lt0WpfxeEc7DltXJvEPwhzRMpXb9asGevirUt3X4L6x7Ubg
	 ySz46cxBr456ixvQo43Pw2wl0ia0F2/FT5U5mCdDilnR9kcWgKhNO/1SrjJUBh4oFWg1n
	 X7GSje+B3kX+O90CHaReW8LeVJrJ3BU7MNuqr6VxK633TiVfVVfVAHiBV5FJnY+Pw/tBf
	 YXB75kVe5e7WoRLSQcTpq/wIUc8D2ZDMKt0vB/MVw/DOciVNCv4DCBXprPoUX6JNvBkV/
	 mC6fxgU/a0jLNTeW7qdTzvA9dTJVLFdt3Sih9LhoijUBqi3QHwMx3eAlZZCaqJbXQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
	b=32TlJzPlXoTVHG6mPvPJigZZeulsgKGn3ZwdAFQwLN3ormlw7GTZUEj9fDCM12u8Y9OT
	 JPRtrU/qwDCdb5du+Qhp1d1T5OAwZdek6xbhZoQGO1vZGP4ZRWTT4Akut0Q7yZzBeIOem
	 8SSw0/I+Lay5Bcb4Fkc6JyPdeDygT1EvniB6njbrFSqqWbS1YHFuQjdvrYkWDrZcKgS4r
	 HN5sl6xyePuknLQDaKO0ynT6gkOjruknzrEC2uA6m2pdAUmUNfaSC6PSeWIb4yE2VqGps
	 Cswm6Ev3FFTzqHaW0cP4OCRu8Xv4TWamoLhlHVI1rFa7O3mXWpaN3FojZ/2gAo2DSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O1T/RW2g";
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5584C606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5584C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1T/RW2g
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5361e313e63so45214011cf.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796504; x=1795401304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
        b=O1T/RW2gTXx4anSr+Sd6NniszdjK7SXAZfXCoJRntf+SMTcmG57/3zTxXRTXC4uB6n
         dQ5MfWwtVFhRLp94mePLJrZ2N8AKvJgAlSDA39Ef3Jp2IIDX8sB/VvTvmrN4ySvf2FMR
         hg1j6vQSdJ6m4Ui7mmJy93E8cMSnnRfIJg1AoT879CBOepsk71N304AbPi+7YqIqqz1p
         zK76Trq/c3r8fa0178lDDf2KPjG25/nRF63xEw8ET0qPeGRHwEJ9iSzg0/pYK22zH1bh
         U/vjzL8aCQcpTS3NBh/1Nl10pbsevl5AcvaGFf5cOrRDfKP75zkmOOptzNVGRr8NMR3E
         wTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796504; x=1795401304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
        b=Ijzvj+rhbAj0oEZcly6fchXGEuZHwtO3jfnbuvHNM2M+8QoQ51M+Et/RVbvyP8gcOB
         ixKi+hle9IefV0K3UYo080uvrddcOMgcP/fyCKOguWf4wcygqe7fMvD5QiWE2xSlBoqC
         05u5/e5TpCg8MFHP7oVdjzA4IwTQlV5HiLnvF7JwtciXyNwwQDYkDUl0/xFPMr3nq7UJ
         egIVJp3x9LKQ9Jw4qK02YLjsL12Zip5y87xzA4t7O08OyMggodjg9rLq7kkvFhUCUjdI
         skdk27Aty7zbrs6OSByiRwga4NTXqrM1P12M3qphCrFl1yzX0S838tfC99LRAxCJegTO
         C/Sg==
X-Forwarded-Encrypted: i=1; AL+hErG5XQwal8BGccHcEEDKeKnr+hDVK2cCuRaWBIQMvwcj5tOeVfJ0alnobnP31pMmQ9oekm9n4YB8RTaR7xnDrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8p4wUG8qkmu4sNmQGb3R9zuIpsFYq8UbIV5Tcx4f3k3R5Otn16
	BELQ95TDEjoXOrG1U9xOvV0c4hHmfcsfkTW7m1XNrt5H/6PKfb4bT2ysCNU2EThg
X-Gm-Gg: AYBFou3JXHUgClhvSMpmO/aPLhxkgK6sdnztnGT4nPJgWBM9Ob8B8OtPf6pfxbNnbxn
	LPqWVleqz8sjH5/L2EhANrBn2FqxYDKrzq4XgTEypt7df4iYBGZu+IPqbFtkFrEDWekbaTR5UMF
	/93wwyq6J+WsP52EepyCn19FvENy/Ize6EKU+8jyxx6MjDJRm45BXVFngP9iJuV3STHD4DNGCuH
	YL84LYJaOpc89GG2lHzgux84gE10/gYs3RE1ySBR7IutccjYCpHo6vWE6EsMh699czLwnAYUqrA
	ukoQT4KJPVdV4jwKIfH1igk1RFsvNlc/rof6KYR+YX5VmkfqkcPqmXg+xbfmpXrdDMcm1dNU05l
	a/XgZgZ7jr0yAcWQo+BbHq7hBUcWZ43UkAqgRzaJu9grZ/lZIIAPK9sOHJa75j+plBKMegxN7Z7
	73PbgvGNboZajfnOTSnP+1348z5f8IlCDCc0Leb73U1UeInR32ydXIS8jGaH0YCCLHbzYAY836X
	9hG1+X304ZbAh3C9uNI6h2WNw8N6OaLjFb4QmCapKZ+cAV/QK0H+WTe8ISYO/4QtyL5aXPhmqHg
	Qwi7IQNIV8a6vYuSGmoej4XPJmvSBxST2Nm4w5B3zYN8J34QVR229gByiM7PV3ZK12U3QCi51Dw
	=
X-Received: by 2002:ac8:6f13:0:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d37898ed8mr37604981cf.15.1794796504192;
        Sun, 15 Nov 2026 18:35:04 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b11d9csm72535261cf.28.2026.11.15.18.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:35:03 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH wireless-next] wifi: mwifiex: hold ack_status_lock while freeing pending ack frames
Date: Sun, 15 Nov 2026 21:35:00 -0500
Message-ID: <20261116023500.577610-1-lcy8047@gmail.com>
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

mwifiex_clean_txrx() frees the frames left in priv->ack_status_frames
and destroys the IDR without ack_status_lock. It runs on every
disconnect from the event work, while mwifiex_clone_skb_for_tx_status()
can still add an entry from the mgmt TX or data TX path. idr_destroy()
then drops the new entry and leaks its skb, and idr_alloc() can write
to a node that idr_destroy() has already passed to call_rcu().

Hold ack_status_lock around both calls, as the other users of the IDR
do.

Fixes: 808bbebcc8fc ("mwifiex: add Tx status support for EAPOL packets")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MWIFIEX_SDIO,
MWIFIEX_PCIE, MWIFIEX_USB and W=1.

 drivers/net/wireless/marvell/mwifiex/wmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/wmm.c b/drivers/net/wireless/marvell/mwifiex/wmm.c
index 841505e83c7f..b889a58c7f6c 100644
--- a/drivers/net/wireless/marvell/mwifiex/wmm.c
+++ b/drivers/net/wireless/marvell/mwifiex/wmm.c
@@ -611,8 +611,10 @@ mwifiex_clean_txrx(struct mwifiex_private *priv)
 	}
 	atomic_set(&priv->adapter->bypass_tx_pending, 0);
 
+	spin_lock_bh(&priv->ack_status_lock);
 	idr_for_each(&priv->ack_status_frames, mwifiex_free_ack_frame, NULL);
 	idr_destroy(&priv->ack_status_frames);
+	spin_unlock_bh(&priv->ack_status_lock);
 }
 
 /*

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

