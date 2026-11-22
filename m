Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360092;
	b=jnVs+XfIjblp6ShLLPYuoRk7RZVxQT4W9wFTrVbjKV+1lTLyT9iwd3REfwe9KLHclz//
	 q4BbHV3/YVhDPNG1lC+J/k9m2A1TeWUwA5O0DuJ+PDRP3UaDJioscogN5p9OfOiK+6u+t
	 QadJhKEhi1WTws+bXwfSAXx6AC/SkUBdmADHUVdHfcFhR2sv+GSrjzRvGDjaFvydmWAxc
	 DZkWIQbUP+gAEYbSO8ElwyRGsmL+FYqosdySQYANO6A3QFZonCMzWnLATXpZttStnM5EG
	 IA0zF6PsKBf0g7UrRC6Dqr4VCt+pSTyk3wFvbwJQe0Wbcx6mI5D7l0lC4uJy7fHDi5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
	b=LBm/Q4QAIT5cc+U+5RV7bBLzb9PO65KzBzSieNHWpgxXvNlknmAOyJKojenEkCfHavvP
	 3aM3aBOWhXhr8EbfFSGhG8hiq1/ssdapaDS6b+NYYO9YBc5XoAs6yF1sH6JMzPOp29XE9
	 WnAcPe5svczI+k5fwnRujQhdvzjXob6PyCqyRZsyh/A7Wu+XVFUxDTE4k9meeBmsrRu4c
	 HdWRfqiWnaEP+V+yWTZ7fhtIq3YWhfZ1fRnBOjqvj/Brahe2bZMV0rnYINuezo9iVjBb1
	 /IDrFDYSYs8oRBEOiNSR3TUwrKJ+iRE3zjB2RJg9rIMZU1Mpr8h4UMt1bzHBjAkDfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vzIIU9he;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1D606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 15:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vzIIU9he
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so282064a12.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360091; x=1795964891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=vzIIU9heQTv89vS5jFbRCHsbqT/7bARyq8nah575IUhNXhCG3KzS3ylXxvTRDP2m4F
         4xRDxzapfc8aUG9L6ZUNylrl9miznoZ+OmON5CznFiiUI3JdjxG5zzJ8nZaDDSWJCdnw
         2Xd5p/fdiIRvML2cOL4gRoHexE1WXnykFdYhzSg03BNIPSAQShVbN+qJVbFH05r9HoRE
         XhhVsoSjDhBBudW3EgvGdNWLEilzS7fALZ45OwRcqBzBKxVFBHZsTjvKx9q+RpE+UXRU
         AeeQbb/JWUXeVxNk1yvybsmuy9s92Svm5LoB1PswRhtePfQtfd0wm6b5Lc084moT1/Bx
         qlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360091; x=1795964891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5taQCA3yvh5AYAVe1wnOgk1TFyHKnQu9Ei6LAyOPC8=;
        b=hd97xYOKsQNVShvNXagh+SIUYAZMEDsul+dwAmt14Q75eH+gHIHkG+Vw8odTPkKODA
         gzNDQCgvvVm2aZDshkMLp88hMt5UYsTRwiY3VYmZiuR4riZk76iAWH5m0tsf3csfglFD
         ZtR66YAu9vppSlqJe/x18BKtJ9Kk8IarPtUSEmwX/VkhUaAvFEk2VXuYHR5DSPWn1uDP
         FEeAiCL1smTsN+s6b/u5Us/1jGGcKxBfzkRr2SWpBSQvxyIBoC5sxsVUOE7pPkOrafx1
         RedoAsT0KK3rDkNTmF1dJgxDfPUKmMOS5LJ7cGzmk2+sLv90KhZAw6oBRb//Cpmem10l
         Jhig==
X-Forwarded-Encrypted: i=1; AL+hErGxUvu7DywC5wrSZUc9WI6TyViLGpvuOx3Yi3XoXkWvDiwKmKv713rAMV1XgdUhKZeAh6OzcG0ycUH4nIn4ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z93UVmC8+HuzoqMnk3U0xAoNHJrgEYt+6mSowHtj8Zp1/Ei5u8e
	tKjHsUGs9BPUEVb3+Ls2gIwzsFUBXwJGAnoetfpw04Q/+Fl920Ez9blhkLPxvuyrTA==
X-Gm-Gg: AZFdTZcc07iLPNxepF0qNJ6DiGb2tXZJwjj+tcaHrheulbVXEgABceoA5hw5DQ7j3Aw
	EJu6g/RBUmBQgozPuKfBD1eDRpXwz7SfgbSnqS2SQEwzIGG5oM6D68OBabBNvhOShfgOgk18KKR
	MVBqd8KZoC2NOO9cX7iG5uxJDUcHy/OEqPv5VH4mrKLvKn5AEe47dV9lYTb2V1B6k2dK8lwPyKr
	Q0Cc/M8PT1ZFDdmEEITnuPmzm8HZZin1TbUTVjKQZ0HWzinEwBy2RwutdVl4akq+Ps4RF0wcTHh
	dx2pjLIE9u/dXuBCmGEixC63+664hZIq+QcdGmy3EwSF82ooiT7JYCYSGBcKtn/zmBd2IwtfpTi
	8Qkxf4XOouvHT8T0VMikCNnrQ1PWfgBz++ekxh0TmnOa/UVABfbjUUcVh9Qi1vcmj4Gb8bOIj9H
	828EH2d3bY4YAUcT1cM2TGgA9okIleFXSlriuno8ba6KR0Ks9QhhDw4LRc7A7vXoYaHhs5sqYXG
	HVU1fdnw9VxflOf23+Se1OD9Xh2d83y/eYSojzpOdK9Q3AAgKO7EzmxL4UN5iw8WYrriPO1KnsR
	FuRRPzzibokHNTk61y7CdT46TM1xvsDTbpGwjvzSibEMeXSq1203Avi3SdVy2IszCWo6QDOMfOP
	ODwbBFLL2obgYvSU7GmCg9x7qV0GYf1rdIArHyKHndDI5wF0W08MtGk1l4pt8zgdtTox9B6+vdh
	7ARIDfbluQjAPzGU83U/Uw4iW3B+NitbfwW8b3DZ++iMoJv+oxj97m6SWfiLWaDaclU2VUUmKJg
	vP8RmDLEOkow0ULxwCeJL4jFID+yyKV6usNtAQUyMYwlmD/DkYawxY6knKifUP9zt9by70gbbp0
	/+VkXmpQq3dx
X-Received: by 2002:a17:906:1651:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c513aaada4cmr594204766b.23.1795360090707;
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:09 +0100
Message-ID: <20261122150811.3135445-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1: with the firmware down, a key whose removal failed stayed in
peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 6 of 6 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v3:
- Rebased onto ath-next 1983b40acfcb.
- Patch 1: return the ath11k_install_key() error for DISABLE_KEY instead
  of the PN replay result that overwrote it (Sashiko review of v2).

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v2: https://lore.kernel.org/linux-wireless/20261114225643.962015-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 31 +++++++++++++++++----------
 1 file changed, 20 insertions(+), 11 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0
