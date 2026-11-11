Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399332;
	b=gjqopKtCKs2gB0jlXQYJn02M+0yFO2jfiPLuhyhvLY2Yp2ZxL3p8XAt1HZKl1ajqHg6Q
	 DILt33QYXgxBzgAVDjMwCSvl+LMzvEBnjPVJZliqLATcocMD1T7nGM4MjC2Lpgj6gj4JP
	 hopCr4BuwpN6vexDvPpwd6VcAQJE7hMdak+BJxYvfp2e/WK0unAPxKvMk4lLlDgc+CjMJ
	 XUXQCpJdKOYYGfYZe9c3riEnzyTOUbE9GwsER4adrBubtdGCVcYNNEGdFNlqcB5eNuwRK
	 of0SlPA08+oWH9OsqT/eKT4wTKG78Ed9tKK1sbculZ5d1yNnQh3Flo+GpWMBb9MbEGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lVBmDHMnjL5U7GbrOb1YyNqGenAKy1ovnEaXh1hi3Kw=;
	b=u3R9/YmGQwcddq7vVlSE/X5wMh5TCKfKDiLeDqIKw3whdbuG6Jup+tKm5lq2zvcFEIuH
	 o90izfM03z6MroZkj4VhOwZ5+2Dsnn9N6l490wOQk3dEDOt3u/igELf2toBW65pgZ0G6c
	 gA5o6YGptWJXIblfwm7+RKEmIGNBkoPRIIsRkxB0PeKikoLcjnvJcLBwOYzqVLkBoibOP
	 15cXwl+7vXum9pgqJk9TL2LwVjQbVGKHiqglH7a2TBcT4aUmdaFQd+Tm3sJSLUjKnexJ+
	 /0uOx4XFAgZtb5Wlp/lPp8quMWDpm1uQ4tW14xjRuN2nmW+qIF7EbpzTtAqH4t9ZZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pl+K9i7m;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FA0606A339
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FA0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pl+K9i7m
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-537548b811aso24579131cf.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399330; x=1795004130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVBmDHMnjL5U7GbrOb1YyNqGenAKy1ovnEaXh1hi3Kw=;
        b=pl+K9i7mtZHLBaArLy4R67N9k3WTJQkWKKoyWy+UFd0srrUgtmLBpQWCavcfaRFczK
         7NEHnNC4EzET8JQr5z9B1mBsElmFJvYs6o7mvKvEdbZl4oNDJIh4fSL9j3w6IHdD/HkJ
         WeKfNPyBa8HD+x6C1JjtlnM1odlPcaTg0BFIuMdzhvHvCCfjjnZyMcmjPkzF976htxmg
         PNJJ5v8NTrg1Ah3YmRTiRy20yi5ax5eVuY7sx6VOm2diTRMJG5VtdGGXw7d/hgpp9X8w
         0S42VHR/XLt8DZ7e9pHOaeQ015+RBrWNshP0sSyLtbR4BVux6xaQkf3iU1KUL0kyXkEN
         KlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399330; x=1795004130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVBmDHMnjL5U7GbrOb1YyNqGenAKy1ovnEaXh1hi3Kw=;
        b=ux69UcIX6EDQVtteGs/U4svrCR/gPeAKQp5gQFTZIvjODV6gHUTEB1SereUvrR74Mk
         z+xh05GCxg8Aa8HkSFykEIgr/GeAEthQfF63OnUP4HAixyzg3sxcUXbmq8zToADof5C1
         5ZNyI8TwBRU7gObx9UpzMzOlUlQe0xoGxDbk0HQHS/R9/+safIFcIRAZhOVDJKrSsSNo
         jQWYb7o3vgZI2WkaD9u9KD8RwgHn5M9nl0K2YlYxNYvX/sk7PHl9Q0t7Q7yTeiGxL7Ss
         rJ4qKdwF9CA73+W9v7RkjgB7jsg44iWt+Kw8zf+DEgeKcWweeYOteor3oovbCDKNrvgn
         hEEA==
X-Forwarded-Encrypted: i=1; AL+hErG2lDjjnt4AAdlJulzkrry1Gd99M7fYrRaG484gwUsP+GULZeN7GspByZuLJL9e7hTR2gA92TDVdykXk7YZWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SvBY33vNWd/5LLzPB1aLI3kFEfqRm+b4Duk+NYt1uLpNc45vg
	I5qkQSH3tygmZHuwseIB+Zt/LpDgJcpRoKYsfExS3lmJxFeko9D3UPQO
