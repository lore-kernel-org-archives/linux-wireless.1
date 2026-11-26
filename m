Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670517;
	b=xvNA60sSrJ3TgVGL7OkbA5uQ2RsL3ZmhcW/kzvD5M6lyfiUC+x+DzyUkyHP4OCEWttLX
	 e9m0vpxbTarSh3qUR1YDJ5npDE9QPKyN/4t2NfdrfJk3oV0KCq8mKd0GWB+vuDNkR7CNH
	 YxBdrfRtq/oNg5wH40Tw25jGyvRgUHZtDvlkTyLFB5ZmtQ/+TIPk6LPvloBtxM1ucJztr
	 TejzvcEa0RmdycuXK6r+WqvFmmE0Gl6q5PXpBSLv5UwWaK56XSdMmulUyhmcVITvBucys
	 gmp2HBSA+QnZszOi53U3bAbn+2TNUDZXSV3pwsw1hXqkUgNj9jJudE7xCnciQp1HsNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jmEf0yH7FsMTPktYvAASxGJFnmS9uWTCWfNcUEtxpy8=;
	b=hF0Go942CFUUVSjWoiIDXvK9tPOvS6zk+lqV0VKg+NWPKNM9LjTCiJTU2UpBREsu4A15
	 LIywxmbjt/yRjp+R/wGKim5RdgaStYKVtXWEhQcGUCeviH18bmAoU/QUjAi79MovcbMd+
	 PuALb4cCVvBgUtHomrFYNmFiGGaz/pvMjOAmldUYNWK37qeCeNQJ+WICQoB/sKLV/moST
	 p5lz0XP5ueS0aAH5y+B7MvR/bOLj9vjgyyQAsM6AbXRRNwJJdFT41bCsJ50xkFefaE9/T
	 jv1T881bvz2w3fc0CEpJ4GTfNXvJjZRQo/tdaI5qVAXVlP6GncwAWNKFopirLC4EArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0PAkbFe;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9295606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 05:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9295606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0PAkbFe
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92182125ec0so9034706d6.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670516; x=1796275316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmEf0yH7FsMTPktYvAASxGJFnmS9uWTCWfNcUEtxpy8=;
        b=i0PAkbFevbsFcvSvheGy2JFr1K/z0ppTvUQ0e0kfRYMpEDa6zgSsOjSAJ3v9x2z+jE
         v4p9UhCeP9GtzonjeyGOhS1w8nq0IIvmN25w95Tx5hce3kbC9Am7I4hMC04EC5WnlGOt
         KMRRYxfrpa84PJ9ImZqjde/CSOQXmXVh5vaObcz8reUUubAE1QW2T89HHtBLp+MwC9rB
         m/f5dbuQ6gXAA2hCFxNSOtKWvwbCA7N0sf8DbSYqFAEr2gYomxNTUADDKWoraxPoQzLp
         Cwr+b25u0h77ukhjDXoncMh6jy+fX5wS04UP4afvndfM2s344ihrH6GLCuQTPd/vttuq
         kLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670516; x=1796275316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmEf0yH7FsMTPktYvAASxGJFnmS9uWTCWfNcUEtxpy8=;
        b=zjZMQCpDhhTfnV7nopaN0xYjkR2v1R99atgbk4Bo9tfldPH4B619tV8nrrkGc27lw7
         MJZu+e4rXjaYttpVzbtBRaV5E3FVHR0Dlnj5/Q1oYIoqlAxNajhCXShKtLKHl1YrS5y5
         hv1RHW4Bck0PjudIBHwswS+RdWLsPzXqyrOOg2oPpZ+yPq4QQGrYLVtse0sAfYE8JRay
         yrxgaJpgMqI1FkYGLSvl6AD4oRF2OAvreqNXNOKa3R0Ig+U0yMypdjxlLv1WSv/+Kkx3
         wRVeMkI36G5lntLK0AlscH5PaK9hrQbxMDUY+nYpV6KekWUnJImIGi+bNM6ZlAZBaAPU
         Z5Uw==
X-Forwarded-Encrypted: i=1; AL+hErG8klNDf1rvvZNal4z6qqmlj34A1Cs4Ka84pYEXfWQ4uNNxRVlMpPIUs2OyE9FlguivuFCiGaY2NsWqzastWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JMEbkeRnG5OYS5G3HLZxpIdhYi0x3oDwJhyA8TqRw/BQ0nBBr
	xejle2ELOIxfTAzZx1mRi5xJNpjEYVEZN5k24gBUvbmiMG4ZxrCZGUZQ
