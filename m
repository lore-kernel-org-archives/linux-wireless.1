Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498660;
	b=XfMx3AmThcetWDh0RIoP7CW43M2RGQIIqZv4PkBxevDJ+T/M/qhAl1GY4FyGSb2J+zgy
	 qw8EkSwiJKDFYhifVAg9cEOyEmPP/ZQsYHVBJiVnAllWGnirVOG5+IfAHmI0MkdejlvlP
	 mvN2myW8ZWD2Di3bhjJVV1n0uQje3Eh2x2azZwsTl+auj/mJf/IYMxfEfs/IYHdy99IQl
	 bol1AxoLvjZxKeqBN+qcwxR9/BUYxetYFEDx/v4z3RnDLAtASTwv3YsM79+03UB3sKHx3
	 pSwUNhLe5a31e+uQD2eCWLEj6l7iIUhLY3FJhuWkJCP7zHt+bBxAx/aMppcBfQSIneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ANEoxx1GcC+1/Lz3el0TVWL8qFPTT1kqkv37GqhEIms=;
	b=LAUtNkJRHDQvE/vr89iG7t6N2aJG3vn/9eGAyX3afH5uJwNGrRvbl/4WAgsjbnT/xSKD
	 9yUIigq6G016WQQNz9pVJ0GUGPm9SaaFXYcHE35OnV8vOWH9mnkOfA9KkSgqct5tCMe6K
	 ipP0jDD94pYp5ojqX9hFY5Uy3izMQImBkqefsrKVnI0HJkbM5btQ7PcyIhd+dWkShsV7H
	 WZRGyW3Qpn9OJbSBF6rob7YA5q/Ekg0n0Rp2AYkzbI/D+zg/4EnVt/PRBT7i0+o1ITvgo
	 /rEd6tad0z8LOTHe18VAYZZFBfbVBLfGT9HaLxvrViu+cSacztM/uGgIiRKLlSsQRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIJCbfjf;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C0606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 15:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9C0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIJCbfjf
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so2671072f8f.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 07:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498658; x=1795103458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANEoxx1GcC+1/Lz3el0TVWL8qFPTT1kqkv37GqhEIms=;
        b=PIJCbfjfvpyxk54NAWz7MLOUkjl+92a9TFBxTaPdmqSk2slvTuUVcrcouZH1iXkYHZ
         95hJWhs4od7cdJcqVZv6/Tm17Bzx4QxeIDKU91p/BCsiV/Sz4JwcYeGtd/1Y7CEetEVD
         CNhAQbgaI34nlOSj6MDO5ANeas3IHvZn279rXjwbpEn200H2bRQDpcX3RBQPpgubImQg
         4HwLNLale0D6ly7Zq5uPbCSq9MjoaC4BWyTRv53vJ+NK7o1St6ZRBubleQRLRlGxLcUb
         LN64/YI+4rT7sY6Jm9lgr2G9NcbIvQqarFcozJjUb+RUUBZvIkBDRmtBwXM7Cvz5do25
         p++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498658; x=1795103458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANEoxx1GcC+1/Lz3el0TVWL8qFPTT1kqkv37GqhEIms=;
        b=MCm7wlesb2FbFUyyfK3DDY+WSBDBE9bfhLk5auRzVKwhP8cRyg7SEcWl7UsBHECnTC
         PguzPd/xTL6gwC90yIuBriErwyFyPzrJlpIJVUXH5Uj3LGcuclNH3fm5Ke8H4E+Y74Ql
         C/ZcMeIUA1ae7rfm/9qzjDo+tj8Y5wWhZnzwARRBV8Qz876MhBmN1WJJZyG5ZaBz3CCM
         HosY+bL64MPhEm2SR8MU8caosizWnsvMti4glp4/R93Ko/BDEXgqedj7h/58Z0CcGqEc
         QNWFkeeImWE35Xx879d82vePN+wI5KAjf8M/wuXFGr6b7P2JKSlkfqLeYzmQBw0y5wy6
         Y0yw==
