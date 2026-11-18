Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987887;
	b=n8ZZKZB12w61WMK7gw9Jy+AOIwNH4HRg/i/1mENNehcX6qA1Si8zT5+u0MBL7W2esry3
	 qUCQsY0UTd+69x8vvfzTauWPjMULsOiZvSQNoq82nJWnLFzWqzzzbFWwcZ5MKpXmUXbgZ
	 nMCVrwCIUqX/QT+VmS/ST451vj/GatIa+LeOTu7rrAGRVc67SL2oU0y6AaPydEokeZD38
	 JI5stRedQSu4uTW7j/WqnzueBGLmUgYJNIQuCfDKCIHqVcprwpIhFoBwFhEcbitkJJ5kq
	 R8K9Qq3dtY5/W1SbgzbyLYgMUI7SUk9smI3hAiVS65qt36rAvCUBw7CynElFg4sOiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
	b=AdqfIkMcohGUDlubdX6BFLVWzVFh/pUUHl8NhOFqWCBptRQUJeiTq+rrJCJnPMrUUO22
	 PfB/B1hWxgvu+SbikgfFuYq5RgDd0WdtqDpfa0ccsvdAYEP6S5gcGAC+Uk7Fdp/4Lct9d
	 AtiYnQTxPIGoPnCVKlFxTeasTgbCVPXWwhCte/xDI9Tss82lTAFahzC2DoYvTTSOB1sQa
	 vw/BcMbrRz1SBgCCDbjMUnz6/cLokKz2YQL0jMfQUkrFZwYOWu6BCMXRFMKE8Gon53Xyx
	 kXw1NzjfWvayAkLsW5xTjAY6g5diGhOP4lZgyn2gI9wv/PQroPiZKzM7485a8lKZwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=quora.org;
	spf=pass smtp.mailfrom=quora.org;
	dkim=pass header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=jO4u+vVH;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA32606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA32606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=jO4u+vVH
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e977109392so3928955ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1794987887; x=1795592687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
        b=jO4u+vVHbKfydjhXAgKGqbmmiaqz5waZr82t4jcefYRuztKgvoKYZbtIwkEB2lBpSj
         t75qZhQox2VBo5S+opH7xbCckEx3lv0fomGg/xhSOIUPVO1nDXeyTX+ykS3yTaWxbv+F
         JsRVg78nEb063msGH2HQPjPOZRAfbQRT2R9IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987887; x=1795592687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PGhhjEgvqZ65gHKlryLhyRpAAf9R8lJRaIz/grErgQ=;
        b=fAOT9WXAh4tmVkOPKtZYcTjqOiC+jtHDKYWY/1/ucImEGQhl7gJa6kwTDxYRrvuNq/
         /uQ362pyP6j+Fou1vF+aimRA5mZmDvr6GRHPwis90rxT7jJLA4cG5WnxVOD0yb3dnv6E
         Vd2F8Ene97dQy++y7Ep/p35r95Xbn66K4QTvDrrurkXmJJwU5Gd03RASqK7g0Y3Gpmou
         VVm+WSnE5FqYWvvVtw7StDgODRsF7BwkAfYeOCdyYl98exSxWuIJy7jKSLEHarXext+g
         Ig2UoTrQav372Wxn5vUtCwVBWtxvzh9d+CbuDNPb24RgBE7bSJpGS4tJxC5cYdb91F4z
         hxzQ==
X-Forwarded-Encrypted: i=1; AL+hErFLeb42opCx+CHeh9TqjSs6zKMrnQYomUKdes5HDhS6Ti479imxbWtezsv2ujmTreA118XNHEgS9ctPfl9rCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZcE2Ng7j1t+6sLVsp0Dd9kFg4vfSTlLQuAz9ksfwsxkd/gGcd
	GBU4euGzjnILf/sjHUEXPi8p91Oa0WxDKrKRTgArklrF7UEsbNkE0UxIEfWChJ5vcfU=
