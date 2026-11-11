Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398307;
	b=rZBKSwAsNzCIcQv7I8VQxzX+3nM+GR86maIjWyQLDKZGjMpB6nywYzeEGPglfv8NkeRn
	 0zMXVm5V7J4c2XpzUbp0E7zlNRVKS5aDQgFKYKfMjjWN2CWu5PQVj1A4BcEL2v3uYVNYO
	 xgPqKfrUm3aY7rSWeA9KbFVLeiZjun193Fp/wZfKrj0juywUnW4praZkWQsF8NcqqqbA/
	 M6dOybJkKbp/tyhi4sxJtgSx+G4tDAclYVLhkhq3yiSXblC09+RVbgIFU8+8GVQ2DVzUk
	 vr9GFLhiCRwT5GPtwo+XUgYfQFiBoT6GGYJbJ9uuueFTO2TZWx9C+C2leI7jJaW/sKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sEkJt1JS+BbmF5xrrIozlntfLSzz7Qzoztz6QGbsfgQ=;
	b=OeM2naD85Ux/CsAvtW4/h9JTyQIIFeL1txORG2c/EdFUl0u3QdvJl4PoIpr3+PWsKBaZ
	 RUsGr2Ca7+C67GWO8QmQ2rxXHxIa32qB2hrdgCk7Y4jtjotORJ+kLJsgouty5BO3w9/Sv
	 cf/B29TnwwYqCbWRJ+WSdUiMAKDIya4YvVe9wyEVftgU4LDI739nU+4At3F89AD41B0fw
	 bXBV+SxguYmu9aT+4n0HK+R4KtmD4PBSJL5goi8quignQWRQ0VQ6Ih0hroCxQaCcbRokE
	 iAszFYUhEuNeYMQ5+NCMH1O+akFIdl4IvD6gxbS2Icg9fPle3uMuAG2Et2pG7rn4n2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2ULvcbG;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28693606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 11:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28693606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2ULvcbG
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1707396f8f.3
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 03:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398305; x=1795003105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEkJt1JS+BbmF5xrrIozlntfLSzz7Qzoztz6QGbsfgQ=;
        b=A2ULvcbGCtZ6Pj3EtNW+OcqFEFd2ondUGZGh+T3fSBW+gXdycJokSUdU9w9A3mawDJ
         yK5HQpCGUgTuQJ+kiZSbDDTEWNY8jpaDnxB8RBHBgEkydtWHIOZ6VJxnHqRRogN9cN4M
         6BjelCYKgr5fUczPOkyC7G8UhB6g7QmnAerFGPCo88UnmJPQuWHJyQ1E0JsBI28K8sQm
         lXxIICgmguMh9p303KPlquKMjaiHi2hibGbw0sDvfhbypVM+/4J+mB/hhjN+/wZARI3E
         PftcPbHUjI727gJGlhgIBWcU91qH5OMILpcG3nGHYuDLWO5p3sOKJD7yNeD77Q2yqDN1
         KTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398305; x=1795003105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEkJt1JS+BbmF5xrrIozlntfLSzz7Qzoztz6QGbsfgQ=;
        b=VlWELLlfWL/RqEiG0vIEjsxmeinQ7COCRFM6/pTXrSX7+Gj08UYVjsVQQ99fP3koH2
         ElwA44QFDhjPTlPRfV9hRRrXaf9yvTkw36w2WNhkAZBAXA4v/5izKgBS0ZgxulEzpoId
         K1fi2IVDfcTODN36LxfPLdLv2IDftXEpz5QgW1oagIvJH1is7zfr2O9fDg8tzocOFtW7
         LlOXuDDgPUGOqSq/P63RTOCc96Qf0IxA9thD6ClmGJUpzy7LH/1J+MsVk3FCg6Tp+Awt
         JDDvia4AE6wRTChDSER/ZAQZGSgTfV99eJgQgY4MmXjqtFXUba7wyOvE3bm8+jeWdOQX
         6HDA==
