Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785884;
	b=N4LVlfZYZEABJXrTAEF9xBGd5pezrvrq/TjWDGfwxXKDeACnWmo1zRl/dn5NDilT0Cgy
	 ZREE4UdE51QST/GnAXYubHb3LHnhzRU3GCONPIxvq4b8ESYG1oOeK16ziJOctPtQ3cjI5
	 hld+jAWDCRjvGyDqLlJtDhmu/YE89rfw5MksoqSJTRjmWdoJ2cym1K02kmPNnGFtI/ac3
	 7ynK6BTLRIlSoijvh9kL8cpWm54K8cuvQhd0mWOV8r1nHSoei1Y5nSgVFkXsJSlTTfyoW
	 vQu/FMFx5CQkzp34aQ0+XyE8VPxFAAbOPDT7M93kJJvKYXGxfoY8/kJlI/6YtXMr8Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=3HIGuCLPoqoyO7aeNmC0Cmq+gWF743WvuTVY1gED0tY=;
	b=EIZyvj3enJq4YUfz4ofg0uSrc1CzUX9ZTYH92xCGOmiy4CNooK3U+JQA+KEupzRBZdR9
	 YLUJU2MnzWG3A+lhSlqyiLQZhPHIf0U1NuNhwbtAQMmbEnSsvDbHyoJMTGoWyie+ZB0sO
	 93sv07fhERIjHXnBszKpk29ENDHBpgG7R7t6OUSvL2IHPcfAZTpQ5fKFMb54pl9Twq540
	 5rYfbDzQrUeV/hYbSwyj9WZ9Vjz459QqIqnsIlPYq9CtWrCBipIactnQbE3QQM9wlcp/+
	 HTfZqZBSArZJ6JcwecnpC8PHuespihb5vPOZD/OUKgtmTAQFkLtjqRCHoWA9rwAG+IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=040ctfi7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC704606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 13:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC704606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=040ctfi7
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so9491495a12.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 05:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795785882; cv=none;
        d=google.com; s=arc-20260327;
        b=AAyobfwCgbg6QtPHD+2qQ3s/IoHp7ZWNApPrdgrRX/abq8P3rK0od9b5g0iqZp3UFw
         boUZ7jWh74B5DfyhsYSrtQ1x1CKLE2LlndzIGSwZ8oO1qDa40DEtiGav5VVeaaX3domt
         XcR1veBPf9xOSicu5tQy4T65eJGXkbhRKEGAdGJNtyAL5xyaBM1qk4h9m34C+BHf6PN+
         4BFkxO4bTKUIuvpFAlmJpwLRa/8ArLqPPpgxAfwOzfEALubaRIcEbxBVeSXKb+uzltKH
         XsRTEjfpx4qhvXizR9dvPE9rbPB5n+bq/QD6kmNLO2nHwtTT3T3hkVcDzgrMgAIecLyj
         UN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3HIGuCLPoqoyO7aeNmC0Cmq+gWF743WvuTVY1gED0tY=;
        fh=38VJAP8G/428kp5fKyrjj7pNJY+ZIKr8ZXIhzBk+zeE=;
        b=CREMUzUe8VAb87Zky0KVGRLYGGjH1FWAIApFYx1OrAk+4VgsNbPxQ8EyPuiLS3Rt9H
         BXrv8yn5Eob2BDjQyL2DlOb6WGqbb7TUc1BsV2U5mCg8lQdtK4YgVTmuMEFYdyzIGUYM
         /PMruF9s29M1wXZjSMOXc2+j1Ww/6VKoGpSzAJiW2m62lk6G1r1+5UPUKntin37Zpy2e
         /tbcy667nV4RG+eAiQSMibGvzkAb6vG4NA1YjIQdY3ftWECCLsAa1Hkff9idk1/wy0kF
         t2ivBa8Qma69X32lg4N1oOAg1pIruMrI40gIAT71uBetvENuG/9lQW9ZPQobRuggf7WS
         0ccQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785882; x=1796390682; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HIGuCLPoqoyO7aeNmC0Cmq+gWF743WvuTVY1gED0tY=;
        b=040ctfi7tJLGoAKz9nVmPjzQ0mR9tLlS94HDP2Q/mgIKZz7MviLZhvlnELrt4Qc7fQ
         +E9OoPSji7B14VnAWFm7trb1rEXonjwHuQekoZNLUAy6SqgtlrcX4jVXnt+KyyIdu0De
         uwDSRsh1dyN1ve07BIdFQF2lWpOJF7716Css/BsCHxaCXdMVJl7km7mA4BR90gjgAUzE
         YII/8yWRqgDnH492lL2xBCisT3BDtwbAWAkpi9TzihyRKOKPOjiq52PBFWqaKSYqgwlf
         pBnhHJV8Fba1TZAQSodIMO624kl0pvcjgHLmch9WssJw81vrrFhn7tXbqW2TqK5kjSH3
         DNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785882; x=1796390682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3HIGuCLPoqoyO7aeNmC0Cmq+gWF743WvuTVY1gED0tY=;
        b=Hhu5zD2YAWbMiN158UAC0vFlq2MMA1sTJiVj3JEFpUktp18L87SZNfxuHxV1bo5Gvk
         Yo/NMI8tD3Ykumnfx4luXCrWQfGE24NGqTUNlTnM2L2RTO3JuuHwAdY2kkTkI4ktvJs2
         izLVqwWXRoVFBgumDsjwJzHeZ9pvvjPjLbTwOuNvivZP7NHrvYu47D49gD8wpzM68pn9
         Y7mdWE00HtBaHhlBSoXIzjDdvTeUnawFtgy2Er43sqdNB95kyQoeiZDDEobedpvE1n99
         5LfcDp3b5pDg8N7gzCNKtEmYyWY2UtMlF4WOcvIShls/619zfgTTDYsEIHSLvZRfZfYj
         aiag==
