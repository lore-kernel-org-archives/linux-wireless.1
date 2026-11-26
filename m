Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703383;
	b=WfOow8lGttnk/RuazNoM3TwToMKnvMVAN9tLreOKd6eLgImGivJY4G1ZEHFJDoHVku4a
	 X7jX2r8K2wsMprrskHiffrN7MEf4NtKLslD2lKO0CyzvYa5xCNsjB8GgqT052RyMlQKak
	 lYfzvcSKqDW52td3u9RxodW4yhsp0LZSx6bfMHx2zCPKeBH0BlkKg0la0Zzs8wJhGe9/9
	 M/1LC5+BT+O7LTqZKkuacJhWHwW4VFQwKglY8V89reAFMSxD4Zi2pozDmrabRGT/67/CR
	 baYI/TdJhzrTOfhEUXi86VeKn6rCe4qQFwBM86+Xrw9apF/mmlelc9Dt1sFuZTKRkvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
	b=SPmrUQ0MufKWItllSPt0HEqsHRuGZn/NEf/7Ul8FhSDVrrjspXFli4rVX1DuBrrtEBvR
	 OwZJ+KaAYz7TPGp8+HLqBrWaT6lMHVWRP5sJiuJ6FttK0hJn2teqjxyL6PbAtweeE9KcC
	 iS4gW35wSYPAmiaGpi5qvO+bVxzxtuD2Y96y53TmXLYosMT/7OHO484sZHbRNKsZHE/9C
	 BmWWT4ot+qz6XNMv59ryqU22o+FBDZWgg+5LMnneHXM4OCCb7R6RojgKo4k2hCIteCqQl
	 gIQNM1JEUCBL+H/fuKlGmD2vcMwsaszCTyfo6g9cPfZTThSdTsTFpyITUxUfGrCdsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YzOV7Y+I;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DC606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YzOV7Y+I
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso3092286a12.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703382; x=1796308182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
        b=LypSXNd/LSUQz7uSo2VfUPv+4MGAnN+H073C9fr0oQj9hGj9xF81Ih/O31hKV3Q/XX
         tkfSuw2hKTgITUYjdzOnBvSz5Pj3h9f3MVxEWt2itVCOk7eo+FqkHYadabd0iS9vnxiK
         3jc833pSo0gWBmR/LlPtGPJ2An0SDZvLxQXa2IIydZ3YSEL2ERtsUVLBJW0rcXmuBwAJ
         DXMr1xxCvXopIy0SAkcgLuUvselXPUuW1mwsboYHgJCFUVJka5M+efpKpKhEm8NYYl3n
         HMtyEy9XJiuUi1a65RuNAJEuXHDIT/HQeIiRUb+LiYif/DzUlC6BwkrVVF9qiCOHXUoI
         G+mg==
X-Gm-Message-State: APuU4Z9rhdvyBThUQIh/HO45mXyPoC78EdWdAChjTZkZL1gmjdyYWFs0
	//M9gOkrgiEb1fRS+fHV4cwbgJclKFUBc049hJhsgVDse8gU0j64JYQI2IcDZL4tmNfvJ54+SAl
	58ipFXUl5WU57pAM6sFsFtPZC7c9bdoT+ZPTW/Ga1+xgwR+DP1xdl9Bt7KfnPWNU8iglMCKoUde
	AI+vOkxoPlp/W4mT0da3AZSHnmstyHg61D0NJqT/Mf5aHyHSYbb+EheaHMfbueIycbCQmb50WC4
	n7ceEYt1GSi+z4gUW2ZNFJP8ujp
