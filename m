Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289809;
	b=B0w0u8Tu3GV7qj/Da1CogGZR+MtcXOZC0mnJGXvCD+IsYDI3DkhDSUkvlqctDHoAimZ/
	 DEP40+c7gQIovBft2l85TTKNkpC4+CvM//kDHoyURH3wPoncGzQfHjZHLisK03x1XC41q
	 jwykrZIn0qfAZwayiCEEkq8MH4avWnV00Y4U0Csdd2aNlEiq7z/VKGCo9CxmvpZPdptHZ
	 olYmgiTqN183M5F6qYRLgEG5XAwRQKeQ/zbw6XjnHyy79aAzhIly8DZ2SyhsPGypZF+rH
	 +pmjdnWp06UrFHN6l0YMddRpB4N6pC8gcEEmNIAlxfY8BeUxxTDhijKKvDe6UwrTJ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zYdaJU4QxZKFt9mArfZJHxgjCfAoVZtUbTcwfAe0KXI=;
	b=FrZ8UZuTwgTrWaIMcdfSK7kbk6c7mZ6FUkNju1Dzeunu49ngg+kgX8tXLrJ/o7ZkY9mI
	 F949GS6p0xyZ79873lC43j6uyVQ7sa21+i+slWB4FGphL6+MAJUM2yRpWp66xTyOViwH/
	 RUxq3i/r4hcqZ2J6TfEQC/ybOytggLe6O30kse2pfvSIYghffjjHO1byEuMEEhuHX/7NQ
	 9HD0oRZOCncOflZSTWwAtuJ58uQkC6/0L/lT2+T8In3BKvauFCazWEl9Dw4W4qYm6YOQ9
	 hEsJeqwH/4ufMLgfimF6lJ+WVhikZ0O6nP09XVsY28Ndrj87ZeUj6bpYt7BwPsUBkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhpzhZbS;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97215606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97215606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhpzhZbS
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f1e5d7450so212465285a.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289807; x=1795894607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYdaJU4QxZKFt9mArfZJHxgjCfAoVZtUbTcwfAe0KXI=;
        b=QhpzhZbSgUeW1NUXdljf8NYHuB1Uh5vcrbCCQ+GBOmZQ/q3MfvoO//GbdRPKQDiAjH
         bKkaCSTWdYhR0k4+UDk2LrzgcOMf+q8593G4IjHkKQ4OeQP68244Nyj6rh41v/h3psTu
         RN2VbWeW7JwZCS+8mkslZYrkmNu7LchPd5gpC89i3k6BG4nMr9h71q5FHXc4Kaz7Hhfh
         H6F7EPuPJVMUMmwCzNe8wcBOrt25CqrHxIUdM3B4tMzSC/GoNVv3T90iHLJNlEV1BX9B
         KEKg6M/lVDLGaijYH/u7/eBUFb0RTftwIdimgkdWjv136abVOeGXxFWcA+J0K3XdWxwF
         gBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289807; x=1795894607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYdaJU4QxZKFt9mArfZJHxgjCfAoVZtUbTcwfAe0KXI=;
        b=gBerXEFhf4jdXYtn1dC1FjfVuir4yvHmbHpZIPzCZY+rKiL48BEcQvP9ngrScqsQgo
         /c8OtZUH6TmSlxiTmZoNRMZyD1QVyHLCqm4ptTJheBAx2CmVeBPvPNuyvH0GBi7Lp7D5
         /vCgxA+4gHm2R2BnEeLeQlNSlxya5LDz8spF/MXZ2trT3qlApYRhtFIuIHUVQULBFje4
         hnx+5hsUNj6b2IEWyXgOzO8p7IQ3q9a9dHd4DmGvcI8oNqUs8U74yJMIKquXiKxUsev3
         l9MkDQH1wNRusRStWB5vFNmHJvwekvy+OgDcOeYzjYmog/vRh1T2IqbF8WnjdD/diuFb
         77og==
X-Forwarded-Encrypted: i=1; AL+hErECaiMfbWZuXsZpMHFp/YLtf8E6dB3NwjzJ6JwV17v5PqASMKXL62o/G+yneB6q8KtdDcYR3n4dyGnuPGcIDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vc569Kc0a5L8fqZV583A0i5s3yzmh/Pr2NzAKdazER2yL26DX
	KI/91giUHMsBDSF6dbkrrfPT5cy3LhZDsxF9p5m5nEqDoOzmQY0WMlEP
