Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794678557;
	b=SxeUwa6PXABfSFJ8iOx85mIVFt+RGf03hmCPbPO1im1QyWNymJWBM/Pllu7XM8McQBa2
	 T0hPX32fDMBNt4+/zK08oyWVWARV30GiF46ORrUznyAP2FonBfXbgdUheixSXrQy6mAL2
	 3N/VA4Td9rNW6JJvF1avgEOXt4g2jGHJDTs0qxzzG8ufmoI/2JxfD2z0zhWcICOHC5lJ6
	 /oaDJg9slQTQh+uN8k4y4PBiJtxUeVIZIPw+ur0Gx9ULQire0kgR7WJ4vA3wLVpz9BifM
	 uwGiDLpSpkGON6HBQgZmbAT6wWJHQrqbvqNnTS1y0DymJvIB0uE0XMeZ+SZKWrlaxJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=jloQnrsWUp8sF18pslvFeFg3EIpqpdfwtX0y+Jwnzj4=;
	b=fhG/YAcC0GOEm3oync9Xco8rgU3UJeslgha8dDn0ky1Bx7UBnpOFTxO5dW6OhbjZrpwD
	 2fbkfUN7YB0KI3aXlaazHfkw+pUQsfSmTzLhM5g/fVt9DqPQUJselp+bTWpQLTbjeZIOk
	 OHrnlm5rco0fzQJUje6TYnfHGwjLpJByHakdmlQZzXdsQrvkWtvvSnPxcwvg4R9gtsT62
	 pfJvVXJ1mhLbjAtlEucMj8UHT2FlEjYqU3ycsqnHvr2kg/99j+QS2bGM44oB7fwlN9pBn
	 ATSBDKyB4ovjCfWQ7bEMTgav8gNCkQPogf+Iq9Z5hffGcww2zyhWKeUZVKKSUVG/ltQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xyb/E9cT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E474606A323
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 17:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E474606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyb/E9cT
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso11919635ad.0
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794678557; cv=none;
        d=google.com; s=arc-20260327;
        b=aK/1uAtTOy3PnWEyWqzo5JEo/hqcKN83OUmlzQ9qB1uneL0N+ytXHs9zkMgNLRduA4
         fxGu13m0kfX3Oj7UGEDGgXKcC/yxKMjcWXrOlpb9CMzR6P/6N2lqhFKvtUlWSSfA0/d/
         H3GtzzTO9RORgim2S8Yh5+X0dKA3ejR7B0NMnZzgUUyy1Stwr5OgLkuqraj2EM395Fp2
         froXqF7h1esqSkLKSqdgA//v2a8pO+TxbkLRPIQHNMmccR9n8pC8D3L7w7i6Xgi9ApE+
         Zp3iFnteEwEP2q0fkn8ZJ+GbO0Qxc0Du/Uoi2DiJpygS7L6E66U6EZt/VgcmNGHXNIai
         aWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jloQnrsWUp8sF18pslvFeFg3EIpqpdfwtX0y+Jwnzj4=;
        fh=qW0phhq3fb3oiohK/Mu9j1KY1zyRNiiioKFc5anvatM=;
        b=i+jLApn3/Qx10Ct7CyuCelYJw9V7F7sEtzyN6ctc37kJ8UJfvsfj6YCME/60frzdu/
         csNAu2SI22IiXKYQbaN7WI/7yJXIOjqSwihNnHcvdpwOq2JdQMKvLvQY/o6HCPXMfKNQ
         9GFxEF1bokSrSrhkNcN0sl5tNhlypatpr13tet0C78ftTitCiktAXZ0I+tbOLvtWz4cK
         ps3gs2zY7/4RGskVOQldZy4jrIagd8Mc/s2kHK0+fYUz+Rf369ktfr3LFRJwdqbzMai/
         z9e+5s9tWBG9kq+sdMh2KIDdOuMw8CDPtG4+IFJlmVbf5Nijb6O08C2ingdbPDQzgMG0
         CG/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678557; x=1795283357; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jloQnrsWUp8sF18pslvFeFg3EIpqpdfwtX0y+Jwnzj4=;
        b=xyb/E9cTkad0ctMyJXOFeoCarcdkGx6vTT0V5xitug0GVuzmoEGv/RTwKRw8X2yJAv
         FHEayPckAZ5OWGSvMJVcbKOkstPcCK/ImDbYCFTJapquznJy8+jtW7f4GSVQ6T+v2J/b
         UNB/eXlNEIAuEux1HRy2aezuBu/MDWPR+v3JnZnd9nMgvMYosPKoz8HI8kA/FB6zKVrY
         /YXGzG9IEFCvgqRhqdyA5MVj6NPRSsNStIrUawzYzDn9eHBMkR04vSIBdR/Y5I4wgjyR
         iSVjoq7O3UbTkL70QIidrR3VDdGi96Fce32GLNX1VjukYbXJbdCTRdCtAwbXqsFqYKXd
         MmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678557; x=1795283357;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jloQnrsWUp8sF18pslvFeFg3EIpqpdfwtX0y+Jwnzj4=;
        b=flibeZFednytMVtKVthmBcVil84H93fl9ju8wkSvnFOxP2PtxTA7ELhIereDp6iBAj
         0v4UQI46sKJS4N5odS+RvI26lZDPL2lPmxgRO0GH4VEpL86GMENtz9E/gg1Xhbq5XyMj
         dp+tHBqrgoZ6tpTU+ygnXW5RefZbNEqeSf1WWNKEhUc69lYtg23+l1U9qPAxdjYBHXXv
         VNQt5wRRk2hr4dsvg8y/ZYDH+QEEDmly1hxV+UIAcyVhosbrmpoIYsPo/DL9qJEsf2NE
         BLJOInEQtKHuHxUujKqALtCabfcMylrqOrMkAorJfghq3mYRuEETWw0MaCQzMKDxI2FY
         0trA==
