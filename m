Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861451;
	b=ESZWxxi2fWe8Bs5SXQ9wH2jYYfXrXOQfkDF6wZUrqM84HECT5aOiU+wn+2bmYY1f9aaY
	 60Qq7jLDCfyYbmklW9SsrItjq94C+GS0GilUvu/3kVqBrYtLbx7tqB+FRP6e0SCg4tDUT
	 ijMBO5FEkfB48BrIGFtUeMbxukssRZeOJwsN60xUuA65VwG9GWVp0leAlmWcvtON6mLY6
	 13HyS/7KA7NvMbmh9IHDf5gxXfZBH/MlMbmZUOkbgq2jrRN3r8KJuMFIn06g4df6EZ3eB
	 2+LcjK+J0gDS+0b9USrQyePJrnn+YcO9UygUvYljleIGz/BQTmKIvaj6lLC7xUaf1MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861451;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
	b=u1qaGI5CvA9O7UEdf46Go+7D29It0zqly/uLICu3S5SrmB9I3CfLG6yORTQy1RFV3t3n
	 qWYPf6tpHSlYMFe3hChoLriMZiInurDObchCNOVK9/xuzCnCE40IFuDCIDZdWaiI8w73q
	 tQgjAaTgh6OhCXH8Xy0SjGuu+QDVXWH6J3EW+OhBXRNmxeqXiXD7BxePDCOFIcxcLtxet
	 x+07HaIfl/6GnCZN/lY5bie2eVyoShJP+xAj0v1u2tAobXNQr92/cBRy38ac9lck2ykiN
	 zTDabl5ePAH0x8f7IlcZpd8AuBV/eyIvFxKCtYbFEJxAXLjX0oB3jdy5ScHpOJDPiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OqIUbSDy;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18460606A331
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 20:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18460606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OqIUbSDy
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b18717a193so2179993a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861450; x=1795466250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=tAALnGcAdUYHDqA6DRbHS9w/JUE++qrJr+XvlrYKjxPyzsSx2DWPRL5QBhCBmKuNho
         NRmSBVtRiwLWp5OcnW3iE2hJiyexN7XlC0H13WyiYdqDzVYk/0M4O+XWeP17P4qQgtry
         aJ6QpNgGtmofmcktRACf7y3DktIlDAV4/SyWjTWDDExWgM3qG+nFD8aygTn9ABfqtxMf
         4ZA03jSuTrhjYbzzQXjL/x3hGirQuUhgJZ/1YM8NZ1UePigDq1YNkvEDMFjZ2bnyv+KP
         DekcBpMpXcY6qZigT7SiJtLXuPH8tVKn5lmIOPDnGzsdrgIixLzSOGy0DIR5hzGvYbvQ
         64kw==
X-Forwarded-Encrypted: i=1; AL+hErFJDXYUfon6YLPr0HVrHyyDAtqOBskkxNIneXbDV0klLZobu7bS1BbPdQAjzB+VfuZN+9JaPIG9eYOGre2h6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8yN5uV7SmKdpz8GTLqiTzyO5DO1fcrd8+gtAqc6rENMa5YXCI6
	FVy07u8ykM6vkfVwVIglWxliKsoKOcwDyexVLYEkHOIggQPPM0xZZb5TTfr3/2VHRTCXjZ5c01L
	GwcEOJUH7xCHHK2oxrt4LU8VdCjZkaKlQVbEnNL/iF7LcvdMx6UWXpF+tdYEv9gA7ovImERH9t/
	wKG50w4xNIP5KKlwAINx2j/OQmlwJov/vKO3UGxE7hCWqcF3VnWMPUb2CKu7Ob7vObnr7/AKwWd
	YULeMHqpaLIyTOFUc6YCpikGLp8
X-Gm-Gg: AZFdTZcGQprN7E9slJC+icX6fllR3sLqoWyvWwtaiH7fH625HrQ65/ppzJXe2sgPXsf
	8MCopMDRGkyZ4R5Q7+6yhBT5pdeT06e9n85Ca/EgkQFmfqem6qvqAcY5CQY+/2wtiK5Yih9anRc
	j/RHOQz4Db1IpaSJOsoDKeorVJ5pRriXmBEHGvF65hz+juqENqKxGChFYycO7Vy32AAyaWfSHXB
	SREkiNLUMYXwrnckWaTU+I3aQTZDHHOpAdHPnoDFHmYz0NMkItuiCHlb7ouFajAKoO6iO1gs2+q
	VvH/zmnJk+McdQkSvOMe8OtE4CrLoCN4x3WSr3S4cr+Zd4WuasHmPogHaLv2nz23AsNIJrg/n2B
	eId+E1IH8bWIOnCeE8qqRCk8Qjr2GNEeRmEhLl51gHEmBVRkKKSsUiQQksaSoyYF1v1eAggpFde
	gBcyxeVFWS32GTo6TsbSEbsOPZT/DaTRt0TcygGkMcXg==
X-Received: by 2002:a17:90b:3a0c:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b1b0a0e800mr10270711a91.12.1794861450126;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm375727a91.0.2026.11.16.12.37.29
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so5216832eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861448; x=1795466248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=OqIUbSDyZQzymQHyJc7bKAKD7Fc0+lSvNlJA9b2O9kkYg0Bi0Om5VN1Ousafylr1ze
         +s5d9I1pIafF2+Zko7cxJItGvWgxg3QlLBAC1UPhSUVDfYoe4wKIGkog4765DeqLDpTv
         V7N8TE6IC/6yM8KQEf3TwcsP5yKZC1gbNvaDA=
X-Forwarded-Encrypted: i=1; AL+hErFJhiB3RTWPj9EcirXtB+PiJ+3+dwNvEfrvTzb8n0mSn/3z+fLFx34zEEac1wbXXExgARciF1IZQrQXp9ruZQ==@vger.kernel.org
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797260eec.8.1794861448407;
        Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797223eec.8.1794861447696;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Mon, 16 Nov 2026 21:37:18 +0100
Message-ID: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151623.70695-1-dev@deq.rocks>
References: <20261104151623.70695-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
> enables "txbf" by default, so the driver has to clear it.
>
> [...]
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>  		goto done;
>  	}
>
> -	/* Enable tx beamforming, errors can be ignored (not supported) */
> -	(void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
> +	/* Enable tx beamforming, errors can be ignored (not supported).
> +	 * BCM4364 firmware enables it by default and then transmits a single
> +	 * beamformed stream instead of two, halving its uplink throughput.
> +	 */
> +	(void)brcmf_fil_iovar_int_set(ifp, "txbf",
> +				      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>  done:
>  	return err;
>  }

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the firmware shipped by Apple
(9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
restrict it as suggested there.

Also, the comment says "Enable tx beamforming" while the code now
conditionally disables it. Please make the code self-explanatory, e.g. a
local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
txbf value spelled out, instead of passing a bool expression as the
iovar value.

Minor: typo "refression" in the commit message, and the subject lacks
the target tree (wireless-next) which wifibot flagged.

Since this is a throughput quirk (not a fix) I would also like to know
whether TX beamforming is functional at all on the BCM4364 or just
mis-selected by rate control, so the commit message can state the actual
root cause.

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
