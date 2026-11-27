Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795801110;
	b=rOK+iEQvPOR2iJrjhmeCTe1WfA83kqPNysMBYTZCLtWckal0Vkj4O6U4n9tStewRPkNR
	 PHJ+KCtIo96yJBsjB25p8mZiFRogciZlqirsdGFl76jttEUXIQ17R+bXFC4eYYMSeVTyW
	 2P+GdCNISkewXrFi/IQHxtzT2BbYO23gwPPEmjCrYiCrJdWt7OrSjI4BMnaIx9LvK6kJN
	 vnhw0209WOV6EOVMNbSQxarDOOSxDKD39UUXexII438PxyUlydWInLRIxAulgBl7crcmR
	 64sOYBdeAonrJJrScAJ2rCDlYwPPleizJEp+iCFUKHpRyxKy0C29kfwia80S8n/hrqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
	b=a4IRzQN8oUKDt6CRpn1thCOe2jv25SMDIoN3BA0b2AfeTu8xBl5l/3WSq7trJ7P6l5e7
	 1MYy8x7J528TwWZg0L+/idRZ38nVc5v4kbfT6afrxkHY18QaqcTQ1AI5xoul4OOJyfhek
	 n75mfcCi6ofZOk0SkNGBhp8W6h7uiF+hBWBt2h5YrP6D1FPzppyLpHXDOVfFMl4YgJ3dV
	 +bEmux0ULMN59xPOW0vRnPcKq96IS9Z6yRq96CtRrO6LWHMWb86Pui6SFEXPPnM5GMg8h
	 tgjxCtfP2r0GqaO5mKE796XySZko57Twa3ixWP/QzgKtEGOn6bT8WN3950VZrpMrFaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqFMF5Nl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4A606A689
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 17:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE4A606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqFMF5Nl
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4b8587b395aso4781004fac.3
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795801108; cv=none;
        d=google.com; s=arc-20260327;
        b=lY8gQP0vJUN5I6xzUbOuAV0OeZE7/DwgdB8+++aGuBNBPPUldK9E2ah/6RYS6fxMdY
         qN7WteaDcdQZcplUSun6/Qyayil1iswbKQN5VvZLsv1fl6kd0EHvu1eW3oaj0EW2ryWU
         9zbAs1KOwfyob+9IghTUfbBr0pR5DGqn3m85kU/270WB49/LRrZ5Ui5Tx+HIixusIU+x
         U3wWx07PhzZFc6zDJCvt5E3lwdKWNLgIoCPL9cs2OTYOwUbjoHS4VNPwhbNQcdXteHeG
         xSSF0eOeh48lHnKWI80EzxTkq3oyInAmiv6jn4ti1vjWLtvG9hqCXhroUPv7f96qvspr
         08Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        fh=La0rxN81VAUOcpoTp2eEe/u4IufCCo9Oi8nSMv8clzs=;
        b=mMQP4oGVmprepSNGgZTTt/38Vj1+M7/pXIl7C6cSFAFlWJqfGkwvKal7GGg/7QnENy
         ato/rourIlXs0Szem92CyJCHsPhekkL0IISkaKPINRcU8daTkpVxK/TZTz2/yOg0TK0m
         b+uU4pQOGq35PThrHkIjBaFqCJiRkADSYImteT4I+XqkbMDFdtxBRrsjbef6b/w9JgnG
         znEF3i/luX5/G7RRqGSx2ocBYOHBHjbIi/S0CmAw6M/AHE1nDyb5Yp8+AVW3LmCu1B0v
         XG4WALnYIbzmuzeggXJaQHuHoRDQfcnd/X4mVpWfPT9nFIzzEW0Emh72VPkt8Ph9is0x
         SLmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801108; x=1796405908; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        b=zqFMF5Nl5otAa73WkVGb0V+EmsXwsrZEzr9DIG2swnQIVtcPaDfxdiM4r7bvY5f4cq
         0uA2lc6mty1wrLtmg1minomAG25RmFtXDHEOw3o8POL3f9kNJsjy/9LZoXZmzteW8kz9
         bzv3hdSPkSCx7NXpaYhfFMDFPDdB6RQKzAZfNLcKVs741O9NZLcWhtmgTZp8cTctY6pW
         tGX0iVJPkckz/SIpTl282/3KlCUJ68iCAn9KtEJvsNZj6lAg5GfGCjcq2jrbiDOvrxp/
         EKIbDCeuMn4O3KVO65VWTDw3wT+ApUDfqDziVBghoxT9u1dY4vCMx0D4IJtbYPcRjP7r
         cbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801108; x=1796405908;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        b=n7L68ly/uqswSejmpqEy/djjSAhLXhqJZMiC0AvDG/lWJU2qQ1xLDSBE4nn5GzMCNz
         aZyABZJFUIZi60vvVz3mQFUbqPhERtOB7ypMkCWo8RYGhH3eU3id1X7juEbUZ2pN1UoD
         2TKggKGoWS2vkSrsieiOsZx1XPgm3mwABFPjObjSyNLx/zir8wlBpm6As6S45cUkZX0d
         UoWhVh5Gc3ll5tz/ZHxECzv0rQdaQIoireF7LHq9IXPEo9Lr59Q+p6tZb7bd+DT9R5mV
         +/MxsOeYqz8waBsGTB6Xw2IiuCO9/vPCVJB2Q7qSvjCzNMWxTIaafqen5780vv3XvYR8
         cttQ==
