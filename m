Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794392139;
	b=YPANqmQ66FEtLo7HnubLBowLNPwR2dAb6EGqrTl2XVVfNNq/e1d3g2QbJb2T+IqfYjtV
	 6oI4PxzSWFpYkJHQTnWzlF5K7I8JS4QdopikBLA1Ha8IUnNYKrcpvi1dxTgf7DlO4eXCq
	 Xgb27hjipRuqly5ZdsRbK8BoOaSDOTsvwj2Dyr/bwI+hW0dFbNgKZ6Nor5L58eRzxjCU5
	 W4Rm5gVp6GDs7FCbv1v8PyRFqcMZ1H5ceFNVkNLOWsKrqRSg5SYJ0h+nnJJC1Btv6Lpjb
	 tTCr8XcGMaoh28iN0zLkaF4tm7IH9EAZkRV/gUAtGza9ggvgxOv0KpMoOe1o3x8EaLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vfWp8G7kNwzHxPVc4nb18IcS5dYsXdmSeY00+X6MJAw=;
	b=4FxQI0v4PXopD+8GpaO3HTLWm7BSgSR2kH638svD1J/pb63R9+9y5ZnoBtBwz7H7sQSu
	 8BtkalhNV6+dVXFKVAd/422N6br0raK/cjC7DgQW7eVe7wz2vfRu5pyxNRFw29pBM4krk
	 8tGjsYHtCpzBQJ+lmPH18i3hHczmLqBNQajCxuHBzE8KTS2JVpm4sSGp4fWX0TOCUuqs1
	 73WXpF5EyoQE+VxjA0sTjH6NxicN3OZdr9C6lCAfry5yiORptro3WhrxKxWyrCv3lLAvO
	 Vs8xnNUgIJNNMF5ebLqLCT1bwDHJ3U2NsbTmwg9GVoYPFtyQMohbhXJ+4HhXPEacP0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbH3mmq8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D84606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 10:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbH3mmq8
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be6030c9fso2622535d50.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794392138; cv=none;
        d=google.com; s=arc-20260327;
        b=XdaOnZewIDKrSfH9UY9M5f0CCilS1k4Zde/xnxZcSex888nzIu4IrU9r07q3nAfpl/
         iIwusKSytJ6/8PQpivippcaR33yrq2I9eJ3bWZ7K4LpQv4O7NcdPt1XexRUEY/Zeux2o
         0HfLu/SOik11cFpOHgPeYxMTyTLL1JO7P3NLHuSjo/0HbweQhkHoGKpY8KGvQtFfNmf9
         0fZm9uGICUSAbZbxTLUEMto2gEQOO+vIIrfeIK8Pc7TUlST0XsVTDl6v0of3LgBjI6qs
         VuMTIcjC1oDiPGj88rXJN2Sa59LzOKWEhP5TMp3G0Bkkzg0+la6MszEP7aPKkjkvG08W
         RqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfWp8G7kNwzHxPVc4nb18IcS5dYsXdmSeY00+X6MJAw=;
        fh=PXfnX/53VGxUZ5MDNohsldIH8LWPOZ0SdJqTjEtvsro=;
        b=JyL8w6etk42yDf3pUAwD0g4CNjzG0lmsoOlOEXthj8giy0SrJ6yGgRRfDTVSDjB1w8
         vdskmG+JcO52302P8G1PH5l2KZvKbpG3LuBXufs22T/WqBCQfFdLpfDUKo6g/ZbnNBJu
         c407WIG0Km+AEgLD7885ns89n8UFNyYOLG8G16QTk5Nrw9n4ZEXGn7y27qPu3maKPeFv
         qQQ9yh5MeMkU18sX0696MWcxROmuXCoNfofkhMq2qMJKXD1i19+epi4Lu4iACBGAFu79
         54oIju/30xw6vamO/DrjB39lIDJy9tvH/acSzTv2s44d4E3PzUMf7eovp5S/lj1QW5so
         Wmyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392138; x=1794996938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfWp8G7kNwzHxPVc4nb18IcS5dYsXdmSeY00+X6MJAw=;
        b=CbH3mmq8RX6YZDZCK0b+ZI7QqPdfYd7FCHmMvL6L6cgxe59pi+6EgUeysr9tbRIgKr
         sX2NqBITW3af3rW5Wyu1T6kmfbjDf7B7u7y/1egxfk/pzcdlxPuMABVPjcvXig9jl51F
         X3/NWrMdwHDdif7fWtslgqUS+9lUX7f6YP1Fucsk1D2FCsckCgBFS2XQxQfng6g/iMfx
         Z023wZ7RV/gfGzrHTbezYOcc65GdygtTRZbmab+IKza67dDLmzxtlAVklPaBg8ocmuET
         XDdgkYW2G3dxr2OzOk2WHljfINQmrHnD6e/qlUMDh/YXmHJbtJIUNUGrXNDjgWM/VTv7
         Bthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392138; x=1794996938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfWp8G7kNwzHxPVc4nb18IcS5dYsXdmSeY00+X6MJAw=;
        b=UfwEOlAvqKgGpSvvQBW+THlnSZ/MmIZWTpUILmwidc4+XGNRZq40XlyyocYaHOIa3G
         QCihCED9EWuoGiMfWssi20ltCBBtNIDi8a20N0SwGxS3OD2K3vszWALv2c+DYJeiFhSt
         P3rBVZzRDg9T8xLOekbheHa49WporkDhyMoanZudzn9nKG0lxjevmP8b5ccCNFoGrVql
         t5a8XqWpNK0HOV8EKIErESthkqKPAwSuaCtQJwggxfT8UovTFOUkz5IAaWbUO+A2fDaA
         UrkFn7nR+n76pBo14e6c2ZvAe7B5Jf0+Wo4XVytIIH9pXR3d/Kr9Qrq5atB+AzdKKny8
         0KPQ==
