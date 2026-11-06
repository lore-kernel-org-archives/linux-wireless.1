Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999728;
	b=jui7y1/WueGauhDUXjeVvVYuSKi6+o7wQidFU32MI18h4F78mzgd+/sNUVrYR1gkTxUb
	 2tai3bXeM/Ivm9RXWZ/UhEMD6lOQHFTsQ7A+bBi2Y95BJcIZlu0k6Gi/st/U24sXOh6Fy
	 1IInisrb9/lltDZbFWZYDf/oyPOlndrS/pvG7lOeq5+cgrulJl4MzjizeB+OE9fhRFgc8
	 3fd2y4nDaNED+2F4NZNkmKr+RpI18khjoU8iHqlWapLO985zPHZfioNUAZSL5tAOwggMQ
	 g3/vQyzeXNwOiRVf3/zcZuCO/e/T4o4J1ydxHXZ8jOUrFQRB/OPLlv5gEBfOoZ359IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6naSlAMDyL51g5pW+eqNc/yHcEcBIZZizLKc9xizVlc=;
	b=s+kIR/nLwAda415aWKEV4Pvihy2+yb9Ig/9+7RwtHkQkwJTUYOKi9PWQN4RJyKsUUtx2
	 un39+UAIAU9P0UU9bLKFg+4t9ev2X0J0mkeVLAlLwWXTfmUBeyjeWX2Dqvh+0wGG8ataN
	 Tz9DIpHDy2Yq4ewbHrW7lLeStl1LasQ2EdWNVAvGs1cIctZCnJf3aUyUcZvO7PGZQhY1j
	 zGTbOjIRHncJnv0PFDjcKBiM9LB91+hvUKu/cUbQlpT0d4Jec+7Vej8OsKUkZdc2bDIot
	 NpNlyJItu6jXeqg46kHZHTAL6LmvY2WFUyEx/n9FsnjWUxB9eSQlDphL8Z3kVrN+xgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DE4vOuPZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7F606A329
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F7F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DE4vOuPZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13802985e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999727; x=1794604527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6naSlAMDyL51g5pW+eqNc/yHcEcBIZZizLKc9xizVlc=;
        b=DE4vOuPZ2q2FNVW3JgZq5cxkIn+6JreBflmk4aV/pZGGpyE/K9hRiBM+QjfBTLN3Wr
         yue/1DJqdcQd287UpxnnrYDoGoh2QNPl7P2+WLM2mFNIyXgTfditKxlXwv0vITYCoGMi
         2KlRmfo4U9rKRFoZp6uBB3IWUhr/3yyAlAc/ol3RwZDxX8R1zGxNyiwpoCllwy5rVjmC
         +Bs08zuRWOBxru9AHZNmLuvSibp/RiVPhdYDLVun0gJozsUWtTgaKFOWbQJumo6SE9Ik
         U1D4hd88KjrHgCHKNbmQln3uUS0I4K2ukVJtZnZvn+2ZYZLchq+bT1zQj7idGjreHc1h
         8EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999727; x=1794604527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6naSlAMDyL51g5pW+eqNc/yHcEcBIZZizLKc9xizVlc=;
        b=FefumD4mnu0mrM4ZxXO/5PujL4Xh61R3LTvsWft+KOKTNt9D5qeUwM7S4GwbBr+k5V
         iPETCU/YdDur7c8EIvMzdpbBPWunp6f0zlOAJLTd2FH0KkRqpHuTJRXOozh1BSdf8M+T
         O9DcdeuAR7sxpdNjhI4y0VLhx64Gk/InafRs+Yw7pMVJcoTSUd0wVdtRy1QExP5ePQEv
         WRSdzirEs7M3Gngki9ycMS0/d0eYWBwcjFWOYUf0gY3mUUh048cnwtmVV22k/smrMxYb
         A/+XGGg9JjBICndK2XX5nzz2W4e3qMcFuD/6Z37Keov531yi2h9Ktu059diSjy4/N+mV
         68og==
X-Gm-Message-State: APuU4Z+Alf3/XsFa5uwk8teWEKff9qBXJN3CHm5zMz9Fs5Lov0GpyCDs
	vXJ/WYq+AfwOz8OmIRV/NTN6px4kk45fbw6dOEHKogX5VlJ8j+SpO/pYKzpsQwTl
