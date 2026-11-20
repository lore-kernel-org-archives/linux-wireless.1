Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795206043;
	b=oJ8X7lfdgk92e1G4Klyw47KU8D5PNhXpNkVc/yFRA+eVE9eM+ulodiZt8/ype0UQ1FAU
	 Gs4wbp6I09+THiu9QNKBHgZtceYUp9b8CswVps1RgqGCVdAlIJmo8VsgMi5iHy3b+mw2t
	 d86rvqrGx7arY3REB3miRHjDHTK0POaG4IfzGnAeREI5OpDx/HStZjV2VLUXOmwM1JxUm
	 uZs9bkddRueY/aZkcIuWRCtKmtFgvDqnczgm5vgQwSyePKb6jXCLYeBq9vRr1XcWRKYzW
	 fCdIxTjnjRp33yg1kryPcQqT/Kz2tbqiFGiFRUZD8lQ9DU7E+wegL2niXmlHw1ptqxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nPNUthl2xKMdJcWvAmNu+vS+yE0R+kkQ/GzVhOGN2Tk=;
	b=Agrqef+K0p002UOx6eAzdWS+i42XA6wRIxvgZQKwWhmTNBDV7XPn55digPd3Wq/8+b3S
	 orJirFqw8DB1g1g/YaLc1hLuJx5TjvC3MOngsn05bDj2gCx+8/u/LhO05a/M9MeUfl3aB
	 ovTSeiM3EiFWXxD169je31Xtfu/vu/AGcQvu9tOpDe1yQjYA0RwJ2rpGa3/fCvqSeCTrp
	 otoI/pc0nY8+frV/FGRLPkYdRRyYCyO9+NyC+NHWuVBhFmOps8AJ3aCXyDkGnsk2o6L7L
	 ryCC+l9qdo8jtHIqJse8GAT+4LX1wNi8Aux2volKtGtKlwsdpP38Y1eHpBJPWuV0Crw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NcD+NZlz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D3E606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 20:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D3E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NcD+NZlz
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40319bdso1702648eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 12:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795206041; cv=none;
        d=google.com; s=arc-20260327;
        b=mWfyX5utDfUQMZZ7jAFVMQ33iYKeMIzD0bdj/btyWgsmaVKgOW7mDsA0AIoRnWaBzk
         K0tp9hH8pdjS6tftVxhqQunl3OvF3ylhQU75rHM246NC/dFNwTucZUheyzW85ptzVtpe
         A1u5biqb2p23TBpZLAk2hf1aqDKJCh3KuUrg5CGsoDpiy1f1acD1hyZPLP2rO3l43ip4
         anPKScHU9gherK+PkITW1H5CPQsY6ZQua0Yym8rpf9o3dZUcsmFAGxxory2IiPDSoZc/
         ncLenuKPqKyBrFR++3As9CDq4SLKvMETpS47o+xyuugEVgycDFJXzIAtsrucZyTUDEsl
         wWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPNUthl2xKMdJcWvAmNu+vS+yE0R+kkQ/GzVhOGN2Tk=;
        fh=P/v0Fa4MRiZJbsMs1yiuCp08RMwvfu/HyxScJXBP4bU=;
        b=WiBZqCK6rKBgiYZcIqI1E2zlXZGbE+NBGVeUb/WB9x43nXRC1KM9gOez7rQ6h9xX9a
         VO8BVmTvPSi5zmVrt/kd8sCcXhTalKviBm0k3cTQJdE4TUtJLTp5JMc4Agdx4nYoF48O
         cdnICfaxzGSLtazR385MMQLXWB7p8QkWmFQ2/RBExrFmX8BLf0NyrsWvMr7VQx6E0WCO
         +mRWgYjAzJNgXt22gYwl/McSVgx7D0MHPOSWnfMHyVqcq/rwBLIs50rH0xlpvdBR66X5
         lnJ5T8jrTz4XtvF427gTD6RiCxGfGqMblOky0470fmOOPmUHv8omtkKk4TLhn6NGglvr
         KLMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795206041; x=1795810841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPNUthl2xKMdJcWvAmNu+vS+yE0R+kkQ/GzVhOGN2Tk=;
        b=NcD+NZlzCZViMkn35nANKuYHFvDuMcmtl636XBx8H1pfkL9ztMwFo+wQUkMtjBPPyv
         UJx4wjRfCUL9pkiHOUtOQPze0PJ0CbEVeJTTf7T8O1Xd7aVKG3mXfRW5lCPONbkZniBO
         pebO7/yGOHdt2lN3vgT3aL/1l7afcuy7eaiZxZc3UUn57KYjBALmjffKTxBKrg9blpch
         skZM/by6mUyafy5ac5ar2rjilKe2C5JwqdJ/OtN1FT3TWnfHrQ7KFsHrZwRLtIpsPpUj
         2q18/3xsGCWPfwC0UaQqy3JXhpiUwBuqbH6s0k1AY1V2qL2dAdmncdlKrEoex6tZSQ3b
         K7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206041; x=1795810841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPNUthl2xKMdJcWvAmNu+vS+yE0R+kkQ/GzVhOGN2Tk=;
        b=rH2HyqTyV1O9Q/H2zyDW+ue+5tDnh/qSQmI0T/bo/tcZmjasJdAnw0UWcycCZBuU8H
         I1rTI5dl+cvBjaTdVzC2RPB9cZDBCm0Fp5ydbxtTQ82nIz8QMaKayAdQKIH63HrEms5g
         PqTpLFfGzhUu3bJk4rOLYu1dClIG9gfuuLa5h+qNOV3QkepxYPDxPQlwPvv1tOtxp/ph
         5wbR785UcffjZaZXEz+SiVkgNRsafmwI001QS7icQYgUtQfTOc01wkQS1YzYveCfo1qo
         KYy82fnWFZTI5S0C+NArUFEe2yA6qTfBWU5U2buFx+iiAiHYhm8hSA97T+Q9hN+b2RzZ
         PZBQ==
