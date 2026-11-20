Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186468;
	b=zdJQZI96hc009rjHUUX7KnDfC28LT225Fwzm9TXsSGdxC+ZfLDc8lRkjJoWc3aRZOtH4
	 XCHYINagntL5C1ajVG0nNaOMVHQwr/aXCgVg3Gtnvx3ANS2Ir7uXVoKcnGrl2DYTQG9Ua
	 ZHQqtJ1bmkv7xdT6E3+eXgzYBGTSwAjvLVViDBtCw7XBUzMKGYbGi69S9aTbeWufx8jEN
	 OEw46y8ZH+lfmyx1myhxIZgYYTX+vZmSd9BMeJH9ywW18cFt5MRrTaffALRD/iGco8MMU
	 BAr/Wek9Spw4o5YR/DAruslYMIM2hdOlqBRKRsRVKaTLme0W1lDrihdhbiqLkq/7A6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
	b=YQMc+aYF1dH2ydCkhZTUVNCW5ZuAsbVy/9BcoALGL3iBWjKTArzBXDC5LsgVEpS7jRhM
	 DUJb1Va37lTvElerLGc1JA3znKOJB9NHXe6aoiwcRtMnrSTNpHx5N31VtvZkkyAOsdROf
	 BCwtQ5+uhcGTXrdQeKetG+Rtt5steH+e9PIrNL9uKKlPKZVXQECANEqM2yIaOz87ZrQZh
	 F05R+K3PSkmtyoVIGFt4qphWJBuxNdPT8Yhm4eolh+UYV8UQn06KrCONNYAbGBLpyYaZW
	 V37XjT2yfBrMKViDO1DhOEv3IcHoW1+d833ABcloEkazE57G/F/r5TO720WXMSE4fQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCuvQy5j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACB606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ACB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCuvQy5j
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eac01ff101so332697e0c.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 06:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186467; cv=none;
        d=google.com; s=arc-20260327;
        b=J2fx9GY9xY6kR08dhl857hYXUGr3NHg1dDTs/euX1W0Ocbdub79LEOWtgRrcYgqLvx
         c6Ls8FdqpsR/UPrnZJNuEH2ddQP7DI34k9qdLJw3e6IQBSqsbKqrmCpVo1q7AYXygOdo
         HCDQMWL1FqF66EOTfaceVkBeYBih3t4VuHWSSuiv8GRDAvzi0sCWawT017KFObPdgbp5
         jtRoqwtnUQ2/g9cE1q7fHgfyZ3QuJVoK/qASn4ZB5DGwXOpS3vusfWgR/djuMgKhjTJQ
         YxSAgt1z+odh72zyHLSRv2MAggdSRjPTrGTl2CMZNnNSqNOHUudbojrnJK4YZnEav0er
         Haeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        fh=637TjtLzvrH5j7FQezl4mqCqyU6jMRdATAiJN/WB5as=;
        b=Vkmt9mRLifHPRroqEBIw9Z0UGJKGB9bu/8FDvRZ6z+L4mjZvPd+Oj24fH2HD3fpPTL
         phe9NtDrnV3dm2EHZtlApFqS+D5Bd6Uly6gAJ/dx7NHPh84EU0YZRZqcdCY/gfARfpj1
         xW93DqUzCoToPCifvcGycfvcQ4oR1rYnoUousDVGxviDgFf8ovKvhIMP9Cic8F3TA0rk
         OIDIqemgIb8EMhBx7qe8pXV8Os6bhqzi8z3A9grIRBkZsynE2FlKb2KQiL8mbrMHzsJY
         TcleI/IFaymS3N+pGjK9xV3T/qG583S2R+XFLx2RjbqHnL5YAV9kEoT9qBL1se+vGa7n
         L7RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186467; x=1795791267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        b=hCuvQy5jP1uuzMZTwQROcwrMb98kdNIFGNv6DHUJdOU9cqi0c+jW0FCnIU2i2V+PGt
         gMG2wCDiXGwzx7aGcR+JLOaSF5TDsQ8VtL9UuTpXItE24xYBQfWSYgqFlMa7DYV3E945
         Q/reSLT9osGxDLugUlru8ILD3nADKnmY8dFsYQGcOsm94HX6oELRqTwhPVzQz5zcFsKE
         dD+OE/wIWfn/Hlc6PL9RwJLFLSe42c25ikAiQFSvlLELHzKlA/1hsOdE7dj4debnNn3l
         KyQWHRXsj5kdQrl5HSmRW+W8S7XBNWgwj1RMXpyAJ5tzI3lP31oNvUXGTvT8Wul/SclW
         edqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186467; x=1795791267;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l086nUfGT3q2rZ2LvcCHUdhAGopSJtpRfCPg3hLnd+4=;
        b=F6QOQq/2Sw2lCE5hFADdZtwGCTQIXtkduZrt0LOkhWXath2t2injnnd2CGiFfny/3z
         RTQkMZZQx7C0xI+isQpIWs3LTwGBGfwwi0Z+UeiodYhbbbODOMrOz7SFBUga5JH4KvAj
         DY8nIE9GcPtSxaqpR0uMoZcLhk/AaFJhxZRv2pLjiQ+PsZSwuZqtAWFisYUxMn6tjnz9
         8OFkqv3Ud8eYHNNCNyd7PpuLguZ02cCyEBgeZS1cVDmgfDWNNJ5lVy1erX1qmXZSO2cU
         3vOOLt8moioGi/AQ6I/ahtKb+2LrUOF0RBQS5kbhE0Z0+oexU/m+juaR/Id+lhJcsDUJ
         uqsA==
