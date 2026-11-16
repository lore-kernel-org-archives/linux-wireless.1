Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813596;
	b=Ct8hR+KLiIvOKwnPwHF/4MUTkraC4h4ys9ZB4SVEP0YL5IgVLkNMa03f2Nj6hvlUgQt9
	 HeRQ0wV5+/a/6F+qqm5KI+d9ZIX2Yqam6Ew0Wbm59EpuIMSyA4DiFltt/p8p1iehaO50E
	 9ZxFimLqY9nLDBsaTsp0eY0hBEacvuYs3bSDDpwqbHu5ifGMkERJAzCj98yUAc+qiflkn
	 IZuljzYGoksGg1Y36Hk/TcVZeyQ1tMfWtWoIWmXa69jrsu9r+Mcg+aF8KePtTTJu9qjNp
	 AD++YgMExzTqidftzTbYcaVqji+RkhZN9gWKQpHzt5LYM2mmgmXTrU92mfH294pKhoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6fUFjNvngh9LrEKnH05LWDAnRKzHtbkSWRajJAYdKYs=;
	b=Yl/3Adw9IaZhLWOsBuiyLgC4aPDGohuVfNkpB5aU6ua/aDzlyBDPuwQzFRAaea4NdwSf
	 ZGAIeqTutrJrloff3rgC+8ZZFLWejAimH0GsmmNWVhPygiDrdHBsK63Xm2Asg0wIWvvKB
	 GMR+QcHFYfzTutUXodW9o8AjCocWZtKEYf+HDiyDcTB3UXBzSXYVCcHSNEh3hHnDnC0cK
	 rtLgswvopAOsN0ljjrGqlXGT7vxmmIZSXGMJ4FZtjBLxuWg1e+ruaNId3mWCKyT5Fdz05
	 IIkI4EQj6qbgS2gSK0rpb1lUnsm+zol0gfMleAG9R6G0QM6BvfQQSAB4iM3t7GPeqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvdHmsa3;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76043606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76043606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvdHmsa3
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49d64a88222so1170050f8f.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813595; x=1795418395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6fUFjNvngh9LrEKnH05LWDAnRKzHtbkSWRajJAYdKYs=;
        b=tvdHmsa3RqQzzItwTcqoaUlDZP1vsQYIzfyWx29KCjAzT1+DZKgNbb75Jw45T3p+G0
         9zeXmitGbny8p+veIvC7VG3UKzGn3wj9hAENBWe/I45jTqPW/RmeCu0ueqrtUcOhqybY
         1rHvz9CIOjp9v4Z5YRgeVCwVSg4f4exVUkGO2uZNRCKfvIFq39hgWNpMNCbUIj1uhOJN
         o7CRFPC2SRct6QQ8D2JDd2CIOL8BIz6z5cwrGMuUHlzwIqnkKW88mrUh+AyLRLuEAV8K
         NqICGCb1utWplE5Pr66bVgZLBhfbWh7R9iNEYem1Zk4yBPDFBp1FYNl3GfbGrx9LikgE
         IO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813595; x=1795418395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fUFjNvngh9LrEKnH05LWDAnRKzHtbkSWRajJAYdKYs=;
        b=jAU5I9W4MT1sTSjzzy0p+XLKalfPPZRsFobgCMS+DzaBokLi/VeNESCmg7wAeoZkFD
         MvanVSS3izPqjoucxTdySnrNUsS7HinyqyNjyzGeJmN5iP8cysA+Re82Q05vZK2Oy36K
         o1Mm7fZ3yHbwRc3FWEibSPQD8JdfIPb9npqGfIYWSNknyRQScVWBbgolP9eSJ3CTPy+Y
         9PObvjq36Req6oGXofSyu+tRwA7Rv1teTZPDHFQM0ScFXwVQvDh6/MdlTv247vrWgdDG
         +5R7TWSTeHW49hVahRpTqzqOIXBpzJ5ukVxSRrcfHxljTmWqAI9VkGkywx4XtM226QnY
         SZZA==
X-Forwarded-Encrypted: i=1; AL+hErHBzZnSrYwhU08uAn2zDu+zIbxYVmn5MxBAtqh03PTEspL3TS87zfVRzIWVIfFUGNr+3xfi3d7R/hPM4X00uA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sDR0QtvPVP52wa03xCEWmUwIa00350c6/s5k3xKKYBbnP6Lap
	UpYNGSHykL5Q77S3jMqqEaP6rTcDJVkgHz8msjcgY734lGNvLTbHQ4hJ
