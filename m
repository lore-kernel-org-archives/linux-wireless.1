Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506220;
	b=I5vKcdx4lkTnouBPLeX6cPIjVJ0cUNBO01CUa8Kw7x2zBxBsTa7dFTC985BDICh4+Ydr
	 9yDGVxhqh9Cdmmk+67cttgVSAybHVrHC8Z1+TNKqVIk7VzlUC9dplTvHZ3nO3EsDyXWm/
	 0pgqOR6xJl1XD8jwIcrfEUlLWXa1off2RAl2kay0F3rKCZat8uGNX10xKYmZhnCACaUkz
	 7GE/AsJfXTM3UQ79F+qfLNNiT1DaQGQMwbo/Gy1US0OMb+p3P3rMp0oKbCd6h3IvpPojY
	 boe+MFIlI2w2B+LwcsoTvQLoJ5UOUycn9+nnIn4IIyyLFwCeMBUr85g4G1Gt56h85qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
	b=D/YJPGqDUIbLb1sUg7EmQsfzN9w1+i+x4+MD/IIwe3pjuaAv5qRd0TD+MYBn+MXSgmU+
	 pts0mo/7vCBcA5GNKTwMxtHKA7SwAji+qUNV422Zmw2y70g7B2Bp0qmvunl6nnOH7s+ze
	 tf9DZcbLQFZvmaSiJQMmUp9AawPUImI/Gljcqqs2eWnk4RujG5YEDGIiqfDQyU+8b1b0n
	 +5aPqtTz5uFzeqE5q+OXpkEc3qyd3D/dNwQKDnkc/B1m0Yzs9gbYBV1kKMJcNn8mhmi1X
	 GFhkP8vsLyc9BAzd5tytll9wPvB5V6egFD1TgeLypPbXgM5PvhEoZ/qQY3L2Z3npVZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X58pAIXZ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8A606A8BA
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC8A606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X58pAIXZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so947175e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506219; x=1795111019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
        b=X58pAIXZp3A7bdjGwOrM+Ngedur5afq2frk7IlGbTgZ8tgmLg9o36a03EIbw3GY+TM
         Lal6RcDLKRr39HT4BdIZ52G20of6KFuypquEX3fptvLqO99EpVbrhTS3Xy8OMy4PUi7y
         l2Y8+KSFLrgzbgXjlbz8yBLzvpcCLCfmL0pV7AAVf9vo0YOfy0yyB5CO05ikNRmD+G6t
         Hx+ebJk3dFORTJpNCoNX//bNUWnM7Yjnn5Zn7aubdxecCHfzX2IPYmZ3bcEWLw3qIePM
         ZwcPWO/j2CCnrsgmRVDqbbHd87OT20NwmEEAkBJMwu1Go8JZEPzXNYigp8Vwx/huqZWC
         q+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506219; x=1795111019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
        b=eGPAnCHITWPRnwm6ed2ObPWf7/yaHlXnH0rpJ3s/IDBlzr+CWQ3U1HFCgkP+4oGzRg
         BAAxXbKClotnoBLojCHKI42P0D2Z1V1OFgwhkTaHTGfkNI7PJ/er+Kuhyghn54xgIeLA
         6JH88P2/mlXbTzesZTOQInBi3iRO46LVYUSBKiEDogZYa0CvRse/U2nZ87odVjUlsZuK
         +rh2gle8frFxvhrUHgzT+pryujC8a7wZAyNiSdw1aVINEGBCVgfiimBcn0OxMFvkUeSk
         1f/PvaHdpH2Wgzvw/i8R+m/RFnCiqgRSuNu4/SqE8Bx3pfckqbZWDEn9484rScLgYFZw
         gW9w==
X-Gm-Message-State: APuU4Z/a1qpPAXyD3vLfoFkvvywMmFiW3Ef1BS8W3R44Bf3cVA96HMys
	CmH/ktI2Lka47rMlIFYNa/tvp7rqb1kaOE/uzGr4qLWPdSquMa0fGHs7EZbyidbv3fE=