X-Forwarded-Encrypted: i=1; AL+hErGdZlJbLeldvIRKMAeoeBesaKurS7tXmwBg6kLeNkLwqgMXHhrBbEJjUAdwT+FKj8ndfXb+wh6znKBouStz1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OZbtXebAG/vr12YI3M4BBC3gwzUN+aNktKGVBEDtnSCvckzZd
	SgR3CMZpisF1b2p5iKGBcV6+vsZr75Pz7w8gPM2QzxGmcRJ/1qLneNRcQZ3RTw1katip3V/VSpo
	fZRQElc8Fzwr7pNWv12L4XRKGNXwWgY4=
X-Gm-Gg: AZFdTZefa2ZJlgZrLv+a7T3YygAI78fZxpsHtmMqQIMfaId89I54tvnw9St9a+AhrEl
	C4t4ZNZ9Ngp8U8dykjCegJbcJM6wI4fyhxNLajU+bqvjbWRntHI1rO2rX5MrPcS0r7dZP6mkWP7
	AGx/sGUZcSYMqGglwT/eojFiBX1yRAljGOzHvTG6J+6VXNa3SfZrGJ+9j9EhGYEis/I4oS4F8pZ
	83OhZuoVTQOIMOfso4vVC0bGLkyUQU54uL6L1CzG5A0uVg1OkZhXTlZvI7GU6brVpo22zPiMTbR
	upN8LwLQtEwwlkC3IBI+Z49EQTPwqv11ed/fZpcrKB3MMk0Ajq9o+yo6lkUjFt8K6p+aPnhUAKT
	XmH5okbysXueKHfdyHJw+XcnInBpd2z2AxKvb0bgoK7Rri/ZCbgdz1KRKgF8piwd908EgICPrY+
	xvbJ9vRP+d2Szq2iVrKjCfH5d/bbxx0iU=
X-Received: by 2002:a05:6808:151f:b0:576:b73b:f273 with SMTP id
 5614622812f47-57a0a404fcfmr26333399b6e.21.1795801108384; Fri, 27 Nov 2026
 09:38:28 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-7-hjf3108@gmail.com>
 <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
In-Reply-To: <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 01:37:52 +0800
X-Gm-Features: Aa3M54qzBjXgTSOBtq2I0sWZmCjRDhk1jQEg2oYZonA1g4Eptxdtvn7VaLjISfA
Message-ID: <CABOQOSXgnFkSyL4hN9zDpq8iU24CFyS_yBS84Ts5QPzq9ntaxg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4 6/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Luka,

On Sun, 15 Nov 2026 at 21:20, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the patch. One comment below.
>
> On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>
> [ ... ]
>
> > @@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
>
> [ ... ]
>
> > +             rtw_phy_parsing_cfo(rtwdev, pkt_stat);
>
> [ ... ]
>
> > @@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
>
> [ ... ]
>
> > +     crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
> > +     if (crystal_cap == cfo->crystal_cap)
> > +             return;
> > +
> > +     cfo->crystal_cap = crystal_cap;
> > +     rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);
>
> Could the shared helper discard the samples while sta_cnt != 1? In AP
> mode, frames from both clients match the interface BSSID, so these new
> calls keep adding their CFO samples. But rtw_phy_cfo_xcap_track() returns
> through rtw_phy_cfo_tracking_reset() before clearing the sums or counts.
If there are multiple clients, an argument can be made that correcting
the frequency so that it minimizes the frequency difference between
the AP and the clients can improve performance. Taking the average of
all the client offsets for the frames received might be good enough,
since it gives an estimate of which client needs more attention and
correct towards it. However, I feel like in this case, CFO tracking
should be the responsibility of the client instead of the AP, since it
can get all the devices to agree on the frequency.

> So if I read it right, when one client leaves, the first adjustment still
> includes samples from that client. For example, on each reporting path,
> a +12 sample from the remaining client and a -48 sample from the other,
> followed by another +12, give an average of -20 kHz. The remaining client
> alone gives +30 kHz, so the first correction goes the wrong way.
That does happen, although it might not be a big problem since as it
gets more samples the CFO tracking should converge to the correct
value.

> This was already present on 8822c, and this patch makes it reachable on
> 88xxa too. I think the fix belongs in rtw_phy_cfo_xcap_track(), before
> these new callers start using it. Could the sums and counts be reset
> there when there is no single peer to track?
Since this bug is pre-existing and not specific to 88xxa, I think it
should be sent in as a separate patch?

> Best regards,
> Luka Gejak
