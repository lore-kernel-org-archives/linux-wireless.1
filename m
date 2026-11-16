Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823830;
	b=zorPk9i4fa8W4TCm+LjBMaV0mIcVfQLxf64QDs9tIdE7wb3PpGwyEWh/EPynd2DN+mYe
	 4rRlwgK8WeCXhsBQ90oORRHio+aen2QS1qJt63+xCplYg1fsX5Um7X5EOUzGh8plaanN0
	 7bVGUPYApwlXyuCFnrm9qP8Qo+B3lxno86HaPO+k4cZ3cG7kjGytgKkTtAMAL9KcqYPEp
	 zCOSq9RoXIS9znv6c68XN0mbHh+6ei8a7uClVB80vxkWcTcHcUs8gz7v7dOauhL9nq+sw
	 231bteWCYHG00aHn6FH5ICmYL7/QVC3qEXF4tsu1GPKu/00T+x+oNkM8lLErAuR0B/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823830;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=aIoEyVOwUt1rwjM9MzI3ayeknn0q7frUADYalCM2t3k=;
	b=yVQTk8fe896mUlfMQFJSdktAtNW/IZ+xPj9C35wltgy0PNSGH18VLcThJtyvthF24Fly
	 An525wxsZQyqrsWt3exLCtWm1mc4Q1L+2i4+LxYofiq5ThEh/idbarU6nj6UwQCeOaG/n
	 Fln+BC8XnmEhLij++vmyuhE9ZbWN6qg6qopcvvgOVVg/5a0M2i2h8C+sJJAE2GRRO8IOc
	 5f2YwwH1TpBXT1p+MPRezRSRqBdZQ1qyjCA7a1d3KrIQmjezLv9nu0nkHoAIaNs4Pduob
	 LGIteLNTFrwKfpfTFozinxZ7shTmG+c2CV4ZYqQTSJ2xv10G1vsGBY4K6rJ1iK+ft3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=R2L2PtPE;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BF606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=R2L2PtPE
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id EAA9B60CCB
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 11:10:25 +0100 (CET)
Received: (qmail 25443 invoked by uid 990); 16 Nov 2026 10:10:25 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 16 Nov 2026 11:10:25 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Luka Gejak <luka.gejak@linux.dev>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 0/2] wifi: rtw88: reduce RTL8822CS SDIO request overhead
Date: Mon, 16 Nov 2026 10:08:01 +0000
Message-ID: <20261116100804.425592-2-leonard@lausen.nl>
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
X-Rspamd-Bar: /
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.326235) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.926235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vlpOviJWp1zkTyLG7AGt9l0GxQUdRlcWr39GIh/K9Kc=;
	b=R2L2PtPEeW6chpgYypugPzYpM2wHxgzlTTbj2pFOjTqk1oPZVXBx3YsgjWf7BCTh+2yv8d0ZdO
	7mAqXlFF7ZfvCcaU4wGqRaCJgD6/sIA71Et9aquFDrzkYxxI7LkzOoIeNag2+XuGoVui3tzA0BHq
	MTRQbZYUTAunrBQNjCSfqZDjie2EFWO3GL13E6mhyDPSR7sD6mXcnABbuvDbIuXRCsa/wgmQ7GyR
	XWAAv8VYwaLOqrxfpaVY+Ow9hupOf5V5C2bVxhhRCGz2Hw9AO9TwGw2NfzC+8f9xoIaEriFiCR4A
	MFa35hFAaD++5s7sXJdQf8WRgEZLhggYERnbBCjVPkyr3rjAWgFXhQra2mXBE/yEZ/Mec7tvbDdu
	COHJ8KOioR1dLfouKqRIXNdhcciGMjxCO31Kq0UAsGFYj8o4xUBmscVcOu/vKCzKrR/cHd8eI6Py
	eWMp4LuvhZQxBG7rmL9bRB+dL8oc1G5J65n6hBshMWNIWpK2liRYzbiBb+4KhahDxhMBYPEccqD1
	KOrBXYfq2hKTg9xpibeGURA/cN7BYfSMvBHJTc47E1lnEqUg5fO9CITtxORts0yeY3qCsu+wT9QK
	UktNbcfawqMkr5EZNX6yFVzSAA7N+VwRdvSgpXQGD4HLCtctgn9QMkc/yrdfiCHDjf0tDh3IVa4u
	g=

Reduce RTL8822CS SDIO request overhead by filtering hardware-handled
control frames and combining adjacent TX-capacity reads.

This complete v2 series is based on rtw-next at 61a5eb87b2d9. Changes in v2:
- Rebase both patches onto rtw-next.
- Fix continuation and argument alignment, declaration order, comment
  formatting and long lines throughout the added code.
- Remove the deprecated Assisted-by tag.
- Refresh throughput measurements using the rebased driver.

TCP medians on RTL8822CS/NanoPi M5 with the v2 driver, in Mbit/s:

                              Upload   Download
  rtw-next baseline             165.7      206.7
  Both patches                  296.9      271.2

Together the patches improved median upload by 79.2% and download by 31.2%.
Each configuration used three 20-second TCP samples per direction on a
shared Wi-Fi network, so throughput can vary.

Both driver stacks were built against the running v7.4-rc2 kernel and
hot-loaded. The same test-only adaptation restored the older key-iteration
API and RCU locking in firmware recovery. Both configurations used the
same MMC host stack, 198 MHz SDR104 and performance governors, with SDIO
IRQ on CPU4, iperf client on CPU6 and server on CPU7. Traffic crossed
Wi-Fi/AP/Ethernet between two endpoints on the board.

Independent v1 tests measured a 52% upload and 9% download gain from
filtering alone, and 9% upload and 8% download from combined reads alone.
Adding combined reads after filtering gave another 11% upload and 4%
download. Those tests used v7.4-rc2 with the RX-bounds and MMC voltage-switch
fixes and stock MMC host limits: four 20-second upload samples and four
30-second download samples per configuration on the shared network.

All 20 configured rtw88 module objects compiled and linked as relocatable
objects on ARM64 with W=1 after each patch, without warnings. Runtime
builds passed modpost; loaded module IDs, traffic paths and register
settings were checked. MMC traces confirmed three 4-byte capacity reads
became one 12-byte read, with zero SDIO command errors.
No full rtw-next kernel was booted or installed module files replaced.
AP/monitor, suspend/resume and other-chip hardware remain untested.

AI assistance: Codex helped develop the code, inspect vendor sources,
automate the earlier benchmarks, rebase the series, apply style fixes
and draft the messages.

v1: https://lore.kernel.org/linux-wireless/20261115142330.359247-2-leonard@lausen.nl/

Leonard Lausen (2):
  wifi: rtw88: 8822c: filter hardware-handled control frames on SDIO
  wifi: rtw88: sdio: combine free TX page register reads

 drivers/net/wireless/realtek/rtw88/reg.h      |  4 ++
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 10 +++
 drivers/net/wireless/realtek/rtw88/sdio.c     | 63 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h     |  1 +
 4 files changed, 74 insertions(+), 4 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