X-Forwarded-Encrypted: i=1; AL+hErEimcdFxXR0LZHZ2Fn6xPVWjv0wA09b2NauR00RVxDAshP7f8cOifNn0wK2HH8TmDGHUDTQEmezUhUUbUs/xw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fqoNuSKThUMUJE0o1/aIY9C4tRhe46wl5xeTDJsWvxzX44cjt
	dMQSUXWNwID2CeIVQFx+KIlYKonRdUR4eNTfsmxhOadgNU6tKytaWUfpQY965eiDV1OktOfWAQI
	Ow23ObcQ/I4xdhvnSanci8So1uQh+51ww69fHXzU=
X-Gm-Gg: AYBFou1iYwNl5sliEUQ+FJoXmcY5kFxtnqeS3MgSEprGQwxqCfnXNEsXb/1erJq8Y54
	a/+Yk2rGLvTv9DOypCaAR60tgUqQARnPlHhkG/7Hru+EMemLuLGMz2l0VxL0iUoH9cQCBJwaUSf
	hiQLBClv+l1FLSQcELH45oDJ6SsjpAm9XJXvH1hrTCY9KIXC/ndpxIv3a17jjflCHR3sbGUstAD
	2KhX2GHg+JDPA7RgGiTEKJc7/jEz/z5j3wZG3yitRJGBwQM1pqNU8qfOH+D13qALA2nQ9kFSdOm
	npwvd7fqa9UyzECT+O/q/xQGWwOTE/mjunBLytYvdB3oC4q6nHSHeTlp+epllOXWXw4zBi/6y+d
	apILPza39MutTimAU4aG3CrAtBSlL5/Zt6ATmbAU=
X-Received: by 2002:a05:690e:1685:b0:67a:5135:1495 with SMTP id
 956f58d0204a3-67c67c92ec4mr1709981d50.9.1794392137368; Wed, 11 Nov 2026
 02:15:37 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALTviDkEWERPrtc51WFB1K3Sn7wLdt6YhB=_Ck4PwBPdLcojBQ@mail.gmail.com>
 <2c8319def838488cb8a3e4d5dc44f357@realtek.com> <7d68ebe2-d24e-4c07-9b49-7f76551a12bb@gmail.com>
