Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331043;
	b=BLuSMYKuMtcSkYyq9mNBzO/DV7ze2Kep/iU6Z5/l5muxYab3mEqVvwUYhWU/xpz2pIsj
	 C9W++K8Du7QCUeENaFZNFuoUwSPtHoNnrQIGT0Cjj7HO5sNjzG+JbK783vDGR+2yEFs7B
	 YU8FwSxBeyUoz5atwuNTaukBGncGzMa1TgBJt7NWibprgX038AaZxSp4AmYWtsSGX6cl1
	 BPfMpniS/p6FsarLujJeYdEWkqEFiyhd0IX8xVHThwQbD2XPrZlqw85iSF2EybgDgKcwh
	 bFdl+8ySmQV4bPJU2OgMmExSv2BEEAYVDfhyTmxQ+tV8X3PUr8c5gN4Eb5JyFc8k4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wDyOyjzBj65DSFTPiGlqWs/sXOntQVw4VImA0yKrIbE=;
	b=UC6YB76cZpHr9VVz6gPWbYnioF3HvTY3ZonYCzIO6k2IMg63dm7uDVlXYyCuJ1EVFZMI
	 zyJlp9Eu/+Q447PXVxv1qzvTXKE7JAVAIUNGUW3ZULrGu2byHQP0Dhp/NlPEaNg/6Rjwg
	 XYii7EjvTrg25DxFBEHr2l+J+7NNZ1UdvVGCMMj+ZB34i+awNAy6vd42TM4Ju0nU1X5xr
	 PJQ1URrs6Vahwy9T/a2vbOo1x81eocXk3WngrPXZqrZF64G+7K71zO080By0TUEeZ71OX
	 e13/57SS/uXypvVyx2gcjeZdkFJpWuoYw6tmJVlpykpdGG+D4+ukdcpGDNmsZhlrKYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evo3772M;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00653606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00653606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evo3772M
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso898177a12.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331042; x=1795935842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDyOyjzBj65DSFTPiGlqWs/sXOntQVw4VImA0yKrIbE=;
        b=Evo3772M6w2GO++6nrf6zt/t2Ob3pByS4dK12v1bxj1+ExhDZ43IRsf61ReLa128vN
         gKp3skCjZRBMfe4aT6QDpf5ySvZItVv3tWy3wJV3S8MkH3ED6XqNVRk2e+35jE9TS4Xw
         CTIx9do4MVqlDgAqCdl6FSbglbcP9kZAaiFkpFBqAivAQNknaAzYxv5ktbbSKKhwSRby
         PnE0lp+wKgNXa2iIPa4vN0pgAKN3WMIKC7601NTa9HJKDIbryrKe5nJfS4ltbFyYeveO
         ySoiL2BF574P8K21L4hxjktw8EjQ2lgnf+b+urmz4YXiPOtwkTtTOBpbYFK3HlUgGG7Q
         hFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331042; x=1795935842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDyOyjzBj65DSFTPiGlqWs/sXOntQVw4VImA0yKrIbE=;
        b=BP6klykQH7J/QEV0QtxN2E2rcyKkPRfpOe17+Jl5cRW0j+AQWcIUl59cvfmTKS1ish
         m1F1lnkx9N1w+3Q8J+vZVV/3Jh3/l6dAIzH2De9AB8pkhUUrc5wSZzi68UADa1nR5gXw
         bUf17E61A2GrqOAT00b4KA8rAryLMUTN5us+xj3AwEMKDkWDF6MaNNdU+kEathlcpyDr
         4bzLCaxrWQf7cNAIWDBZUtki8osQiuRVk5H9HesU26cAaSJkrwNnA+Z1mPQEyrZd+iNd
         SK+01gE3YURgNlRtWWMo57MPLJApDOyM5v5Z9G8krxGApZtJQ8V/Z6bYSQSV6rHuquAy
         3o4Q==
X-Gm-Message-State: APuU4Z8rF5cJZCU2AkttOCBc5X+lxNeJkDXXWbqmLnHHxP/vadukK66a
	Ef1VnFOKxvrWeOjCeukodonuui2S37XFddeI6Ua3keCLpEvWySqsZKurqYzifg==
