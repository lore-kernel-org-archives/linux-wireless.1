Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290392;
	b=HDC1j7MLcFolAAvCURPo3fRAKMk2cYsO5EnjdvxbFTe1umpJJnwwN4RbXcCyEpLMQ6gJ
	 gRNuZHhlR8RLz/zHxAWnoU1BpB+M5xICd0KzRWQvQFkHmI2lWcJ0+OYs99WPSWwVDWWMM
	 m1uQQfCH+qtY8k5MIx7nEsoP7OnOuWmVEfTe9gpZf8L9TH/V9mILzKdSC8+LAfJ2jT9ri
	 0oTS9ZLaSZBkguSshbfYemSrhfjAS+cZLYhXSn7BzqSQgCFvCCCWYCJ1n3xiSm98+cErM
	 rlPfTzAZOuAjB6fB5ChaxJvsRpHNOr1nKM9SY9wwr0n9GW2yAsCtrRRY+2oHWXUDd0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
	b=mTdhGwwZamM5J6wWzMmItBdqU0eNe+KKj4riliOyj1UmjwfDOUBNpKx1d5wppvX2UC1F
	 ftYqysEvSWrevhg8EFXxx2UfG/F6x5afFZ4piFmPzVWIZPCPzJisth9OzK+PEK2yTKggH
	 ihORbuLnWFZmfn83gGDpiVK1+JpioAjjZTVeeX9D/bBQb7nL6S4e8SkBzuZa9eIr//q6s
	 zNHPp+LRY8Qyy5gOi+HXZ9oOF0sc+wp1sa7p7tQXMSd76D1jRqlh7PvAj7gXzmE/T9Qea
	 12VtE+9oL7MNgcdNXVaJY8kyo5sFVCVmB7sklUtuq/4FZ9MlDPfgWp6MtaMHEDHAt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnTDwszp;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314A606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5314A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnTDwszp
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1150572f8f.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290390; x=1795895190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
        b=DnTDwszpB8ZxdI+yOG8+YfZb8EhJeSqj7lJhE3umK4LXme64ndDQXUBASwSUca8QZP
         Xd1XEe+FFXSMtTxZJcLr4hvV0nQDV8vBI2uu2FccXimeK1iwrqEeiOHxpdnPUXaK7Juv
         Jy+CoFX3KSQRBhSZwVPD6bPZTpzWwRP6fexjfzcDQLKeYLJKWwMjd6YBxJaKbF3w+cqu
         robjyqD6B7EwcyEk1/GfqGMyMkQ1RcE5Uejru7jnMvLbZE15JUBvtkWh7V638WdklrNi
         PGQfsXduiBRAnTgPgXj+cnMORuvP46NtJU3LAhN+uBN+DumKCmpJZB3oGNW8NGq2OCC4
         WOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290390; x=1795895190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
        b=FDon+8pPNF+GS7B5qWuViOft6YxJkV5M6vYduVjE8Ca0BMzI3jhciN41ir/g6I0ADe
         miMRYbHbOE+PlobTpSTiOJfr2YOYPdhEpXno2aJj0gmyLZdx7GvKvI5qhK5udhncqZO3
         ImgGMMwLYqGy13s4IvfswZTUJssmWRvlWz5fJUJIUEj7HPXDCsogw21SpxkMLnjj3nXd
         Hv9LjXLaejGpnFXgjNG5v75xqNPSHQN1WxoqCZsFOZDBn7RKSXRVEAUCbmYJY5TKYfLI
         ummOJ5OvbLGJjmzq+vtDK74CMCy5l55SoYHIEmx9om4Hr2+7HSmEUV+oXKfBxq82GXwZ
         4LNw==
X-Forwarded-Encrypted: i=1; AL+hErF/JlNUkr+U1RS/bhIdTajNYmSvKW1veaIk+cl5uiRUcPJXEBpafA8Ov9pIFf8C9AqybsSctmPWzTscnFXK7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RgDEKX6SwNalF4/pz6rlSrGeeKUItDQDe4fy7vCF2Jc1t/ljn
	PQ9/f4uDyFVac0J1O/pcZ15btHOH8/hVHcV3tDZNQDQ6PRWtx0tPk0GV
