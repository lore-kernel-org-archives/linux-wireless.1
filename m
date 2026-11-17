Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875598;
	b=1x+B5MUT+HR2w9PoRUdE6tpDuNgMYknAZiM0Mc3wVWwSJPfBdOoQlQ8MPg/N5cR8BVjn
	 LT7SJ7S6Z1MJ7zYl3GdFe5y6GJiroW9vG3Rbj2Zanf5mb6v9b4UDxiCBmf4jy++r3mMhX
	 dUUW4q0fABjdrj0vrkmmOOLI9KanJLa9EvWf56Tv5jLuUfrdjkkiYQbk12Rqij2xCEoEN
	 kYkVbrnArok6wziC7pnOl72ik1lpzZamYunv3LsKgiSqmWwQDefdyUZsm9MVXyXDQ9a2p
	 9IKAmlBA5yAQ8a/s3OFv/V6ARVxRNrMyTLFC2kCXoIs0WXUdEaVFQdPuAMUC7zkFWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wk/6CeKFWBeNsJ8DA0yqF5F5wGTUdrFSo/NK3zWhvT0=;
	b=M2kLtkyuORJTKqH4VHndnoEn3dEywtu3/EIJHx/wA0eQdE0CphpHrFD91uQbmWL6CPA7
	 yf1Zost+ajsFsfJvyMC6hiAriB1kuJY6N9VG9n06jFxKcTEtiyPKwDcYFrKeHHesl++sJ
	 8QNJ0bw1lHHZoy3q6aJY60tnrZB9gLmMx/zUULn+A9EKCbqxI4CKniNt4A2ufbprHRiqr
	 AqwhtmhZ7Sf28GTNoEUHxg94zSpqxticITK71o+23KNcL1GwwdXvO2h/JFZcibbbF2ON7
	 tyFQw/4mxXOVBA8DrFNVGh1VYHyzUe7LbVSao4pdt81EyuQNHyweOgOXnGOIraywOeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fW+qUs2v;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A0606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fW+qUs2v
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b1535be329so3021200a91.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794875597; x=1795480397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wk/6CeKFWBeNsJ8DA0yqF5F5wGTUdrFSo/NK3zWhvT0=;
        b=fW+qUs2vgn4DZVySS6x/xWxBllqUKCg4MabtzPEse+63PB5p20sBpd02G8KEkCqCOQ
         8gt3xDmJYuuMQaw7J2qTNhZBgYqdjaurw3GauqZAq/1BJR9Fdy4QJfbWm8CrUK7hgi1X
         CwaglNtnBltfkSMQYior/sGNM6TCufJJ9K2eq0N3ZhA75f2p0/M726GdyHzP8vkKoN1/
         +mlziIy4d3OvjQZ9vrZ7xwvAxmAmL0H2clPFC8l1ulwJzkjNMyQZNqGms+Lq9gM0bny/
         Y+8U6s/6kJz58hiAhaHICg8j4iF/wZ1IZlU2c/rPJA93qwBaJKgcnc5QUArfoI/vkUa8
         km4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875597; x=1795480397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk/6CeKFWBeNsJ8DA0yqF5F5wGTUdrFSo/NK3zWhvT0=;
        b=Iluowo8SrR7I1IKJFhzwdf64+STNL6EHId8jxEP3MkNj025K+yt0NCbMqRmOJ/QSst
         xvbf380eSgQZ0jeu7aWNhcCYUcC81vEgBAty8Rz9M56214ApCU/y7Itb0WgkFenB83Xu
         Je03m4ZGmahCj603si1NXlTff237PwCJZoYOTrU0p7g6bSTaTPbUH6N3nGGXoDGr9RVm
         507q/YH6Gcz/+8W05I/KtXo03OAUWJfVofT6xClE7M52EDkiqj4rdBGwbh584ng9/trA
         wNo0Q5jU3SRiUJ+zrEwDIwONdohLX3pULtmOPb+AP4XHt2xFPIAEX4Fn3QiWsX5uKD3C
         RvmA==
