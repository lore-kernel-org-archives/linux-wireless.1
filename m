Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108159;
	b=CpvJEjQEr/ARtUbypZw2is/wRpPUkmQZf/6If7ebCWZyexxHKkaEKFcTcrA2Hmd8xZak
	 ZiszdQH/BV5rShsUXYE2dJYN57Imh3OXMFs+PQS/YbnnWzDHO2bPvnrGPX0SgdCq4jGyh
	 hcEI9du0NxCy3Z5j8gVPozwOFa69nrqGvrwx6+Y4XmPLZGPEy5AltN7leITmx0S2Vo1tC
	 ZAQNp5I3NKevbAjd1x1QUHpLSrYv6X8BkyAcpELcnMq4UtdDqy0JSz2F+kMegizpUpFdK
	 ULglavxYC6dA0iedjMnB1xWFWoeQCpT7sZokY9nvxdKhbEu/1G6FaAep2L2trm/Rg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
	b=bzkQhDUJjoQPFpoo5jMoyMfABV5m0b0Gh0ftJZQYCFtvjWji45h8ck96eolsDd3kCpep
	 exlz7B23YPjv180WxTBiKD+MORxQMwiPaZUHPwwZUelGEiIpFMPbBkBbjDhCsldhmjajr
	 YYzz4FVJTpxg5d4QtY8gksqry0ODwRFqWKf//9hkcsMo0C89d+h6bLzdjeGJwn/STcOhq
	 FhbQPIvyKrSFXVw5QMaPbWYXtXonyv4QaYhccA2cUXuncV7zHM5CrYWNEJCwD3jz+GEAU
	 U4E5boVV+33lLHy8MAeOWY57qu3L73K/fqpggUD2EOcyNF+n+lhwJD4k0YC7DScxmzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IKQzNMeT;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D05606A337
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D05606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IKQzNMeT
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso37095b6e.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108157; x=1795712957; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=IKQzNMeT6Ak0BL4jb88pzyRKvZPt4detlG21tIIvxMTeBEEorg9Ei69gJFzmeP5E+x
         rSaHsPhAU4qiV7tMtF0Ule7KuLv65cTBB7oXqmxR+SoWTVJ2C5hxc4B0k7KQW3/vS/z+
         qYHqmWXsX7VrJklf6Hs+nJc2Dzz9Zz1Br0jkCrgHbKRjjSuqBxKwtmvPvXYRfj1gGtHC
         3A06Eb5RYizI2MxDqzyZs1V9gHfAzR4z2pTq+IEAViy+zzk0D0mh+M/pApZDIYvQanoI
         QnA3N7FtE9ZwJrgiltuzLDrzEuoiawejaTYHP55jxHtamX/tycqFakpd72KYLkyxVciu
         8yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108157; x=1795712957;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reI4hG36wSTlZBZHqaQMIOTRXTTK6qV6ma9NRye/4cg=;
        b=j3gDkZRb5PhRspqxZ5CE9q9nXkjkXXa0KjydSWfMmTu0G7VzaPEIYhskrv83Texeyf
         IenRbVusht1rxx4VS8Xg000YshpXXNabvfXHmMBQPLZm68gS8dcfiiZIP9zh281JAM+p
         27kirUjq8MI1WLWWBwF6xRV4S/IsbyyWoaPZCjK6WLENcuK4U9l7AHVWTd0UV8u2fuJ/
         BCiERIJTyql4UaStiTbXKcs0NTkXTDTwmqSzife0JHTqHdTC1iHe2obXyXz5DohgGnX3
         3W2Gbitdu4QNSEZEwnS00w1ivYTwp9muVOHH3YlPnQm2mAJsJ7MKbJKQe7IC0fH0oD1E
         JrYA==
X-Gm-Message-State: APuU4Z9G5dyABhQVKLwTpGxFfceGReFyGhZqaQut4AkBErIxIKQf3LYC
	NY8SpeBrMp2eu4XelAndv/duQjJv+8N+ZJbowKYebkd9jyL9dy4A9+VANLfnmF0D7wpIA0h+/K7
	d3g0zQGVGJw==
X-Received: from ioi25-n2.prod.google.com ([2002:a05:6602:c659:20b0:9e0:f209:1acb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:14c3:b0:4fa:8d48:3a5a
 with SMTP id 5614622812f47-57a0b44ccfemr598788b6e.38.1795108157215; Thu, 19
 Nov 2026 09:09:17 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:09 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106967.git.irogers@google.com>
Subject: [PATCH 0/2] wifi: mac80211: Two return-value fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two return-value fixes in mac80211 found while auditing Clang
warnings (-Wconditional-uninitialized and -Wimplicit-int-enum-cast)
on an x86_64 allyesconfig build:

1. Return 0 instead of uninitialized res at the end of
   ieee80211_reconfig_nan_offload_de().
2. Return NEG_TTLM_RES_REJECT instead of -EIO in
   drv_can_activate_links() when sdata is not in driver.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
wireless hardware.

Ian Rogers (2):
  wifi: mac80211: Return 0 from ieee80211_reconfig_nan_offload_de()
  wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is not in driver

 net/mac80211/driver-ops.h | 2 +-
 net/mac80211/util.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