X-Gm-Gg: AZFdTZfv2FYV57Jhj+nbIIN5VwmKmbfq04/LgUlUha8fccpFM0Lxy7p0i8kyad+pFOL
	o6+gtyqKjwMZyJSLFnJe5FzcsbqXEIr2ePgRZmMJu4Hl5i5s+uOW0QDZp6DdkHGWm0TriLSjAKG
	0Kt/GcAK8tYrrhLpoSV5MKsYgHsnOZxHb5FFEJQDyICPejqkgq3gfBL/BLV4TJGnLBkmhQLyH8p
	z4WjS9SXEoRc+NZeXG/W716c0WLvu5nIc7c7hkmreEgyhxFB3pcY1eX26286T4fUmI8XwVgeQpW
	fjWEKJ+aq4Q5owbOd1cipPQpUovnChvekvi8dhlvMkC3dt3fAOJ5+OQWmnnwUNdiWTXhjIiJe2T
	N4XW4XH836eo1iGttINh7NTrVRvXo/raBglFoy+qTl/hDf1YejGwfTHImCNuJ13TYam9fJ2Esce
	lUfqtLHnh/CDuvqxWvKMmKD6YFrVDj3YKMH2W3o3o79kFnKdBT9o64lMGGB6vXiQmxUVRhof18H
	J8BqaaGwZP4noUf12txIHAHnZ9zXIjywdc3ktmulQvxi9dZzZS8Kg/gFr0zJ/EKjR+uLmHCro0N
	eXXzpWn8GDaqcHjLUUUt6chNFvQUXCNXPLs=
X-Received: by 2002:a05:6000:26c1:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4abacfea2c9mr15674261f8f.4.1795290390484;
        Sat, 21 Nov 2026 11:46:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm11830367f8f.19.2026.11.21.11.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:46:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH RFC rtw-next] wifi: rtw88: raise the TBTT hold time while beaconing
Date: Sat, 21 Nov 2026 20:46:28 +0100
Message-ID: <20261121194628.604026-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95610ac92e284b3b7b32981e14c380fcda09fcb7@linux.dev>
References: 
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

Hi Luka,

> Your captures fit a beacon transmit deadline. The RTL8822CU vendor
> header says data queues can also wait during the hold, so I'd measure
> latency around TBTT under load.

A station pinged the AP every 5 ms for 20 s, idle and with TCP in each
direction, 0x064 and 0x0ff taking turns, on an RTL8822BU on channels 36
and 6 and an RTL8822CE on channel 6. Each ping was placed in the beacon
interval from the sniffed beacons.

On channel 36 the idle median was 1.7 to 1.9 ms all through the first
10 ms after the TBTT, with both values. On channel 6, where the
neighbour's beacons pass our TBTT, the RTL8822BU pings of the first
8 ms after it had a median of 3.4 to 6.7 ms with 0x0ff and 2.5 to
4.5 ms with 0x064, and 2.3 to 3.4 ms with both from 15 ms on. So data
does wait there while the beacon waits for the medium. The RTL8822CE
showed no such difference. Under TCP load the median was 20 to 80 ms
from queueing, and neither the time after the TBTT nor the hold value
stood out.

> I'd start with 0x0ff and cap it for short beacon intervals. At 10 TU
> that leaves 2.08 ms before the next TBTT. I'd measure beacon loss and
> data latency before raising it on RTL8822CE.

v2 will use 0x0ff, capped at a quarter of the beacon interval but not
below 0x064, and write it again when the interval changes. I will leave
the RTL8822CE at that.

> I'd expect the old template if the MAC has already fetched it and
> still sends. Your v13 tests also saw missed beacons during a write.
>
> At 100 TU a late CSA worker can pass rtw_fw_csa_hold() at 6 ms after
> TBTT, inside the 8.16 ms window. Could the guard account for the hold
> and beacon airtime before a rewrite or switch completion? It currently
> skips intervals of 20 ms or less.

I have no measurement of which beacon goes out then.
rtw_fw_write_data_rsvd_page() clears BIT_EN_BCN_FUNCTION for the
download, so I would keep downloads out of that window. v14 of the CSA
series scales its margins with the interval and runs no step less than
5 ms after a TBTT. That covers 0x064 and a beacon of about 200 bytes at
1 Mb/s, not 0x0ff, so v2 of this patch will make the guard the hold
time plus the beacon airtime, and I will repeat the countdowns while
the neighbour's beacons pass our TBTT.

> To me it looks like a station scan on RTL8822C can pause AP beacons
> through rtw_hw_scan_chan_switch() and rtw_core_enable_beacon(), leaving
> 0xff programmed. The vendor driver restores 0x64 on scan pause. Could
> we update the hold on scan pause and resume too?

Yes. With this patch on an RTL8822CE and an RTL8822CU, a station scan
next to the AP cleared BIT_EN_BCN_FUNCTION off channel while the hold
stayed 0x0ff. v2 will also write the hold in rtw_core_enable_beacon():
0x064 when a scan pauses the beacons, the beaconing value when it
resumes them.

Mehmet
