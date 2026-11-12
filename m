Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481225;
	b=o17SkK4IIXky72x5HftE64Occ04+NAG11l0CjM8M6Wa4HjWogYO3SMfiCX3QRe0IDWDE
	 ZjZ5ORvODM3JoMd42+/lKK7W3Yadz6g/FyyvadsNBQaWE2ULkBAdFWI9Oa+4FSkbK5J7W
	 PtHB8BL9RL+NPlpTyfzZRLCBIm7C5sh9W3/J5IglbQBIblSLgOBsTDg5XUKRqM7/L40pK
	 3/Hwc5e9ojaLDTWmOob1OUUxgR2Iow2VssQHG4Xaks9izlBKVEtEFhZmbNFYInmLw1XRl
	 ZUPFSbtWFgvbuNJch+UY83y0aX2JwPukgTw7X369ECcPF4jiCmzkyhnob3Qr3jUswfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
	b=wp66L9kk+Okh4sjLLG46T0QA/i3pMiY0Mte2XbmEwQkAc8xYTT3pSy60HGsUJvG2qxmO
	 eKMzoj6NK5O0XffpElHeFDNZOuCOZdYvkevoKY13m2uvxFWw04z1zHrIN9zqeQQKmc9TS
	 YEJcRa5wPJVNkUO/pBjOUuJTuksHAtr38XXZnMr5DorPdYhkvE+fqMBYT3NKlT2bgU2FB
	 wacnCJqskpsOfFqYw5e1Oynor4eFA30/jDOoJcYBLkDqJu0QtXIblVoFdnijR9uqA0gTp
	 On7MySKrXrEDcS4DnoLrfI4l2dklLtADBW4VJndwj1B/sm1UCDYtqF/bM2Va0rxW4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xM79bSxZ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B03606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xM79bSxZ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so2725148f8f.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481223; x=1795086023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=xM79bSxZIjAQKwxPPLERuag1Cs3Lt42zaITnGfEZHfz/WiLVsrtzQX5B37G6L1OVxP
         iHAa0qmn/tdIhI3f2BXK3NjoHx1gwVx4HwyPuSnB7uwWJZrjj1UDKolgiPlLfjleFgAv
         DE62YExOtW78mOtO/6GOSZtZV0M5rHU+hUbrN8WNBRS2g+4MqwXcKNxJZOZQVeeL15Cr
         SZy49lafpFIG1fZTf1Vb6Bzj0bIwHHJpAWZD4o5r1yfX7oGvy0Oqzak9BlbMAulWu7iz
         BfrDhWZzVd8NBHyazKRglhlUTZOOYSR3C+hRLV7adg4zJQ6mH0XAKDOY8vgrAFOOb/0k
         5X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481223; x=1795086023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=XbPaOTgJM4o7jL+pZWoWXSXS8I+uPY773fyUFrtRnCgSg/GiD9EJDNbxZ7Uhhbhxlr
         jkfETEVQg3jLo2t9SXFxfC9Xb2xYe51wRhMIOnmZa7grAT3lSuw8P5MUF/Sz+qtLSzc0
         0VHdgP2B2PdHB0pqzxVN1Kz7YMq8RuCnIp/hVDUXrMdItP75xp7Sql3+sLLPmmCpOAwN
         C1a48TBmwOK3tol6xaFhdWFVJIsT0OE13CpYlk7Yb1SXqrfRBtgwqjsP4qFaSdxlE6Fz
         blNhgf4q1er2Npkx0Duxtz45xDRso+7DNPdbsC12N5WaCbDWpbNYiV/9g2fSbyCYAywY
         OLuQ==
X-Forwarded-Encrypted: i=1; AL+hErFiHrXlBdzWl2/tOye5sLPJLwFvUim3vkP6cHgPFgOM6qWuORdnSn/mlJIrXJpqhak+vsM1ObLxHaRKePhraA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5IhrBjhlXCCU6e/oJKKj1GwLrP6keQBEdDxHG9bv412mCoRjO
	MjD7WXCF6J6KXnycpd+zY7P8/w+GjRiEAfAQlm+ycwfLo3rrQFK8qI3U41IU+qsO
