Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648519;
	b=CqLIVMQAPUR42Nsp9TWgU2IcZ3COXPbo734dcBHV+jHeneUYHPph1Rvyo+T/pdoT07Tg
	 grOxDNdUfMWutNs0EqhHPRKgAgwUhGYV9OlR0O7wvZpMw592VWbxPdc4J2ZSpQUwBIRq3
	 3Fno0G0OAAYIPvOWCW8SstH1ZY+lDn6XlgyBFvF7daUizGDojvu7Hq0Sk3hqDRKEYDyqb
	 iuFWYXGiskJuuUFAbLCv3gLLWrLp1LDbgAQtaMawxLlWB/4scYsMopxOA5NzdvtnhjRgp
	 HlNdQuJEOeg2QVbkWaXgRP+Yl9Maj9dXcrx8GJ1Jm6jLaz0xogQwtLtOb4+KJMNp+DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=0xBhUwb7nbQ/7XcZOsX2mzp8bxhNFDcd0Y3RTff2bRM=;
	b=NMZDdRTm6eppX5ouEoT3RjDthdFOAiDBIfThSM9I6llMJFV6j06VkJjke14sK4sIGAP4
	 KBYDxAeP7H1qinBVBc2k0iUBnaBBEROJt7ge3sZ8V4Lp3sp12idkOxlEW4fY1UZWb7jQZ
	 4MUSuseaW9skaBdSQzkTL5LKD5Uma3cG+KowCqyEqdRSHzNO+BOeET6nsi4VN9rJaM9SJ
	 RuXKPtjlh095lHNVM82jDuJNP7gj2qwLpALucm/EvN8oGHUeNe9lF2gqVOW+QVL8jZWpP
	 xO61lgeCLZ7K5EDgV7+QsdgYx/7Jg6VBcNmezYwjR6qhgDkVg58ncD9ILQV6+gZDjNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXFkGHDZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534A606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 23:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7534A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXFkGHDZ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a192844so624109866b.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 15:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795648518; cv=none;
        d=google.com; s=arc-20260327;
        b=HN3l50xmebGrHGLLeNVi+T1iDrbE2KfNsi84aeRDEytw6Oh9kqZYu7yiVS2ICX8Qsm
         d/gMwiumOkguPjwGM4Vv3v1yq1UW2yP5i+iM/f/Ab6oksBH7WyPj+Gf9YeGCAp3v4Zd7
         Je5AmKIYxEgZMhUpYJIQ5TeGquGkicoT9yrT+E3DKEYiXRmWlEbQVVQrWvXAygZPgP30
         K9zSoiEAcgGiE8+aCR4sSg960JBPIAlAoy3eTn7r0VmRswQwjMdW/db2sHaIa5hCiibY
         3/hcPEVw+I34JX2Ah6tlxWBMk/y289Jb4kDjF97OHMh/JreVYNsfQ8vey9NiInEp61tp
         7vFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0xBhUwb7nbQ/7XcZOsX2mzp8bxhNFDcd0Y3RTff2bRM=;
        fh=ED8XlvhV4agNRzuDusEVMPnyPjaRLPA+MHKLr6CYGfE=;
        b=Dq4J3wg3OM9dvgn6+RZ+qjXL7A54aLEsvHsjLU9l2qPa12aSzDiJCUL34BOoyKsmb/
         7ILbml+6jb1/40o7AMwJjagP5sGr3+wZDzoc1F1S7+3l0F3z3kNgt4VWfO0igQjZOAYx
         LMmnsomNDVf8d+YQyLQ+xg9iq6ea2YXSJ3bwttM/Ei0t6iHuyOs7MlvP2eXIM3JzDbZs
         +mPq+FlAPqsirnamEmIOZ7OfUIoqScL0lJF55B1csxHiBsDcchLmme/D0CbMYiZ7hKFs
         z9qZ1gy7g91RReBUwoULNfCT8Lq79FG4wkdiADrrGbxQQ84WBBsGAirZ2muXuqfPj/Xl
         mQJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648518; x=1796253318; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xBhUwb7nbQ/7XcZOsX2mzp8bxhNFDcd0Y3RTff2bRM=;
        b=cXFkGHDZ/hwHsgEyqwDnAI6Mn27iOdnz3ZZCfLniOXy6wRtje43QBJq4hvVkLkvGSY
         jICu8uaeuZFMjDLExCufEMKmdpHGmhWRvgPGfiuWSVSbZR0WAcBol1UL/nPKj6A9nGff
         qhDN0TKd/kSwUs090q+fQ6nXqYtNjmJmaBPMBcUqH9xOqZgTx6NMpNTvO1tyC+HZWYF+
         q+tj7NQgbWS5qVG0SZZtqGbPnuFmq2pBHTy2j7to6UQYe/uMQfwMXLHoPAOIaleJy9sD
         ZsHdOSoW11CFiW8FvCVW8oL2XOQL0+pnUoRUBq4keL8PTAxkqrR9ozaZINW2tlQ/A+jP
         WlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648518; x=1796253318;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0xBhUwb7nbQ/7XcZOsX2mzp8bxhNFDcd0Y3RTff2bRM=;
        b=uH4kLj0q1845uHruE+uoS4NK9OxpFN8W1bfsxFTm/XDRuueyiBswsvhzscWIj7AGHj
         JM7hTpDQU8mJWifNZv+hD9xuK4vJPPJsSXLI8QyTJPWFL9GxOjikzuVmXWXMxUVTl7/K
         OeN9XalbwetuHwQkq79eF+7lzisoFyYuYe6v6G2usjIj/7HHP0mswq8beVcwTbde5Qud
         EHYdbHYp6MvJepNyUyfdEJAifJ4UfB0B+Kvn2uP0zbjn6D4VF3OaGXpdHOkbt/ZzmE6K
         N21ExEnC6/lIqYbacxekjJCEqA+AHAOzann+Qkkbw9HnL0Au/HMP4I3YUIOvC1uRq4C+
         bDVw==
