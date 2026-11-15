Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794784042;
	b=Vn2GMWW1u9cSHYLF2oLCiYzwgKW5HJtbLe8xN7FNhYORtDmu7VfajA//ukivOu0ZTeYm
	 qY1Ph0ok6/Zv2M5QbXvnOge2Tf/EstzK0tFYgmvQ4mvsfQNXOai8JVK94x5t+pn5yH5Bv
	 bxA8IwIOy13ia49E1EU8PXqTKHoJ+x1b3sDSdj73j1/ytwWjGc3QTmHhmSJGmYPazmFdv
	 rm+8mZGZcf3X2kUrhg3qesOmfA8HdyJhcZr3kkCka0QftIR/HQRaL2Ad21K9TVri5llw/
	 der9akxwfJTM9mzVr9sbItJCAePpDbBjJzGA8bc0ke99ynMTN03ka23K+HVxQnD3ALw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:In-Reply-To:References:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=w+yiGsHQmrHKKuYXb9Y0YAMoo/KGjnzKccvLVzpHl5s=;
	b=UKfndtAr1KUp7a6p02s1NZIcb5FOvuqYUOV2YzMHz5tkm9INAEyXX4+Z+SXiOnrNvaDs
	 oclLMyBXJO2PkDvU3NRAlRMOEZ11HjRSu4FPZkGtR0v0JoYuufOohU5XTtGyQsNudImsG
	 ZHg9sXeeRQyZHsjo7e+Zzmi9AlwXrFMFoZhHnvwrRnlue2ucEQ77cJwtB9GpOW/9SlLzO
	 p7nLsBUzDFQnKf6IWlolT5DHfe4eMRgRPI7R2rIdR1l1UqKdunOhjD6qYrt9XOJ4j00w7
	 BQJIufpUllynjUrHU9rd9QUgbye/jRl83We8hAL9BofbHbXZK5tqiz2e+b6T9Gmd9Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIKI++CE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C95606A31F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C95606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIKI++CE
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1306025b3a.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 15:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794784042; cv=none;
        d=google.com; s=arc-20260327;
        b=hhHB411NBMpnr7LRZgtnaLYgITOoot/MQhiE8SWIdEBgHWE0oZQbBLeL+ewfKzKWrd
         iNnI763R7GRavNz8FDATPj7hVqBd+CGLxKPdA+pALtRpSv75BeuO4IGt8RxcGyHlYezh
         Pws/DCcfKerTemXLJNPM4Lc5nDfqR5dRCT4BCJkluWd3nlGw0GufYRZhIiteQ4F1xcO/
         AIdCrUz5GC15kgdH4zKM2g6FfMHEejvmpP6MmGdMpTZc9N0XkRN7Q/x4eqvjgHtq3WLR
         AUl4Oa6+Ai4Qw6MCC5VMfvUt8TZJdMA1TBl0PeS4RjI7DNANgztVhedTxCRYrjJQ6FEV
         /ZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=w+yiGsHQmrHKKuYXb9Y0YAMoo/KGjnzKccvLVzpHl5s=;
        fh=qW0phhq3fb3oiohK/Mu9j1KY1zyRNiiioKFc5anvatM=;
        b=R+c8rgYoVKFDYZvJaDLXoaBLS9wlaqEtBkBMzpT9nPYZO2Eole/zkavm7DZosVZoQU
         4wxLBGlF+6utjYuygLmqKOd5Z+2RRWpz17Zve240d5PvpjJXPmD9gT28NsMVQB6dXZPC
         dNeAYxMCWnAEOFjx4st6wsGwE0Dz1uBH7+q+IwNKg/+I6898EK+woRoAVmNkamakyFd8
         F5GOiiBMk0ZoOiry4NNrUH9fRQdkGy5bYsHJQDPhzCHglARBOHGx4Y7+ButXoya2Nm5f
         G8LGx2xb7NjjkaQmKSJO18wYLtE3+6rXh0cCc7LW54zLTRShE4ld1VYrIU1oosD7hBJz
         u2tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784042; x=1795388842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:references:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+yiGsHQmrHKKuYXb9Y0YAMoo/KGjnzKccvLVzpHl5s=;
        b=eIKI++CEPNmF7H7gYASz+p4G1wB97vBiYJ2o9Z70nyDNO2oXWUYANuhr8645okhmTP
         HX6D0noXN0KgKl7hkhkuMvcJGWn4sM3bl3WTWteziFFQmV9EsalTBeMsuq6TxRTgR2dQ
         Aueg+62/SD6Nwew/Gcz2e20CcYrwJ2M5wt/RQK9iumdosNUF+2B3AQ0lK70/61Pcvuu+
         wdPlFiZRoMpp00byHVNHGbsMMd1OsGQ+EyTebUExYZFBehQriZyka2ZCv1t9W8ztrcim
         nY7hRv6fY6nTrFL+gMhwZ/6FkXmAnBX56R3Kxj9E7Wj9zf5+KhgirNA1w35bBriPUB2X
         3mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784042; x=1795388842;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+yiGsHQmrHKKuYXb9Y0YAMoo/KGjnzKccvLVzpHl5s=;
        b=XnAoE9Xi9w9+Tn2X3PQfeP1jKZeuWmwdlNfbmX+KI0LVFp7AGDhJScl1uX9A6okDUM
         jxyp3pnJwFs7WvOPb2hUBiI/riUYQN5QB8VSJzdIJn1sSm0RObq8hKZo5vVVm7RLNFjL
         iSiVao17tY5m0RYxKlDET/84EhV9vwIkDScaIKFL2KgoqrYbQAp7g1qoga7b5EXYicP4
         7PDQ5Jez35m1DN6kKSIKA1fwFtyoi3f9ZPe0lGCnGYlEkggyELIrHB8HoXgKdhAIsvk/
         2qClf0DwSgKaldvWHhIaBCyzSjhYVllqviwaE2IUQ8S+SKYJze+NXTcYIKFcplyVkfub
         hIQg==
