Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964071;
	b=iqJolmJzTJ4cscgVdUpDuuw0DwGL2czf1G0KQxDu4KesLlky6L6t3YMJetq1jIfZZV0X
	 Z0nTVaMpuSUGK3o3WITgADkNlWDJoMxFw5D7WaDcSzFyxmdX4fyR5RSGISOdkNAxzwDIv
	 k6MdoTzbrCS6FLGsHn3nmsPM8J6yCsPcpAJeoN+6kDANmP/UWvrlpegN2uVy65DIAV2Wg
	 eJbD2bIjYOegEPgChlZI48fu/9hSxAWPileu74og/cqNV0NDtdNMzfxXGN1LG9b+5DbBd
	 UtH1DwEgKMogIWPOo9SRHqUe63hOd2jQ3kSabyRWjWFxCMqdkUICEkcu9nhItJw+Mxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h656Z0mZw1ofXWnRkHouARrs+L2J1W/o7GTQhymlj7Y=;
	b=XFpOQdipDcRwz5ogcmj7Xk9wethM70WJvgmxaT0laSSLp+SbVL7uzpP1olkEpyRXYz96
	 lgxMFtSemooq/Ci7t0x2chPQZs/KnuPWjzwWFB3ygh23FlZE0IZ0rSBtO257DFnyBPC2n
	 SF73kZNyMxoeIc1JXJBp7sqFl6t2yO8vFNgPly8l5Db0/7f7FFrtt4la1TBB+5vLpLFMB
	 aM/cznWxG0kl7ziUOF54gfC9ixTi9WK5JMrqAGsJeQ+zgDE15oWCnC01I+npP8Tsj1/TL
	 /DvdIOPzQFoZpPVhmdrAO98RmSKR9zO41Q77t7XjGZnEqL6Of/r3ccfUFprW0gElyQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tRvFpxnc;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B57606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tRvFpxnc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so220542a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794964070; x=1795568870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h656Z0mZw1ofXWnRkHouARrs+L2J1W/o7GTQhymlj7Y=;
        b=tRvFpxnc2ZzGscvC/DDCPEJyz7oefL4wRoJ6+mpGSpMBmJqlzOKrGmjzYYEqWyRm4B
         EoCd3po9v28cBSrZo1aTQWXIjefvSFiKgJr6KAn9cPdMr8l2nTvfHaxzuiY8sxF4xJ5D
         fYg0UO4qU3mefkY4KOOwitWdvwATLEvM0OTIVGAlKsAYz6C4uCj3YEKsRI1wBe0PzgmF
         DLq9JTPOa08JQwCn2zI8U3pxruTsMeN5knqM6WKodf5Zl640YZbhBIJO2eVZUF56ZeDs
         iWsfSYJBO0x5VZslPAO3rcC3z6n7oHm7WFZyXvn7qAe0v7Lh2IPaWd6SHmwjilMbZtDX
         CV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964070; x=1795568870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h656Z0mZw1ofXWnRkHouARrs+L2J1W/o7GTQhymlj7Y=;
        b=fdopHvTIogOmj+7bPX7mgN/Q1jGIFcm9d6sMj1BawdnrjhRKEeVDRXA36ShV5oI/rU
         kKcsd1uOK/s/rWWkinN0U73uMDON4TauPgNMAdH5IGI6l73aji1MNudn3tLzRBUEYMCB
         WabI/8VltEw4or8AL/UcICfUC+WAQm21Oe6dpp8MJTszTZ/VPc6WzR36AUOVRxWPcmMc
         0D2xthTur9CQOhRkYVEn1aFjBk2OUUW5pe0gsmI/KJVbs1LE6LaHArHA/cdLtrtnkK7S
         OyDF2LATq9MGUlAl8okvWK4e7lk02JtLRVakyYQl2TeubuFNrB3+1RHgnki/bBxFQWgs
         TU7A==
X-Gm-Message-State: APuU4Z9MEt3/DF3XeJr+/XPsYj82SS56wnbQbmd8dQet8Az3hL0Qvorw
	SA5mR4b0kmMrZg6rYWSkbWY0+IjOdyyiNEt8jfydugK3kSY2eO9ApqChoexKm6YCF3c=