X-Forwarded-Encrypted: i=1; AL+hErFHeQkjchfvjpEkDf8vLq/1QQ/jAvsy37mHn8OCs+p824gwkb0tLSd4ZTdgpa26KpzLBowv3yuwiP8mPXUEYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DnCX7VLjpFyFZiglIfBWiEUZgfCMyt7392qcgqrMWt1mEOYpW
	gcsBXyFfGjZhEoqO1Jyb4e3LJuWm6ElHYRI3IwCOVJEOb4z8PY9NfbkTLmZo2g==
X-Gm-Gg: AYBFou1vlpo4v0XFvMO8RkoKwjrDQEfShS3cnJF6TUb8CIYoE68ctxrZh9XM5nyhl35
	ilqRDwtptjAqPNGUmrlVBS8Pz8uGviNW2E0Mg/hGnQYWvQyMaan8PMBh8B4FnT4NQPIy0mKXRGf
	PeuVUowheQEBzaN5jj0s9LqqCpGpySEW994YFWHuSjoZKRIrU7I7U+1buRUy2zizWDnOoZYCXtT
	VinmkULcnA1XZBTITwgZYxsWS/yELlXzN8xXQWXPrZ9hfBrxQwZxqSSUgdEZpruF8AcDk2Ms4AF
	iKihHujhZYthGw+2EOLwg1Z/Padn76gmBfD0keBLYsNWHeTHSrbLDaZFxFMOj8nuqGI4+K0+446
	rKP3/nfP8IrY92LyzagKMhsaTZ32pVb653oXe+G2/Jncs6EnmSzaSNA3l/teIr42ml+s1LEvQGB
	nqF267CGamcCTiZuV8iUI2qucfvPGXFFQsZLyzTUJDCVfZeRMT+0ebKT5cwkND5NrQZlLXb+ihk
	nk+b4frZ9wWiH+1NiAismTMaQo1flhQ9VDRB9US8X//kBtCnyfEgADFuQDiULbJUv66FUY0nri4
	h1B2hcm9cZeP+BFg8VFVPj2CLxYI9ve9xA0oP7cuS2Z3CzV4RZ80Dx6c51tk
X-Received: by 2002:a05:6000:3104:b0:499:978:251a with SMTP id ffacd0b85a97d-499c7552497mr12725133f8f.54.1794498657880;
        Thu, 12 Nov 2026 07:50:57 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm18241714f8f.51.2026.11.12.07.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:50:57 -0800 (PST)
Message-ID: <8f5486b8-9bcd-4c6c-b0ab-500bb80ebf00@gmail.com>
Date: Thu, 12 Nov 2026 17:50:55 +0200
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rtw88: RTL8822BE (10ec:b822) never authenticates on 5 GHz with a
 Huawei router; poor 2.4 GHz link; same hardware works fine on Windows
To: =?UTF-8?B?UGFibG8gTWFydMOtbmV6IFLDrW9z?= <pabloriosmartinez@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <CALTviDkEWERPrtc51WFB1K3Sn7wLdt6YhB=_Ck4PwBPdLcojBQ@mail.gmail.com>
 <2c8319def838488cb8a3e4d5dc44f357@realtek.com>
 <7d68ebe2-d24e-4c07-9b49-7f76551a12bb@gmail.com>
 <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com>
 <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com>
 <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CALTviDksF1-AoDXUDpyH0eQLbtrMBJ+DsnSuKGm=3W1E3q_O7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2026 23:00, Pablo Martínez Ríos wrote:
