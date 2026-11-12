Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506204;
	b=4Bad3QsGqRo674qglIWmuxw6WLebgiTKSymOzNcFJHE3P57G99RHg14AQTCQe/xDUuO8
	 WbmNg7dfqT4ZeQLkKlubVYG8W6ZnXpQtpEjKxg4ZX9xQdT/jRCXWIVsLJt+TtKiCS3WoD
	 +OVz6xP5Gtth+Q5h1shdf3Y/9xpN8yD3uoA4U5D1ZFRC3QHDwP0qBNUNC5pD7/OLBRRJ9
	 AAJiHQ+0HeA425oLQhN6D54uvYFlbgkEuBECnx8VwTkz2y5FepP/hf3WFbKQGrm6ylt+p
	 f7/Fhi853mfR85AAaBUjtmwZY8GdEEpBcxItswqZb9A6sODzwUOIbFKhSPvm/wnY+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
	b=o419Q9n/OXd96UN2jI3IV9OARzgTbV+HdAvBP0aJjCkcRawfHJm05T9Pb9aKHz/4ocRe
	 TkpfoDYrg+qhXaweAzO031SbP9GlYS7cCrkXD+mUlhS2aYOhj1FCTOZe/+M5omTSQgjDB
	 80pT6Vy/i+CBBcnFHRfZ18q0F5y9loTy1D848erhjV/KWAZ8aVGSDD8qiaaX+YSZ60oIn
	 K+u4bVgw5NOxLN53GLgcTtPW8gyUD5/bbSY41dj0vnq0vPvohI+EkhLQiVWMHfjYQCpje
	 LPtLXYDFQU1kiZ2zU7wAo9li0MwPag0uV9zlGDigBzGSUY7HOWeSl6IC16f1Pwi3J1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a14/Dc2h";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ADD606A336
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8ADD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a14/Dc2h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so808555e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506202; x=1795111002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
        b=a14/Dc2hfC1bApYStSPz5W5SUWFLM3BnRqcON57tdgIVbFXNV8Egppq9Z/WN1xl6JG
         JoSoDm6Op1j4WqqoVOM4z1L5BpwqGB+hBz5nibr99WJZhk2v0jJ2QwAi7KSmvw8vVT6R
         M5K8uYvyefXk7EqSHMuiEIAa/e+HOZOp1xp+3De4XnnGStTTFFAXRjCY6sI7kK27LUJD
         IM8c6qNnMc4hyWG/3Oxxsgqb8A4D0PbXEkCm7o3nVvpbroh1f+WMQmc8Z8NEioBUUQgj
         DC8vGPn3BHwdG9TfQzsWg7M6M0GC+yWZ+HWOsZWaWTA052N7VRvqNiPhlAtYH66Xrt4K
         c9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506202; x=1795111002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UodyIOSej7Q9D1lUergWPqI8N9mlc/GZezBApzHmwIc=;
        b=H1fYUsY27r/pYzAltFbQ82xT4GhgG39FIttHs/m/1KMQCuKHvEVpAVPEZYfcpkfGA3
         p1BxD3XLLIyQ+vKtdSeaDberaafquzAS8Xh8mUOyWQ8yHnAn4jlPU0OO2gBehnWWD3VO
         c1/L9JnQ6UUTsipUvzXMwY7R8wyOQx/AsFMWeLah5a7h4F6NcbW9SDMOvAEQ8sWzXklG
         JJ6B4HY+YiWzh6UO10eZVNZ22V2RpRPIXtlIoUUyKsFVAIlOW2U4yA6oapXbILFH2OOz
         Xd9YgfkzOWenoo5CBKKAyIsVwctHIHpWFDaXJi2N3uk2TPMlY1GSfN6JV5OmO+sllYwu
         IEUw==
X-Gm-Message-State: APuU4Z9e/+N3NWXNwVuyZ6u2Sm0LM++povu/E0Ea/Fbjfel3LnObDrKx
	CMAA4U/QfQyTSIKH3BwKaL3JjRMF1d0M4hkbBhIngk9ZK9bjyhBVYZIt/3maFxl7vA4=