X-Gm-Gg: AYBFou0fijiviV+Gxuuuks4TyEMv9KtY1vO+wpJhAey3o0f99W7JbrC6EtwLtFpttKa
	eu2I/5FP5ewHnkwTzBj/LpEIPdIcL378utBQB/glwv7wN0aqHQ/Bhq+qXUbHwbCI9Ym4YRzvGa7
	QPJ/3ijXSG9JOwpVVndqCWNzn8YYomkg+FNgJMOa05ZMeaQz7mqAbKn5Bw7Kkpvh3dF5xfJHA1A
	e+CHhgojE58Mc9qLAAXNVsLZn1btQMuvcqCPe2hluGGQLVYTJTcx4/OyNQuF9GppfWRZUZvKRwy
	LEI1i16vClgB2d2gZHetxFSnTqvjumzhpIqQzXkI6IUgM4Hldtz7BKGTin0UOgGAMmIT0dFg8dp
	X1YgzZaBvM80US+57wD7rE5eRFuehbdpLRwiAj+EfWbIYzr0sItCq87LxVqw6HTsjJn+kmBpUui
	lUuP+QMBQlN8ZlwBWp4rNo6fOeki/p0oFSHr+8oRvRu+wbOKAK15yOZjX/p9l/qmyZyj0oPZy6S
	LbiU4hEz540oz9pTsANrf+HetatBzpRxMwmY0Ek4ovrBa06fO3lnGC4ubkj5M7YrdQUuPYb4kj6
	LEJyElqXcilJ0DB4GK8JijVUiUG50csL6qs=
X-Received: by 2002:a05:6000:29ce:b0:492:9c9:65de with SMTP id ffacd0b85a97d-49c6f5e833bmr15074795f8f.5.1794813594542;
        Sun, 15 Nov 2026 23:19:54 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm20756980f8f.10.2026.11.15.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:19:53 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v11 0/3] wifi: rtw88: channel switch in AP mode
Date: Mon, 16 Nov 2026 08:19:49 +0100
Message-ID: <20261116071952.1142013-1-mehmet.fide@gmail.com>
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

v11 was tested on rtw-next with the mac80211 patch [1] on top, on a
kernel with PROVE_LOCKING, DEBUG_ATOMIC_SLEEP, kmemleak and KFENCE, on
an RTL8821CU (two adapters), an RTL8822BU, an RTL8822CU (USB) and an
RTL8822CE (PCIe) with hostapd as AP, in both bands, the beacons
sniffed from a second machine. No lockdep or sleep-in-atomic report
came from the series:

- switches with counts 2, 5 and 10 and a station attached: every count
  went out in 148 of 150 switches, one count is missing in the capture
  of the other two, and the station stayed associated
- 240 more switches with a count of 2 on the RTL8822CE, the RTL8822CU
  and the two RTL8821CU: the CSA beacon went out in all of them; the
  station re-associated after four, all on an RTL8821CU on 2.4 GHz
- 200 more with counts 5 and 10 on the two RTL8821CU on 2.4 GHz and 60
  with counts 50 and 100 on all adapters: the station stayed
  associated in all. Of the 4380 beacons of the long countdowns 21
  are missing in the capture, as many as without a countdown
- IBSS switches with counts 2, 5 and 10: every count in 75 of 75 on
  5 GHz and in 55 of 75 on 2.4 GHz; 60 more with counts 50 and 100
  ended on the new channel. No count was skipped, one was sent twice
- hostapd stopped and started and the driver unbound and bound, each
  during a countdown, on every adapter in both bands: the AP came
  back. One unbind hit the "Have pending ack frames!" WARN of
  mac80211, which is there without the series
- a firmware crash during a countdown on the RTL8822CE: the countdown
  goes on from the count that was on the air, the AP switches and a
  switch after it completes. The crash from debugfs starts no
  recovery on the USB chips
- a station interface associated first and an AP started next to it on
  the RTL8822CE and the RTL8822CU: mac80211 cannot finalize a switch
  of the AP alone and stops it at the end of the countdown. The
  reserved page then holds the frames of the station only and the
  station stays associated, in 9 of 9 runs
- scans during a countdown, from an IBSS interface of every adapter in
  both bands and from the station interface next to the AP: each one
  is refused with -EBUSY, a scan before and after the countdown works
- an IBSS left during its countdown and joined again, with [1]: the
  countdown work is idle, a scan and a new switch work

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

Not run for v11: Windows stations and the build that delays the
downloads. The WoWLAN paths are built but not run: after a suspend
the PCIe card of the test board is inaccessible and the USB adapters
are probed again. Without the series as well, an IBSS interface stops
beaconing after a scan. Patch 1 is unchanged since v6.

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

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 157 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   4 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  56 ++++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   3 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 205 insertions(+), 25 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.56.0

