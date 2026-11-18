Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043985;
	b=rh9eyBmuImQmB3nRaPXodN6zznjJyVZHh4YLmJwHVVzen5IlEQmsBeIqsBFoOKwGPTae
	 FdobIodhsg3GIJDxUWEAdEvsaPu2Z4iaNY8PZlnRFxOXpESwq5gFENfjjGfAeefeBOTYJ
	 JXWiQvGtn7D7YgCg6eNtROtH7M96yot6LIRsguS3NLlfd/zSoA7EKrWMjz1FOjZvGscC6
	 kbcHTvdZ3ewL4ZJnA7KVw0o+vCA6ukeQtS2VjiuV1JUeiJs/cismgGJ77AciCE4RUdcFP
	 SzMa4QkRcp8eCGmj62GncfXRbOkxAeRYU7yWesjALZSV0/eLneKMg6F4JGelSZ58Sxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iF500fEx9zRvyFaQS+psGebEjT+e2HFBuei2dQEUamE=;
	b=t0RTQX71fqExhUAt+/1MQtCN1N6ajzkkHY3ekovlatn/2F+YpE+Pzix9Ams0vutU6Z0z
	 iWKqPp60YjoQtzGyXnURo7EIIbrCUm8NDhY6NS476E0Pf2IjbBXZlGq8xkbafOdj1bfgX
	 y2wYMl/MOBsJjgqMp5MtIDwaXv6HbnS2a/SXlfaBg22ia06phHRCu0gSCxfxkg4AGnA97
	 bGN3sxGc6UpuD1r9RDly7SHCjMbzzeLtF1+duSH+oGyJPsOF3wJSO8zFh5jRR8+VUlHRt
	 UzRGm30LScTJa+qiE79FitqbHUS5yVcNf+37Kpdjp+gx4WEV3IUF/nHMxEGuTABPR8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMyOlTI9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF83606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMyOlTI9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9374655e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043982; x=1795648782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iF500fEx9zRvyFaQS+psGebEjT+e2HFBuei2dQEUamE=;
        b=kMyOlTI920aA0/taSDClkukJT6nuBq2CMHn553GyA9YbEYNtTiy2bECmdSFTLjNk8n
         B8vvJ+Wq/7ME7YNBogIPrWQvICnDn+caOp8+M7ICtQiM3cqPTzr3+PyNAYi3QZ3pWHHz
         Ygqy4I9Z7Bqh+MW6U6GxNnWM4161Fo+0t3v5vdPLJ4cF442FjijZxSI5l1MHuTex/HZK
         JVV1uBzTt3GZghp1Ir3BFa2m2wrx6OVrSH+UtuftJ7fjvV4LK1v3aZ1eix19ybPpOc2/
         lQAkgc+wthwT12fYeiTNXne443BDqZnko0zuSVNnHPY6VuYsuZ1K+nkZu0xFUJHg66Tf
         hCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043982; x=1795648782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iF500fEx9zRvyFaQS+psGebEjT+e2HFBuei2dQEUamE=;
        b=rNiocKeNk8lXVIxraEH3tmahkeXIvWaKFTzR5lLI5aH8r4TiUthZ2Jqy6PY4UMK2Z1
         GD6Kh2RTn3h8YMxGFm4gjBi2DzZQKoB5Wl4J63ZWCnmb1T3TwfS6OQfzjlStamTpHw95
         Feo5mfXeudmId6cdCe13SynxWZ1NM5pxt+RsDJqvYMxgmHHEbqSu+WfedZ4c+6Abs/MB
         BuUX02CBotu4WKoHKCt/l8nRFEK5VpJ/3f7QLA9VuciBf2uhTgiQb82Nd3CjOp2eOSxT
         Chm2Su/frdEXAufk14LslMNfdOjKc7FTSR+++/XWsQN7X7cE8PhqqDHiDcVW/QPzz/Ks
         JV6g==
X-Forwarded-Encrypted: i=1; AL+hErGnGKpI2056vsnKXQiNgTDkhK04xIJLLL/N2v17BM/FAgvOwxu1HT7pldU+zzuzq2arYgyh4OMzlCW3jEwQIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z90dAl0FP/fFlhWhXYvKq93Kg1GhBx+JVZA5x9Bk1qROKeyNUBl
	R5gEhib4rC5L/vT+CRg4UTQPF1t5sYljsVlWR7pOe0ujSyy4Ga5cF9Z1