In-Reply-To: <7d68ebe2-d24e-4c07-9b49-7f76551a12bb@gmail.com>
From: =?UTF-8?B?UGFibG8gTWFydMOtbmV6IFLDrW9z?= <pabloriosmartinez@gmail.com>
Date: Wed, 11 Nov 2026 11:15:33 +0100
X-Gm-Features: AclHuK9B1VkpSTdy6n24oX7bUGux4piqKw2gNxsowY1ia-C3j1Nbmc7EBK-m53c
Message-ID: <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com>
Subject: Re: rtw88: RTL8822BE (10ec:b822) never authenticates on 5 GHz with a
 Huawei router; poor 2.4 GHz link; same hardware works fine on Windows
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ping-Ke, hi Bitterblue,

Thank you for the suggestions, and sorry for the delay. I ran most of
them; answers inline. Tests were done upstairs, in the usual spot,
unless stated otherwise.

> Is there any version working well to you?
> Could you bisect (use distro live image) which kernel can work to you?

Not so far. Debian 13 (6.12.107), Ubuntu 26.10 (7.3.0-9-generic) and
CachyOS (a 7.x kernel, exact version not recorded) behave the same. I
have not tested older kernels yet: old live ISOs may not boot here with
Secure Boot enabled. I could try disabling it to test it out if you think
it's worth it, but since I'm currently using Windows 11 with encrypted
drives, I'm not sure if that might cause any problems.

> I think it is worth to try putting closer.
> And, can you try another AP to see if anything different?

- Next to the router, 5 GHz works very well: about -45 dBm, link rates
  780/702 Mbit/s, ping about 2 ms, speed tests 350-440 Mbit/s.
- A phone hotspot on 5 GHz (ch 149, 80 MHz) at 1 m: 0% loss.
- I connected next to the router and carried the laptop upstairs while
  logging once per second. The signal went from -45 to about -78 dBm;
  pings were lost only when it reached about -77 dBm, and "tx failed"
  went from 1 to 8 within 5 s. After that the association stayed up
  (ping about 2 ms). Reconnecting to the same 5 GHz BSS from that spot
  fails every time (authentication timeouts).
- Windows 11 on the same laptop in the same spot connects to that BSS
  (RSSI -76 to -81 dBm as reported by Windows, 80/80 pings, 3-9 ms).

> How can you prove "no authentication response is ever received"?
> Can AP ack the auth? I mean that might be a TX side problem.

I cannot prove it; that sentence was an inference. I tested with a
second (monitor) interface on the same card (Ubuntu 26.10, 7.3.0-9):

1) Beacons: with the station interface down and mon0 fixed on channel
   36 (20 MHz, no HT), I receive 194 and 196 beacons of the AP in 20 s
   (about 195 expected), mean -75 dBm. So RX is fine.
2) In that state I injected 100 probe requests and 100 open-system
   authentication frames from my MAC to the AP: it ACKed about 100/100
   of each and answered them (many retransmitted answers, since mon0
   does not ACK them). The same on 2.4 GHz and next to the router.
3) With mon0 at 40 MHz (center 5190) or 80 MHz (center 5210) and
   everything else equal, the AP did not ACK or answer any of the 100
   probes or 100 authentication frames, while its beacons were still
   received (99-100 of about 100).
4) I set the router's 5 GHz width to 20 MHz (it advertises no
   secondary channel). Station-mode authentication still failed.
5) Station mode also fails on 2.4 GHz at certain times of day (e.g.
   with NetworkManager on Nov 8 at 13:14, and with plain "iw connect"
   open authentication on Nov 11 at 10:49), although on Nov 8 at 14:05
   injected frames on 2.4 GHz were ACKed 100/100. So from the same spot,
   injected frames at 20 MHz are ACKed, but authentication from the
   station interface is not, in both bands.

I do not know whether (3) is a monitor-mode artifact or related to the
failure. Is there something in the station-mode TX path (per-bandwidth
TX power, rates, RF configuration for this RFE) that differs from
injection? If you tell me which debug output or capture you would like
to see, I can collect it.

> For this case, "iw dev wlo1 set power_save off" should help.
> How about the loss rate comparing to power_save on? Almost the same?

