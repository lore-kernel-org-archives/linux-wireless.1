Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776583;
	b=MPq33OU34cX6UV47BorcORyVubEmWnvoArIdtJKSv2nMRdHU2OyLj5w7E5pDefn3xeDa
	 ZI7w14EThkQV0+e4Y+/Ue2070Ac0CVqXgX/DWSOSX2MFOeDWVVHJdg05lONfDemHRjkrK
	 P0JMR8vTyuQDJr/qPSfwxgXTL/qxCxVTptkD6u56GZCRCpJ33wwX8dG1XZtjN22albjNz
	 dKOV67Bp8qwC/zfHi150QemlQMq/jpdnmgA0zpmCdkJhpgeM9cXyab3XGJVwZ6XA6U/3Q
	 YBPwyj4hqZNqz0mkbvUa36vBO/GLME8YDAVGLhn2aiDNk99b5b3wwhK9ceAOGQuK2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776583;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
	b=VQAeA+pfVVdJHUpLwkVss/wHqVA0mPtV1yak/jRWUunF+k+OmGIMRbllq7kw2ftn3eyS
	 7ZACr0zKea4kHwAn/F7Pc0i9jc7+X+jkBAYhOM463I48jamcxuYxlIzb92cA2ugSs9kVs
	 +RgQ/UHbWICjC2e9TUh43JAA9KoZYSOZ7XLdxZY6ocIGzzpCS+JdmyIZ67Sh6MHJZBZDz
	 Ip/IhExIejxlU4yNmEZ5CcmL7vTmOQHjAs9Xm12uBA7XeX+PWP/DAUsVY4LybVJJ7AGP4
	 i9BrJaKDZmmb2iXR8F9+rSX5HaoXkJ2gBMVoODjB1/YEzqQHU7QXEdVj9XMvf+xV4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KKrjWF2A;
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB283606A32F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB283606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KKrjWF2A
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so2733637137.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776582; x=1795381382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=KX3svc0q4TcGNqMBns/9lXx/1A8QvJMFRfrVt8pr97kImJZwbLzaEaDlq3DCpeq59Q
         hPn/TJvXL92qcJiNaPG/O9VnNir3ttPf8zEmzN84Dk5uz8FaDdivY22x/dOcnFZBXMIl
         NmRc3fabghw/20riJCXpjThCZchFzGT/Gh6HGDPkQsdD3GVb9QU0ZlbQG5EpVTYm+UxL
         qfFQNjlxY+kz7rO74KIhM80PPBH70SVG68dLY+ni7lcBaXMIa921GDVfly6pYlSIVqfq
         QKVEmYuBZAYrQDBXonHnypAsOqPivJpA8A2ukOD6gqpAqkrqseAG+yB2D1aB8jf+HD5s
         xeSQ==
X-Forwarded-Encrypted: i=1; AL+hErHL9hAxDEAIVzneVJ5VtV/kjRI3U3lnImxBxXLgxSkxKJ08OQHBOxRcio4yEeRaQBHYAd+bQgGiiJ16zTNqww==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ATtifjtLxNQYYSu/tO7bgIuF0MC2SixqAyHNMH7WQdv2B85X3
	vipTfTx+6g2egt/Q9iRRafhjfJ3N/nCNsVmt0MPvxuoX/DJJIibnM3/9ju37Z63X2uJXllrcMDU
	OIzJSws0LRy3zJg1GttUyE8VjhDVnvNG5TqayzI0CoeyzzcguSXz0HdLQhox6DhpRTtmbvSvYxO
	pP1on9RQri/ufVkAbnWAb97YIZnkmDWxzoUWKHhY8GdcAKD3tihPEP61rcN/oWmCcBfc0SHgK1r
	O3e/RhkCLwZY90exyLttLgGpLlL
X-Gm-Gg: AYBFou0AyhvZf2aTGPuFaP3xJbL3lBOnu/EpSlPX+BRqagkm3R6jKQ1Brs2DOkZV9U0
	+Pbc6+6GRd2lGeCEwXhJ0d6nkQ4LEtYZOl/nwIofi1S/B+Kr4/JNCvKJsH1Hpf4tvBXZ/7vRNSE
	ntjsOlq9WBH0QHODWbTj7B7STK1pNgFxLAFWD0H9qn15s69zFu+SzqsC7JsXEe6qULcOBeS3i5V
	4ediuX/WEmY1E3YIaoQ0Mkr4mTE1PQ+An8OVmtt4+D4WkqjOFKcFhpvc2c26d/rh3sfsZOLGw6e
	xzAyEbrYwPBmr7mMSPUBAlIOPm70q2/AL8z/mZ/OKAGP/Xvhoz08BsLfynqoxC9DyeyTMGPildM
	i1TtP9PDXAsx+uyaD1iqZHIJmxGjnTQ+npO8NsmraXslDiuI/84+w6jw6ZZHdDctz9S2k9an9Vn
	KCbT/2P5WRk042SUUoX7KpOSpTdw4zagplzc7vsi8=
X-Received: by 2002:a05:6102:14a3:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7d64d76c08emr3148856137.16.1794776581599;
        Sun, 15 Nov 2026 13:03:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d64c4cc5bdsm136547137.21.2026.11.15.13.03.01
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1162856eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776580; x=1795381380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=KKrjWF2A04lrxn7xAKqhjLzR2KZ/V2enCpylT6NCBIwWSGDtgsKIpyBjCCUEwnoXBV
         99juzg1IoRIxZ07EsAkdjy82kBO+0y9NNMsYINfSsi6Igl1Gc62xZx4adjC+TAxGkS14
         uVN6PI9+xyVvTtsmj85I+HcB5hh01+pbQTiRI=
X-Forwarded-Encrypted: i=1; AL+hErH0hNz3P8ZsuZwdEOd4e6FoD4hWaHkp1/oVZlBBCAna7u2BE9t6ljPQBIEQbduTYtSrKPgjRhRZFJO2GFTI5A==@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649112eec.21.1794776579917;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649084eec.21.1794776579210;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:02:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Sun, 15 Nov 2026 22:02:49 +0100
Message-ID: <20261115210253.883721-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009072232.18-1-shxzhaosr@163.com>
References: <20261009072232.18-1-shxzhaosr@163.com>
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

On Fri, 9 Oct 2026 15:22:32 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Verified against wireless.git main (fd4e7f1137291), the current
> wireless fixes tree.
>
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Nit: as this is a fix, please consider adding a Fixes tag, which looks to be
9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read"),
and Cc: stable if you want it in the wireless tree.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
