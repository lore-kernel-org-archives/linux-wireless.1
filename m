Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709694;
	b=jTI0S5IjzMbjZv9k33rqb23beSpDgkOAhjys9EMYOcawa82k4XXiQK5F4PI7LdKHGL5p
	 1BbK/f+Tp7ZOn2mMTUqpRQscoUejBFAYh+u9PU5LFt7QIyPJOnED5Qo23CFPiHnsDaUC0
	 Y4r5orUdG8Z4sPbMIviiPRebT05TqYa8RuQ9MLpPRFE9mzEgNJGzYlmkAGoQDO+BtYNHd
	 yKfHn18TO7uWZIoiHKw05ayCvE1eTyQeyD2qY45wg7jsiQJZYifYldKsuLbnm7xCJr+Sr
	 JR3fRmQCJl2qB3JYKXfRwPLa1wakHKmGQRVoKRb/QyUeYLvMtV2CvnnMCsmKbm4eavg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709694;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
	b=zDKc60bV0p22Z2I8aF1C5QxBCm/f86Ngghya7HgQqueBqwW2/s+fllOIuNWeeIuIktBe
	 a6AfZBfUuWjnA8Fmqkw6A+NtsdFwZRTldTh3dw+9Ar00Z5T3bX2u2iEBo78FaB2TULAF/
	 o7aQq++kzpaYkcLJEymXVMfuhyARUcMg0m8Tl146sRyADiLJ9J3d/iLIeOJPF9exSbGO9
	 BfT1g3CPL6DTEp/XaPIrTuKjeJ2ydMDjgi5k3ib+uF6gWSb0MboyH5HjoEDCNY+9ARIhu
	 TjBHUdh28YE/J8BgSINDlV23xiwll11pAZEqTJZ+uWUvC9IEyV+WRQP6uZz3DXuMwnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XAYFPliI;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63346606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63346606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XAYFPliI
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b402824d07so4770638a91.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709694; x=1796314494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=UQZ44DL0+HNZyspKuPRCRl9yraTpo9hRzPI/hvadDnHRv4UaZQXglUz8H/z9dn9f6O
         U4A9RIUMy5AwIII5itGBvQSfyYf/IE+rO+domGH7ax0lGnxZkah2b1wJiysgenWf0JOS
         Z3NmiizBEm2Q3q2ceTbUoCY7eFmsgnDNN/EzjeQ4g0EILTGpEXJBLbKwG2QbQUz5crp5
         COhXH18iNE4V+3rJArkt2NGQRt35LhiUvcFMRYZFdoHV0K0va57MSxThjhJW0alXORSk
         ZTp9CM2HnkiOVc/ypoYGxxgu4V1G8l9CF5QaaGVEhFxxKyYKRMFiTykT5Ij75n9+UUAv
         LReg==
X-Forwarded-Encrypted: i=1; AL+hErF8HOcZ1g8mV4UkRExylND95qIo3Gnj0yHOXyNSviftbp8oz3L7110cgA48a17zvHdkAsCwZ3D5ghC0Rgzuhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z97ImGH/O54NWNGswtocec0zOXwQo5ZF9XAcU/+0nlDCvZ28aeQ
	wUISArLdTPMc2vwsv3lP6Jr7f4lbsKJvxqwtk1B0FBp8LOLKKzztS7yI0WDLbxOSCP6qo7Uszfk
	+WJNkMrekYopw6e11RSCFgMTVA5cZvUrAWY75sAMPa0NXoH3HFcvAufiizdOrR5EST7ChfNqB9w
	7Zvnktel9PrtscXnmbJWxHTC50GijGcOX4lfcRJZt+0FiABXqXx1WXJ0G+kZ4ZxXVadNF1OsHXL
	guX2gJkYMWaE/4pUtDPYx7++HQD
