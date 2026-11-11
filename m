Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794430865;
	b=Na07SdQcc9hfUNFhwZ3HDhYoLb9aAxTAAOTZKPqRsVTKAflMIUT+IIxQS+KEiz4Cdlks
	 O0q1CDv6csXC8sjSz7NJpv3BSBJBOjuIfjP4v60ZMwvKbFFbmJmaBlGaJf0W3IhMjTiXd
	 3OSyDEaTfhoE6apVsQgKaGY9sNcOUQi6zCjTYlelBOVHsix1An46XA41rTWKddWGMYv38
	 z78xdjC1ePKdZO9C4ifUEcOXqTCKSJnmE8R/ZlrjU31t63VxMVSDMSVlEfcbnHdUAPzdu
	 b49GyVB9wwANI/qXTjWve8I3BORzFfVP8+STFTi1RtT3xUGDrWr8IoqyMtfH2wzWQnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Np1n6weFn+MWI0TaTfGYS8W3TMFXyuyT39MvS7008JQ=;
	b=GJwsUq2tHtH2s8wGMDzpjRM+0zM5U1GsDbWKSA4UKbM72cin/ATx3mUelgV4oL3iL5DW
	 Zw7DaZscb5ZINa0qiPkDqBXFrJ664cXZ6imxmeiXCxcHtxqJh9Sv9a2JvrgkNn9/2elHw
	 GM3fEk3BX2+eI8hl+NZ5g0tTqdAek/Ckju3xpo+CeaA+wxNfSmvlMCSRG+aXXwqZwStS2
	 uLih+/IALXP9fyIw1h4/LkvTU9jcH1mdSE/F9yJtZQsxVQTdkEMzecjMKMf6T8vGmHhtj
	 pn6Lp3IhcuIetnJomIQPZDB3Z4hduQ1fHFITGbLw4oURd4uZrHr8N0PkeyyiJCmbHIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjSCeEZr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F5606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 932F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjSCeEZr
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6767d92cde6so4113722d50.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794430863; cv=none;
        d=google.com; s=arc-20260327;
        b=lNFBQx9SL2/h6nydGIOkyy/NiaPcPd8yJcdQnzLNAGVEJ/WyJsJNbPLmDMxaX6SSC0
         BWDNt08v0KVUNyktT1COvBYBCxKHl/27kSfCj2luwmuiDBG9qQuUyP1ZrHFTPsp4Rq+O
         4n0AMzhP6hGZZUWIGlV/bFsMG+tThbBxBvMMnoxbzgKKkQ11sb5F6l0vjHK85jSnl5el
         TLF01p9vIGKMD7C/tJzAjJJNFwMapIJ9QdIHKf6VfoEDQ2eLBsef85D/JiukZQBirtTQ
         BVhV1nhT34vOr1vZXblQ1LTcCkuVFm3UiGCVBO2RRPNjdRQvfOLiwhud3joIrV0dUa3/
         Aobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Np1n6weFn+MWI0TaTfGYS8W3TMFXyuyT39MvS7008JQ=;
        fh=HwDyUBHTAe63hlYbDJkw6OL6xBVKGCS127tQMZyRy+0=;
        b=oRKfsZcVM5/QgXDHNYLAyS2kItXOWSaaX8ZMeY4cWGC6Go6gO4AoyxFbCCnwe4gzMe
         FOJhdWSS1ujwtV4kUQUKZkh+s/A489ONwBdAkWdonM607bQV6wLNuNJM7BduT9v6zA9U
         NkF9yjTQLTb2OVT1g7SUyuV1LQ5sKZXLkunDnE+oc0IlqyjV9en+6czXm0dt9msrXnsA
         cZnr1yuoWnWqYTUu8alRXTsfz6c1UIkQRc4vvCsZkd0g3HV4tmSoHh4yOBGYyeQjgcFj
         IegzXovkyeHPXFTBGzPEoQIZvSwaUoNro0212OZQYgg+K30M5nFxvMTw/A21ROIBUkGP
         S0bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430863; x=1795035663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np1n6weFn+MWI0TaTfGYS8W3TMFXyuyT39MvS7008JQ=;
        b=gjSCeEZrF4YYtT43A2yVc464BmMieozx4J81r/UZ5qChvL6LfJxV9UZ9MMdXyFKbF1
         6UQcoKsKcOrm3WBCXVfHnnAbhdrl59oEWXlxEl50/9/jd8epaZ2UXENDbx6pYTRlIWpu
         N18uoiSL9+dtRKr3nPVQlPuqyK0zvdigr0nSsip6hxRmPgzuU+K8eKbyrHNaxcAvkDAo
         nX4vrCydgVdhC55Q9AaerlQfd0Ropk4aDaTp5o78H6q1UvPlQ7fM1yMZfGYEObuUl54i
         PLCrjpXMd+x78o1BVTutInusNEpgIe4k88dbCtzdRto9Sbx4Sgcy4il76Q7ruCPpVve2
         DOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430863; x=1795035663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np1n6weFn+MWI0TaTfGYS8W3TMFXyuyT39MvS7008JQ=;
        b=dHfrsrRtMpOWWdQTRyfPFqq1j1tjIm3gerRunwfevMs1eyF4vdVLl+9khRsRPRpyHW
         44FitAsWpd2KOh9GOgwxKR5Txn3q4AD1c4t19K3LTRQrF2NaH5MxTQfbczdxHp//fYhR
         kdcJ8gCgPT2Dif3aG5oYrm9ijTB8+eswqV/tKsclbBlIsp7le/btNOpeY8qeJOXN/XCf
         r0BmhAgsWtP4Ss1gI3ti2uHSIQCalxNJgogvUasFQDfi9NO+4J4WyzAD1hFyDZ6CtXZj
         G9jo+tHRYVIR73Bo6iV7ZaUReCX2EScWs3cTivMw80fUFTfVQT/Y+Hn0Cng8MYUCUguH
         OEEg==
