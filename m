Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122352;
	b=zaM8mX0N8i6jzgM7YknsW+5tkqa6wydLojG5D5p/Sm9y9bPh1qhbp2okS3U22iMlExfI
	 e7r1977+MVCmyczod6s6/Qiu1Wal0Sy39a8ngK+aoR8vBIMe2ccmjDgj4vwqR9j0rWIZ/
	 NMn02SpxcKHHx2G0zytSEA97kPGYWPCoE6tzirabv1QAR77ojAyd+M2+Q0wP+S5odg24M
	 E/gnx08sGhKWOJ7HrW7Jtve5NOrREpYY1IoY/uxE1viNtTD2RGMXaR+koisbiipGNj/7B
	 JKaUytQT1fSIIQ82Gkl6w0PqALhP8qz2Tfn0RiLubQFQpWAgoU6RGgsztNCc2QzTOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
	b=y97+1yToLcl/SZnPVvocLOpVCOHENHwqmKvue2aopn8n3/nTtcfJqF/I0Hd/Fac+r16K
	 G78ojWwYs8QRJqBfoeMdQSoYoU7lchEJOwnxiI+jUYyQ4elzbzC4CvjpGfUYmuO/mEL4d
	 EQFBqApV8/Em1Mh6LxC3hbaWC79icQtr1PAKTArmTIobsGgpaItlPRyndj46DTg/YI+vG
	 sVg7gnZIZNpJzetBYqZl9HQnybXzh1n349Ec+QNiKqEw8D8NURfo7prp/Jw1qdZ/AiO9H
	 RjDcqfxz7+1nibo3EGlTebEOv43ccfguW5Y531gymfbxZ2oOszCRkiVXA7yUtuEaepg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnpJ0AOE;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39510606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 07:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39510606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnpJ0AOE
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b1ce85287aso74674c88.0
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122350; x=1794727150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=WnpJ0AOE7lggVyl003czQ+c3YZmY9hxvUVX86ifJtceYUnI9JhaSRdcbwbM9nwufjN
         hk5QKRNWpK8UVS6DChnBBFovDnMAZaQhnbZLy2nWqmD1mCAxIdFOa1K14vo7GSR4qyK3
         ++26acAeKq9lLCqsUCCA7/TKc5rI9aDPRQtJpFRlhcFPNFd5GMQMthNpJ/HU2mxnstvR
         mSMoyOyRQRImQdOjV+MnPz5GN2E2JPvTYfeQEvg+pobx9ElJl8ijiRHXIQINDVgk+8Yg
         P/2XHHQCCxHkIwqmdEw/KuWQhR0rju641gt3JAs6e2jq5GUCXvq7ToQ3SsoTqC3xd0ee
         FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122350; x=1794727150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=Jdyl64kdhOYVlYLbnaYWIS3qNQsIekURJfU4irSLMn/bFGN7BIQK7VicL0MdT2LGIp
         IUF2VITEcmHDLR6qkHFeYf2vTlNgOPxfwadCAuZAAyPZ6ay4xJas48voacFMATAr4Qo/
         A8eQITWXSzPBlyuLvcB1w75ZHWE0Ydk2p5QRlO+lIh67UO95UzTSWNJqf3EkbucwGReW
         VGljG9O2RpJgStODCrEUrGj0kmfB3nxbs0g8cQ51sF2+9SKVfnP90T1lgZMlFo+ZfR2y
         XFDnUHTYWz1NWXlid4yCrx1HxWn1v3uD4fC9BXsZoNROAwJLIPMomdnnLGlMqMWGGYjK
         XkvA==
X-Gm-Message-State: APuU4Z+6c3bJyx1csY03Jq2/QXB84PWcytjEwUkNNc5IdTq6Lz3LdZu/
	EXCAiMPKmJKFIwU74+/OzUnmTBflssOkDPZw/g85mityr4rxSJ0rN0c5QUk6DH9R01A=
X-Gm-Gg: AYBFou3e6s9SRQyTr3zeXUyBY/ZZG7MCEkkSozVsQ6bOcKKbvRVP2l2ymnzPUCZlafP
	e8ox6J8I1zzTTTkUuNlmMdVoFXJtd9us9+KaJVLZ1xYBZ5Qkw9UNIXkLJcaVHcMhZHPmQQ894U1
	wgeltVVX2AEypQy2c36lUZnlxXfxP0Fhzg/B4B3iT/z2gbqLc9FsK9IgRcGyK23ihkTJtBOTuiL
	PcO9Jywe0VuQt2jWmMX+DNB672JxzfZGPFPSY73oiWW3jdgimoEUcaE0g8ktbrjVRVLYpseCHlm
	+Z0o3ZJudS5IzY61XXoRxCSBhmKlfTahQlHo9E5xObsVe1KkQ3EVnRCIwtkVxD4UF9024mNmZEV
	nXr/cKJ8UHmj7NtPPXMzCRFnEpD0qqiAyy3GFc7lp3WpCm4wWOpyZpqK1ojppSwaFOegZAcs6v9
	EhKKR6Qdxw28rBKs9frY8JqenaGkxF/r/cXzHLe3+AWdwe2c0JlPFUgEz2aZKu4lO+k8J27EY93
	+LWsmhwZni7RWCUr0R94BnEwetU4LpdneqWjf9z6NYU6xsyCBFGwK91WaQB6UGyc+FyQdM3y5jU
	m+EgLPEpESkoJmtya3SJUhBwnURTvs2C5BSjpJrrKsYqsw==
X-Received: by 2002:a05:7022:294:20b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b39fe92ebbmr1311793c88.11.1794122349973;
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 0/4] wifi: mt7601u: add AP and Wi-Fi Direct support
Date: Sun,  8 Nov 2026 12:47:42 +0530
Message-ID: <20261108071820.35303-1-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
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

v2: Split the single large commit into a 4-patch series as requested.

This series enables Access Point (AP) and Wi-Fi Direct (P2P_GO/P2P_CLIENT)
interface modes on the MT7601U device, allowing concurrent Station and AP
operation. 

The changes are split into the following patches:

- Patch 1 fixes a potential out-of-bounds access in the rate index and
  safely falls back to CCK rates.
- Patch 2 registers the AP, P2P, and ADHOC modes, defines the interface 
  combinations, and sets NEEDS_UNIQUE_STA_ADDR.
- Patch 3 implements start_ap()/stop_ap() and adds beacon frame handling
  along with appropriate SYNC modes.
- Patch 4 optimizes queue management by routing management and injected
  frames to the Voice (VO) queue to bypass firmware suspension.

All implemented modes were verified to be working. Tested AP mode and
simultaneous STA+AP with iperf3 to verify stability.

Sorry for the delay in getting back to this, and thanks for the review.
Here is the split series as requested.

John Robin (4):
  wifi: mt7601u: fix out-of-bounds access in rate index
  wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
  wifi: mt7601u: add AP operations and beacon handling
  wifi: mt7601u: optimize management frame routing and queues

 drivers/net/wireless/mediatek/mt7601u/init.c  | 31 ++++++-
 drivers/net/wireless/mediatek/mt7601u/mac.c   | 91 +++++++++++++++----
 drivers/net/wireless/mediatek/mt7601u/mac.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  | 56 +++++++++++-
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/tx.c    | 19 +++-
 6 files changed, 175 insertions(+), 28 deletions(-)

-- 
2.56.0