X-Gm-Gg: AYBFou10RcMC1dNeR5A/aPezBVxgoZ1FLxPqjyOx5U1VMxWEUxtMRTmcqV0nxwIeviC
	baaKwBqHO0k5CAu44Y7EqeSysRIiGMaXpyLg+Pix+d02Y/xGoiUuHIICnQzFBrtDeRX6stNKjso
	hikUWsKtMqyuayA2SuEkt7vnUD5xcQx5wtoEpJc9hYggpNS9ST6CkxXVw0WRErfDv2FJUKKzysb
	SuDMaqQmojbsu5FR3eFDvvCbTXx5a7kSOwA2Uu12AdLUQxiWzgOrV6l25jJxS40BNmwpETxumZ7
	UKZQAUGMFbdOJ6W7ToytlmJgpvh66tMKE/wPx72FRSQfMUezHZUW1/6I0S0zeUQPg7ug0EFnjHs
	astAmAYUdkxJdPIgjzUKMZa/xwVZBbdbZZdfpDQRyWtyBEzkzMnb3g5CXTYv3DLHwrzSK6PDunf
	zSQ9aj4LfFV6Xc+Pu9b7AdMvLCBwu2YuX6QT4YO+oaVaBgDJMpWZvjNfA4lsTp6qqsIRvQDXEUE
	2m3d5CvBtIfPTo3TgTKDSQveM7IMQ9DDn2ZX3/ZWjMSvqK2PMXZNHnkzGpMFGi1gPnI2BZA0Q+M
	ng6A+o25YfzvEUa+Il0Z+KXJo6AARKZyMx9WXTK3tt5SvAFjAq2Kgg7yI+P1TNqf8XmiD+Xp27c
	HhlWnEBamzLyP8lp8YuI3TPL8MHuPF7WibzyJlfWEVbLZRipvdkWlHO98T5HP9cqg/giO+TNoBN
	iBHoaZ8WhEvfnyV9drqbOcD2DNRnAQSc5X9xJwMY+STQ==
X-Received: by 2002:a05:600c:1c25:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ba093a9f02mr139408685e9.25.1794506218938;
        Thu, 12 Nov 2026 09:56:58 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb527c755esm31491425e9.4.2026.11.12.09.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:58 -0800 (PST)
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
Subject: [PATCH RFC wireless-next 0/4] wifi: b43: AC-PHY support (series 4/4)
Date: Thu, 12 Nov 2026 18:56:52 +0100
Message-ID: <20261112175656.40686-1-gonsolo@gmail.com>
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

Radio 2069 and the AC PHY: tables, 2.4 GHz and 5 GHz channel switching
(5 GHz in 80 MHz mode), HT and VHT capabilities, and the removal of
"depends on BROKEN". Based on series 3/4.

With the four series b43 brings up a BCM4360 on 2.4 GHz and 5 GHz, with HT
at 20 MHz on 2.4 GHz and VHT at 80 MHz on 5 GHz (40 MHz is untested), two
streams and A-MPDU.

Each patch compiles on its own (kernel 7.2.10 headers). The four series
together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 42,
microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC PHY
only comes with series 4, so the earlier series cannot be exercised on this
hardware alone. Association and traffic with WPA2 (software
crypto) on 2.4 GHz (HT, about 54-63 Mbit/s) and on 5 GHz (VHT, 80 MHz block,
two streams, 40-70 Mbit/s at -78 dBm), no errors in the log. Not tested:
suspend/resume with this exact series, other boards. Not done: TX
calibration, hardware crypto, power save.

Known issues, which a review would ask to fix (pointed out by Alessio
Ferri): the number of AC cores is forced to 2 on the MacBook boards
(0x117, 0x137) and some init loops assume 2 cores, which is wrong for
3-chain boards; and SROM revision 11 values are read at fixed word
offsets instead of from parsed SPROM fields (the parsing is in his bcma
series, not merged yet).

Where the values come from: the register sequences and table contents were
taken from Broadcom's wl driver running on this MacBook, by tracing its
register accesses (bpftrace on wl's MMIO accessors), and reduced to what
the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
Farrow resampler formula, the VHT fields of the TX descriptor, register
and table names), and some formats follow brcmsmac.
The result was tested on the hardware as described below.

Andreas Wendleder (4):
  wifi: b43: radio 2069 and AC-PHY tables
  wifi: b43: AC-PHY init and 2.4 GHz channel switching
  wifi: b43: 5 GHz, 80 MHz and VHT for the AC PHY
  wifi: b43: enable the AC-PHY support

 drivers/net/wireless/broadcom/b43/Kconfig     |    4 +-
 drivers/net/wireless/broadcom/b43/Makefile    |    2 +-
 drivers/net/wireless/broadcom/b43/main.c      |   69 +-
 drivers/net/wireless/broadcom/b43/phy_ac.c    | 1263 +++++++++++++++-
 drivers/net/wireless/broadcom/b43/phy_ac.h    |    4 +
 .../net/wireless/broadcom/b43/phy_ac_farrow.h |  260 ++++
 .../net/wireless/broadcom/b43/phy_common.c    |   25 +-
 .../net/wireless/broadcom/b43/radio_2069.c    |  862 +++++++++++
 .../net/wireless/broadcom/b43/radio_2069.h    |   19 +
 .../net/wireless/broadcom/b43/tables_phy_ac.c | 1273 +++++++++++++++++
 .../net/wireless/broadcom/b43/tables_phy_ac.h |   31 +
 11 files changed, 3801 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/b43/phy_ac_farrow.h
 create mode 100644 drivers/net/wireless/broadcom/b43/radio_2069.c
 create mode 100644 drivers/net/wireless/broadcom/b43/radio_2069.h
 create mode 100644 drivers/net/wireless/broadcom/b43/tables_phy_ac.c
 create mode 100644 drivers/net/wireless/broadcom/b43/tables_phy_ac.h