X-Gm-Message-State: APuU4Z8f3F891ikoDqsuS9WI2bVEgsxIkeXKVAhYYlMk84483SDbmLQp
	ICTmmmvtalh4k3ZHx7Nn5kvE58BhlXhZb3EXzP0swAzkKbtPdhEATXQt3qOgTzB6du8NzCZPgMK
	HK+xoTMs8lO5Vx1HGsxhrkhiKFbGjtiE65JFK16s=
X-Gm-Gg: AYBFou2hBFRLE6jsGBFtafya1b9Gb7HNcKewHhCuP8ueDJYRMjHOjKAGdQxHcO+qpqB
	fwG3NerLoeOPbMoG1MPWql6nTx5RUJFxcYyg6RLoe0XSJ/tNkgl2Dj4pMSTlDlojRWHWIsEGhh9
	G6Mce3XjXSFi2dZTRJutzLN0i3eV1pCrT/iqxR+LHeEtwhR4b5l0rQQ/ixJhSPfawc/Qu/3uson
	ARoA74dh4sU61/0hIDpfNQ/sEzli5xRYP0e9xMNHNb6wQTzX4hY8Y06LYdMWIHUtd2CwK49SnMm
	f4Zc6LfeN4zb4ar4Y9u1oEulkZ0BzJ/uCrStVTFgmTD29tiHi7nNyafAL7qSdO0LO1H0N0nWs5y
	s3OxO/C6N8257Fyf5QdJKcsRisjUzOX+AvHQAU+8=
X-Received: by 2002:a17:903:3c64:b0:2ec:ff7f:6f1 with SMTP id
 d9443c01a7336-2ee0da7bf4dmr59845985ad.11.1794678556570; Sat, 14 Nov 2026
 09:49:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Carlos Agustin <ubereatscarlos1982@gmail.com>