X-Gm-Message-State: APuU4Z8p+OFAvpePmnqqv3djEDJhSMACcrKmoRnZOuuaRTWYFMHpcXs8
	6PgnpjIb1w0miFnHZv/Wrz4OhzWxrjMWOHWfZAq3Tjdht4K3y98vNgOEhstUvQVBxqTlDuCRUok
	hgO/+N7+syXsplepL3zWhLlAZeBrb3ZCz00pIkkQ=
X-Gm-Gg: AZFdTZflAjht1kJIVnKn2igchEUOglKLPqPcc6ieFS6SWXlFj9zG94ZjjD5KyiARN08
	PfhA6hkgJClXgzXclzoeqOzsoitIDJK9gPc0kvIrU+jkTD73XucEWloDuNcd3s5+mwZxqIP68Mp
	CVJ8j/4EDjzhXvRaPzHIqzE8MHneJkclwsSp+uLhjx5/iybUqEIoIji+qXNABjElE2q0boyZd2D
	BDnbkaxsCTyS1hndAwytAbEdpFjhD0XSH7unisOhca1Hbmr73BCToQJ5MqevyYO5IOLeipUCrI2
	AH8yskMx5ib45CnXjOMkFAlEI9Zi1dqAl34Ov+ow6ZM3rB22Z+JRf3L08Sn/p6TQeZzTLzbpavW
	sz+Z4dX5lKT5rfe9724+pxIlpM6Pid/Xiunzj
X-Received: by 2002:a17:907:1b1d:b0:c51:982e:28be with SMTP id
 a640c23a62f3a-c51982e29c0mr546980266b.26.1795648517644; Wed, 25 Nov 2026
 15:15:17 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: fan ftdm700 <fantdm700@gmail.com>
Date: Thu, 26 Nov 2026 00:15:06 +0100
X-Gm-Features: Aa3M54qIyrwVgNwpYvwSoTvFdN9xXmbqIzctcYQBmuJIaJaJEBxZA7f_WVk8eEw
Message-ID: <CAOL0-9i8wCt+AJru1zzae0ir+UKYU06kB+6P0VMzxrTZ8GHc4w@mail.gmail.com>
Subject: [BUG] rtw88_8821au (TP-Link Archer T2U Plus 2357:0120): auth timeout
 on 5 GHz, scan returns nothing (6.18 LTS, 7.3.1)
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com, rtl8821cerfe2@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

The in-tree rtw88_8821au driver does not work on my TP-Link Archer T2U Plus
(2357:0120, RTL8821AU):

- Connecting to a 5 GHz AP (ch 36, 5180 MHz) fails with "authentication
  timed out" after 3 auth tries.
- Connecting to a 2.4 GHz AP (ch 1, 2412 MHz): the first auth try is sent,
  then the attempt is aborted ("by local choice") and NetworkManager
  reports ssid-not-found.
- "iw dev wlan0 scan" returns empty output.
- wpa_supplicant repeatedly logs "Reject scan trigger since one is
  already pending" for minutes, so scans seem to never finish.
- One "write register 0xa04 failed with -110" error was logged.
- The adapter works on Windows.
- It worked on Linux earlier (exact kernel unknown) and stopped working
  around the time I moved to kernel 7.1. It also fails on 6.18 LTS on a
  second machine.

Kernel: 7.3.1-1-cachyos (CachyOS kernel; I have not tested a vanilla
kernel). Also tested: 6.18 LTS. No out-of-tree driver, Secure Boot off,
regulatory domain BA (country BA: DFS-ETSI). NetworkManager +
wpa_supplicant.

Failed auth (kernel log, 5 GHz):
wlan0: authenticate with xx:xx:xx:xx:xx:xx
wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
wlan0: send auth to xx:xx:xx:xx:xx:xx (try 2/3)
wlan0: send auth to xx:xx:xx:xx:xx:xx (try 3/3)
wlan0: authentication with xx:xx:xx:xx:xx:xx timed out

2.4 GHz attempt:
wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
wlan0: aborting authentication with xx:xx:xx:xx:xx:xx by local choice
(Reason: 3=DEAUTH_LEAVING)

lsusb:
Bus 001 Device 011: ID 2357:0120 TP-Link Archer T2U PLUS [RTL8821AU]

rtw/firmware lines (journalctl -k -b | grep -iE 'rtw|8821'):
rtw88_8821au 1-8:1.0: Firmware version 42.4.0, H2C version 0
usbcore: registered new interface driver rtw88_8821au
rtw88_8821au 1-8:1.0: write register 0xa04 failed with -110
rtw88_8821au 1-9:1.0: Firmware version 42.4.0, H2C version 0
(firmware loads fine on every plug-in, on several USB ports)

sudo iw dev wlan0 scan | grep -E 'freq|SSID|signal':
empty output

I can test patches or collect more debug output if needed.

Thanks,
Sentinel
