Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427639;
	b=DF0MEC25tpS4ehDZmTqyrYMcU/dtcZRqDjeuD2F7TnYnCFJXs2XGe6HE0KUPuARIZmLb
	 QBCDrokrPG4oycNO6kmreoqKVUU55JrH0efNZsWazdtgtpbXyMWhpnJ59b6rG95/lY8no
	 vJMxqRCNBAJBKwDQ2I4Li4HPq4LfVGq5u2f0ok2O39fDSetLgRIsk+nkYFwd2z1lwq4bA
	 CZYUdfJPKUwGpxAbsGqqzE/0hoSKZNwas0+5Sn+PJUa59wtkL9RWOP/+FL3+EITeVkXAa
	 OtOkUSnACB03VB1Widx1nOZC/4ND7Cze0m5ag/TdCn2LbQbZsJILiWm1aU68iRr7pvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
	b=lnuLeSCSg3HREN02jJwd5mhFCIeK4cOenmxvVEZ1Q0n2i3OxD8uY8UBIrdrgOiKd4asP
	 kDZhMJj1OY9SxI0ayGzrMXqSk2GGBzkH7UC71bDfbaGPYhv4b6hzsemwXUuexNHTLYSe2
	 Zynw9VP1KtVdAt+pHx6wsGeeoSLNu5BAh9XAgJ14DWjlkWuaPn0QCRSL/FbqrYuKHplH4
	 9kbbpNXMPaHdbrp+i2846g7ZKpUTNzZ2X9FYXYtH5+FiYavn1JuCG/bkti6YsBDZlmm9k
	 iu59V65Td7wmdZOnyWafkml6t5F+2HavlaEiyubmvGEC9db9R7rUVxslBgj6JAOqyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIOW5Dir;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BD7606A333
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 20:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BD7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIOW5Dir
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so31381845e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427637; x=1795032437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
        b=PIOW5Dir2FaFYSjdERozQVLkS3xl/UCwOvVb1FE/V5B/uvW3jU3QZTJ2jiyLLtOVs5
         CW6B25Xn5jJPOEfZh/HbKoVYAy7KRtz/g5PIVYYMJlCLuCxnOq9YrGurSjDo4WUEzPLY
         7pzKjmw/G7dVLZ3L7fH60uY8dbRHmWY+xKaF31+cBmWAD/68S26agsixnLNocAqpejTB
         UGRWcqZ2Pc58lcxBBk8xrVaGzBxKCcidMwl0e2IRGrlVeIALWI7pVlXj0smd9p8m7txR
         0uVPeExV99pX0yEq3Qy0zuBkhEidpUGBltfF+Bi3k5TpxTEIA5mcy0OTXPrjGZUf3WuN
         KqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427637; x=1795032437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVQ0Je+7TVtBihMq71F3r/qets7jTV4f1jmnI7R96Eo=;
        b=ryXSlpkW9123wB/VLk5VilvwfR2MMuMWPDlHGZFVBDyMMp0PasHKCzVTyIHCKgRcKw
         S61wHRJDVteIfqxLWOmTKHNA3Ud4ADQB+qVeJHTE+//k34PnJzUW9DpBs+mb6wAkTANZ
         CSXMMsEfdM6yUMuUvC3eYuppOOECbcKHYXJhCHvWUQ7OyYcP5KwyTp7jG8gcprDXrely
         j4TO7QLk+lRa185wO8W51N0/RwcqBuIK6shL9sSzq7L2+WofsmTbO7AuhUnu97bih21t
         YY56cn31vc2se3Ns2Lve3hzo5HX2UdeFxqUYOhe2JqLsu8AmXgcRfN+AqvDiNkMiGnWF
         NUPw==
X-Gm-Message-State: APuU4Z9MEqrpov/W2iLHhBx7UXA1f5ewU8ymg20+tv70oirHdQ9Ke9S9
	tlhFW5JgvMBjtk678SSTI6/Jc6z18II2mPOMHU2KmkmfsEOFogdo7L70