X-Gm-Gg: AZFdTZeyzkFzwigv0l/pIqXTI/W0q4A8EB3fMyWov3sTLU75pBdZDGCp3rXabWNEz7A
	61ddXaIrDgk595zEQI2V7mYJTKDMTFQsd+Wl0jHPlgMwDGhCoR1P7H+TOGtpL8BnEf8g4Yl/WjL
	PEHrQGzJpQWSNoKdjUYgsq3ybh18pAKhhvbIl7Sa46fpyBsvCL2bc/Hu8DmDjd1F18ohp0MdAIj
	wivgVlvcZfxUeJ2/vOP/pxymW0sBCPeUldmJlOxxpPdvdhAgwPwiFVkjOQ2T7vMIVZ4MXdkdYJj
	tQCqLOU7nQOixgy63AJfpxErgusl6mgAAvBJC94eU4Hsk7/4Li9e4Su2H0TeuiqFpI15bb6a3J1
	9khkDLS4Cv/nN39kqoLjG8GlsJKV9IP4yurbzg+9GCh/VxniIKIGFxAOJYh7vt2rPbNT2Hjc/Lt
	9t3XPyt3AAMc7w7k8PgbL1gFX+VxPXRj3pUyZA6xqaYukP0QA5ip6/GB7xhnYnVjNpPwGRF29Vf
	jDh0kKcDcT1At2bjmPk8fDotaXyjHb/kepvEjbi1EFxOrC5oDufvLKS3uY3avsGcpakjSAoc5RE
	I6fTZSaVdT6UvAcgPyu+gw7uU7mTK5T57YkEZcBm22V7gpUfPgaYZGD8ege4jKj3bmPKT33wRmF
	XAqRACRSfLl6YDKDZv/RwGhu/fZG/DctW/7rat/+jDgTuqtbpDq/zGbEWgsUeoZb3V9eLPh72pp
	RnBSawYiya70GfwjvvvoIkj/lud7/0ZEb0bW9KtJG3zAfMDkqkTpkLUA2dXZOKKVoIl1jyEs98e
	2OQf6O2mEeDA5RS
X-Received: by 2002:a17:902:d4c1:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2eff76a9fdemr20403605ad.62.1794987886252;
        Tue, 17 Nov 2026 23:44:46 -0800 (PST)
Received: from localhost.localdomain ([2001:fd8:4d04:f800:62d7:4d2f:7b52:ebdc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162dcsm8861185ad.18.2026.11.17.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:44:45 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] wifi: mac80211: remove NO_VIRTUAL_MONITOR monitor interfaces on suspend
Date: Wed, 18 Nov 2026 15:29:47 +0800
Message-ID: <20261118072949.14222-1-daniel@quora.org>
X-Mailer: git-send-email 2.55.0
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

When suspending with an ath12k interface with the NO_VIRTUAL_MONITOR
hardware flag and monitor mode set, the driver skips removing the
interface. This results in a firmware failure and unusable interface,
triggering:

WARNING: net/mac80211/pm.c:173 at __ieee80211_suspend+0x44c/0x530 [mac80211], CPU#11: kworker/u73:11/20379
...
 ieee80211_suspend+0x24/0x50
 wiphy_suspend+0x2c0/0x420
 dpm_run_callback+0x60/0x2a0
 device_suspend+0x268/0x7f0
 async_suspend+0x28/0x58
 async_run_entry_fn+0x3c/0x190
 process_one_work+0x1bc/0x4f0
 worker_thread+0x18c/0x320
 kthread+0x128/0x150
 ret_from_fork+0x10/0x20

Fix this by also removing interfaces with the NO_VIRTUAL_MONITOR hardware
flag in monitor mode.

Failure analysis and fix development was assisted by Claude Fable under my
 instruction. Validated on my ASUS Zenbook A16 (Snapdragon X2 Extreme) and
QCC2072.

Fixes: 9d40f7e32774 ("wifi: mac80211: add flag to opt out of virtual monitor support")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 net/mac80211/pm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/pm.c b/net/mac80211/pm.c
index f63676c44853..503c24cd2e85 100644
--- a/net/mac80211/pm.c
+++ b/net/mac80211/pm.c
@@ -151,8 +151,12 @@ int __ieee80211_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan,
 			continue;
 		switch (sdata->vif.type) {
 		case NL80211_IFTYPE_AP_VLAN:
-		case NL80211_IFTYPE_MONITOR:
 			continue;
+		case NL80211_IFTYPE_MONITOR:
+			if (!ieee80211_hw_check(hw, NO_VIRTUAL_MONITOR))
+				continue;
+			ieee80211_link_release_channel(&sdata->deflink);
+			break;
 		case NL80211_IFTYPE_STATION:
 			ieee80211_mgd_quiesce(sdata);
 			break;
-- 
2.55.0

