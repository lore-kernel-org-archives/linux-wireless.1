Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513825;
	b=4Or8Qg2k3IhOy3atB0PlmH8GC9YEKoFXKT9pf5TD0R+bCZj1wvPtAjL82k2R7m993ftB
	 H6lqjZxRkMdAXLZCSpVEqFVdRITXm/tFODEB/NPsv2Q+B50SCXiO0OHdnCKtpjXuxXS9p
	 BZbcxeaE7A9bTJQgquMQTmnjuHSqBteCXno7JsepI2YO0hyHo8NZolG8kSY8TYrFTEQNt
	 S4IrID4UeagW3m2XqLhj9NEroeGDuMVYjcO4+3QxzYedplIMem4hYikkwmwFgmPwAOrjo
	 2rR6q2Sh8L1F8fr7qVfKJHfqS54SmiwEL3ViARh2Du1LJesY+dfJiV+M0Bvu6RTSbkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513825;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:Content-Language:Autocrypt:Content-Type:
	 Content-Transfer-Encoding;
	bh=tZaBdb0jvCXM5DRiiKoRuDAdBL9vn5kc3Y0KaozRTS0=;
	b=NG5Ing1DRVTgDmqYe9YIJZNkdR8ypCJ+NA2ZdWLw8IFw+i4eQVq9E3RuAqMtXzuINJyt
	 D0osRMNUWZWSxiUW++a0uOy0pataMfw0o4kQYG5v327fPh1mOspHCnur4Pn9xbXCukbg7
	 at8BT178lMQ5dhTz20ks2PV++FGdahjVw9nK2W+5KgnkNl7bZlwfmr8WTXCOmSvkRsZE6
	 tLxK1OpLcJG23RWQjXgZ9ZyoSx40GGs4Ecx9oLAKf+npDsAERNPzuzvgy/tRPlU/x1d2Q
	 gPlxqnzq5bA3ege75pzwuJuOYUMdgB5fBdIu3HZszxHJ4MU/VHZ/AyD5emqbC+XCg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qlD71bdK;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBBD606A68E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FBBD606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=qlD71bdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tZaBdb0jvCXM5DRiiKoRuDAdBL9vn5kc3Y0KaozRTS0=; b=qlD71bdKScmZQiLECj11kawyfk
	G4Jiy5EOA5eeXtL0ITaCywzW1gYFVbPUWumga5Gh9xn1bzJVbB3Cac7T2hq02ZnTPObg6CXequAAc
	pzsLyNLOZ/vtOOgNUoF4R9EF8jEYk+ETQnmB64wJl7LAdHAC1ir8jsMZ25tTTDl4D46Q=;
Received: from p54a43646.dip0.t-ipconnect.de ([84.164.54.70] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVnAL-007eQ0-12;
	Tue, 24 Nov 2026 10:50:21 +0100
Message-ID: <5c786ca9-ace9-4beb-83b0-40932128ccb0@nbd.name>
Date: Tue, 24 Nov 2026 10:50:20 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Felix Fietkau <nbd@nbd.name>
Subject: pull request: mt76-next 2026-11-24
To: linux-wireless <linux-wireless@vger.kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Here's my mt76 pull request for 7.5

- Felix

The following changes since commit 24630ff92eff08500ec4772728d4b1fa08c28f47:

   Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-11-19 10:02:10 -0800)

are available in the Git repository at:

   https://github.com/nbd168/wireless tags/mt76-next-2026-11-24

for you to fetch changes up to 34123d046b86aa8d3ebfa2d1134de583682ae48c:

   wifi: mt76: mt7603: remove dead WEP handling code (2026-11-24 10:20:53 +0100)

----------------------------------------------------------------
mt76 patches for 7.5

- bounds checks for mcu messages
- MLD fixes for 7996 + 7925
- reset recovery improvements
- mt7996 puncturing support
- fixes and cleanups

----------------------------------------------------------------
Alexey Charkov (1):
       wifi: mt76: mt7921u: Don't reset the USB device on probe

Charlie-cy Wu (1):
       wifi: mt76: mt7921: truncate the MTCL config to u8 explicitly

