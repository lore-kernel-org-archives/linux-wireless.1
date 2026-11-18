Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962521;
	b=znUsLzKxEsAKdVi2UqYrQQchRUeboKIhv64HTlUcCLDEiRGcU0YnFkxD9nsNY2u8VOOv
	 uFXdH9DxF3PxxhFguZ8JWBXS4kbmkFkGiM9uXRPoSk15L76ZJHe8Vn24e81NixFbE+fVb
	 xURiMphsNSlPt5mcgFzpnkDkaaBbDoSW8qa8YXRDcsf1ePqZDx4YCltbnB9260J947xYW
	 lloxDIVhzBW5bABQotZ7WcAiLTXotWjNNrmz1mbfH2VlIlHlmD+dbzIG37WKZ+X8mBhNU
	 uNIJTGZQ+ziFYyDg5oIJMqos9gUDeDlJEwbNrV7UPTnkbrkVj+YFU4ax+cjU2KfPAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962521;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QqD4EFzOMVT6eZ/R/nCjGzqiK9+th0DOJu5beq5zvXw=;
	b=UJsTZXeFLFCWgQ2vL4JEYQnqTl+F5PVdMMnQBVE5jjL83R4zEZ47wrqh3uEoBzJGg+Qt
	 BLnnI80ssYtbNiWZqLlaHy2l938QthXAaXDaH8xUPa8iBy/qY6fR0Q5kJdZHBIzbSMv9G
	 sDvRz1ayanFRWbkTBLRQ+fLGcqFNdEV/e7vJbkn07dVxjJnU0WYoWEqwlZHDi2YQOvNo+
	 vjw3bYwMurgc+K9EpCyfir0gQySsnD/ftDKh14xoo+R89t5Xgd3SiZ1emgzaVPgsInkdD
	 SMV7SnuVJCTfIWeHdfzENdZ5W+IwT/TrvMoH0Met2dfI9yOiER/bQO+EIjaaEMqsFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=q31xy8+J;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D45606A882
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D45606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=q31xy8+J
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI0ftrA7781835, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794962515; bh=QqD4EFzOMVT6eZ/R/nCjGzqiK9+th0DOJu5beq5zvXw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=q31xy8+J67rWcfzwrq343HADBdBdmA0DpnyA43SzsxARXavDLhRNE4d7oin6Ld1nO
	 sJ3AXCTTl/fgj1Qw58voNr66gBrneR0bi4za7KJAt8KlBGuZAy2VsbxJx4LPV4cVD8
	 ymUboxNNagza2OrVoQsjaFhJ5eJim8+hbsyadvWMK4OQER9aF9L3DOuhiWzpRAf7+O
	 iceVkfEuzSHiDIrlaCIR1E6GQ8plsjW+64OStkBK5i6ydHiK5BKTp19Bp8e8EE58G5
	 dfVbEScLhN9JDoEnvtc+QDtt2MkyZ2qGz3uK8AISju4gpbU2UmCsP1LB9zHh52/gzJ
	 5kvRrZuFDZBCg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI0ftrA7781835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 08:41:55 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 08:41:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 08:41:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 08:41:55 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kadir Yavuz Kurt <k.yavuzkurt1@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [BUG] wifi: rtw89: 8922ae: no association until module reload
Thread-Topic: [BUG] wifi: rtw89: 8922ae: no association until module reload
Thread-Index: AQHda8vVqJMtgEcxU0WMB2uaHjTO6bcoM+AQgAn65oCAAOLYkA==
Date: Wed, 18 Nov 2026 00:41:55 +0000
Message-ID: <95f8f42c4d844a778cbeac6aae10ec5a@realtek.com>
References: <c35e169db9404f70b806531180f7ca9d@realtek.com>
 <20261117190249.8814-1-k.yavuzkurt1@gmail.com>
In-Reply-To: <20261117190249.8814-1-k.yavuzkurt1@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Kadir Yavuz Kurt <k.yavuzkurt1@gmail.com> wrote:
> > This is a good point. I think you can add rtw89 into blacklist, and
> > manually load the modules after booting.
>=20
> That works. Blacklisted rtw89_8922ae, booted, loaded it by hand once
> the desktop was up:
>=20
>     [ 7.427775] Bluetooth: hci0: RTL: fw version 0x41c0c905
>     [50.304704] rtw89_8922ae 0000:07:00.0: loaded firmware
>                                            rtw89/rtw8922a_fw-4.bin
>     [53.787826] wlp7s0: authenticate with xx:xx:xx:xx:xx:xx
>     [53.788897] wlp7s0: authenticated
>     [53.789371] wlp7s0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
>     [53.907495] wlp7s0: associated
>=20
> First attempt, single load. So the chip doesn't need a second init,
> which I'd been wondering about.
>=20
> > If this works, add a udev rule to delay loading rtw89.
>=20
> This is where it fell apart. I automated it as a systemd unit
> (After=3Dbluetooth.service, wait for 'bluetoothctl show' to report
> Powered: yes, then modprobe):
>=20
>     [ 7.464834] Bluetooth: hci0: RTL: fw version 0x41c0c905
>     [ 9.994965] rtw89_8922ae 0000:07:00.0: loaded firmware
>                                            rtw89/rtw8922a_fw-4.bin
>=20
> No authenticate line, no association. BT had finished 2.5 s earlier, so
> waiting for BT isn't enough.

Did you use NetworkManager to connect? If so, maybe turn GUI off/on
to see if it can try to connect.=20

>=20
> Which pushed me to test what I should have tested first: no BT at all.
> blacklist btusb + btrtl, rtw89 left to load normally at boot. lsmod
> shows no btusb, there's no hci0, and no BT firmware download anywhere
> in the log.
>=20
>     [ 3.037204] rtw89_8922ae 0000:07:00.0: loaded firmware
>                                            rtw89/rtw8922a_fw-4.bin
>     [54.735452] rtw89_8922ae 0000:07:00.0: loaded firmware  (my reload)
>     [58.218773] wlp7s0: authenticate with xx:xx:xx:xx:xx:xx
>     [58.219916] wlp7s0: authenticated
>=20
> Still broken with Bluetooth completely gone.
>=20
> So I was wrong about Bluetooth and I'd like to withdraw that part of my
> first mail. The 1 ms overlap was real but it wasn't causing anything.
> Load at 3 s: fails. At 10 s: fails. At 3 s with no BT: fails. At 50 s:
> works. The only thing that tracks the outcome is how late the probe
> runs, and the reload only helps because it happens late.

I don't know the exact time BT needs to initialize, but 10s should be
enough. No idea....

>=20
> What I can't tell you is what the driver is sensitive to that early in
> boot. This box starts a lot at once (amdgpu, nvidia, docker, libvirt,
> tailscale, ollama), so contention around probe time is my guess, but
> it's only a guess.
>=20
> All of the above is on 7.0.0-43-generic.
>=20
> I can bisect the delay to find where it flips. Each point needs its own
> boot, since once a probe has failed every load after it succeeds, but
> reboots are cheap here. Anything you'd like instrumented at probe time,
> or a debug_mask that would show what differs? I'll test patches on this
> hardware whenever.

Have you tried manually scanning AP by iw command? Just want to know
if WiFi works while it doesn't trigger connection.=20



