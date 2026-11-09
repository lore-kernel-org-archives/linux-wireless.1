Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248420;
	b=IRUpw1AphsOvP/Sj19S+Zf1rK8aLaHhMcj42LY9iVH9pL2wYSgoDwpKk+2RBgHQNuWoa
	 P365Hrxe+CiUDs2mcH53LJiDRWuHZT5FfHZw24jFAZw3TCiQIkI+dxtvPyQlZWKDCtYI5
	 wFlwEW0RHNQdWdNJy/DsIEuhJ4V8NXii1NnGicvz+qdKS5tAe3pd1+IbM4b/HClZDM9iN
	 /0y1AjtlVtYjWjdvChFuVOVCWYU3uMcmlYNRf5sFlb3TKevmIyGo4nN+33Htvh8kkXhtO
	 Mi23vyU2LJZ66Tl5qdZV5CzmksEr5Z38YzSCVSZSPCYP6IU0/Q9g6Uuv4/TP2ZS/s5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
	b=D2I1GStfzjfbmZmHvliyAfFZMuytqErvloyHvASqa4NtLmyMzpCR+gF28HzJlzpfsjXF
	 937ORuARl69Ei2EIpuRWmmRVAFAQAW/+VCRj0hH+hTOTXeMLujkVWDj/8SKmSHuZI1i3J
	 0dgk2ZiGHypuHXGAQT7jiVJ6W9xmwmClNDEmV0rrOEwH29arz3nQNPUXGU2iVLDN1Qhcz
	 BFTJWqvtPvTgF/kbfteS0qRn9OoF/N8pCYPTNZ0/yv59jliFCzo26VrH/of3m5aqO4m98
	 8HOPIezf7GkCVALumxRBp942nrVaUva2VAOHwpbGHhNY3eMHWSSOaozWrZIFjmg7N/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwKtwE6x;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA8606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwKtwE6x
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so778836a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248419; x=1794853219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
        b=BwKtwE6xchZs54QWCq084EsXrBLCEuzQGQFzO4Gx/s8yzwYQUzbBYjDFo6ac2B65/Q
         /pFAeWu/UFBMv9WjMK3PXo724ViUxMEcVqFsyjZF9l3+U08wQONUZ5Q5z4OqthyVZoSr
         cV2QMAKnDePYI2ahCWr7Mk5p304Y4vWQStVNeAIbNT43gtXXJ2x1rx5qXkPPTY4+5vB2
         LSfGRR3ALAD3qXc/LSPfzVtDgGdTwmmA0tkdOGB0DxnVFsG0QfNxUi/YSrMhlCpw0Pu7
         rUTjWGSLJ2BIJKJQDXrAA3T2HNL/fkFwbOb3rylq/rRrEJ3zjtTh0URabPJZsmQiDwAR
         8X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248419; x=1794853219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
        b=W4cvxzjKco9W+fqcDUyVbyaH2G73cgrZam4eepPpP/1u8S5zWps28VTGZ++uXpFf39
         kTWu2+OrDdxOLvB6uUgnSEv3UyLLLDqwrNoVIvuCULC1cAAJX2WC1iRb1j9r9gVE40mX
         uRWUpOfheeRu4I/h/WLM/DYnbzzEao/g9VJLza+7diN9vadMo3UBEy1ACJOXiHQglJL0
         LXDYaWQv0ry5uq8ttv5bH2ZwUn5XJq3GSRpFhyP1p29HZsBaDE1aXs3cYFLe+CbaDM3d
         w11V60cN+AIxuQKayLPvDjhiQrMhFtRpXyXFb0pe397dsi/1mVxSEBX1Tz1wUdo3ercD
         4jEA==
X-Gm-Message-State: APuU4Z/pxxpHov1IPpf33kj9uQq+FSxZPPgTI8cpIce789iZC4/+YgDa
	fe9JcQC7oLpPFD/YVmSretpOQtKYGRHas1kwwCVllGA1m+iP+mI2JLJH
X-Gm-Gg: AYBFou3M+JxYn9gmVhHX6HNKlX/xPSKDUN9eALu5YAMnQVU191GavMaURQNvzSmUb+g
	uXLysuX79ZAcuCLdDDSaxAZgHNNGhwr2hDChQmSGiJlz7Wsz7Rw0wmy/5zmeookuEXGOkeHYkn4
	oeBy2F29FIRAnEwiH5jQ1Yzcs7mLdGSjhukeeDyomWkFHKkxTB2b3qd3MY/J3o20WMjJzkBC5mP
	TKl4XLslvHQgP5qK2CfRfrYZshGF/HXZuM6PMt6VqDgZ/w2x4G57WZmY7d/ej4w1BrQIuqppOJO
	ZHB1cvnn9TIpHEVRriFiK7ea7tM3ER8sxKENoSNv99bqW6Enjx0v3x1wO6MDE5Y673BXlUJKasR
	9eWwm4qRnB0qLHRnWoJ1J7Cn2u2fKCdSdKfTHMa1Tw2YUn3vm/mrIz2lNE704NfLgVHQv/LgkoO
	UJ9NGJefr+OfmE/E01h3Ivg3ftvZ5K8ElqM378TY8r1X7/pZsuNdDPApUqMivwck0Aedo9tfoAL
	93AOnOpir0fkglHyh8VJqbs6KLHCeVGFbWgKrpSGz8xEAdwO2WmMXaRKvS3sDwX0yYCGkYSCAN9
	R1DN2/8VK9XcFJUSwsTEyuNOov4Hmr2WgCO8dS60Qi9BhFULZFg6U9efO06ChgUytAKS6wcx+pW
	uOAz6FXC5TRqdzyF9XT7K79YHbol0fg==
X-Received: by 2002:a17:90b:4a0f:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3b166cc8442mr517367a91.41.1794248418870;
        Mon, 09 Nov 2026 10:20:18 -0800 (PST)
Received: from localhost.localdomain ([59.153.103.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm423189a91.12.2026.11.09.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:20:18 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH RESEND rtw-next v2 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Tue, 10 Nov 2026 00:20:01 +0600
Message-ID: <20261109182001.29076-1-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-2-zeshanahmednobin@gmail.com> <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
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

On Mon, Nov 09, 2026 at 07:41:46 +0100, Luka Gejak wrote:
> As far as I can see bw doesn't have to come from the chip here, since
> rtw_set_channel() programs the same value it stores in hal. So maybe
> this could just be
>
>         bw = rtwdev->hal.current_band_width;
>
> CCK PD only runs on 2.4 GHz, so that seems to always be 20 or 40 MHz and
> the check could go. Or is there a reason to read it from the chip that I
> missed?

I couldn't find one. Apart from the BB init table, bits 3:2 of 0x9b0
are only written by rtw8822c_set_channel_bb(), with the bandwidth that
rtw_set_channel() also stores in hal. I also checked it on my
RTL8822CE with Ubuntu's 6.8 kernel. Its firmware does hardware scans,
and at 40 MHz on 2.4 GHz, hal and the register matched at every
cck_pd_set call, across 10 scans and a reconnect. So v3 will take bw
from hal and drop the check.

One consequence: a chip that drops off the PCIe bus still reads nrx
back as 3. When the level then changes, rtw8822c_phy_cck_pd_set_reg()
gets past its WARN_ON(), since bw is now valid, and does the zero-mask
access to register 0x0; forcing nrx to 3 confirmed it. So on PCIe,
patch 2 is then what handles a dead chip. In v3 I'll update its
message for that and add Cc: stable to it as well. Its code doesn't
change; is it fine to keep your Reviewed-by on it?

Thanks,
Zeshan Ahmed Nobin
