Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204725;
	b=MFYX9aNSWX+RzaN6HDUaWIltQ5aM0f8DzkYcJiVHA6N7B2H2DlRp4cSWzmuI9eX571u5
	 KABfFL15ZcxTAA1tSNPcqQyqw9pDam7QhYiLpsNw10qLeKExjm3gqV3UhTYVd3W1gMhGg
	 oaIrrxsbY1Zsra4iUdNoszw0qqkL6wlYfq3lVAbHGKYWE251jJEVFx/CJwiqfDoLVjKl8
	 +XHDnkgMTeVC+lHl/i4s1a9VzaqrTP1RF+hqotUOXcu4vlKFylhfhTfstsFoazqQBLVtZ
	 eisgKhkAsii6zcigojSrbyUfi0TqGr3vI6FRtXU32plDReGL4KdBVgBaN5bLa7tD1Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=6ZfkfiTkvYQEtJ2yl27NdEzpS6SevTD5r7NaYNoF6K8=;
	b=okRsKDns7JBgs9LJ09Lvb/9hm9Btkqjlc6pEFMtvfp0zfxA+1/sn4IPLEI+cX38ydXyg
	 J+NykV+5kuLmD9dRTBlke4Fm9L8j9Y3wn50ZaYPitcDIj1bb7aNmth+0coIA4WO2T+QiR
	 XKfzv0wTbT+UqiToXul0mAIl3750Vel4b5f58wTW999xdUg7QWXYETbweskjpncYNxXT4
	 ZbFqw9I1H5tZk4O4JiT9sZf08kY4UKu/usZulZwYxZ8CQI150gIyvp/GKP78PNzCzlmgM
	 wfQi98dvn4m7k6JKXbWT9U/jxMlu49Ma1lRY19ga0NiKTwYTfeYR9B+Z3OnWPUUJJrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7GR0Dzs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9775B606A6D6
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 19:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9775B606A6D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7GR0Dzs
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38431138772so1639415eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 11:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204724; cv=none;
        d=google.com; s=arc-20260327;
        b=jZyYHEa+Cveo3aYi63z2KmWgdc0D7QpGP3bYTQ+pip50Pr4XsDSm/mO2DaIrBi2ALA
         hqxog4uvZ0mNPlYE8uOIKwPG9wVsqSrZN7HiXn8Zg4qcfNufB3TOzIyyb2Y4+BDgPS84
         Hwr5tG4e9OXiCk1f/lecGd5KwIywxQrq/A3DbxC+2jfDbxRqggPyq7LfzBVk480jzYAB
         WDEBHT/s2eS6VPu2dDIM5ZXt/hL1cGkMNmlNK4/mivIjPZhM6V8W7AxqU7j908ekzxoj
         CfKw/hPuy7hpInBNQGrr4rikDUptfoic///B/baHDeHL162nWd/loRvwr05EZA85HIRN
         5NHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6ZfkfiTkvYQEtJ2yl27NdEzpS6SevTD5r7NaYNoF6K8=;
        fh=9WldBRlRtbXZDyFR8AAB0r3m1QxMTnrA0PJPmHd+ThE=;
        b=RrRWIm+6JEEcAHW5stSE//4Qrkf+zSJCO76J3A+bBIOHhbliXCz5xufUmeUZSCb21F
         6CACAZjIpxg9POIzVr9Mm60dfHBsUBtW5zzU9+Ta60gmJToDEhSJzXmwqQJzTicJMin3
         N2Ov48vhXyo7ePtmVuQBXP/4ikk92sM19tXmTKY0EfSvrIKd1DqzaJBWw3pp/3kd7JX3
         pvZB4sm1zzP5h6Cswh2Z5ciSaUYaq3DLQf05221VUJz5J6TXy9B/Af2z9UH1wFls0/+p
         lTpJyB2rhEcBmJSi/Wl9RsLsI0guHVLk8SWC+yBIQodzVTWssp3zlCXQ+mwOVOqxAYxd
         0bDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204724; x=1795809524; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZfkfiTkvYQEtJ2yl27NdEzpS6SevTD5r7NaYNoF6K8=;
        b=T7GR0DzsNqN+dih903jftSQim6kDS8GIoSwNpMGgequZrrw3mCKHCgT1ml6CTsMmku
         HD2s4m3NkZl9W7QWbRsAZHl5vdzoYKZg3IFFKCpWtPKJmUAnNmcibfxnWaiCWC7TZkVf
         8pBl+qVoMr5K0ByhdOtDJNZb5IQDiybce/gLVrUlltD9UjW2LzksClMw3gu0J7URxEn1
         wJnCtgeSdjQPdO1ePbsWuqlRypbXG5UCq54TIf+ZnzXZoUPoaeaH0yEIwgCTO/cPWP9r
         u3+ELBN7C22lSficERqJX3cjIC64cbrFhB7pyjjrrn9VSB1gc/kgNl8b7aVg8EXhglJT
         Bx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204724; x=1795809524;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ZfkfiTkvYQEtJ2yl27NdEzpS6SevTD5r7NaYNoF6K8=;
        b=QXhWB90NCEL8hh64KC94u7+R5CrFWdFYTVkwwwCYQGDB65cw+Kr7kmIMYnyCf8LftY
         aNYDThQ+dokWIIYN5HqoxsV5CUabH34tP47Lb6vUWt19n44oMJexuyV0l/F3lzKEe0LU
         8rmxWIKfiFNcYm3m4kkm5o81LsFaGsyStvU1gwjhJBe0NgPNGzemIq1mKI3VgdlIBZEI
         H8yQUEAs5uTi8pLyxGjkaylh22+2n/dXOXPPuWuhb7ZhhD8ajTRIt7+0re1e8aHB5YVv
         rZ/0yp0Oe8ZjTtnqY2UUg75St1YHQLcy2eV8Xxck3bu0ia2yyEHjJ4D+CP3Pb6dcdq81
         zoZg==
