Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773978;
	b=1S2jDPiTW4/qio2tOXiY0yac3UoMN09i+Jf9MHsRH5bbA8PgBC4FRkCF3ld8+XXoaMWc
	 ktopyrO4d5Uk844Wg/Z/By8EMfkZWplbUlU7FiFU3ZVZhODWkxQSVfilxua/P/6t2gKwY
	 WnJDRDSEImNg/c50m4aGOBUYPfALEarVL5TYr5vrYNcrVPW8G5gZDetagAUd28QyMpvPL
	 U/zFckwGGfw6Qta2oB6fx74FpysfVwzy6tWM216gQDr2wPWGgCa+Mfegcad/Absp2myvG
	 LSz2Cgi9zUS+8l9jO8QLO25qIM3rpeZ/rM+G4v54k7zSweAqBmfylQvzgKGLQHiNjAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
	b=xKGcTdT+0jWmfQ4aH3exxAdE8UaxNcVF7H+zQmLnMtyaR00KtOsijtsjeZAAAc4irPaa
	 qcnfctFVAkX6j6IpmH7rRuM3JdXDCgYkLKi1YC+D3Qsetii9JW7U3tvReUNtC07S3swj9
	 W3eCVM71jCp2wyWpc96xh1nnH+QC4TnxEZvqe1KHBYuosUP/cjmo/bmhsJKFXM2hWMwL5
	 5prC6cyd+BDrAcahdW9uUwUhUDj94EOvjm3ApcSFNoEajEDI5A1oCY/tDQSmPmjrrFOcu
	 yGS0tYYctULExoveso0EigNqA6Oe7LuS3UtxAWTYsi9kVtHNF3VOuY6OFlYRQXZJNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWbol+Ky;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2560A262A
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 20:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA2560A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWbol+Ky
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1053669a12.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794773977; x=1795378777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
        b=eWbol+KyOeJhtXM+Yv3onD5I8G5ULY/Xlc6o3FyzJboVY8HJfshY68v/KVGcW4tzMW
         kvY59Q7XhdCUBSdZkha3X6xdCgkgaG9prS9IWTb8yWY26DgyM8crSlIymRNGPnAdLUbr
         EJx4GZsp2jvwPv8SwLp1JHfv2RRc75Vny7SgviRSP/IHkq4Xnw482hTsdCJ95k3sPEbG
         rxq+0i3pmEXGMq+WQP+mN3Um2F1kocFtH6cPKOc0Ap1Ra4gcXbvhL7d4G6Fig5RD3ABu
         Sfukg8Q1BJu8e7NLfsys+RSEAP8uhQe33EcvhTpNuLZNmVq41nuT4rK+u6ibaEuWouB6
         Ae0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773977; x=1795378777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ttIPRSTmhdwRKjQoziE86dYbp7Iv15D27TyVE9rIns=;
        b=IfA0RzADuTH117KdlTBfMu4fxDXzX74GZtn/oYTgXJe1sJnEZvVuzX/c9znkJCGZw5
         KVKPfB5kYF/6vAgXmlzOPLe1l5yzxgNZdYyOOX+OJWAaTxDbdJFf5+PK40TfjD1MDjVN
         HD/ZSkOhQ3VYKuwWBYYsGH5FD7sZI7/vCfvTbfXjAb8Ub5VI8BDaEASER/um504FiKhW
         Aii1hLRMfNpFDSIKHI9AWBSA5pS+J8AejTHZLjYxd7uGbHm5EB4yRp6zo1FxN/QnmkIP
         +o65//iwXEUBQlFI4kg2uVxli9V1MZsoEDzuEEFiCh2WwFzD4ox1gg4Py+mxfx2RWm89
         O2HQ==
X-Gm-Message-State: APuU4Z9CdmtezGw1WGLNDsNPZX45koweKZxKE8O8dD3Kpai74Oog2I7Q
	MeB2DbO7h7bBz0Q6KVfXR3wYl5tiwhzu8D3g+t1IdBwNcA686Fdy1zkRCIzWm71D/8Y=