X-Forwarded-Encrypted: i=1; AL+hErEVAJfCRk5uy0yFpE46qFrGROyifu6e68/0Gwi4b0OElFDol/G6TFPIuBb1QGZHtCkx22t20vi0dCf5vaLreA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xwE1n5WVZUtz4XyvAsy3UnSkBRWZVJALwYIEptrulJT6A5k3/
	pDl+cQU3hW5RPmki9JvrT+swUWaYaHsGuhHJzQ8lEpRcQVCvSqtEBf9R+ITBJHIpYWDZotVpd1p
	3B/G2Xs7gNPd9K1E0wrw2b9AtCwonn9cSuQZqA5+xGlU/
X-Gm-Gg: AYBFou3yViMVQyX1IYfumUPNkrkMF0U/W7BNNnJ2m5EBIwv+YqyxAL0dp7uDF8lmyXX
	LsDLupL0xZy02hTrJnysmiHKfvaccLUsEZ4z7aNRH301jrAnmjWHLXbu18ZLFigOlaWtlcVgYVF
	oRNaEE3GgT94gfXb/TfcTNH+B2t28b8wQXC6kjTQ8iOr3COk6dlC5oUxCcxMKmBWRVEdHrw+VQw
	fNlwuAOy5O97h92pqoh5YlGPNOzUyt50tSUzE26LuW2v5erjs6PsqB9NMS0XMtf/F19mBfp+oE4
	FEkaDRnjRxG1m0tsiI5Pxe3H/+NjJAQ/EdMZ24lzYJ53vImAvyqQU3/YEI7kXW8ZeAPhEZ2c7QC
	o0jTvWjB7vh3YDIYtH13jxqNRxQJv5lKoF0IKxjs=
X-Received: by 2002:a05:690e:144b:b0:677:c6f6:8cac with SMTP id
 956f58d0204a3-67c67a44ebdmr2517523d50.0.1794430863129; Wed, 11 Nov 2026
 13:01:03 -0800 (PST)
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
 <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com> <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com>
In-Reply-To: <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com>
From: =?UTF-8?B?UGFibG8gTWFydMOtbmV6IFLDrW9z?= <pabloriosmartinez@gmail.com>
Date: Wed, 11 Nov 2026 22:00:51 +0100
X-Gm-Features: AclHuK8VbX6lzjewrOi-fXDkjxXNml-hXuAW7JSI2KeTqDhLT5GdEYIYigiLwQU
Message-ID: <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com>
Subject: Re: rtw88: RTL8822BE (10ec:b822) never authenticates on 5 GHz with a
 Huawei router; poor 2.4 GHz link; same hardware works fine on Windows
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bitterblue, hi Ping-Ke,

I built the Debian 6.12.107 rtw88 sources with your print_hex_dump patch
(nothing else changed) and loaded the modules. This is the raw efuse
logical map of the RTL8822BE, with my MAC address (0xd0-0xd5) replaced
by xx. 0x70-0xaf is all 0xff, and I left out 0x100 and above:

