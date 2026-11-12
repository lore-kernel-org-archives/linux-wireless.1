Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501987;
	b=SUskohZuPvTMdHLc4dmDdPyiKIQHomHV7ZO5On+GgYT5+c3M+Sbtmw/Ht0h0f3kZIMuq
	 BggE7av9ws8mgDVXdWJXuL76tJfvU2z3pno0WFqCO5Ah9jcSI6vCbDbWO6efiLLeL1kW2
	 uvtKm4XGyS6faSWRFijcjIH7Z/AAbsq0HkCk4nwmbvIf7bIi8krre5YJcDZNz1aI1QK+r
	 P3V1io2YfNgrT0Vrwn9iGIR7Ng3CN7JN29OiN9+r1WqOZyCvYKKcSac7IFNJVXWei3v1u
	 QGSew6jxtBQyiOc+KPYhuyUj6OlvtAo2ZPyoA7eB0rZmp4DuJ+zQ5sDovb5cKDZdqBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
	b=3ZSFWRaKL+oNjpugiE9pcmrCkO3DxSPYyfCWKmJ7520no5BP2v9xxFHpLDIOHa1xNGYR
	 69HaBtold3q2UT4fspZRYVwJdcKVfGw5nmSGQ8RHrbSZn2qWMbJ655aFVWKq+hI+Hti3R
	 RBFelBWpwee2ms8o0YMUhwZnu0nrSzCAv0RoeZGFZ0/rmg9gNDD9Bt2fZsYc9cKaWZ9Jk
	 t+8u0rtXUFBpf3hbtM/VCdA9JMynN5ehq1flylchtGrKPsDJfAEnu80fnGUhbOV/R0dP1
	 9UA1UCs3wX4jRfnArznUdoDgQaRFz5hOsGAZEXrwVZprxUGPJHNRKGt68Mt0ec8EFHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGl4awbP;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E5606A897
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 025E5606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGl4awbP
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so8742651c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501986; x=1795106786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
        b=NGl4awbP4cxTosV01JpmMZ2pxoPvY5ylLrYz3BD5sEVHfMIFQ2Rb20viJfa1dIzRRL
         wRzxqhp+BHSMriiljAKqlRwAlia14qtse9bPlXOZU/h1QVtONNgPy6mwzRfU3yzJn65A
         KfYVYpOcCP7IvaU/eQrBC+diaYAp6i2KiSEA/7biVeQ7U4g/+jb4A1TH0jgpfNP6q9gY
         mqSbUCVQr2FTFPi0yR1OtcwaBxDsMMtDYyyMw9LKwyne9faB3GfO299ztGIkPKM3wYqO
         J4Wg6bsjrfqUM3RyH8bAvto+YnjT7Hp2tY4I9/wEOdVp44aO3mAEGD8cK1UxseBHXneZ
         Qhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501986; x=1795106786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdSxJgtfR49+qc7gDQuzOS5wpt0GubDI8jUNJzdvF5k=;
        b=DOKHCjNMFP9qIt8+uZft+I2943DJ3L/JUXhiBS5t/3LiEMDgEUIuHxhUXBBtnINnIg
         +TqpIx1YBxHEgtM6Z4NNZUa4ij8MRHosPamWuYyGDYBvImI7T9ZRJ60kYK1HVanXvIOE
         5/Rkt4S6zl96zFHu0KZYpRsKH7i43Vwyu3xswFVxQaOuv4eJ07mDHS+NzSYadGIUugSu
         oRpZ84O2yTbtjfptoKq935cmN5RAyzl9Ox8R8ysXgLF6eYP2ILVjlpNUIDP1tMKrCBfs
         Ho9bfFyHTBd4kp0ZLA/ox0/WYC/0zejf4lGszyFsp5Xa9VLIbpZ9iWKH5dKdj+CqtqZI
         WCPA==
X-Gm-Message-State: APuU4Z/WofVov6oE5flTgtuiDcGUXo3ElpKTYPxjyOKWcT+6IXP/CF7a
	D78AJHzo5+5N0QE1hT0a9dQHMpE78ApyK+Z2L0tkKHjHpXnts5MAduia
X-Gm-Gg: AYBFou2xc88O7R+2AGvrBZKo4T4tZHyhph7ot12EKPBczFNuNAA/4fw89Tt3EsyYeD/
	HwgzrYMYCQmf+vpbMt1PyMrOKieFfbk1fbD/syw6he4p6yXRIBz/EQDXrl4lqoOB60K1D52VE9z
	1/b/UghXeg6K93sRM48Fn4J1vg3szUss3Nd4lZQGBdWOJZIcjmj+9zOinIfvTOLzVw8PX+aL+jy
	xOWpTYVUYDRvXrybpI5BbQ5oQ7lYzcG4ZUISnTq/fAzmMvO3mec9ZUR/gv8RalPP6V39HIyp6un
	HMRLkTffM75eDlYF4/haaZP1F1nkcxO5E7XlIsS7LfTsauebxigB51kk5+uMiTo21DsM4EETzG/
	irc5uXIoEeSAl0rl6M1Sl/TaenhrAL7GfYQJklIG5mAO9vUctQt7XaqgyyfvIaGYSQfdoj6LBZ/
	2kvtV+OdRE3UOjw6fxLu8MvHieF2RZNUu5XnlOxuSCNPRmHJ8eHkDfgU1NECJIOMGD9bu1yKHAo
	MElP0smKv1MG37HaO0d0/LVeeldchO5noeMLxZBNTMxqLIbL2cdfAm0a9dJWMvl3nvyh+3NoyUh
	bmpGe7ur+URp5FTQrwNdTVIwikQlwJRj/epvnAjdmrR9I9qp5TxckvxZJK2MnO7Z657Cj4e/vZz
	8Sq3U3FHRQgbEbwKKf0ItJZs4bl30vY911aGBbb9cLfFI
X-Received: by 2002:a05:7022:3b81:b0:1b2:610b:878 with SMTP id a92af1059eb24-1b50306917dmr113343c88.6.1794501986126;
        Thu, 12 Nov 2026 08:46:26 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:25 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 4/7] wifi: rt2800: don't report an A-MPDU length to minstrel_ht
Date: Fri, 13 Nov 2026 00:45:38 +0800
Message-ID: <20261112164544.3176458-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

Set IEEE80211_HW_TX_STATUS_NO_AMPDU_LEN, which was added for drivers
that can't report the proper AMPDU length and record this workaround
below the TODO comment.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 1 +
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 3be4f4cbde..269d621f51 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11837,6 +11837,7 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, PS_NULLFUNC_STACK);
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
+	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 7c03fd07bc..baf5d039bc 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -374,6 +374,8 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 	 * by the hw we could provide the real ampdu_len to mac80211
 	 * which would allow the rc algorithm to better decide on
 	 * which rates are suitable.
+	 *
+	 * Currently, we work around this by setting TX_STATUS_NO_AMPDU_LEN.
 	 */
 	if (test_bit(TXDONE_AMPDU, &txdesc->flags) ||
 	    tx_info->flags & IEEE80211_TX_CTL_AMPDU) {
-- 
2.53.0

