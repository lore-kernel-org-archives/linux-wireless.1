Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794627049;
	b=iKQs4j07bfWPLeGsQgy1cSdzq5JBWWCPyrsd4Jq8/42ZvG1a8XIwD4KQppzdM0pMHKfr
	 zB/oGGTiaZBkDcGZyWuF5ere0E2kCwIFMRZGZyCfJcNdSMgfzkaaiBneaxmhIM0WbsRag
	 rJ+ky2GKC7SrqRC3BhzwyAkE4wycIDZpuqyb7F3Z8soh9YAnqGeArD3GNW2D+msj3bKAz
	 pJfuPdMwMiW6Or2Gzf5vauwGKxU2WOp0dyUEK0ESTrMC276cB5qJScOf/knql9E1V16Ff
	 CikgVIn50EOvmfMOr7+WId0zBu6vdhu0vrxh4SDiA0bMsDHP8zOihyWUMjls37GFKHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
	b=kJX3BqgV+JG4taN0NSuD+fJyyAWcyWn/ozSRObZtHW+r3vuShn5G8Hb0hh/FxPnE3j0q
	 dW389AF6cZvoGzav2Y/oif5Gbo0ntQYg5WncKNtG7JWsrBTnmv4gH5zmBrFKeU3O60dKW
	 24ULAcg3/9kU//fCDgeZj/uQmQQLiTnAHtEEjr51600Or7bsIurjJJQTbm/827JBmWQ0d
	 MJDJ3BsWq3JA9y02cSzIkQkBDbZGtR5n9vZGATGsi7z4cMMRzkUw2Jx3bP7FZyZqs7qV4
	 xxHFXWDvv6eL4vbGSexkPkUx/cGNk93AbkOb7nEe0yUQMjjFHzV94/RqsROiTClRcwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nujAVQzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96239606A890
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 03:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96239606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nujAVQzE
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2b25786d9so1817356137.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 19:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794627047; cv=none;
        d=google.com; s=arc-20260327;
        b=ryFLG0FmoWnIVzhZlF6EnZbgccOMckqRGTKzatkKAdaFXqwsxJWo0ZL6OmPndpifAA
         ZDMQT7Qffvm/M5B8fZOOzeUSknfstsUMVbfBNhSgIiRor/qYekZ+fq+tbRFtD96G+j7v
         TpM0kkKZG93/Clnnu0Jm6SwqghvEo/QrcsZD9Pko7sw2Sa5gwZkye+izV+bCym5m0wyB
         0poMSoBm98DqWg+crLl+lUANqMhJ2OPZKXQI7jqdO/xJdXZF0n93XpZr3KB8x0Aioctv
         MU6CJwW0QYcx1aclcTfm3cSfppYmCbfEwi7ScuQ5zF133WC8rgxvnPXoNhy+n7h+mosd
         4GEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        fh=unOd+iR/s4g3ccNRscfqoIvCvfbfQt24cpkffWnNbx8=;
        b=KOhCTUTw0JJT/ISZGRGB3cV8h426pVCZjK840At7ZtYVxkbRzT3h3N4mSfUF8u1QCQ
         IZrgaWtdOihNCcjYTb8CLKVttNqEkWTzmWpmggJUX4eqi4lfKWM0LkPfixfb7M5/ovXG
         44J0VD4LboWpp/zLBNNEBRUDHxI42bB8JKUy3cp6hVaJg+BvuSjJOmAqJrBcsperB4ME
         7/LXTfQd+uRlUsNTrYTYguV5cynk/zGzjeGVQyevwEG7TQGeGMmKYCDerloaZpu8EiUa
         txbX1P8JDBM+aMZa9l5rhEJeyyiro8zC0YC1F19NolWdFisRuGTjJXCFkZSw2WVWWL2z
         iHHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794627047; x=1795231847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        b=nujAVQzELW2hc5gQ8H8056GkEhIG4MoL2e6FtlpJAUkfnW8PYwvhbht2DP3dW5oJ3s
         6LRDZQhK4atycpqzD3vyJDrfXIlJYD691XwapX8lNo8q4lNgZPVhVdOkpzzkjOS5U7+J
         RwAzJra3Hkv70VKEBPj913ImCE6p24vOSxMESV6fE1sfFicmbAIidRN1E30oV2OYVxIl
         X6seswygXCFmbQW1BRTdHJI8xDSNLFV8ehfB3AjVySdgNcW85eT9WrsySE466J4c0yWh
         rDhfrwp1K6H7zRCvMfRA32hTCgpIW2ugAPRD9FWtzdCBuqMU8y4Y+ZT0juVF5fw5PcQE
         5OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627047; x=1795231847;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jwB/23jRHhcsHV0wrCuIYDgqv/rmgRn7H8RU3sd+R6Q=;
        b=cvKlP59jsHKK7B1BYx6SwKsXZvyGIvb/2LsEXeALlaiiKtOMkV9InG+JglD1U0KAgS
         uslIEDQORNzvJuKptVBwXtvvQnMeEvU/IndUuxrKvVPqH4WDL0E48uHGGS4Dn6IWCBxG
         pplT9Ze30WkkOOFok9MzO/fwfFU/HWOvovNl6YgWwZRkz1Lke+sIvX2/5Yc2qolChYVK
         U7sYgVjtxsB6RADNwiSgCFMSi5cl+oZM8MyCyF6zQP0rdnWQrEWrVKIqBOHWCPHwhvL1
         BVOO1ieP3iLjL9d3xLeRlcKpQwilt8+vBAfSyg+PuMJGP7jxekysaBaTlX/jleR3Ensh
         yl0Q==