X-Forwarded-Encrypted: i=1; AL+hErHOT5QFM3jd12t3FVgqqB8ORN3gXgV/iSRYHpFwZVQ6h8jo9QmS5ucFSDtvT0koQNPUbapM4cL6xyczvIyCKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CzGLgKtgdW2J9bVuoYgnQYs9JTtGwpB3/DaRKA+ufXd+OsDUR
	bqfg/PMguWKJpWu1HOGn8rRaei1xAYFfIQ4/VZeK0qOS8PmNT9M/vrrW
X-Gm-Gg: AYBFou3X50Yv1NlCdT3klDePrkeWlpqbOq1+r0bixLnblgqSES4Zbv7oLoX/eMAlYUY
	0hhYRN3hlnjS6LWOyKYctcy1ccBY33jRRGAbNuANBoOlFfk61xZzN0eVoCgIZr/4q0/Zmuskei2
	oso0rPq4YcI9UWuveOpBmzOROebgzU1N4rjzhMUsWvIVF9+nuTI3RMFdoYAo6a2DfiiQHhxleKG
	abBQeUXSj+txxUy8CF3HnW5OrO/lJw1UNQ1sJYXuIHwUj+R/1kSO2uQ/L1NfSMl4lG1E85I8lc9
	7OVQ4dRDgB3Oro5SVkDnvAFV9Uuy2cDV9J2rb4itqWNbLWYkCO4KkSSL1GXiWDlowJPrThQ5+Qb
	9xqAmuvRjhxA0LveQRTvtSWsLQ+yZL3ddolpHykVvQ/ZYxPm41PGahy3HjFRWZv+L0TVLPBFMOE
	P6gSZ2WqkUmmc0TyED/W0jnjQxKYMgNyC0/C6hWBtSYphqhJDjpbmersD9invARKFlC6mVX6YG+
	owxYK0mbktC3NrJ5lLMMsKVSTB7wbkrZpfWTGY8w8KsUYaghiP6M2M/5B7brczDSTGxcioVTwPG
	+6gl1stWhhV/4y8WexbcFeb1mEVml+naW9XtI1HU
X-Received: by 2002:a05:6000:4818:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-499c6f8c3c2mr3474429f8f.46.1794398305188;
        Wed, 11 Nov 2026 03:58:25 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c835fcsm10148333f8f.59.2026.11.11.03.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:58:24 -0800 (PST)
Message-ID: <36da0b32-9f97-4e82-a06e-53dcd42125dd@gmail.com>
Date: Wed, 11 Nov 2026 13:58:23 +0200
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
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CALTviDn=ypR2HCjVxu7U-5RDRU002YNxCbPqeH7a+5LTNxCNbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2026 12:15, Pablo Martínez Ríos wrote:
> Hi Ping-Ke, hi Bitterblue,
> 
> Thank you for the suggestions, and sorry for the delay. I ran most of
> them; answers inline. Tests were done upstairs, in the usual spot,
> unless stated otherwise.
> 
>> Is there any version working well to you?
>> Could you bisect (use distro live image) which kernel can work to you?
> 
> Not so far. Debian 13 (6.12.107), Ubuntu 26.10 (7.3.0-9-generic) and
> CachyOS (a 7.x kernel, exact version not recorded) behave the same. I
> have not tested older kernels yet: old live ISOs may not boot here with
> Secure Boot enabled. I could try disabling it to test it out if you think
> it's worth it, but since I'm currently using Windows 11 with encrypted
> drives, I'm not sure if that might cause any problems.
> 
>> I think it is worth to try putting closer.
>> And, can you try another AP to see if anything different?
> 
> - Next to the router, 5 GHz works very well: about -45 dBm, link rates
>   780/702 Mbit/s, ping about 2 ms, speed tests 350-440 Mbit/s.

[...]

>> You can add a printk to print the type of your RTL8822BE.
> 
> Thanks to Bitterblue's hint: the Ubuntu kernel has the rtw88 debugfs,
> and coex_info reports "Mech/ RFE = Shared/ 5", so it is RFE type 5, one

"Shared" indicates that your card has only one antenna, but I don't
think that's likely. You could not have 440 Mbps with just one antenna.

