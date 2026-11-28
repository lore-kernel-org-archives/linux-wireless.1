Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850343;
	b=ohTgzd0EN/Aj5MzVPcYfoXX58aoQk6HQGi/MAzFRT3HslYGPGE1QRMCYpxxIldx9mAMa
	 zPFS61AfwiNeZe0FjQEx17qWJbY75960BrroS6D3U2Uk/nJ6kA1t2HkG+m43wweTXIq0W
	 8fRudknruNMBjBrF5EbBystFSFo8GPhCv4tyIBeOKGKFe6KEC96WOpMjvlB2GmpCxntKr
	 JWF3z2KBb9OJAwGNbKXmSQbPCngLekBsC3PCuuLhEqDyHMPQOTrOOxNMWAzJK5Iq9x9f2
	 A6LcQ+L5ujGeqoYNzTF8lgg8yi/Q1H9ShZWBAjXIOiMeO9f2mSDJZxh6LsaMNOiKIhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fo13j3+s9RRsDRAV17qcQB2hYf26hVF7IJqOAtZH8DE=;
	b=BDwO3lR7/VWzWPNyF4DL9S5U6hep3EFkR6AjHgyQpffZkmOraS7DPFGT8/RYFWcrvQz+
	 O6CheLUfi+7CN3hVWTkbGMouwls8cJPspWRaXNmn9WwnAAFj7smQXxlElg2L4UGEtciKP
	 Rclu0KMQniI4H9eGtykHONc9bEo1rhKULwmRMYSg6GujHSZreWgq3y7paRAHbQua9CgGj
	 xQ/WQ5OwtL3IptVpymJG7nw1kUxzFIO+9AWRTnUr9f42iCZ1Dts+Mt9wzFEZJ05ou7wFP
	 BV4KTcAStBppwRo9ZjKh8KYrTn1TIjXvkgNg3RiroYwWIwDN5P5gx1K3Z//GMBQlMYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3vKz8ts;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD60606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD60606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3vKz8ts
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso32893085e9.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795850341; x=1796455141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo13j3+s9RRsDRAV17qcQB2hYf26hVF7IJqOAtZH8DE=;
        b=B3vKz8tsoJBpC/LbmlQET8y+B5FIS9y8LcCZ9cBKkHWpFtAi8UpagceNlR4Z/WUE9j
         9gd0+Bs2U7XZyDLfVH6CmD80Tql9QyedRQ4oSOJNE6DidOR7gifTNPJN4Yqo8wDlBkT+
         hEBEITeK1VNRKhy1cEVgYEezCSIUptgIKOFMe/m4Wf30eCX/fpB9loILNte4JHmWgpwO
         I1Tv4IY8AxNCk+iR5uHYcj/oiqzBifhXoTQCGU2ieo9BLg829gjU1RvQytxJnaHQgFks
         H5bcftMDpu1XG5369GC73j/trjWu2FwlOLF5/ltFvvWxKUgJXmxsJ2ZRhLUBEwDML9NU
         R2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850341; x=1796455141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo13j3+s9RRsDRAV17qcQB2hYf26hVF7IJqOAtZH8DE=;
        b=jKEb3agB9jT1FBBohjU7yyLaWprMQD1HYlYpXj8OPZTR8zdWcma0T/n4y+FqXDeZ4h
         y2seUo/gYa0PcxHftJL+IiY7vIMSS3GNeWdScP3Bk81UKUteN+W02f7+mO7qLmTtcf8W
         qglTFNqVDAOlwNFjcikcr3+CT5YeBvLMJQxnS5kwu+tzRx2gDXHpWBCXqkwkbdqHea9C
         uVIR44R5n0uAuIsU1r3WsQqOhWfen6gfX1FIkTtBPLCEYJMj/993/rwLjZFgy5eLVUdU
         ugqkZQ0RlYr8dVI3Ma5oF+tAc5SvgPDwyAtqtdiVKNF8hdkylo9EfVCLNzcbyFZF7XW1
         yo6g==
X-Forwarded-Encrypted: i=1; AL+hErHKMGoQKgjKayvSUVqkYTidbApvvHJQFcwt9VwmeKZ/Jz4HEHpywoheST6GcXafAwLG/H0bZ1qj+uxXCTWv2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LKO+X8/sgZv7ghYXTEgqLgaUFjXl6J9WknRJhe7lw3HzSTa4k
	xiffFODLY565Ozrj89TabtbbvAaXWXrM0DT9jW94ws4lhBS3D0z/uvOQ