Chengwei Yu (5):
       wifi: mt76: mt7925: add NAN low power event control on suspend/resume
       wifi: mt76: mt7925: implement NAN key management MCU command
       wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
       wifi: mt76: mt7925: implement mt7925_nan_set_key for NAN security
       wifi: mt76: mt7925: install NAN BIP keys standalone in sta_key_tlv

Cristian Papa (3):
       wifi: mt76: mt76x02: keep A-MSDU subframe buffers at even addresses
       wifi: mt76: mt76x02: sync the group key PN before a restart
       wifi: mt76: mt76x02: keep stations registered during watchdog recovery

David Bauer (3):
       wifi: mt76: mt76x02: only read QoS control for QoS data frames
       wifi: mt76: mt7603: track consecutive failed PSE resets
       wifi: mt76: mt7603: avoid deadlock on failed channel config

Devin Wittmayer (1):
       wifi: mt76: fix NULL dereference reading napi_threaded in debugfs

Eason Lai (2):
       wifi: mt76: flush a partial rx A-MSDU when its station is removed
       wifi: mt76: free a partial rx A-MSDU when the phy is unregistered

Emery Hsin (1):
       wifi: mt76: mt792x: drop redundant MCU restart before firmware download

Facundo Karanik (1):
       wifi: mt76: mt7615: skip MT_TXD5_TX_STATUS_HOST for group frames