X-Gm-Message-State: APuU4Z+7QaQQ4/KZDEGF1nPhplh8mjP3X9s7OwMpg3K7RSjoBljd6FSP
	sgBclDCBt2nMtuEWsV96jb+mnwvAaIBrcjyUCsKVyxg6u6z6YyrZqJ2o719Y81dZTDrADCgcAKB
	oXZ+7ICXmviT4742WMLInueGis8Hleni5kuyf
X-Gm-Gg: AYBFou3ADo4Z+ugKag3yu++U3dlXBA3wbmOHUyHGnvQEADg0BekbWVFslxrwlBGcjVu
	DmSIPV8qJEzyQ1VX8S51RsfIRT3ZgLjtZfHJ86l533YPBJrf/xoPMnKOC5jWQsXsD84IJ99MxIr
	DiedAD6ghWSojMTy2K4ZG4ua0PLiQ0FHLKJ65iktrKPw/EVq6e8nigoGXvvDoZpKr4Wgx471Ta5
	qQlbzq13TfFzcBI5EIiSTXV3pO+5nsjPkr2+JE4k0b5ZrYbjFRl37+Ovjq2PRzsmKjmuolj4jNr
	+jyWdJttMLCBPAvE6gnfwuxzukYf2ROz+EgXdmxzke5pX66Zc4BQigl0K4BSrgjYy+HpcFR8uuj
	sMRUz0Zo4XyAVHRKyOXE5oY9mng1eGaq4F671wdr3vWV0l/PJxOfufV7wEkEd7jkcAM0hVX36KG
	+VdQ==
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id
 ada2fe7eead31-7d64d43bcc7mr1812425137.2.1794627047354; Fri, 13 Nov 2026
 19:30:47 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Fri, 13 Nov 2026 21:30:36 -0600
X-Gm-Features: AclHuK8b75Fk-1RSRh9Q1vYDh7AWBSUZpRAbQcRD3QXXJl6D-8li7ykdtCf4qmc
Message-ID: <CAKobHXD6beuX0RJb0CS+aMB9N9_8tbvd-LKtpuDHRbhsBNsPrg@mail.gmail.com>
Subject: ath12k: NULL dereference in ath12k_link_sta_rhash_delete() when an
 MLO station is removed during recovery
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I hit a kernel panic on an AP with three QCN9274 hw2.0 on PCIe that are
grouped into one hardware group through the WSI graph (IPQ9574 board,
one AP MLD across 2.4, 5 and 6 GHz).

Software: OpenWrt main, kernel 6.18.60, wireless stack from backports
7.2 with OpenWrt's ath12k patches (none of them touch the functions
named below), hostapd from OpenWrt main, firmware
WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1 on all three chips.

Seen once; I have not tried to reproduce it yet. This report and the
source analysis in it were written with Claude, an AI coding assistant.

What happened

1. A multi-link client (Intel BE200, links on 6 GHz and 5 GHz,
   association link 6 GHz) was connected and passing traffic normally.