X-Gm-Gg: AYBFou2BfnsqmGUQnLrXylSmTHnVxvib50izd+oR+NJsMukC60op5RBXi439rOqJTqc
	lDvNFUrsQ9mQzjYdwZXcD6XTb1HkV/WhqkXCSsSVkJjyAiqlx4VC57YViHnlfb/sLF0Ulrpn6ZJ
	nPLVt7pDWbKMOKkW8HN+/pKvivMGnwOjeuaZFRQt7IySM+XUd/bqRYAf0aW7uhdvvz+Abxn2V/c
	e0RbWXUdTszJrLXM9v3k8AI8mny420yxISWv/rMytP+JCL1am55qvRcHrAk+Ij+rCZwC74dgqDL
	6iimJuoc04Fmd+ByswDEMFmzeX8D/bM8PU8JeYmI7krgEJMSqYHVvKihIV3ODY2DbTu4kKwKcrj
	YJ9hUNaBJ1qyEEp41Fu1EKRCmkvaa20ViCh71w+cZ7HMhJxrI3vmdzbpZoT5CQ5Wk353cS7hbot
	++lbfZGhonEgTyV2WliAYS8V9y8nlakixnOuJPoJZ5P30MK8hNVvIzczH0ENH7wxmsFebRuQwSo
	ZV1ZyfOuGYGzfKm5rLVpG2S1N+9t8nlfJbfbEyV5JmURtTh/OZ71qjqGPLfM5onNkWjb3qyzayT
	DwscQv2hPhOfBzXRIm3BtFk637GiwktVIKPPSZM4LhNzRraUy6vYTsI=
X-Received: by 2002:a05:6000:1acc:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-499c64069ddmr9415525f8f.30.1794481222371;
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm15473859f8f.48.2026.11.12.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath12k: recover from a firmware crash during resume
Date: Thu, 12 Nov 2026 13:00:04 +0200
Message-ID: <20261112110008.1229-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

On my device the firmware sometimes crashes during the cold boot of a
resume from s2idle (no WoWLAN, so the device is powered down in
suspend). Without these patches the driver does not recover: the resume
takes 20 s longer, pci_pm_resume returns -110 and the device is dead
until a reboot. Patches 1 and 2 fix that. Patches 3 and 4 fix two
oopses I hit when the firmware crashed more than once in a row while
testing them.

Platform: OnePlus Pad 3 (SM8750) with a WCN7880 hw2.0 (PCI 17cb:110e),
firmware WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153.
ath-next does not support this chip; I run it with an out-of-tree patch
that adds it as a WCN7850 derivative, on v7.3-rc5 plus board patches.
For that reason the patches carry no Tested-on tag. On ath-next
(ff4c7359e310) the series is only build tested.

The firmware crash itself is not addressed here; I am sending a
separate report about it. It happened in 1 of 64 and in 1 of 240
suspend cycles.

Tests, all on the tree described above:

- Patches 1-3, crash forced with ath12k_mhi_force_rddm() at the
  ATH12K_QMI_EVENT_FW_READY event of the resume boot: 6 of 6 resumes
  recovered, the link was back 16 s after the resume (6 s without a
  crash). The same build without patch 1 fails like the natural crash
  ("Service connect timeout", "failed to connect to HTT: -110").
- Patches 1-3, no forced crash: 240 suspend cycles, the firmware
  crashed once and the driver recovered, 16 s.
- Patch 4, two forced crashes in a row, the second 3 to 9 s after
  "pdev 0 successfully recovered", followed by "iw scan trigger":
  without the patch the oops in 2 of 2 runs, on the first pair; with
  it 12 pairs without one.

The test hook is not part of the series; I can post it if it is of
use.

Two things I would like comments on:

- Patch 2 lets ath12k_core_resume() return while the reset is still
  running. The alternative I tried, keeping the MHI devices over the
  reset as suspend does (ath12k_hif_power_down(ab, true)), does not
  work: QMI stays silent after the second power up.
- With the series a crash during resume still ends in "Hardware became
  unavailable upon resume" from ieee80211_reconfig(), as the device is
  not up yet when mac80211 resumes, and userspace has to bring the
  interface up again. That is where the 16 s come from. I have not
  tried to change that.

I used an AI assistant (Claude) for the analysis and to draft the
patches and their descriptions; I reviewed the result and ran the tests
on my device.

Vladyslav Tymoshchuk (4):
  wifi: ath12k: disable and enable the CE interrupts only once
  wifi: ath12k: do not wait in resume for a reset that cannot finish
    there
  wifi: ath12k: unregister the thermal devices of a radio only once
  wifi: ath12k: skip the links without a radio when a scan fails

 drivers/net/wireless/ath/ath12k/core.c    | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h    | 1 +
 drivers/net/wireless/ath/ath12k/mac.c     | 3 +++
 drivers/net/wireless/ath/ath12k/pci.c     | 6 ++++--
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.43.0