X-Gm-Gg: AYBFou3hC5nJ6jHqdJr0OxtTwA3QTDZvdTJ5BKCIMidjJB8bQd7RyNIjIInMpp2pb9o
	lk9CP2WNSAQujkoD0MKWPdlgqFehw2YGKz68rYrM8KmsGwBKc8wb1sOXTZ46f/tKkmm3VbzY+r7
	cQYWlXJHNBSoud/rIwt/pG+4n5rHXhacwxexxy7tACqMQSfXwV6B3rsMR+EQsvCo3HOnQZpjzHY
	6KrKeW8Nal34Gfv7LLLmay2G3ypg3266cr2zD4Vq/EeAW1FVpwRsZmV/ZunRAK3uJrAo0xDe4if
	MlVXjO9Ye6+POTR4C3oIAXEVMfkhORYngMtcIYJL1+DulMsPta9FbsGqgsQqjzEjIguV9J/jujo
	5rktPKybEFgKEcnryTuwGoR1jKNA3p96Bm+R22IjsdanMpYw2AsTnn15L3h7Balp3UZhBZXymyB
	JWsllqVrQGMvoNtdG/4dYoeLJnBLG+dglJrXN6a/DJPJUb4Y7dMvxiEF4YgNIyt+in7XOX76zJW
	1+KDv5MpkjxlDw1Qg3fWNLG6sJ+yWhZh/ewgZbXmI2UcScu3QeoaYorpv/kuFX9VCrCun6k928j
	u9FmQzKpDThYG+fog49kW8yTqehWVVevuxqjxsE=
X-Received: by 2002:a05:600c:19c6:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4ba093b1bb8mr61724445e9.35.1794427636860;
        Wed, 11 Nov 2026 12:07:16 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm134278805e9.0.2026.11.11.12.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 12:07:16 -0800 (PST)
Message-ID: <1b548cb5-f83f-4bb0-b275-a42112c9e354@gmail.com>
Date: Wed, 11 Nov 2026 22:07:14 +0200
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
Subject: Re: [REGRESSION] rtw89_8851be: 5 GHz link drops after association and
 re-auth times out on 7.3.0-4 and 7.3.3-1 (7.2.11 works)
