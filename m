Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957988;
	b=rQkwXYBdEOEeeTlADkp0yjbttIoVUCzkvh9biAVJl/tH2h66SeTaMx8UdhiG+0kYw2ns
	 XmeQXzCvuQOCO+plzCPQLTvFkcCyMWk2E+jFXBZGct4+SbU0EYNn0Z2JZ9TGooiahrSw2
	 ndyBaqc0A1+X6aPtSBykMsxMFTi4IXZ2Pj0aVfRZhkKgFTt/A75UxBTVa5W0q/iFPdM6H
	 BCqe+XqPhMH+EwZ9sWEhIdPRsmjzF7A80ePd/wcyJab2kjew3SFGr9bvxZf7o6fviNMc7
	 9uZh3z+kYYV2Fj2UTA2cu9oyuO5BIBlGnqYMTJ4wJpbd4ccCM+e/FHmSPcJwOtJPFpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iu1ibECAW7kXktsNmYwPI2w8t5V2InTDz/9qjFJIBRY=;
	b=ThLEA3qE10mBJFf0KxELURvypfjWycbjHY0vGza3SHzEtUiBFgtQX0Qro6okn2uLZVW6
	 uo/HplpdQQQOMy5Sez3H8zKrO1lDv41hYYJ6nUpuP7i1x1k+CVNuFficbPXWj/xiRGhCN
	 67qTKmuKTiXbaWoP9HIPsoG8bDUUp5JWtxogqYVAI6eJHH/ss7pULZCturYWy2Yo5+bgJ
	 Bt8d8Y/++pUEkAwYZ+zURY4UCkE2L4H2d/WMFsjjxGcbiGTaZgK3Mf/M5SoIZcAACPQdY
	 /enM8KJ3lf9PNesQppPTNBn6Tz1Oimba1P8G1EHo5OSItonXru9xNRxdqkxGK4TCgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMtm7Ijy;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE12606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMtm7Ijy
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso11676465e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957986; x=1795562786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iu1ibECAW7kXktsNmYwPI2w8t5V2InTDz/9qjFJIBRY=;
        b=rMtm7IjyQKmPosLTj/7L339bc1Pj3/dNXXH4plgGIeJAz1MCbcalKP2Tvy9WJld7ap
         s5ayVJ9i3a+a2yoYfEmvUjgjuZpm+5Jy/rUWE5+jEErqugq+LPn1XKLCuMobOaNVQaP4
         8ttZE0vOrox7Rbm22lYFQIhqrnClo23RQo4KWTcw2oys85wNnrmbzA3N8TxDoPqaK8sr
         klDZxJstfN6doXQI+0B66+sfTQRD57rgZK3X3WWCpd4pV4ftbHJ7NFhfJP/rg0MKPhM1
         smFCBSLd9b1UNR1T3fYQA7RvVs5tr17PZLB9b9niRw5xh2QryS4Kq8zyfvqccEJ7IFp/
         kVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957986; x=1795562786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iu1ibECAW7kXktsNmYwPI2w8t5V2InTDz/9qjFJIBRY=;
        b=kLeRL/o5y5uwKn7wfJ0coiitDN5zL4O5aBvDoxvBVyiO2PpMxkvYlW0Srj5fkajcx5
         q1IFk9MHX/l6be5+3F8h2mTB1zlCUs0NsP1qiRoIpRYLJLYhvZZoqeWTTSxnoq4D9/7u
         PCjT/h4jJ3eCIYeI5U7IGNW+Fs8wonKaRYDbf+IJZtnyA9xCPQhF+V6RVfhE9Jpc4SWl
         LUtXxYJlN0wF1T2C3qYQSBh8PvPACx7mPb+NVE/VoPWr6WCy8VIkRnNSRKj1LliJLXBe
         2prQz/ePnG6gwyRAjnM5mFUbTdZlgd5jcjXmeV9CqH63dDJa4gIj5YHvDXlEu8vNbTv8
         W81Q==
