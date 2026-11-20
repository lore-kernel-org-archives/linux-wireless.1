Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205484;
	b=YuHfUZirll4Oen+fFjS+AHrmTzqpkcC0XlUBKRG/YbbsD87Tqb8ry7sje00sUe2EOfnF
	 MsMrRPEwZr3fdkXXp1PH1hWK9HVx6Tl0hBOFKsyE4XlGCFksOw812F8rIVQNGVIxaLxBw
	 IZbwEgCSh5fcR4RrgQFB2WU7JCZ5IhhqmrYSxl0eBNqFiQfmLvATpXU5txiwOv5JAGGTm
	 xp0Kj9UVMK2eeJZyOjuzmlRNNJSP+tHM9zfdqh+TMz8CveRrOGl2XKK4evOGRIFljMUJo
	 xHhAFnuxhiJ9ZJKs6EnVubh7p7QX+jb/9w2mxamJEz5Fxe7H5iE+pV85dVfjoNMI5bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bnAdW58aTz3oRUBvvClDNAwMtI4L7jqmx2uXt3wOqpg=;
	b=PCKv8rJ7nlGgvKgjhMsAzQgxL4VLeUYQnc2g0yQ2sTSHwrB2RzbL36QD9LP5zw6DLkGP
	 6nQy+mouri2Bp2jv1e2h5ArFs+aYTxdSTgzXkuqBz7QaZ4p/Z1jnuEfpR4DZV5tmIhtzy
	 Vi/T13H4e/L7r2lrShcVFRvidXDtTE3JLjsWvZPTEgebB+Tb5lHw1f11fosUF3YCbONlz
	 51zJeOXR0kp0kCrG9fNjo+Hj7zi2gCJtdQbFOmbFmMbQ8BnJ632TDO5bZlfrpCBfJ0Igl
	 cOJtnMT39OH+gJEYjH+adtWr/vsUO275M+77JA3hDgdoIbcJ8+nQvEtrkkex1vjsuhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnnmVDQT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17B606A6EA
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 20:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E17B606A6EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnnmVDQT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1260639f8f.1
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 12:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205482; x=1795810282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnAdW58aTz3oRUBvvClDNAwMtI4L7jqmx2uXt3wOqpg=;
        b=OnnmVDQTvydKvMNgLgQtgvyF5J40+OHg2+nk/u1cMafl6CaZR3t1jjOPTVnb6Lzb7M
         StwjI7/0nOsmAclTcUVOe1Gj43ZRHZPpegBjwxwo6WXqnP5ntFwkc9zOyZ9SZjzbFK0f
         enYpWjXAX+lcW09DwpT9CcA8Iq2UX74z1ieDmLEQPLTd68d5tRwk3/ocbvZucBUS3an4
         TU1R7fwJhF/UNAeCmMhHT43rZaTKnxV4d7vyiwD38u17y7zYXBTLlbuFUS8A1bi5mGJx
         CoxsUynccdZvALiLmCMeFCoztxSf8EhRG/Z+y8ALG5KOI7N+g6oLnN5GDoAwaZN92KNN
         LO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205482; x=1795810282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnAdW58aTz3oRUBvvClDNAwMtI4L7jqmx2uXt3wOqpg=;
        b=fzZzI0LhRmYJEE4npPPU+0GMEa0AqeRmgIRtSENDbWnXP7p6iUcVtkXBHCnocFSxTu
         /8Zq3ChDavuCaLZmF8K19Ypiqp8s8h40JspjJJV0ZgeKmQj759/LqP/pK3bKZnuMeLZ9
         VEr+8GUxR+R2lTvh/ywbOsZ5tEHXJu8o1Tzokmv+5CswrirS8P4fgg4FBhJno2B520MK
         GsVvBY8Bbs+/blFFpcqAIgogKRPslj8Ka4nLfC6LXlK9wZfHc/O70vgyL8w+ILAisOnh
         3O/2wdHvfTW5wkU+ur0g8YiJFGqKBn3zFJg8I8/Qnfvn0Mq6jLKkVwA6P8yQy/TVDyNZ
         6mog==
