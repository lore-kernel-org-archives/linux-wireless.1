Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383138;
	b=Q/XdS5E16v7oP5M4EMj6LDj59bJ4K8/H3aV3JEPRhYqJUdVi5BfiSyQo9pbkU43LnrvB
	 TILTCy1Di13ZEWip0MCr/kNxLq9AzFG9S3LOMiSSrU9nOMBNS7xxCpzF0z6WvdTB/LAUx
	 SbDlxTZE4/HzvZMzRuTiROV/eeoMRi7vVvIO/nBjMMHAi83IznC0u+ks9XXul47mtxJTW
	 G36xtoV+t4mJ//V3XQho5cQUP71XE6Hs9Bc+evN7a6eA0bXoyi3hjGWeT9x/dBjTntWOG
	 wvh9QAGBfpuz8BqgOxm40VIWLHFs0KohHVNsEV0wtFo9pxh0kmaneIFpQ7mY1AsfZag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=URgtxeMRK/qmZSFrldVPMGPUH1CHcYQx9RetDgs0Akw=;
	b=ZxG5WYDgfXnKCKf+7iZdamEDeiWSO1pxxLI56whMYNQg0mWPuwDPkT3rbn9gN/FJwdXM
	 W8d+pdxpsUXkB7tbE+WyUeGIGNCymxcNte+GA6yuuNsh9c9czRIi3NYOk5Hfg39mF+rJI
	 K+0WfwFrA1dACrWGnGAtgzvHsDnEXkzERBTnypkmuXEjye8yooi7b/aiROlwLYlSL8e/Z
	 /oJgbP//82QDvOGKPn5ToXjGUJCj0b2zMzVX2dY7qAcB5+3+CjyLjPE6f49REKVm5hhbU
	 nmBOTnOvNNGOP4lqUogTyhsqK4mGAU6UiP6zGMbJJdGWTYaJTgpuJUhwPYT0cyt6xpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnU3XGg2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD394606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD394606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnU3XGg2
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4d198f1a591so2728133b6e.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795383136; cv=none;
        d=google.com; s=arc-20260327;
        b=MJozeGD2bH9rQEreyyIicDo0Nk+i/ZwTUGWx1kxQh6/DQElOHWNisSQL35MmsJEba3
         YNs6NyXeLoBYI338QF/y0uCurA60j0gcid5qOV684gU34rhVPQXiuoZCtqi72Tef16tx
         YfOvr2ZLguFs1x/kRr/TtIlBBdtsfS83OGV+VA47Yl5GzlujYiAZwGrRG6vRIumcR5Ho
         wDr/Y+Rfybz3gnrNDbQjiG4sSh9TSs5ntLaMslpVQluzo/ghyhPTzQe/rI8rBNjSV0sl
         wQxw6iEboGBrvLN4a9SwvWnFMXhUVuC0rhlZCwg95gQgTJYpOZHDHvsJRzU8dgYaOIpr
         xLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=URgtxeMRK/qmZSFrldVPMGPUH1CHcYQx9RetDgs0Akw=;
        fh=KUmwsLzLkhXVl2jJ4u39Wpqo57xilkMpy8GHdaLYkMM=;
        b=d1vkQhfoJlb4x/WhOqdCRbjav4ZLOeintcdo1NSgTBf3HLfINWeTimiZxsOuhdNPRw
         KfLsBNzikkFV39OgGhdMmLYE1gAkUHwrRUErAoK3HG53K5lHbLWEetfxEyzIlU2y+Q4/
         uXmfP29TQTSOkFRDbN+LMQoKeQNAGugR6GKq/14HZZNJsADagqctXjifjKEmhqzhOYen
         +IyfIwqTq1jfhbevsoTlqYvZJZGYbOuIFzUWP7NHlLV15AucnF9891mLDqQaZ5DFHRYZ
         CGxdeND/Oh3Pp/bfDVF1ng5cSMqvrHjE7MIC/aDTFfq3XTEjNuIDb1CRlQTezkLXOv3h
         fEtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795383136; x=1795987936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URgtxeMRK/qmZSFrldVPMGPUH1CHcYQx9RetDgs0Akw=;
        b=fnU3XGg25ktXy5TfiixTOXda5RizqyB04Fi63+KwjdsTxzrFjPRancJZa7qHzHhdSh
         AX16Hxw0yIa6jUCFLGB1H3c5lCIonXwBNRvtme6KJJalBrlVo3hEGFJybn7W+ZrX9ecD
         HkAnN7wmAWboBbwCOeXyHS4jeINqMPxlXQI8lHk4LnwDamhDjTboCqi5NYb7+SoZywg1
         fZrEhjOpBYTa9UCdzZttw+wmwruumg8Ey18MCdES8hpAXv/aS2Ym7QsqFssGPDYTpRSf
         4/9MfPPMg1736dpoHdvur5m73jlX0mVrv2WvNWbc+5JcphLWtWmjv9mvRjjCzH4wXM79
         fghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795383136; x=1795987936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=URgtxeMRK/qmZSFrldVPMGPUH1CHcYQx9RetDgs0Akw=;
        b=hixhc1dXa0rFd3LsmtKLXqRuO5TqmE8uwHm8szDMH5Ew4HNmMPcyifcfK3JMbx+t9+
         cSxQAiV1kula/FFZUVwgjtxLmiSIBzDs+w4kCFONmfeOZUCZy1QgHs/2/+5dyqTytwhQ
         DAq2m6QlZD874N/qFeqnqOM7XcKcMD7Kg9FG4qQljucHLGsIhg3MAQHQsXMupPh2UcdG
         q4lW/KttFJVjHGO1PL+7iJdIgEk8twgacDzZlroFfXR8mfIQAATO5cZiQ0h2B95OGmB9
         qdqxbp4eViPZJLZ0i9lbsFHc5euAnkjlNjJyBY8S7OdtoPd71+xpM41XZezu3+hUPsyk
         obQA==