X-Gm-Message-State: APuU4Z+6a7lW6nZ8YuHSa1UEKUGXAQ9a/u2p0YNzUEA+AmuqDnN6EW/O
	zlvZyUymEXsKNnreheq7OrW9c21FW7uPoVCjgBuYfTQrdW+O1L6S/hiLLtmr7HcEtBFfX8bysHz
	vClPUvBGf/FBJTiflJoN75XraY/X6Mjjcmg==
X-Gm-Gg: AYBFou0cJxF63Nrb7tmw1qAUvnuh5pFUtGvkDfJJHlRqwMgOMybOK6xxKk55KhoPylM
	TRF9RF7MZGvfC2Fc+rt9p16rBKHXy4UbUHKhmpyqZTFY4xBuR8ZbUCcymVf4Nz+O3/noRoPuz1T
	OAhPJa1g/rEk/TgMotWs36IcNvLbO8YOW2E4OL9CfcpLOXWYKrQFW55uQ40jLQRh93Yt8mT6Z57
	Qw5xd+oNx+AV+W3xQesVKO+ZxTv5BchIMrLS5XkZ9VVur7oJAxaLqJsNDYTz/MdMZc6OzPz6C72
	ETAIdIxfaU+8e0HYI7mxmcB4T5lO76zQ+qZjbT9TXcSVsSa1bdZo1/FTgWoJiH+wTOn4d6vH//F
	Zt4px4UkSqMgZ3BFR1GDu/OUFxaZsdtxp55G7bxGG+5oOLxkLNmM/53c=
X-Received: by 2002:a17:90b:28cf:b0:3ac:8dfe:8ec9 with SMTP id
 98e67ed59e1d1-3b1b0b47416mr7365761a91.47.1794784041579; Sun, 15 Nov 2026
 15:07:21 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 15 Nov 2026 15:07:21 -0800
In-Reply-To: <CAGhUpaPwFz6C1GnP-JxQ=_-XqgOLXWyxTyEd5h3BaM1-tZvsZA@mail.gmail.com>
References: <CAGhUpaPwFz6C1GnP-JxQ=_-XqgOLXWyxTyEd5h3BaM1-tZvsZA@mail.gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Thomas Mason <ranchitossf@gmail.com>
Date: Sun, 15 Nov 2026 15:07:21 -0800
X-Gm-Features: AclHuK_2o6U_UgPJQj7yb7XmZGJaxkZGv_9VnNUkTSCFAN3lQztMhtQOVxVpNDU
Message-ID: <CAGhUpaOf77aifMG6Q78h6Ht2wCx_gM0TfTyQNAqWS5kx4WMGKA@mail.gmail.com>
Subject: Re: [brcmfmac] BCM4350C2 MacBook10,1 cannot discover DFS channel 104
 AP (Ubuntu 7.0.0-38)
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Follow-up: the DFS discovery problem is now resolved on the same 2017
MacBook10,1.

I applied the upstream change "wifi: brcmfmac: allow ISO3166 fallback
for BCM4350" to Ubuntu's linux-hwe-7.0 source matching kernel
7.0.0-43-generic. Specifically, I added:

  case BRCM_CC_4350_CHIP_ID:

to brmcf_use_iso3166_ccode_fallback() in
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c, between
the 4345 and 4356 cases.

I reconstructed the matching Ubuntu source (linux-hwe-7.0
7.0.0-43.43~24.04.1), applied that one-line change, and built only
brcmfmac.ko using the installed Ubuntu 7.0.0-43-generic kernel headers
and symbol versions, keeping Ubuntu's cfg80211 and brcmutil modules.
The patched module is installed as a separate override under
/lib/modules/7.0.0-43-generic/updates/tembook-dfs/brcmfmac.ko.
Imported-symbol CRCs matched the stock module.

With the patch installed, the previously invisible UniFi AP was
immediately discoverable:

  BSS 9c:05:d6:bd:b9:cb
  freq: 5520.0 MHz (DFS channel 104)
  signal: -46 dBm
  SSID: macgmason

