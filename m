Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320737;
	b=tXv9HcJik54EAYP5Wmhm7iZRq2tPMXDCaok8jFX0aroORp259n5S5LMzaRkggmIoEY5L
	 GtUHM8eqDT3gbn994o94CHnz2EH8zMxG3iBUzC9WOw+5utGrWT59VdMRNgcOUg0D1QW7Y
	 scMRkB+CzzpaeF+XeHUwqvMwGl5QHjAiIRkhPOyVxwdS2ivK/Na+tkldazg9fIjXDaBFT
	 p7PW+Y9jyZCCr/skYEUExDg1OKh4ckTltU4BXqB4Z92MsnLXy7PqU4vo9mOqp8IZ8clM9
	 /ldUk5xozsNIJk+VeByMk5EA6BdLSPAHRr3MS2tqFbjsq84GDno/pbFjIWMVZ9VzE3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
	b=WVkhyi6wwa1kstXiDAeAM6Ri4ASSCmjcJS5qoEUJxYPX4n4ruQ/jX71GGx6WpOyVYG2g
	 TSOpUY1xreLfW60Wd138bx93i4gUs63zpJIZ4jKo3YxQSmgxp7ejr6tGUG4z/blgh//jk
	 QjxUImHIS7GKFd+V1ybbjwe7JuG3fOIQwdLN/dQEV7pj/IPzUqEYH9Yjr97kSWdPEDarA
	 hF+nzKX78vWk2Ivr5+ZmKJuDmW4JP42h/0cdPQKY/4sWiC9x8dU7WGzkmEx+Njw7dvaXI
	 xUz26LJ4uJJfuYd4sDK+zjLgYDpNchNxJs/WV46ah8rv1CVsIcyNVh/VVu7DpESwULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YHCNwWvx;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE507606A9BE
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE507606A9BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YHCNwWvx
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ea43af0caso21046706d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794320736; x=1794925536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
        b=YHCNwWvxZ2i5OqHQ+YUqQLCC1rzv2GgovdQMVYEwKh33tRosyn7GSIJuDa41qmh/kW
         zi7LyeKhFQOPYEl+gUniDWgNdaawKzYRwoS7Dq0Cx9eafD18pzSWOBgk0COIE+DG118i
         S5bwR2UJTtx2uoqYAeHAyK/dxjo4bAnlVjVlKAp5uCve1qemG+leX9AgPW5FTMSGevza
         aK8L0rcHuwhC3z9DNrC7UjQwC0QG7d3DQfBuriogPZkFVd264tz+6Hml+iB06xl4HH1G
         y8/vRZyBHrGKwiKkupF3SKK0bECjiQV15fzHQ3Z56gBpctujXKC1iL8VZGRRSe6K9b4t
         6xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320736; x=1794925536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
        b=IxubmTceXWSSPTx4LEko6QiECif/lmgOk0VZSE+gbGVumj8XK4fXjDzKoELBscJAMA
         teRKpmTWy26nGNSCfYLOH90yB3/x8FfGc+tiaWdUILX/jz+HCxrcvmh8sdKffILotJb/
         2zsuv77bMA4LJNSvJjH9fVCmT7lLDmz9PPviGlZFx5rvFlJP7oOjtXcL9yQBotJ/BlQg
         kI7UgGeXFSVUWr7rWegZXQNe0ZJRt+oI+gPjnFwlh5BDtCN0yjUN04Jics0oGvFxF4Xg
         gpOfrjB3mqK+0bfRUeMfbgfZ8iB//vqdVMJaKq7A7IGzZANGfFw4F5xpma0dZNymhvFW
         gViA==
X-Forwarded-Encrypted: i=1; AL+hErHQz1KBDYKbKq2rUYHSBxjUHcvEym3PE42pkdeoF/hbix0NS5pDOkO9d0GVX24iTsBUTzu4+Dmtv3BJUi9akQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9a88pEVRy9dF/nqjB8zkTJWG2vQLPrpzDqoXCINS/nFzL7pWRK
	bvzm/L6B65Z2t5CkbZIQDhHfOoOZIc7EwAI6iYZb1pJ5hS0IBNKHIz8cyx23DsE1YNo=
X-Gm-Gg: AYBFou16Z2mQJyyEHszvKKEJts6Rrg5h31BMqPhHWjDZfE5SOGVJY1l5Ob+ralKZbN9
	li6liYsCyN/mRHm5lVjjYWxMVgI9CIFoZgHO+qhVVnsPa/wpzzM/9FYrbEKluehkzrAJdbd8vtm
	GIv3iAteaZM967FV+a4dNwvpTMCDs+fm32hJjzSLgRnxLM2cCwByNLsltnyUSahzJGqG4M6n7HP
	GnuZ30nrsvJfVNxSYzuJh0D9HGKKaCoB15Bj84q92YmjlpJjlzTT+l8b1AnXL5EFQWQbDihi0D6
	00trTLftX10W8gQxDm9MI32bVjmoMaLgd74R/Kv2QINVrqfAS5pNa/kh1HUtEsHNWGYSJTI5XOn
	oNxXKqUubYUfwD2eLKyolwbO/83pkpLYv89Aa7GWc/cNRrWiNz2d7MxbVcvAYIRu1xKSfBzapli
	xy/KLVgg0c2jULxAF+TlWV/1iOXGP7zQVegCpqkJKNQJZyAPDSL3FN8z/ZxjPhWpE/juznD/pNz
	We6+JTViI5D6tJq9fTWIP8kVHmz9JD14qq44zxDsQWC9DYE2/HAk9z6ItZlEGHosQJKVZqWPdh4
	F0eh2fTgvRH0HWwrATL251BzN9nCo0Lwes8JG97Qstg7ATakd9IpKcKj/SR9pbuq4IsIHavajCw
	JzMNBjvck7xuz