X-Gm-Gg: AYBFou16skk42iOqhZCRED0ZMa6TdXZPnykAh7F8JPRrypgVPmaWwd0bU/j3fInmEjl
	c2G54M8OA4ZQSkiZN4d2jTw0NRpgTfce7Ub8nL2rt96iGYPvEG2UEw+uzQNkjHQTp/xWZ5pjl1X
	ZZLldCpgWDBgZLrqth8T2M12rncjUtV/f4Jj1/P5tA2zx/EK4xksDgccYgFUWgIfzOTsW1/7e7h
	YbRitvO1dTQ//END8IHbpwxstAR2ARE4YAiyjgAotPkgzD7D9jh/+OieL6SfrIB7K/i8zOWxuUW
	i0ZdpxPGDkYw1B/EzDTKjHRcHuIIbNcFFkhULxK11sOsUDkNAIaJOFU0r6Tbydr6cN5yOd6TcfK
	SGjpQfI5zP1e/7dTqHYQboHWtty/u6k4W+eY6cKy0n5yqaiE9RjKbxi01C6rK3//lYCC6LhtePm
	yNVtYssB52CNhYFkIiaBqw9SD7bqRImi3jLosKXlwfeA5KK/doJRFV8mcCMiUz/f+EalFLzpQ5s
	u8tQHgshZGnTsd4dSDgsAz21adj9KJNkfzsis5om/V5pvW0dZE5NpDMuzM2J1sADFTneOvTKm0R
	Vi0cStbx90b0zL25lUeYNbnEoIHvQOJx1dkTtU9G8e0maLKGlijfUG/RPJ9jjET8s/s7IMaI
X-Received: by 2002:a05:600c:1d1d:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4b6e0171346mr62096525e9.29.1793999726719;
        Fri, 06 Nov 2026 13:15:26 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:25 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 0/5] b43: N-PHY: fix calibrations on rev7+ (BCM43228)
Date: Fri,  6 Nov 2026 22:15:11 +0100
Message-ID: <20261106211516.273791-1-luk00casati@gmail.com>
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

On a BCM43228 (14e4:4359, N-PHY rev 16, radio 2057 rev 9) b43
associates but transmits poorly: high retry counts and low rates.
Comparing mmiotraces of b43 and the proprietary wl driver
(6.30.223.271) on the same card, together with brcmsmac, turned up
several bugs in the N-PHY calibration code:

 1. The TX tone sample table was loaded as all zeros, so every
    tone-based calibration ran without a signal.
 2. TX IQ/LO calibration: inverted busy poll, reversed final copy,
    and missing rev7+ cleanup that left TX dead after a cal.
 3. RSSI calibration: wrong VCM written on rev7+, wrong distance
    formula, wrong rounding of negative offsets.
 4. 2057 RC calibration: every delay was about twice wl's, so the
    first run was stopped while it was running and SCAP read 0
    instead of 8, detuning the TX low-pass filter.
 5. A missing field in the rev7 TX_PU RF override.

The traces, and excerpts of the operations behind each patch next to
the same operations from b43, are at:

  https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/README.md

Each changelog links its excerpts.

Patches 4 and 5 and the cleanup parts of patch 2 only affect rev7+.
Patch 1, the poll and final-copy fixes in patch 2, and the
distance/rounding fixes in patch 3 also change code that runs on older
N-PHYs (rev3+); I could only test rev 16, so testing on other N-PHY
cards would be welcome.

Tested on the BCM43228 only (2.4 GHz, 11g/HT20), on v7.0; the series
also applies to wireless-next. With v1, throughput to the internet
went from about 5.7/4.1 to 11.1/5.2 Mbit/s down/up, with fewer TX
retries. That number is limited by the line and noisy, so take it as
a rough indication; wl reaches 21-32 Mbit/s down on the same setup,
so there is more to do (PAPD and TX power control on rev7+).

Changelogs refer to wl where the fix was checked against its register
writes. If citing the proprietary driver is not acceptable here, I am
happy to reword them.

The bugs were found and the fixes drafted with the help of an AI
coding assistant (Claude Opus 5.5), working from the mmiotrace diffs
between b43 and wl and from brcmsmac. I reviewed and tested every
patch on the hardware above.

Changes in v2:
- Dropped the comments the patches added.
- Patch 2: the changelog said the coefficients match wl's; they are
  close, not equal.
- Patch 4: replaced. v1 waited for the first RC cal run and explained
  it wrongly: wl stops that run right away too, just sooner. v2 uses
  wl's delays throughout the cal instead.
- Linked the mmiotrace excerpts from each changelog.

Luca Casati (5):
  b43: N-PHY: fix the TX tone sample table
  b43: N-PHY: fix TX IQ/LO calibration
  b43: N-PHY: fix rev3+ RSSI calibration
  b43: N-PHY: use wl's delays in the 2057 RC calibration
  b43: N-PHY: add the missing override to the rev7 TX_PU command

 drivers/net/wireless/broadcom/b43/phy_n.c | 115 +++++++++++++++++-----
 1 file changed, 90 insertions(+), 25 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.43.0

