Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398895;
	b=WV/WupX4RQW+T5fu+EhwAbzDFcU4Z8zvlX84dSAp7MgJNZwcLkIt2kF0M6nw1El78OyB
	 IQBpdNhXNVpfGzvM2zHmZVdg7awsapNEh3WJIgaJvfyg/KnxYGyDGQxh0b14WDAmgNQ1L
	 rvjUxKb2vpvTj3mQM7t5BtpaVnQBvojJwQ9h2kt+wzbtD9F675IQKHhh6DGcth5LYE4q4
	 xbHgl1oAiLLKm35IYHuSm8DtrQkIKtnuO+4LpF0vt281l7xUgliuFFKFNlit3zvYi9ICz
	 WhJf1mGnWmUPDfMtQEjVZ5E5Rq520CLfbxSkrDzTwmO9eUbS3j+L9SHpqlrRYjdClTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398895;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:Message-ID:Date:MIME-Version:Content-Type;
	bh=cA23OjWd0bgGsFUhHX431meCfdWuv0A/AvB6QxC4lIw=;
	b=tN4zBXO3v1bv8imsopB1O9GNNuyaj9EFCktKUnmFklQI9c4Kk3lo1d4Wj6lfvvRaAOT/
	 g9W6tZvxqqpbX6tleCdpt3iV/oMKfQ7/d5XsVplcJblHQkJkBWYh146Z93EZ+ZCI7kcYc
	 GiYbWBD7xNYQ+w8F1SyoitweX7VAqGBmd5OcIeoMoot13ksr9jmD5Pk0ABUFIf5vkF81E
	 GM7RP5HP+yXnumJmzgDjeA3sdip+nR6Z3mELhQMh7bLvIh6ZGh5zPhPrxrRiL9FVp0cXF
	 VguPv4j8ALtjekJMWntKeBr3yfRBMBJ7tATTcUoYrwu5hd1gCsu+botVoNk3lt7uZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OyDy0JFR;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E9606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 01:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OyDy0JFR
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN1so7Q31213838, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795398890; bh=cA23OjWd0bgGsFUhHX431meCfdWuv0A/AvB6QxC4lIw=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type;
	b=OyDy0JFRxX1smYNz7e5R6AOwIt9z9PbmzLcPtCfTi7J4mu/t5Yp25pvi7ab68j7DV
	 dxy694MH7EL5Zhtou2gDZ8ac88oRIVfWS20rV8FecxO4rA0ypus55FCB1fquJK1s+8
	 TkruCjgnbhdkoYtu9EIQhZ7Xst9OW39ImM9kX0TIuVxc7Inc6W/qdsesss62m9lteG
	 /3TvMCGhIn/ObxvycLkPp7LJ1ntcORF9d8ikOG/uJ4qdiHb5iYlJZUl/PPwXaAiT4j
	 6Nmh5Q+Jlpm8yk+anw0MlIhFf6/7EKkJFzS3Ii7ELKCGxw853TrfzLRbQtB7cEG3n5
	 ODhnZ9gjXQ1TA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN1so7Q31213838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:54:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 09:54:50 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 09:54:50 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
Subject: pull-request: rtw-next-2026-11-23 (for -next)
Message-ID: <ec18da81-bcd6-487e-9c0f-feaa27fce111@RTKEXHMBS06.realtek.com.tw>
Date: Mon, 23 Nov 2026 09:54:50 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi,

A pull-request of rtw-next to wireless-next tree, more info below. Please
let me know if any problems.

Thanks
Ping-Ke

---

The following changes since commit 991a73f4909f1348ffb4b38765cdb522a775e4c2:

  wifi: mac80211: remove ieee80211_rx_beacon_freq_valid (2026-11-02 21:02:09 +0100)

are available in the Git repository at:

  https://github.com/pkshih/rtw.git tags/rtw-next-2026-11-23

for you to fetch changes up to 8b29fd95e2d3cb80564eb7cb34248b844422ba1e:

  wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU (2026-11-23 09:36:43 +0800)

----------------------------------------------------------------
rtw-next patches for v7.5

Major changes are listed:

rtl8xxxu:

 * add TX report to ACK wireless stack for RTL8188CU/RTL8192CU

 * honour rate, retry, bandwidth and ack for packet injection

rtw88:

 * improve corner cases of restart_hw flow

 * improve RX interrupt storm for SDIO devices

rtw89:

 * add DTP (dynamic TX power) support to reduce power consumption
   for RTL8922D

 * add firmware-assisted regulatory learning

 * honour retry and ack for packet injection

----------------------------------------------------------------
Abdurrahman Karadag (1):
      wifi: rtw88: pci: wake the TX queues after restart_hw and interface up

Abhishek Tamboli (1):
      wifi: rtw89: 8852au: Add support for Mercusys MA72XH

Ahmet Zeren (5):
      wifi: rtl8xxxu: honour the rate of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the retry count of injected frames on gen1 chips
      wifi: rtl8xxxu: honour the bandwidth of injected frames on gen1 chips
      wifi: rtl8xxxu: don't report frames sent without ACK as acked
      wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU

Alastair D'Silva (4):
      wifi: rtw88: sdio: Handle allocation and read errors in rtw_sdio_rxfifo_recv
      wifi: rtw88: sdio: Track running state and cancel TX worker on stop
      wifi: rtw88: sdio: Fix unhandled RX request interrupt storm
      wifi: rtw88: sdio: Split rtw_sdio_rx_isr into 8051 and 3081 variants

Bitterblue Smith (3):
      wifi: rtw88: Pass the physical map to the read_efuse chip op
      wifi: rtw88: 8723b: Read the package type from efuse
      wifi: rtw88: 8723b: Read the chip variant from efuse

Chin-Yen Lee (2):
      wifi: rtw89: enable low-latency power-save optimization for RTL8852B/RTL8852BT
      wifi: rtw89: avoid premature power save entry for buffered traffic

Ching-Te Ku (1):
      wifi: rtw89: coex: add a notify entry for dynamic MLO RF-path switch

Devin Wittmayer (1):
      wifi: rtw89: debug: return the error when a read handler fails

Enver Ikromov (5):
      wifi: rtw89: avoid NULL vif dereference in rtw89_ops_tx()
      wifi: rtw89: handle negative rate index for injected frames
      wifi: rtw89: restore channel when leaving idle on non-chanctx devices
      wifi: rtw89: avoid reading seq_ctrl on control frames
      wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames

Ho Jie Feng (1):
      wifi: rtw88: usb: don't report the aggregation buffer as a frame

Hsiao-Yung Chen (1):
      wifi: rtw89: 8922d: add DTP for thermal protection

Hungyu Lin (5):
      wifi: rtw88: sdio: copy RX status after updating the frequency
      wifi: rtw88: pci: preserve the RX ring DMA address on cleanup
      wifi: rtw88: 8723b: avoid converting RX SNR twice
      wifi: rtw88: 8703b: avoid converting RX SNR twice
      wifi: rtw88: allow key removal when the CAM table is full

Ian Rogers (1):
      wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C command IDs

Jiaxin Li (1):
      wifi: rtl818x: rtl8180: reject RX frames longer than MAX_RX_SIZE

Johnson Tsai (1):
      wifi: rtw89: add firmware-assisted regulatory domain learning

Josef Schlehofer (1):
      wifi: rtw88: 8822b: Relax ETSI EDCCA threshold on 2.4 GHz

Kalpesh Solanki (4):
      wifi: rtw88: pci: Add DMI quirk for HP Laptop 15s-fr5xxx
      wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
      wifi: rtw88: skip already reset station in rtw_sta_remove()
      wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI

Kim Wooseok (1):
      wifi: rtl8xxxu: isolate the USB register buffer from CPU state

Kuan-Chung Chen (3):
      wifi: rtw89: pci: reclaim TXBD before fully draining
      wifi: rtw89: 8922d: enable dynamic antenna gain
      wifi: rtw89: phy: fix antenna gain unit in debug output

Luka Gejak (3):
      wifi: rtw88: sdio: reject oversized RX packets
      wifi: rtw88: 8723b: don't set channel_invalid in query_phy_status()
      wifi: rtw88: 8723b: always report a single spatial stream

Mauricio Faria de Oliveira (1):
      wifi: rtw88: fix skb leak in hw_scan probe request length check

Mehmet Fide (2):
      wifi: rtw88: program the beacon interval
      wifi: rtw88: find an associated station without allocating

Mohammed Afifi (1):
      wifi: rtw88: usb: Download the reserved page synchronously

Ping-Ke Shih (5):
      wifi: rtlwifi: correct unit of center_freq as KHZ passing to freq_reg_info()
      wifi: rtw89: 8922d: use efuse bias for CCK RX gain
      wifi: rtw89: 8922d: set CFR clip threshold while setting channel
      wifi: rtw89: 8922d: correct thermal trim range to -16~+16 programmed in efuse
      wifi: rtw88: debug: explicitly cast to u8 for %02x format in rtw_debugfs_get_tx_pwr_tbl()

Po-Hao Huang (1):
      wifi: rtw89: Update sequence for MLO link switch

Rosen Penev (1):
      wifi: rtw89: acpi: skip _DSM when there is no ACPI companion

Shirong Zhao (1):
      wifi: rtw89: read the beacon header from the skb data

Vincent Schurink (1):
      wifi: rtw89: set RA init rate level when the station RSSI is known

YuanZhe Liu (1):
      wifi: rtw88: usb: drop RX frames received before the device is started

Zhao Li (2):
      wifi: rtw88: usb: stop RX work before unregistering hardware
      wifi: rtw89: update PN state only from correctly decrypted frames

