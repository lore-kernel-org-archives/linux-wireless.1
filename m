Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302456;
	b=DdsfGN3Afu9Ip034kmutdWYF2fCk5W7tvaYdv4oeKYqyWR6bIQHgYq7FvBQ8csBu/NwU
	 Fwb7Cz/Zj7oyKjODySuyiXi10KXBoNE85DVe2ZwdUuYbuaSQubWXW2ox3inJVva3f8Bx+
	 Q3g4Jwh2Px+SnmMkS9m3qRHGmI79m6u6oB+juGvxDRdw76zI8aQ6tgKuL25s0WvGyH7PH
	 /pD/ZYaWkcTUPgxSloIxr+NQNl5HOSNv+St4+aIl1ymo2EahlWu+kuCCc4+LsDSxbZbIw
	 3r096WgVUGstyKmaHULUIT0HT8YqWHp1xVIF7fveB96eQ5VfYOLKBlxc9hiaN4uK5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=;
	b=3iA07FNyJCJ0FtCxJUGWXsl9SJnOPJowdiTVkAPSuo8EX6Bxjy5kZtsGqhwmhMIwnyTK
	 1Qno8Lj111d2W5PI17/vidsnZkdDexegkjzYixZCzhHEv9Op/HQtordtumXNVZzmpZG9A
	 EAMYanGrNtQZpo89Z6lgNc1FfqGIvuH2FE+tPT3qG1HnOOILbLnES0fNmZxwZx0F8Ro7i
	 r3H72JMZz2iLWc4bWF5yhZzebBsL2sdqFHOhx1Nv1gjrTB3ji7LDIMmBvTihQ0p2Tj85U
	 iZByEEnSO3xU5yYQXZ8aMDiH3STfYY9RrgHfm6xNPRmGIQK5tYvIWj7D6ua0U/EAEbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hPeTQGbz;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85C606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA85C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hPeTQGbz
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40e30c26a4so691884166b.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302454; x=1795907254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=;
        b=hPeTQGbz8hGHSFMLSylMHUdV0yOWh2Gp+4awl/dtbq1M0dC5IfwIdIcBXCF31qDv9+
         uf1eIWK9EaUPLJL4ch+99OyznrYhJorBTLmHyz3+SoDv0A6ctMPXOQsAAJCQENYKb+Ag
         uo3HVGef4YJ0NKHJ9/dqipoJ1dCncherFnnfbkNEQlzn9peiyPK6/Hju80fJIAZHFbRD
         ql4EQgathdA9CywhrqEQkZsb7oH+nM4OBqcu9oZI0hqjc7aSsAVM34IIuXNMvPKLtEzT
         ht3cxxn0gPMXA56142cipeDiPq9IPwv4FuurLAs6BbQwcGkpsZ9U3/SeIdzI/gZqtG3w
         OcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302454; x=1795907254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=;
        b=bHxVVTJl3Fibflt1a6G4jG8JVPLPkMGF+AYKzX125qCuclsxwBGCBfQKmkMEoFBHtJ
         kMdN7bdF5j1kOYUuFhpQxd3niQEHwTEiGQzsGjO9dMtWCGA3Yms7Auj4JiNzTJNX09n4
         /KKn3hRRz/gNdIeT2D7pWFJzlQ/DEtzLyk6K/5tCTb4yZpfokuie/bLiHninB76NkgZs
         4aehkrZjf3Ff1kiA0EGU3xqNDHQZCd71+35ufEy22Zneph6DfFTK1kfJUwq79x2gdgtM
         MKZ5R1DeI1krQMIpVODep8Qwym8rHKAcJtL8SQgaWQ43NPimzkJba9QUrAPHe20sFRUl
         BqXw==
X-Forwarded-Encrypted: i=1; AL+hErGslAtiiCqntKeHIK/TXWeVQApJWSAimwoULcHA3KB7qINUWN7SXjmSuA/WRqtoAAE2PZcCi32zyz0szORPKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YfVcdgb56FU8s+icDFTD4PsPTqzckfNjW3OebVWQa25lM+6qe
	PR2UeH/RWF0k2tk4zEIQtLIYS+UPohoJXrhwFdGGI9Q0u4OdpCGVW/KFMxul4E6Crw==