X-Received: by 2002:a05:6214:5281:b0:91b:87cc:6d3e with SMTP id 6a1803df08f44-91eef628900mr47274136d6.1.1794320735682;
        Tue, 10 Nov 2026 06:25:35 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0501c1csm21854426d6.30.2026.11.10.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQmn0-00000005tbF-1WYc;
	Tue, 10 Nov 2026 10:25:34 -0400
Date: Tue, 10 Nov 2026 10:25:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261110142534.GY663069@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110122237.GG8635@unreal>

On Tue, Nov 10, 2026 at 02:22:37PM +0200, Leon Romanovsky wrote:
> On Mon, Nov 09, 2026 at 01:53:02PM +0000, Robin Murphy wrote:
> > On 09/11/2026 7:33 am, Leon Romanovsky wrote:
> > [...]
> > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > index b486b8bbd1fcd..8be2a246d4903 100644
> > > --- a/drivers/iommu/iommu.c
> > > +++ b/drivers/iommu/iommu.c
> > > @@ -1879,7 +1879,7 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
> > >   static int iommu_get_default_domain_type(struct iommu_group *group,
> > >   					 int target_type)
> > >   {
> > > -	struct device *untrusted = NULL;
> > > +	struct device *restricted = NULL;
> > >   	struct group_device *gdev;
> > >   	int driver_type = 0;
> > > @@ -1901,14 +1901,15 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
> > >   		driver_type = iommu_get_def_domain_type(group, gdev->dev,
> > >   							driver_type);
> > > -		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> > > +		if (dev_is_pci(gdev->dev) &&
> > > +		    pci_dev_default_is_restricted(to_pci_dev(gdev->dev))) {
> > 
> > I think this should be the generic device_is_adversarial(gdev->dev) now - in
> > fact probably all the dev_is_pci()/to_pci_dev() stanzas aren't conceptually
> > PCI-specific, just an artefact of the current "untrusted" flag being so.
> 
> I wanted to do the same, but iommu_get_default_domain_type() may be called
> before the PCI device's trust level has been set. At that point, we are
> still in "disabled" mode, whereas device_is_adversarial() checks for
> "adversarial" mode.
> 
> The below is from AI, I asked to present me the path for that:
> --------------------------------------------------------------------------------
> For a newly discovered PCI device with an available IOMMU and a new IOMMU group:
> pci_scan_single_device()
>   pci_device_add()
>     device_add()
>       bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)
>         blocking_notifier_call_chain()
>           notifier_call_chain()
>             iommu_bus_notifier()
>               iommu_probe_device(dev)
>                 __iommu_probe_device(dev, NULL)
>                   iommu_setup_default_domain(group, 0)
>                     iommu_get_default_domain_type(group, 0)
> 
> For a device whose initial policy is adversary, its state during that call is:
> dev->trust_policy          = DEVICE_TRUST_POLICY_ADVERSARY
> dev->trust_level           = DEVICE_TRUST_DISABLED
> dev->trust_committed_level = DEVICE_TRUST_DISABLED
> dev->driver               = NULL
> 
> device_is_adversarial(dev) = false
> 
> The active level changes later, during binding:
> really_probe()
>   device_trust_prepare()
>     __device_trust_prepare()
>       WRITE_ONCE(dev->trust_level, DEVICE_TRUST_ADVERSARY)
>   dev->bus->dma_configure()
>   call_driver_probe()

The ordering here is wrong, this is a consequence of splitting this
into different series. I don't think we need to fix it in this series,
but as a followup. For now I would aim to make 'no functional change'
and still follow the ACPI selection during default domain creation.

The long term goal is to detect that the trust level is disabled
during iommu_probe_device() (ie we are running in a secure booting
mode), attach the device to BLOCKED (which should be a NOP) and defer
allocating the default domain.

This would preserve the DRTM iommu & ATS blocked behavior through
until driver binding, giving userspace a chance to do an attestation,
turn on link ide and so on before exposing the system to DMA from the
device.

Once userspace sets the trust level and binds a driver then we can
allocate a default domain using the user set trust level and avoid the
above problem.

For the CC VM use case today there won't be a vIOMMU, and there is an
indepenent control for DMA ENABLE in the TSM driver so this doesn't
matter right now for CC.

Probably put this detail in the commit message

Jason
