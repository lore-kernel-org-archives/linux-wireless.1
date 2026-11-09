Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183925;
	b=PbuNAGgj//ebQsQeuBoPZP0iNvMznHUvE8S+Vt/kQ/YDBlcvl8Q/rGisUnTgWxvh8wGv
	 FaYHa5+s9Gu4aOHepQrvTrT03fbURH7wV5WsStCwNsySPn7jzo0+Ud3iDmgAwx2Y+OyDx
	 /QiMWqRujIvt23oasydemo3NkQmtx7yw37HXAvw/9KRBOX21gcdPMG+mbXa0o+qV7C/34
	 1j9fx+nlKw/Ih8K1cn+c2mJkPop5N8mefP2QQRNs9zzITh+2sOkHwGaagpiCo0ezukqu7
	 S/cqwr0rC00o9yMmp/Oiz+CzRqJWIaA9Cr8WF/+1nL7h72VpnUSJdNKt49pkPmMw+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183925;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=yDs6CzCxqfEwo8tlX39U+fuPJCLt1HilrukTVUCd2bM=;
	b=Akga8mFReF8ZQGI/lNDm0fsfITiuIHzwy2gowQgJv6+9I8KjBWWJfXAR6a2V1dJsD3Ql
	 9YeBd+XsSqz5POPavaaFhePWsYeIlNxx1A/jU6wfFlb8LF3KZXoqf3FIlzyy/mzjezzkN
	 QcsH/Qpmw9o0WZyLM5sDKQ+iGeoePjpFLrt2km9IMu9+ulkw3eTE6WWk4jSe5Xep6hZVp
	 NAI8knG2ynyv7IWRx6kNqvvJmvzoJcKaFgyWaMxcW9YSt7JP9LGoWpf/NmImjtqQj/SrK
	 CUuITbfD95flwY/ZIppXcftAENYow+M9F3h/Dxnv55DAielyUiwG4ElZ55Hq9AtUGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=GHSUxRgr;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00453606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 00:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00453606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=GHSUxRgr
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C5DAD801E8;
	Mon, 09 Nov 2026 01:25:20 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxHM6y1VbPO7; Mon,  9 Nov 2026 01:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794183919; bh=SU7bV/bDV5LUHX/6F5LFMZQ2BNoa7NQsk7TZTWIaVro=;
	h=From:To:Cc:Subject:Date;
	b=GHSUxRgrG8DoqISUEqgZOyEpcj2N+JejXRL34M+uIVC/QGz9UgoiaAdrtwe9tow87
	 +s4wtVAxMQyicCpmH+M8HVqcjf9DrIYMgov6xnZIilKe/ZCKxmI8P6JZ0ttm8RiEyL
	 gJRR7Qh7iPGAuylEAyPAF4iuvtRZAs/6cK67laOHTDw6px4A9XHe/+Bc+jEses2jct
	 2G4w2cE3we7upBsqWTM5R+vDw49EJWy2PTJv/N9R+Q8zOftfhdGypG/HFuqXzGwwPv
	 J/t8T81yld41W1u/04WSLjAW6G5pisTA/CiA815M7tfgXlzXltTCr8zaj8t7pbvm9j
	 0EbxuHtXMuf6Q==
From: Florian Maurer <fmaurer@disroot.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matteo Croce <technoboy85@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [BUG] wifi: mt76: mt7996: full chip reset never recovers with NPU offload (AN7581)
Date: Mon,  9 Nov 2026 00:24:49 +0000
Message-ID: <20261109002500.3564358-1-fmaurer@disroot.org>
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

Hi Felix, Lorenzo,

on a Gemtek W1700K (Airoha AN7581, MT7996 with hif2), a full chip
reset does not recover when the NPU offload is enabled. The firmware
does not load again, and the driver keeps resetting until the board is
power cycled. This also happens after a real firmware assert. With the
NPU offload disabled, the same reset recovers. This is the recovery
problem from the cover letter of the NPU rx fixes [1].

Triggers, both via /sys/kernel/debug/ieee80211/phyN/mt76/sys_recovery:

  0,8  sets the WM/WA watchdog state and runs the full reset
  0,9  makes the WM firmware assert; the next MCU command times out,
       and the timeout starts the full reset

Results:

  trigger  mt76 build                       runs  result
  0,8      NPU on, npu.c as in 467ae2e3     1     no recovery (idle)
  0,8      NPU on, with the fixes from [1]  3     no recovery (idle and rx load)
  0,8      NPU off                          3     recovered (2 idle, 1 rx load)
  0,9      NPU on, with the fixes from [1]  1     no recovery (idle)
  0,9      NPU off                          1     recovered (idle)

