Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269707;
	b=XuTuxgszEfz7vw1uxvBq3X6tHKRJzWs3HijrpVE4qwfw6cn1gj57iN7sqdIz1zTy3J3H
	 q8ZmKHRGTLPDM69D5t4Mjw1YbAT4odKJmuGF4CthzLETUFYnMIq41P6w6V87CfMlpQENg
	 dJmZFh6bXbB3ygvslx/dwMFRA5BHXOAsakCloo8UncsTy3qS6+TeliDJD66jO8xk+zlB7
	 nc47Xgc46wGKCHviT003o0Qx8mdtOSQj6FWZosU8kjWhP5mfkWT8ufaYWbbs2camQ8niY
	 hG2RaGmFola5EEwyP5IsL5C4pD60miPlIOG4RFvTBE2OK1fdlhiV4a4HVolRAxzfiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269707;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=hEkF63gs4U7QMi2VnllvXbPgoLAsxJ4Dgn1yye3Nmhg=;
	b=lzmEmpfQtyiSYFdE0q8W68FfEc4P27mDkiYanIFY0SqU3bmgXZwfOPY7P1zaYeE5E24H
	 bjGxqWz7ppCHw5OeDpMmbVZcJYOXR2oCYOgsDrDdyJ50OqoFiEBaw1EzEUo93IPtXHRex
	 YaPTWwbzqcoo9lj3d6x6UBXADqllDkVDFw9Mo6cbbSsgvQ72O6xsxF0iWpoPuPx/KKpQ6
	 Pj5TWByOKJ5SUB4oSCZc+uOVp51Li2c9/sqKxNOkvCA860L7zazrhzGpSMn6HBeswl16v
	 qSuNZh7GxjDS5DQte9vENEswkb/BpiMLV+w7V47dQdp5yMVR+6oDMwirerVJA9SHkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=ZFaAlwLS;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E51C606A331;
	Sat, 21 Nov 2026 14:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E51C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=ZFaAlwLS
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 930651D827A6;
	Sat, 21 Nov 2026 15:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795269704; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hEkF63gs4U7QMi2VnllvXbPgoLAsxJ4Dgn1yye3Nmhg=;
	b=ZFaAlwLSl7RdIxrSsi7ZvmgZJ+Ibx4yg1CsARE3Zs5ABWTS58DvBIaN4YlheUHX0ts4qDt
	kx80B8Ha4F773xB/LaVXd3wt7psjb+lDb4Bo0IN5beZs6y4E9paNhQmJTIHRlsfIUBQ84z
	Yo35M66YomF8TKuvdpqTRP5ajhTLggBgujss3C0pUZjS/NipvCMGM7S2vJoTeHeb1WuPf4
	Gn+XUOZAtOPO0Scl+3inu1bjM4O8t7yMWILHq3GZZkmLb89n2wuNlfU1KCbj1kwxg4CSLz
	VBP7WQ2EduDVNnTu39MwC0Btj1+zzSSx4S6oW6Fu0OqRYR78OuZvRQrMhKh+mw==
From: Michael Auer <mick@yoxcu.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH v2 0/2] wifi: ath10k: Fix WoW wakeups on WCN3990
Date: Sat, 21 Nov 2026 15:01:33 +0100
Message-ID: <20261121140135.709615-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
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
X-Last-TLS-Session-Version: TLSv1.3

With WoWLAN enabled, WCN3990 firmware wakes the host on action frames
right after every WoW entry, so the system hardly stays suspended. And
when the firmware does wake the host for a real reason, user space
cannot see that it was a network wakeup.

Patch 1 sets the action frame wakeup filter that Qualcomm's own host
drivers set. Patch 2 reports WoW wakeups to the PM core.

Both are in daily use on a OnePlus 6 (sdm845) since late September,
with an sdm845-mainline 7.1-rc1 based kernel. On ath-next they were
only build tested (W=1). I could not test QCA6174 or QCA9377.
qcacld-2.0, the vendor driver for QCA6174, sends the same command, so
I expect their firmware to know it.

Tool use: the analysis, the code and the commit messages were
written with an LLM coding assistant (Claude Code). I reviewed all
of it and tested it on my phone as described above.

Changes in v2:
- Patch 2: report the wakeup before completing wow.wakeup_completed,
  so the system resume cannot finish before the report (found by the
  sashiko review of v1). Tested again on the OnePlus 6.
- Patch 1: unchanged.

v1: https://lore.kernel.org/linux-wireless/20261120202652.344435-1-mick@yoxcu.de/

Michael Auer (2):
  wifi: ath10k: configure the WoW action frame wakeup filter
  wifi: ath10k: report WoW wakeups to the PM core

 drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c     | 17 +++++---
 drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
 6 files changed, 143 insertions(+), 5 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.43.0