> Hi Bitterblue, hi Ping-Ke,
> 
> I built the Debian 6.12.107 rtw88 sources with your print_hex_dump patch
> (nothing else changed) and loaded the modules. This is the raw efuse
> logical map of the RTL8822BE, with my MAC address (0xd0-0xd5) replaced
> by xx. 0x70-0xaf is all 0xff, and I left out 0x100 and above:
> 
> 00000000: 29 81 00 3c 09 10 0b 00 ac 04 a4 35 10 03 30 0b
> 00000010: 2c 2c 2d 2d 2d 2d 2c 2c 2c 2c 2c 02 00 00 ff ff
> 00000020: ff ff 27 27 27 27 27 27 27 29 2a 2b 2a 2a 2c 2e
> 00000030: 02 00 ff ff 00 ff 0c 00 ff ff 29 29 29 29 29 29
> 00000040: 29 29 29 29 29 02 00 00 ff ff ff ff 26 25 25 23
> 00000050: 23 23 23 23 25 25 23 23 23 23 02 00 ff ff 00 ff
> 00000060: 0c 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 000000b0: ff ff ff ff ff ff ff ff 7f 21 1d 00 ff ff ff ff
> 000000c0: ff 29 00 11 00 00 00 00 00 ff 05 ff ff ff ff ff
> 000000d0: xx xx xx xx xx xx ec 10 22 b8 3c 10 1b 83 c3 ff
> 000000e0: 80 8d 80 08 00 00 11 3c 27 00 10 20 01 22 b8 fe
> 000000f0: ff 4c e0 00 04 0c 00 80 02 00 80 02 00 00 f0 00
> 
> With the struct layout of rtw8822b_efuse (channel_plan at 0xb8):
>   0xb8 channel_plan = 0x7f, xtal_k = 0x21, thermal_meter = 0x1d
>   0xbc pa_type = 0xff, lna_type_2g/5g = 0xff
>   0xc1 rf_board_option = 0x29, rf_feature_option = 0x00
>   0xc3 rf_bt_setting = 0x11
>   0xc9 rf_antenna_option = 0xff, 0xca rfe_option = 0x05
>   country_code = ff ff
> The PCI ids appear at 0xd6-0xdd (10ec:b822, subsystem 103c:831b), so the
> offsets look right.
> 
> So rfe_option is 5, as coex_info said. If "Shared" is derived from
> rf_bt_setting (bit 0 of 0x11 is set), that byte is programmed, not 0xff.
> rf_antenna_option is 0xff, so if that is the byte you meant, it is
> indeed undefined. Which byte does coex_info use for "Shared"? And is
> 0xff in rf_antenna_option / pa_type / lna_type normal for RFE 5?

That looks normal. "Shared" comes from bit 0 of rf_bt_setting.

> 
> I understood "Shared" as the Bluetooth sharing an antenna with the
> WLAN (not that the WLAN has a single one), which would fit 2 spatial
> streams working, but I may be wrong.

Yes, that's probably correct. I guess "Shared" means one antenna only
for the chips with one spatial stream.

> 
> What would you like me to try next?

I don't have other ideas.