X-Gm-Gg: AYBFou2sgrqm/uS8SdpDwkrbTRlwz+5/ijO8wvSHpHcBJCttqvVj1l5/t/6F96jMB+F
	b7LJati00D91sakNCZEZR7hyjzVIOP/YlAzbl3VQYHOFpahT8oSIjjppZ5Ep3znXKECyMD/bjv2
	AsAe8jb40imm5jxwSz5+ta5QuNPDDYgys0ldslyKspwe0BZq7nSWU2QLpplRuf09LRHvbb/8P2D
	lJRQRnAe0cSTMihwOBfmzEs6mobuNseX+RvwK01ySLemNeJwk/uIKjhL1lbLuMWNCanZ99QkAVD
	w5Xl/cW1j9eEqCLOqC8Nog/3mc7a0kS8J9DosvMSfgKYUhaf9yxLx1/SDjFis3zdXDonN+x6H9k
	IvBvF5ZOiFSfl+uEfDE6zPYvy4/+j/ixlKwuY7gKD/Od+kbbdnOn2RMBJZEcNdfvCaghaNcFyla
	LtjiPvXneaByJadkWiSBsGF9tLKzj85fWzDNWUsEBF7F6NUHjA7xuatWZu/3vPLgHG0JeLLBsV7
	OnFDQhQskgORgtPDghA+JqoXVVOs+egSyX7dXvsblZqsIwQe1carK4cFEPNI9ABMjgsPMYb4+Fe
	EM/E0d1d0vppdp3F2k+oK9MnLtlC2aXzHfM=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr95260255e9.11.1795043981916;
        Wed, 18 Nov 2026 15:19:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb842f9348sm5966095e9.8.2026.11.18.15.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:19:41 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v13 0/3] wifi: rtw88: channel switch in AP mode
Date: Thu, 19 Nov 2026 00:19:37 +0100
Message-ID: <20261118231940.3950-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

An rtw88 AP cannot change its channel: the driver does not announce
channel switch support, so hostapd's CHAN_SWITCH is refused and the
only way is to tear the AP down. The series fixes the beacon download
the reserved page build makes twice, counts a switch down on top of
the firmware's beacon page, and times the countdown downloads from the
TBTT so that every count goes out on the air.