Date: Sat, 14 Nov 2026 18:49:05 +0100
X-Gm-Features: AclHuK-x_sjB75bv8kKSd5EJkrO8K2gTkc36R2W5nYW6lmkH9OVeD2LJMqJ8U34
Message-ID: <CAOjYftEGUvHj1PwrWCjOo-=h8kLYRUPCRxFWuqGuRThJ5PjmRA@mail.gmail.com>
Subject: Subject: rtw88_8822bu: USB 3 mode under load degrades RX chain 0, FW
 stops reporting TX status (fine with switch_usb_mode=N)
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am seeing a reproducible failure with an RTL8822BU USB adapter on
rtw88_8822bu when it is switched to USB 3 mode (switch_usb_mode=Y, the
default). With switch_usb_mode=N the problem does not occur. Reporting
in case it is useful; I am happy to test patches or collect more logs.

HARDWARE / SOFTWARE
- Adapter: BrosTrend AC1200 long-range (two external antennas, used in
the vendor's USB 3.0 cradle with its extension cable; probably
AC3/AC3L, about 2019). USB ID 0bda:b812, "802.11ac NIC", serial 123456
- Kernel: 7.3.4-arch1-1 (Arch Linux). Out-of-tree NVIDIA open modules
620.70.06 are loaded, so the kernel is tainted (O, E)
- Firmware: "Firmware version 30.20.0, H2C version 14"
- Board/CPU: MSI X470 Gaming Plus Max (BIOS H.40), Ryzen 5 3600
- AP: 5 GHz, channel 108, 80 MHz; signal about -60 dBm (two walls in between)

PROBLEM
With the default switch_usb_mode=Y, the adapter re-enumerates at probe
from high-speed (bcdDevice 2.10) to SuperSpeed (bcdDevice 3.00). It
works normally at light load (video streaming stable for 10+ minutes).
Any sustained load, e.g. a speed test reaching about 330 Mbps,
reliably triggers this:

- RX signal on chain 0 drops by roughly 18-20 dB while chain 1 stays
unchanged, and the adapter's LED turns off. From "iw dev wlanX station
dump":
    before: signal: -59 [-59, -60] dBm
    after:  signal: -64 [-80, -64] dBm
  (an earlier run: before -59 [-64, -59], after -62 [-82, -62])
- The state does not recover when the load ends. Unplugging and
replugging the adapter was the only recovery I tried (I did not test a
driver reload while in the bad state).
- The link keeps working at reduced quality, and in most occurrences
there is no kernel message at all.

I reproduced this on two different xHCI controllers: the AMD
CPU-integrated one (0000:29:00.3) and an ASMedia ASM1143
(0000:26:00.0).

On the ASMedia port, the first run additionally logged the following
and then the adapter dropped:

  xhci_hcd 0000:26:00.0: Event dma 0x00000000fec97c80 for ep 8 status
13 not part of TD at 00000000fec97c60 - 00000000fec97c60  (twice)
  rtw88_8822bu 4-2:1.0: failed to get tx report from firmware  (twice)

After I unplugged the adapter:

  WARNING: net/mac80211/main.c:1753 at
ieee80211_free_ack_frame+0x18/0x40 [mac80211]
  Have pending ack frames!
  Call Trace: idr_for_each, ieee80211_free_hw, usb_unbind_interface,
device_release_driver_internal, usb_disable_device, usb_disconnect,
hub_event

A second run on the same port reproduced the chain drop and LED off,
again with no kernel messages.

WITH switch_usb_mode=N
The adapter stays at 480M. The same speed test completes at about 248
Mbps, the chains stay balanced (signal -61 [-63, -61]) and the LED
stays on. The setting persisted across a reboot.

OTHER NOTES
- The link is on 5 GHz, so the 2.4 GHz interference rationale given
for switch_usb_mode does not seem to apply here.
- The usual "write register 0xc4 failed with -71/-110" appears during
the mode switch.
- I saw a May 2026 patch extending the USB TX report timeout to
RTL8822BU; I do not know whether it is in 7.3.4 or whether it is
relevant.
- The out-of-tree RinCat driver does not build on 7.3, so I could not
compare drivers. I have not tried another cable/cradle or another
adapter, so I cannot rule out a marginal adapter. That it reproduces
on two host controllers suggests it is not a host controller issue.

Happy to provide more logs (e.g. with debug_mask) or test patches.

Thanks,
Carlos