X-Forwarded-Encrypted: i=1; AL+hErGNnTztNQsKnKdfDTaJQrxBRqwtizjhe5aIFTlJoMz3rIp7xqj/Iqzu3s+p76CfF8hOM1Zy4VrR1nYFnPAxwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XvBZZYnYNzFc62u33HnTWfm9eY3qBoUc2nG/tVQIujA9jtLY+
	xQ39+nrvfkciyw+uo+4SGgj3L/IbWKqSDejt8MJYFQBZ84z/zNdvVevm
X-Gm-Gg: AYBFou31C/2oMRswrFYe5Ns/XSCjb4iuchb0X0MS8BCv72RQzzfEXTkE0hqdg3zTE16
	UPhlCNfT/JA3PbyPDS6TpySyzLLzCWOznUzAJMQ4/mNCad0Ru5Stn6/yQCaN5DjheXnfjVyXw/S
	fO0foKc1RKISIQdlTCj++twdOjp7le1bGh/0ogRA3FlJ9btVNke7y/7/9BmB8ZzmugnQ3fao1uy
	VMmXVzWfp7/NLmB4NCFjIo5+EOiN4wHgig2Bi7rm6FL/bWkgZA77xeL8S/lEdWBJ7QZTAfuum/F
	MAia680oNz/vkmCv7x1yPVT+UdPVQlt8MDrNoTmGqz5MToMVF4oh8IJpqaG+yEAMVRguyRGwMVn
	07UgTXTP1YddcaOE7URHLFRxtV/HYIgb2QAX/jjkhm5WyNruxrPJ+vaxuW1McMO6ANFu0hxNvGx
	Mc8Bm5EA9NkADN7SDCSbTjNf4YYCJ+jN4rTUlUUO8FlydD3d+hW5wI7sqCnx/2EmyYAyFfTK5QR
	yZXeBloJ1OEzVEVdbUBANkn4xdKduA4Flvf8lRauS5HpHeiTAH92fQXuNoB/03+WO569r9Kkj2Y
	b0lWX7TYKH6SJvX3VQHru1cu5zsG4OUKC63V5mQ=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr97774355e9.28.1795205481784;
        Fri, 20 Nov 2026 12:11:21 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm100193565e9.8.2026.11.20.12.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:11:20 -0800 (PST)
Message-ID: <228ba38a-e5a2-4d8d-9547-788b9f0aec8a@gmail.com>
Date: Fri, 20 Nov 2026 22:11:18 +0200
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
Subject: Re: [Bug report] rtw89: 8851be: WiFi disconnect (reason=4, beacon
 loss) 1-2 s after A2DP stream start on the card's own Bluetooth, 5 GHz 80 MHz