X-Gm-Message-State: APuU4Z/JVbC9DNn7hkhXOrQ5gaThYQJHS1VqW6Ek53J1+Du1uHLiF84e
	0vGCrQDHGbNEJGk2dmVoNiB1vMpsW1iChGRDZCpR3CPiK7YmVC1cnbXJre1GaiVC1VJ7eedm7K8
	Dg7kQsQJx7uAm5RLLy9fkGspL9PENQ1AtU/yLaOl74GK+18o=
X-Gm-Gg: AZFdTZeiaslTObiQ8LaiEgHJDbd4JDs9iPJX+Lqnrx/QYarf3RdMxS1nvQeqywNMOLx
	EKVmpgDxfnoP/WR1txVa0laPOAmWn8p7XQ57ipDkkfd1Z+d74GOGEyIU6IjWMWGb4oLn1oaGW2M
	QTpNEeZDuCPlBYPcMAmLbPvQg4mJ+XUS4jVxbzRfp3DK4Cyf9lkCyGftfM74a5nkBxnTYXhpIV5
	O5ecsN/18vLt1zk4CU2CmN5+kOgz+JayY4KKGqP/H+Yhq8eYC8tj8H6EXnJv067WBytKZa1XOKM
	U1CQRYVLRcMV2yKGdkfq3tbCE8xOY0tnmZfcRMxLa2gyU7JF/4S0MpNUDhjGhpGrtcAtKy4ghDV
	0CjUzASQxFxdDYuo4/M059oc=
X-Received: by 2002:a05:7301:fc02:b0:384:c043:c5c with SMTP id
 5a478bee46e88-3856c6b3470mr3420982eec.3.1795204723745; Fri, 20 Nov 2026
 11:58:43 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel <dani069xp@gmail.com>
Date: Fri, 20 Nov 2026 14:58:32 -0500
X-Gm-Features: Aa3M54rBu4_N7C0-LGUYa09BI85d1orAI8slD5WRrHhkAjBfKbk_1QWPNL86d5Y
Message-ID: <CALovXdg6sOyK9orNrXSRSoSkVf7Adqa8xNC8Q=ESw4f0YEryaQ@mail.gmail.com>
Subject: [Bug report] rtw89: 8851be: WiFi disconnect (reason=4, beacon loss)
 1-2 s after A2DP stream start on the card's own Bluetooth, 5 GHz 80 MHz
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On an RTL8851BE combo card, starting an A2DP audio stream on the card's own
Bluetooth reliably makes the WiFi link drop within 1-2 seconds. The station is
disconnected locally with reason=4 and the AP then ignores re-authentication
for 50-90 s.

