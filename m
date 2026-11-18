Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029895;
	b=kEtqk4UCKCbHooBfrw5GY/F9IbCNywg27By4cCZuuIaWRAYU9qo1MJUbUoeG/39YYDyU
	 k5glRVfzZEbQ/XtEDqZRROQnZj8CCqp+FjUKdWY965yHjsoF3HUeCbjfWjqWJlcVujPB/
	 HHU6X0Xqtw3/SRgk6N1mx6VruVLq+IXhUSCBQPjcl78TOL+cjeMnMjER4GwPY7yXSvRIB
	 pAAzWZrDt8+qqwcxskqHKSHXj9ul9oTjwprkU/RXahh8C/vNcZC9QgULSWCcbBok/94+J
	 TTDeI5+wcYv+XSHSPHCp4n9NPswgKQhbW0O1Js0jtc2msxH88m1Vt5bAQ1v1/H6JcLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
	b=ZjfLirDj493sXrXqmFv8tUWulEdC1LB4z2DujCFV8e6VYPCPENR8SU7QQ5qrKsHcxYQK
	 qlyffqEgVNsCqHpKR3szq6W993gYDqQUSjDU3SJ2E/n5J9/HWt4851cGPXIsGBv/cTHa4
	 4wK+pBByeFtt7mHyIK3pnXHV+9Ff/8K+Epv7hgLxJzYQYsNArZ92OGzKXDooR259N8AKc
	 07hWZ6i8CzSIOgG4M+FqeGP1HC9EyII3SFuBSzCM2aUW5PawpVPwqrIY4gOiNA5UQQv6k
	 tTXpspn9xzQJk64TnEnCjp8b18qyaWURldQWQeMMtY2KgwP/uDcRZox682zT+XUMDcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k59ieq2C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14558606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 19:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14558606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k59ieq2C
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so597060a12.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 11:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029894; cv=none;
        d=google.com; s=arc-20260327;
        b=s8iAr49T9xYDI3QNTCIICAfChWZD8h015sM3mo9/MQeiRKPNDR4/FDjArqfAEJ72Ye
         lypqCHiJANLOsFvRYSiOJ3vzshJ74gmJnh0wldJYMovB4icw1eLeqsLEQjsCiA87C2lN
         wWuOLtzZR6aO6+PXBAwBjSJhNXmza/g34KjC772aN1g9KfvzBjhYVFLgLKKha6f+Y2SL
         TsVnmVm4SvuFtJusVIq1fbvGvZax3OgJUVK9Xtk4icY22QO1TLHGv0HdKHWidvf1nFxU
         fVwaNThdxwy4HriaU3o6lqvAjV9j10Rn9Btro5Mro0q8ocLFO9AoPIafpIs+WtGzo2mb
         HifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        fh=mfPvTnM9FlmqjppSUWCSaxAVhLgcs+BLs9pCa00ubkk=;
        b=AotpDq2A3CF7VTmIAIuRRUfhX8saSB3NszLyM0meOOIHBg4Pm08IxD7lrqZs6uEqP+
         c8j+Hg5gLK0jIDC9N/FVEpJhbzGuppuajlDeHI8qwTNiBsueW+4ZWXkj+YtukCRGeq+V
         h+vgzwGI0eovu82KPE/uxIY7Brptci0Lzeid7HeXS56tAOJHhMtUJD9j7S5uh3zOxtWw
         UK/2fd+beNwcsZY46P2up/zoh5AER/hmEqaKBP1JrtjpCsXERuW+SgeiWsanfLyWDAEp
         TxxuTbfDydNlaviwrgo50rXONozs4kEatcGmgC16C9dI/+dMn1V/8AIHetM/phJY0JaS
         yH0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029894; x=1795634694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        b=k59ieq2ChQ8MRGf4Du0YPN9pkt5dQYBBGmuLXdjC3bsx8JYkf5wKLBp70lxzTWBATq
         cD6DqXuoOeB3NYJE9IeI5OZc4RtBw2pRP8zWJtSPXsr4Gcnx0KitD0Bf1MnPRBkT0kzb
         zrA+myTheO0J0wdTLczPcxo6KKzBC3WCHJxmcuAoAUpqOb8S6HJXGN+CDkcMgaSrB3Eh
         QmGKiJkMzRJdHbAAoDcXjwM5aW6XvixhmpaysMXUPVDNNHGTnhojdlh2hdWC4LyONm1/
         6pQBa/g0ii9H0JrPzxCEGw7ZKsRDYd7teTskfXl0NeBpAtCl03L3wpKnXR8tWD3oNAyL
         wh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029894; x=1795634694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        b=i3s14eoT4s7XsR+l5vlFWLz9m6qCrDxRfSP1Un5xBrTwL7SpIIKHEAYlEW5SxJTJ2L
         JdMVj59gHY10AfaZV05e+d3h7Nq7nEubu64Rd17aJSQWIvXhJS/lccmCL4ISG5ZAHfYh
         MkmRWHl1WNNfTZH8nxnhTK3QAJh3FV+zXIs3hB2tVn1EyDosrzGTLlOyhpryh+5tLd8Z
         KeqV3j3F0SHyaGmXiuEb+VC0uIOFM7cFYdioXmkRssEBP66nVFEamungw3YCwHR16r7v
         eA6AIS+s/g2y7l6bT7HYPTtJ1cVWFKtGRR4U0ptSz/hiE56k4f8gVd9ooNEzgLg1YJ02
         q03g==
X-Gm-Message-State: APuU4Z9Kujfc5KPFSTsmEPn4EzI0K9Hqw90LpQtd3dHk87CQV67Cks41
	7x5fo9mkIgO/6Q3E21vE8eXTxHeTS2HazlpMSPhMH+6p07yBaye6S49QbJlGJzggLgMFGPwsVfF
	wHPYg4zfXxQQRv7MRdaI3bgpO+LtNu+4=
