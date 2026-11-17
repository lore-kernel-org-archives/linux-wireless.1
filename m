Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942314;
	b=XcfURIoSDGZnU1pboPhzhtVjooGqGZd3aooduO7So6QPNo4xYOi1rBeYZfplOU/75rUF
	 YTYoheUz8pKzOniYOoqOa8AaDA5u5a9rVNDGZfymEtwiZU2nAH7id2SmxJsCKYibmZPwZ
	 mYIp9b9YXx3cP534X2BxoTvmUqaNQuEft4wK0ZHsug5rmC8zdg9mzW7YBRAA3Fpbb9UZd
	 LwWXlvqrOlzwd2Bp4/4xkzkrIvr4kbXRDRGZExrOVZaZxZ3ymdHOsCa8jIYINlXdsS07c
	 gr/28RrXiT9Gza9PBaDqJ7GESVEjOJpLvFeEKJHkwzaTBl37WmGoDm+EVbpDq/p/ynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j3g6f75/Bu1APIy3qHC2RDpl5pgdGtrncsiozb0ArJc=;
	b=BKcX6fAjSe7LJ4WdOePymS7YbaF7X+h67mMJjJ8yAeo9oZSR4Px4fJd9WqUC1mYr0cul
	 aa+WL+NTfkr/p7s1qDVEFbUQFhOk2czxdq1ZQhajude2KzNmlB8wYpJQXcc1ZDDqdEiZa
	 stKztew4tcCItjkPABTJTEvIR//gj6mGdTlfR2XteC8PryxfRLLFwCjKT6yB0rsTTqP+r
	 b9hFbISdI4n2MmhGG1qDo3cx/1hgPllgpWi9T2NM484No/ytzfcaCLLmriLF8zDKm2oj0
	 UPr2aXUwkhBVElpa1SbohsN4SXqdAOdruQTVH6taXk0CEPbgYvFTK4AUISRFcfdiOtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6gvXLwA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB1606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 19:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6gvXLwA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1634455e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942312; x=1795547112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3g6f75/Bu1APIy3qHC2RDpl5pgdGtrncsiozb0ArJc=;
        b=E6gvXLwAp2BTzFotIOlNvyiL8/Ka28pdEXXK0now8707FxtaIr6e+fdvAP6tdP9wb5
         auTZY8hUEz+5Zg//gbJnoFtpFZftuxt1OLZxaVFGKK87j8BjxTg0NjaLpb1Ezj8qxlP0
         hPnkBOgBmBNeLhdFiug6E9AqF1bAcMKeXOZMPNHYxTrPBI0sc2eBVoUt2h+oovoDbTyM
         sod7mI4X3xmFrb8IJoERuUn1Hzyljb1sRoW7Joozzyavbf76PkYBKwUIzqhjy/yY7OzB
         NkUllkvVFU/tyuSBY90G8+gzZj1mkmoT/n59W/hHElfkM+jH+I1n5wRyWyX5gZWOm8MA
         jT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942312; x=1795547112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3g6f75/Bu1APIy3qHC2RDpl5pgdGtrncsiozb0ArJc=;
        b=qXeRi9dPirqpSuROcDo3o9jPZwCZSd8mc80r4/798DpQVObihZ4shpOkrc+8yVKqny
         7raC2Z9D+vHX13arZFfdXWhLY3Vox1ZrLD8Wy0NbAp7k89ghaMvvr9OW6BXew43A+9S1
         g0R8NKdi2M4s+oS6HQ/yR8ZmB517YszyYUGi8HgCQ+yF2o2p8//wEEMaxJiEzIBFDcGz
         zsWNWvS088lIS4mKXQPMwY24qsEDBpxfgZSucu34rde8E8zbq01J0cBoyCvWBNYL4vi8
         v2/DnZOyxzqE9Lk2uZvDsG1qbqA7viuXw4/PiA3hHg8DCjZ2VIYy1cCtYcBnXHoFPf7b
         sJnw==
X-Gm-Message-State: APuU4Z/Bs0cruD8jrVRHygm3NVHd7GXRHRrdfSnxl9lNGdRgQdjr5RQR
	fwW3ugBUPY7CIRxWlVFiJEdeDCHuuWZO6lQKTxsfBAdgvkbKizxHy6vdXv6ns6wi
