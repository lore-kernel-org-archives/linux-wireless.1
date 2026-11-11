Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384386;
	b=ntOjkrBb+rDECOxpWxV5lySuJNpBaX+bRwX4p55n1ghHBofwAb/q6X3X5IAEo1XwaSzv
	 K6PJ2OFeimiMQTYBM8KokAStFdi2mZnvjDS+xDSQPdoCnm0A032g5eXhNEFZEkp9aMJ40
	 r30Z6AheNx7IBqlQFg9drQfKZ1VPxSwQJmnhBLcGT0HQQtrwlNhUS4Brcoo3Msw+jkLJt
	 s5AA/lFowJ5zd2fXmqijdJdIMx5s65PuVbTviI7ICiC0aljh1SZGQB6hBHFFrIT0CZLi+
	 PrFE1o8TjEnIsBrDXyhlai5a5WVz4YbyG9lLXTS+K87G54iNI9bjm40jP76uMuaNmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
	b=gI5d+6zsejNttLY5DCE5TdgBTCL2QXPvBsvgnUbkrt1O8BNMDKaULtnHKuQqnEcHzsgd
	 4CT2ERQLLhIoBiALJqpgMCkYPyyYscC2reIZHy2GYXNnRUu0m+F4FNaznUv67VIyfvfJ0
	 fNzi15EOmqz4GcYS/oFkZpsUYWjms3EjDszMl5D+RzHKMIoB5sUXv73Wl6LG7rKmJFUK/
	 5LCOG/3DVwW4CBeUSWyWQof8bHUN/HMOez3LgfHkMj9bNNQD1yvtsEUaC/T5A3/T8wUpV
	 pMJcqnaunUKAiR9Zjcn2C7uRhR8REsKJ0crxNysNrXXweLuR5j9NZkZWC0MKz2Bpxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=NUC4A9mh;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D37606A336
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D37606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=NUC4A9mh
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so4285332a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384384; x=1794989184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=NUC4A9mhEV5EFNtVJmUMjR1IWO1JU9ubPwuA7ZaHgg9V8BBJYZ10BrhMQFF/eQKIde
         QFMcuXy8k7+NiZf5hhmLvCi1VyMGuVGAZBSFEKQCpWI7VYwfCr/81C+3dF415EFErq3+
         BMPANWUEm4QHlrsI/bVM8HwVt4BSSTO2mcpKJuIYdFyg3LF709mbdEwrhfquYoA48tOU
         4AMBnOIrL4LgkcQkNPENrneWO+xYmhp//e0mhf986HqEvwqGetyM1IiW7dl66Q/VueJo
         Ix0Cs8wAYkYbonjqXUtuFB6DWp5NDb0GxuXrZdXYp8aLtCtweicVn1sUHTZTmL1wk0/p
         qY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384384; x=1794989184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=Hd6WL2i8PZKmb/swhPHlxoDxyvCFg0eo2ofDZjX4d9sM6L6qafsMU3L/3fAbQ+uder
         ORdo2aDM/aQymjaXfwgFklCs+vp2t1niH3BQlLAn9Ln7w0THyHJ/CiJjUUTGvBq+Fi6e
         AsN7cGadJjPO16D61o25alnoGxfMBz132su9QOESYwN9w5/ZjRo0VF/IR7woCKzL8v2z
         K0IyWqI7GCesmzPWVQBiQmammC0IDaCZyLxfAYuu6gkjmesIAjtX7rWIbpNQhkeHpb2W
         tVnozyOS8f2UKmucp3yW5jzs+y6YnuQ6OZstScQYnJSdmUu0Vl/7HVjplnd6jIoV6bqn
         QCmg==
X-Forwarded-Encrypted: i=1; AL+hErGWlu3PRiUcVxAcnyndlWGjJwYELlFrDCoAUbYuoevNRXNelL8llcNDzTYW0CgQ85qwkScUaC5aSw9YUdFY+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MlNI6AUB4wEGC2kFOLY4fK2Mxy5EfNLU/WRIfw9VQrK2l2Iyh
	ED+jxxf3sUnRkh1Zs+pCRKuhN8ZWOtyjyJykUhPibIAZRCDljXAJxeCvZuNJmDvaOQ==
X-Gm-Gg: AYBFou0Gf42G5Khw96zNN+OM/UJ1FX/BjTE5dQUlORGZbO0oVUWoshZvEEYuSHsgLR2
	+zE0gsNZSjJ6Gwvqa88drApLCHHJQXQ2vz8HbPjEWsVvXIMtkVOY/CB3IsVa1BN9SdsHiVW1WrO
	OaTB7wXrkDCIleIkXBZeO5k2vvibVSGPpKas4vtfzMQrFmO7LqFxE4P3Z8n6t/r/JEA/lV5YStz
	HgpEJF5opO1ixrK1AXlR/nLqGYr0lKcJyx8zS1CR7xYYjyj8AAo7LqyibTiQ4/SQlGp7nUHRGsu
	yLa67ZCxyjUuUYuSlyHm145iplnuW38accas+ntzihAxRPwXzWH+7XvQuyfqHT94iWR074+f2/Q
	pkqC5rT0NpIuwXF2f96czrPxjzV397Hxn7ucjmkd+iGsx8pqCL8zLqEqMVhhnt+T6Iobit7ITVR
	8KDU8L+seL7o9DaBFWZq4SzQ9t14fyDydn4xpfdOZs79o5GcTg1g4UTQHhWoD3/kogmD49i3HPU
	wXpF2TH1/6GPRU+TUXPEcJg+MFMdzB4l8HQbdZ5HVlaax07ZcFCCPm6L/4iSPXS2V3qRq/dfjfF
	sgEZVfl9K2IeqCfP9JSsPp0bXg7MGViBpjKiivhAF+/XflFgzZwRTbFHTp+AH+GZM5sCDO+HRc7
	BVFLXOSRztcR7BFycIuXcb37SWXVD8KFePKNwOmnPkBHgBJPgeskVD5VEFN8EBxb7F2eIQJTA+2
	1XJp/S3voMaQZ0wNP2cFmhmb/LEenV5KCb5z8XTAGDhUeyjsUzOm5d8Y0yXXLZi0caSrbwjzN7G
	l8DKjroSWDYn9WfJBBKMuHtXUglTNHRbbdhPGL9YwRVbAlqlD0VxKpYTOpeNViSLm9uu+2fKEYm
	/OhIyVFMf5D9uCPoDjA=
X-Received: by 2002:a05:6402:2346:b0:6b7:8b36:93f3 with SMTP id 4fb4d7f45d1cf-6b78b3697e0mr354778a12.23.1794384384000;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:18 +0100
Message-ID: <20261111080620.244164-1-julius@bairaktaris.de>
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

ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
the driver. Both compute the length of the MIC-protected data in a
size_t without checking that the frame is long enough, so a peer that
holds the TKIP key and sends two fragments with fewer than 16 payload
bytes between them wraps the length, and michael_mic() reads on from the
skb data until it faults. Each patch drops such a frame before the
subtraction, as mac80211 does in its own MIC check.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath12k: drop TKIP frames too short for the Michael MIC
  wifi: ath11k: drop TKIP frames too short for the Michael MIC

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.53.0