X-Forwarded-Encrypted: i=1; AL+hErH8AHf+S9vAYpA+BLp7G0kS9d56hN0Uyy4Rc2GGi8S1ie9JHHs5ppziFnLduUrl+sNjpUxQLaxRMU+OLOJ9qQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ERMjGxc+Vffwkuhm9UK3OAJ74F+X1MY8WR3KZTixGkCqGvJB
	3iZ8aQdUwI1UNij8js3FBXaGEC6FE1XMBwUlWBk4fmWgHj1p4zJSY3/BzfehlEOa5WM=
X-Gm-Gg: AZFdTZcGF+ivbna00QSP6jY7LsySuJRN88EK4M4Uc69C8SbCJJxYIw97rdnCbfc8rX5
	mqb5Ij6H8KLx6E3y0OMpQ9IhrtEhrbcsGdZS1PObLZivSa7vwsJ2eG6ZCmIZU7fg/7xRGLOz6FO
	7dP6NYxjNQEtrKxDieETW7IT+NJ/JxFxD9AGgHU4vm894POf1KjVZRVqEd/WYnA+X1sYYZbAIaL
	u9xL9uWnLOIE46fdD//spGETwKhW+ISHcN/syf4YnlQbjn1k/SPtGTZFJBKAryUTeY8C5iqq8YK
	sgT31Dn0cv74s/MP9HTivM5FA3P2B+Q8H0DTIQtl3jNeO4Ry9hhugn4skENB5m71s1zCGO0OiG8
	7Fp+P+OoIU0OTzJ+6FgCFL/WaUjqZzXgTvESqZYhq2ytZBuPzb8xQnt3G3syriP7OGMmMbCOSYQ
	0prZOW3IY+/Noxjuqvpo8Zr2CoA1kJx8Jdx8y8ZiZPJRnYgitIIrEL80nWXjieMdpRIH4Uk+MJ+
	/GHFUC7rq9vLUdxB+OM+6Y/+V3NlmgljZcgBrkINSpz2pxZhVbclolFqGYFyH1VYMEh2eupnZf3
	7Ic7SIGnDyoUvJQWNS0CE75CKmlR9QP6CuF54ZWzbPU2eC+6YwqSX3ul0hI7HWggZei1N+bu8O+
	gxeXte8EJVe1g1g/Sn+FJMbD55TVMkONae7lX+wTt9vg8UXHM
X-Received: by 2002:a17:90b:1dc3:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b1b0a0e116mr11010308a91.36.1794875597402;
        Mon, 16 Nov 2026 16:33:17 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm1214868a91.15.2026.11.16.16.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:33:17 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: mm81x: support v57 firmware
Date: Tue, 17 Nov 2026 11:33:06 +1100
Message-ID: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
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

Hi,

Small set to support v57 firmware.

lachlan

Lachlan Hodges (4):
  wifi: mm81x: use guard(rcu)() over scoped_guard()
  wifi: mm81x: use the BCF size advertised by the firmware
  wifi: mm81x: support v57 firmware
  wifi: mm81x: drop probe requests received off channel

 .../wireless/morsemicro/mm81x/command_defs.h  | 38 +++++++++--
 drivers/net/wireless/morsemicro/mm81x/core.h  |  1 +
 drivers/net/wireless/morsemicro/mm81x/fw.c    | 27 +++++---
 drivers/net/wireless/morsemicro/mm81x/fw.h    |  3 +-
 drivers/net/wireless/morsemicro/mm81x/hw.c    |  2 +
 drivers/net/wireless/morsemicro/mm81x/mac.c   | 64 +++++++++++++++----
 drivers/net/wireless/morsemicro/mm81x/skbq.h  | 22 ++++++-
 7 files changed, 127 insertions(+), 30 deletions(-)

-- 
2.43.0