X-Gm-Gg: AZFdTZf4E8YpZKLmAt6Ufkt9Rnd4bJ3zsuRiJxtS4mlVwynxT8xM3a15zmMYX4/ESYL
	rxmKnzyi7jKp0hGfRlrMRbW6Kij47HfYQnCRvwFGlE7KRKnk3oSwyNt9CrxN3cPBlLd3IdFl+Eu
	OnuU//vW7hWzCOiZthz7W/gW/fr8o5n8CHhoDZuBxkKrleuD7zwiTLJW/rO+kejaGwDySI+BX4c
	PVGW7o/Nv14oBcvVJqfoe3UBgxngl8C7mfNKzxF68xRh4WO/FgM2SX6enKuDCqTK4ioot3vMe9E
	N5qRYxampNJV9+uNNbFT3rFm47BmLf+6uB93r3WUmAmD2mz4wd/e4J+h0nkh6H2ur83XEf9jiFL
	/YT6Jkc1WLewH+m1fU3VQS0coH8ZKYQwBXQmtMg==
X-Received: by 2002:a17:90b:3890:b0:3ae:9944:3bf0 with SMTP id
 98e67ed59e1d1-3b3d07bec9fmr3738908a91.34.1795029894222; Wed, 18 Nov 2026
 11:24:54 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Chris <hoopyfrood42@gmail.com>
Date: Wed, 18 Nov 2026 14:24:42 -0500
X-Gm-Features: AclHuK_3EOv6FHAHbDp6-ErJ25zBqiU1yu-YUlfjEHlibePkPM2zLKcLWHf-JWM
Message-ID: <CAHaeJsT7vfKnjwDhFicMUVraf7EeSVXSZVdt40ri3u-accUsFw@mail.gmail.com>
Subject: =?UTF-8?Q?MT7925_=28USB=29_as_a_roaming_client=3A_130=E2=80=93350_ms_befor?=
	=?UTF-8?Q?e_its_first_frame_on_the_new_channel_=28MT7921=3A_9_ms=29?=
To: "michael.shih@mediatek.com" <michael.shih@mediatek.com>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, 
	"ryder.lee@mediatek.com" <ryder.lee@mediatek.com>, 
	"shayne.chen@mediatek.com" <shayne.chen@mediatek.com>, 
	"sean.wang@mediatek.com" <sean.wang@mediatek.com>, "deren.wu@mediatek.com" <deren.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

One more observation from our MT7925 testing, this time with the chip
as a client roaming between two APs (802.11r).

Setup

Netgear A9000: MT7925, USB 0846:9072, mt7925u. Firmware: WM build
20260605184805, HW/SW 0x8a108a10 (20260605184651a), from
linux-firmware 20260319.
Kernel 7.0.0-43-generic (Ubuntu). The mt76 modules are built from that
kernel's tree with our local patches: the survey busy-time change from
the earlier thread, plus two crash fixes. None of them touch
association or channel handling.
The roam is wpa_supplicant's SME (ROAM <bssid>): FT-PSK over the air,
between two APs on one SSID and mobility domain, from ch 149 (5745
MHz, 40 MHz) to ch 44 (5220 MHz, 40 MHz).
For comparison, the same roam with an MT7921 (Comfast, USB 0e8d:7961,
mt7921u, the same kernel and mt76 tree) and with the laptop's Intel
Centrino 6200 (iwlwifi).
Measured (mac80211's own log lines, times from the ROAM command):

Step MT7925 (A9000) MT7921 (USB) Intel 6200
disconnect from AP =E2=86=92 authenticate with 145=E2=80=93176 ms 51 ms 77 =
ms
authenticate with =E2=86=92 send auth 126=E2=80=93136 ms or 345=E2=80=93354=
 ms 9 ms 0 ms
associated, from the ROAM command 382=E2=80=93635 ms 120 ms 115 ms
The AP's answers (Authentication + Reassociation) 15=E2=80=9320 ms 6 ms 7 m=
s
The MT7925 figures come from 6 roams and 22 joins. The authenticate
with =E2=86=92 send auth step was bimodal: about 130 ms or about 350 ms, ne=
ver
in between, and slow in 7 of the 22. The MT7921 and Intel figures come
from one roam each.

The step that stands out is authenticate with =E2=86=92 send auth: the time
before the station can transmit its first frame on the new channel. On
the MT7925 it is ~130 or ~350 ms. On the MT7921, over USB with the
same driver family, it is 9 ms. So USB alone doesn't seem to explain
it. Our guess is the driver's mgd_prepare_tx / remain-on-channel
request, or the firmware's channel-context switch, but we haven't
traced it.

For a voice client this decides the result. The AP's part of the roam
is 6=E2=80=9320 ms, but the MT7925 is not ready to transmit on the new chan=
nel
until ~400=E2=80=93600 ms after the roam starts, against ~120 ms for the
MT7921.

Questions

Before granting the new channel to a station connecting to a BSS on
another channel, does the MT7925 firmware wait for a scheduling slot,
or run a calibration? Is the 130 / 350 ms split expected?
Is there a faster path for a station reassociating to a known BSS,
such as FT reassociation? For example, a firmware command or driver
setting that avoids the full channel-context teardown and setup.
Is ~150 ms for the teardown and setup (disconnect =E2=86=92 authenticate wi=
th)
expected for the MT7925 over USB, when the MT7921 takes ~50 ms?
I'm happy to test firmware or driver changes, as with the earlier
thread, and can send the full kernel timelines.

Thanks,
Chris