X-Gm-Gg: AZFdTZcVPy5PHFyAf1h2MvbnDLHVXYi8qJ48RkzFL2tGwn+tNV71WTxX36ARs2Ah9Qs
	/G9Xrp//fouTQTLY0KDTEJMNuTFdKMve5glSMI/aq4EGLMhC5XlEDxu45LOs7ApgvaZoJAEl5sg
	Y0uMmPOr7FNpp+1J9Vv6VgH0nbXTQKF0dEYZ4GVMktb/PVNsBBYmRjWNo5onN6WNSdWLjC7opgE
	aXhZiUp0duPrefnzX+Lz3YXx0u6Te+AMqDpDmYBrSxm6m0WNS/f18XkvnlhcnIe/eGo+DCyj+Ba
	vwusVaErU4iT4TXC8/rDJRClRSV6JVsANreb8kxNPTn9PkaFlO4597UhbcrN7sOPSpB9Doyooc/
	jkRizM9cwvNc2JoFpnjdTcFdDNYPb1IXozdUfLSmpe8vbCaKhYfww3xA03Kbk0oylkBg4i3lV5m
	9K6DmMMMOH8RnhJCs3oaMIpcamfg3BvLXzJRIDP8kFtQ8WTPX3sC4R5faBAIOaOrnl1/4idLwQk
	nPOCwBrp7AJXTx+qLu6nVHPUMlicnSQh+NB56ORw/blkNvcCY1E7VhtiI8I0oTHdTOLZAO2l8Qg
	Kci07OgQXGTqnaDq5iU2XpeqjplTxa+l/GWG3nGfl7eT4BoU+z3z7mjplMCjBfZ6TA/iSD+YAaA
	b+IVHk43Z6a6j4Mr/b3dGQFeMY+HXcs/PLAQBOxZ3nQOlQ2+mE4wQGfauf6WMisKzBcBKMcUScK
	bQrBGzf7P9KtznfiFk/9Scj5SYFmEpwZs4Ox1L6THYVSkPkq6bcPijCuvlI8/DoSUaDF98QLR8T
	ilfNdFlQZHV4dWGsIb7G5MKMfKobAkZBoAZKSfJDNRHNyQ67xdpySGYNCHNHZ6DQd6CH/QykQ3G
	QNOAvasI2yGRlKNtRFvRcbO6AtPHWF88lPz0ue249GxwD4BYBe+Y9fwuD1uEKVPR252a3tReK2c
	=
X-Received: by 2002:a17:906:4fd1:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c51318a03d9mr792763466b.18.1795302453260;
        Sat, 21 Nov 2026 15:07:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 00/13] wifi: ath11k: firmware crash recovery fixes
Date: Sun, 22 Nov 2026 00:07:18 +0100
Message-ID: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

Firmware crash recovery on IPQ8074 resets a waitqueue under a sleeping
WMI sender (1/13), frees radios and ring memory still in use when it
fails (2/13, 3/13), sends on rings it has not rebuilt yet (4/13), and
lets cfg80211 commands crash the restarting firmware again (5/13).

6/13 to 8/13 are Florian Maurer's AHB recovery fixes [1], kept with his
authorship and sign-off: ext IRQs disabled twice after a failed
recovery, the RPMSG Kconfig dependency the SSR notifier needs, and TX
stopped in the QCOM_SSR_BEFORE_SHUTDOWN notification.

9/13 to 11/13 fix error and teardown paths of the QMI service and the
AHB probe that the following patch relies on. 12/13 stops the restart
work of an earlier crash before remoteproc takes WCSS down: a crash
while that work sets up the rings ends in an asynchronous SError, and a
restart work that outlives its firmware waits for the dead firmware and
then talks to the next one. 13/13 keeps the thermal cooling devices
across a recovery.

Tested on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1) running both radios as APs,
with the series on OpenWrt's 6.18 kernel and wireless backports. One
run crashes the firmware once through simulate_fw_crash; eight more
force a second crash through the remoteproc debugfs "crash" file at
growing delays after "remote processor q6wcss is now up", so that it
arrives before the QMI handshake, while the host capabilities are sent,
during the board file download, during the ring setup and during the
mac80211 reconfiguration. In all nine runs the router kept running, both
radios came back and the firmware took the next simulate_fw_crash
command; stations were associated again after the last run. In the run
whose second crash arrives during ieee80211_reconfig(), mac80211 warns
once in ieee80211_reconfig_stations(), as the station state cannot be
set while the firmware is down, and the restart that follows recovers.
After the 17 crashes both cooling devices are still registered and the
hwmon temperatures read.

