Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551245;
	b=Rtd72FBHs/CfsU3q7aHL5K5w3mYdsCkP8K8UhFDPOQd185sJRrEjPI0NQoO2hgW0sRts
	 ntrlVmxqFUd9TpBa93obLwGgU5s38HzeAgRhc35ehIa2TFB782CKf73BmzNNFIcVDEiUI
	 UlQXV8GuDen5EjoPD5w4HbtE211q2JeWC6Hh2xykSFyOUrkxHzigR5jwNpTBHpdhpI4Yl
	 yM5lFloXF5PJCqslCHkQjd0BPGOg4ueKV+Ra+Vy75tyoLxgDTYD83Tj+tyNcpD5GTkTrf
	 +3/PilQAEh9cJGh+4oV+AyTu6OBHOvHvhY8NddXHrerjup+fthCAYq8PhQ/2BcMZT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551245;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
	b=WzdJVv207gNFbY9BGnqOs5eyjLdNtslWax1JEWL+Tp+cPdhTH7oAMzAeY8R6cUKrDFZ6
	 UblhYJ7cxX5B2bg94BOtPVRDK+Ce61/r8FqNA/fpFlS29n0XxVh6hPLAE8UpWvLdcBZi9
	 pQ5ioMwtPc8Ic3b+RFfnSXXprEXKKwh18WNJMcEdPJughrsGoSW5TdTY0Lt8PkE97rkfq
	 wamIHYRSqmzPBMI6LSZRhpZdVGvVASycoPnsybCLMBP0dJdu9XIKJmXyAJLMqz4YFpe3d
	 EmlDgzJWHyKA7VfgfsqnpDLioSddVXvcz3YYXhLeERpKFbI/XBSqigacZ1QXKyyWYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsA9Klxn;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA266606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA266606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EsA9Klxn
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-921365696d9so34822616d6.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551243; x=1796156043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
        b=oLAh8Bi6MK1et1EeFOIR9L+gEmoWYH+M3KhUQos9sDNiCRFEZi7lLLU3atkEoPmd9p
         rGfNT0uahqjIyBtok0SLkpVJ3ZOw4C0mRP7T8Gv8ebuNcRXobEBt3OW+1Y9SV3X8dzL1
         lOwN4mgM2nZP6801eAf8JLb21zNXMOsjmyZBDDt5c/ZfyKdNnamYryqs6AbvfbyXW7/I
         2lZ18HqofGmvMOrRF72nw0SqO1X+xTVf2mL1mKGXXixKs6y9gidJ1eUntt4Q0jPDtD/M
         +6BJwTALgdVEQKHkATprjapfKL9msiix7xwQN8tNCjYuu3et8eSEfV82Or0LzUQpe+Kr
         7U8g==
X-Forwarded-Encrypted: i=1; AL+hErHtJj1PrIxUKd92yTFfxdU494a2uk+/ScfIo2SJ/2MhALG/pE5Z1kHl6bGPi9BgR6okbQlBuwmqKJXUAMpYeQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dwRlq7+EkHkC26YkErNgmaczfEvKRUzfDmLKMxgC/8SAkNMyz
	X/+hV3GYqlYnfDsVL91cV5F1BhM6TSBkTd3TDGlnCcpzZx0ryaLNsiQ2tOz2OkAT+Pw5TJS6p59
	IoqjX0IalShqpEnTSUTqnN/1isQsNntd4X6m5+s84Zspt3T9MDh0/VyYfiIvFCZmJGoVojJd7E9
	CW1ZoLoKKjelKj/CWT+WBvafe7Ob8fdUFHiLY+RbL5HMK8LmdSui5V3TqTwUtSaHPxH4BaNZYOt
	cJlQF7CtSa7fZrWUJjqNVartYLU
X-Gm-Gg: AZFdTZf5v1ohmQQmxfKwvAgms77PaZ5E7zrcCyUPKjM/QGbDnQDGa2HtZGQqSEDyzW9
	wpoHUSt6S+Qjuoarw9hTThUx2PmqmokVU302FZnTjT+iNW6M5NOcOVgl1SdSmEt9d4ONIZteKsR
	nCZ+9rwVGJvcTIZorA2ZpmD3kN+7RESidLRZJihhs8UuwiUgR4QS5WeO1QRofRQefjyiUJ1qCYC
	mIGz5zljp7lAuYbV9iHKCBfQ5PKLBISbIQaPO8xdN+vpp/6u0gTVyM2RclS44zQ0s66YR4D5NyV
	dLdtITXr5trHE8Lz+fkSykyp2z9eG0X1+uK4BYChEpC1zKHG52NfQQUK7phH68V/lxvFRNp2d4S
	zeLvuZFgJfwqPWBDOC2RyMoCxd8ct6eLG3Wn1RXr1JW1oqHjZ/NWC+/T/XVfT4z5y2T/i92zZXu
	3aC0MHRy3Zi926L2QCC4kUJhS/hKpC8rt3VtPPD48=
X-Received: by 2002:a05:620a:46ac:b0:944:3c5:ffd8 with SMTP id af79cd13be357-949ba9f610emr3089854485a.35.1795551243295;
        Tue, 24 Nov 2026 12:14:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb39eafdsm114330585a.12.2026.11.24.12.14.03
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-542fc619afaso60391941cf.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551242; x=1796156042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtbqCWcplP8s8TS4XxS3H42+jZhVRK/WEZW5XIZ9ues=;
        b=EsA9Klxn+Q/y106PP2cCt1oIAmkdeOy89dF//oTCBnZmBkwacwhkEJqXikg8/lUb9r
         f8gkhuMl174WemRY1o3X/buRu5ByJJu1Ltr8vbvRw9PijMhq10j/qn8hbqWtpk94UJLZ
         hdoxxQnUYFSYdQITP5MjfUInRkzNobLDtF2wI=
X-Forwarded-Encrypted: i=1; AL+hErHJ3BjfPWVsv2wFNhRx3Za0mGJ8dPx3MEfwU7cGkHW1Gc6htM3MwekOUuPbJcGvzNQSTH2sUTa295hsdebsTQ==@vger.kernel.org
X-Received: by 2002:a05:622a:ea15:20b0:535:baa:a78d with SMTP id d75a77b69052e-55daab921bdmr54306151cf.10.1795551242413;
        Tue, 24 Nov 2026 12:14:02 -0800 (PST)
X-Received: by 2002:a05:622a:ea15:20b0:535:baa:a78d with SMTP id d75a77b69052e-55daab921bdmr54305701cf.10.1795551241893;
        Tue, 24 Nov 2026 12:14:01 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm136284651cf.21.2026.11.24.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:01 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	stable@vger.kernel.org,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Benjamin Drung <benjamin.drung@canonical.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: fix use-after-free of the watchdog task_struct
Date: Tue, 24 Nov 2026 21:13:57 +0100
Message-ID: <20261124201357.3497730-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
References: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
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

On Fri, 20 Nov 2026 18:42:27 +0100, Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> The watchdog thread exits as soon as it receives a SIGTERM, also from
> userspace, e.g. when init kills all the processes at reboot. If the
> driver is removed afterwards, the reference taken right before sending
> the signal by commit c623b6358088 ("wifi: brcmfmac: Fix potential
> use-after-free issue when stopping watchdog task") comes too late, and
> kthread_stop() runs on a task_struct already freed.

[...]

> Take the reference before the thread is started and drop it with
> kthread_stop_put() when it is stopped.
>
> Fixes: c623b6358088 ("wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>  .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