X-Gm-Gg: AZFdTZcOKthrRmUlVUxYWwr3UmY8He/u86rcLlQr+lkEaZ2bIrvJgIlp6E+TTBYMhj0
	UPLlvGbzQHslqhyHWjO91RA1OJyDue3GWgSnCFpFv3hMejhU+NVK6V3chyehlSbqc1b4lBAZmYU
	QLrjxu2xJDpY5dYgeixogzymvFiNQrNSFQSti8s961M0F7N7Bzw3Zfg0lmZ6oud/MWV2kgJXByV
	6VmWdrNfX7oPe0Mhgl0aFV8JmM0zvib3ImAcK7rrT1c3evlmFGi0mtp/mmBt3Rk1ChFNaNPmARq
	7TFwG0sWwq/mgZgkxGDTYN5FNjXBCqChgZR5LU5H0gIVBlJTlEQXu0L9RMzQRaQwGAJijj9FNc1
	9npZHa1mQYbbnxtl1jWLlnSCO4RTmb6MzlDKTMNqGbS9gSHgiEX9E3H/irSDSt6JtemLxn7LUcT
	msGdvnCOFyX9Hu6uLPSPR+ZzBmJ93PQ958tGCLtmBNb09bEVkzgUMqsUvUALOLDYBYvsOLQHN83
	2pMo/Z3EdB7eiCLKYh6KennvoYmg06x+9qvzuFh9dF6/TySxAEEgIrqHg/uRwQlEt9F8umCvkJt
	fvEUb7lKUJtaQsOmhKpX3VHXGIm/xowSBRiUqcacxdK8Xs5qgsqhHZMqv6Z8wL8IjYjmM9Un4dN
	+Gboa3fxCZ3nSQlb7/0UTFtW0pQjdunPTxw==
X-Received: by 2002:a17:90b:1649:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3b3d07c3f7cmr995312a91.30.1794964069717;
        Tue, 17 Nov 2026 17:07:49 -0800 (PST)
Received: from mma-H9MHD44.lan (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6420780a91.10.2026.11.17.17.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:49 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	arien.judge@morsemicro.com,
	samuele.yang@morsemicro.com,
	james.haggerty@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH RESEND v2 0/4] iw: S1G support
Date: Wed, 18 Nov 2026 12:07:34 +1100
Message-ID: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
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

[Sorry for the resend, forgot to CC the mailing list]

Hi,

This is a set that fixes up iw to handle the new S1G chandef when it
comes to printing S1G specific things and setting the monitor channel.
A sample of how it looks:

root@MM_buildroot:~$ iw dev
phy#1
        Interface wlan0
                ifindex 4
                wdev 0x100000001
                addr 0c:bf:74:00:30:fd
                ssid wifi_halow
                type AP
                channel 43 (923.500 MHz), width: 8 MHz, center1: 924 MHz, pri_2mhz: 1
                txpower 19.00 dBm
                multicast TXQ:
                        qsz-byt qsz-pkt flows   drops   marks   overlmt hashcol tx-bytes  tx-packets
                        0       0       174     0       0       0       0       10760             174

NB: The 'pri_2mhz` is only printed for S1G channels of course

And an example to set a monitor channel:

iw dev mon0 set freq_khz 923500 8 924000 2mhz-primary

where:

923500       -> 1MHz control channel (KHz)
8            -> BSS width (MHz)
924000       -> Operating center frequency (cf1) (KHz)
2mhz-primary -> Whether using a 2MHz control (Boolean)

Additionally, I have lightly tested the set with the iwlwifi driver
and the brcmfmac driver to ensure no regressions on the regular
wifi paths, though some further testing may be nice. I have also
had claude review it to look for any regressions along the regular
wifi path :).

lachlan

Lachlan Hodges (4):
  iw: add ieee80211_freq_khz_to_channel()
  iw: print S1G channels correctly
  iw: support setting an S1G monitor channel
  iw: print S1G channel widths

 info.c      | 12 ++++++-----
 interface.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++------
 iw.h        |  6 ++++--
 phy.c       | 45 +++++++++++++++++++++++++++------------
 util.c      | 37 +++++++++++++++++++++++++++-----
 5 files changed, 129 insertions(+), 32 deletions(-)

-- 
2.43.0

