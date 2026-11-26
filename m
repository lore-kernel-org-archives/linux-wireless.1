Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719758;
	b=OKCjGKHQTNSdYgxbx6Pnlvu9yL1tx5Xhq6sAbNkPlONymojI91bg5Fbd179NxI6ECPB3
	 DKaSQ6OpEFM8DpY3laVvpdtlD0gWuA3wFriD3PD137YX56GYsm13QAfcrMZK05p2jHMJY
	 9CF2mfuvKUB0TDv+/vyt6VN3oL88SjXPPjApVaT4W5q8c3i5NbRAYegcPirBxxbmIUk1L
	 bvPnQGryEwMRxpkrqH/y8+ER+6mdj8DGRSeyqzw3gInFWnbwtsXeVD6AUIRwjZhDqRF3f
	 pdzrUxexLF8qMUoXl3wcNkgjIhFonjBc0TTBejNU4EmUlcfjwJWREedThHhWSN3xivQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719758;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=7G8VPKGbj3SVWed9rgrmiwZCexOnrdyvBRI2FSAwndk=;
	b=smF/Z3Alnbd+iHNh4F+2o5yS6Sm88/ght8XIfDunn/WdPE7La+/gNTAMwLGkPPH5ANRR
	 0zZqiNXT2wil6YYrHFQyXuuCrw+BglLD8laIxCKj1SlbVutwdXTd7wrO9FfrMryEX7DCK
	 3FLTQsvX6w6FprLuMYsMgWz6E+64X8TRGJcXf/uZeBYc2166tZ3Fs++ko8cEP85vAVz6z
	 zErh6EVCfAOuhoctFca/A+RgjstzCYiLzrELN6x4sMQEvcAa3bHE318lI2wRmuxpGSTCL
	 sFNIgUy6wEmYSGYe1banWrOci+wZpeR6ojug7oQKfHldjTuIuACB/k599gwFrq0oRGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=gqWtYW47;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F1606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 19:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=gqWtYW47
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 84BD5616F3
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 20:02:29 +0100 (CET)
Received: (qmail 23903 invoked by uid 990); 26 Nov 2026 19:02:29 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Thu, 26 Nov 2026 20:02:29 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Luka Gejak <luka.gejak@linux.dev>,
	=?utf-8?q?David_H=C3=A4rdeman?= <david@hardeman.nu>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4 0/2] wifi: rtw88: reduce RTL8822CS SDIO request overhead
Date: Thu, 26 Nov 2026 19:02:13 +0000
Message-ID: <20261126190217.1151186-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
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
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.999699) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.599699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=j/ZX86lZZUp33NjxWpRwiiuZcmq3gSu/deMMo7y9vi8=;
	b=gqWtYW475NXgvOzYRKKvYBmKSq4nqsIEdyGPrm6FZkE3HVOkw2ohNECRI47/2qdMeWbynJphQi
	IHazYmcCyFGKH3bUumtTivGUmCDh8JXp4cnE8J8CczwoCNRgN2R+zepuIDKFN6aXfEEVyhLZdLCs
	GB/cYNIE+ymRLe8powTZof40Sxjv20M8kMhIY7a1bLJswBjckRaQX2DaXxWJMue87fPnsTzBrHe9
	nTAKlaModD5gYSTkrAGUFK9J3Vse3eSp8WQ6guhWVu+TkX9YTy/g92mzPrTib4ItOABsus0dqcgU
	V3tmyRrFs6Y5DjAQjBuPsQgNTnIQGPy7FJAs9mZRqRs/XH/05BRlamRev/F/oPEL9TxpR3Ob8FTb
	yfxAzCiNruu22oDc5NMgRKOJ7Ff9281nUWcm2AJEDyiOvZQ5tDCq/8vg3qRdAO/y/Qmpo5U729hW
	+ymoyWSDva+7dBCi3+De+OqYgcna+1hoo+uPNcgEOduHhSpuOB6+CGYaxZuQH2XR+zi4oGQmdGTo
	c94b9Q7lUkkdzlPWboC91orVUW35fHTqcRZg1qnlXeV3z3MGPahRcub6wQ+gyHrT04RQ/eSduPRd
	c2VN/fm+hWGu2JlOTy5ZBOdKdZZqTbCipF0r/1JJtKFb9FFHpdWnzWBKfxgF04dT+ICrQdjFLshA
	w=

Reduce RTL8822CS SDIO request overhead by filtering hardware-handled
control frames and combining adjacent TX-capacity reads.

Changes in v4:
- Add the requested blank line, order RXFLTMAP1 bits from high to low,
  and describe the filter as not forwarding the selected control frames.
- Quantify patch 2's request time and isolated throughput gain, and add
  Ping-Ke Shih's Acked-by with that description.

Full-series testing on RTL8822CS/NanoPi M5 on 16 November with v3
measured these TCP medians in Mbit/s:

                              Upload   Download
  Neither patch (rtw-next)      163.4      247.5
  Both patches                  285.4      277.0

That comparison used three 20-second samples per direction and build:
74.6% higher median upload and 11.9% higher median download.

The follow-up v4 tests on 17 November isolate patch 2, with patch 1
enabled in both builds. Median TCP throughput in Mbit/s:

                              Upload   Download
  Filtering only                254.4      275.4
  Both patches                  284.7      285.5

Upload increased by 11.9% and download by 3.7%. Each configuration used
six 20-second samples per direction in F/FC/FC/F blocks, three samples
per block. The two tables report separate test sessions on a shared
Wi-Fi network; download samples overlap and throughput can vary.

Separate MMC traces timed the reads of available transmit-buffer space.
Without patch 2, the driver reads three registers using three 4-byte SDIO
requests; patch 2 reads the same 12 bytes in one request. The median time
from the first request start to the final completion fell from 51 to
13 us (74.5%). This measures the SDIO request span, excluding waiting to
acquire the host before the first request and processing results after
the last completion.

Two traces per build reproduced the same respective median during
15-second UDP uploads. The sender's requested rate was 600 Mbit/s;
achieved TCP throughput was measured separately above. No MMC errors
or dropped trace events were observed.

AI assistance: Codex developed the changes and messages and automated
builds, hardware checks and measurements. Prompts requested the review
corrections and an isolated, repeated benchmark of the register reads.

Earlier discussion:
https://lore.kernel.org/linux-wireless/20261116100804.425592-2-leonard@lausen.nl/T/#t

Leonard Lausen (2):
  wifi: rtw88: 8822c: filter hardware-handled control frames on SDIO
  wifi: rtw88: sdio: combine free TX page register reads

 drivers/net/wireless/realtek/rtw88/bf.c       |  4 +-
 drivers/net/wireless/realtek/rtw88/mac80211.c | 10 ++-
 drivers/net/wireless/realtek/rtw88/main.c     | 11 ++++
 drivers/net/wireless/realtek/rtw88/main.h     |  2 +
 drivers/net/wireless/realtek/rtw88/reg.h      |  4 ++
 drivers/net/wireless/realtek/rtw88/rtw8723x.c |  2 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c |  2 +-
 drivers/net/wireless/realtek/rtw88/rtw8821c.c |  2 +-
 drivers/net/wireless/realtek/rtw88/rtw8822b.c |  2 +-
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 12 +++-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c |  2 +-
 drivers/net/wireless/realtek/rtw88/sdio.c     | 64 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h     |  1 +
 13 files changed, 100 insertions(+), 18 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