X-Forwarded-Encrypted: i=1; AL+hErFkJAXxeQds3hrAib78OYYRXPs9Tt8TlmEjAfGfy+Cq/RtHyVokRKVR45rLZLd4SAmF+jEMEfDR6elLrh96Pw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9uCM/MqRC2+WBV4Tji6ere/CYPzWcbnfozz2LVueXN1y7g+GmZ
	jlnrkp28IVzGbwvyzHKI7DkWIFQOOuj3S5+qLw+wdhSgPcWGzV43lr9R
X-Gm-Gg: AYBFou3EJDzO0umZCIYmLA7Mvk14xRN5TPaDGoCkQQ7vQJ3d/ti3GW2GA/JdT7WLm+A
	UUT0FmzBfW7vfeb/gUUYGbR/OIvsBTeuMA8cmZgoMbO8j2WIJIBWvQf4788TjTruqPboePW9kXf
	PmnOrmArUfu7+NGnI0E7yl7AEct8X3FA1F0tVno6cNFWCH8VPbxWl6tC3MaITiQu3q9TitqzBVX
	AkIg73iwKnTGxaeog4fGBijffEa9jpj3cdrgSyZyvlHVCSYpGOmwQPk6+lMHmuixzoRWB7uGn+K
	CUjWcxIM6jPVQYMkdML/EsPUa1ByH8u4LYzpmd3RAiyKrEEgwkxuAjSwK6/qR7ElbnETk3yI5Sp
	0vbcS9496dUaLoAD0vWasuSIFbVZRnIwouX629GKK0NsQcmBa/rFahpxrA9oEwFsGCR6CJT4CtW
	Qs9+XNgDBQrqb/Mq+yWstJYxcKt07PS9vaza1tyGba01l5HkJONnWIPcztfJj9XIHtDEZrRltSw
	g/s64OfcJr3DZTzPKmgRgCu1Anf9msX62fQRPy5g6L+WRmup6GdIKPx9fTLVOvPa/CFAPiqIC4e
	6hBhhvPSpVgJ0j2TXPEEy5N+Et+AsxzOEd0=
X-Received: by 2002:a05:600c:8717:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7da17f77mr13687885e9.7.1794957986220;
        Tue, 17 Nov 2026 15:26:26 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm20013915e9.11.2026.11.17.15.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:26:25 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v12 0/3] wifi: rtw88: channel switch in AP mode
Date: Wed, 18 Nov 2026 00:26:21 +0100
Message-ID: <20261117232624.1956815-1-mehmet.fide@gmail.com>
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

v12 applies on top of patches 1-4 of the firmware recovery fixes [2];
patch 5 of [2] is superseded by commit 3f2238709f5d ("wifi: rtw88:
clear RTW_FLAG_RESTARTING on stop and start failure") in rtw-next.

v12 was tested with [2] and the mac80211 patch [1] on top, [1] is in
mainline now as commit 12f97c692dcb, on a kernel with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP, kmemleak and KFENCE, on an RTL8821CU (two
adapters), an RTL8822BU, an RTL8822CU (USB) and an RTL8822CE (PCIe)
with hostapd as AP, the beacons sniffed from a second machine, on
rtw-next fb51e39dfaea:

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

The RTL8822BU and the RTL8822CE ran again on rtw-next badf4c3c7679:

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

Not run for v12: Windows stations. The WoWLAN paths are built but not
run: after a suspend the PCIe card of the test board is inaccessible and
the USB adapters are probed again. Without the series as well, an IBSS
interface stops beaconing after a scan. Patch 1 changed only in its
commit message since v6.

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


base-commit: badf4c3c7679871a50cff1150f66e63187201757
prerequisite-patch-id: 61a489b0da7e1d0028cc1c72c0ecd1301f3b8ec7
prerequisite-patch-id: 5040450eb00c500bda0b95bb35bd821721f149ee
prerequisite-patch-id: 8c5c1393ce4b56fecf3238b21bd34fcdbae8769a
prerequisite-patch-id: 6ecc624d0c38a71c64993f725622e02ae2ad1629
-- 
2.56.0

