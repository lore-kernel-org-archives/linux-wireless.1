Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161484;
	b=gtqhVgHEZuOauF0KER5agkvSRoYXsTW4YhQuvSVnAw9YAfDA1NrGTjcauxkO6EQ26xRh
	 pXTM6Gn0vyE6HokFsiytYk84mcfuORAbnvkKI/B0s7PcPoPXQHK/mEFglv2DuXO2rX11L
	 IKXCb6T8V1oMaMsuAg5FLF2DmfmzWKkF/8QGVtkB1vyf0J175Al6NG7BcAMLp28sEhwy7
	 upTKHECIxNmHhLbanQq+vZhKqYQyxx6mAdTyhBJdlXPhPAOhyosg+C8Uf2hC0oHwCN+SI
	 xm6O90v/cX4tPftu8eDis75PLiTqGsbpSw3Y6WPDEHflYuimzbRqrzNH/bnwifhyIVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nWtMd7mcJlj3esorVLjhuJFxVg0H8dLuVjouOf85zm8=;
	b=tnp4/JxbkcLCgrGRZhDR8qCxMoDsHAHbyZv4FiD1fheMZZ4eMKNSXVJBOTSjtAVRu9nZ
	 UVvBoV3ZCXTV1QXymQe55x11nbgk+z+B6MCRgjjlxEnpVI9pElnudXFNarirN66VEkEq9
	 gkHeInuLCWnnAgvrRQpH3gqZN7Nyk7PWL/8iPTW+ATtU4rs0aKQHUeuXtCUsb8PSDgZbk
	 TNSTBRTP8gXkZRv+hBxXFO3ctVZD3RDzQ2Aulli8/QRdryEhNX8ZHFXH4HCdKy7dO3goa
	 jvJ/7pPzRHCQamzH+DRvWtwX5P366ZFHKAb2HL9eA+vU5FCdynf2oC327qFdkNl0SYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ghd4CTkt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4B606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ghd4CTkt
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6e560e00a86so113578eaf.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161482; cv=none;
        d=google.com; s=arc-20260327;
        b=PcUQaZxpPGFzKh8yVcJqx5/fGycr7CZjaOWIYop8WgcrKmP/dm3DauyLHbJG0Ekb3T
         EE4buiDh5VFq0z6j0osvnxSQ5pPco6kiu9quGzksb4vZkkswDt66DPJBWf1E/PAs9Tjm
         8odsNVC8Jcd+LbiPW5Ih891zdW/enHenKd/Gy+OnnFk01cb6zRAvCcrz7+WQovsc5v/f
         /cwqTOJHs8haSYVg8JXf/6ILkKIHO/hETTZgXc6zv2mn5We5YE/Jbvqh02PIvuRm3r36
         sfubbmkuruWuCnWWBOsiZayOcOD7ljg4FuDkXHXHBuZXWE3N0kK1+0iD8vec/hovzRyV
         WE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nWtMd7mcJlj3esorVLjhuJFxVg0H8dLuVjouOf85zm8=;
        fh=T4xa96obkP8z+g6gl3RVX2IrUhgGYFbs1eLdMFjlMSk=;
        b=D+wqyvfllzeA44xMzS3NSfk1QFZi1pVa8532bqzl6432XZbRo67sl/B+dBlmHlZfpO
         +kn9xj/QIb+y871Swq3hAchcmifrkcZOz25z9IpAL71l6iJAz/9qqR5e+nkX22NL5vtl
         WY4RK4VrZ5wjCnH5ts1ZYJwD0AkWjRiP+mGQyg7wGQEOBjKC+yr3TK2NrIdcXZKPMf88
         5kbPhs36H82AKKRoTXCCVkRpNoN3x/0yt7ju4UF8oO08blahcOHm5OR8j5dvYorjp96X
         rKhCxXQCKhhayCZNp7bJMyeEiH3SBz4FDDeRw6ei0DjzlrwSLg7itkVRVVO4Wqdi6aW+
         WvpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161482; x=1794766282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWtMd7mcJlj3esorVLjhuJFxVg0H8dLuVjouOf85zm8=;
        b=Ghd4CTkt6FjFysQd/Oqs57sigUVlFG9/t9npRvA+kQQ2ocoL6rHRVyBb+Y6tYyS5lI
         BJMWbcBQyISzIpNL3H1MTPxJcIumycQXGiIrPM4XfiWUQXjR0S5iFPFBDXFgngUSTypV
         VZpsMuZdBYHhk0UNeyLk5DZqeXn5C96bwImjNktcK8upNxa4zuCehgToMBEp7THqTmEF
         AsXeEs2GFw9ufthguUgmKTacK06CC8VK4q8DoVFGYfI2Yx2fhtEs9Mnq4GwvIpqKojtp
         /RR4ZmgLRgD4KOCD3jyFhAqovVQosg4MJaCRGprYgYXgydMOM5aIhw2p5vQonX7jB9E3
         VkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161482; x=1794766282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWtMd7mcJlj3esorVLjhuJFxVg0H8dLuVjouOf85zm8=;
        b=BZQZZ5HIVBFJxN33WjwlBfX6hGiQmdM8nQVniLT1uWzJU8K2nbtZ8yTtvLSWiDtl9M
         Aacn/vzOH5M9ISuglM/WKCSXMti8T4dj/0KKPXUraRaLGqDsnOQINSEuwDqD0Otr6FjI
         AB/eCcYAuIuhAWwIV6B1OkmNcRdjpFxXqcnF1GfjrBzXP0c8L5HoEVGgjYOx9HPm7bF1
         qekKvsdc9hr9OjrRJD/QhIO5mpQtQQyRs/AldQQpBM5QHiMguxlrt4+eCc89agHLYB2Y
         nd3NJXfPppZ0NIIn+q0RO3bY0tkkRJUPPFcvUQcFpkKYCEFCKYe8UJqAlhea0/tA80mq
         Qskw==