X-Gm-Gg: AYBFou1gu2zoyXs1jtksd84SPExWTq1BH2vpUZUgmYbmGFEHJWbEVn1S2zbTj5IzJ7C
	nDipdh1MAJatDha+330isXKvo18Fao6gIPn+XpROhGjUuZ6LbQNch2lvAzlX9mRk9BdH2Q8GEWu
	SGcVA8XIJNadiT0BXAF6SlyDljWTryuZsKwOGMPnFRkBRApikwTIzcdkY7MPCiheruu6cCHx6qt
	XDYBLd4q4a07Ep1jkgnEspT7qg5IaSJQSLAICyeF3Fy720p0K4ddFLriuFN8FCzNT3KJbELGDKH
	luZpFiTE5gytDe3eIIj67XKdxO4tzHOdyk9yhdXV6mTCV/MIFDIPCfaoJ2FU+Mt+yK+uAj/8VdS
	RNwGkwBtqKQpcuSdy7lbny3BseKUHB+G2D5iXe4SI9dxw1eijGxlW1ayBAHM4aNACgy6PaojnRV
	Ih9bUC1E0Kp+aJvokVA9XGeKCetbyEduWW73OJKwmBvfYjM0VIFcOO1pcDttQpvVgvcVKvRaDop
	OjLYjKO2KLM4lAtSSBKgtUjN2DpZkEw8YbB6Fsj2lr8uTgXr+2x8MVAS16RuIMvK97Mun0McXYO
	6l5LYho1j5TRSputnEYpHSPu0+eHjlFe77iZxT0Li94FYFk8p/eviXjO926Nl0I09DGbZpB8a63
	gPlRTtYotW41TeWc0PL6AhLOmU7/MfErH2xpCJ9f8uJQQ2tfhcOUnW+c2I2jU9PTFlSIUE7YKrM
	qOALAsgljQjVgpi+O+Eo11gbXcZtOtx9am+e3nVoGkxQ==
X-Received: by 2002:a05:600c:6dca:b0:4ba:7a0:7b67 with SMTP id 5b1f17b1804b1-4bb4e2d5f20mr58501255e9.3.1794506202346;
        Thu, 12 Nov 2026 09:56:42 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:41 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 0/4] wifi: b43: AC microcode TX and RX formats (series 3/4)
Date: Thu, 12 Nov 2026 18:56:36 +0100
Message-ID: <20261112175640.40603-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The TX descriptor, TX status, RX header and A-MPDU handling of the AC
microcode, gated on the microcode revision. Only revision 832 has been
tested; the layouts of 784 and 928 are expected to match but are not
verified. Based on series 2/4.

Where the values come from: the register sequences and table contents were
taken from Broadcom's wl driver running on this MacBook, by tracing its
register accesses (bpftrace on wl's MMIO accessors), and reduced to what
the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
Farrow resampler formula, the VHT fields of the TX descriptor, register
and table names), and some formats follow brcmsmac.
The result was tested on the hardware as described below.

Each patch compiles on its own (kernel 7.2.10 headers). The four series
together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 42,
microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC PHY
only comes with series 4, so the earlier series cannot be exercised on this
hardware alone.

Andreas Wendleder (4):
  wifi: b43: 11ac chanspec for the AC microcode
  wifi: b43: TX descriptor and TX status for the AC microcode
  wifi: b43: RX header handling for the AC microcode
  wifi: b43: A-MPDU for the AC microcode

 drivers/net/wireless/broadcom/b43/dma.c       |  61 ++++
 drivers/net/wireless/broadcom/b43/dma.h       |   1 +
 drivers/net/wireless/broadcom/b43/main.c      | 113 ++++++
 .../net/wireless/broadcom/b43/phy_common.c    |  13 +
 .../net/wireless/broadcom/b43/phy_common.h    |   7 +
 drivers/net/wireless/broadcom/b43/xmit.c      | 327 +++++++++++++++++-
 drivers/net/wireless/broadcom/b43/xmit.h      |  13 +
 7 files changed, 528 insertions(+), 7 deletions(-)