X-Gm-Gg: AYBFou2YpwpODOFd2lWpY7vjRnF0UMP/JNabtyLHjSwlZKIL/YjYLwFM9tKt4MJoZkS
	iJLCZjetlgc5BAIn4taPO6iXiNTO1CBI+1ezVttZ9CXnI1weD/3BwZZ/uOYFxc1zNp9vmV7bxbI
	MaelbDZaeqLNQ73hPbVHsy8GHK2Np5ySAhjm90kV5W6aQViwxOuEjMd6Z6S1MTOejbn3B+9ZbY6
	yd1JE8W/bElWGO4AkPPBcLaNqdUPvtxPITNSPYHGHZQTSnMegwBslLVt+xy27qmuuT6FwnZONgw
	9w6/LSlOGwsHI5q5/5tC2kmHFrfiKFzFO1f/WD9D/8NeLFdF/Pl842GM2XUDxtuLpdHCVwnte7N
	C/j5/DZ0WT4GqS/sjy9SVxhHl9y4mfJT3W3NoGcs+VZjFWaEiIRqZ6+6no5QbhsOdJkDDuX/CW9
	tlqaUgAbH+Nk4U7ftVQvsg68yP2xm2mqK/EVPF/SDV7d4MAP9FatXw0ji4JDeWYmciq1VJfL4zb
	NStAYC8kjQpsAywf1/jueIpwaeuXyJkCAGzUl2wYHthwPhRkrVk20UJ6w52A8jT/9x2V1sW18dS
	I5ag8aZtHD6mv5ZpDCs/ybh7XGjW3au/JK9l2BrWUuIUqgRxWb+sx/E1s///0aFV
X-Received: by 2002:a05:600c:524d:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb7da46634mr1719485e9.30.1794942312025;
        Tue, 17 Nov 2026 11:05:12 -0800 (PST)
Received: from KYK-Workstation.. ([2a00:1d37:22b2:4600:7835:c8e2:10fd:eb04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c614sm5380025e9.4.2026.11.17.11.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:05:11 -0800 (PST)
From: Kadir Yavuz Kurt <k.yavuzkurt1@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [BUG] wifi: rtw89: 8922ae: no association until module reload
Date: Tue, 17 Nov 2026 22:02:49 +0300
Message-ID: <20261117190249.8814-1-k.yavuzkurt1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c35e169db9404f70b806531180f7ca9d@realtek.com>
References: <c35e169db9404f70b806531180f7ca9d@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is a good point. I think you can add rtw89 into blacklist, and
> manually load the modules after booting.

That works. Blacklisted rtw89_8922ae, booted, loaded it by hand once
the desktop was up:

    [ 7.427775] Bluetooth: hci0: RTL: fw version 0x41c0c905
    [50.304704] rtw89_8922ae 0000:07:00.0: loaded firmware
                                           rtw89/rtw8922a_fw-4.bin
    [53.787826] wlp7s0: authenticate with xx:xx:xx:xx:xx:xx
    [53.788897] wlp7s0: authenticated
    [53.789371] wlp7s0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
    [53.907495] wlp7s0: associated

First attempt, single load. So the chip doesn't need a second init,
which I'd been wondering about.

> If this works, add a udev rule to delay loading rtw89.

This is where it fell apart. I automated it as a systemd unit
(After=bluetooth.service, wait for 'bluetoothctl show' to report
Powered: yes, then modprobe):

    [ 7.464834] Bluetooth: hci0: RTL: fw version 0x41c0c905
    [ 9.994965] rtw89_8922ae 0000:07:00.0: loaded firmware
                                           rtw89/rtw8922a_fw-4.bin

No authenticate line, no association. BT had finished 2.5 s earlier, so
waiting for BT isn't enough.

Which pushed me to test what I should have tested first: no BT at all.
blacklist btusb + btrtl, rtw89 left to load normally at boot. lsmod
shows no btusb, there's no hci0, and no BT firmware download anywhere
in the log.

    [ 3.037204] rtw89_8922ae 0000:07:00.0: loaded firmware
                                           rtw89/rtw8922a_fw-4.bin
    [54.735452] rtw89_8922ae 0000:07:00.0: loaded firmware  (my reload)
    [58.218773] wlp7s0: authenticate with xx:xx:xx:xx:xx:xx
    [58.219916] wlp7s0: authenticated

Still broken with Bluetooth completely gone.

So I was wrong about Bluetooth and I'd like to withdraw that part of my
first mail. The 1 ms overlap was real but it wasn't causing anything.
Load at 3 s: fails. At 10 s: fails. At 3 s with no BT: fails. At 50 s:
works. The only thing that tracks the outcome is how late the probe
runs, and the reload only helps because it happens late.

What I can't tell you is what the driver is sensitive to that early in
boot. This box starts a lot at once (amdgpu, nvidia, docker, libvirt,
tailscale, ollama), so contention around probe time is my guess, but
it's only a guess.

All of the above is on 7.0.0-43-generic.

I can bisect the delay to find where it flips. Each point needs its own
boot, since once a probe has failed every load after it succeeds, but
reboots are cheap here. Anything you'd like instrumented at probe time,
or a debug_mask that would show what differs? I'll test patches on this
hardware whenever.

------------
K. Yavuz Kurt
k.yavuzkurt1@gmail.com