Felix Fietkau (152):
       wifi: mt76: bypass DPD on a scan channel while a monitor is active
       wifi: mt76: honour the more-data flag when releasing buffered frames
       wifi: mt76: mt76x02: serialise wcid drop mask updates
       wifi: mt76: mt76x02: clear the wcid drop mask for all powersave responses
       wifi: mt76: mt7921: validate CLC event length
       wifi: mt76: mt7921: validate NIC capability TLV payload lengths
       wifi: mt76: mt7925: validate NIC capability TLV lengths
       wifi: mt76: mt7925: free the MCU event when linearising fails
       wifi: mt76: mt7996: validate radar, thermal and WED RRO event lengths
       wifi: mt76: connac: validate the RAM firmware region table
       wifi: mt76: mt7996: validate the RAM firmware region table
       wifi: mt76: mt7925: validate CLC firmware regions and records
       wifi: mt76: connac: validate the ROM patch section table
       wifi: mt76: mt7996: validate the ROM patch section table
       wifi: mt76: mt792x: use mt76_connac2_fw_check()
       wifi: mt76: mt7996: take the link of an 802.3 frame from its station
       wifi: mt76: mt7996: do not update beacons while CSA is active
       wifi: mt76: mt7996: only remove a BMC STA_REC that was added
       wifi: mt76: mt7996: pass the puncturing bitmap to the firmware
       wifi: mt76: abort a scan when the chanctx changes
       wifi: mt76: set the channel again when the chanctx puncturing changes
       wifi: mt76: mt7996: advertise preamble puncturing support
       wifi: mt76: mt7996: keep scan and ROC links out of the MLD group
       wifi: mt76: mt7996: factor the vif link teardown out of remove_interface
       wifi: mt76: mt7996: destroy station links before the MLD group is freed
       wifi: mt76: mt7996: send MLD link operations for an AP MLD only
       wifi: mt76: mt7996: set up a vif link again on another radio
       wifi: mt76: mt7996: describe an MLD peer with the PEER_MLD command
       wifi: mt76: mt7915: honour the valid flag in efuse block reads
       wifi: mt76: mt7996: skip MLD address translation for encap offload frames
       wifi: mt76: mt7921: honour the valid flag in efuse block reads
       wifi: mt76: mt7915: upload the CSA beacon only once
       wifi: mt76: read the chanctx of a link once
       wifi: mt76: restart the beacon monitor of a link that gets a chanctx again
       wifi: mt76: publish the beacon monitor interval after its timestamp
       wifi: mt76: mt7996: keep rx header translation off while a monitor runs
       wifi: mt76: mt7996: apply monitor mode again after a full reset
       wifi: mt76: check the RX PN of an MLD peer once per peer
       wifi: mt76: mt7996: send no MLD_SETUP when station links only go away
       wifi: mt76: mt7996: keep a unicast management frame on its MLO link
       wifi: mt76: connac: bound the scan IEs in mt76_connac_mcu_hw_scan()
       wifi: mt76: mt7925: disable NAN again if the PHY setting update fails
       wifi: mt76: don't pin undrainable PS stations in the tx scheduler
       wifi: mt76: mt7996: return a negative error for a firmware status
       wifi: mt76: mt7996: use the default timeout for STA_REC and BSS_INFO
       wifi: mt76: mt7915: use the default timeout for STA_REC and BSS_INFO
       wifi: mt76: delete only the RX NAPIs that were added
       wifi: mt76: mt7996: report radar on the channel context of its band
       wifi: mt76: mt7996: stop WED before the DMA reset of a full reset
       wifi: mt76: skip the radiotap TLVs in mt76_skb_get_hdr()
       wifi: mt76: find the first A-MSDU subframe behind the radiotap data
       wifi: mt76: mark all but the last subframe of an A-MSDU chain
       wifi: mt76: mt7996: set qos_ctl of a frame that hardware reordered
       wifi: mt76: check the PN of a BA session frame at its release
       wifi: mt76: check the RX PN of CCMP-256, GCMP and GCMP-256 keys
       wifi: mt76: connac: return a negative error for a firmware status
       wifi: mt76: guard the tx_list of every phy with one lock
       wifi: mt76: keep an unpublished wcid off the TX and poll lists
       wifi: mt76: mt7925: do not take iflist_mtx under the mutex
       wifi: mt76: mt7925: take each polled link under sta_poll_lock
       wifi: mt76: mt7615: take each polled station under sta_poll_lock
       wifi: mt76: mt7996: limit the SKU TX power to the current channel
       wifi: mt76: use the link struct of a primary station link other than 0
       wifi: mt76: refuse a scan or ROC on a radio during a channel switch
       wifi: mt76: mt7996: keep RX running on a monitor with fcsfail
       wifi: mt76: look up the BA session of a BlockAckReq on the primary link
       wifi: mt76: free a replayed 802.3 frame with all its subframes
       wifi: mt76: keep one remain-on-channel request per interface
       wifi: mt76: mt7996: install station keys on a link without chanctx
       wifi: mt76: keep mac_work running when a ROC request fails
       wifi: mt76: keep mac_work running when a chanctx switch fails
       wifi: mt76: mt7925: install pairwise keys on station links added later
       wifi: mt76: wait for a ROC completion in progress on cancel
       wifi: mt76: mt7925: keep the MLD record until the last link is removed
       wifi: mt76: mt7996: read a new MIB baseline after the firmware reload
       wifi: mt76: mt7915: read a new MIB baseline after the firmware reload
       wifi: mt76: mt7921: skip the ND offload update of a vif not in the driver
       wifi: mt76: mt7925: skip the ND offload update of a vif not in the driver
       wifi: mt76: take the remaining wcids off the phy tx_list at reset
       wifi: mt76: take the remaining wcids off sta_poll_list at reset
       wifi: mt76: mt7915: take the remaining stations off sta_rc_list at reset
       wifi: mt76: mt7996: list only published links on sta_rc_list
       wifi: mt76: mt7996: take the remaining links off sta_rc_list at reset
       wifi: mt76: mt7915: take the TWT flows of a removed station off twt_list
       wifi: mt76: mt7996: take the TWT flows of a removed station off twt_list
       wifi: mt76: mt7915: drop the TWT agreements at a full reset
       wifi: mt76: mt7996: drop the TWT agreements at a full reset
       wifi: mt76: mt7915: read twt_list under the mutex in twt_stats
       wifi: mt76: mt7996: read twt_list under the mutex in twt_stats
       wifi: mt76: mt7915: publish the global wcid again after a full reset
       wifi: mt76: mt7996: publish the global wcid again after a full reset
       wifi: mt76: mt7925: keep the antenna mask across a firmware reload
       wifi: mt76: mt7925: remove mt7925_mcu_del_dev()
       wifi: mt76: mt7921: keep the antenna mask across a firmware reload
       wifi: mt76: mt792x: flush frames that still wait for the TX worker
       wifi: mt76: mt7925: send the deauth of an MLD station on its AC queue
       wifi: mt76: mt7925: free the vif links when all links go
       wifi: mt76: mt7925: free removed vif links after an RCU grace period
       wifi: mt76: remove a replayed station from the driver before the add
       wifi: mt76: mt7925: run the reset link replay under the wiphy lock
       wifi: mt76: mt7925: take the mutex before the link_info_changed lookup
       wifi: mt76: mt7925: hold the mutex for the link lookup in conf_tx
       wifi: mt76: mt7925: skip a polled link without a station
       wifi: mt76: mt7925: skip a link without a link conf in the MLO PS update
       wifi: mt76: mt7925: restore the beacon filter when monitor mode ends
       wifi: mt76: usb: do not park the TX worker again under MT76_RESET
       wifi: mt76: mt7925: keep the default link in the active links
       wifi: mt76: mt7925: read the monitor state under the mutex for deep sleep
       wifi: mt76: clear roc_link before the ROC link is freed
       wifi: mt76: mt792x: handle all interfaces of a channel context
       wifi: mt76: mt792x: set up the sniffer when a monitor gets its channel
       wifi: mt76: buffer Disassociation frames for stations in power save
       wifi: mt76: mt7921: read the monitor state under the mutex for deep sleep
       wifi: mt76: mt7925: wake the device to unassign a channel context
       wifi: mt76: mt7996: keep the firmware log settings across a reload
       wifi: mt76: mt7915: keep the firmware log settings across a reload
       wifi: mt76: mt7996: name a new secondary link to the firmware first
       wifi: mt76: add a helper to point the TXQs of a station at a wcid
       wifi: mt76: mt7925: move the default link to a remaining link
       wifi: mt76: mt7925: keep the deflink wcid index until station removal
       wifi: mt76: mt792x: look up the TX links under RCU
       wifi: mt76: mt7925: read the links under RCU in the IPv6 notifier
       wifi: mt76: mt7925: abort a ROC on the BSS that requested it
       wifi: mt76: mt7925: take the link conf of a removed link from old[]
       wifi: mt76: mt7925: send the MLO ROC only for a station vif
       wifi: mt76: mt7996: send the Beacon rate table again after a full reset
       wifi: mt76: mt7996: restore the operating channel after an L1 SER
       wifi: mt76: reset the DFS state of a phy at a full reset
       wifi: mt76: mt7996: abort a background CAC at a full reset
       wifi: mt76: mt7915: abort a background CAC at a full reset
       wifi: mt76: mt7996: clear the airtime counts with the WTBL counters
       wifi: mt76: mt7996: drop the host WTBL write of a fixed GI
       wifi: mt76: mt7925: don't reset the USB device on probe
       wifi: mt76: mt7925: undo the BSS of a failed interface add
       wifi: mt76: mt7915: read the PS sync state of mt7986 and mt7981
       wifi: mt76: mt7915: leave the BIP check of a group frame to mac80211
       wifi: mt76: mt7921: leave the BIP check of a group frame to mac80211
       wifi: mt76: mt7925: leave the BIP check of a group frame to mac80211
       wifi: mt76: mt7615: leave the BIP check of a group frame to mac80211
       wifi: mt76: mt7925: use wcid_to_sta() in mt7925_mac_write_txwi_8023()
       wifi: mt76: log the firmware status of a failed MCU command
       wifi: mt76: mt7996: clear the ADM counters only in the airtime poll
       wifi: mt76: mt7915: send mt7981 only the group units its firmware holds
       wifi: mt76: take the DFS state from the off-channel flag
       wifi: mt76: read roc_phy and roc_link once without the mutex
       wifi: mt76: mt7996: add only the active links of a station MLD's peer
       wifi: mt76: mt7996: resume the radar TX stop at an operating channel set
       wifi: mt76: mt7996: divide by the full TWT wake interval
       wifi: mt76: mt7915: divide by the full TWT wake interval
       wifi: mt76: mt7996: send the SRG bitmaps in one block per band
       wifi: mt76: connac: set the band of an RX block ack scoreboard reset
       wifi: mt76: mt7915: reset the CCA statistics of band 1 on mt7916

