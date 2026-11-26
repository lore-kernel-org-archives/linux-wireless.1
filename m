Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709691;
	b=l5zV10pTLxdEjQ9ReiWsw+RpU/7uVSaMxSyvfnmd2P323Iu4EvyQRkWqqppZgPAtUk0O
	 NVYM2JdE+QBtIHi4cErxH6jM5Nx7FekK2L7AxGl8LxFCttcQAOEdiGpqMqIseKOM3tFJ1
	 BZA1VGbAAiKto4k4O6v/snIYdKH1FQKwNKEBQTF6GANRV0fgrRjn8AHx7XLwZEQXpwxNx
	 AaRPOukVhAOkuYtta5lNB7xPtD/Elp7hMoTfMaRRQbfOIGUaG6lTxTAvpWzlba25lRWjJ
	 FWbnunJXLfHfHtCKurl3N9sliuhEfomhmY2XUWHLHnvaacfQWybr4NJcfItR0y4mB7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709691;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
	b=nwzgDI3UEcNc3BTb6Nd4KXaub5Zw+ws0nqTvVmc2k43uso8mAz7pkpfNvU9dKElVWmvB
	 RS62ox4Gmf1mMZF4xDkdV4VD6ledbeXRVnZ64S5r5JGP4dEKXVNhClHOko2TbMWYWOKJp
	 jx9JA01fJu32V3bg+AxzIZykN37HSwlguNgeapnz2ejeobW56OcCj+0S0/J/9wkuv1VT8
	 GjbP+VqMMCBePtQZ808Yg2srw2hRuTrDYYAqrKRmeSvbpPZshYHpPJ+pR6ELoc5n4DQSG
	 kbJEoc2te8S4R1nZmv0k0DorwS1a/jeIm0QYGicAc7uYp/uVJ1W7bnI5etfoXjRKgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hV7xhfCF;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D9606A330
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B9D9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hV7xhfCF
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cddc597d062so4311772a12.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709691; x=1796314491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=srmTIRvbid5UklyqdNABZ9JfwtmnDmArqBrIBjsfDnO42umoVY1qXd0l6sxGZ/Coww
         nvyZK/JHsPmnbDDk6zVHhSTfdDdpZk87wM4pAVmrgCD91Ejonf4BCSfWUmltLV16wfo7
         qIswE0Thq7GYbNCYA0Oyrp/01LvAmJCLWJ9eTIJOsq5JEAnKNRr65/QXBYLOkNUSwo5a
         XvkYOlFgdMSzhDY/kjojAvVeTktPxCigaNGtnn4RhCGrkyHm6dt6itl4ND63o4nf3wIY
         XcrJFOtAB/IT1PHtvQdWOqc67Ifq/YpHnnV3fk6zAv0b073Gh12fxdv+ME7Tpey8LzuV
         1dDA==
X-Forwarded-Encrypted: i=1; AL+hErGRZWsxTRPbMrRIFpLKSyPYHEemS/TOU6SxO1psOrovi2LDQoVhd6ATuqJ9Fj0cAMaJ/xv82+j13vxALcCDEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qY14nz8FgE26O9Uy4I3mXOsm5pjRXFgNZKI/5aeWx3hcGSxWa
	XgK4wUZE+qOaaYheXIkGGjLTt1ctAWe1Veak6zf23SCEQKW9+m1mvjGEkfuSET4m0v4y5+dGXJ0
	EPG2LbBuTAILC7aPXX35B2F7p4T92LdvJ3DFaJNR39bQdNavVHfJmirg/H3EmkCAUWetHugnydE
	GgVMiDtraN4vvmP7YXTLQCCkuqISz1ujrx30IIuVuf6vUAfyG5GXeIKz8ToqkGEVZdzeC7A3bD1
	y9NEi0RqGXJdjPZsL/+EbW4j/5t
X-Gm-Gg: AZFdTZdW+wd2WZTEoaS2NvtYj/uIqv1PhSF/CTr0gNk7kyclfulgJvd8RUKfxruUG7D
	jB5JuuOv8Oq1R/moE1Ehcp63ugjNysOAeFqDgBpJvvGE4hPDeZQnKm/C/B+hq5H9+qcbRVVuZ8a
	KICRXGUlMoT1A9dtnOyDbRVktpLl7nUPfp6V9y4xwlv2UO5AVZJw1RfQbgmq1rkZAsDJ340mAaO
	01694uPSD5f9W57rCLOn703+LLG0HU9IOkaoF+lyO8MGwrmXd/PVaUuqpnBkUb+YE6QTe8v4Net
	lN4ajwJjkjDszPLRCyCpCLrRkm2O70vHMUMVV954Wr+qCsjMjeNo9Z5Hx2Qtomd8lZVsvU9JAkc
	m3x6fsRawUCcK//uxVHdhv6VJJ/FytuxQaptxSatFLlolyR3rWNiNPAABbGWa9b1EHfHXDVpro6
	kVpQmFev8f3/IAT/Oz+FiR9cE+kIGnqMXY1e3xe4c8aA==
X-Received: by 2002:a17:90b:4d0a:b0:3b4:9d6:5be3 with SMTP id 98e67ed59e1d1-3b41c8fe203mr21354640a91.11.1795709690581;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff51aa0sm6628697a91.2.2026.11.26.08.14.50
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so797936685a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709689; x=1796314489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG2zu+3pFucE1vcX6/TAGudL+NIy1Iy8ppAf1TtVtOE=;
        b=hV7xhfCFk9GHDeFT989TwtfeFjHOZYTqZSgf1Geol48Bk83Hr/pvU38ssVDl0Fjmvs
         57i/N2oTx3ziBzmtLJULMTGCEMs0XeT23wduIwo/Kubh2JL7ICmNqihGGI/B7nt/Mist
         iKX7WRLM1HiLeauCL2yx/ocjxN+j+6NlLAdYk=
X-Forwarded-Encrypted: i=1; AL+hErFhvOi+NSoetdeeMDLDeau58cY6f9QcKVCRz+bwLODrPlb7H9Gx4iuVzEcybpm9pftG/qkXjQTnpVEaB2t/Kg==@vger.kernel.org
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903799885a.58.1795709689007;
        Thu, 26 Nov 2026 08:14:49 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr3903795785a.58.1795709688522;
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:48 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Thu, 26 Nov 2026 17:14:39 +0100
Message-ID: <20261126161444.2484980-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-2-dev@deq.rocks>
References: <20261125190254.176055-2-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:49 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