Almost the same. In on/off pairs (2.4 GHz upstairs, 2.4 GHz next to the
router, and the 5 GHz hotspot) there was 0% loss in every run with
either setting. "firmware failed to leave lps state" appeared only in
some runs with power_save on and never in runs with it off. My earlier
54% figure came from a day when the 2.4 GHz link was bad for other
reasons, so please ignore it as evidence about power_save.

> Have you tested with disabling Bluetooth, since this is a combo chip?

Partially: I unloaded btusb (the bluetooth core stayed loaded because
other modules use it). 2.4 GHz was unchanged and 5 GHz upstairs still
fails. I do not know whether the BT side of the chip stays powered.

> You can add a printk to print the type of your RTL8822BE.

Thanks to Bitterblue's hint: the Ubuntu kernel has the rtw88 debugfs,
and coex_info reports "Mech/ RFE =3D Shared/ 5", so it is RFE type 5, one
of the supported types. I did not keep the dumps; I can collect
coex_info, phy_info and tx_pwr_tbl again if useful. I could not use the
edcca_enable switch: opening it fails with "Operation not permitted"
(probably kernel lockdown because of Secure Boot).

Corrections to my first message: the "wpa-psk" profile against the
router in WPA2/WPA3 mode actually used SAE in my logs. I can only say
the 5 GHz failure happens with the router set to WPA/WPA2 (Oct 31) and
to WPA2/WPA3. Also, the 2.4 GHz link varies a lot with the time of day
(it worked on the evenings of Nov 5 and 7, but not at other times,
possibly because of a strong nearby 2.4 GHz AP), so please treat
"Problem 2" as unreliable. The 5 GHz failure upstairs is reproducible.

Thanks,
Pablo

