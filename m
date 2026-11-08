Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127922;
	b=bvnT290/PXsBhqc6BrOWJuGQPCbdger9OjMjAN1TGY3/7Gy34BGHfHrlCeHQJ0+VMKjU
	 dv1GmJit1JLBG+HTd03tdBKOYlFNaMKy2Vgrk42hX2Yz0ldN6rpg6WlwiD7Ka5TpHCJxV
	 r1wPyF85fd/32XEMPth++5V5N9HTNghwGVcdXklu0Ub89FLsd++0ZEDuzhkNICjTfGakR
	 lmoST+6anSFSoMyloB4gApA+mfMDv5ue3SaL3jQECDSryBUmcpMZhrmgne5f0Da9EVYbd
	 eWr5fZS+ZqRbhE5c+UWIoxxuwlVpI3GNqAvHWJ983zJ+JMRWWRnJMrfVxlVFq4FjmOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
	b=YWvuBn3kF2we4sQHv0x7ypnZzVs9djkSxq5lVDcH4eDgJoaWJXN8YxFYeU4+WRot/U/N
	 yXPh8RRC+M4r4rr85P5oDnoWvhyLMZ8wqvCgYgec7kDL3YrEzvs4bbVLM3GRIrpfjN3wi
	 g3xqy9dVxWeDb/Dd91q2TufV0NZuF7LyJqCsYCH6lvHigM9zAVDDnSsdbF9TkLIFOOQlB
	 u55Xt+JfCUFBC/nWZLAgp9E0vab6JWxKrh6C+HkuJ6A4INrozQO94fx+6/UA+gWlI9A8o
	 198DwP4H+WIfoYx5vqnt2LbXu0KDXftJVawDyibTIP3viT5MKoRvLNDv0YccWqejZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emdfmfm0;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA0606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 08:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BA0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emdfmfm0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1186021eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127921; x=1794732721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
        b=emdfmfm0BXFpEfI7kQP2mi3IKOR2QKDvNBrcv2h5RG/pppTyAu3Tb090VyPxFoHktC
         Jf7P6j7UmdoJyL8WvZ1EwwIjUIZKIr9Z9jjHCbo3E5ewN7I5dqpCKHbDY2wE3hbX8ENe
         cfeauQ71hwiYz5HobcaJdhM/ue5yyZVwaqIeK/Ul9cLUuH6lueQ+Ob7tca4POPQS/o6E
         HR3tfWdMZ1gEtGzjD6khxj5xao1x29hFz0lJW3j0etdwuVCrpVOSEGizlMjl4xosUTBd
         zy1+QR3obhfMvgq5oXaGrSFkr41luhJiKZuBp2Ppho0Q3PQJ/Yte/Kw/EhoxUN5hM0oZ
         fClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127921; x=1794732721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
        b=JFUNK9L0bptrHddcrgptya+Z+TLfFRfoJln1HdQHHgZkplDaZnDThr9JNcyK3dZw/g
         KdyaUyQ8NORLJ9pjQbM02tNE4N3eiQaIGaoZQWQD0TLKDuxRPcB9BsBGpzkOMRI3Wf3K
         k+HbkvXfQ0rtRO9w1Pr00XVjFagBmXNueyzlHQISWpGMgS/L/tmkLAP9dt4a1V4t1vJT
         EAmxzEEcWg2tvYU/Lom2kbUwgUJbACP7GZBXpPS7zX1POSyD1zguqyVQj7qQsEfPpeug
         JsOVMt4IO0Twj1P5Pz84iAaGpjMncdKMvif9Nu+hk6qRUkIpE5MRp6ta4ohMANVihwwM
         Nf4A==
X-Forwarded-Encrypted: i=1; AL+hErEhEiuSBfGfKl4Wmmy/4LX3cu1h0pf0pq34ajMrnciSPDPnY4TVppf3zbb9yzKem3hTwxUnRVY52hykqcKGmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uuxkCQnpI/rjG6eH2fwpmnZNYmOAPi4OwcGkmpWVK3RdBi0YM
	Uc0Bgl3k3LQ20YkAWUuGLw/30ePLoihyj58tw16iSDIac1OlKq1FjnZR
X-Gm-Gg: AYBFou0N+AxMM97b4oxN5EKTV4Jpg49sJpX/ZdNnbMzHBny+rOaSLPO0xQyXYcNfxeu
	C301UbADT8vwlREc8Woa4g2sQCW8VCZALzjrzEFZgf1QGcD6cEF6FvQfyuxJD2L5n/VXd1cQEYW
	TRkBUvGPbvxkPuC0YoLnSGgKg5mEfGrjo2yXQe/gU7VxgetuXSwahuQ8Oh3RtDOFB4E1WkAPZrK
	GKsxx0kTrXIcDYJN99Y81li5aohT9xl90oj2paZWsJ0yXnbpWtjs+xigg6MSi56wdeSxF7dpfRu
	HZAiOQWMhsJnSEgAf6EbXJuHSyEerUpHbATpvndrsBXwjfKmAhwjxgHJTvDx7q+xKXU3VESsiti
	wM/mjm9xWCZor6FjBo0oDwW6WZ0pJJ2ddbI9PnCg/A9msLUxHh/+iZspr9uxhsu2xYRPQ+dYVlM
	/IUSZeLH8TGeWh2ZyqpnsvgBi5iSJOYdt/COJRSyrY7JqUVQ7d8Pc81RQFwtBtuftwS4EK9D90e
	Ji/j8dm6BWhouWZXgZoDNu1BkXGed2Us2OCkmgShbLyJw+ptZdRS9oC2JYSei+U42DA5uMG3uQP
	gcZfkqzaoYT6T3/Oadr06eCE6tjdfhf+dEOAmPo=
X-Received: by 2002:a05:7301:9f18:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3725641e19bmr3441153eec.29.1794127921303;
        Sun, 08 Nov 2026 00:52:01 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:00 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang handling
Date: Sun,  8 Nov 2026 14:21:23 +0530
Message-ID: <20261108085126.331784-1-skalpesh942@gmail.com>
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

This series addresses firmware recovery issues in rtw88.

Patch 1/2 from the v2 series (DMI quirk for HP Laptop 15s-fr5xxx) was
already applied to rtw-next. In this v3 series, patch 2/2 is replaced
and an additional fix is included based on feedback from Luka Gejak:

1. Patch 1/2 clears RTW_FLAG_RESTARTING in rtw_ops_stop() to fix a
   pre-existing bug where recovery remains permanently disabled if the
   interface is stopped or suspended before drv_reconfig_complete() is
   called.

2. Patch 2/2 replaces the previous LPS leave recovery change: instead
   of immediately triggering hardware restart on a single timeout (which
   causes spurious resets on noisy links or beacon loss), it introduces
   a consecutive hang counter (RTW_PS_HANG_MAX_CNT = 3) matching rtw89.
   The counter is reset on success and in rtw_core_start().

Changes in v3:
- Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
- Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  with Fixes tag.
- In patch 2/2:
  - Count consecutive failures before triggering recovery
    (RTW_PS_HANG_MAX_CNT = 3).
  - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
  - Suppress raw register dump on transient failures to avoid log spam.

Kalpesh Solanki (2):
  wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS
    leave failures

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 drivers/net/wireless/realtek/rtw88/main.c     | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c       | 9 ++++++++-
 drivers/net/wireless/realtek/rtw88/ps.h       | 1 +
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0