X-Gm-Gg: AYBFou0FceLH95c+qs45KcQNO3LCfnTf49ytNHFKCGmRygHrj+GAC5W5xGfbF0bywzx
	QUwkYFay5s3WOr+smb5TEWNIlAwIXOqFI1etU8aRhB2l6O/3NFpQEcQzkQC7tM26w68CWQb6RsB
	U11PkrM0bp+LPKZEtrVewR6sfbZwapLiETu5v9FZhDGusQRJW7eJJUWzQ0wYfpGQkvrAvld7KTm
	/8FssTgGtyAHSjY2BEUE8dBtP/gJ9OOkT58gdo21aNQyPz92DGT+N2W3HFzK9C+BZUBGQp5iAVF
	131CDjXdefj7vwdkKKiOWxiJt7uYNTIijG8xo//1HpmScMfHRBVnyy/Rz3/lPbHjU0ZLuaypT9Y
	hMkxN8NxkG6NQ7tYmj30NnixDoWlO1t5pkAK2h/O2PNPn8PbrHz2Djj37a/kJ2qzSdIWsqwehR7
	QYmPVwPoSqxqR2aqJQnZUg6YrAqU/XWIvlad1u0PVQb/3LRRig8goXxRnjLsqoGKL38oB6rCK/4
	mUHtszHNUTmyGhZvlSC5HbTaqnMcOWkr2/lJZH7iD1O5zz+aHumHSrR5BA0wMQcIBfL1S+uWLl1
	sAv+u0uWlJUyWa9IA20H0C+IGpecTt0VOvM=
X-Received: by 2002:a05:622a:138d:b0:536:990d:79a2 with SMTP id d75a77b69052e-556bfa39c76mr31788921cf.17.1794399329798;
        Wed, 11 Nov 2026 04:15:29 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02ca1ed7sm22042626d6.24.2026.11.11.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:15:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v10 0/3] wifi: rtw88: channel switch in AP mode
Date: Wed, 11 Nov 2026 13:15:22 +0100
Message-ID: <20261111121525.358041-1-mehmet.fide@gmail.com>
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
the reserved page build makes twice, implements channel_switch_beacon
on top of the firmware's beacon page, and times the countdown
downloads from the TBTT so that every count goes out on the air.

v10 was tested as a backport to 6.12.115 on an RTL8821CU (two
adapters), an RTL8822BU, an RTL8822CU (USB) and an RTL8822CE (PCIe)
with hostapd as AP, in both bands, the beacons sniffed from a second
machine:

- switches with counts 2, 5 and 10 and a station attached: every count
  went out in 299 of 300 switches, one count is missing in the capture
  of the other, and the station stayed associated. v9 on three of the
  adapters: 159 of 180, and three switches with a count of 2 had no
  CSA beacon at all
- the same on a kernel with PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, kmemleak
  and KFENCE: every count in 135 of 135 switches, no lockdep or
  sleep-in-atomic report; the station re-associated after one switch
  with a count of 2. Counts 3 and 50 on 5 GHz: every count in 15 of
  16 switches, one count is missing in the capture of the other
- hostapd stopped and started and the driver unbound and bound, each
  during a countdown: the AP came back. A firmware crash during a
  countdown on the RTL8822CE: the AP came back and a switch after it
  completed. The crash from debugfs starts no recovery on the USB
  chips
- patch 2: a test hook started the firmware recovery and held
  rtw_core_stop() open for 3 s with the mutex dropped; a switch
  started in that time completed in 6 of 6 runs on the RTL8822CE, the
  RTL8822BU and the RTL8821CU, with PROVE_LOCKING
- IBSS switches with the same counts on 5 GHz: every count in 43 of
  45, one count is missing in the capture of the other two

Not repeated for v10: counts above 50, scans during a countdown, a
station interface next to the AP, Windows stations, and the build that
delays the downloads. The WoWLAN resume change is built but not run.
Patch 1 is unchanged since v6.

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

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 148 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  57 ++++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   3 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 199 insertions(+), 23 deletions(-)


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.56.0

