Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831790;
	b=GJvvP9tg5dEBsDvYNGpH0YoOi/6+aRa9x4AfinJA3QRFnWc7PSqHY6BGe2TLfo59+W9C
	 guPWBepLtioHO08tAg7d6waNoGwmxbkFVBt5BHZxHkoqz8Bj7hpxWNNUCvFJK8dmqYE5N
	 1hq+7Pog6Yofc0AnUajWQ4Bp8SoMTChPvrLz2vKmHpmbDRxfOC8i1mWimpBQ1irDk++/A
	 BUKjRrxcnKimf+2mDCfgIhmtasFdCa5aM8l5FDWkm1uiOFC+CM9PinYwWBKGr6uRI+YCL
	 WXkr8LLw6Xrr+Nbr3ruRDvrOEytZ5YntNTXi8aZRBtTukO1ZdtgSK17ZW7HeLN9CZqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831790;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NYrxjTktERK2tBUz/9BXXzMoMoB3MzX8GnA3xt7k9sU=;
	b=C6BZbZPSj/NfUyXEpYqQevbu85cW4yL2oRoAZZN47OoFkjdmYj9KAYOSWtawYylHy2aY
	 UYMFROhqoWQT1SVavY9FZNmC7gOXQE6UTDKZlCyCLvyfBTcfci6CbvRlhafRiooga17qf
	 yeqTVEpT+Fat4HOvBRWV+DE/Q7QQafqc8EdKiGKVc+Oss4fK74zNVHkgjN2CTBUBBGLNG
	 NuD1XFWip5uGV3rGhWupFlt+KW3LkBbzks/8meNu4Gj99F70eE2dB3yTIjBvprNlG+2uG
	 4HjmSzzGXGHXpPGauWgNuv1pgbJl5esYfAsKuqUNQYzRdEPyXqAQ8DShX++Latgj31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SgXWQSP+;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E780606A31C;
	Mon, 16 Nov 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=SgXWQSP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=NYrxjTktERK2tBUz/9BXXzMoMoB3MzX8GnA3xt7k9sU=; t=1794831789; x=1796041389; 
	b=SgXWQSP+l2Dp+r5jBP61btqlouaAJQkKQUosT8EqZ4gOEpOSW51bKOjkamWf7OmFdd3ImxT+LcG
	7szdsk9LZVFu8TQUh3eNw+QBZlmbS8ZnLBIv+5ZIyWWL+qYeT7QT3rqrLHeYR2E0P3gf3Z/c6RaZm
	XoM5yGp8dAw1F6hxJPyP0lvkxPPypczJIOYvnY8ojDl4bKYdVIkJ7gUKwFCGoy3F5tEINSh0orLD4
	9dIdyZ+0UZcCPXnR+Xi7JH2BIfwaZLj9MYRqso/TsVRfiD5ZcZzCwK2M+zhmz4AtZtEBNaQgJd4t/
	fwmGL80qlFzR5oLPr6Ph5UGp2FbzJsQfdZHA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSvjm-0000000GcmA-0SLC;
	Mon, 16 Nov 2026 13:23:06 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Subject: [GIT PULL] wireless-next-2026-11-16
Date: Mon, 16 Nov 2026 13:20:08 +0100
Message-ID: <20261116122302.1501378-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.1
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

Hi,

Here's a chunk of new work, partially I'm sending this now
to not build up too much of a queue, but also because it's
conflicting with net and I'd like to solve that.

Four files have conflicts, from what my test merge said:

drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
 -> one conflict, keep the old version, always DMA_BIDIRECTIONAL
    (this was broken, but the new code got developed over the
    broken version and they thought only the new chip needed bidi)

net/mac80211/link.c
 -> two conflicts, use the new version
    (the sync issue was fixed already implicitly in the new one)

