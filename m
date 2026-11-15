Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776593;
	b=QuGkfa0y41ZId7WuDYU253fQ0EcT/4Z/dhWH+tSfd7m21Zh0khBKJksSWLWjAkNQMSch
	 gYUtHUQWyJrwVtkmowrzJCK5JBLeOV6Je78PEsbVUNxjQO2vX90YftWYd2jkgpYrK9u1H
	 z7dS73Yh3C6czsoVeDC9QHlqLIMp/VfksTGuq1TvaOMqWzfVmMTmC3NjGMTJbqEShCwqu
	 Y61IMx2PcA43REuNreCja9NX2UTnRzzF8J58ZQsB+5r1lngjHXMok3AU3ZyEbNiE5yuI3
	 sNTqCAFROtcj1ScBfHE1H9mfbUHXCPlUGCBGIUZh4I+1dOOnLICiygDSY4d0LlaiHFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776593;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
	b=Hu8oepADvlnaqtRYmO5LzewrTpYuoOXetY5qmJ2rTkVDk5eJg5SUHVhflWFS7RrzuRGd
	 r0Zgi5Soc9lbD3f6YWx9E9YWUwzv9TXyh46FCCOksm5PyzPhBTig0vYN6CutehZPtDFzh
	 ZH+p0pWuZ0u2yT8UjEHjlad5vchFF3qJHYRnrZ5yA/3gSg6ccv90gEe0NaPBLMAsjoFeh
	 bsb3HibTyE8BQ2TtReIT53MTjgLZzp+/JzrABlnQiM93FsuIxrmwL+ZpBvJNbUjeM8M8M
	 DbzV3HiEMyJI4huWPc6rMjCY3ARaDzWuXW8U0VxlCGYq4hv2l5q/UzwdfB/EFKU4Y4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gk0lnsvA;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD4606A331
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AD4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gk0lnsvA
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso974189a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776592; x=1795381392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=mYzaAedEhog1lXA00wKarUGQRKJjNawUGlYuomrW8ZMjG78l7jQ+nsJIx6FfwRs7tU
         bNee3idMGu3UOvTATgJ4GhzmQc11bN7Z80xgR/PWs0oU/gtfJuLoQX3gDE6eI5zFN6D0
         6vflXt33u8eyEJz43X0RAjUHWS4r6u2p3+orMSB3V8X2C2wM9GAlpuRN3ZRPIpjjUq1h
         z0Vg3QstxVtmBVDMaviwcddqFyZCkVxDy6WQTNzTgc6hfUamQ9e/XBKGo3DzogRDy6oh
         utdvsknJUQQ11DYj8HejBWl7eBoSp/XfW0m6F4+EqwWWAKKmqs+MNRdlJ6z6tDfcMhdx
         u7wg==
X-Gm-Message-State: APuU4Z+H51IV5EblPvGC4Lwgsfj4mwMRWhgz9dzXtsjR2bWJ3rNks+EP
	66b2J3Sw12x39d3k7fNnJOaoJHfP5tYCO5nR0tliFcoIhZE26Xu0PlwhYOKs9isMRe2Kyk1pYwU
	TyGam+kggn6K8QdA7glSZr3G7yII7rfVksf9+A9/J8po6JaZRTFG/eSPehaNZGYfKVWc+qNEDBK
	6LnZv0mAG7aiMWhMnbDy9xUNIpVMhZ7YQww26EOzM5lnBveV7oc+o0oO/kWVgNLpJkp2lHuWxvn
	BnixA7tJhIsHxSCjoi1+xikGvAm
X-Gm-Gg: AYBFou2zH2e5GhdqhETvGvFx4Z9x80qyQwO5PKyYl+J4kBGv0qM/FwAusCe+vuKQ6iS
	h4EIeE9kPiZCHQcWqNZbqY0wV39DaxZjIAyJl/2QCIb1JRZHhTAdY7Fij9CGyZmZcdHvpiUc+Zg
	FVfozq+ybfKkLJA9VF5ua3cdXpdPzVnzLQj1bEa+7s/Kuz38dnXIknvLVaf9qoSVhXMMeuq4Bmj
	iITGvtVjgqIerrAAtv5z2YSDzjJPixs4OXA4m/NtQMhTg3QdiOE4D/fKCMZYvpUpUZicYoUoDaU
	sDMAo0xfhHDnPYLrMSGjM48V0MmoBEIFDsDtnA3dc8TteZw/tmT56KLOI4wO7ro6RekixxhaOL9
	eIFubf53JbLj4PraFpXB2NSCJNJY7/mhuiEtgTzCN52aldu3OtZnPljWQ8KOvzagELQaCL+Hq1d
	cC8UvSslFdJsVjU01aAN0sq0AdX5JQV9LpWa+LKgY=
X-Received: by 2002:a17:90b:3890:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b1b0a4c362mr7366315a91.32.1794776592072;
        Sun, 15 Nov 2026 13:03:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm12439041a91.1.2026.11.15.13.03.10
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1162897eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776589; x=1795381389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=gk0lnsvAfYqWUBl/gOh+EmtoTgwo3fodsdsO2GzPSIGsc9j4E6rY9FRTzHGWNmNmK8
         /tDdzPe0snOmkw3bKvLI37xjOEsmxTFU826kMzDh1NXTGyTeNsUp3JCHLv2h+Bl0iPzL
         3TVArru5jN+X41F0mGZwoTgypp4vJYJeSily8=
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857531eec.40.1794776588827;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857506eec.40.1794776588102;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: use a 200 ms power save timeout by default
Date: Sun, 15 Nov 2026 22:02:52 +0100
Message-ID: <20261115210253.883721-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151626.70737-1-dev@deq.rocks>
References: <20261104151626.70737-1-dev@deq.rocks>
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

On Wed,  4 Nov 2026 16:16:26 +0100, Andre Eikmeyer wrote:
> cfg80211 calls set_power_mgmt with timeout -1 when userspace leaves the
> dynamic power save timeout to the driver, as NetworkManager does. brcmfmac clamps that to BRCMF_PS_MAX_TIMEOUT_MS, so the firmware
> stays awake for 2 s after every frame in PM_FAST mode and rarely sleeps
> with the background traffic of a typical network.
>
> Use 200 ms for -1. macOS 15.4.1 sets pm2_sleep_ret to 200 ms on the
> BCM4377 of a MacBookAir9,1, seen in a trace of its iovar calls across a
> sleep and wake cycle. Measured on a MacBookPro15,1, idle with WLAN
> associated:
>
>   pm2_sleep_ret 2000 ms: 11.2 W system power
>   pm2_sleep_ret  200 ms:  9.2 W
>   WLAN off:               8.8 W
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