X-Gm-Message-State: APuU4Z8VI1yHWRFPZwOCEGT+ufxX/HiLAc2wqeSMsMZJ3NW7K+jbJpSm
	kmhVxnvbm9ytjIfgg0efceAiunqrGxyl0QlCjfzIMg9or2rsBZjGyRHaeevrPCgfh2W2LXbBtVv
	D8LaThuUtDC79/d7KhonxL8kb5U5IdJI=
X-Gm-Gg: AZFdTZfaqttdvb6S7J2nBsi2NhlDM26RdOfYQuBkREQRmkA8xavWNlBCq+Djrnp8TXw
	9/thGDK+eBA3EyEXBe7Ybp49kd63iLL4kF429WbiyUigR/qT4+DG6jd98E6MqMWnQZUU9fAIFTU
	MuNzxPFP0z6Bu06PrhTFE4Bsf5gyUX+bEEvpRtwjcifBBCSrZjlPKgr49Fg6ng9J4c3Kh0BGfhI
	fg4F4sfECWSrjBzgbBktn9pJigteq1xM+vX6Q3fsimw22xkFsuwK0UvQ7l6+d1IWhAif6kymW33
	tBI7alnUDp6qMrV9A1vCDtVZvveGtP6aLWI65+Rj791ta2SAp1j9P+wjqEpDhoWG4KrJfwCnZly
	7MDhH5+LWGwg9Qvy6gSc020uG87axcPYFOzgxm/qkGEQvKAkcde3XlDA/DvYaswa62PGsx7Yy
X-Received: by 2002:aa7:cd65:0:b0:6b5:823f:3462 with SMTP id
 4fb4d7f45d1cf-6ba37e83f29mr12826008a12.19.1795785881731; Fri, 27 Nov 2026
 05:24:41 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAOL0-9i8wCt+AJru1zzae0ir+UKYU06kB+6P0VMzxrTZ8GHc4w@mail.gmail.com>
 <7517275a03084caf82fdc90dd05d161b@realtek.com>
In-Reply-To: <7517275a03084caf82fdc90dd05d161b@realtek.com>
From: fan ftdm700 <fantdm700@gmail.com>
Date: Fri, 27 Nov 2026 14:24:30 +0100
X-Gm-Features: Aa3M54rXUrsPv-s62aoYmKbqjFOPsGbmeaTb_FqNGK6uu2TlKTEdKy39tXgKyG8
Message-ID: <CAOL0-9ibmxNz1WvbghteUbK14HvB3ZuqUaSt1ycpLEW2FrRu=Q@mail.gmail.com>
Subject: Re: [BUG] rtw88_8821au (TP-Link Archer T2U Plus 2357:0120): auth
 timeout on 5 GHz, scan returns nothing (6.18 LTS, 7.3.1)
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks again for your help. A final update with everything I tested.

In-tree rtw88_8821au, firmware 42.4.0:
- Bare metal (CachyOS): 6.18 LTS and 7.3.1 fail (auth timeout on 5 GHz,
  scans show nothing).
- KVM guest with USB passthrough, Ubuntu mainline 6.14.0, 6.14.11,
  6.15.11 and 6.16.12: all fail (0 networks on 2.4 and 5 GHz, no
  connection).
- Stock Fedora, installed and live USB: fails.

I also tried an out-of-tree driver (BenkiNew/8821au-maintained, a fork
of morrownr's 8821au), loaded manually with insmod instead of
rtw88_8821au. It gave no usable results either.

The adapter fails on two different machines. It did work earlier on an
unknown 6.14+ kernel and it works on Windows. Since an unrelated
driver fails too, this may not be an rtw88 bug and could be a problem
with my adapter. I could not test an older linux-firmware.

Regards,
Sentinel

pet, 27. stu 2026. u 09:17 Ping-Ke Shih <pkshih@realtek.com> napisao je:
>
> fan ftdm700 <fantdm700@gmail.com> wrote:
> > - It worked on Linux earlier (exact kernel unknown) and stopped working
> >   around the time I moved to kernel 7.1. It also fails on 6.18 LTS on a
> >   second machine.
>
> I don't have a RTL8821AU adapter, so I think the easier way is to bisect
> kernel. Ubuntu provide pre-built kernel [1]. You can use them to address
> the cause. Then I can check commits.
>
> [1] https://kernel.ubuntu.com/mainline/
>
>