net/mac80211/mlme.c
 -> one conflict, both ieee80211_process_adv_ttlm() and
    ieee80211_rx_mgmt_beacon_uhr_param_upd() need have the
    check and "goto free" (I'd probably give them each an
    own if statement, but doesn't matter)

net/wireless/nl80211.c
 -> one conflict, the function prototype changed, use the
    new version (both sides fixed the refcounting issue)

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 734bef548a96e8774d6eef5dfa2026c6edc4e80b:

  Merge tag 'net-next-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2026-10-22 15:58:00 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git tags/wireless-next-2026-11-16

for you to fetch changes up to 5dbf2415ca9821a611d09308e3b29d2c37e7cd77:

  wifi: nl80211: avoid double wdev_put() (2026-11-11 11:16:43 +0100)

----------------------------------------------------------------
First set of new work:
 - cfg80211/mac80211:
   - initial clang context analysis
   - GTK handling improvements
   - reduce synchronize_net() usage
   - further UHR/11bn/WiFi8 work, e.g. initial work
     towards SMD transition (seamless roaming)
   - regulatory race fixes
 - brcmfmac: BCM4388 (Apple Silicon) support

----------------------------------------------------------------
Christoph Rudorff (1):
      wifi: mac80211: clarify ieee80211_set_antenna() return value

Colin Ian King (1):
      wifi: mac80211_hwsim: remove extra trailing semicolon from a statements

Daniel Berlin (1):
      wifi: brcmfmac: Support versioned scan parameter layouts

Eric Dumazet (1):
      wifi: rt2x00: use skb_put_padto() for beacon padding

Hector Martin (6):
      wifi: brcmfmac: Support newer PCIe core startup and interrupts
      wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
      wifi: brcmfmac: Load signed PCIe firmware images
      wifi: brcmfmac: Accept newer BSS information versions
      wifi: brcmfmac: Support versioned join requests
      wifi: brcmfmac: Add BCM4388 support

Heyang Tan (1):
      wifi: rt2x00: rt61pci: trim RX skb to reported frame length

Hongcheng Zhang (1):
      wifi: mac80211: preserve disabled subchannel bitmap in 6 GHz CSA validation

Hussain Sitamouwala (1):
      wifi: mac80211: remove unused drv_offchannel_tx_cancel_wait tracepoint

Johannes Berg (75):
      wifi: mac80211: replace ieee80211_iter_keys_rcu()
      wifi: cfg80211: support C/B/I/GTK per AP in client modes
      wifi: mac80211: clarify per-STA GTK handling code/docs
      wifi: mac80211: use per-STA GTK in client mode
      wifi: mac80211: allow drivers to install AP GTK on STA
      wifi: mac80211: remove lookup_key() dead code
      wifi: mac80211: unify key finding/installation
      wifi: mac80211: refactor tailroom needed checks
      wifi: mac80211: remove wrong unit from TTLM buffer define
      wifi: mac80211: add and use ieee80211_tu_to_ktime()
      wifi: mac80211: expose link STA TX bandwidth in debugfs
      wifi: mac80211: parse and validate UHR parameters update
      wifi: mac80211: refactor UHR code from AP channel determination
      wifi: mac80211: refuse bad UHR parameter update element
      wifi: mac80211: don't apply NPCA/DBE while being disabled
      wifi: mac80211: mlme: refactor ieee80211_config_bw() output
      wifi: mac80211: track APs UHR DBE capabilities
      wifi: ieee80211: check DUO in UHR operation size
      wifi: ieee80211: fix reconfiguration MLE size check
      wifi: ieee80211: fix MAPC element name
      wifi: mac80211: fix UHR Mode Change Tuples
      wifi: mac80211: avoid using dialog token 0
      wifi: mac80211: remove .config method requirement
      wifi: mac80211: handle missing tailroom in SW crypto
      wifi: mac80211: don't synchronize for key tailroom
      wifi: mac80211: simplify tailroom accounting
      wifi: mac80211: don't reserve tailroom for all keys
      wifi: mac80211: free keys asynchronously
      wifi: mac80211: remove force_synchronize from ieee80211_free_keys()
      wifi: mac80211: check for AID assignment issues
      wifi: ieee80211: correct UHR link reconf response
      wifi: ieee80211: remove struct ieee80211_smd_info
      wifi: mac80211: mlme: partially handle UHR updates
      wifi: mac80211: rename ieee80211_sta_activate_link()
      wifi: mac80211: clarify station link handling
      wifi: mac80211: clarify change_vif_links() documentation
      wifi: mac80211: add link_sta::link_conf pointer
      wifi: mac80211: add sta_info_alloc_with_links()
      wifi: mac80211: track sta->active_links
      wifi: mac80211: use sta->active_links in for_each_sta_active_link()
      wifi: mac80211: refactor link handling
      wifi: mac80211: factor out ieee80211_mgd_reset_ap_state()
      wifi: mac80211: expose MLME functions
      wifi: define SMD Transition frame formats
      wifi: mac80211: parse SMD BSS Transition Parameters element
      wifi: mac80211: implement MLE first-profile inheritance
      wifi: mac80211: pass assoc_data to link config
      wifi: mac80211: move assoc request elems into assoc data
      wifi: mac80211: move flush fallback into drv_flush_sta()
      wifi: mac80211: add and use sta_from_pub()
      wifi: mac80211: debugfs: show TX BA size in agg_status
      wifi: mac80211: debugfs: allow sending blockack request
      wifi: cfg80211: move valid_links update into link release
      wifi: mac80211: limit non-MLO STA to EHT
      wifi: mac80211: always limit TX BA buffer size
      wifi: mac80211: batch RCU sync when stopping TX BA sessions
      wifi: cfg80211: free scan requests after RCU grace period
      wifi: mac80211: don't synchronize RCU on scan completion
      wifi: cfg80211: add wiphy_rcu_work
      wifi: mac80211: asynchronously start TX BA sessions
      wifi: mac80211: asynchronously stop TX BA sessions
      wifi: mac80211: destroy AP stations asynchronously
      wifi: brcmsmac: remove unused wlc_info_dbg variable
      wifi: cfg80211: clean up unused/set reg_num_devs_support_basehint
      wifi: qtnfmac: register regulatory before wiphy
      wifi: ath11k: register regulatory before wiphy
      wifi: ath12k: register regulatory before wiphy
      Revert "wifi: iwlwifi: mld: Move regulatory domain initialization"
      wifi: cfg80211: fix regdomain vs. wiphy registration
      wifi: cfg80211: enable context analysis
      wifi: mac80211: enable context analysis
      wifi: mac80211: remove redundant RCU critical sections
      wifi: virtual: enable context analysis
      wifi: cfg80211: add APIs for SMD transition
      wifi: nl80211: avoid double wdev_put()

John Macias (1):
      wifi: cfg80211/mac80211: apply HE OBSS PD settings on beacon update

Lachlan Hodges (2):
      wifi: mac80211: include freq offset when comparing frequencies
      wifi: mac80211: remove ieee80211_rx_beacon_freq_valid

Lee Jones (2):
      wifi: mac80211: ignore PM bit in non-bufferable MMPDUs
      wifi: mac80211: send wake nullfunc when TIM bit is set while awake

Lewis O'Flynn (1):
      wifi: cfg80211: use self-managed regd after user hint

Michael Reeves (6):
      wifi: brcmfmac: pcie: Report the detected chip ID to the bus
      wifi: brcmfmac: Match complete firmware capability names
      wifi: brcmfmac: Fall back to RSSI-only default join preferences
      wifi: brcmfmac: Use event_msgs_ext for event masks
      wifi: brcmfmac: Handle larger firmware band lists
      wifi: brcmfmac: Handle extended PMK command payloads

Nick Hainke (1):
      wifi: cfg80211: map LE DSCP to UP 1

Stanislaw Gruszka (3):
      wifi: iwlegacy: remove configurable watchdog timeout
      wifi: iwlegacy: remove channels debugfs file
      wifi: iwlegacy: remove disable_ht40 debugfs file

Thomas Fourier (1):
      wifi: qtnfmac: topaz: Fix dma_unmap_single() size

YuanZhe Liu (2):
      wifi: libertas: check workqueue creation in lbs_add_card()
      wifi: libertas: cancel fw_timeout on disconnect

 drivers/net/wireless/ath/ath11k/mac.c              |   14 +-
 drivers/net/wireless/ath/ath12k/mac.c              |   14 +-
 drivers/net/wireless/ath/ath12k/mac.h              |    1 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |    1 -
 .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |    1 +
 .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |    9 +
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |  372 +++----
 .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |   36 +-
 .../wireless/broadcom/brcm80211/brcmfmac/common.c  |   27 +-
 .../wireless/broadcom/brcm80211/brcmfmac/core.c    |    5 +-
 .../wireless/broadcom/brcm80211/brcmfmac/core.h    |   18 +
 .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  124 ++-
 .../wireless/broadcom/brcm80211/brcmfmac/feature.h |    2 +
 .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    |  130 ++-
 .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |    1 +
 .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  141 ++-
 .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  |   65 +-
 .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |    9 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  560 ++++++++--
 .../broadcom/brcm80211/brcmfmac/scan_param.c       |  416 +++++++
 .../broadcom/brcm80211/brcmfmac/scan_param.h       |   13 +
 .../wireless/broadcom/brcm80211/brcmsmac/main.c    |    9 -
 .../broadcom/brcm80211/include/brcm_hw_ids.h       |    2 +
 .../broadcom/brcm80211/include/chipcommon.h        |    5 +
 drivers/net/wireless/intel/iwlegacy/3945-mac.c     |    2 +-
 drivers/net/wireless/intel/iwlegacy/3945.c         |    2 -
 drivers/net/wireless/intel/iwlegacy/4965-mac.c     |    2 +-
 drivers/net/wireless/intel/iwlegacy/4965.c         |    1 -
 drivers/net/wireless/intel/iwlegacy/common.c       |   36 +-
 drivers/net/wireless/intel/iwlegacy/common.h       |   10 +-
 drivers/net/wireless/intel/iwlegacy/debug.c        |  149 ---
 drivers/net/wireless/intel/iwlwifi/mld/d3.c        |    6 +-
 drivers/net/wireless/intel/iwlwifi/mld/fw.c        |    8 +-
 drivers/net/wireless/intel/iwlwifi/mld/iface.c     |    2 +-
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c  |   10 +-
 drivers/net/wireless/intel/iwlwifi/mld/sta.c       |   13 +-
 drivers/net/wireless/intel/iwlwifi/mld/tx.c        |    2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   13 +-
 .../net/wireless/intel/iwlwifi/mvm/mld-mac80211.c  |    1 -
 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c   |   14 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h       |    5 -
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c       |    4 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |    2 +-
 drivers/net/wireless/marvell/libertas/if_usb.c     |    6 +
 drivers/net/wireless/marvell/libertas/main.c       |    9 +
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |    4 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c    |    4 +-
 .../net/wireless/mediatek/mt76/mt7996/debugfs.c    |    5 +-
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   |   12 +-
 drivers/net/wireless/purelifi/plfxlc/mac.c         |    6 -
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c  |   11 +-
 .../wireless/quantenna/qtnfmac/pcie/topaz_pcie.c   |    2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c     |    8 +-
 drivers/net/wireless/ralink/rt2x00/rt61pci.c       |   10 +-
 drivers/net/wireless/ralink/rt2x00/rt73usb.c       |    8 +-
 drivers/net/wireless/realtek/rtw88/main.c          |    4 +-
 drivers/net/wireless/realtek/rtw88/util.h          |    4 +-
 drivers/net/wireless/silabs/wfx/main.c             |    1 -
 drivers/net/wireless/silabs/wfx/sta.c              |    5 -
 drivers/net/wireless/silabs/wfx/sta.h              |    1 -
 drivers/net/wireless/virtual/Makefile              |    2 +
 drivers/net/wireless/virtual/mac80211_hwsim_nan.c  |    2 +-
 include/linux/ieee80211-eht.h                      |   14 +-
 include/linux/ieee80211-uhr.h                      |  561 +++++++++-
 include/linux/ieee80211.h                          |   15 +-
 include/net/cfg80211.h                             |  309 +++++-
 include/net/mac80211.h                             |   83 +-
 include/uapi/linux/nl80211.h                       |   96 ++
 net/mac80211/Makefile                              |    2 +
 net/mac80211/agg-tx.c                              |  256 +++--
 net/mac80211/airtime.c                             |    5 +-
 net/mac80211/ap.c                                  |    8 +-
 net/mac80211/cfg.c                                 |  248 ++---
 net/mac80211/debugfs.c                             |    3 +-
 net/mac80211/debugfs_sta.c                         |   48 +-
 net/mac80211/driver-ops.c                          |   40 +-
 net/mac80211/driver-ops.h                          |   30 +-
 net/mac80211/he.c                                  |    6 +-
 net/mac80211/ht.c                                  |   50 +-
 net/mac80211/ibss.c                                |    4 +-
 net/mac80211/ieee80211_i.h                         |  119 +-
 net/mac80211/iface.c                               |   18 +-
 net/mac80211/key.c                                 |  837 +++++++-------
 net/mac80211/key.h                                 |   60 +-
 net/mac80211/link.c                                |  132 ++-
 net/mac80211/main.c                                |   15 +-
 net/mac80211/mesh.c                                |    3 +-
 net/mac80211/mesh.h                                |   21 +-
 net/mac80211/mesh_hwmp.c                           |    8 +
 net/mac80211/mesh_pathtbl.c                        |    5 +
 net/mac80211/mesh_plink.c                          |    2 +-
 net/mac80211/mlme.c                                | 1169 ++++++++++++++------
 net/mac80211/mlme.h                                |   70 ++
 net/mac80211/ocb.c                                 |    2 +-
 net/mac80211/parse.c                               |  167 ++-
 net/mac80211/pm.c                                  |    6 +-
 net/mac80211/rate.c                                |    6 +-
 net/mac80211/rc80211_minstrel_ht.c                 |    4 +-
 net/mac80211/rx.c                                  |  153 ++-
 net/mac80211/scan.c                                |    2 -
 net/mac80211/spectmgmt.c                           |   14 +-
 net/mac80211/sta_info.c                            |  285 ++++-
 net/mac80211/sta_info.h                            |   55 +-
 net/mac80211/status.c                              |    8 +-
 net/mac80211/trace.h                               |    5 -
 net/mac80211/tx.c                                  |   29 +-
 net/mac80211/uhr.c                                 |   64 +-
 net/mac80211/util.c                                |   21 +-
 net/mac80211/wep.c                                 |    4 +-
 net/mac80211/wpa.c                                 |   38 +-
 net/wireless/Makefile                              |    2 +
 net/wireless/core.c                                |  160 ++-
 net/wireless/core.h                                |   13 +-
 net/wireless/mlme.c                                |  226 +++-
 net/wireless/nl80211.c                             |  483 +++++++-
 net/wireless/nl80211.h                             |   11 +
 net/wireless/rdev-ops.h                            |   48 +
 net/wireless/reg.c                                 |   82 +-
 net/wireless/scan.c                                |   38 +-
 net/wireless/sme.c                                 |    6 +-
 net/wireless/trace.h                               |  228 ++++
 net/wireless/util.c                                |   53 +-
 net/wireless/wext-compat.c                         |    5 +
 123 files changed, 6656 insertions(+), 2160 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/scan_param.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/scan_param.h
 create mode 100644 net/mac80211/mlme.h