To: Colin C <ccharm480@gmail.com>, pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev
References: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CAOy1aSioNmBOPjLTsR3q_A8z2qF=7AC13TSvr=mig_XrgbVXKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 20:51, Colin C wrote:
> Hardware: Realtek RTL8851BE (PCI 0000:04:00.0, 10ec:b851,
> rtw89_8851be); Bluetooth
>           is the same module (rtl8851bu firmware loaded by btusb)
> Distro/kernel: CachyOS (clang build)
>   linux-cachyos 7.2.11-1  = GOOD
>   linux-cachyos 7.3.0-4   = BAD
>   linux-cachyos 7.3.3-1   = BAD (re-tested 2026-11-11)
> Firmware: rtw89/rtw8851b_fw-1.bin, version 0.29.41.5 (4bd6ebac) on all
> three kernels
> linux-firmware-realtek: 1:20261019-1 on all three (firmware is not the variable)
> AP: UniFi U6 Extender (Wi-Fi 6, 802.11ax), WPA2 CCMP, 5 GHz ch153/80 MHz,
>     several BSSIDs of one SSID, -43 dBm. On 7.2.11 the link ran at
> 600/540 Mbit/s;
>     I did not capture HE vs VHT on the 5 GHz link during the failing boots (the
>     2.4 GHz fallback link, a GL.iNet router, negotiates HE-MCS 10 on 7.3.3-1).
> Taint: /proc/sys/kernel/tainted = 4096 (O, out-of-tree module: nvidia-open).
>     The WLAN problem is independent of the GPU driver as far as I can tell.
> 
> Summary
> The adapter has worked on every earlier kernel (7.2.x and before).On
> 7.3.0-4 and again on 7.3.3-1, 5 GHz association is either dropped
> shortly
> after the 4-way handshake or never gets going again: every authentication
> attempt then times out ("send auth (try 3/3)", "authentication with <bssid>
> timed out"), across several BSSIDs, until the card falls back to a 2.4 GHz
> network. Booting 7.2.11-1 with identical firmware and userspace restores normal
> operation (one boot of ~7.7 h on 5 GHz at 600/540 Mbit/s; a single AP-initiated
> reason=34 disassoc, reconnected in 4 s).
> 
> Failing boots on 7.3.0-4, 2026-10-26:
>   07:48:30 wpa_supplicant: Key negotiation completed with ba:8b:a9:d1:28:25
>   07:49:04 CTRL-EVENT-DISCONNECTED reason=4 locally_generated=1
>   07:49:08-07:50:35 kernel: "authenticate with <bssid>" / "send auth
> (try 1/3..3/3)"
>                      / "authentication with <bssid> timed out", for three
>                      different BSSIDs, repeated; SSID-TEMP-DISABLED CONN_FAILED
>   12:28:29 Key negotiation completed; 12:28:50 DISCONNECTED reason=4
> locally_generated=1
>            then the same auth-timeout loop until ~12:31
> 
> Failing boot on 7.3.3-1, 2026-11-11 (boot 12:12):
>   12:13:00 associated with ba:8b:a9:d1:28:25 (5 GHz), aid=3
>   12:13:07 onwards: auth to 2a:e8:29:52:c6:9c, ba:8b:a9:d1:28:25 and
>            9e:05:d6:d1:6d:d4 all time out (3/3 tries each), repeated until the
>            card gave up and joined a 2.4 GHz network (GL-MT3000, ch7).
>   A manual `nmcli con up` for the 5 GHz SSID later failed with "The Wi-Fi
>   network could not be found" although the BSSes are listed at full signal.
> No rtw89 error lines appear in dmesg around the drops (only the wlan0 auth
> timeouts above).
> 
> Caveat on the 7.2.11 baseline: it is not perfectly clean. Over the 10-day
> 7.2.11 boot (2026-11-01 to 11-11) the journal has 8 wlan0 authentication
> timeouts and 36 "rtw89_8851be 0000:04:00.0: timed out to flush queues"
> messages (Nov 4-10). Some auth timeouts overlap with a hidden-SSID issue on
> my side that I fixed on Nov 9. In all cases on 7.2.11 the link stayed up or
> recovered by itself; it never got stuck in the endless auth-timeout loop seen
> on 7.3.0-4 and 7.3.3-1. Filtered logs (UFW lines removed) are available for
> both boots.
> 
> Bluetooth coexistence lead (7.3.3-1, one run each, so not conclusive):
>   With Bluetooth blocked (rfkill block bluetooth): `nmcli con up` joined the
>   5 GHz BSS ba:8b:a9:d1:28:25 (5765 MHz) on the first try, auth/assoc clean.
>   After rfkill unblock, the link was on 2.4 GHz again at the next check (about
>   3 minutes later; I did not see when it dropped), and a repeat `nmcli con up`
>   for the 5 GHz SSID failed as above.
>   The card shares the module with Bluetooth, and an LE keyboard and an LE mouse
>   were connected during the failing cases. I am not claiming a cause: the
>   Wi-Fi/Bluetooth coexistence code is shared and has been changing (e.g. the
>   July 2026 rtw-next coex patches for the 8922D, which are not in 7.3.x), so
>   it seemed worth mentioning. The first 7.3.3-1 boot did associate once on
>   5 GHz with Bluetooth active, so timing may also matter. A repeat of each
>   case (3+) is still to do.
> 
> Things tried that did not help on 7.3.0-4:
>   - /etc/modprobe.d/rtw89.conf, exact options (still active, and confirmed
>     in /sys/module/rtw89_pci/parameters/ on 7.3.3-1, so the 7.3.3-1 failure
>     above happened with them set):
>       options rtw89_pci disable_aspm_l1=Y disable_aspm_l1ss=Y disable_clkreq=Y
>       options rtw89_core disable_ps_mode=Y
>   - reloading rtw89 modules (briefly restores 2.4 GHz only)
>   - firmware 20261019-1 vs earlier (ruled out: 7.2.11 works with 20261019-1)
> Also not the cause: the SSID is no longer hidden and the extender BSSes are
> visible at full signal; ch153 worked on 7.2.11.
> 
> Package history (pacman.log): linux-cachyos 7.2.11-1 -> 7.3.0-4 on 2026-10-24
> 23:41; first failure observed the next boot. Updated to 7.3.3-1 on 2026-11-11;
> same failure.
> 
> Searched lore.kernel.org (all lists) for "8851BE" on 2026-11-11: no report of
> this problem. Possibly related, not read in full: "[PATCH] Bluetooth: Add
> HCI_QUIRK_NO_SCAN_WHILE_CONNECTED for combo chips" (April 2026). The symbol is
> not present in the installed 7.2.11-1 or 7.3.3-1 headers, so it cannot explain
> the difference between those two kernels.
> 
> Related, not duplicates (found by web search):
>   - [regression] rtw89_8852be: silent RX stalls since v7.1; reverting
>     bda294ed0ed0 appears to fix it (https://lkml.iu.edu/2607.2/04572.html)
>   - RTL8852BE can't connect on high 5Ghz channels
>     (https://bugs.launchpad.net/bugs/2059170)
> 
> Expected: link stays up on 5 GHz as on 7.2.11.
> Not tested: vanilla mainline (CachyOS patches may be a factor); a bisect; a
> boot with nvidia-open not loaded (to rule the taint out completely).
> Happy to test patches or bisect between v7.2.11 and v7.3.0 if pointed
> at a range.

Sounds like the same problem reported here:

https://lore.kernel.org/linux-wireless/0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com/

There is a patch in that thread.
