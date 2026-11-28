Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881817;
	b=kfUQ6GVov9XhvTKEMgF2oBsRJJS/NYG2eisNxMIMbxg91PeILqebwLcAH43iwrNozfyY
	 q9vZQaRwBmk+StMmPLQzF0ARki1k9dg1swGzziIRYPgLYgAwebe8Va3OkRL60V9IYUbZK
	 RTfpU8OHkP60hU22nO3Cs03TJiPpaJbyeMYWyeu0M7h1eI64JF1zexmjokbFFdgXj3YOu
	 qya0ca1hOrCLVkdfbSiW4vhW5zznLDz2L31n3n2L8I8gb7BG8wwGUN/O2N6WDS+cwn49q
	 iK9xbkYZoc8j8dP80xoQbR65s9Bqg1oJ1rnT8usvJtpSyXuOsyIoKn95FkrKAbu6Wjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
	b=oXZOqbPNXLUjqglJDMXmUtwbsVQxA45M7zylIOyM8HyIXDoIoYcsSpeD2Xds+9LYn/KZ
	 nGCAbxr94nF5KiLEL6yj61qk3RbyYWSDM1B8TxNoA4BJ77mSO3Trp8RvKeeU/tsF+NF5V
	 cJbrvJvZTlGEHWr0o+OcfdedCzuY9QCAzWmtzUZ3ucseRIR/h6rf2Ndec5KCkhcNE+RqL
	 RKsZ0HLBUjEYs4EGHe6T0Aj7EbXfMY1lKoiozKaBs26uXZmksWm6/DVZvPNNYxCCoU80N
	 GUMcbAgBWQDH5K8XEAiXlWwFZtlCWsCryiaA/sZIdP35zvPJ0RN4kMot8d0OsaiPUpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jaTmPPUB;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4FB606A695
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4FB606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jaTmPPUB
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c51d158acc6so290683966b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881816; x=1796486616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=jaTmPPUBUGrStpADo6rAR/YisB0UqLRwonQeqSZXy7t4wtbFCNzWSmaQSsIKTN8+si
         KfKzZRgHOmnpsrGmGxwmN2FpSF2+uOTjdWcEkEyYeac8SO5xwXRCilma3GhY3QZNtcqi
         tH1M+wm5TTK0wuNhrNqe0nJH1yEbMrpViRoP06HXbZfHsQ6vWTExLIjCFxNqfTCCjtbk
         u+mAPddgsuP/ti8jkKpO/OO8d1jLiAEKos9lV/4HFYqbsa/rkuVP3OisJrb6ySGHjkB+
         ktlXW1Lqxw0x5FjozyTuDc7n9e0IaQ0k2X3qPcSfiKICCGQ/MROu4hxpjaZ9O9mlms19
         XG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881816; x=1796486616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez9P23rCLelSTv6DxW8GiHH5VAlo6UYqYVY9WzMcC88=;
        b=eGkNzXcNlX1wP+nwyr7gVhIx5n+GmvIhEBBlLQXwBvcyXWBpoLFF3suDerXccjSKnG
         /IPibRsOhKaoAo12koTdxLS2cv73wMdIV1CEPEEEAYh8FgP67h+luesAt+tgNvFmj2JT
         rkBlAAkk7ylss6vMFdSVL7R7C5hq3D8zLi/ATRSUOBauL+HLRyWFiidQXQAuR/ns2Uzy
         LbFXn/8OVRetgpMEKq5Of0r/VbvF4i4phyYOmuq0ldrpGZed3h5T/d6Iim11y8JC2kL8
         UjbWZ4gQOU/48LrdSFcBwAzYRw2f+UQ2mftqV1evfBs2Szqzib5znQXtcfZVaCMKOjUG
         S7Gg==
X-Gm-Message-State: APuU4Z+t1YajwJB9RvTQJ4LGUoH/91eLTgDgSMZBw2dhaU4YwgyFSahU
	y013sADMJGZZBzDz78swpgTaaVvCpIs7AXnqyveFT5H3OofP2ZVhDhLYfvYYan/Dug==