X-Forwarded-Encrypted: i=1; AL+hErGvCOCEtPeWMq6FNznq3/qA8+0TpHdiYV4NBA7cB3b7kAzV5FW0oWRQtxJ2e6x3lXH9HnU4piAhHUCDt6sNBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6XE/fOXJoLPEgazRKn2120z5nll2Zbm8GXaYtSUiU8QmrH/V2
	F/JnZ8HkhWMhkpjPRgdA90K5k8f33dorhW0cQM6TIRlNQU+uyOAT4wk2ih/6QIea/iI5BQGF1YJ
	BNHYMHnkIzyuItUXcpW+fHiX0ciWLK3RkyTDYyvI=
X-Gm-Gg: AYBFou0U3iAdho4loD3B6myqHWZfzUR+DTVzM6aB/u4+SryvaqjuwxpKepdLCxNgAVD
	ud3jCxDAhI6q0KgsYlDYO+CiP3verymJHbmoUjpS8diJSg8r3XkHmXVAdPnqMfTLC+QqQTqu/FL
	cbK6c/wgWTU0nHRLh7R5fXunOBP0h/Qslfc0jytvxT8PxC/qi84rGADgVNyArc0y2idVGgIe+K1
	U/7uoEfRbd2O7S91QZ9J5506qMs1hu4qbrTPqxtuvMwt+pJ+WT11FuVqb05AkT+IkFNCnSJksP6
	Mns8x/P0eiyHJ9wCP+ZfjZ2KHxvMVNncQbls8r+C1ZXBWkyATAxRq1fNbrmWQbOHn8z/nBMJ95O
	FOBw9H7DgWbCUKedYBy7tjb9ITegP5G5aOxuFfx1lCLdo9mDvn2emNgpy6Tc1iLQJ86208PObQt
	ojAd7bDxYKGW8MKg==
X-Received: by 2002:a05:6820:811:b0:6f8:22d8:6549 with SMTP id
 006d021491bc7-7170f1cefeamr961861eaf.9.1794161482472; Sun, 08 Nov 2026
 10:11:22 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031070950.425176-1-hjf3108@gmail.com> <cf3ac5de969de93866dc9221521443608bae307d@linux.dev>
In-Reply-To: <cf3ac5de969de93866dc9221521443608bae307d@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:10:45 +0700
X-Gm-Features: AclHuK-8YlRIu2lSQEVspCPQ_elPI20g7UVHnRu6hroDfWb_bH6Aa0YpVjpQxlo
Message-ID: <CABOQOSVYK6-70z-qOj1y22f5TO4rkg82cWpqU5vzAirBfqX4hw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 0/7] wifi: rtw88: extend 88xxA support
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 00:44, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the v2. I have a couple of comments for cover letter.
>
> October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:
>
> > This series enables HT STBC transmission, VHT SU beamformed reception,
> > carrier-frequency-offset correction and adaptivity on supported
> > 88xxA devices.
>
> There is no changelog since v1. Could you add one to the cover letter
> in v3, with what changed in new version and a link to the previous
> one? It makes it easier for reviewers to quickly regain context and
> makes it easier to track changes across versions.
>
> > Tested on RTL8812AU together with the driver-frame series.
> > TX went from 136.0 to 144.2.
> > RX went from 215.5 to 249.2.
>
> If the series you tested with is the one that became 62e69ef45567
> ("wifi: rtw88: usb: don't report the aggregation buffer as a frame"),
> it is in rtw-next now, so for v3 testing on plain rtw-next should be
> enough.
The driver frame fix did not impact throughput at all, so it should be
fine to keep these numbers.

> [ ... ]
>
> > base-commit: 9b0be45d4d52fd223994e151f169743a97abd290
>
> v2 no longer applies to rtw-next. ec2baa4c9317 ("wifi: rtw88: Pass the
> physical map to the read_efuse chip op") went in after you posted it and
> changed the rtw88xxa_read_efuse() line next to the new code in patch 2,
> so v3 needs a rebase. After fixing that one conflict the rest applied
> for me.
>
> Best regards,
> Luka Gejak