X-Gm-Gg: AZFdTZc521gKsFFu8s1psVkzQ+SFZ5H4x3smHUkbGrFAMuz/dDvRxjbIO9isYZgtJhH
	IJmqBjQkoXaIFQDPKq45hisAPQf2L8pjBNoZ/aSBOPa82NPAlzfH+n10eXt2iJzuF5dxiJpxse6
	hqTu26JY11flZQZmzaYIJbdHU2ECQLHQD3rdbe173Dpmmj1Y4FKl+Eolj2TEMZYyVkx7tM3rG7p
	3Tij/0BVGEusgVAJ7HUJIMwgAllMLGNj8vZSDo4LpMCkWDoN0kDHIwseAqVz3M6bo/3XTCWrM8D
	1YxCSkBAasS4fhunidxONhPame0+K6Hgwwv25zM+0f57VjcpsweE/4HcsNaOsyeFmqLd1Gjp+7T
	6o7XtnJ6GSNFbQZS3lgDHu48n/Jm+VjCXSJC8nfFy8QfDDDBpJPxsSLXrINwvQMP3ybgAT3fZfe
	YfatM44xUay2v5FxGvF0HNsbZcjPe0n0E5br6WwQ+sRV0ftvmOx3IHFL/aJR6o5vB78YWq+KC44
	EE2KhB1UJJql0RoX51WEDjHbuiVcH5s7NnjIrZTmYA6ICm8VfLDCjzqmPSD7Z1MCqktI4LPyFnD
	CnL5tVmriYft2ex2E1t1KS4RuvlUc1ecD0KoRbTcQGxP4HKLol0qSrP3HrotDaMEh40169/pcnv
	eC0/eQcSBTFCO/WtI402JtzmqWRQpWUEp5dY5aukclhBe2cS20eh+WQGCqL2ttPFXt/ANzRRE
X-Received: by 2002:a05:6a20:c992:b0:3f9:9114:804f with SMTP id adf61e73a8af0-4014d15937dmr7567763637.27.1795331041739;
        Sat, 21 Nov 2026 23:04:01 -0800 (PST)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm3609721b3a.27.2026.11.21.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:04:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 0/3] wifi: rt2800usb: don't wait for every TX status
Date: Sat, 21 Nov 2026 23:03:39 -0800
Message-ID: <20261122070342.101054-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

rt2800usb keeps each frame in its TX queue until it has read the frame's
TX status from TX_STA_FIFO, one USB control transfer per report. On
hosts where a control transfer takes several milliseconds (AMD X470
chipset USB 2.0 ports take 3 ms or more), TX is capped at a few hundred
frames per second.

Patch 1 adds a mode to rt2x00lib, REQUIRE_TXSTATUS_SAMPLING, in which
only frames that need their status (mac80211 asked for one, or BARs)
wait for it. All other frames are completed when their DMA is done, and
a few of them still ask for a report that only feeds rate control.
Patch 2 implements it in rt2800lib using the TXWI packet id: 0 for no
report, the queue for waiting frames, and a sample bit plus the low
bits of the requested MCS for rate control samples. Patch 3 enables it
for rt2800usb. rt2800pci/soc behaviour is unchanged.

RT3070 station, MT7612U AP, channel 6 HT20, WPA2-CCMP, same host,
median of three 15 s iperf3 runs:

                       before                  after
  TCP TX               3.4 Mbit/s, ~340 retr   37.8 Mbit/s, 1-8 retr
  UDP TX (60M sent)    8.9 Mbit/s, 60% loss    43.8 Mbit/s, 0% loss
  TCP RX               10.2 Mbit/s             29.8 Mbit/s

A GTK rekey every 10 s during 60 s of saturating TX with an A-MPDU
session completed every time, with no TX status timeouts or unmatched
reports. Each patch builds with W=1 and passes checkpatch --strict.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, write the fixes from that review, run the hardware tests
and draft this cover letter.

Rosen Penev (3):
  wifi: rt2x00: add a mode that doesn't wait for every TX status
  wifi: rt2800: support TX status sampling
  wifi: rt2800usb: don't hold every TX frame until its status is read

 drivers/net/wireless/ralink/rt2x00/rt2800.h   |   6 +
 .../net/wireless/ralink/rt2x00/rt2800lib.c    | 175 +++++++++++++++++-
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |   1 +
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |  27 ++-
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   |  22 +++
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    |  79 +++++++-
 .../net/wireless/ralink/rt2x00/rt2x00queue.c  |  93 ++++++++++
 .../net/wireless/ralink/rt2x00/rt2x00queue.h  |  13 ++
 8 files changed, 408 insertions(+), 8 deletions(-)

-- 
2.56.1