Jacobs Wu (14):
       wifi: mt76: mt7925: send the common scan IEs and size the request
       wifi: mt76: mt7925: assign the interface WTBL to the NAN management TXQ
       wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA removal
       wifi: mt76: gate NAN unicast mgmt by peer availability via STA queues
       wifi: mt76: mt7925: hold NAN mgmt TX to the discovery window
       wifi: mt76: mt7925: double the retry budget for NAN unicast management
       wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW period
       wifi: mt76: mt7925: defer the NAN joined-cluster event out of NAN_START
       wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap state
       wifi: mt76: mt7925: disable only the RX NAPI instances that exist
       wifi: mt76: mt7925: stop queueing resets once the device is being removed
       wifi: mt76: mt7925: bound the lifetime of NAN unicast management frames
       wifi: mt76: mt7925: always deliver the joined-cluster event through the deferred work
       wifi: mt76: mt792x: allow three channels in the NAN combination

Jared Huang (1):
       wifi: mt76: mt7925: add 5.9G channel list and last batch size for sar update

Jeff Hsu (1):
       wifi: mt76: mt7925: do not reset WPDMA before stopping NAPI on reset

Jiale Yao (29):
       wifi: mt76: mt7603: validate MCU response length
       wifi: mt76: mt7915: validate MCU response lengths
       wifi: mt76: mt7915: validate MURU statistics response
       wifi: mt76: mt7915: validate EEPROM response length
       wifi: mt76: mt7915: validate free-block response length
       wifi: mt76: mt7915: validate channel MIB response length
       wifi: mt76: mt7915: validate RX rate response length
       wifi: mt76: mt7915: validate WED TX statistics response
       wifi: mt76: mt7915: validate RF register response length
       wifi: mt76: mt7996: clamp VHT/HE beamforming NSS
       wifi: mt76: mt7996: clamp EHT beamforming NSS
       wifi: mt76: mt7921: validate MCU response lengths
       wifi: mt76: mt7921: validate EEPROM response length
       wifi: mt76: mt7921: validate TX power response length
       wifi: mt76: mt7921: validate testmode query response
       wifi: mt76: mt7925: validate MCU response lengths
       wifi: mt76: mt7925: validate register query response
       wifi: mt76: mt7925: validate EEPROM response length
       wifi: mt76: mt7925: validate temperature response length
       wifi: mt76: mt7925: validate TX power response length
       wifi: mt76: mt7925: validate radio status response
       wifi: mt76: mt792x: bound firmware release-info parsing
       wifi: mt76: mt7996: validate MCU response lengths
       wifi: mt76: mt7996: validate EEPROM response lengths
       wifi: mt76: mt7996: validate free-block response length
       wifi: mt76: mt7996: validate channel MIB response length
       wifi: mt76: mt7996: validate temperature response length
       wifi: mt76: mt7996: validate RF register response length
       wifi: mt76: mt7996: stop radios after add failure

