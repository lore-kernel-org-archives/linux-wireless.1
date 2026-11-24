Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551254;
	b=o5NCn2iRINMG9Zx6an7027E+e+jc9IobaDwy4v7vl3eLIOisHZhH5KOUgz320vi58LpA
	 xW3LqGtNc+iDuuPlHdvaV42m/5ZMFCAVRnNtRhbMZSJUNoDxZd1rgYJcTGWnDPAaYwO9E
	 xtrmMe1sZWLpwOlgoI1RNJpcrBedh9D8HfGsMW9Cst0zrvBILQqUJpVjbR2wwlZOMcO/B
	 K/V8CSsV+a2Ae36beOQ4IemTQjhF+qEtdmP6rN5ThCnp0MmhLUi7TPmT0TOwFqp9WhM0U
	 BEnisnAk33W48IMTYZqXR183EYjuNTgvVhP6RADX74Tfb1RRk9XDeUPYh9rlAPtYKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
	b=tPIWrv/8upVukMqzFmEoVIUWe9J5GxTqJpb0WoT/vI9/wAKw6pBOONsZ8hVuEs/kPHuR
	 nhCgq9Co71D5xhlc7WhSlXzH74NiCe1fT7x14tCap29L49LRo/1MyOACQOSIyyhrpoiEi
	 kaVfVKT1aGH6ijWQG0eO2mTO1m3XgYpKn8/mr8/wILIaUngSWQqLnvxUz98H7Fv203Fzm
	 yG11QNrKG7AYLuE/cj6Mxadspz38J0P311hxwJOQnXgnbmvW+fZaUbT78o7iqz/hdJIC9
	 xzQl6XNKVoFiitVjyv3g2OkuLmGZz/6lQVSVNANiWRjG8xoUb7OWHUQ66XAKPpFDoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JLIABCZg;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053E60A2639
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C053E60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JLIABCZg
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1b3b4944a0eso3719114c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551253; x=1796156053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=cwQM9dejplUvA3YoSSWCvR7n0o+GOtdfyy71+Mvo9lfBpwPYSj3wceZtbL+4uZau1c
         WOgrr2Si0GkVTIskHtXlyT2jynIw23255SDnlErZxkZ9bb6e72EUwtpt0h+MuvlV1PCh
         IWUVlZmRXyojWhyAAAYoSqAD6h91r1dKJSnVV+gJZyxOevO9N4dolU8HxC3kIZuqyKtK
         AgSvb/ddxTuHJquIAW65L6bgS0H75G02bm3okWjnwFI7Rd7NGw19tIMAbEquzsFFJ8hk
         lqCjnIhw+UhDSaeJ55uvZDVZYwzcyjBW9ox66aPvV0tj9gMopvmnOetSanK91Ncee9wm
         SYNw==
X-Gm-Message-State: APuU4Z++pNLakRGKbqUEzttTIsCsVeJZhlMRb30yjHEWoAArNUj/yghY
	Tq+PgeIekjYlreTOMFa3TAPN18t5FN412RT4MWbCypd+qLoXgKAlnUpfeN+YVnWPOEyPAZiS76G
	B6JUgLZ2xc1JYR9kO+X9/6WbFOI1dp27lMj/C7YlQqu69y6v7zhgic3hqPHcmi2bQbAnbQdkV9C
	CjtRGyPcqpF62m22lRUBsP7CAjnASa+EPHGMmWen6VLiFz5OiVMEnWrwu8Xx7OZZ8B9wJjgpbEl
	CJQQj5F8p6Uu5OeeODtl4eAR/xP
X-Gm-Gg: AZFdTZcS6noQlCeSpkjngbEsw0J+HLIX9Zb3Xy8PaG0KDoeE9xvQb5ZlVWmpD+YMwL0
	8XG4kSkFJT4h3vvAG72uITbL6kc2F0CRC348S+26DjMWsOPIuaU8mSZKjsUHAQIvdf4FzHvyHAd
	vxDwcxczgqOTm0dIqnPfSSsGnrkTUpbTmjFZowDBsByBwUh+RlT/R1dVjDxWHvImisxA+SX9HPy
	JkZZVk30KX1E5svpIEBtTwZU5WtTx6wisSK2tXI7pZkjwOQCNRHcgF18IgyHnyuDGPqK6VLik8S
	8+pSHYWjFLT1g8AvqleSAKrH/hVua+odu7Nhf9ssAOwFsYUHHdl4a8x8leYz+Sc4vZhgFRO2bHZ
	D5MH/6JFzr3p2XKY1wuVUYVX7hjGvmZPfg0IbiGwD1yR2tdBu1+qbaJPXz87u7u084lPtxwyf04
	Hb3mMx2R5ZGzTsNo8jrM0BubmEbF5FXvFX0TVQIOA=
X-Received: by 2002:a05:7022:3f01:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b55689f73amr16769722c88.7.1795551252665;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b5568217basm104272c88.7.2026.11.24.12.14.12
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55ba5fccc4aso3670881cf.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551251; x=1796156051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWMng2gK46ULOr6GYv+vGFXJ5yN5fj1a7nEoF3ogRLY=;
        b=JLIABCZg6FmQE9p0McYwhgWDXIjy7OJU7Xqb+ILlp5Njq7ZOs4RA462hofAqLD6x0c
         nJ4Ur264TNVsOXG9GwYCo5/gdCc8DGbhEhB4bb/TrJofMJ68g3JlzMtkb9jKCzmRUFpM
         iFZZ4RUqTNJ968QWcSs2b+Tf2zs73LELR+p0k=
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294513261cf.49.1795551251292;
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
X-Received: by 2002:a05:622a:1aa2:b0:536:702c:f8e0 with SMTP id d75a77b69052e-55d76a5ada5mr294512731cf.49.1795551250673;
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 21:13:59 +0100
Message-ID: <20261124201402.3499613-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-6-rosenp@gmail.com>
References: <20261111042554.232998-6-rosenp@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:52 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The protection settings (struct brcms_protection) have the same
> lifetime as struct brcms_c_info. Embed them directly instead of
> allocating them separately, removing one kzalloc()/kfree() pair and
> its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
>  .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