X-Gm-Gg: AZFdTZf4xR2z0n1czZFQfciSY3cy9ED5UJDlS7A7k5A0pKz3HIBi8ENdyWJac2AjF0j
	HUL5TdJrgkaeb3o9ylcD7u3x2SlCBYsF+rtbj4seFQSsiZNqQOkV67Jf8ghNR1Tf33H4/L27c+0
	OFXucmc5fEDalI9fqvpF5XJsPtaCKuJIKUHE2kvSK9RGzc4k/i0d7bmHXJnWxv9vMcbK8ORVFck
	LRxAOfQNdPsNYD5zAWequrxZ+d4MeJ8ZQnSWaR57MH9cQlyYGyrq18dE40T9L9A9OBLfQBi43YQ
	Tuk4lrcUaQbCXRwBp0gZEL3nQiieUHR46diOR3UL/AoyBLUUSOOxovZpzZ1n/wMM+skxgt+r5qQ
	O+7Yw8xjdb0z+RPhBTXhLo3iQyQKTCulzOF7GS5qT0lXfvl4Yuhh7hXKolyy8iMutB4qy+XP9Cn
	vDtM0f91mIoFImxYPz5bYSgvzvvzWYk6uNVUD4o70iE02KLEOwA1u7VIy7xJUJVLPFyu5FROMIk
	JZwow2vnPWRGTIOrVpR5Vef7SaebZSKR/3E1AgbwosipIiddTAEyCki/5Z3pCrFBi4ATUVPMEPG
	8u6XU10zzPs4X/grx40jElGCOqWdM8vQCUU=
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr1188629885a.12.1795289807366;
        Sat, 21 Nov 2026 11:36:47 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm466931785a.42.2026.11.21.11.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:36:46 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v14 0/3] wifi: rtw88: channel switch in AP mode
Date: Sat, 21 Nov 2026 20:36:41 +0100
Message-ID: <20261121193644.603289-1-mehmet.fide@gmail.com>
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

v14 applies on top of the firmware recovery fixes v4 [2]. The refresh
in rtw_ops_stop_ap() relies on rtw_core_check_sta_active(), which the
separate fix [3] makes find a station without allocating.

v14 was tested on rtw-next 0bdc579dbfc2 with [2] and [1] (now commit
12f97c692dcb in mainline), with lockdep, kmemleak and KFENCE, on an
RTL8821CU (two adapters), an RTL8822BU, an RTL8822CU and an RTL8822CE
as AP with hostapd, the beacons sniffed from a second machine:

- the regression suite on both bands with 300 switches with counts 2,
  5 and 10: the AP switched in 300 of 300 and every count went out in
  299. On one RTL8821CU the station lost the AP after 2 of 30 switches
  with a count of 2 although its CSA beacon was on the air, as in 3 of
  60 with v11 and v12. No lockdep report, and no kmemleak report from
  the drivers
- beacon intervals of 19 and 30 TU with a count of 10 (Luka): the
  RTL8822CE sent no count twice, where v13 did at 19 TU, and every
  count in 3 of 6 switches. The RTL8822BU at both intervals and the
  RTL8821CU at 19 TU sent every count in 3 of 3, most of them more than
  once, as a USB download of the page takes 6 to 17 ms
- a test build that fails the first download of a countdown or holds the
  first step back by 95 ms: the AP switched in 70 of 70, and every count
  went out in 62 of the 68 with a whole capture. Holding the step of the
  count of 1 back by 150 ms, every count went out in 5 of 5. A failed
  download of the count of 1, with an off-channel period next to it, was
  repeated before the switch completed in 20 of 20
- an IBSS left during its countdown: the work stopped and a scan
  worked; an AP stopped during a countdown next to an associated
  station interface: the station stayed associated in 6 of 6; an
  off-channel period of 300 ms during a countdown: the AP switched in
  3 of 3; a firmware crash during a countdown: no lockdep report

Every count missing with v14 fell on a TBTT at which no sniffer heard
any beacon, which also happens without a countdown. The 2.4 GHz beacon
tests of the RTL8822BU and the RTL8822CE lost beacons with and without
the series while a neighbour AP's beacons passed our TBTT.

In IBSS a countdown leaves more beacons off the air on a busy channel,
because rtw_fw_write_data_rsvd_page() turns the beacon function off for
the download. Not run: Windows stations, and WoWLAN with a countdown.
Patch 1 changed only in its commit message and comments since v6.

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

Mehmet Fide (3):
  wifi: rtw88: download the beacon the reserved page was built with
  wifi: rtw88: support channel switch in AP mode
  wifi: rtw88: time the countdown downloads from the TBTT

 drivers/net/wireless/realtek/rtw88/fw.c       | 184 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/fw.h       |   5 +
 drivers/net/wireless/realtek/rtw88/mac80211.c |  52 ++++-
 drivers/net/wireless/realtek/rtw88/main.c     |   9 +-
 drivers/net/wireless/realtek/rtw88/main.h     |   5 +
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 6 files changed, 231 insertions(+), 25 deletions(-)


base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
prerequisite-patch-id: 47beb21885d08f8f2930508b06f2612a87693d4b
prerequisite-patch-id: 37af73660914a3099b8dc3815b65ae5bea30190b
prerequisite-patch-id: 966252aa5c7435e4ed3642513e458991d298efa2
prerequisite-patch-id: 6ecc624d0c38a71c64993f725622e02ae2ad1629
-- 
2.56.0