This comes from a byte in the chip's efuse. Maybe this byte is undefined
(0xff) in your chip, which would explain why it says "Shared". Here is
a patch to show the raw values:

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
index 7c178ed63f45..92fd410c15cf 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
@@ -46,6 +46,9 @@ static int rtw8822b_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 
 	map = (struct rtw8822b_efuse *)log_map;
 
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1,
+		       log_map, efuse->logical_size, true);
+
 	efuse->usb_mode_switch = u8_get_bits(map->usb_mode, BIT(7));
 	efuse->rfe_option = map->rfe_option;
 	efuse->rf_board_option = map->rf_board_option;

> of the supported types. I did not keep the dumps; I can collect
> coex_info, phy_info and tx_pwr_tbl again if useful. I could not use the
> edcca_enable switch: opening it fails with "Operation not permitted"
> (probably kernel lockdown because of Secure Boot).
> 
> Corrections to my first message: the "wpa-psk" profile against the
> router in WPA2/WPA3 mode actually used SAE in my logs. I can only say
> the 5 GHz failure happens with the router set to WPA/WPA2 (Oct 31) and
> to WPA2/WPA3. Also, the 2.4 GHz link varies a lot with the time of day
> (it worked on the evenings of Nov 5 and 7, but not at other times,
> possibly because of a strong nearby 2.4 GHz AP), so please treat
> "Problem 2" as unreliable. The 5 GHz failure upstairs is reproducible.
> 
> Thanks,
> Pablo
> 
> El mié, 4 nov 2026 a las 11:45, Bitterblue Smith
> (<rtl8821cerfe2@gmail.com>) escribió:
>>
>> On 04/11/2026 03:33, Ping-Ke Shih wrote:
>>> Pablo Martínez Ríos <pabloriosmartinez@gmail.com> wrote:
>>>> Hello,
>>>>
>>>> I would like to report a problem with an RTL8822BE using rtw88_8822be.
>>>> The same card, in the same spot, works well on Windows, so I suspect a
>>>> driver/firmware issue rather than coverage. I am happy to run any tests
>>>> or try patches.
>>>>
>>>> HARDWARE / SOFTWARE
>>>> - Laptop: HP Pavilion 15-bc450ns (i5-8300H), BIOS F.32
>>>> - Card: Realtek RTL8822BE, PCI ID 10ec:b822 (04:00.0), HP subsystem.
>>>>   Both antenna cables are connected; "iw phy" reports available and
>>>>   configured antennas TX 0x3 / RX 0x3.
>>>> - Debian 13.7 live USB, kernel 6.12.107+deb13-amd64, firmware-realtek
>>>>   20250410-2, rtw88 firmware 27.2.0 (H2C 13)
>>>> - Same behaviour earlier on CachyOS (a recent 7.x kernel, exact version
>>>>   not recorded) and on an Ubuntu live session (26.10)
>>>
>>> Is there any version working well to you?
>>>
>>>> - Module parameters at defaults: disable_lps_deep=N, disable_aspm=N,
>>>>   support_bf=Y
>>>> - Router: ISP-supplied Huawei OptiXstar EG8145X6-10, separate SSIDs for
>>>>   2.4 GHz (ch 6, 20 MHz) and 5 GHz (ch 36, auto width). The router is
>>>>   one floor below the laptop, with a concrete slab in between.
>>>
>>> I think it is worth to try putting closer.
>>>
>>> And, can you try another AP to see if anything different?
>>>
>>>>
>>>> PROBLEM 1: 5 GHz
>>>> Linux never authenticates. This repeats indefinitely:
>>>>
>>>>   wlo1: authenticate with 22:87:ec:xx:xx:08 (local address=90:32:4b:xx:xx:xx)
>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 1/3)
>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 2/3)
>>>>   wlo1: send auth to 22:87:ec:xx:xx:08 (try 3/3)
>>>>   wlo1: authentication with 22:87:ec:xx:xx:08 timed out
>>>>
>>>> - It fails with WPA2-PSK and with WPA3 (SAE), and with the router set to
>>>>   WPA/WPA2 TKIP+AES and to WPA2/WPA3 AES, so it fails at the 802.11
>>>>   authentication frame, before any SAE/EAPOL exchange.
>>>> - Same result with regulatory domain 00 and with "iw reg set ES".
>>>> - The BSS appears in scans (its beacons carry country IE ES), but no
>>>>   authentication response is ever received.
>>>
>>> How can you prove "no authentication response is ever received" ?
>>> Can AP ack the auth? I mean that might be a TX side problem.
>>>
>>>> - Windows 11 on the same laptop, same spot (Realtek driver
>>>>   2024.0.10.209): connects with WPA3-Personal, reported RSSI -76 to
>>>>   -81 dBm, 80/80 pings answered, 3-9 ms, link rate 260-292 Mbps as
>>>>   reported by Windows.
>>>>
>>>> PROBLEM 2: 2.4 GHz
>>>> - Linux associates, but the link is very poor: iw reports about -73 to
>>>>   -76 dBm, and the beacon loss counter rises about once per second
>>>>   (14 to 65 over roughly 2 minutes). Across 5 runs, ping to the router
>>>>   showed 0-54% loss and average RTT of 37-278 ms.
>>>> - Kernel messages: "rtw_8822be 0000:04:00.0: firmware failed to leave
>>>>   lps state" (several times), and once "failed to send h2c command".
>>>
>>> For this case, "iw dev wlo1 set power_save off" should help.
>>>
>>>> - The beacon signal average (-97 to -109 dBm) is far below the frame
>>>>   signal average (about -75 dBm). With a phone hotspot at -48 dBm both
>>>>   agree (-46). Occasionally signal readings of -100 to -112 dBm appear
>>>>   with the second chain at 0 while traffic continues.
>>>> - Windows, same spot: 60/60 pings, average 12 ms (max 157 ms).
>>>> - With a phone hotspot (2.4 GHz, ch 1, -48 dBm), Linux works well:
>>>>   rx 78 Mbit/s (VHT-MCS 8, NSS 1), tx 65 Mbit/s (MCS 7).
>>>>
>>>> TRIED WITHOUT EFFECT
>>>> - "iw dev wlo1 set power_save off" (one run had 54% ping loss)
>>>
>>> How about the loss rate comparing to power_save on? Almost the same?
>>>
>>>> - rtw88_pci disable_aspm=Y (lspci still showed "ASPM L1 Enabled"
>>>>   afterwards)
>>>> - WPA2 vs WPA3, regulatory domain 00 vs ES
>>>>
>>>> COULD NOT CHECK
>>>> /sys/kernel/debug/ieee80211/phy0/rtw88 does not exist on the Debian
>>>> kernel (presumably rtw88 debugfs is not enabled), so I could not read
>>>> tx_pwr_tbl, phy_info or coex_info, nor test the edcca_enable switch.
>>>> A single correctable PCIe error (BadDLLP) was logged once; the AER
>>>> counters were 0 later.
>>>>
>>>> QUESTIONS
>>>> Is this a known issue? Which additional data would be most useful (a
>>>> kernel with rtw88 debugfs, a debug_mask setting, a monitor-mode
>>>> capture)? I can provide full logs and test patches.
>>>
>>> The kernel v5.3 or earlier support RTL8822BE. Could you bisect (use
>>> distro live image) which kernel can work to you? It would be easier
>>> to address problem.
>>>
>>> Have you tested with disabling Bluetooth, since this is a combo chip?
>>>
>>> Another point is that rtw88 can only support these types:
>>>
>>> static const struct rtw8822b_rfe_info rtw8822b_rfe_info[] = {
>>>       [2] = I2GE5G_CCUT(efem),
>>>       [3] = IFEM_EXT_CCUT(ifem),
>>>       [5] = IFEM_EXT_CCUT(ifem),
>>> };
>>>
>>> You can add a printk to print the type of your RTL8822BE.
>>
>> On CachyOS you can get the RFE type from debugfs:
>>
>> cat /sys/kernel/debug/ieee80211/phy*/rtw88/coex_info