Zong-Zhe Yang (4):
      wifi: rtw89: debug: support to disable regd learn
      wifi: rtw89: introduce bitmap of supported bands to deal with quirks
      wifi: rtw89: get default channel based on supported bands
      wifi: rtw89: fix band assignment in rtw89_core_update_rx_freq_from_ie()

 drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c |  10 +-
 drivers/net/wireless/realtek/rtl8xxxu/8192c.c      |   1 +
 drivers/net/wireless/realtek/rtl8xxxu/core.c       | 239 ++++++++++--
 drivers/net/wireless/realtek/rtl8xxxu/regs.h       |   9 +
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h   |   9 +-
 drivers/net/wireless/realtek/rtlwifi/regd.c        |   6 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/fw.h    |   2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ee/fw.h    |   2 +-
 .../net/wireless/realtek/rtlwifi/rtl8821ae/fw.h    |   2 +-
 drivers/net/wireless/realtek/rtw88/debug.c         |   4 +-
 drivers/net/wireless/realtek/rtw88/efuse.c         |   2 +-
 drivers/net/wireless/realtek/rtw88/fw.c            |   1 +
 drivers/net/wireless/realtek/rtw88/mac80211.c      |  32 +-
 drivers/net/wireless/realtek/rtw88/main.c          |  38 +-
 drivers/net/wireless/realtek/rtw88/main.h          |   3 +-
 drivers/net/wireless/realtek/rtw88/pci.c           |  35 +-
 drivers/net/wireless/realtek/rtw88/ps.c            |   9 +
 drivers/net/wireless/realtek/rtw88/ps.h            |   1 +
 drivers/net/wireless/realtek/rtw88/reg.h           |   1 +
 drivers/net/wireless/realtek/rtw88/rtw8703b.c      |   6 +-
 drivers/net/wireless/realtek/rtw88/rtw8723b.c      |  64 +++-
 drivers/net/wireless/realtek/rtw88/rtw8723b.h      |  14 +
 drivers/net/wireless/realtek/rtw88/rtw8723x.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw8723x.h      |   7 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw8821c.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw8822b.c      |   8 +-
 drivers/net/wireless/realtek/rtw88/rtw8822b.h      |   2 +
 drivers/net/wireless/realtek/rtw88/rtw8822c.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c      |   2 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h      |   2 +-
 drivers/net/wireless/realtek/rtw88/sdio.c          | 207 +++++++---
 drivers/net/wireless/realtek/rtw88/sdio.h          |   3 +
 drivers/net/wireless/realtek/rtw88/usb.c           |  81 +++-
 drivers/net/wireless/realtek/rtw88/usb.h           |   1 +
 drivers/net/wireless/realtek/rtw89/acpi.c          |   9 +-
 drivers/net/wireless/realtek/rtw89/chan.c          |  15 +-
 drivers/net/wireless/realtek/rtw89/chan.h          |   3 +-
 drivers/net/wireless/realtek/rtw89/coex.c          |  62 +++
 drivers/net/wireless/realtek/rtw89/coex.h          |  11 +
 drivers/net/wireless/realtek/rtw89/core.c          | 128 +++++--
 drivers/net/wireless/realtek/rtw89/core.h          |  74 +++-
 drivers/net/wireless/realtek/rtw89/debug.c         |  10 +-
 drivers/net/wireless/realtek/rtw89/fw.c            | 117 ++++--
 drivers/net/wireless/realtek/rtw89/fw.h            |  44 +++
 drivers/net/wireless/realtek/rtw89/mac.c           |  74 +++-
 drivers/net/wireless/realtek/rtw89/mac.h           |  27 ++
 drivers/net/wireless/realtek/rtw89/mac80211.c      |  46 ++-
 drivers/net/wireless/realtek/rtw89/mac_be.c        |  49 ++-
 drivers/net/wireless/realtek/rtw89/pci.c           |   5 +-
 drivers/net/wireless/realtek/rtw89/pci.h           |   1 +
 drivers/net/wireless/realtek/rtw89/phy.c           | 418 +++++++++++++++++++--
 drivers/net/wireless/realtek/rtw89/phy.h           |  12 +
 drivers/net/wireless/realtek/rtw89/phy_be.c        |  78 ++++
 drivers/net/wireless/realtek/rtw89/ps.c            |   3 +-
 drivers/net/wireless/realtek/rtw89/ps.h            |   5 +-
 drivers/net/wireless/realtek/rtw89/reg.h           |  26 ++
 drivers/net/wireless/realtek/rtw89/regd.c          | 265 ++++++++++++-
 drivers/net/wireless/realtek/rtw89/rtw8851b.c      |   3 +
 drivers/net/wireless/realtek/rtw89/rtw8852a.c      |   3 +
 drivers/net/wireless/realtek/rtw89/rtw8852au.c     |   2 +
 drivers/net/wireless/realtek/rtw89/rtw8852b.c      |   3 +
 drivers/net/wireless/realtek/rtw89/rtw8852bt.c     |   2 +
 drivers/net/wireless/realtek/rtw89/rtw8852c.c      |   3 +
 drivers/net/wireless/realtek/rtw89/rtw8922a.c      |   3 +
 drivers/net/wireless/realtek/rtw89/rtw8922d.c      |  75 +++-
 drivers/net/wireless/realtek/rtw89/ser.c           |   1 +
 drivers/net/wireless/realtek/rtw89/util.h          |   8 +
 drivers/net/wireless/realtek/rtw89/wow.c           |   5 +-
 69 files changed, 2136 insertions(+), 265 deletions(-)