X-Gm-Message-State: APuU4Z9/vMRKFmu+BlO6dJ9Ktg+o/gUKzi9N5grCb5iMtSpm7slABcpJ
	e6jjhOQNA2eypTxuvW9A3pi5yGXxmHtprSOVZGcIRXJ1U+MNgy2lCMdx/5HV0c6HcDbS1+h3InU
	5WDOuHyb70oPaL9REc5tyO3GImgBq63s=
X-Gm-Gg: AZFdTZcNmZcXJKXGRojB5IdVQSItk6vCmeSw+dZisTa6cyvyWQt8wlSAeg1sDGD1WNI
	8IqrTAHPay7PFHxlrgV74koNUqtSjM/4cKioagqIgQm+T6bJI9BlkmGndTAD/IB2VlunT/rt5Ha
	yYVfq6+CPt7fNB+iNhpBZN2l0uUP1ry+owR3V1ybEIX+67HIF90AJ8x9NvvKH78YdeBoE6nYcje
	13QOjkLyeQLBX7NFtxdteKbMo0ArA9XHsx/3gaNgs7GyXqWaMKSAec73qt9/YzNCkoGf8sSLCWZ
	4nfnYwg9e0Bhx6ckfKuYntPN5+gQmkEAGF/VqV+PqhcgSp1vcqKbV35exAKoIU5hTFYtVUU1hdd
	hXMrl6QxdrlWKKekmaUsJrqgPBn9UtRzj64/Z9V5Ai8BGng==
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id
 5a478bee46e88-3856c2c4a0dmr4333596eec.5.1795206041015; Fri, 20 Nov 2026
 12:20:41 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALovXdg6sOyK9orNrXSRSoSkVf7Adqa8xNC8Q=ESw4f0YEryaQ@mail.gmail.com>
 <228ba38a-e5a2-4d8d-9547-788b9f0aec8a@gmail.com>
In-Reply-To: <228ba38a-e5a2-4d8d-9547-788b9f0aec8a@gmail.com>
From: Daniel <dani069xp@gmail.com>
Date: Fri, 20 Nov 2026 15:20:30 -0500
X-Gm-Features: Aa3M54pBHUoQ8ATa_C40V9oH_zxB8Veopra-Cil43mcUZ07_e7hrmF1v3OICUmI
Message-ID: <CALovXdjwUQ3s6U9Mg5+ic7uwH9iFDth0v_spF4Ref=5LGhUA7w@mail.gmail.com>
Subject: Re: [Bug report] rtw89: 8851be: WiFi disconnect (reason=4, beacon
 loss) 1-2 s after A2DP stream start on the card's own Bluetooth, 5 GHz 80 MHz
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much for the information :)

El vie, 20 nov 2026 a la(s) 3:11=E2=80=AFp.m., Bitterblue Smith
(rtl8821cerfe2@gmail.com) escribi=C3=B3:
>
> On 20/11/2026 21:58, Daniel wrote:
> > Hi,
> >
> > On an RTL8851BE combo card, starting an A2DP audio stream on the card's=
 own
> > Bluetooth reliably makes the WiFi link drop within 1-2 seconds. The sta=
tion is
> > disconnected locally with reason=3D4 and the AP then ignores re-authent=
ication
> > for 50-90 s.
> >
> > Hardware / software
> > - WiFi: Realtek RTL8851BE PCIe 802.11ax [10ec:b851], driver rtw89_8851b=
e
> > - Bluetooth: USB 0bda:b850 (btusb, rtl_bt/rtl8851bu_fw.bin) on the same=
 card
> > - Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac)
> > - linux-firmware 20261019
> > - Kernel 7.3.5-zen1-1-zen (also seen on 7.3.4-zen2-1 and zen2-2), Arch =
Linux
> > - NetworkManager 1.58.1, wpa_supplicant 2.12, bluez 5.88, PipeWire 1.6.=
11
> > - Module options: rtw89_core disable_ps_mode=3Dy,
> >   rtw89_pci disable_aspm_l1=3Dy disable_aspm_l1ss=3Dy disable_clkreq=3D=
y (no effect)
> > - NM: wifi.powersave=3D2, MAC randomization "stable"
> > - AP: 5 GHz, channel 157, 80 MHz VHT; signal about -58 to -61 dBm, 1x1
> > - BT audio: A2DP SBC to a headset (sink)
> >
> > Observed
> > bluetoothd logs "fd(N) ready" when the A2DP transport starts. In every =
case
> > wpa_supplicant reports CTRL-EVENT-DISCONNECTED reason=3D4 locally_gener=
ated=3D1
> > within 1-2 s:
> >
> >   2026-11-14 13:08:32 BT stream  -> 13:08:34 WiFi drop (12 more drops
> > while streaming)
> >   2026-11-20 13:06:56 BT connect -> 13:07:04 WiFi drop; another at 13:4=
7:54
> >   2026-11-20 13:53:37 BT stream  -> 13:53:38 WiFi drop, reconnected 13:=
54:28
> >
> > "iw dev wlp4s0 station dump" shows the beacon loss counter increasing w=
ith each
> > event. ICMP loss to the AP is 0% outside these events and TX retries/fa=
ilures
> > are 0. Other devices on the same AP are not affected.
> >
> > Width dependence
> > - 80 MHz: 4 of 4 stream starts dropped the link.
> > - 40 MHz (same AP, kernel, signal): 1 drop in 3 stream starts (2 were c=
lean
> >   over several days of use).
> > - With Bluetooth off, 80 MHz showed no drops in the short test afterwar=
ds.
> >   A USB-tethered phone on the same machine did not show the problem.
> >
> > Not the cause (tested): browser/GPU, NetworkManager config, MAC randomi=
zation,
> > power save, ASPM options, kernel 7.3.4 -> 7.3.5.
> >
> > Expected: a stable WiFi link while Bluetooth A2DP streams, as it does o=
n the
> > same card with a narrower channel.
> >
> > Coex trace around one drop (debugfs btc_info sampled every 0.5 s, local=
 time,
> > 5 GHz ch155 center, bw=3D2, 80 MHz; "iw event -t" in parallel)
> >
> >   14:20:54.975  BT connect:Y (A2DP_active:Y from 14:20:55.5)
> >   14:20:57.994  BT low-priority requests jump: Lo-rx/Lo-tx 0-3 -> 3064
> >   14:20:59.504  BT profile:A2DP (bluetoothd: transport fd ready at 14:2=
0:59)
> >   14:21:00.830  iw event: CQM event: beacon loss
> >   14:21:00.958  iw event: deauth reason 4 "Disassociated due to inactiv=
ity"
> >                 (disconnected, local request)
> >   14:21:01.020  coex: WL connect=3DNO_LINK, reason NTFY_POWEROFF, actio=
n WL_OFF
> >
> > Second, independent capture of the same event (same setup, raw files ke=
pt):
> >
> >   14:49:31.4    BT connect:Y
> >   14:49:34.434  BT Lo-rx/Lo-tx requests jump 0-239 -> 3229
> >   14:49:35      bluetoothd: A2DP transport fd ready
> >   14:49:35.945  BT profile:A2DP
> >   14:49:36.797  iw event: CQM event: beacon loss
> >   14:49:36.910  iw event: deauth reason 4 "Disassociated due to inactiv=
ity"
> >   14:49:36.952  coex: WL NO_LINK, action WL_OFF
> >   14:50:13      WiFi connected again (about 36 s; "auth: timed out" x4 =
before)
> >
> > In both captures the coex state is action:WL_5G, ant_path:FDD, tdma typ=
e:0
> > right up to the last sample before the drop.
> >
> > From 14:20:50 up to the drop the coex manager stays in action:WL_5G,
> > ant_path:FDD, tdma type:0 the whole time, i.e. it does not arbitrate WL=
/BT
> > while the BT traffic ramps up. hw_info reports ant_iso:10, rfe_type:0x2=
,
> > tx_num:1, rx_num:1. WL_FW_coex 7.9.0 (desired 6.0.0, "Match"), BT_FW_co=
ex 7.
> > rssi was -54 dBm at the last sample before the drop (VHT MCS 9, 80 MHz)=
.
> >
> > For comparison, when the same station is on 2.4 GHz (ch 6, 20 MHz), A2D=
P
> > streaming works for me without drops (user observation, not traced).
> > The failing case is only 5 GHz + BT A2DP, and it is worse with 80 MHz t=
han
> > with 40 MHz.
> >
> > Full btc_info trace, ser_counters (all 0) and the iw event log are avai=
lable;
> > I can send them or try patches/debug_mask settings. Thanks for any poin=
ters.
> >
> > Thanks,
> > Dani
>
> Hi,
>
> The fix for this will be in kernel 7.4-rc4, and I think it will be added
> automatically to 7.3 as well at some point:
>
> https://lore.kernel.org/linux-wireless/E6568F470624C07E+179429427543.1165=
14.14355630958613033614@guwolf.com/
