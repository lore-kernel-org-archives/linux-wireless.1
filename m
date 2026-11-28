Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795880257;
	b=hPUNSRdH79wD/F8NqG1YtaATl1okspypBJVH4/lLi6K7juATaG4cwH1KhjSZdIEV/iHt
	 yhq2dCMlQ+9EHeRrX0HHnBpSg1Rddau9ILWMJZyL2hfr/7Wqc+7ErEX13FJg8S5OXGuhr
	 Zlkofa0xsLMtifVIdxISsESn/ygTIZLDbN9+UtrwgnSAGxQwnNqPIzT3EyVx9oGwv9oV5
	 5GBRF8229dwGp9FSctqwfIB/sZoi0pOu6CvAirOGova/tkGTeIzFRR2uN+nL5f7PWlF4L
	 DaKMucJD3Xqs4xCnOSQ4WYc+bPmMBC3ICCYHs9JWX/D/4qsC/EkZcOWIzmhU0Nu167g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eSTqRepwTM2Ds0g7zEGUeqO62OFtRzY2BDkAJDqyy4Y=;
	b=p5ZTRtfsVpqX4zQvLntAAErTOf8VzymiZNYtPv9CIg0G8UYyQyFE1m9na1kWJ1RyvhgW
	 bwglBTiPipERugaZOtlnBTecOkqk7J5bMa94n0gPLVE58/stdV+TJL7Me/PqXTk5oQZhM
	 AoqLhVfMluQUzEzbqQeyReKxur/AxxfS8Ie3OW01om1SOMdTVimUj5NFIC3F/kAXojovi
	 de1kEOECWHj+Nzsd+mf4I4byWmON5+ly+6zhgb57Du72uLHOrjQ4l+ycnVZWpVMtEGP2Y
	 k1eTyENSN38g43uD5nQ6EcTIJIronDUegcILC0zhk5gPjEhzmHg54A9f/d6AlqFxSZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/PYcTvM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7B606A321
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/PYcTvM
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8629ef8613aso3422915a34.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795880256; cv=none;
        d=google.com; s=arc-20260327;
        b=iATdwXmL8dRxU4gGRoQyf0FrX+ATy7q2rK/bPbfSXfn40JRE9AIcvddPnQD4StDoLf
         9SqhJRVGtCGo0LTYkCMn02CTDwc8m+AYDgka+tmF/u2aN9VCD8ITqlEj+XNEY7Ze7JX6
         gwcJX6Y1Cak/o83UjW609z+X+UNiQuzSrP0Cd+QoTq5OwHequ/oMCq5s9XrPMCoKu3vt
         h9B0QjzsAyX5uEK4FYJa61nJsJUqVK0r7WFU75ZpCRWpp9vXd15HANF5rVIUXMsnYidU
         szGHTJSxqDbNZp1eQwF6MLNpf1USDiNKRUqWpIZxYZ3wFDw8Llo1+wQ4BTbQ9hRSDsXd
         sVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eSTqRepwTM2Ds0g7zEGUeqO62OFtRzY2BDkAJDqyy4Y=;
        fh=5Hf2v28jn6f/CgYQJxGbbaazRzQEQFghNmqMKk30ttw=;
        b=Nbqt2P+JRcOz/iZW911G9geDDDmb+GfjvqrUyBr+56aq2VTJhTlKSdFIm6LKFU46Mw
         cebOCW1xuffuaH/tEQX78UHAzLTdAt5GygW4Ckn2C8Jcgi0X2Iu3uVzpBmKcBroKHfwV
         kiKYnwjvPzjPXGQRag5K6B/42rYdoxpNHl0Ns0Zn7IDTNyyUdIx3vB4YwQ0aLnuYIM11
         pVNw0SxeiTNW90TB1XUFYLZ8x7Blydfb44jXdbildDDRREFUPUo7HZYrSjJHwWe+EXaW
         zi9Wpyx3fXwnZhF+kUlwDVzJfZ01wfNG992QAcFPS61QzEhKw+htKmOQkojF1PiKN3hu
         h3eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880256; x=1796485056; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSTqRepwTM2Ds0g7zEGUeqO62OFtRzY2BDkAJDqyy4Y=;
        b=x/PYcTvMG9QOiiYsCVYkeDvULAbaU7sduB9OBnMcYpGZzKmUJWj1cs7ta9iypyqGrw
         W9q/9ck5yaXmLIhCsvkObIBEyGsLUPnTJx5JlOSvN+3aEPqmiVWTIw8fkJOErLTSwS2X
         IZKVivtvyAnb6Je3wPnihG1z3Vl/JNGU795NsqysCGHkUKNOlxabPVIvhaeOEwUDOHwX
         9ynrWNan5CMqdG2hh9s6rKLSFtqCY1sgK1f0QcQQpBbL5Hx69O6lQsGRDBeOKFpPRpm8
         OyUg4qRmEJuqoh+5k8gQITUGUBLW0EpPr4Bb2aJ4DhsoeFYvgT0Giz4PvzwPRZbulMue
         A+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880256; x=1796485056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eSTqRepwTM2Ds0g7zEGUeqO62OFtRzY2BDkAJDqyy4Y=;
        b=Ma2Ry7cFydfQ/4TWMPE4bGAaaEEJ8bCiNMUxh5gLR7f2W6lhb43ROvTdtK+GJ5bqtD
         wLvKMUjvi0TMx8TcqySAccmS8Zr6UU66hxConLxYgRYS0XsL6L03jESNevGKoSLfeV8p
         V4dBkQhIaSQxURT8vOLuW4G7OIjq4NjKj1SG0F3HdulW5e2X8K7Dgtb8bqoZ736SjV0e
         4rRMaN9GlYCakkPiNapVdYrQn5rZMqNhKJbt9cI9ydTvfPfCEpVPgsA9iRVwRUmhFCN/
         RCuHu+UchYcDmNJjVNCJt+0WDs0idWOBHE26BxmGuN7en4T1jAFkJuQ8UjKbg0ad10ix
         SvcQ==