X-Forwarded-Encrypted: i=1; AL+hErF2w6Kbo3XkztwsB5lHEruaL6xUHqYVwidHxkkaw1S2UBln2TO4w+GuDcxD7w7J2nBaG+e5r7yanpxCbNC7FQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+TV/V2277HUM/0nsepf9vIYnA/jSNwrARUwjkpMtTUiBBtaItE
	SL0esM3iN9in9ag1lb/TzVQhogsL7rnqcZpidhwWdbbmfltPrF+DEoPN9A2lP5cvzCDV3eK1F1x
	gOYHBDlTqawd1sLr47Ig/SzZJFK6SG2Y=
X-Gm-Gg: AZFdTZfMyBGFhfTDNEzxvolN2dHDAh4T7ZAo1w07rYPVeRljhE7Z8hUeLl7swpDARzN
	lmiT+8S9EYE7b3RwXB6+1L1lnnI47OdKqpImdukqVp0zaR7+o00IN3F89YRmm+I5SVzyxcAcaRR
	BcfGphG3JQQyQfRY+W6WU6eT3S/liF1q4rucQjtbi7YtuWRVR2g50HHrE18wTrwSI+xTtrHquMM
	cX9R5sNn4OgpBS6RPwxbY/L9nGlCnu5OHcW+dilRx5i1fjC87i9r5TJlY947O407UQ01xsbc5Ly
	IvnaYlqda7E9Yx2KIh88CQ05ZmITK7HMALMZIauFWSRPXGwxTeac2lMWSAeTkALFgZDu9zV6C54
	dyebOrEgDrTgs7v6g3jkIQxF7lRms77IywYeCRypRCiq4hsyRJYgeCY+zqAxuRqMSTV47d/s5sd
	3r6jQhUoau+DON1NnZFg==
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id
 71dfb90a1353d-5ee8ade9b3amr1350725e0c.3.1795186466579; Fri, 20 Nov 2026
 06:54:26 -0800 (PST)
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
Date: Fri, 20 Nov 2026 08:54:15 -0600
X-Gm-Features: Aa3M54oeS5uX-0Ck4ISDiMv4gz1OVwu_ru9ceyr_rXX6mPr_8kmYpVXPxRxJ0eY
Message-ID: <CAKobHXBMM5CL1Vqaate=+DrXunEzcjKFbSSx1r7a1Oj+7ziMwg@mail.gmail.com>
Subject: QCN9074: HE SU TX A-MPDU stops at 64 MPDUs with a 256 BA agreement
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Baochen, Rameshkumar,

A firmware question on QCN9074 hw1.0, separate from the boot problem in
my thread "ath11k: QCN9074 public firmware stalls at QMI cap request on
C-360".

As a 6 GHz AP (160 MHz, HE-MCS 11, 2 streams to a WCN7850 client),
the QCN9074 never puts more than 64 MPDUs in an HE SU PPDU, although
the BA agreement is 256: ath11k sends WMI_VDEV_PARAM_BA_MODE 3, and the
client's ADDBA response carries buf_size 256. With full 7-MSDU A-MSDUs
a PPDU is about 2.3 ms of the 5.484 ms allowed, and with preamble,
RTS/CTS, BlockAck and backoff about 15% of the air goes to per-PPDU
overhead. Downlink stops at 1.82-1.83 Gbit/s TCP.

Numbers from htt_stats PDEV_TX (mpdu_count_tqm / num_data_ppdus_tried_ota),
iperf3 TCP x8, 20 s runs, client at -37 dBm, HE-MCS 11 on 98% of PPDUs:

  WLAN.HK.2.5.r4-00683            64.0 and 64.3 MPDU/PPDU, 7.00 MSDU/MPDU
  WLAN.HK.2.15.0.1.r2-00004       67.6 and 63.6 MPDU/PPDU, 6.99 MSDU/MPDU
  2.5.r4, A-MSDU limited to 2     71.0 MPDU/PPDU in a ~0.7 ms PPDU

The last line suggests the limit counts MPDUs, not airtime or bytes.

None of these moved it (each accepted, status 0, one at a time and all
together):

  WMI_PDEV_PARAM_MAX_MPDUS_IN_AMPDU 256
  WMI_PDEV_PARAM_SET_PPDU_DURATION_CMDID 5400
  WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID tx_aggr_size 256, A-MPDU, with
    and without the 256 BA bit
  WMI_VDEV_PARAM_ENABLE_RTSCTS 0
  peer_max_mpdu in WMI_PEER_ASSOC from 65535 to 8388607 bytes

WMI_PDEV_PARAM_AGGR_BURST 5400 made PPDUs shorter (~31 MPDUs). Setting
WMI_VDEV_PARAM_BA_MODE to 0, 5 or 6 instead of 3 also gave shorter
PPDUs (~40 MPDUs) but RTS on a quarter of the PPDUs instead of ~60%.

Two questions:

1. Is 64 MPDUs per HE SU PPDU a design limit of the QCN9074 firmware,
   or is there a WMI or INI setting that enables 256-MPDU HE SU TX?

2. If it is the firmware, could a QCN9074 build that sends up to 256
   MPDUs per HE SU PPDU be published in linux-firmware?

These cards only boot release-branch builds (2.5.r4, 2.15.0.1.r2; the
other thread), so a build from such a branch is what I could test. I
can run any build or setting you suggest on two QCN9074 cards and send
htt_stats, logs or a capture.

Thank you,
Christopher

The tests and this note were prepared with Claude, an AI coding
assistant.