Josef Schlehofer (2):
       wifi: mt76: allow LEDs with only brightness_set_blocking
       wifi: mt76: mt7925: add LED support for USB adapters

Michał Mirosław (1):
       wifi: mt76: mt7925: deduplicate MLD support code in mt7925_mac_link_sta_add

Oleh Shcherba (1):
       wifi: mt76: mt7603: remove dead WEP handling code

Ryan Brue (4):
       wifi: mt76: mt7663s: don't advertise random MAC address scans
       wifi: mt76: mt7615: wait while Bluetooth downloads the MT7663 patch
       wifi: mt76: sdio: use CMD52 to mask and unmask the interrupt
       wifi: mt76: mt7663s: use RX enhance mode

Shiji Yang (2):
       wifi: mt76: simplify power calculation for mt7603 and mt7615
       wifi: mt76: connac: remove useless tx_power calculation

Thomas Fourier (1):
       wifi: mt76: sdio: Fix possible data race when dequeuing skb

Tony-TC Lee (3):
       wifi: mt76: mt7925: zero the whole testmode command buffer
       wifi: mt76: mt7925: report an error for an unknown testmode query id
       wifi: mt76: mt7925: accept testmode replies shorter than the buffer

Xiangwu Lai (1):
       wifi: mt76: mt7915: fix clock leak in mt798x_wmac_init()