X-Gm-Gg: AZFdTZcAw7RcMH+wpSXw35tRfF/Mmeu4LhBBVlcOUc5msHMFCM6JgPpajZV5tyCvlCO
	ieIN73BvDoVbJPvEYi3lUD/ALB6u9PecZC8KDPWU2a+Jc0ugWekQi9RUJBLFEP23UIw2HXArUbC
	pPA/gB69bzWZyZRmOEkIdskeXlcyIC19ACO3Ds+CQqAafOVizheD8XE7d+hjWOkHMqr/kupAV15
	nzLfFDl9aoWxWnlNUut0PHnqwR9WVbYXqE/Q6BwKBnpdNZmftJ/hi1i+Xv4BsLzYKyAXVaI02Tg
	ueulYxL/s4dYFprAZnv/yCpQhf8kic7Io4AeQXnLlQduYy6YOhCpU3ijrJ4/4KgGbQW0OsnFX3I
	FX2mVt7qv3/+H1M7618SCo3G/R7RrCP4iHD0S7s18Qg7dmuUYKWdiWDxQ5AJesWEWtW1q60lePG
	8eh/pQ5noSKQ0EFD9WHEUbHrbMh+bLm9MXnHPd15Pfc23gdGUDRxZN1fz7ccPvNUbcVivo4cEvU
	6SpHHMlVtge7Uweqco9IlWZMbXfp/GgGrQniVu36Xq7wtS+OOQKQsGTigZhe5BMdI5gwr3DtyuY
	5Y+wNdFaJwD2AdJaeX1DYfMoa4s1ywykals=
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr566290025e9.4.1795850340354;
        Fri, 27 Nov 2026 23:19:00 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm748649545e9.10.2026.11.27.23.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:18:59 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v15 0/3] wifi: rtw88: channel switch in AP mode
Date: Sat, 28 Nov 2026 08:18:55 +0100
Message-ID: <20261128071858.42275-1-mehmet.fide@gmail.com>
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

v15 applies on top of the firmware recovery fixes v4 [2]. The refresh
in rtw_ops_stop_ap() relies on rtw_core_check_sta_active(), which [3],
now commit 2edf54bca623 in rtw-next, makes find a station without
allocating.

v15 was tested as modules on an rtw-next 04c998418722 kernel with
lockdep, kmemleak and KFENCE, with the mac80211 change [4], on an
RTL8821CU (two adapters), an RTL8822BU, an RTL8822CU and an RTL8822CE
as AP with hostapd, the beacons recorded on the old and the new
channel:

- 300 switches on both bands with counts 2, 5 and 10: the AP switched
  in 299 of 299, and every count went out in 293, 290 of 298 with v14.
  No lockdep or kmemleak report
- a count of 5, 20 switches per radio: every count went out in 97 of
  100, 94 of 99 with v14
- beacon intervals of 19 and 30 TU, test builds that fail or delay a
  countdown download, and a firmware crash during a countdown: the AP
  switched in 83 of 83

The RTL8822BU also switched 33 of 33 times with its station on a
Colibri VF50 (ARMv7, v6.12 with the series backported).

In IBSS a countdown leaves more beacons off the air on a busy channel,
because rtw_fw_write_data_rsvd_page() turns the beacon function off for
the download. Not run: Windows stations, and WoWLAN with a countdown.
Patch 1 changed only in its commit message and comments since v6.

v15:
- 2/3: the CSA state is in struct rtw_csa (Ping-Ke)
- 2/3: the countdown no longer starts again after a WoWLAN resume, as
  WoWLAN covers only a station interface and the restart was never
  tested (Ping-Ke); it still stops on suspend
- 3/3: Acked-by from Ping-Ke on v14, only the field names changed
- rebased on rtw-next

v14:
- 3/3: the margins scale with the beacon interval, a quarter of it up
  to 10 ms, instead of skipping intervals of 20 ms and less; no step
  runs less than 5 ms after a TBTT, past the TBTT hold time. The commit
  message says that counts repeat at short intervals over USB (Luka)
- dropped the comments that repeated the commit messages, reworded the
  commit messages
- rebased on v4 of [2]

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
[2] https://lore.kernel.org/linux-wireless/20261121191528.591334-1-mehmet.fide@gmail.com/
[3] https://lore.kernel.org/linux-wireless/20261118104738.2020747-1-mehmet.fide@gmail.com/
[4] https://lore.kernel.org/linux-wireless/20261117153154.1804945-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 184 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  41 +++-
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   8 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 223 insertions(+), 25 deletions(-)


base-commit: ae6b9e98b9045e47f609ec2a8197a3f3109627cb
prerequisite-patch-id: 47beb21885d08f8f2930508b06f2612a87693d4b
prerequisite-patch-id: 37af73660914a3099b8dc3815b65ae5bea30190b
prerequisite-patch-id: 966252aa5c7435e4ed3642513e458991d298efa2
prerequisite-patch-id: 6ecc624d0c38a71c64993f725622e02ae2ad1629
-- 
2.56.0