v13 applies on top of patches 1-4 of the firmware recovery fixes [2];
patch 5 of [2] was dropped for commit 3f2238709f5d ("wifi: rtw88:
clear RTW_FLAG_RESTARTING on stop and start failure"). The refresh in
rtw_ops_stop_ap() relies on rtw_core_check_sta_active(), which the
separate fix [3] makes find a station without allocating.

v13 changes one line of patch 2 and the order of a declaration. It was
tested on rtw-next 0bdc579dbfc2 with patches 1-4 of [2] and the mac80211
patch [1] on top, [1] is in mainline now as commit 12f97c692dcb, on a
kernel with PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, kmemleak and KFENCE, on
an RTL8822BU and an RTL8822CE with hostapd as AP, the beacons sniffed
from a second machine:

- the regression suite on 2.4 and 5 GHz: beacons, association, scans,
  a hardware restart, rebinding, a firmware crash on the RTL8822CE, and
  36 switches with counts 2, 5 and 10. The AP switched in 36 of 36 and
  every count went out in 35; in the other one a TBTT went without any
  beacon, as one did before that countdown, and the RTL8822BU lost
  4.4 % of its beacons in the beacon test of the same run. No lockdep
  report, and no kmemleak report from the drivers
- a test build that fails the download of the count of 1 in a countdown
  of 2, with an off-channel period of 40 ms started 0 to 160 ms after
  the switch request: the count of 1 reached the firmware before the
  switch completed in 20 of 20; with v12 the switch completed without
  it in 9 of 20. The air captures cannot show it: after the off-channel
  period the AP kept sending its earlier beacon with v12 and v13 alike
- a station interface associated first, an AP started next to it and
  stopped during a countdown of 50 on the RTL8822CE and an RTL8822CU:
  the station stayed associated in 4 of 4

v12 was tested the same way on an RTL8821CU (two adapters), an
RTL8822BU, an RTL8822CU (USB) and the RTL8822CE (PCIe), on rtw-next
fb51e39dfaea:

- the regression suite on the five adapters on 2.4 and 5 GHz:
  beacons, association, power save, scans, a hardware restart,
  rebinding, a firmware crash on the RTL8822CE, and 300 switches with
  counts 2, 5 and 10. The AP switched in 300 of 300 and every count
  went out in 296; the other four were on 2.4 GHz on the RTL8822BU and
  the RTL8822CU, which lost 46 % and 2.4 % of their beacons in the
  beacon tests of the same run. One missing count was the single CSA
  beacon of a count of 2, and the station lost the AP. In 30 more
  switches with a count of 2 on that adapter every count went out, and
  in 29 of 30 with the v12 of before [2]. In two more switches with a
  count of 2 the station lost the AP although the sniffers heard its
  single CSA beacon; the same happens with v11. No lockdep report, and
  no kmemleak report from the drivers
- a test build that fails the first download of a countdown on purpose,
  with counts 2 and 5 on the RTL8821CU, the RTL8822BU and the RTL8822CE:
  the AP switched in 30 of 30 and every count went out in 25. In 15
  more runs each, the v12 of before [2] and this one lost counts in 2
  of 15 each. With v11 a count of 2 switched without any CSA beacon in
  5 of 5
- the same build holding the first step back by 95 ms: the AP switched
  in 30 of 30 and every count went out in 27. With v11, held back by 90
  to 100 ms, a count of 2 switched without any CSA beacon in 10 of 12
- an IBSS left during its countdown, without [1] and with a monitor
  interface keeping the radio up, on four adapters: the countdown work
  stops and a scan works; with v11 the work ran on and every scan was
  refused
- a station interface associated first, an AP started next to it and
  stopped during a countdown of 50 on the RTL8822CE and the RTL8822CU:
  the station stayed associated in the 5 runs in which it had
  associated
- an off-channel period of 300 ms during a countdown of 20 on the
  RTL8821CU: the AP switched in 3 of 3. The beacons after an off-channel
  period are partly missing also without the series

Every count missing in the first three items fell on a TBTT at which
neither sniffer heard any beacon, as happens on these adapters without
a countdown too.

The RTL8822BU and the RTL8822CE ran v12 again on rtw-next badf4c3c7679:

- the regression suite on 2.4 and 5 GHz with 36 switches: every
  count went out, lockdep stayed on, no kmemleak report from the
  drivers
- a firmware crash during a countdown of 40 on the RTL8822CE, the AP
  alone and next to an associated station interface: no lockdep or
  DEBUG_ATOMIC_SLEEP report; the AP alone ended on its new channel
- a firmware crash with the hardware restart held back by 4 s in a test
  build, the AP and its interface stopped in between: the restart flag
  was clear afterwards and the next crash was recovered, 2 of 2

In IBSS a countdown leaves more beacons off the air where the channel
is busy; the count goes on after each of them. With 20 s with and
without a countdown taking turns on one channel, the beacons that no
sniffer heard are, on 5 GHz, 1.9 % and 3.5 % of the countdown of an
RTL8821CU and the RTL8822BU against 0.3 % and 0.2 % without one, and
none on the RTL8822C; on 2.4 GHz 6.6 to 12.1 % against 2.7 to 7.2 % on
the five adapters. An AP shows no such difference. The cause is the
beacon function, which rtw_fw_write_data_rsvd_page() switches off for
the download: left on for the count steps, the difference is gone on
5 GHz, but one RTL8821CU AP then lost its station in 6 of 110
switches with counts 5 and 10 on 2.4 GHz, and in none of 100 without
the change, so the series leaves the download as it is. The TSF
stands still for the download as well, 2.8 ms on the USB chips and
0.3 ms on the RTL8822CE, so the beacons of a countdown are about
105 ms apart on USB.

Not run for v12 and v13: Windows stations. The WoWLAN paths are built
but not run: after a suspend the PCIe card of the test board is
inaccessible and the USB adapters are probed again. Without the series
as well, an IBSS interface stops beaconing after a scan. Patch 1 changed
only in its commit message since v6.

v13:
- 2/3: beaconing that is enabled again keeps the retry of a failed
  count download, so an off-channel period after a failed download of
  the count of 1 no longer completes the switch before that count
  reached the firmware (Sashiko)
- 2/3: the declarations of rtw_get_rsvd_page_skb() in reverse xmas tree
  order
- rtw_core_check_sta_active(), which rtw_ops_stop_ap() uses for the
  refresh, no longer misses a station when an allocation fails; sent
  as the separate fix [3] (Luka, Ping-Ke)
- rebased on rtw-next (Luka)

v12:
- 2/3: a failed download of a count is repeated before the next step,
  and the switch completes only after the count of 1 reached the
  firmware (Luka). The work steps with the count that
  ieee80211_beacon_update_cntdwn() returns and no longer calls
  ieee80211_beacon_cntdwn_is_complete(), which warned when the AP
  stopped in between (Sashiko)
- 2/3: the work never clears csa_vif, and rtw_ops_stop_ap() downloads
  the page again whenever a station interface stays (Luka)
- 2/3: the countdown stops while beaconing is disabled, for an IBSS
  that is left or an off-channel period, and starts again when it is
  enabled with the switch still announced (Sashiko)
- 2/3: WoWLAN suspend keeps the interface of the countdown and resume
  starts it again, without iterating the interfaces (Luka)
- 2/3: a failed download of the replay after a hardware restart is
  repeated before the next step
- 3/3: each step reads the TSF after its download and the next one runs
  10 ms after the first TBTT at least 10 ms away; no step runs less than
  5 ms after or 10 ms before a TBTT, the one that finishes the switch
  included. A late step delays the switch instead of taking a count off
  the air (Luka)
- 3/3: the commit message says which count the first CSA beacon
  carries (Sashiko)
- 1/3: the commit message says why there is no Fixes tag and what
  mac80211 reports for the double fetch (Sashiko)
- rebased on patches 1-4 of [2]

v11:
- 2/3: the channel_switch_beacon op is gone, the BSS_CHANGED_BEACON
  path starts every countdown (Luka)
- 2/3: rtw_fw_csa_start() does nothing on a device that is not
  running
- 2/3: only the countdown work advances the count. The beacon of the
  reserved page is fetched as a template while a switch is announced,
  so the replay after a firmware recovery and the page of the WoWLAN
  firmware repeat the count that is on the air
- 2/3: an AP that stops in its countdown downloads the reserved page
  again if a station interface stays behind; the downloads the
  countdown held back were lost for it
- 3/3: the first download shares the branch of a late one, and the
  comment says what the branch catches (Luka)
- the beacon interval that stays at 100 TU on the air is fixed by a
  separate patch (Luka)
- rebased on rtw-next

v10:
- 2/3: rtw_core_stop() clears csa_vif and cancels the countdown work
  again once it has the mutex back, for a switch started while the
  mutex was dropped (Luka)
- 3/3: the first count is downloaded by the countdown work, 10 ms
  after the next TBTT, and no longer when mac80211 changes the beacon.
  My reply on v9 said v10 only drops the back-off; that is not enough
  on the RTL8822CE, where a TBTT shortly before the download sends no
  beacon and the next one stays out too, so a count of 2 went out
  without a CSA beacon (Luka). The switch completes up to one beacon
  interval later. Ping-Ke's Acked-by and Luka's Reviewed-by are
  dropped for the changed code
- rebased on rtw-next

v9:
- 2/3: the countdown starts again after a WoWLAN resume that worked,
  which mac80211 follows with no replay (Luka); Ping-Ke's Acked-by is
  dropped for the new code
- 3/3: Acked-by from Ping-Ke on v8, Reviewed-by from Luka
- an IBSS left during its countdown and joined again kept csa_active;
  that is mac80211's, fixed by a separate patch [1] (Luka)

v8:
- 2/3: Acked-by from Ping-Ke
- 3/3: the TSF read retries once instead of looping, rtw_fw_csa_queue()
  reads the TSF once also on start, the port 0 comment is gone, empty
  lines where asked (Ping-Ke)

v7:
- new patch 3: the countdown downloads are timed from the TSF, 10 ms
  after each TBTT, so a download that runs late by less than a beacon
  interval still reaches the firmware before the next beacon; one
  later than that is followed by its successor at once. Ping-Ke's
  question on v6: with the absolute due time a late download and its
  successor could land in one beacon period and leave a count out of
  the air
- patch 3 takes a TBTT within the margin before the start as the one
  that sent the countdown template: a TBTT between the template
  download and the first TSF read made the stations see one count
  twice
- patch 2 keeps csa_vif until the beacon after the switch: a TIM
  update before it fetched one beacon past count 1 and hit the WARN
  in ieee80211_beacon_update_cntdwn()
- rebased on rtw-next

v6:
- the wiphy work patch of v5 is gone: the countdown work is an
  ieee80211 delayed work and csa_vif is driver state, both under the
  driver mutex, so rtw88 takes no wiphy lock anywhere (Ping-Ke)
- rtw_core_stop() cancels the countdown work and clears csa_vif, which
  covers the IPS path and the firmware recovery; the wiphy_lock() in
  the recovery work is gone (Ping-Ke)
- the BSS_CHANGED_BEACON path says why it starts the countdown, the
  replay after a hardware restart, and stops it when the beacon comes
  back without a switch announced (Ping-Ke)
- the downloads are paced from the first one with an absolute due
  time. Queued after each download, they drifted by about 10 ms per
  beacon interval on the ordered mac80211 workqueue; on a count of 50
  the AP switched half a second after its station had, and the
  station re-associated

v5:
- 2/3 is new: update_beacon_work becomes a wiphy work, so that it can
  look at the channel switch state under the wiphy lock; it checks
  RTW_FLAG_RUNNING instead of being cancelled in rtw_core_stop(), which
  runs without the wiphy lock on the IPS path (Ping-Ke); reverted in v6
- 3/3: rtw_fw_csa_active/start/stop() assert the wiphy lock (Ping-Ke);
  reverted in v6, they assert the driver mutex
- 3/3: hw_scan() takes the mutex with guard() (Ping-Ke)
- 3/3: a comment on the association download names the STA+AP
  combination it skips the download for (Ping-Ke)
- the whole set ran on a PROVE_LOCKING kernel without a lockdep report:
  switches with counts 1 to 100, hostapd stopped and restarted during
  a countdown, scans during a countdown, a firmware crash during a
  countdown, three stop/idle/start cycles, IBSS, 50 switches with a
  station attached, and on the RTL8822CU a station interface
  associating while the AP interface counted down

v4:
- 1/2: Reviewed-by from Luka
- 2/2: the countdown work is back in the device, initialised once,
  with csa_vif naming the interface; no interface iteration and no
  lookup through the reserved page any more (Ping-Ke)
- 2/2: the countdown is cancelled before a firmware recovery restarts
  the hardware, instead of guarding the work with flags (Ping-Ke)
- 2/2: the page download on association skips a running countdown,
  like the TIM update and the PG backup (Luka)
- 2/2: the scan refusal comes before the scan offload test, so that
  firmware without scan offload does not fall back to a software scan
  during a countdown (Luka)

v3:
- 1/2: the beacon out-pointer is initialised in the caller (Luka)
- 2/2: the countdown work lives in the interface, remove_interface
  cancels it unconditionally, the queue wrapper and the comments are
  gone (Ping-Ke)
- 2/2: the TIM update and the PG backup on set_key skip the page
  download while a switch is announced; every beacon fetch advances
  the countdown (Luka)
- 2/2: the commit message names the refused hardware scan (Ping-Ke)

v2:
- 2/2: a hardware scan is refused while a switch is announced
- the rtw89 mention is gone from the cover

[1] https://lore.kernel.org/linux-wireless/20261025193615.1123718-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-wireless/20261117171003.1840491-1-mehmet.fide@gmail.com/
[3] https://lore.kernel.org/linux-wireless/20261118104738.2020747-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 182 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  60 +++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   5 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 237 insertions(+), 25 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
prerequisite-patch-id: 61a489b0da7e1d0028cc1c72c0ecd1301f3b8ec7
prerequisite-patch-id: 5040450eb00c500bda0b95bb35bd821721f149ee
prerequisite-patch-id: 8c5c1393ce4b56fecf3238b21bd34fcdbae8769a
prerequisite-patch-id: 6ecc624d0c38a71c64993f725622e02ae2ad1629
-- 
2.56.0

