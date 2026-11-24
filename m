Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540814;
	b=xndhWUUsVBz6GiH/SfGiUvMoU4dDjJUmmgydxDbDWSR0WVkG6mb6pi/qeX/4rE1yfWbX
	 7Nk+zvgvMyLDuaAnoVWvGN/Ts6NJC7FypiGSnKPgJc81fBnnAGJrXHmugeKPaOu47ttvG
	 oICO6Z2Eu/1AV614xkS6kMdZ9v4kmGPqj5NAMGpPFw9e8FyGAMwdKfE6IN/Fjb90QsKFF
	 P5NYYCBFrp6xBDVZDUoeD+kUPTp2gyCJ3WGsXxq7dBs5/MeTu09M6QLp0GQHgXowRTO/r
	 /G1Nh4jFoxRfVPegvs2m+W9esGg9yoJFMXsGzzoe3YDvQvN6df7RYGWQHy+uj7yjGKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1wOGgAXyZkluxqX39uKZgavh9LLVLPwPFLZ+6QuDmaE=;
	b=vyvimRLAn0Q7VfS9eRbxsuSNGYdlrRz6mK9CspZPpX3Wkt55805jSIrmhcUmd5OaUsrQ
	 VRvgVQYrycoaNo+8NVMlCGEADoM/vx0QQinFjUetWtpttM2cMuePh3pU7brZWjB9XP/R4
	 iH20ccSuXk2g6UOLjfbfyq2eUUaPM90HcTKXt6UysXxzPdDh7dbf2kXPuTDCN60H4sUML
	 bCI7jw/xl/2OleSnUULY64vEcmPCc+emqwmkCXl7Cg7zhivaJFrNulto9g5tnNZb7tfPz
	 QPwz4b3/ndH+XlDThuyHVHzGPhCq6bw4ZeJ+pbFgqzX+UVimekBvjvsV9b4sXaP6Hwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS0WC5Zk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE172606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE172606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nS0WC5Zk
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b502b9b702so55767927b3.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540813; cv=none;
        d=google.com; s=arc-20260327;
        b=R3vK6UavtjxEK3RqpqtYJRYf0O30GPH5QghVRXaWY0HpG6cwpEzHjldFtBlybWPsvI
         Y4zYWtr/MGzyu8xCWBLYWqIjMAswHB/yr+7kglpoZYMB8/nNA82nP91LDuK2KJyoeQub
         6gv7/fEKjD5ZoHcoR/nKfJ+Ozg2sMevjrul2UPGgLUNC8pjP4xzdKyHdVW7+fB3jUjUj
         uDU5y9vs8ZzN5xAeg/oRp0YlP74CsweUlIyg32opHOfCDUxPN6mhF6yAhVZZpqt5f8Vu
         Y+C90QkfE/hEfbh9wCMdeBoseQ8FFROqTr6JFWpx6sly5Zy2RJyKoWlS2r6Zeqc4E5G3
         nOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wOGgAXyZkluxqX39uKZgavh9LLVLPwPFLZ+6QuDmaE=;
        fh=AwcCQh3jQH8FvkwYU6qmmw3L+QsZ2i9/1DIjGGRydL4=;
        b=L0qoq+K4b9V+fFAJ/H2Vm8ej9qdWUcGaC6d0CPIstxVlosQ9A+fl0uMGmW163P1xid
         3Dtxh3g6aYJPuS0r23UlKgmvicbj5kPjLVwW0HK0+A6X+mwmbyLA/VQww2rinFCZZCoD
         1Hym4Tzc63F3I1iy5a6+0lPqhpXWdhygplAwKgqYA50KRXN/CMc3B0ggNyjdoaJslFmU
         rqtmtRy5HPdEvxuflMEub6apbfcjB1GEnOJ1IjyQUXXMNYF3Ls7ZNZihzfcOW6o8IDBd
         mfCSHT5W3/JwEl4tKCiPtqakhkm/uB8rqbjCsvcOZ4JvFdfReHnNdVe73FK/ZtDVhi5g
         DQeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795540813; x=1796145613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wOGgAXyZkluxqX39uKZgavh9LLVLPwPFLZ+6QuDmaE=;
        b=nS0WC5ZkB1EMmJmT7gxt2ghBDdV5Fuo7boogLLS92jKAeMpd11O6LffwMFJQUT7mGr
         HIw0EfOyrf+n5n+H/51Uaojd3LtfqDOIBJ1IzZ/QoVK9ffLswx7/M//cz6Dp8JTHILos
         gg+DN2/xdq7m/ar6gnat8o1nFd4NQSe+5VhYn95CvFJbnDHNRUuseSCLwBcR+PWp7BZP
         7kaBJyWye7shzggM9rpOEcRVHecrAQ13UDxhwZYm/gW1OgSk5VJyPvne4nkNBznD5QB7
         rB5hF1VjWv4C7lbXi8R/efMoWDcRsyPURyNmUkUouxvPfGMo2wvnVFsctPVCT1U5BtEk
         RtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540813; x=1796145613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wOGgAXyZkluxqX39uKZgavh9LLVLPwPFLZ+6QuDmaE=;
        b=EYBSN7qiN5odfimUsIpbcR4WBcsw10l7tqwIJ4MqIuhBzlB36lkuuYOyTQ7ujwJ+Sg
         LuvfDlpHUr8zFMFow4gADjggO3em7CR/8QIrMqT/XauTwZM6v8E6ji3o/BBTF0wXhVqn
         qBEWuvPzf3wxn4T6x4vgTD3lq/HZ9Bgkq8mMX8JVQpfIA76bKhr+m1Wib4Qfw8vNNrVD
         6e3YkqIX3oDADfXu4q1RWXdQALrHotJUnBk17Co+ELW9PfAzOY1o2Gpr31t5NqNvUBdK
         /wsK0dzFhgqUNRhelQkOGOiBpbN60nMT49RGKOEHsVOWBJ0lcimXd/IucmvilrDHIVWZ
         5Z8g==