The MacBook then associated successfully with that exact BSSID:

  Connected to 9c:05:d6:bd:b9:cb
  freq: 5520.0 MHz
  signal: -44 dBm
  rx bitrate: 520.0 MBit/s
  tx bitrate: 175.5 MBit/s

The global regulatory domain remains US: DFS-FCC; phy0 still displays
country 99: DFS-UNSET, but DFS discovery and association now work.

Measured iperf3 LAN throughput versus a wired host (Steerpike):
- Before patch, non-DFS channel 36: approximately 86 Mb/s upload and
252 Mb/s download
- After patch, DFS channel 104: 148 Mb/s upload and 433 Mb/s download

This is approximately a 71=E2=80=9372% improvement in both directions. Sinc=
e
the before/after tests used different channels and times, this should
not be attributed entirely to the source patch; the key causal result
is restored DFS discovery and association.

The machine's NVMe, Bluetooth, FaceTimeHD, and CS4208 audio health
checks all pass with the patched module and kernel 7.0.0-43.

This is positive confirmation that the BCM4350 ISO3166 fallback patch
fixes the original DFS discovery symptom on a MacBook10,1 using Ubuntu
24.04 HWE. Thank you to the developers; a backport into Ubuntu's HWE
kernel would eliminate the need to maintain the local module override.

Regards

On Sun, 25 Oct 2026 18:11:55 -0700, Thomas Mason <ranchitossf@gmail.com> wr=
ote:
> Hello linux-wireless maintainers,
>
> I'm reporting a reproducible Wi-Fi discovery problem on a 2017 Apple 12-i=
nch MacBook (MacBook10,1).
>
> Hardware and software:
> - Ubuntu 24.04.5.1 LTS, kernel 7.0.0-38-generic
> - Broadcom BCM4350/5 BCM4350C2 PCIe wireless adapter, PCI ID 14e4:43a3, u=
sing brcmfmac
> - Firmware: 7.35.180.133 (r602372), FWID 01-c45b39d6
> - Global regulatory domain: US / DFS-FCC; phy0 reports country 99 / DFS-U=
NSET
>
> Problem:
> The MacBook discovers its UniFi SSID "macgmason" on 2.4 GHz (BSSID 9C:05:=
D6:BD:B9:CA, channel 11), as well as other 5 GHz APs on channels 48 and 153=
, but never discovers the same nearby AP's 5 GHz BSSID 9C:05:D6:BD:B9:CB op=
erating on channel 104 (5520 MHz, 80 MHz width). UniFi confirms that this A=
P is operating on channel 104 and serving another 5 GHz client.
>
> The wireless PHY lists:
> 5520 MHz [104]
> Maximum TX power: 20.0 dBm
> Radar detection
> Channel widths: 20MHz HT40- HT40+ VHT80
> DFS state: usable
> DFS CAC time: 60000 ms
>
> Reproduction:
> sudo iw dev wlp2s0 scan flush freq 5520
> nmcli device wifi rescan
> nmcli -f BSSID,SSID,CHAN,FREQ,SIGNAL device wifi list
>
> The targeted iw scan returns successfully, but displays BSS entries on ot=
her frequencies and none for the channel-104 BSSID. It is not clear whether=
 the firmware actually scanned 5520 MHz or returned wider/cached results.
>
> Kernel tracing produced:
> 872.205343: rdev_scan: phy0
> 874.279291: cfg80211_scan_done: aborted: false
>
> The scan completed in approximately 2.07 seconds. The rdev_scan tracepoin=
t in this kernel exposes only wiphy_name, not the requested channel list; t=
he trace therefore cannot confirm whether channel 104 was passed down.
>
> Kernel configuration:
> CONFIG_BRCM_TRACING=3Dy
> # CONFIG_BRCMDBG is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
>
> Firmware observations:
> Direct firmware load for brcm/brcmfmac4350c2-pcie.clm_blob failed with er=
ror -2
> brcmf_c_process_clm_blob: no clm_blob available (err=3D-2), device may ha=
ve limited channels available
>
> Tests tried without success:
> - The stock Ubuntu BCM4350C2 firmware
> - A minimal MacBook-specific NVRAM .txt with ccode=3DUS / regrev=3D53
> - The alternative BCM4350C2 firmware image in WiltonH/macbook12-wifi-driv=
er (different file hash, same embedded firmware version/FWID)
>
> The original Ubuntu firmware was restored; the machine is otherwise stabl=
e. I have not patched the brcmfmac kernel driver.
>
> Could you advise:
> 1. Whether this BCM4350C2 firmware supports passive discovery of DFS chan=
nel 104 under FCC rules;
> 2. Whether the absent CLM blob could specifically affect DFS discovery de=
spite other 5 GHz channels working;
> 3. Whether brcmfmac could be ignoring the frequency-restricted scan reque=
st;
> 4. The preferred instrumentation to inspect channel specifications genera=
ted by brcmf_escan_prep() without needing an entire custom kernel?
>
> I can provide additional diagnostic traces or tests if helpful.
>
> Thank you.