To: Daniel <dani069xp@gmail.com>, linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com
References: <CALovXdg6sOyK9orNrXSRSoSkVf7Adqa8xNC8Q=ESw4f0YEryaQ@mail.gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CALovXdg6sOyK9orNrXSRSoSkVf7Adqa8xNC8Q=ESw4f0YEryaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 21:58, Daniel wrote:
> Hi,
> 
> On an RTL8851BE combo card, starting an A2DP audio stream on the card's own
> Bluetooth reliably makes the WiFi link drop within 1-2 seconds. The station is
> disconnected locally with reason=4 and the AP then ignores re-authentication
> for 50-90 s.
> 
> Hardware / software
> - WiFi: Realtek RTL8851BE PCIe 802.11ax [10ec:b851], driver rtw89_8851be
> - Bluetooth: USB 0bda:b850 (btusb, rtl_bt/rtl8851bu_fw.bin) on the same card
> - Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac)
> - linux-firmware 20261019
> - Kernel 7.3.5-zen1-1-zen (also seen on 7.3.4-zen2-1 and zen2-2), Arch Linux
> - NetworkManager 1.58.1, wpa_supplicant 2.12, bluez 5.88, PipeWire 1.6.11
> - Module options: rtw89_core disable_ps_mode=y,
>   rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y (no effect)
> - NM: wifi.powersave=2, MAC randomization "stable"
> - AP: 5 GHz, channel 157, 80 MHz VHT; signal about -58 to -61 dBm, 1x1
> - BT audio: A2DP SBC to a headset (sink)
> 
> Observed
> bluetoothd logs "fd(N) ready" when the A2DP transport starts. In every case
> wpa_supplicant reports CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
> within 1-2 s:
> 
>   2026-11-14 13:08:32 BT stream  -> 13:08:34 WiFi drop (12 more drops
> while streaming)
>   2026-11-20 13:06:56 BT connect -> 13:07:04 WiFi drop; another at 13:47:54
>   2026-11-20 13:53:37 BT stream  -> 13:53:38 WiFi drop, reconnected 13:54:28
> 
> "iw dev wlp4s0 station dump" shows the beacon loss counter increasing with each
> event. ICMP loss to the AP is 0% outside these events and TX retries/failures
> are 0. Other devices on the same AP are not affected.
> 
> Width dependence
> - 80 MHz: 4 of 4 stream starts dropped the link.
> - 40 MHz (same AP, kernel, signal): 1 drop in 3 stream starts (2 were clean
>   over several days of use).
> - With Bluetooth off, 80 MHz showed no drops in the short test afterwards.
>   A USB-tethered phone on the same machine did not show the problem.
> 
> Not the cause (tested): browser/GPU, NetworkManager config, MAC randomization,
> power save, ASPM options, kernel 7.3.4 -> 7.3.5.
> 
> Expected: a stable WiFi link while Bluetooth A2DP streams, as it does on the
> same card with a narrower channel.
> 
> Coex trace around one drop (debugfs btc_info sampled every 0.5 s, local time,
> 5 GHz ch155 center, bw=2, 80 MHz; "iw event -t" in parallel)
> 
>   14:20:54.975  BT connect:Y (A2DP_active:Y from 14:20:55.5)
>   14:20:57.994  BT low-priority requests jump: Lo-rx/Lo-tx 0-3 -> 3064
>   14:20:59.504  BT profile:A2DP (bluetoothd: transport fd ready at 14:20:59)
>   14:21:00.830  iw event: CQM event: beacon loss
>   14:21:00.958  iw event: deauth reason 4 "Disassociated due to inactivity"
>                 (disconnected, local request)
>   14:21:01.020  coex: WL connect=NO_LINK, reason NTFY_POWEROFF, action WL_OFF
> 
> Second, independent capture of the same event (same setup, raw files kept):
> 
>   14:49:31.4    BT connect:Y
>   14:49:34.434  BT Lo-rx/Lo-tx requests jump 0-239 -> 3229
>   14:49:35      bluetoothd: A2DP transport fd ready
>   14:49:35.945  BT profile:A2DP
>   14:49:36.797  iw event: CQM event: beacon loss
>   14:49:36.910  iw event: deauth reason 4 "Disassociated due to inactivity"
>   14:49:36.952  coex: WL NO_LINK, action WL_OFF
>   14:50:13      WiFi connected again (about 36 s; "auth: timed out" x4 before)
> 
> In both captures the coex state is action:WL_5G, ant_path:FDD, tdma type:0
> right up to the last sample before the drop.
> 
> From 14:20:50 up to the drop the coex manager stays in action:WL_5G,
> ant_path:FDD, tdma type:0 the whole time, i.e. it does not arbitrate WL/BT
> while the BT traffic ramps up. hw_info reports ant_iso:10, rfe_type:0x2,
> tx_num:1, rx_num:1. WL_FW_coex 7.9.0 (desired 6.0.0, "Match"), BT_FW_coex 7.
> rssi was -54 dBm at the last sample before the drop (VHT MCS 9, 80 MHz).
> 
> For comparison, when the same station is on 2.4 GHz (ch 6, 20 MHz), A2DP
> streaming works for me without drops (user observation, not traced).
> The failing case is only 5 GHz + BT A2DP, and it is worse with 80 MHz than
> with 40 MHz.
> 
> Full btc_info trace, ser_counters (all 0) and the iw event log are available;
> I can send them or try patches/debug_mask settings. Thanks for any pointers.
> 
> Thanks,
> Dani

Hi,

The fix for this will be in kernel 7.4-rc4, and I think it will be added
automatically to 7.3 as well at some point:

https://lore.kernel.org/linux-wireless/E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com/