X-Gm-Message-State: APuU4Z8ASDDkAIm/dwFoSGhBW4HOxKIVMK7Dv4AsXIwGA732gIbd2BOg
	hKBXdX+XqkzdUduO69maBmDE576Rm1qdfxZGjwtTCZvm7VqCo9P0h9OGtblKO26r/mVcbHdp+sG
	zmWATnhQMkOKoGHNqmcjZOr+LNZNL2hY=
X-Gm-Gg: AZFdTZeZTVLouvsw9jQmf9Cq0yjXbZuoYUSoX6HGw6wUWyYVRTA9YC7NOoWTtwjPSHo
	mPS00t950asbmkesU+YSOwegk9KVLogizUhOxUqG4ptXKwsdiOP9E9HCayS29YK9INVqU9PpGHq
	piTSIlwRhd9Brds0vAi5sXz70afxpVGFGDsxR3VwG8W+UEY8V9pNW63JSeI5Ut00ZOxy7plk+Yg
	Pa07jqC9wpN76POu7+99KYigkB1+/HWPh5RNQZmaWm8T2+LJy8P5TFHkKer371aAmrc27FZGoHD
	+hyuM9mhF6+D9c1k5uC2vBg227IzoenDBSwJ2JUCB9tod6r/TylEhSnlXsnXnSSmMwhRLkMR31S
	glj31q0el/bIUdbM5bT/R2PS4haOArsU5fYpcY9fmfq3mEIcapVSFXRDp6rVc
X-Received: by 2002:a05:690e:47c7:20b0:679:ad63:6752 with SMTP id
 956f58d0204a3-67df4485df0mr3950390d50.88.1795540812603; Tue, 24 Nov 2026
 09:20:12 -0800 (PST)
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
 <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com>
 <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com> <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com>
 <8f5486b8-9bcd-4c6c-b0ab-500bb80ebf00@gmail.com> <3E4C2E08-4DB8-4017-954D-C2412CEB171A@linux.dev>
In-Reply-To: <3E4C2E08-4DB8-4017-954D-C2412CEB171A@linux.dev>
From: =?UTF-8?B?UGFibG8gTWFydMOtbmV6IFLDrW9z?= <pabloriosmartinez@gmail.com>
Date: Tue, 24 Nov 2026 18:20:01 +0100
X-Gm-Features: Aa3M54qLTQig1OuxKDVFbH-fhcjjLBgXvaD_xKJSc65ZAJ029gDLRLYWZsNa3Ec
Message-ID: <CALTviDnvzt5bCti+0x0bqNBfDwBKRRUog8QtrBgeS9DnnbDu5Q@mail.gmail.com>
Subject: Re: rtw88: RTL8822BE (10ec:b822) never authenticates on 5 GHz with a
 Huawei router; poor 2.4 GHz link; same hardware works fine on Windows
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	Ping-Ke Shih <pkshih@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luka, hi Ping-Ke, hi Bitterblue,

Sorry for the long delay. Luka, thank you for the analysis and the
patch. Here are the results of what you asked, plus some new data. All
tests were done on the same machine and spot (upstairs, router one floor
below).