X-Gm-Gg: AYBFou0TJvqJlxu1+c1NmJM0sMYlXO+tcb2ZgZ4XmhM9uZPQIOaywjwT+6Rg/t5ydrF
	uTeRDcrQUXjtqVZOypQ8liWQkx/7VO4D/XIAbHBRKG8fJTymZWjEPMr3OeZAzMNiCF1ndo7OgxN
	HHgWNCqFgse+N8IPE0OsKqzrLgCps049ZwvN/fBolOd8zBws7WHlbhZrtrXO2pRdcQQZm1hNRDy
	GC/FFRA/uKa8wYFkMsFBUmeDmIukggiUW4p09bu40oOdv34gWIaWwAsU438HoZJzlZxw+a994ML
	pWJv2H6+CLuNsIDtd9fQAgtBf112UzL56WiBQDdS3AOJeTHGj603wQrLCkEBHGs/PnxCSt/E3iM
	seXSVQRd+mv+7njJtr59Ih3RFiZmCOXZuTrUli2tjqej1cbxiksFZSMDzJPiddIx1Xi/Z65Mkwd
	vmHPoBTrsUTxcs/97hmKr3zInkwC6YUOLzSSXAgc9aoWOKaDY2XLbZoI9wbLiq2R/cTBXNkZdMl
	V41HDgA7zq32HWFWYUMec2NMU+6BmGifdzF0OngqKmllOTwjTwNl52pFkrP5fGx9PdHtYCauKf5
	47kAw+S0xTBFZXhW2rdvverSRcJMoltCZ1yciGW0HXUYw4gnMj4BA8R3PRz40pjd73cdUGOdpsv
	i8K97JvQhv3SwK3N57X9x++J6JA52uA==
X-Received: by 2002:a17:90b:530b:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b1b0b63d0emr8985522a91.55.1794773976905;
        Sun, 15 Nov 2026 12:19:36 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:c:7f10:a86c:c753:9418])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm13382005a91.6.2026.11.15.12.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:19:35 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v3 0/2] wifi: rtw88: 8822c: fix cck_pd_set when the chip stops responding
Date: Mon, 16 Nov 2026 02:18:24 +0600
Message-ID: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() indexes its tables with two values read from
the chip, bw and nrx. When the chip stops responding, both can be
invalid; on PCIe, register reads then return all ones, so both are 3.

Patch 1 takes bw from rtwdev->hal.current_band_width instead, as Luka
Gejak suggested, which fixes the out-of-bounds access. Patch 2 makes the
function ignore nrx values without CCK PD registers, which Luka found
while reviewing v1.

The two belong together. With patch 1 alone, bw is always valid, so on
PCIe a chip that stops responding gets past the WARN_ON() in
rtw8822c_phy_cck_pd_set_reg() and reaches the zero-mask register access
that patch 2 prevents. Patch 2 indexes rtw8822c_cck_pd_reg[] with bw, so
it needs patch 1 first. Both are marked for stable.

v3:
- Patch 1: take bw from hal instead of reading it from the chip, and
  drop the check (Luka)
- Patch 1: replace the forced-bw test, which no longer applies, with
  real chip failures (Luka); add a check of hal against the register
- Patch 2: update the message and notes for the change in patch 1
  (Luka)
- Patch 2: add Cc: stable, since with patch 1 a chip that stops
  responding on PCIe reaches the zero-mask access
- Patch 2: add Luka's Reviewed-by; the code is unchanged
- Keep the order, and say here that the two belong together (Luka)

v2: https://lore.kernel.org/all/20261108182837.682661-1-zeshanahmednobin@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/

AI assistance: I asked an AI coding assistant to help find out why the
RTL8822CE in my laptop keeps failing. It analyzed the kernel logs and
found the bw bug (Luka found the nrx one and suggested the approach in
patch 1), wrote the code, the debug-only changes used for testing, and
the messages. I reviewed everything and ran the tests described in each
patch before sending.

Zeshan Ahmed Nobin (2):
  wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
  wifi: rtw88: 8822c: ignore nrx values without CCK PD registers

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.43.0

