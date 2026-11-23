Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441300;
	b=2D0TAhSd7Y3Rq/n3RzfVZZF6/obNOSMAuvLaYM43Qd6kuo54rRQ7NmbemYNVw0J0acPi
	 42C9DpH/qTuTh3ieG29NeXvX2w5R4BELMYMys5kGUMsLDPTnD5wdItyyJ+Ld7ocEyCW2l
	 CAcp0/9tofXUn6xGru8ZJbNeO1EP9TFrACRsdMvFe706wQgiROuEq7KLG/6wsQYQA87mB
	 Jadi512OwYhmVxfBMXnqZFPDCNAVBJ/tFqJW9x4x6EOSJJTTTAFrFIExCGn4UzoptPUKi
	 ovNeMDOslsJBFEi3IDkku9p/SoxbqIGf/O29iydZgVIbYHe/fqZ2+5Zlg9pKH9kuXIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
	b=zIsV6hAYRzgtYGF4dIDi7KvqTmx2Y8uhwYtmBamWtHfUyxFudluFkR+aZnCLHbbg5hU1
	 goR8yTMYh6Oqbqb4DU3Vmrbg/cOCH/h70NpFifHQX+cm7GSHWo1uEvbTmYfcq839SGhsf
	 pDNxt/Mt8VviEWdlA3vD6x93wjKcs0pEbeNOXpRB9ygQB7VMtovZzi9BPkxTP3q+U+QDz
	 cblKu+bFMwH3J8cLuiWraythDClXoNbC1KH2iP53XNkLVW9O6La6N/GOb894cjbAgSqzT
	 EWqRDeQd/M1SjODEbBxr+15Gvw8WQAfnbCkctp7pfH+34mQ7n8KimAfpe5XuB6F6hNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uDKHM7Ss;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDF60A3839
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACDF60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uDKHM7Ss
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so3824017a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441299; x=1796046099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=uDKHM7SsB0qkc2HpeKUX7LIJrt0OPC2vI4JaokDuAKG/PNYS7w6pz7a2sOI/jjkjCW
         kvXsFGiyVd+CAnDBUWBFfnV4jHsgfXCkvaOpd92pAAcxYpzvlAZL5KiKc7AeXnH+Dsrv
         qltcajAUj5EpoljOmtCbj/EEfZT5bvaKL++xwxICwz9Gfoq8LylOmAc9i0Os+Yqa1b9s
         JM9Y7Fmf3APXsII+6cmuoEp7pvuqhyKSLT2F/6swr82993KJ6SyLKW69iygNOOQ5NkWv
         9GrChOsjErSifiTBO9kLiphjmlOqHDODHiOIy5Fcp2Fzz85Cp+hFmEz6LPQ0mnv5Ceov
         55pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441299; x=1796046099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dojWJPFgnKNqylC7XUFb1f1eXTEneh88WiZp95WzBxo=;
        b=ut+GycThJBzSMgVIrZ3nFrjYyIVGzLhSbC04wi7k7xIfqM8OMAf92/MIfLJiWE1EQz
         ovgd6zAGd7X1Hz6eH/zATA6OR7SvankSnDgw1EF61JpkTCs8Lhev0b0ro/+8nWCwuATP
         zQhhIWtt3lQEPHsG4BmRqRpMkAJnbkudOIcbun0yFw26Ovch965mBK65W3PwwvjC4lgR
         z9V2eX5Q/KuCdsKn3TmRqrdifjwjY4kkUj2hMpfwIVTuP+3EYA09NXUKydlMJAmDGrOR
         sZN5z3545VryrDDZVh1NwehCGFTi40IbvmoXsVpeDoeoZA93wcuH7gGXbr5NI9olAPJn
         Smow==
X-Forwarded-Encrypted: i=1; AL+hErEVqKAM3XRHdheec4/cjNB7hhmjS4TzJTXfTqCq83aBoszXB0OepalWR+ow5O8Ldu0Ab19qSYfDAJY+ChdJgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lX7n0HqC8xj9WFM52mC07+/vF+GXnOeMZC8tFbP07f9BdLGQK
	CrIETmy/TkVCxX4ScaJA+20TniFWcxAVb8f1aNrMjo35QIJT061YY1d0CYmZShieGA==
X-Gm-Gg: AZFdTZcJeTZG4oPcFOctr0PscCFl8Y3jAXEiVJ2szHvEBoWGkubqcd+FmljDdJIKLzS
	WdhDGWOLQvKrmtY4oxw7KZiJlbYUNFyYdGQXYlEPlvlCXqcIFTsHMjg4WGM4cjMuA7Os7WdFc0W
	j1qlP7lKmi/jhopRz0ua56h3UJWPOllVCH/3its38cS5S8bTwtTubfc1E2CV2OtYvuts4qxHg4v
	tgX+4HWJWGaEV7kIcpGydabr8yUO8L2SQFSAL7AYnYLttbpBbBP7LqBZbFEi1EBy69dfbPgZm6l
	ZpTf/Kh2mB4KSZyrktVns+kFOj9lM94zhDbrSnJr2PF+CyyLai3u5AkHaqMKgqrjsssS6CF1+UN
	Kt5KBN4gXQFxJ7PmVkc66kj70Wup206MhB1Rw5m+6YI4NTZu1jhs1OfIRglVXtaOeBNnNqJFWly
	KfMfyyeuu6I3WhVGi7lvRnUiQYtIRHAWXn6fSUgSiXhloE8TjQR1V+twFhXuWetQ/1DHGcjchLx
	oZuwibGyLU++6JQkxdxkhixdDEWtnM/dt4qO4mKSysJyC1caqpeF8eLRc8WYslXsqJNFSjQRG6Y
	pIWIrkOdqOADaN1SJPvrPMwIRDisH1v3gvqI6K2vDHkpoyS3Cvtr1ElQYrMcDyTGzX4/ojEBjWl
	6/wTdm3iH7n/VoQnV/MoRrCxeGFhM3dFgzXJ1tfbtIn+6yhrwahUy7wpXFy/uJ3jP/5Vc94KU/o
	lZg7jYFzsywMl8q9ekoAq26j/CvkO4JxjNYmtXiuJImD0aKEKRNMOaOoyVx1udHS8qGVEF153bT
	JcH8M7sv1RH0XNAfOQrwAM/8YGj1tGJUQ/0NGptzmJGlFTpZvkL2n4Clr1mH2BXXNGXMstxPTbM
	lwUYgeVQRfxESm0XE2Yd/c4kdVfHsapxNscwCvrHRrDgVsSX2l4puzln2+RhjXSa4XwglhHGXQ=
	=