Yin-Ming Li (3):
       wifi: mt76: mt7921: quiesce work before unregistering
       wifi: mt76: mt7921: drain PCIe activity before freeing queues
       wifi: mt76: mt7921: disable SDIO work before bus teardown

Zhao Li (1):
       wifi: mt76: mt7996: check the RX WCID before using its station link

Ziheng Wei (2):
       wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
       wifi: mt76: connac: use wcid_to_sta() when dequeuing PM frames

allen.chien (3):
       wifi: mt76: mt7925: skip WoW ctrl for unassociated stations
       wifi: mt76: mt7925: program the fixed rate table via MCU on MT7928
       wifi: mt76: clamp channel power to the s8 range

james-ly huang (8):
       wifi: mt76: mt7925: drop probe frames received on a foreign channel
       wifi: mt76: mt7925: bound the TX lifetime of P2P mgmt frames
       wifi: mt76: mt7925: give every P2P interface a BMC wcid of its own
       wifi: mt76: mt7925: harden the ROC channel-grant handshake
       wifi: mt76: mt7925: describe the real chandef in ROC requests
       wifi: mt76: mt7925: request the channel before programming a GO BSS
       wifi: mt76: mt7925: inject the deauth for an aging-timeout SAP event
       wifi: mt76: mt7925: track BSS absence and drop stale GO probe responses

  drivers/net/wireless/mediatek/mt76/agg-rx.c          |  13 ++-
  drivers/net/wireless/mediatek/mt76/channel.c         | 144 ++++++++++++++++++-----
  drivers/net/wireless/mediatek/mt76/debugfs.c         |   3 +
  drivers/net/wireless/mediatek/mt76/dma.c             |   3 +-
  drivers/net/wireless/mediatek/mt76/mac80211.c        | 350 +++++++++++++++++++++++++++++++++++++------------------
  drivers/net/wireless/mediatek/mt76/mt76.h            | 117 ++++++++++++++++++-
  drivers/net/wireless/mediatek/mt76/mt7603/mac.c      |  27 ++---
  drivers/net/wireless/mediatek/mt76/mt7603/main.c     |   8 +-
  drivers/net/wireless/mediatek/mt76/mt7603/mcu.c      |   8 +-
  drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h   |   1 +
  drivers/net/wireless/mediatek/mt76/mt7615/init.c     |   6 +
  drivers/net/wireless/mediatek/mt76/mt7615/mac.c      |  20 +++-
  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  33 ++++--
  drivers/net/wireless/mediatek/mt76/mt7615/sdio.c     |  28 ++++-
  drivers/net/wireless/mediatek/mt76/mt7615/usb.c      |   2 +-
  drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c |   3 +-
  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  94 ++++++++++++---
  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  30 ++++-
  drivers/net/wireless/mediatek/mt76/mt76x0/pci.c      |   4 +-
  drivers/net/wireless/mediatek/mt76/mt76x0/usb.c      |   3 +-
  drivers/net/wireless/mediatek/mt76/mt76x02.h         |   2 +
  drivers/net/wireless/mediatek/mt76/mt76x02_mac.c     |  22 +++-
  drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c    |  27 ++---
  drivers/net/wireless/mediatek/mt76/mt76x02_txrx.c    |  25 +++-
  drivers/net/wireless/mediatek/mt76/mt76x02_util.c    |  11 +-
  drivers/net/wireless/mediatek/mt76/mt76x2/pci.c      |   3 +-
  drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c |   1 +
  drivers/net/wireless/mediatek/mt76/mt76x2/usb.c      |   3 +-
  drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c  |  55 +--------
  drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c   |   2 +-
  drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h   |   2 +
  drivers/net/wireless/mediatek/mt76/mt7915/init.c     |  29 +++--
  drivers/net/wireless/mediatek/mt76/mt7915/mac.c      |  51 ++++++--
  drivers/net/wireless/mediatek/mt76/mt7915/main.c     |  27 +++--
  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c      | 164 ++++++++++++++++++++++----
  drivers/net/wireless/mediatek/mt76/mt7915/mcu.h      |  10 ++
  drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h   |   3 +
  drivers/net/wireless/mediatek/mt76/mt7915/soc.c      |   8 +-
  drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c  |   3 +-
  drivers/net/wireless/mediatek/mt76/mt7921/init.c     |  31 +++++
  drivers/net/wireless/mediatek/mt76/mt7921/mac.c      |   7 +-
  drivers/net/wireless/mediatek/mt76/mt7921/main.c     |  56 ++++++---
  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c      | 143 +++++++++++++++++------
  drivers/net/wireless/mediatek/mt76/mt7921/pci.c      |  40 +++++--
  drivers/net/wireless/mediatek/mt76/mt7921/sdio.c     |  17 +--
  drivers/net/wireless/mediatek/mt76/mt7921/testmode.c |   4 +
  drivers/net/wireless/mediatek/mt76/mt7921/usb.c      |   3 -
  drivers/net/wireless/mediatek/mt76/mt7925/Makefile   |   2 +-
  drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c  |   8 +-
  drivers/net/wireless/mediatek/mt76/mt7925/init.c     |  54 +++++++++
  drivers/net/wireless/mediatek/mt76/mt7925/mac.c      | 131 ++++++++++++++++++---
  drivers/net/wireless/mediatek/mt76/mt7925/main.c     | 721 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------
  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      | 485 +++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------
  drivers/net/wireless/mediatek/mt76/mt7925/mcu.h      |  13 ++-
  drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h   |  26 ++++-
  drivers/net/wireless/mediatek/mt76/mt7925/nan.c      | 605 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
  drivers/net/wireless/mediatek/mt76/mt7925/nan.h      | 118 +++++++++++++++++++
  drivers/net/wireless/mediatek/mt76/mt7925/p2p.c      | 534 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/net/wireless/mediatek/mt76/mt7925/p2p.h      |  82 +++++++++++++
  drivers/net/wireless/mediatek/mt76/mt7925/pci.c      |  13 +++
  drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c  |  63 ++++++++--
  drivers/net/wireless/mediatek/mt76/mt7925/regs.h     |   8 ++
  drivers/net/wireless/mediatek/mt76/mt7925/testmode.c |  15 ++-
  drivers/net/wireless/mediatek/mt76/mt7925/usb.c      |   4 +-
  drivers/net/wireless/mediatek/mt76/mt792x.h          | 154 +++++++++++++++++++++---
  drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 142 ++++++++++++++++-------
  drivers/net/wireless/mediatek/mt76/mt792x_dma.c      |   3 +
  drivers/net/wireless/mediatek/mt76/mt792x_usb.c      |   4 +
  drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c  |  53 +--------
  drivers/net/wireless/mediatek/mt76/mt7996/dma.c      |  25 +++-
  drivers/net/wireless/mediatek/mt76/mt7996/init.c     |  35 +++---
  drivers/net/wireless/mediatek/mt76/mt7996/mac.c      | 147 ++++++++++++++++++-----
  drivers/net/wireless/mediatek/mt76/mt7996/main.c     | 533 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------
  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 415 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
  drivers/net/wireless/mediatek/mt76/mt7996/mcu.h      |  63 +++++++++-
  drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h   |  14 +++
  drivers/net/wireless/mediatek/mt76/mt7996/regs.h     |   6 +
  drivers/net/wireless/mediatek/mt76/scan.c            |   7 +-
  drivers/net/wireless/mediatek/mt76/sdio.c            |  20 +++-
  drivers/net/wireless/mediatek/mt76/sdio_txrx.c       |  28 +++--
  drivers/net/wireless/mediatek/mt76/tx.c              | 110 +++++++++++++++---
  drivers/net/wireless/mediatek/mt76/usb.c             |   8 +-
  82 files changed, 5078 insertions(+), 1217 deletions(-)
  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/p2p.c
  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/p2p.h