00000000: 29 81 00 3c 09 10 0b 00 ac 04 a4 35 10 03 30 0b
00000010: 2c 2c 2d 2d 2d 2d 2c 2c 2c 2c 2c 02 00 00 ff ff
00000020: ff ff 27 27 27 27 27 27 27 29 2a 2b 2a 2a 2c 2e
00000030: 02 00 ff ff 00 ff 0c 00 ff ff 29 29 29 29 29 29
00000040: 29 29 29 29 29 02 00 00 ff ff ff ff 26 25 25 23
00000050: 23 23 23 23 25 25 23 23 23 23 02 00 ff ff 00 ff
00000060: 0c 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff
000000b0: ff ff ff ff ff ff ff ff 7f 21 1d 00 ff ff ff ff
000000c0: ff 29 00 11 00 00 00 00 00 ff 05 ff ff ff ff ff
000000d0: xx xx xx xx xx xx ec 10 22 b8 3c 10 1b 83 c3 ff
000000e0: 80 8d 80 08 00 00 11 3c 27 00 10 20 01 22 b8 fe
000000f0: ff 4c e0 00 04 0c 00 80 02 00 80 02 00 00 f0 00

With the struct layout of rtw8822b_efuse (channel_plan at 0xb8):
  0xb8 channel_plan =3D 0x7f, xtal_k =3D 0x21, thermal_meter =3D 0x1d
  0xbc pa_type =3D 0xff, lna_type_2g/5g =3D 0xff
  0xc1 rf_board_option =3D 0x29, rf_feature_option =3D 0x00
  0xc3 rf_bt_setting =3D 0x11
  0xc9 rf_antenna_option =3D 0xff, 0xca rfe_option =3D 0x05
  country_code =3D ff ff
The PCI ids appear at 0xd6-0xdd (10ec:b822, subsystem 103c:831b), so the
offsets look right.

So rfe_option is 5, as coex_info said. If "Shared" is derived from
rf_bt_setting (bit 0 of 0x11 is set), that byte is programmed, not 0xff.
rf_antenna_option is 0xff, so if that is the byte you meant, it is
indeed undefined. Which byte does coex_info use for "Shared"? And is
0xff in rf_antenna_option / pa_type / lna_type normal for RFE 5?

I understood "Shared" as the Bluetooth sharing an antenna with the
WLAN (not that the WLAN has a single one), which would fit 2 spatial
streams working, but I may be wrong.

What would you like me to try next?

Thanks,
Pablo