1) "iw reg get" before connecting, and your patch
Debian 13 live, stock 6.12.107 rtw88 sources, Secure Boot off so I could
load my own build. I applied your diff with a script (the two #defines
went to the top of rtw8822b.c instead of rtw8822b.h); it built cleanly
and dmesg shows the out-of-tree modules loaded. Each attempt was
"nmcli connection up" to the 5 GHz BSS (35 s timeout):
- original modules, reg 00: "country 00: DFS-UNSET" before and after;
  no connection (12 "send auth" lines)
- original modules, reg ES: "country ES: DFS-ETSI" before and after;
  no connection (14)
- patched modules, ES, twice: no connection (13 and 13)
- patched modules, 00: no connection (13)
The country never changed during an attempt (the card never associates).

2) EDCCA and coex switches
Ubuntu 26.10 live, 7.3.0-9-generic, country ES (tx_pwr_tbl says
"regulatory: ETSI"):
- edcca_enable=3D0 (reads back "EDCCA disabled: EDCCA mode 0"): still no
  connection (7 "send auth" lines)
- coex_enable=3D0 ("coex mechanism disabled"): still no connection (6)
Both were restored afterwards. So EDCCA does not look like the (only)
cause here. phy_info shows "Current IGI =3D 0x1c" with only a monitor
interface up and 0x20 in station mode before association.

3) Where the radio is when the authentication goes out
I polled phy_info every ~50 ms while NetworkManager tried to connect.
Before each attempt the card scans channels at 20 MHz (BW=3D0). Then, for
each authentication, it switches to "Current CH(fc) =3D 42, Current BW =3D
2" (tx_pwr_tbl shows channel 42 / bandwidth 2 when I set an 80 MHz
channel centered on 5210). The router advertises primary channel 36
with an 80 MHz operation. The 3 "send auth" lines go out about 10 ms
apart and "authentication ... timed out" comes about 30 ms after the
first one. In 16 failed rounds over two sessions it was always CH=3D42
BW=3D2. Next to the router (-45 dBm) the radio has the same configuration
and the authentication succeeds.

4) Injection by bandwidth
Station interface down, only a monitor interface fixed on channel 36,
100 authentication frames from my MAC to the AP (same result with probe
requests):
- 20 MHz (no HT): ACK on 87/100 and 65/100 (100/100 on earlier days);
  the AP also answers
- 40 MHz (center 5190) and 80 MHz (center 5210), primary 5180: 0 ACKs,
  while the AP's beacons still arrive (about 100 out of 100)
- tx_pwr_tbl: same index at 20/40/80 MHz (OFDM_6M: 45 path A / 44 path B)
When I set the router's 5 GHz width to 20 MHz earlier, station mode still
failed to authenticate, but I did not log the radio's bandwidth in that
run.

So at about -75 dBm, frames sent with a 40 or 80 MHz channel
configuration are not acknowledged while 20 MHz ones are. Is there
something in rtw88 for the TX of non-HT management frames when the
operating channel is 80 MHz (TX descriptor bandwidth, primary
sub-channel)? And is it expected that mac80211 configures the full 80 MHz
channel already for the authentication?

Next I will repeat the station-mode test with the router's 5 GHz width
set to 20 MHz, logging the radio's bandwidth. If you prefer, I can instead
run a debug patch that prints the TX descriptor fields of the
authentication frames, or test an older kernel; tell me which.

Thanks,
Pablo