X-Gm-Gg: AZFdTZcqbk7HgzSJsGx7BZjgsZb+jd6b2MncvTkOZaPwP88KeYUkZSgXSg14J1UfjVw
	kjjVvW+MepLMyuJd18lX04d6ZFzjTjPB2Vozw2p2iM7Cr45s4VoUnrRy/epUWDjV6mDMpfIyNaw
	FUtKkyUf4YP1qTFm7RaGzZDqianCMc9ZIv9q2YgDKeSbV3O9ei0ML7fkTHWMJh/sZJ8jANGDqvA
	2iEODvDsXkKCwSrH+qfUoqW6F5oize2eSpW+Yk4B4RDDaBTc4C99k2CsbPMi8Dkw/eJJvGuRQR8
	TH5Z1QfhaOHK8T32xzJ1078IYsI6zJxYfe+d69cNvYJ/GMiQVQS/L9lD5nxvJ/THLeWJ72lVOXr
	6DmlW45iHSbQt9m9DW8sXjHw3YEDK6YzNJXKPb+gGzrbvn6fU8NbMBiDtx565dZKTapNoIFsIiW
	Yx7V5wcQyoQmzD4OMpJO+B14HGBNziCFn0gH6N4gA=
X-Received: by 2002:a17:90b:4ac5:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b41c8d95cfmr21657238a91.17.1795709693580;
        Thu, 26 Nov 2026 08:14:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm14607762a91.0.2026.11.26.08.14.51
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso964316685a.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709691; x=1796314491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=XAYFPliIf6q89aTUSjSz0NJO8Xxe5BryDOfy+HjKkIIka8XNJgOyt63rNp+IUhBbao
         61KC9OlnPWzSGrYBb20CDgE/e/hRji9DjDBEt2XsLEa8WSAsKCakS8INXkmoTrXmGtLE
         6WOKgf74T56Qgk/64xeH2Vngbnv4HcytpE0n4=
X-Forwarded-Encrypted: i=1; AL+hErGqOTFsTHz+15PZed/JXaBLaSaGfAnPJ50Be/jpFBrOTvi6dNdcJC2LBakxcW54NNoZljw4xaIX9DNHJXV9ug==@vger.kernel.org
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591430385a.80.1795709691133;
        Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591425485a.80.1795709690707;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 3/6] wifi: brcmfmac: create and remove the AWDL interface
Date: Thu, 26 Nov 2026 17:14:40 +0100
Message-ID: <20261126161444.2484980-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-4-dev@deq.rocks>
References: <20261125190254.176055-4-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:51 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support creates an interface of type AWDL with
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73.

[...]

> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 288 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  51 ++++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  65 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 428 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> new file mode 100644
> index 000000000000..1ef6dd50958f
> --- /dev/null
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0

Missed this in the earlier review round, but all other brcmfmac files are ISC.
I always struggle with the per-file identifiers. If ISC is acceptable for you
please consider changing this here and in awdl.h.

[...]

> +	spin_lock(&awdl->lock);
> +	ether_addr_copy(awdl->mac, mac);
> +	awdl->adding = true;
> +	awdl->abandoned = false;
> +	reinit_completion(&awdl->if_event);
> +	spin_unlock(&awdl->lock);

awdl->abandoned is cleared here. After an add that timed out, the
firmware interface event may still be on its way. If the next add fails
in interface_create (the interface exists) the late event is claimed by
nobody, brcmf_add_if() keeps the ifp with ifidx 2 in iflist and
brcmf_awdl_ifidx_used() blocks every later add, as in v1. Keep
abandoned set here and clear it when brcmf_awdl_if_added() has claimed
an event instead.

[...]

> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	/* The firmware created the interface, its event may still come */
> +	if (!err && !ifp)
> +		awdl->abandoned = true;
> +	spin_unlock(&awdl->lock);
> +
> +	if (err) {
> +		bphy_err(drvr, "AWDL interface_create failed: %d\n", err);
> +		return err;
> +	}
> +	if (!left || !ifp) {
> +		bphy_err(drvr, "no interface event for the AWDL interface\n");
> +		return -ETIMEDOUT;
> +	}

If the event is handled after wait_for_completion_timeout() expired but
before the spin_lock() above, ifp is set and adding is already cleared.
Then !left makes this return -ETIMEDOUT with awdl->ifp set and no
network device registered, so AWDL_START reports a failure while the
interface is kept. Test !ifp only.

[...]

Regards,
Arend