El mi=C3=A9, 11 nov 2026 a las 12:58, Bitterblue Smith
(<rtl8821cerfe2@gmail.com>) escribi=C3=B3:
>
> On 11/11/2026 12:15, Pablo Mart=C3=ADnez R=C3=ADos wrote:
> > Hi Ping-Ke, hi Bitterblue,
> >
> > Thank you for the suggestions, and sorry for the delay. I ran most of
> > them; answers inline. Tests were done upstairs, in the usual spot,
> > unless stated otherwise.
> >
> >> Is there any version working well to you?
> >> Could you bisect (use distro live image) which kernel can work to you?
> >
> > Not so far. Debian 13 (6.12.107), Ubuntu 26.10 (7.3.0-9-generic) and
> > CachyOS (a 7.x kernel, exact version not recorded) behave the same. I
> > have not tested older kernels yet: old live ISOs may not boot here with
> > Secure Boot enabled. I could try disabling it to test it out if you thi=
nk
> > it's worth it, but since I'm currently using Windows 11 with encrypted
> > drives, I'm not sure if that might cause any problems.
> >
> >> I think it is worth to try putting closer.
> >> And, can you try another AP to see if anything different?
> >
> > - Next to the router, 5 GHz works very well: about -45 dBm, link rates
> >   780/702 Mbit/s, ping about 2 ms, speed tests 350-440 Mbit/s.
>
> [...]
>
> >> You can add a printk to print the type of your RTL8822BE.
> >
> > Thanks to Bitterblue's hint: the Ubuntu kernel has the rtw88 debugfs,
> > and coex_info reports "Mech/ RFE =3D Shared/ 5", so it is RFE type 5, o=
ne
>
> "Shared" indicates that your card has only one antenna, but I don't
> think that's likely. You could not have 440 Mbps with just one antenna.
>
> This comes from a byte in the chip's efuse. Maybe this byte is undefined
> (0xff) in your chip, which would explain why it says "Shared". Here is
> a patch to show the raw values:
>
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/=
wireless/realtek/rtw88/rtw8822b.c
> index 7c178ed63f45..92fd410c15cf 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
> @@ -46,6 +46,9 @@ static int rtw8822b_read_efuse(struct rtw_dev *rtwdev, =
u8 *log_map, u8 *phy_map)
>
>         map =3D (struct rtw8822b_efuse *)log_map;
>
> +       print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1,
> +                      log_map, efuse->logical_size, true);
> +
>         efuse->usb_mode_switch =3D u8_get_bits(map->usb_mode, BIT(7));
>         efuse->rfe_option =3D map->rfe_option;
>         efuse->rf_board_option =3D map->rf_board_option;
>
> > of the supported types. I did not keep the dumps; I can collect
> > coex_info, phy_info and tx_pwr_tbl again if useful. I could not use the
> > edcca_enable switch: opening it fails with "Operation not permitted"
> > (probably kernel lockdown because of Secure Boot).
> >
> > Corrections to my first message: the "wpa-psk" profile against the
> > router in WPA2/WPA3 mode actually used SAE in my logs. I can only say
> > the 5 GHz failure happens with the router set to WPA/WPA2 (Oct 31) and
> > to WPA2/WPA3. Also, the 2.4 GHz link varies a lot with the time of day
> > (it worked on the evenings of Nov 5 and 7, but not at other times,
> > possibly because of a strong nearby 2.4 GHz AP), so please treat
> > "Problem 2" as unreliable. The 5 GHz failure upstairs is reproducible.
> >
> > Thanks,
> > Pablo
> >
> > El mi=C3=A9, 4 nov 2026 a las 11:45, Bitterblue Smith
> > (<rtl8821cerfe2@gmail.com>) escribi=C3=B3:
> >>
> >> On 04/11/2026 03:33, Ping-Ke Shih wrote:
> >>> Pablo Mart=C3=ADnez R=C3=ADos <pabloriosmartinez@gmail.com> wrote:
> >>>> Hello,
> >>>>
> >>>> I would like to report a problem with an RTL8822BE using rtw88_8822b=
e.
> >>>> The same card, in the same spot, works well on Windows, so I suspect=
 a