El jue, 12 nov 2026 a las 21:44, Luka Gejak (<luka.gejak@linux.dev>) escrib=
i=C3=B3:
>
> Hi Pablo and Bitterblue,
>
> On November 12, 2026 4:50:55 PM GMT+01:00, Bitterblue Smith
> <rtl8821cerfe2@gmail.com> wrote:
> >On 11/11/2026 23:00, Pablo Mart=C3=ADnez R=C3=ADos wrote:
> >>
> >> What would you like me to try next?
> >
> > I don't have other ideas.
>
> I had a look and I think this could be EDCCA. With the country set to ES,
> rtw88 runs the ETSI adaptivity mode. The RTL8822B firmware doesn't do tha=
t
> part itself, so the driver sets the energy detect threshold in
> rtw8822b_adaptivity():
>
>         l2h =3D min_t(s8, igi, dm_info->l2h_th_ini);
>         h2l =3D l2h - EDCCA_L2H_H2L_DIFF;
>
> l2h_th_ini is 36 for ETSI, so the threshold follows IGI down. Before the
> association rtw88 has no station entry yet, so the DIG lets IGI drop to
> its 0x1c floor. That gives L2H 28 and H2L 21, nominally -82 and -89 dBm.
> As long as the energy on the channel stays above that, the MAC holds ever=
y
> frame, so the authentication frames may never leave the card.
>
> As far as I can see that fits most of what you measured. On 40 and 80 MHz
> the receiver takes in the whole channel, so it likely sees more noise and
> more traffic from other networks than on 20 MHz. That would explain why
> the AP only ACKed your injected frames on 20 MHz.
>
> Once associated, the DIG raises IGI at a much lower false alarm count, so
> the threshold can sit higher. That may be why the link survived the walk
> upstairs. To leave LPS the firmware also needs a null frame ACKed by the
> AP, so the "firmware failed to leave lps state" messages could come from
> the same thing.
>
> Your kernels use the same rule on 2.4 GHz, which might explain the bad
> times of day there as well. Josef already relaxed it for 2.4 GHz in
> rtw-next with commit b0435910e47d.
>
> The one result that doesn't fit is 00. With 00 the driver uses the normal
> threshold, which never goes below 48 (nominally -62 dBm), so I would
> expect 00 to work from upstairs. Could you check "iw reg get" right befor=
e
> you connect, once with 00 and once with ES? After a connection the countr=
y
> element of your router can switch it to ES.
>
> Could you also try the patch below with ES set? On 5 GHz it uses a fixed
> L2H of 45, nominally -65 dBm, which is 3 dB below the EN 301 893 level
> over 20 MHz. It also carries Josef's 2.4 GHz change, so it should apply t=
o
> your 6.12 sources. If it helps, I will send it properly for rtw-next.
>
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/=
wireless/realtek/rtw88/rtw8822b.c
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
> @@ -1565,6 +1565,16 @@ static void rtw8822b_adaptivity(struct rtw_dev *rt=
wdev)
>         if (dm_info->edcca_mode =3D=3D RTW_EDCCA_NORMAL) {
>                 l2h =3D max_t(s8, igi + EDCCA_IGI_L2H_DIFF, EDCCA_TH_L2H_=
LB);
>                 h2l =3D l2h - EDCCA_L2H_H2L_DIFF_NORMAL;
> +       } else if (rtwdev->regd.dfs_region =3D=3D NL80211_DFS_ETSI &&
> +                  rtwdev->hal.current_band_type =3D=3D RTW_BAND_2G) {
> +               /* follow the normal threshold, capped for EN 300 328 */
> +               l2h =3D max_t(s8, igi + EDCCA_IGI_L2H_DIFF, EDCCA_TH_L2H_=
LB);
> +               l2h =3D min_t(s8, l2h, RTW8822B_EDCCA_ETSI_2G);
> +               h2l =3D l2h - EDCCA_L2H_H2L_DIFF;
> +       } else if (rtwdev->regd.dfs_region =3D=3D NL80211_DFS_ETSI &&
> +                  rtwdev->hal.current_band_type =3D=3D RTW_BAND_5G) {
> +               l2h =3D RTW8822B_EDCCA_ETSI_5G;
> +               h2l =3D l2h - EDCCA_L2H_H2L_DIFF;
>         } else {
>                 l2h =3D min_t(s8, igi, dm_info->l2h_th_ini);
>                 h2l =3D l2h - EDCCA_L2H_H2L_DIFF;
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.h b/drivers/net/=
wireless/realtek/rtw88/rtw8822b.h
> --- a/drivers/net/wireless/realtek/rtw88/rtw8822b.h
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.h
> @@ -149,6 +149,10 @@ _rtw_write32s_mask(struct rtw_dev *rtwdev, u32 addr,=
 u32 mask, u32 data)
>  #define GET_PHY_STAT_P1_RXSNR_B(phy_stat)                               =
       \
>         le32_get_bits(*((__le32 *)(phy_stat) + 0x06), GENMASK(15, 8))
>
> +/* nominally -60 dBm: 3 dB below the EN 300 328 level at 20 dBm e.i.r.p.=
 */
> +#define RTW8822B_EDCCA_ETSI_2G 50
> +/* nominally -65 dBm: 3 dB below the EN 301 893 level over 20 MHz */
> +#define RTW8822B_EDCCA_ETSI_5G 45
>  #define RTW8822B_EDCCA_MAX     0x7f
>  #define RTW8822B_EDCCA_SRC_DEF 1
>  #define REG_HTSTFWT    0x800
>
> Best regards,
> Luka Gejak
