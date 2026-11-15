Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752663;
	b=EDVsQEvHrI0bB3HJcKjMD7lGQpj7QuLNYYTLntRq1K7FEYVJkr6U6eJmP9XY9rPhKErK
	 gjr3Q6Xd8WOGfsUNqfB/qpBmIHjrS4X8QiK5sNXUGPjbBzSEQ0ENtBZRxQESaPWQ/1+NJ
	 m+e9ukEj7U7YKs31A6Ay//i+doFNYF+TyJa9aD7o/PnyePTbVsIeB0Iu+mItCtJr91kCb
	 b1mMcI2/oHxSKNQXmk+ZScOozcYXwpjLLefte+D71dIdyC6MwuWRJA66lYoHpT0/2lVus
	 tqOvAUqD1PtuMcl0qkBmKhIFCVgNPdT7LKNaFtHyvpDvP6ADFVO+up7ER+5qpGWyNfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752663;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=hbvCG1et4dLbwODP8IMSydYvcUFPUeIfKsToBG5oDk0=;
	b=zEF3kRTJZqZyqwYc8dBS6OQt6MSXp443XmyfcenvH0grJMgiIrzy00NI+6HqGsvOq2+o
	 dOuAptKsV5RlHdaVYFTqv53xUH7KHH88KHI60rjAUBpbPQJs910wmyAWSuWHPDfPinQM9
	 rTUtGpxWJW0pbWFpXTIwtPZmqtAE7KcGGzFu93RCRv5sant6Hp/SLm0JtKiMEtWL18T6N
	 v7EqnOl+Eq97CO/aB1i2gl7Tn+3K8Zz13XSrO5CPT70Zmevgn7CnKXHeayiTvjohDe1mf
	 bQkcpiyWFWc4p3HQ7oxbRtKYlCfYul6pTg6+JBv9EeQvML+qzs0YsF/m3yWNw6xmWvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=j2QKutIN;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD2606A897
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 14:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CD2606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=j2QKutIN
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 38F0760D53
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 15:24:19 +0100 (CET)
Received: (qmail 21944 invoked by uid 990); 15 Nov 2026 14:24:19 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 15:24:18 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: leonard@lausen.nl,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: rtw88: reduce RTL8822CS SDIO request overhead
Date: Sun, 15 Nov 2026 14:23:28 +0000
Message-ID: <20261115142330.359247-2-leonard@lausen.nl>
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
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.300008) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.900008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=5yIgk9Y/uhq3UEbSFnl5syJel/NO3xp8uQwJn+ydqwE=;
	b=j2QKutINRqmEpmsx1PLb6wOw7lHfv32bvsCfYGYu2XIrDJwyPwRMdUkRcvZ/DAtACnVd9F9Zdn
	JmEkILVqDBxcaNL9adwyWu/rv+q8ZXvJ9/SfIsvlU954sKiISlzNSsihpl6LMFvQYX65lV+9W51E
	EneXvcXLeMFSfQV/hhI+zNzrkdpmamllyaOOHj0qsMQRKEyJLsRy1dSPQ/LNr2H+D5mfV2hvShZ9
	1e8U5jmy+7rc+lfjVwYcXmaURViV4n6u0EOt5jZt4gYvW02/CVP4XbIguruaLedwSRAuEXw9OOoK
	EIMFDeCgwmXPmlIcLBOkOhAAq5UflxilBNjik4A6d2iEC4PYCbfsbBxyFYbrSMARt8lNb/JAnEFx
	ZjRpqe6nuBEshfGOQzgrIk3NBqLaJwCdzDt98t5n/FYHw07yi7rkvKWh+UCYY3dZj0dAsPukI2hf
	X0m/nsDnPEJ8kDj39sf9aKb6tNS1gX/TEB0Asq0yl9dRROfD1H+r5/ePSIw5LGx8Ebx/gb1sv/Yo
	3h67rA+Insvp5tI5uujd1VI1AlSLQz7OEXZWgTb0jI5iGiTyyohoPHW/AFb1gp+md9UBl0MqFZqi
	gQNJzw0ESRLb/5bsvL9S+hCMLz+A59SOyY3i7nf5Y1CT4T4sj0vcWKEzNSm97Jk+K30t4sNMbiBD
	k=

Reduce SDIO request overhead by filtering hardware-handled control
frames and combining adjacent TX-capacity reads.

RTL8822CS on NanoPi M5, median TCP Mbit/s:

                              Upload   Download
  Neither patch                170.4      241.2
  Filtering only               258.2      263.3
  Combined register reads only 186.5      261.6
  Both patches                 286.9      273.5

Together the patches improved median upload by 68% and download by 13.4%.
Upload and download were measured in separate sessions, with four
20-second upload samples and four 30-second download samples per
configuration. Testing used a shared Wi-Fi network, so throughput can vary.

Runtime baseline: v7.4-rc2 plus the RX-bounds fix accepted in rtw-next
(83ca360e85280) and the MMC voltage-switch fixes in linux-next
(67a97316a31a3, a3838c21e28e5). All variants use stock MMC host limits,
198 MHz SDR104, performance governors and identical CPU placement:
SDIO IRQ on CPU4, iperf client on CPU6, server on CPU7. Traffic crosses
Wi-Fi/AP/Ethernet between two endpoints on the board.

All 20 configured rtw88 modules built with W=1. Sanitized function models
cover credit-read errors, fallback and buffer ownership. Module IDs,
filter registers, traffic paths and kernel logs were checked. AP/monitor,
suspend/resume and other-chip hardware remain untested.

AI assistance: Codex inspected sources, developed the changes and messages,
and automated validation. Prompts requested small optimizations measured
individually and together, with explicit prerequisite and impact checks.

Leonard Lausen (2):
  wifi: rtw88: 8822c: filter hardware-handled control frames on SDIO
  wifi: rtw88: sdio: combine free TX page register reads

 drivers/net/wireless/realtek/rtw88/reg.h      |  4 ++
 drivers/net/wireless/realtek/rtw88/rtw8822c.c |  9 +++
 drivers/net/wireless/realtek/rtw88/sdio.c     | 58 +++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/sdio.h     |  1 +
 4 files changed, 68 insertions(+), 4 deletions(-)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