I used Claude (Anthropic) to help write these patches.

v3:
- 2/13: also leave the mac80211 registration and the debugfs tree alone
  in the error path of ath11k_core_pdev_create() during a recovery
  (found in review).
- 3/13: Baochen Qiang pointed out on v1 that testing HAL srng fields in
  the CE layer is a layer violation. A recovery that fails before
  ath11k_ce_init_pipes() still leaves the CE rings zeroed, and Florian
  reproduced the resulting NULL dereference in ath11k_ce_cleanup_pipes()
  on v2. The ring state is now core state: ATH11K_FLAG_CE_RINGS_SETUP is
  set after ath11k_ce_init_pipes() and cleared where
  ath11k_hal_srng_clear() zeroes the rings, and ath11k_ce_cleanup_pipes()
  returns while it is clear. The rx_replenish_retry timer is stopped
  before the CE cleanup, and ath11k_ce_send() tests CRASH_FLUSH before it
  reaps a ring.
- 4/13: the error path sets CRASH_FLUSH again before ath11k_dp_free();
  the QMI FW_READY handler clears CRASH_FLUSH only on the first boot
  (found in review).
- 5/13: RECOVERY is tested on every try of the send loops, the CE
  descriptor waiters are woken when the recovery starts, and FW_READY
  clears RECOVERY only on the first boot (found in review).
- 6/13 to 8/13: new, Florian Maurer's series [1].
- 9/13: new, the QMI handle leaked when the QMI service init fails
  (found in review).
- 10/13: new, a failing IRQ setup in the AHB probe left the booted
  firmware and the QMI client behind (found in review).
- 11/13: new, queued QMI events leaked at teardown (found in review).
- 12/13: new; an earlier version gated the register accessors while WCSS
  was down, which review showed left the restart work running into the
  next firmware.
- 13/13: new, the cooling devices were unregistered on every recovery
  and never registered again.
- Rebased on ath-next.

v2: https://lore.kernel.org/r/20261018210153.1925962-1-julius@bairaktaris.de
v1: https://lore.kernel.org/r/20260805192129.61113-1-julius@bairaktaris.de
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

Florian Maurer (3):
  wifi: ath11k: don't disable ext IRQs twice
  wifi: ath11k: depend on RPMSG instead of selecting it
  wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash

Julius Bairaktaris (10):
  wifi: ath11k: initialise the CE descriptor waitqueue once per device
  wifi: ath11k: keep the radios when a firmware recovery fails
  wifi: ath11k: keep the srng allocations when a firmware recovery fails
  wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
  wifi: ath11k: hold back WMI commands while the firmware restarts
  wifi: ath11k: release the QMI handle when the QMI service init fails
  wifi: ath11k: ahb: configure the IRQs before the firmware is booted
  wifi: ath11k: free the queued QMI events when the QMI service is torn
    down
  wifi: ath11k: stop the restart work before WCSS goes down
  wifi: ath11k: keep the cooling device across a firmware recovery

 drivers/net/wireless/ath/ath11k/Kconfig |   3 +-
 drivers/net/wireless/ath/ath11k/ahb.c   | 135 +++++++-
 drivers/net/wireless/ath/ath11k/ahb.h   |   4 +
 drivers/net/wireless/ath/ath11k/ce.c    |  16 +-
 drivers/net/wireless/ath/ath11k/core.c  | 114 ++++++-
 drivers/net/wireless/ath/ath11k/core.h  |   5 +
 drivers/net/wireless/ath/ath11k/dp_tx.c |  11 +-
 drivers/net/wireless/ath/ath11k/htc.c   |  22 +-
 drivers/net/wireless/ath/ath11k/hw.h    |   1 +
 drivers/net/wireless/ath/ath11k/pcic.c  |   4 +-
 drivers/net/wireless/ath/ath11k/qmi.c   | 391 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/qmi.h   |  38 ++-
 drivers/net/wireless/ath/ath11k/wmi.c   |  44 ++-
 13 files changed, 672 insertions(+), 116 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0