> >>>> driver/firmware issue rather than coverage. I am happy to run any te=
sts
> >>>> or try patches.
> >>>>
> >>>> HARDWARE / SOFTWARE
> >>>> - Laptop: HP Pavilion 15-bc450ns (i5-8300H), BIOS F.32
> >>>> - Card: Realtek RTL8822BE, PCI ID 10ec:b822 (04:00.0), HP subsystem.
> >>>>   Both antenna cables are connected; "iw phy" reports available and
> >>>>   configured antennas TX 0x3 / RX 0x3.
> >>>> - Debian 13.7 live USB, kernel 6.12.107+deb13-amd64, firmware-realte=
k
> >>>>   20250410-2, rtw88 firmware 27.2.0 (H2C 13)
> >>>> - Same behaviour earlier on CachyOS (a recent 7.x kernel, exact vers=
ion
> >>>>   not recorded) and on an Ubuntu live session (26.10)
> >>>
> >>> Is there any version working well to you?
> >>>
> >>>> - Module parameters at defaults: disable_lps_deep=3DN, disable_aspm=
=3DN,
> >>>>   support_bf=3DY
> >>>> - Router: ISP-supplied Huawei OptiXstar EG8145X6-10, separate SSIDs =
for
> >>>>   2.4 GHz (ch 6, 20 MHz) and 5 GHz (ch 36, auto width). The router i=
s
> >>>>   one floor below the laptop, with a concrete slab in between.
> >>>
> >>> I think it is worth to try putting closer.
> >>>
> >>> And, can you try another AP to see if anything different?
> >>>
> >>>>
> >>>> PROBLEM 1: 5 GHz
> >>>> Linux never authenticates. This repeats indefinitely:
> >>>>
> >>>>   wlo1: authenticate with 22:87:ec:xx:xx:08 (local address=3D90:32:4=
b:xx:xx:xx)
> >>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 1/3)
> >>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 2/3)
> >>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 3/3)
> >>>>   wlo1: authentication with 22:87:ec:xx:xx:08 timed out
> >>>>
> >>>> - It fails with WPA2-PSK and with WPA3 (SAE), and with the router se=
t to
> >>>>   WPA/WPA2 TKIP+AES and to WPA2/WPA3 AES, so it fails at the 802.11
> >>>>   authentication frame, before any SAE/EAPOL exchange.
> >>>> - Same result with regulatory domain 00 and with "iw reg set ES".
> >>>> - The BSS appears in scans (its beacons carry country IE ES), but no
> >>>>   authentication response is ever received.
> >>>
> >>> How can you prove "no authentication response is ever received" ?
> >>> Can AP ack the auth? I mean that might be a TX side problem.
> >>>
> >>>> - Windows 11 on the same laptop, same spot (Realtek driver
> >>>>   2024.0.10.209): connects with WPA3-Personal, reported RSSI -76 to
> >>>>   -81 dBm, 80/80 pings answered, 3-9 ms, link rate 260-292 Mbps as
> >>>>   reported by Windows.
> >>>>
> >>>> PROBLEM 2: 2.4 GHz
> >>>> - Linux associates, but the link is very poor: iw reports about -73 =
to
> >>>>   -76 dBm, and the beacon loss counter rises about once per second
> >>>>   (14 to 65 over roughly 2 minutes). Across 5 runs, ping to the rout=
er
> >>>>   showed 0-54% loss and average RTT of 37-278 ms.
> >>>> - Kernel messages: "rtw_8822be 0000:04:00.0: firmware failed to leav=
e
> >>>>   lps state" (several times), and once "failed to send h2c command".
> >>>
> >>> For this case, "iw dev wlo1 set power_save off" should help.
> >>>
> >>>> - The beacon signal average (-97 to -109 dBm) is far below the frame
> >>>>   signal average (about -75 dBm). With a phone hotspot at -48 dBm bo=
th
> >>>>   agree (-46). Occasionally signal readings of -100 to -112 dBm appe=
ar
> >>>>   with the second chain at 0 while traffic continues.
> >>>> - Windows, same spot: 60/60 pings, average 12 ms (max 157 ms).
> >>>> - With a phone hotspot (2.4 GHz, ch 1, -48 dBm), Linux works well:
> >>>>   rx 78 Mbit/s (VHT-MCS 8, NSS 1), tx 65 Mbit/s (MCS 7).
> >>>>
> >>>> TRIED WITHOUT EFFECT
> >>>> - "iw dev wlo1 set power_save off" (one run had 54% ping loss)
> >>>
> >>> How about the loss rate comparing to power_save on? Almost the same?
> >>>
> >>>> - rtw88_pci disable_aspm=3DY (lspci still showed "ASPM L1 Enabled"
> >>>>   afterwards)
> >>>> - WPA2 vs WPA3, regulatory domain 00 vs ES
> >>>>
> >>>> COULD NOT CHECK
> >>>> /sys/kernel/debug/ieee80211/phy0/rtw88 does not exist on the Debian
> >>>> kernel (presumably rtw88 debugfs is not enabled), so I could not rea=
d
> >>>> tx_pwr_tbl, phy_info or coex_info, nor test the edcca_enable switch.
> >>>> A single correctable PCIe error (BadDLLP) was logged once; the AER
> >>>> counters were 0 later.
> >>>>
> >>>> QUESTIONS
> >>>> Is this a known issue? Which additional data would be most useful (a
> >>>> kernel with rtw88 debugfs, a debug_mask setting, a monitor-mode
> >>>> capture)? I can provide full logs and test patches.
> >>>
> >>> The kernel v5.3 or earlier support RTL8822BE. Could you bisect (use
> >>> distro live image) which kernel can work to you? It would be easier
> >>> to address problem.
> >>>
> >>> Have you tested with disabling Bluetooth, since this is a combo chip?
> >>>
> >>> Another point is that rtw88 can only support these types:
> >>>
> >>> static const struct rtw8822b_rfe_info rtw8822b_rfe_info[] =3D {
> >>>       [2] =3D I2GE5G_CCUT(efem),
> >>>       [3] =3D IFEM_EXT_CCUT(ifem),
> >>>       [5] =3D IFEM_EXT_CCUT(ifem),
> >>> };
> >>>
> >>> You can add a printk to print the type of your RTL8822BE.
> >>
> >> On CachyOS you can get the RFE type from debugfs:
> >>
> >> cat /sys/kernel/debug/ieee80211/phy*/rtw88/coex_info
>