Hardware / software
- WiFi: Realtek RTL8851BE PCIe 802.11ax [10ec:b851], driver rtw89_8851be
- Bluetooth: USB 0bda:b850 (btusb, rtl_bt/rtl8851bu_fw.bin) on the same card
- Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac)
- linux-firmware 20261019
- Kernel 7.3.5-zen1-1-zen (also seen on 7.3.4-zen2-1 and zen2-2), Arch Linux
- NetworkManager 1.58.1, wpa_supplicant 2.12, bluez 5.88, PipeWire 1.6.11
- Module options: rtw89_core disable_ps_mode=y,
  rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y (no effect)
- NM: wifi.powersave=2, MAC randomization "stable"
- AP: 5 GHz, channel 157, 80 MHz VHT; signal about -58 to -61 dBm, 1x1
- BT audio: A2DP SBC to a headset (sink)

Observed
bluetoothd logs "fd(N) ready" when the A2DP transport starts. In every case
wpa_supplicant reports CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
within 1-2 s:

  2026-11-14 13:08:32 BT stream  -> 13:08:34 WiFi drop (12 more drops
while streaming)
  2026-11-20 13:06:56 BT connect -> 13:07:04 WiFi drop; another at 13:47:54
  2026-11-20 13:53:37 BT stream  -> 13:53:38 WiFi drop, reconnected 13:54:28

"iw dev wlp4s0 station dump" shows the beacon loss counter increasing with each
event. ICMP loss to the AP is 0% outside these events and TX retries/failures
are 0. Other devices on the same AP are not affected.

Width dependence
- 80 MHz: 4 of 4 stream starts dropped the link.
- 40 MHz (same AP, kernel, signal): 1 drop in 3 stream starts (2 were clean
  over several days of use).
- With Bluetooth off, 80 MHz showed no drops in the short test afterwards.
  A USB-tethered phone on the same machine did not show the problem.

Not the cause (tested): browser/GPU, NetworkManager config, MAC randomization,
power save, ASPM options, kernel 7.3.4 -> 7.3.5.

Expected: a stable WiFi link while Bluetooth A2DP streams, as it does on the
same card with a narrower channel.

Coex trace around one drop (debugfs btc_info sampled every 0.5 s, local time,
5 GHz ch155 center, bw=2, 80 MHz; "iw event -t" in parallel)

  14:20:54.975  BT connect:Y (A2DP_active:Y from 14:20:55.5)
  14:20:57.994  BT low-priority requests jump: Lo-rx/Lo-tx 0-3 -> 3064
  14:20:59.504  BT profile:A2DP (bluetoothd: transport fd ready at 14:20:59)
  14:21:00.830  iw event: CQM event: beacon loss
  14:21:00.958  iw event: deauth reason 4 "Disassociated due to inactivity"
                (disconnected, local request)
  14:21:01.020  coex: WL connect=NO_LINK, reason NTFY_POWEROFF, action WL_OFF

Second, independent capture of the same event (same setup, raw files kept):

  14:49:31.4    BT connect:Y
  14:49:34.434  BT Lo-rx/Lo-tx requests jump 0-239 -> 3229
  14:49:35      bluetoothd: A2DP transport fd ready
  14:49:35.945  BT profile:A2DP
  14:49:36.797  iw event: CQM event: beacon loss
  14:49:36.910  iw event: deauth reason 4 "Disassociated due to inactivity"
  14:49:36.952  coex: WL NO_LINK, action WL_OFF
  14:50:13      WiFi connected again (about 36 s; "auth: timed out" x4 before)

In both captures the coex state is action:WL_5G, ant_path:FDD, tdma type:0
right up to the last sample before the drop.

From 14:20:50 up to the drop the coex manager stays in action:WL_5G,
ant_path:FDD, tdma type:0 the whole time, i.e. it does not arbitrate WL/BT
while the BT traffic ramps up. hw_info reports ant_iso:10, rfe_type:0x2,
tx_num:1, rx_num:1. WL_FW_coex 7.9.0 (desired 6.0.0, "Match"), BT_FW_coex 7.
rssi was -54 dBm at the last sample before the drop (VHT MCS 9, 80 MHz).

For comparison, when the same station is on 2.4 GHz (ch 6, 20 MHz), A2DP
streaming works for me without drops (user observation, not traced).
The failing case is only 5 GHz + BT A2DP, and it is worse with 80 MHz than
with 40 MHz.

Full btc_info trace, ser_counters (all 0) and the iw event log are available;
I can send them or try patches/debug_mask settings. Thanks for any pointers.

Thanks,
Dani