X-Gm-Message-State: APuU4Z/MjHFhJVy1Axj8gLJkWLsGUkRbOA4Y2Vlf5Tgnm7Ft0UBpDQXT
	lUqbBdv40r8X9j/XFh0IDic2EAJ6aylZRXAJbEdYh7ujqWtYsD2to039QBZFxFYSlR421xtOgeu
	6sBTL+wE11jcTyuPNZy0JeEOTqCxlhEA3Owps
X-Gm-Gg: AZFdTZephdLh0WJS7VLb3MsM+5HQJiL4I8JQQJBGjarMtTKKzsFPHLXPFRKTyBK0lwz
	clm9Zek/9Xfe8Tc6Bxp4AEI02vR+hPgXQl0x8TtgqXMWQhQP/cU7mheSc6R5GT4dHlMBPGHaBTh
	HYrDnEMUnLfbf4L9ehzLEGU3KfPB82Lra3KPO4Tl3oCsYnB0t28Po444JTiglb2/vYlp4i3P56Y
	0s7ZHy1Vio5YukqccLnkCuIO/sX6VlgfzwGhLbyn4h+dNvOt/hHOwXpkV71NBaAuSD4TtetRg71
	88vg0pa7B4f6kIeoGz2RhocnIhsmwv+Tk/D9VVILmVARr088oZOBKZ/r/Dmdl4Xlanmk94Bu53W
	sciMREmWUxMFttAyYflzGU+ObCq5TvJsK1GEO09v7Lpiledp5JzSfo+dHQlcNp9y0yzizNluDy4
	sFKtl1xIJH+SPJqPS+qyU=
X-Received: by 2002:a05:6808:190b:b0:4e8:92e5:db5b with SMTP id
 5614622812f47-57a0b650de2mr10768956b6e.54.1795383136598; Sun, 22 Nov 2026
 13:32:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Gaston Guevara <guevara.gaston@gmail.com>
Date: Sun, 22 Nov 2026 18:32:04 -0300
X-Gm-Features: Aa3M54rlDTfAZxAgIPfAv2R5p2M48-vQGsGJY4u32PaR3yPiuM8gWzOA5xWG7Mk
Message-ID: <CABMxrRwXP8giw50F6ztjjUP8JF41SXekZCvNFKAObrjtisxz4g@mail.gmail.com>
Subject: mac80211: station is disconnected on an upstream CSA (-EBUSY from
 ieee80211_vif_use_reserved_switch()) when the AP on the same channel context
 hasn't started its own switch yet
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On a phy with an AP and a station vif on the same channel, an upstream
channel switch sometimes makes mac80211 drop the station instead of
following it. I'd like to ask whether that is intended and whether the
kernel side could be less fragile.

