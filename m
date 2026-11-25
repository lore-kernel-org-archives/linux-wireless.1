Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633382;
	b=HaQ1XLTaGrqhNKBOHRkP2S/8TnDnQp8LJWYs8+1+6b1230nLGvGAP/pq8u1Qt1AUirgJ
	 v3gAQxM0Xa8jKn9uKeDVb941wRxBloHFEj4yaGTxhmTFo7RuzTv4Xz3K2+7ROVHZT2uIT
	 JLJTSlHeG3R7F/KBl5gXJg+CnQPz6PR2wUQD/NnLC5iwWUTVrFND7mOtsdN5lqeuKtKQc
	 Ke5RNoKcbWbmUsTD+kNG9X1Cei+ip9hPin5KoTuhBhxyXg+3lPPhIjy7SV+Ql9e2dsFTR
	 WWHq/hRF8WybDSg0emxfuGp8sQZcGsloksvB68xSyP21n22utYaOJkEzHNPD53J0jLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633382;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6Gq1kmLUUPURllDqMn29AAwXHIlfU36v0mvAjkNKDL8=;
	b=xtR0MZG6Op9ZY8b6efqatQIz5haJf+QBZXtDNGtiR9jh2HteyIV+8chd7yVhJXspvQc0
	 Q0L2WhUjA24jtUN91nfXJmUiuLuOKCSoHRN7/TergQsuxOCnHiK+z4v1hisO2hmYh0QAn
	 y0np3Ic4ODjET94ZPAjVFMfYfIk0hsJwsK5t8ckVqFo6yiHTIk6hZXxVKjsteXGXmaG/l
	 0/70yvhK12J+mXNEEO61iTxW7M9S4Lh43P8TL/Rn7NrtS3fq8TXSUzR8au4cKKBwAJqP4
	 KfY8DM0ww9FP3h35mAGsFvGerGjolnR7klX8i3EpKPx3l1yYl+Xrxxiowm2Noh+NIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=rArNteL7;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907A606A321;
	Wed, 25 Nov 2026 19:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A907A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=rArNteL7
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 787628ee-a6ad-4c9f-bcca-4bd28f4c3f8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795633377;
	bh=WPy2k0MFLTp8YZU2P1hH3lTvW/xuVRk96ToXFrcsWOM=;
	h=From:To:Cc:Subject:Date:From;
	b=rArNteL7lvZQCQvirZ46crs/V+2osIrdDjE5gN9eC4ic8Lxxi7A7+chpkm7JbVdbk
	 CYblq4Yb0P2KBgBf0squDA3uJFsG5XEie5JuR7LR7dS3Dd8omLwKuKWf0qXPbbuXac
	 2ut+s9IpgYgWMuQcm9Z8LB8sx3TC4uZs1797hvCSv/X3S4cl/Mm8e1ryHkBBOuLlfs
	 u7zTYFx+FWrPmA7T5n4cU0RKFtHfLIL6GfXRl0BgLQ23eqjIMJShtKbp/fILuPcz9G
	 5kxfscIeGhmNWgvujPrOKsIQgBH4Ik90PwrfKORtzDpcBtrzsX1BiljVcJcmK7FE6H
	 rqUaIGAlpozQA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH wireless-next v2 0/6] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
Date: Wed, 25 Nov 2026 20:02:48 +0100
Message-ID: <20261125190254.176055-1-dev@deq.rocks>
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

This series adds AWDL support to brcmfmac, so Linux on the Apple T2 Macs
can send and receive files over AirDrop with Apple and latest Google or
Samsung devices.

On these Macs the Apple firmware runs AWDL itself. The host creates an
AWDL interface and sets its parameters, the firmware keeps the AWDL
schedule and carries the AWDL frames and data. Election, peer discovery
and AirDrop run in user space, which talks to the driver through vendor
commands and events of the Broadcom OUI. As discussed on v1, vendor
commands are the exception agreed for AWDL, so the vendor header
becomes ABI with this series.

The user space side is t2-drop, published under GPL license

  https://github.com/kaiT2en/KaiT2en-Fedora/tree/main/apps/t2-drop

Tested on a MacBookPro15,1 (BCM4364, firmware 9.30.514.0.32.5.94) with
a MacBook Air M4 as peer. AirDrop in both directions with varying file
sizes up to 2GB.
v1 ran on the BCM4364 and BCM4377 machines of the T2 Linux community.

Changes in v2:
- Drop v1 patch 1, wireless-next matches the firmware capabilities as
  whole words already
- Rebase on wireless-next, patches 1, 2 and 4 have Arend's Ack
- Patch 3: remove an AWDL interface that shows up after the interface
  event timed out, tie the network device to the wiphy device in sysfs
  and keep its name, keep the AWDL address out of the ARP offload table
  of the primary interface, kernel-doc for the return values
- Patch 4: add the AWDL header in brcmf_netdev_start_xmit(), so tx and
  rx count the bytes of the Ethernet frame, kernel-doc. The MTU stays at
  1500, the firmware takes full size frames with the added header
- Patch 5: document where the parameter tables come from and the
  firmware versions they are used with, fail AWDL_START when awdl,
  awdl_config or slot_bss are rejected, return firmware errors from
  SET_FRAMES and SET_SYNC, a quirk in feature.c instead of the chip
  check, reject AWDL_STOP while a start is queued, AWDL_STOPPED with
  -ENOLINK when the firmware removes the interface, UNSPEC first in the
  vendor events
- Patch 6: abstract event codes for the AWDL events, mapped and
  registered by the WCC vendor module, log dropped events

v1: https://lore.kernel.org/all/20261104151547.70333-1-dev@deq.rocks/

Andre Eikmeyer (6):
  wifi: brcmfmac: move the interface_create definitions to fwil_types.h
  wifi: brcmfmac: detect AWDL support of the firmware
  wifi: brcmfmac: create and remove the AWDL interface
  wifi: brcmfmac: add the AWDL data path
  wifi: brcmfmac: add vendor commands for AWDL
  wifi: brcmfmac: pass AWDL frames and role changes to user space

 .../broadcom/brcm80211/brcmfmac/Makefile      |    3 +-
 .../broadcom/brcm80211/brcmfmac/awdl.c        | 1111 +++++++++++++++++
 .../broadcom/brcm80211/brcmfmac/awdl.h        |  116 ++
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   49 +-
 .../broadcom/brcm80211/brcmfmac/core.c        |   82 +-
 .../broadcom/brcm80211/brcmfmac/core.h        |    7 +
 .../broadcom/brcm80211/brcmfmac/feature.c     |   32 +
 .../broadcom/brcm80211/brcmfmac/feature.h     |    8 +-
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   19 +
 .../broadcom/brcm80211/brcmfmac/fweh.h        |    7 +-
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  |   46 +
 .../broadcom/brcm80211/brcmfmac/vendor.c      |   90 ++
 .../broadcom/brcm80211/brcmfmac/vendor.h      |  104 ++
 .../broadcom/brcm80211/brcmfmac/wcc/core.c    |   39 +
 14 files changed, 1659 insertions(+), 54 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.56.0

