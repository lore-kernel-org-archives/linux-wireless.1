Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703397;
	b=sNV36XTfx1o/JvwY/x/hB1lnfSmzdswUjCk0KQXXYtcB6Pld+Q8WuvfQzeO0iuYp9d/9
	 ycT3Kx+d5fI9UBZKXOIMGkjh0ff/FMPxXU2MzoKg4R188n2lpN0P2UoDicQE4/31bchk2
	 htfRvg6vyu7k/Ik/7/deOUBMJd8jFB9CkR/44IHVAxN6r6XNA1a4uMqluq2McVuWOkfdj
	 6QN6QXYsY+TkPnstj3WvtWl6ePWUmnpF5AT6icH+qDUQWXUBOrhaNK29rSqYVFICrI3cQ
	 VjuPLGu8H9lzU6qtdknGxV5Q67WU+pjs4O7Xv0lVijSJpmzMpveZWEww79N786HzSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703397;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
	b=HaMotwMeX3SgEHlONsaZLEruJutPGwj1Ctook5LGUQaQ7bsQmM4T3glYDkprdeT/qr6w
	 Fs5hD7XudgZAMnv3Js+zbWpwWJFtOLeKEcZPaaPQT3Ggo5PeuOru2HdcUJYsr5T5KuP0x
	 zaw5wJD+2AGSEkn6OVb1Lyb0p9nSEssvvD40L7eQ+HXBrIOrf5N7+rK7mjo9l22OMsJ0A
	 bEGL/DTtzsg6mU+JCd6XpRToXzUochwmfEjl2QPSeSKJlRyWCkcb3cgj2vV4IncfmXxhD
	 UnPdDHsf0YuEZzbadh7gG9aECwgKHO6wLwNz4e+IfOqEFcMKfgjSai85lLU2vy7/LCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFPR1khy;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72795606A33A
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72795606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFPR1khy
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so3112715a12.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703393; x=1796308193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=BPyZgIylBp8qkd23QNuMXOfe0mjwspvC6myByxjqO3+M16gNqQZfOooO/eDJRsj6Zn
         TnS+8IzebndC0HBaeREj8jYJVYq7uLyXWCDKxSQBqgojXu8Q+4VX5uRkBS201yCj5016
         4U++XPtO8yhQ/VjIt1/hmCdvSIJst0LlUOKTVwfUtL3RXX9vl7RlYuDobXYvldShXgLL
         ciD9Nt7QPIHiTxJf8+Zl6KaM+dIY1mYCdldWw1wF5M1/I0xcvY2FY/32SqKy3WSpQ4r8
         AmZnuR2XkfAbKDdlVhEL8Q1baiUGQZRXUQp3Zme7qubwrwAHKC8mIhQFRyrVBiZc08O2
         7ImA==
X-Forwarded-Encrypted: i=1; AL+hErEFR/vxYdP7wvZrFyg5bG8BBQYSMc+GB6CEz1frDrl4y3Ke28KPrtEKQWKIs1anq7hpZrz5jYQ/SdtoSl7Vmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PAYtYRDvrIZhowkN7BkfXcKtmch8+w+1/7sgbnHcBsw9zW/T4
	+HKDYp22xg5INVQ4kBekUAISXJPYy67NneHnB2IxXEE3hKaZyfK+Ox28AYuvPIFQ85KKRF1reQZ
	NigjV6yIa0T8YUQG5FWXyGUfi75JRm0MILraA+H4Ch1EvWa5EDfe5G1QXMKlpuNGeMIh0cjlf/u
	ur1+8ejJwobZsRen54ipEF0AeJDcfJiBNvdzpga2KCSefSLmdti9LscOMjWB8iS3vQo/465yhVX
	v0OjlyDvSZlTs1rBKmzUSqjuh+k
X-Gm-Gg: AZFdTZf7VTD4/+0UN2ViCPPDsWg7GuM2Fd+gIFHBwsIDc+PgY0TgXhalgj7784jWsTu
	0eIRejfc0FTTe01XGTVemAiyzLnECe7JHobIG/IboQYPZb6eX3bZtDrJui+z6o22kY08PoDzE16
	vbq7QgkzdWbuNuvLhF8MgogCxYEdLW8Ngn/lIPk0rxucNuQVget5xec4k60vzfi8IjapT5GmQtD
	RGZLoaDh8gofzxL2sSTodi5MYrX/WNlAe2l8/ApNkxCcXR+NrHx6eabrF5FoKXP9DeLTusB8rQq
	RgJE8F6Jz5ySxQROpp6OHTptssKxqbBrlBRiDZjRy+choTYldGzt5Af41BgllF89hDpzRJFIRB/
	FEVYOvl5kjFU6BE6Frkkgz0WnbHGs5/klN6oC5aXQ/rWqcCNK1pg77gi5K8sfAfdrx3O8Y/ZZ4G
	T8syrX/CIVp2HG4bGIPj0hKctActqfr/02+7KZ2vY=
X-Received: by 2002:a17:90b:2f8c:b0:3b3:a1fc:136e with SMTP id 98e67ed59e1d1-3b41c9612cdmr18729045a91.58.1795703392718;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff51aa0sm6573353a91.2.2026.11.26.06.29.51
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d846fd50aso44242861cf.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703390; x=1796308190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=ZFPR1khy3inJXkvlG9iIhay32WyQz+YPDwBRKJdV7QXIT6JZpoTmqZ6CbO88/swF9t
         7qFbA+z5clVMvTPUnahiztaSCMBuFUY09EI9HPfBLIZLakcf/K1bkVDCaKaITp+XCKSL
         a50rDba/pFW1CRpKBmPaRphR9XtumLRghy3AA=
X-Forwarded-Encrypted: i=1; AL+hErEj3YRZNQWIQ+aROXP7n6iGBKIxHNlpYjKNFm9YXmucIDGYulxl700C/h73Wo4dcJNSeZOugEz6LTcZ0GP/Tg==@vger.kernel.org
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976551cf.27.1795703390129;
        Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976211cf.27.1795703389662;
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Thu, 26 Nov 2026 15:29:39 +0100
Message-ID: <20261126142942.881504-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-4-dev@deq.rocks>
References: <20261111120748.23795-4-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> After ACPI S3 the chip comes back without its firmware, but the
> interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
> takes the hot resume path and every command times out afterwards.
> Seen on the BCM4377 and BCM4364 of the T2 Macs.
>
> When the platform firmware handled the resume and WoWL is off, go
> straight to the existing remove and re-probe path.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
>  	devinfo = bus->bus_priv.pcie->devinfo;
>  	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
>
> +	/*
> +	 * Without WoWL the device is powered off when the platform firmware
> +	 * handles the system sleep, as with ACPI S3, and comes back without
> +	 * its firmware. Its registers can still read back nonzero, so probe
> +	 * it again.
> +	 */
> +	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
> +		goto cleanup;
> +
>  	/* Check if device is still up and running, if so we are ready */
>  	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
>  		brcmf_dbg(PCIE, "Try to wakeup device....\n");

This applies to every chip handled by brcmfmac PCIe on any platform that resumes
through platform firmware, while the problem was seen on the BCM4377 and BCM4364 of
the T2 Macs. A device that keeps its power across S3 elsewhere resumed fine through
the hot resume path and now gets a full firmware reload. Please limit this to the
affected chips (e.g. check devinfo->ci->chip) or explain why a re-probe is right for
all of them.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) also re-probes the device, from its
PCI error resume callback with device_reprobe(). An error that hits during a
resume through platform firmware could start both re-probes. Please check how the
two interact, and make sure only one of them runs.

Regards,
Arend