(Resending: my first attempt was rejected by the list because my mail
client added an HTML part. Johannes, you may have received that copy
directly; this one is identical in content.)

Setup
- TP-Link Archer C60 v3 (QCA9561, ath9k), one phy with AP + managed
  vifs, 2.4 GHz, 64 MB RAM, SquashFS rootfs.
- OpenWrt SNAPSHOT r38494, Linux 6.18.64 with the OpenWrt mac80211
  backports 7.2 (taint O). I haven't tried a vanilla kernel.
- The station follows a consumer router that changes channel every 20-60
  minutes with CSA plus ECSA (operating class 12, which mac80211
  ignores). I see 5-10 announcements about 0.1 s apart. OpenWrt's
  wpa_supplicant tells hostapd over ubus so the AP starts its own
  switch.
- ath9k also printed a WARNING on every such switch; I reported that
  separately and ran with a one-line fix, and the failure below still
  happens.

Failure

ieee80211 phy4: channel context reservation cannot be finalized
because some interfaces aren't switching
phy4-sta0: failed to use reserved channel context, disconnecting (err=3D-16=
)
phy4-sta0: failed to finalize channel switch, disconnecting

The station drops (reason=3D4 locally_generated=3D1), the AP's clients are
kicked, and everything is back after 6-10 s. In one early event the AP
stayed on the old channel until I reloaded the radio by hand.

Where it comes from
ieee80211_vif_use_reserved_switch() (chan.c) returns -EAGAIN if a vif
has a reservation that is not ready yet, but -EBUSY when n_assigned !=3D
n_reserved and n_ready =3D=3D n_reserved. My reading is that the AP vif has
no reservation at all when the station's countdown ends, and
ieee80211_csa_switch_work() then drops the station. I haven't measured
the AP's reserved_chanctx directly.

What I measured
- The -EBUSY comes 0.85-1.03 s after the first captured ECSA beacon, so
  the AP has roughly 0.9 s to get its own reservation in place.
- In every failure where I have userspace logs, hostapd logs the start
  of its own switch only after the kernel error (about 1-7 s later;
  syslog stamps have one-second resolution).
- With 50 ms sampling of wpa_supplicant, hostapd, ubusd and netifd, in
  two failures (21:53 and 15:26) wpa_supplicant sits in uninterruptible
  sleep (D, wchan submit_bio_wait) before the -EBUSY. In the 15:26 one
  it started at +0.52 s, and the sampler counted 4 major faults in
  wpa_supplicant, 1 in hostapd, 1 in netifd. That points to code pages
  of the daemons being read back from flash.

Hypothesis, not a confirmed cause: on this 64 MB device the file cache
is squeezed by reclaim, the daemons' pages get evicted and are paged
back in during the countdown, and the AP follows too late. To test it I
lowered vm.min_free_kbytes from 8192 to 3072 and pre-read the daemons'
files. All in one boot, router local time:

| Setting | Period | Switches | -EBUSY |
|---|---|---|---|
| 8192, no pre-read (default) | 19:38-21:53 | 5 | 4 |
| 3072 + pre-read | 22:32 to 09:03 next day | 7 | 0 |
| 8192 + pre-read | 11:36-16:00 | 3 | 1 |
| 3072, cache partly evicted, not re-read | 16:00-18:07 | 4 | 0 |

Caveats: not randomised, and consecutive events are not independent (the
cache state carries over). Comparing only what isolates the sysctl
(8192 + pre-read vs 3072, 1 of 3 vs 0 of 4) tells me nothing. Page-ins
alone don't always cause the -EBUSY: two switches that completed (14:28
and 16:04) had major faults in wpa_supplicant, so it probably depends on
how long they last compared with the ~0.9 s window. One router, one
upstream AP.

Questions
1. Is it intended that the station is disconnected when another vif on
   the same chanctx has no reservation yet? Would returning -EAGAIN for
   a bounded time be acceptable, or is the countdown considered too
   tight for that?
2. Is the AP's follow expected to be handled entirely by userspace
   within the countdown? A stall of a few hundred milliseconds there is
   enough to drop the station.
3. Is there something I can measure to confirm the AP vif has no
   reserved_chanctx at that moment (for example a debug print in
   ieee80211_vif_use_reserved_switch())? I can test patches on this
   hardware.

I can send the full dmesg and logread of the failing events and the
50 ms samples.

Thanks,
Gast=C3=B3n

--=20
Gaston Guevara