X-Forwarded-Encrypted: i=1; AL+hErEjadzJJowqCSOiBuZOGbvBje+7D+YljLUT+hB2XfdOjITpj4WgLyYuajbmpn9D01VjC/pK67EKi+OnOlYAzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fzaq+PuBH04lKZ30lc1/GNkZMVb3Cv6yrOY/emmy9tB/hRh9K
	/kTncoNP6odxk6NCpEkDAZHAD4IN/4NK1aKctB6MScEG+PIi+843DVL4H4QyRbW7O6SONLiq8rK
	Go9cvloqSWkGhIA/NCkz2VXL0mquWiS0=
X-Gm-Gg: AZFdTZcZVLZ/RthHzoecykgNughwvTR1XIa7lcCepfEqqGK2FoBINsS/M1/F8zdQ/bC
	YwDQE2UDQp7kNNtrLdFgtd7f7T8rDshrq8WokSrRsWtakMD2+mYy/RfuD80oK8b5uFmdfQZ6xHH
	paI7QR+d24KMVwiwdjCCmaJNrWDPS6m6cbTWZAXnzKaaVdQaqMs2DBE8jtxbs/MdH29t3RjfrtN
	gHhZYNBR3dqzxVFWJl9+hndP2sRj4WWt2M7dSV5Q0wu9HBn/PhK0Kbpwi+kFrCGL8kCuHevXhsL
	xYvgdQOH1MWM4NDw6K2E/9x9uAFycXxx2ojdGRGLJUmQVE9+c7J+Yd1dKqC5o8gJ4WmTNRYVQYt
	3C2rM5f7W1HyFK3YlBJyWNItiioZ/TcEilvLJoI8J6t7pp9cVRXIIcLLOQVgClSdg83BjLt0cDK
	qV75BiEK8ucodLumJ8U603AVqvs/9U9lOR
X-Received: by 2002:a05:6830:34a9:b0:81b:864b:7f02 with SMTP id
 46e09a7af769-863152c7008mr31501895a34.2.1795880255959; Sat, 28 Nov 2026
 07:37:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-7-hjf3108@gmail.com>
 <179586537111.18963.10245502413702250015.rtw88-v5-reply@linux.dev>
In-Reply-To: <179586537111.18963.10245502413702250015.rtw88-v5-reply@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 23:36:59 +0800
X-Gm-Features: Aa3M54oNWJPscXWZs8zi94hWFXfb1bND3FAYAyjtVYYumPJ29ATNvdVSqGBcBEc
Message-ID: <CABOQOSVzi8rQk8GtKE9DL1GWz0VpEM3rfmDTpYy24HEyPGsG8g@mail.gmail.com>
Subject: Re: [PATCH rtw-next v5 6/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Nov 2026 at 19:29, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the update. Two comments below.
>
> On November 28, 2026 2:00:26 AM GMT+08:00, Ho Jie Feng
> <hjf3108@gmail.com> wrote:
>
> > -     for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
> > +     for (i = 0; i < path_num; i++) {
> >               cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
> >               cfo->cfo_cnt[i]++;
> >       }
>
> As far as I can see, RX can update these fields while the watchdog is
> running rtw_phy_cfo_calc_avg(). It reads the sum and count separately,
> then clears them in a second loop. A packet that arrives in between can
> be counted against the wrong sum or cleared before it is used. That can
> change the crystal adjustment even with a single peer.
>
> I think the same race exists on RTL8822C. Could we take and clear the
> samples under the same lock as the RX updates before using the helper
> on these chips?
Yes, that makes sense. This could also be part of a CFO fixup patch
series later? I don't want to unnecessarily bloat this patch series
too much, and it currently doesn't change behaviour for RTL8822C.

> [ ... ]
>
> > +     bool bt_hold = rtwdev->efuse.btcoex && !rtw_coex_disabled(rtwdev);
> > +     u8 crystal_cap;
> > +
> > +     crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
>
> So if I read it right, the helper returns the current cap when no new
> CFO samples have arrived, before checking bt_hold. If the RTL8821AU
> already adjusted the cap, a firmware report that Bluetooth is active
> can set bt_hold while WiFi is idle. The cap then stays adjusted until
> another CFO sample arrives. On 2.4 GHz the AP may only be sending CCK
> beacons in the meantime, which this path doesn't sample.
>
> Could the Bluetooth check restore the efuse value even when the sample
> count has not changed?
This is also an existing bug in RTL8822C, so same as the above?

> Best regards,
> Luka Gejak