El mi=C3=A9, 4 nov 2026 a las 11:45, Bitterblue Smith
(<rtl8821cerfe2@gmail.com>) escribi=C3=B3:
>
> On 04/11/2026 03:33, Ping-Ke Shih wrote:
> > Pablo Mart=C3=ADnez R=C3=ADos <pabloriosmartinez@gmail.com> wrote:
> >> Hello,
> >>
> >> I would like to report a problem with an RTL8822BE using rtw88_8822be.
> >> The same card, in the same spot, works well on Windows, so I suspect a
> >> driver/firmware issue rather than coverage. I am happy to run any test=
s
> >> or try patches.
> >>
> >> HARDWARE / SOFTWARE
> >> - Laptop: HP Pavilion 15-bc450ns (i5-8300H), BIOS F.32
> >> - Card: Realtek RTL8822BE, PCI ID 10ec:b822 (04:00.0), HP subsystem.
> >>   Both antenna cables are connected; "iw phy" reports available and
> >>   configured antennas TX 0x3 / RX 0x3.
> >> - Debian 13.7 live USB, kernel 6.12.107+deb13-amd64, firmware-realtek
> >>   20250410-2, rtw88 firmware 27.2.0 (H2C 13)
> >> - Same behaviour earlier on CachyOS (a recent 7.x kernel, exact versio=
n
> >>   not recorded) and on an Ubuntu live session (26.10)
> >
> > Is there any version working well to you?
> >
> >> - Module parameters at defaults: disable_lps_deep=3DN, disable_aspm=3D=
N,
> >>   support_bf=3DY
> >> - Router: ISP-supplied Huawei OptiXstar EG8145X6-10, separate SSIDs fo=
r
> >>   2.4 GHz (ch 6, 20 MHz) and 5 GHz (ch 36, auto width). The router is
> >>   one floor below the laptop, with a concrete slab in between.
> >
> > I think it is worth to try putting closer.
> >
> > And, can you try another AP to see if anything different?
> >
> >>
> >> PROBLEM 1: 5 GHz
> >> Linux never authenticates. This repeats indefinitely:
> >>
> >>   wlo1: authenticate with 22:87:ec:xx:xx:08 (local address=3D90:32:4b:=
xx:xx:xx)
> >>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 1/3)
> >>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 2/3)
> >>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 3/3)
> >>   wlo1: authentication with 22:87:ec:xx:xx:08 timed out
> >>
> >> - It fails with WPA2-PSK and with WPA3 (SAE), and with the router set =
to
> >>   WPA/WPA2 TKIP+AES and to WPA2/WPA3 AES, so it fails at the 802.11
> >>   authentication frame, before any SAE/EAPOL exchange.
> >> - Same result with regulatory domain 00 and with "iw reg set ES".
> >> - The BSS appears in scans (its beacons carry country IE ES), but no
> >>   authentication response is ever received.
> >
> > How can you prove "no authentication response is ever received" ?
> > Can AP ack the auth? I mean that might be a TX side problem.
> >
> >> - Windows 11 on the same laptop, same spot (Realtek driver
> >>   2024.0.10.209): connects with WPA3-Personal, reported RSSI -76 to
> >>   -81 dBm, 80/80 pings answered, 3-9 ms, link rate 260-292 Mbps as
> >>   reported by Windows.
> >>
> >> PROBLEM 2: 2.4 GHz
> >> - Linux associates, but the link is very poor: iw reports about -73 to
> >>   -76 dBm, and the beacon loss counter rises about once per second
> >>   (14 to 65 over roughly 2 minutes). Across 5 runs, ping to the router
> >>   showed 0-54% loss and average RTT of 37-278 ms.
> >> - Kernel messages: "rtw_8822be 0000:04:00.0: firmware failed to leave
> >>   lps state" (several times), and once "failed to send h2c command".
> >
> > For this case, "iw dev wlo1 set power_save off" should help.
> >
> >> - The beacon signal average (-97 to -109 dBm) is far below the frame
> >>   signal average (about -75 dBm). With a phone hotspot at -48 dBm both
> >>   agree (-46). Occasionally signal readings of -100 to -112 dBm appear
> >>   with the second chain at 0 while traffic continues.
> >> - Windows, same spot: 60/60 pings, average 12 ms (max 157 ms).
> >> - With a phone hotspot (2.4 GHz, ch 1, -48 dBm), Linux works well:
> >>   rx 78 Mbit/s (VHT-MCS 8, NSS 1), tx 65 Mbit/s (MCS 7).
> >>
> >> TRIED WITHOUT EFFECT
> >> - "iw dev wlo1 set power_save off" (one run had 54% ping loss)
> >
> > How about the loss rate comparing to power_save on? Almost the same?
> >
> >> - rtw88_pci disable_aspm=3DY (lspci still showed "ASPM L1 Enabled"
> >>   afterwards)
> >> - WPA2 vs WPA3, regulatory domain 00 vs ES
> >>
> >> COULD NOT CHECK
> >> /sys/kernel/debug/ieee80211/phy0/rtw88 does not exist on the Debian
> >> kernel (presumably rtw88 debugfs is not enabled), so I could not read
> >> tx_pwr_tbl, phy_info or coex_info, nor test the edcca_enable switch.
> >> A single correctable PCIe error (BadDLLP) was logged once; the AER
> >> counters were 0 later.
> >>
> >> QUESTIONS
> >> Is this a known issue? Which additional data would be most useful (a
> >> kernel with rtw88 debugfs, a debug_mask setting, a monitor-mode
> >> capture)? I can provide full logs and test patches.
> >
> > The kernel v5.3 or earlier support RTL8822BE. Could you bisect (use
> > distro live image) which kernel can work to you? It would be easier
> > to address problem.
> >
> > Have you tested with disabling Bluetooth, since this is a combo chip?
> >
> > Another point is that rtw88 can only support these types:
> >
> > static const struct rtw8822b_rfe_info rtw8822b_rfe_info[] =3D {
> >       [2] =3D I2GE5G_CCUT(efem),
> >       [3] =3D IFEM_EXT_CCUT(ifem),
> >       [5] =3D IFEM_EXT_CCUT(ifem),
> > };
> >
> > You can add a printk to print the type of your RTL8822BE.
>
> On CachyOS you can get the RFE type from debugfs:
>
> cat /sys/kernel/debug/ieee80211/phy*/rtw88/coex_info