Setup: OpenWrt main, kernel 6.18.55, openwrt/mt76 467ae2e3, MT7996
firmware from linux-firmware (WM build time 20260311120504). All
builds also carry two local mt7996 mesh patches [2][3]. The runs with
the fixes from [1] used the flashed image. For the other two rows I
rebuilt mt76 from the same tree, once without the patches from [1] and
once without CONFIG_MT76_NPU/CONFIG_MT7996_NPU, and swapped the three
modules at runtime, so the phy number changes between runs. rx load
was iperf3 over 5 GHz mesh at about 27 Mbit/s. The run without the
fixes from [1] was idle only, because without them the NPU rx path
crashes the board under load.

NPU on, npu.c as in 467ae2e3 (console from ramoops):

  [212226.959322] mt7996e 0000:01:00.0: phy2 indicated firmware crash, attempting recovery
  [212227.465594] pcieport 0000:00:00.0: AER: Multiple Uncorrectable (Non-Fatal) error message received from 0000:00:00.0
  [212227.476337] pcieport 0000:00:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Requester ID)
  [212227.487867] pcieport 0000:00:00.0:   device [14c3:6899] error status/mask=00004000/00400000
  [212227.496358] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [212227.503353] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  [212227.511125] pcieport 0000:00:00.0: AER: device recovery failed
  (the same AER block 5 more times within 0.3 s)
  [212229.496692] mt7996e 0000:01:00.0: Timeout for initializing firmware
  [212231.486662] mt7996e 0000:01:00.0: Timeout for initializing firmware
  [212231.493143] mt7996e 0000:01:00.0: Firmware is not ready for download
  (the same for each of the 10 attempts, with more CmpltTO in between)
  [212268.609326] mt7996e 0000:01:00.0: chip full reset failed
  [212268.614878] ieee80211 phy2: Hardware restart was requested
  [212270.656294] mt7996e 0000:01:00.0: Message 00130022 (seq 1) timeout

The MCU timeout queues the next full reset. This cycle repeated every
43 s until I cut the power after 7 minutes (9 times "chip full reset
failed"). The kernel kept running, but wifi never came back. The 0,8
runs with the fixes from [1] showed the same AER errors and firmware
timeouts; I have no complete log of those.

The 0,9 run with NPU on starts with the MCU timeout and then follows
the same cycle, 22 times in 16 minutes:

  [  404.163489] mt7996e 0000:01:00.0: Message 00130022 (seq 2) timeout
  [  404.731864] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [  404.738781] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  ...
  [  445.955921] mt7996e 0000:01:00.0: chip full reset failed

NPU off, one of the idle runs:

  [206493.052470] mt7996e 0000:01:00.0: phy1 indicated firmware crash, attempting recovery
  [206493.154220] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [206493.161225] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  [206493.168957] pcieport 0000:00:00.0: AER: device recovery failed
  [206493.175076] mt7996e 0000:01:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260311120419a
  [206493.198727] mt7996e 0000:01:00.0: WM Firmware Version: ____000000, Build Time: 20260311120504
  [206493.237451] mt7996e 0000:01:00.0: DSP Firmware Version: ____000000, Build Time: 20260311120415
  [206493.256034] mt7996e 0000:01:00.0: WA Firmware Version: ____000000, Build Time: 20260311120325
  [206512.810444] ieee80211 phy1: Hardware restart was requested

The other two NPU-off 0,8 runs had no CmpltTO; the NPU-off 0,9 run had
one and recovered the same way. In all four the mesh peers stayed up;
under load, iperf3 stopped for about 15 s. So a completion
timeout during the reset also happens without the NPU and is harmless
there. With the NPU on, the firmware does not load after it.

From the code (467ae2e3), not tested: the L1 path in
mt7996_mac_reset_work() calls mt7996_npu_hw_stop() before the reset
and __mt7996_npu_hw_init() after it. The full reset path does neither.
mt7996_mac_restart() calls mt7996_dma_reset(dev, true), which runs
mt7996_wfsys_reset() while the NPU is still active and calls
mt76_npu_disable_irqs() only afterwards. WED gets
mtk_wed_device_dma_reset() at that point. Does the full reset need to
stop the NPU before the wfsys reset, like the L1 path?

Matteo Croce reported the same CmpltTO and "can't recover" lines from
mt7996_mac_reset_work on a BPI-R4, with WED instead of the NPU.
wed_enable=0 made it go away for him [4].

Side note: `echo 0,1` (L1) never printed "L1 SER recovery start" on
this board, with or without the NPU, so the firmware does not seem to
start an L1 recovery from that trigger alone.

Not tested: MT7992, a kernel.org tree. I can run more tests or debug
patches on this board.

[1] https://lore.kernel.org/linux-wireless/cover.1793927986.git.fmaurer@disroot.org/
[2] https://github.com/openwrt/mt76/pull/1132
    ("wifi: mt76: mt7996: use own MAC as BSS BSSID for mesh interfaces")
[3] https://github.com/openwrt/mt76/pull/1170
    ("wifi: mt76: mt7996: let mac80211 de-aggregate mesh A-MSDUs")
[4] https://lore.kernel.org/linux-wireless/afefde93-1f6a-4b3b-976b-87105615f931@gmail.com/

Thanks,
Florian