X-Gm-Gg: AZFdTZfMHCklZqFC0irp/zL8y5Kl9B8uW0/58gb2lLVbHt7NK7ysyG1dM/u+dM7fGbQ
	RRQuWpV0us8Nsj7AjydRbm+/7/75090PdJrUWT9IXUgTY5YoZTReBPqp1MR3+GUFtyZabOtkY+M
	grFwsQkxlWQZMFrN57je77mfSsBrvNcszv52j4xkooHlF557zFnrd1Ufqdhgqi294v4K/PeLQwj
	Ezu8rDb9RM+D15pBfwqNk3mGhax76Ph31qq6n/xEZdrZ3OFdvEPMLsdrSBNIUFwWxmTFz1uT/tv
	5D+rgmk8G+G9wSKLeR2GsTtmre1uBfmR12MKThtVs8QYgeZRpRrjA/T8TegEOLONoBbXp2l6vKa
	bcMkEfPtzs6WO0Uuh9f2++uCMQA2Slev1X1TzyZODIC/MBcFtSZMOJ0NAgLfyGZf9ik1dRsiJ0M
	8jRoeLuPje3WIUGtfMEY5MqTRRUZIXGSVm3A9BwVo=
X-Received: by 2002:a17:90b:240f:b0:3b4:ab19:ae01 with SMTP id 98e67ed59e1d1-3b4ab19ae94mr7286765a91.21.1795703382155;
        Thu, 26 Nov 2026 06:29:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffe5f2csm6436648a91.2.2026.11.26.06.29.41
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92111028a03so127098906d6.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703380; x=1796308180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
        b=YzOV7Y+IA/EZRAcLGzePqDBGaMf+y/+W3TFAy3XeESl9DVmaqUHvv6YsPwKtSrCGUj
         BZ2Mqud8MxmL/mv+zMGuJqysWQGP6rp9uqnp2j8hXBO/UGTB3ODwlU4Sc3h77HW730MI
         T6c4vFePJyc9ZBz3+p4qHhbVJG62aRBP1NKFs=
X-Received: by 2002:a05:6214:2487:b0:921:7305:47c with SMTP id 6a1803df08f44-92173050758mr132277816d6.52.1795703380557;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
X-Received: by 2002:a05:6214:2487:b0:921:7305:47c with SMTP id 6a1803df08f44-92173050758mr132277336d6.52.1795703380030;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:39 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH wireless-next 2/3] wifi: brcmfmac: pcie: bound memdump to the mapped TCM window
Date: Thu, 26 Nov 2026 15:29:32 +0100
Message-ID: <20261126142933.875175-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-3-sorencoremans@gmail.com>
References: <20261105215954.184290-3-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:53 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> brcmf_chip_get_raminfo() reports "RAM size is incorrect" on a dead
> device but leaves the bogus value in ci->ramsize. A following
> brcmf_fw_crashed() then dumps that many bytes from the TCM mapping,
> which is only as large as BAR2, and faults in ioread32():
>
>   memdump 0x00200000+15728640 exceeds TCM window 0x800000
>
> Remember the BAR2 size and refuse dumps that do not fit. Only builds
> with CONFIG_BRCMDBG create the memdump, so only they are affected.
>
> Found and written with the help of an AI coding assistant (Claude Opus
> 5.5); the cover letter describes how.
>
> Fixes: ff4445a8502c ("brcmfmac: expose device memory to devcoredump subsystem")
> Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

[...]

> @@ -1669,6 +1670,12 @@ static int brcmf_pcie_get_memdump(struct device *dev, void *data, size_t len)
>  	struct brcmf_pciedev_info *devinfo = buspub->devinfo;
>  
>  	brcmf_dbg(PCIE, "dump at 0x%08X: len=%zu\n", devinfo->ci->rambase, len);
> +	if (devinfo->ci->rambase > devinfo->tcm_size ||
> +	    len > devinfo->tcm_size - devinfo->ci->rambase) {
> +		brcmf_err(bus_if, "memdump 0x%08X+%zu exceeds TCM window %pa\n",
> +			  devinfo->ci->rambase, len, &devinfo->tcm_size);
> +		return -EINVAL;
> +	}
>  	brcmf_pcie_copy_dev_tomem(devinfo, devinfo->ci->rambase, data, len);
>  	return 0;
>  }

The bogus size is left in ci->ramsize because brcmf_chip_get_raminfo() does
not clear it when it returns -EINVAL for "RAM size is incorrect". Clearing it
there would fix the source for every get_ramsize() user. The check here is
fine as a safeguard though. You may add my acknowledgement in v2.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