X-Gm-Gg: AZFdTZcD9rmTzobDUxUwaOdA58VUXaQ9urusx8wtv//n5TarlhHcniC75pBBnvBVarO
	4GeP03Ys3SV04kHQO4wBxGNcakJ4gC1eG0dbwDuqqFqId9th48cQlJF5DwQmce7OrXCfBGqM78z
	eBUjOjnghUE9WNi7QZh4zIE7yvc+Z1LyK7PrC9rYRDk3OZX67Dx2PgtIyokBwO6I+QUc/v+UVc6
	xoSDw2ScwE75CrvoPY8rheixC5+xUUE+n1XnofLDXg0/3LVFAIZahUX3KI1YUOR9SaZTjhmlHTN
	cDh17VKQL1T5WK0n9g8zDZFW7ezXxaEpteeuoapdczQdbJBivm8L7xLkOaM5GW5oSSMv/C6HUTI
	frLpIiUFVqz1aTdO/rDfBqhdz8Ej51H5xJ7tZXl9GloojH8CsD7OpRWroC2QUaxt4F4aHLMaKfo
	/iu5Mxt2J06Xlzo51wxm8qfOKRe2sztB6xYrvXFz3+DFO5hU3a5r+M1ZYeaTJdptqK7fSdtoTCj
	U7wimye3ubvw4veBot5u8zrFNvogW2nDmT0a9ERaqSlilPWrBuJlfqauJ6rXIzmzsRX7aI4KGGv
	/4SVx66JB+fg4eczJZg9ifmc+1cb1gSjYYwpkPTWnGf7E3d1dJhDt6xU
X-Received: by 2002:a05:6214:528a:b0:91c:72e2:3106 with SMTP id 6a1803df08f44-92134b8fcabmr356449596d6.49.1795670515638;
        Wed, 25 Nov 2026 21:21:55 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213514d20esm180847656d6.23.2026.11.25.21.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:21:55 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shreyansh Khajanchi <hi@shreyan.sh>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>,
	=?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Date: Thu, 26 Nov 2026 06:21:52 +0100
Message-ID: <20261126052152.2887192-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <81c3d0056a0849078715e0f0be074d1e@realtek.com>
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

Hi Shreyansh, Ping-Ke,

Here are the air captures and TIM results Ping-Ke asked for. Georg's
RFC [1] enables AP mode on the same chip; the beacon problem below is
the same with both.

Setup: rtw-next 18d0bedbb5f0 plus this patch, Edimax EW-7811Un V2
(RTL8188EUS) as AP, hostapd on channel 6, beacon_int 100,
dtim_period 2, open and WPA2. The client is an RTL8822CE (rtw88) with
power save on; it dozes (PM=1, and mac80211 on the AP marks it PS_STA
and buffers frames for it). Two MT7921AU sniffers capture the air and
agree on the beacon contents. Received packets are counted with
tcpdump on the client. In each run the AP pings the client 20 times,
then sends 20 UDP broadcasts, one per second. Reference AP with the
same client: ath9k_htc.

Beacons, this patch alone (4 runs): 4 to 8 beacons in 20 s instead of
about 195. The client never dozes, so TIM cannot be checked. Georg's
RFC sends one beacon after hostapd starts and then none. With two
changes from [1] (REG_MBID_NUM |= BIT(3) | BIT(4) in AP mode, as the
vendor driver does, and the vendor TBTT hold time) there is a beacon
at every TBTT. The TIM results below are with these two changes,
16 runs.

What works:
- Association and traffic, open and WPA2.
- Unicast TIM: the client's AID is set while mac80211 has frames
  buffered for it.

What does not work:
- The DTIM count does not count down. mac80211 counts it down once per
  ieee80211_beacon_get(), and the hardware repeats the uploaded
  beacon, so the count stays at one value until the next upload.
  ath9k_htc sends 1, 0, 1, 0.
- The multicast bit is never set, and broadcast frames go out when
  they are queued, not after a DTIM beacon. rtl8xxxu does not set
  HOST_BROADCAST_PS_BUFFERING, so mac80211 does not buffer them.
  ath9k_htc sets the bit in the DTIM beacons and sends the broadcasts
  after them.

What works with problems:
- Unicast delivery to the dozing client depends on how many beacons
  happen to carry DTIM count 0. In 3 runs only 2 of 200, 2 of 217 and
  3 of 213 did, and none of the 20 pings reached the client although
  its AID was set in almost every beacon. In runs with 40 % or more
  such beacons, 12 to 20 pings arrived. With ath9k_htc every run
  delivered 20 of 20.
- "rtl8xxxu_send_beacon_frame: Failed to read beacon valid bit"
  appeared in 11 of these 16 runs.
- Frames sent to the 8188e are often not acked (62-73 % carry the
  retry bit), in station mode as well. Details are in [1].

[1] https://lore.kernel.org/linux-wireless/20261125160616.1201001-1-mehmet.fide@gmail.com/

Best regards,
Mehmet