X-Received: by 2002:a05:6402:4501:b0:6b7:b872:27a0 with SMTP id 4fb4d7f45d1cf-6ba37e84aa9mr7855224a12.21.1795441298551;
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:38 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 00/10] wifi: ath11k: cut the per-packet cost of the RX path
Date: Mon, 23 Nov 2026 14:41:27 +0100
Message-ID: <20261123134137.718575-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

The ath11k RX path spends a part of its time per received frame on work
that the hardware or a cheaper structure already provides: an allocation,
a DMA map and unmap and an IDR walk per buffer, a peer lookup done twice,
a cache invalidation per ring entry and per full buffer, bottom-half
toggles inside a region that already has them off, PPDU stats TLVs nobody
parses, and a flow hash computed again in software. This series removes
these one at a time:

1-2 give the refill ring a page_pool and replace the buffer IDR with a
    table of ids;
3   asks the firmware only for the PPDU stats TLVs the driver parses;
4   sets the skb hash from the receive engine's Toeplitz hash;
5-6 sync the new entries of a cached ring once per head read and
    prefetch the buffers of the entries ahead (cached rings only, that is
    IPQ8074, IPQ6018, QCN9074 and IPQ5018);
7   looks the peer of an MSDU up once;
8   drops a nested bottom-half disable in the reap and refill loops;
9   invalidates only the part of a page pool buffer the device wrote;
10  takes the buffer table lock once per chunk of refill buffers.

None of them changes interrupt placement or adds work on another CPU;
each takes work away from the CPU that already handles the frame.

The profile shares in the commit messages come from perf on an IPQ8074
access point (Xiaomi AX3600, 4x Cortex-A53, 5 GHz HE160, one station at
850-900 Mbit/s TCP), one run each, with OpenWrt's version of these
patches.

On a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1) running OpenWrt's wireless
backports with the RX fixes, with one HE160 station at 830-940 Mbit/s
TCP and 3 runs per cell, the series lowered the share of the four
cores the traffic takes in the cells where the station sends: bridged
IPv4 33.0 -> 27.6 %, bridged IPv6 32.8 -> 27.7 %, routed IPv4
33.7 -> 27.6 %, and routed IPv6 31.2 -> 27.9 %, which is within the
spread between runs. Where the station receives, the change was
between -1.4 and +0.8 points, also within that spread. The share is the time idle-priority spinners lose
on each core. Switching pktlog (lite and full) and the extended TX
stats on and off, adding and removing a monitor interface on both
radios, and unloading and reloading the modules left traffic and dmesg
clean.

The series applies on top of the RX correctness fixes https://lore.kernel.org/all/20261122210525.2076058-1-julius@bairaktaris.de/: its
4/10 uses the msdu_start_info2 accessor that series adds.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (10):
  wifi: ath11k: use page_pool for the RX refill ring
  wifi: ath11k: replace the RX buffer IDR with a table
  wifi: ath11k: request only the PPDU stats TLVs it reads
  wifi: ath11k: set the skb hash of a received frame from the hardware
  wifi: ath11k: sync a cached ring's new entries once per head read
  wifi: ath11k: prefetch the buffers of the REO entries ahead of their
    reap
  wifi: ath11k: look the peer of a received MSDU up once
  wifi: ath11k: take the refill buffer lock without a second BH disable
  wifi: ath11k: hand the CPU only the part of a REO buffer the device
    wrote
  wifi: ath11k: give the refill buffers their ids a chunk at a time

 drivers/net/wireless/ath/ath11k/Kconfig   |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   5 +
 drivers/net/wireless/ath/ath11k/debugfs.c |  15 +-
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +
 drivers/net/wireless/ath/ath11k/dp.c      |   9 +-
 drivers/net/wireless/ath/ath11k/dp.h      |  27 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   | 712 +++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  34 ++
 drivers/net/wireless/ath/ath11k/dp_tx.h   |   1 +
 drivers/net/wireless/ath/ath11k/hal.c     | 107 +++-
 drivers/net/wireless/ath/ath11k/hal.h     |   1 +
 drivers/net/wireless/ath/ath11k/hw.c      |  22 +
 drivers/net/wireless/ath/ath11k/hw.h      |   1 +
 drivers/net/wireless/ath/ath11k/mac.c     |  13 +-
 14 files changed, 765 insertions(+), 193 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ed566369a9bbda0ac9a48357261e8cfe1cc0f1d1
prerequisite-patch-id: 726d7737c833da0842192eccececad4a0dedb1a6
prerequisite-patch-id: cf0b8ff1ac6cef681433247e4b937a3e23af78a3
prerequisite-patch-id: 03c89df01745ac9a80653431261f9a003dbca7db
prerequisite-patch-id: cb48c0eddbe0c2fe176e8edc94c6bc40be3c48a9
prerequisite-patch-id: 1956ec85ad80b68868538070fc0e89c29603467a
-- 
2.53.0