> 
> Thanks,
> Pablo
> 
> El mié, 11 nov 2026 a las 12:58, Bitterblue Smith
> (<rtl8821cerfe2@gmail.com>) escribió:
>>
>> On 11/11/2026 12:15, Pablo Martínez Ríos wrote:
>>> Hi Ping-Ke, hi Bitterblue,
>>>
>>> Thank you for the suggestions, and sorry for the delay. I ran most of
>>> them; answers inline. Tests were done upstairs, in the usual spot,
>>> unless stated otherwise.
>>>
>>>> Is there any version working well to you?
>>>> Could you bisect (use distro live image) which kernel can work to you?
>>>
>>> Not so far. Debian 13 (6.12.107), Ubuntu 26.10 (7.3.0-9-generic) and
>>> CachyOS (a 7.x kernel, exact version not recorded) behave the same. I
>>> have not tested older kernels yet: old live ISOs may not boot here with
>>> Secure Boot enabled. I could try disabling it to test it out if you think
>>> it's worth it, but since I'm currently using Windows 11 with encrypted
>>> drives, I'm not sure if that might cause any problems.
>>>
>>>> I think it is worth to try putting closer.
>>>> And, can you try another AP to see if anything different?
>>>
>>> - Next to the router, 5 GHz works very well: about -45 dBm, link rates
>>>   780/702 Mbit/s, ping about 2 ms, speed tests 350-440 Mbit/s.
>>
>> [...]
>>
>>>> You can add a printk to print the type of your RTL8822BE.
>>>
>>> Thanks to Bitterblue's hint: the Ubuntu kernel has the rtw88 debugfs,
>>> and coex_info reports "Mech/ RFE = Shared/ 5", so it is RFE type 5, one
>>
>> "Shared" indicates that your card has only one antenna, but I don't
>> think that's likely. You could not have 440 Mbps with just one antenna.
>>
>> This comes from a byte in the chip's efuse. Maybe this byte is undefined
>> (0xff) in your chip, which would explain why it says "Shared". Here is
>> a patch to show the raw values:
>>
>> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
>> index 7c178ed63f45..92fd410c15cf 100644
>> --- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
>> +++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
>> @@ -46,6 +46,9 @@ static int rtw8822b_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
>>
>>         map = (struct rtw8822b_efuse *)log_map;
>>
>> +       print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1,
>> +                      log_map, efuse->logical_size, true);
>> +
>>         efuse->usb_mode_switch = u8_get_bits(map->usb_mode, BIT(7));
>>         efuse->rfe_option = map->rfe_option;
>>         efuse->rf_board_option = map->rf_board_option;
>>
>>> of the supported types. I did not keep the dumps; I can collect
>>> coex_info, phy_info and tx_pwr_tbl again if useful. I could not use the
>>> edcca_enable switch: opening it fails with "Operation not permitted"
>>> (probably kernel lockdown because of Secure Boot).
>>>
>>> Corrections to my first message: the "wpa-psk" profile against the
>>> router in WPA2/WPA3 mode actually used SAE in my logs. I can only say
>>> the 5 GHz failure happens with the router set to WPA/WPA2 (Oct 31) and
>>> to WPA2/WPA3. Also, the 2.4 GHz link varies a lot with the time of day
>>> (it worked on the evenings of Nov 5 and 7, but not at other times,
>>> possibly because of a strong nearby 2.4 GHz AP), so please treat
>>> "Problem 2" as unreliable. The 5 GHz failure upstairs is reproducible.
>>>
>>> Thanks,
>>> Pablo
>>>
>>> El mié, 4 nov 2026 a las 11:45, Bitterblue Smith
>>> (<rtl8821cerfe2@gmail.com>) escribió:
>>>>
>>>> On 04/11/2026 03:33, Ping-Ke Shih wrote:
>>>>> Pablo Martínez Ríos <pabloriosmartinez@gmail.com> wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I would like to report a problem with an RTL8822BE using rtw88_8822be.
>>>>>> The same card, in the same spot, works well on Windows, so I suspect a
>>>>>> driver/firmware issue rather than coverage. I am happy to run any tests
>>>>>> or try patches.
>>>>>>
>>>>>> HARDWARE / SOFTWARE
>>>>>> - Laptop: HP Pavilion 15-bc450ns (i5-8300H), BIOS F.32
>>>>>> - Card: Realtek RTL8822BE, PCI ID 10ec:b822 (04:00.0), HP subsystem.
>>>>>>   Both antenna cables are connected; "iw phy" reports available and
>>>>>>   configured antennas TX 0x3 / RX 0x3.
>>>>>> - Debian 13.7 live USB, kernel 6.12.107+deb13-amd64, firmware-realtek
>>>>>>   20250410-2, rtw88 firmware 27.2.0 (H2C 13)
>>>>>> - Same behaviour earlier on CachyOS (a recent 7.x kernel, exact version
>>>>>>   not recorded) and on an Ubuntu live session (26.10)
>>>>>
>>>>> Is there any version working well to you?
>>>>>
>>>>>> - Module parameters at defaults: disable_lps_deep=N, disable_aspm=N,
>>>>>>   support_bf=Y
>>>>>> - Router: ISP-supplied Huawei OptiXstar EG8145X6-10, separate SSIDs for
>>>>>>   2.4 GHz (ch 6, 20 MHz) and 5 GHz (ch 36, auto width). The router is
>>>>>>   one floor below the laptop, with a concrete slab in between.
>>>>>
>>>>> I think it is worth to try putting closer.
>>>>>
>>>>> And, can you try another AP to see if anything different?
>>>>>
>>>>>>
>>>>>> PROBLEM 1: 5 GHz
>>>>>> Linux never authenticates. This repeats indefinitely:
>>>>>>
>>>>>>   wlo1: authenticate with 22:87:ec:xx:xx:08 (local address=90:32:4b:xx:xx:xx)
>>>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 1/3)
>>>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 2/3)
>>>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 3/3)
>>>>>>   wlo1: authentication with 22:87:ec:xx:xx:08 timed out
>>>>>>
>>>>>> - It fails with WPA2-PSK and with WPA3 (SAE), and with the router set to
>>>>>>   WPA/WPA2 TKIP+AES and to WPA2/WPA3 AES, so it fails at the 802.11
>>>>>>   authentication frame, before any SAE/EAPOL exchange.
>>>>>> - Same result with regulatory domain 00 and with "iw reg set ES".
>>>>>> - The BSS appears in scans (its beacons carry country IE ES), but no
>>>>>>   authentication response is ever received.
>>>>>
>>>>> How can you prove "no authentication response is ever received" ?
>>>>> Can AP ack the auth? I mean that might be a TX side problem.
>>>>>
>>>>>> - Windows 11 on the same laptop, same spot (Realtek driver
>>>>>>   2024.0.10.209): connects with WPA3-Personal, reported RSSI -76 to
>>>>>>   -81 dBm, 80/80 pings answered, 3-9 ms, link rate 260-292 Mbps as
>>>>>>   reported by Windows.
>>>>>>
>>>>>> PROBLEM 2: 2.4 GHz
>>>>>> - Linux associates, but the link is very poor: iw reports about -73 to
>>>>>>   -76 dBm, and the beacon loss counter rises about once per second
>>>>>>   (14 to 65 over roughly 2 minutes). Across 5 runs, ping to the router
>>>>>>   showed 0-54% loss and average RTT of 37-278 ms.
>>>>>> - Kernel messages: "rtw_8822be 0000:04:00.0: firmware failed to leave
>>>>>>   lps state" (several times), and once "failed to send h2c command".
>>>>>
>>>>> For this case, "iw dev wlo1 set power_save off" should help.
>>>>>
>>>>>> - The beacon signal average (-97 to -109 dBm) is far below the frame
>>>>>>   signal average (about -75 dBm). With a phone hotspot at -48 dBm both
>>>>>>   agree (-46). Occasionally signal readings of -100 to -112 dBm appear
>>>>>>   with the second chain at 0 while traffic continues.
>>>>>> - Windows, same spot: 60/60 pings, average 12 ms (max 157 ms).
>>>>>> - With a phone hotspot (2.4 GHz, ch 1, -48 dBm), Linux works well:
>>>>>>   rx 78 Mbit/s (VHT-MCS 8, NSS 1), tx 65 Mbit/s (MCS 7).
>>>>>>
>>>>>> TRIED WITHOUT EFFECT
>>>>>> - "iw dev wlo1 set power_save off" (one run had 54% ping loss)
>>>>>
>>>>> How about the loss rate comparing to power_save on? Almost the same?
>>>>>
>>>>>> - rtw88_pci disable_aspm=Y (lspci still showed "ASPM L1 Enabled"
>>>>>>   afterwards)
>>>>>> - WPA2 vs WPA3, regulatory domain 00 vs ES
>>>>>>
>>>>>> COULD NOT CHECK
>>>>>> /sys/kernel/debug/ieee80211/phy0/rtw88 does not exist on the Debian
>>>>>> kernel (presumably rtw88 debugfs is not enabled), so I could not read
>>>>>> tx_pwr_tbl, phy_info or coex_info, nor test the edcca_enable switch.
>>>>>> A single correctable PCIe error (BadDLLP) was logged once; the AER
>>>>>> counters were 0 later.
>>>>>>
>>>>>> QUESTIONS
>>>>>> Is this a known issue? Which additional data would be most useful (a
>>>>>> kernel with rtw88 debugfs, a debug_mask setting, a monitor-mode
>>>>>> capture)? I can provide full logs and test patches.
>>>>>
>>>>> The kernel v5.3 or earlier support RTL8822BE. Could you bisect (use
>>>>> distro live image) which kernel can work to you? It would be easier
>>>>> to address problem.
>>>>>
>>>>> Have you tested with disabling Bluetooth, since this is a combo chip?
>>>>>
>>>>> Another point is that rtw88 can only support these types:
>>>>>
>>>>> static const struct rtw8822b_rfe_info rtw8822b_rfe_info[] = {
>>>>>       [2] = I2GE5G_CCUT(efem),
>>>>>       [3] = IFEM_EXT_CCUT(ifem),
>>>>>       [5] = IFEM_EXT_CCUT(ifem),
>>>>> };
>>>>>
>>>>> You can add a printk to print the type of your RTL8822BE.
>>>>
>>>> On CachyOS you can get the RFE type from debugfs:
>>>>
>>>> cat /sys/kernel/debug/ieee80211/phy*/rtw88/coex_info
>>