2. The 6 GHz link of the AP MLD was restarted alone (OpenWrt "wifi
   reload" after a channel width change on that radio). hostapd logged
   "Announce the removal of ap-mld0 on phy phy1.0 before its restart"
   and CTRL-EVENT-LINK-STA-REMOVED link_id=0. The driver logged (the
   prefix "ath12k_wifi7_pci 0002:01:00.0:" is shortened to "0002:",
   that is the 6 GHz chip; "0003:" is the 5 GHz chip; client addresses
   are masked):

   0002: Timeout in receiving vdev delete response
   0002: removing stale peer xx:xx:xx:xx:xx:2a from vdev_id 0

   From here the client was still associated (hostapd listed it on the
   5 GHz link, the client showed both links), but no frame reached it
   any more. That is the first problem: the station is neither moved
   nor removed.

3. Two minutes later the client disconnected and reconnected:

   0002: failed to clear all peer keys for vdev 1: -2
   0002: failed to find the peer to stop rx aggregation
   ap-mld0: HW problem - can not stop rx aggregation for
         xx:xx:xx:xx:xx:27 tid 0
   0002: mac station xx:xx:xx:xx:xx:2a disconnect for vdev 1 without
         any connected station
   0002: failed to get peer assoc conf event for xx:xx:xx:xx:xx:2b
         vdev 1
   0002: Failed to associate station: xx:xx:xx:xx:xx:2b
   0002: unable to move link sta 0 of sta xx:xx:xx:xx:xx:2b from
         state 2 to 3
   0002: failed to send WMI_PEER_DELETE cmd
   0002: failed to delete peer vdev_id 1 addr xx:xx:xx:xx:xx:2b
         ret -108
   0003: failed to send WMI_PEER_DELETE cmd
   0003: failed to delete peer vdev_id 0 addr xx:xx:xx:xx:xx:2a
         ret -108
   mhi mhi2: Requested to power ON
   (then mhi1 and mhi3: all three devices of the group restart)

4. About six seconds into that recovery:

   Unable to handle kernel read from unreadable memory at virtual
     address 0000000000000000
   Internal error: Oops: 0000000096000005 [#1] SMP
   CPU: 3 UID: 101 PID: 2306 Comm: hostapd
     Tainted: G O 6.18.60 #0 NONE
   pc : ath12k_link_sta_rhash_delete+0x3c/0x220 [ath12k]
   lr : ath12k_mac_op_sta_state+0xe18/0x1764 [ath12k]
   Call trace:
    ath12k_link_sta_rhash_delete+0x3c/0x220 [ath12k] (P)
    ath12k_mac_op_sta_state+0xe18/0x1764 [ath12k]
    drv_sta_state+0x80/0x3e4 [mac80211]
    sta_set_sinfo+0x1158/0x1194 [mac80211]
    sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
    ieee80211_del_station+0x1c/0x54 [mac80211]
    nl80211_del_station+0xdc/0x144 [cfg80211]
    genl_family_rcv_msg_doit+0xcc/0x140
    ...
   Code: f9641035 f9642037 79505418 79505819 (f94002b4)
   Kernel panic - not syncing: Oops: Fatal exception in interrupt

What the cause of the panic looks like

ath12k_core_reconfigure_on_crash() starts by calling
ath12k_link_sta_rhash_tbl_destroy(ab), which frees the table and sets
ab->rhead_sta_addr to NULL. The table is created again in
ath12k_core_start() once the firmware is back. In that window user
space can still delete a station. For an MLO station
ath12k_mac_ml_station_remove() calls ath12k_link_sta_rhash_delete() for
every link without looking at the device state, and
ath12k_link_sta_rhash_remove() passes ab->rhead_sta_addr straight to
rhashtable_remove_fast(). With the table pointer NULL that is the read
at address 0. ath12k_link_sta_rhash_insert() and
ath12k_link_sta_find_by_addr() use the pointer the same way.

Questions

- Is the table meant to be torn down at the start of recovery while
  mac80211 still holds stations, or should the entries be flushed and
  the table kept until the stations are gone?
- Would a guard in the insert/remove/lookup helpers (table pointer
  NULL, return -ENOENT) be acceptable as a fix, or should the station
  remove path skip the per-device cleanup while the device is in
  recovery? I can test either on this board.
- Separately, is a restart of a single link of an AP MLD (step 2)
  expected to leave multi-link stations in that state with this
  firmware, or should the station be dropped?

I can provide the full console log.

Hardware and firmware: QCN9274 hw2.0 PCI
WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Thanks,
Christopher Griffin