X-Gm-Gg: AZFdTZfC8EZcZ6f2pHdg9O7iqy4Ujx6BdO8fvo+eWI86dera7e+PWMJH4dOzLTF+frw
	9BZBUS1Sjs0KWjE2GBTUyNXvas/x/yQMCCBwgYpS9HO9JegRdp6blAGxLeaQLAQuG/fYtxrqjE8
	PBOuJkLSQQ4VYiGUaGe9BLBxg3MYh9byAcsqU45Zb8aAwbSflbPxMFAaIFECngxC2HiVWV8UnY2
	pEgOvCjyTAqux8ZdiLG7Kf7rh1/BuutGJ2z0IPitADoPykh8nmijQ1vVOwfWlhn3YbaGn3yB8+K
	tsfScB1tZA28McQJFPh0Pqn1jT6Zmjyjsn5gHD3rLzvhGxg9MQteW1qcSIOrz2bGU8uTqlZBPiz
	pk9WXxFykbuoLttWAHQRk+4/KyAkB7b7uBqV7zlMkmwnWlPrCnwAflkBwMeMcyOWhKw1Ay4swp0
	mIuc9iu07P+YUJ6gFJ8VEY5OrdZOpQs+VhBWsdZcf0waPcRdA2ms7uVHU/A19p8XXe/WffxkEdz
	fAB0VWlHJF8MB25m15YKQrcJs4MqvY0kAuCkGlPfLvqHLwAA/5mFIFAp+asBU9cPCRW6hJbLT2i
	HI8RLtzVoGQ1V4e5kD8c0lEVHmLHYsWYeG3VDSNU6V5UbefvMQlEtU0e9ZES3Jh9Bd7rHwn97Wl
	H6zoQ3jlZ6mt6RwdgLMXh1Wkm/YzhQtVcuMJ3LeL8dYUJsrvWGEQs/MC1w5+0fVNBG1V5RiTXH2
	JvZTueEoGOmklW6IAI8fGtA4cF/iCd0/rnSs/lN7KlBhumdSgptJEqxBZl5CVb2m4DJ/5/oXIhL
	XROxWsi8UOz906xBSjm2tg8dXZ06fadByE7q1n3rrSei3qETw3LVPEFpvpCS6qJJenU0zZJl/Q8
	hslujDlP0N8zWFO2TMxMq4IwlNrE+ebSfgQ=
X-Received: by 2002:a17:906:27cb:b0:c51:3acc:9f86 with SMTP id a640c23a62f3a-c513acca092mr1932323666b.39.1795881815705;
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 3/7] wifi: mac80211: clamp the AQL airtime estimate before narrowing it
Date: Sat, 28 Nov 2026 17:03:31 +0100
Message-ID: <20261128160335.1815537-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

ieee80211_info_set_tx_time_est() takes the estimate as u16 and clamps it
to 4095 us, but ieee80211_tx_dequeue() passes a u32. An estimate of
65536 us or more loses its upper bits before the clamp: 65540 us is
charged as 4 us.

Take the estimate as u32.

Found by an LLM review (Claude) of the airtime code.

Fixes: 7a89233ac504 ("mac80211: Use Airtime-based Queue Limits (AQL) on packet dequeue")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 include/net/mac80211.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index f768ef9184eb..ba16096fea3a 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1425,12 +1425,12 @@ struct ieee80211_tx_info {
 };
 
 static inline u16
-ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u16 tx_time_est)
+ieee80211_info_set_tx_time_est(struct ieee80211_tx_info *info, u32 tx_time_est)
 {
 	/* We only have 10 bits in tx_time_est, so store airtime
 	 * in increments of 4us and clamp the maximum to 2**12-1
 	 */
-	info->tx_time_est = min_t(u16, tx_time_est, 4095) >> 2;
+	info->tx_time_est = min_t(u32, tx_time_est, 4095) >> 2;
 	return info->tx_time_est << 2;
 }
 
-- 
2.53.0

