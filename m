Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=rigzSr0GX5vYTC7iMrRaPDoMWfTppjFsMTmfha9SSZZqepM1/REtZs3BeX0glc2NvB9a
	 I+wXeXr5RXi6HgU1+QUb68mN3G++5rFvirCD1k9PfTfnOKVo2/ESt4OT8rKOHyDVgMhP2
	 45OZtkp8DevK8ggBQF/UnO1zWb9CZGUxMSyGvORfD1bOyZpx+VfY1UZ5UQjCbgwV8QCTU
	 XSfi4BzZXd2rKMgbDwQQyri+RhBOKR5xrLwMgKwqt3Hit5KfMcIlO0rtvIFFGsqm8neNz
	 4969H3qiAUaH+/CqsUNfNPt4CT4qj6u+wTixiFz+hQr0mrdudfjCofayv8d8zFAagSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=HprvwdZwVVumOnmRrcZ5DGecdFQwvOzs2yxJ82QegYiShAYYTSCD43+CNOcdC51ukA9H
	 9awplB2D9e9aZmR+4EtxgMUk0sFRgL+jsiCUT8NeZhZkxV7Ob3f8XZ7fTjPN1D9Xyh/71
	 yo2jHwIYdr/dtLIRAzRcIbUr6cOQ6DZBiCmBgt9S1bvQKsr8X/qPP2+1WYSn3zusD5JC+
	 y4hj5l1MHjOZnBznYVABjHUFbVOvluWXIv5CNAitvToIMQ4vjvnjEDSmSJddQu3wUTjKi
	 reLr6x94oPvdTf6nC18TKCJe3c48J3224kj5piLA44L1lntmreEH78XsvjgQZW0LBCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DB1606A335
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54DB1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55d03bfd477so25683711cf.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=nbZUyxTk1xDDi9/JiN9In9kNH24m3xvR3W8MPaMB063K/nb6P74sDih4ebpP83k2np
         SjqTAYuPLCHW+FRVrjLKSTbDX5aM/IVbZZxu+ASYJ/ssH0gDFbMJvSJmLcdHAAsDSEL+
         FG47SOuU8PRulqvpOebFRdp+iKyncNtYeoKxWrzhMSjcb9i+1jD4cThvDUO+7PnMd3zc
         ImV7NXhI8pI4k1LW/eM2oLltJhXP6hUveoFekGEVH6+oWgooyZkYdcVCIAs0jW9hoXxW
         5IGbSHDAmwoeFMTug5VO+bv+VKknP1f2hoIrUsvWYeNqALAO8eTePO8ZOjSwRNnR3p0b
         L2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=x1DwstVHnCz0F4+rvvyhb4oDC5hExX7jFonDPOTdFndtuxloTwMv0Fi/+eAKav8bkr
         VM7mdmqwth7w9w++wbX92+yeQ7zjivHvsoNzQ8DWrTFqRZpvq4iIqFg2AKyoFlkF5EBU
         j43PcYvdThnfr7SSwc5qJRFNc1Y4wBL56Ak3x2a8bt2TOFaDDw9bfBoTBsPbPY3r2FFE
         Heu/rAZyymvBqML3w2m+n5u7ixLW5FnUAEj3jNzi9CwTO4BKGmzfZLp/PqyFiuh1IJsw
         PSnivznLoGhAITFXIp/Q96+pkhXVVetMFE2Oz26dLcjxmNok8MDGR3pM3qXDmiYE29Hz
         qe8A==
X-Forwarded-Encrypted: i=1; AL+hErEE1lyd/1JOgmZuklm72tzSbK2R/sCZy8Saw7g5DFlZtw41DYpBCsWKa1OHCGrfop+syo584X15mqVGjDijTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3FZ07SYhzQm5GodSNetY/IbjL52V4ZEEiAml8irsC331qdLgw
	VZARhlpFBLsu7QlYQRETku+azRs5IzX4HyyLg6+T5yMFofqljkkdsvhMrU8Tkfx67ro=
X-Gm-Gg: AYBFou1mROjdbjoiHNN6gMPZJnJn7VUhA9hMPJVVkkuugyVHJa8GWzvbdzm/w5serq8
	rsYA8r32KhIyUXXFZyb2voKt6C3QTizLwwOYYfdEKRujVYqA5XE6LRy+Tayxl1AqRnWfLB3zwQF
	ELKA1GgC+WrIvqc+TseJQ7w4aEa+GTs4QvNg1/v3G3jmF+bv51DZcz0YKUqkPTBPJ/ABzaCKYcI
	XHU67zFi4J3D6ItRMUwLozYb2r2mGTrInMUWp5JONlX7Hu5c8+82JJOR9jMJkb3s50axQJ5VP/Z
	klQzWwF8sQ1kUOiswSfh3OVgedkAR8xaJIep15nzLwI+Vqkr6NxBMi8HXHrPrJtmmFqr8QCvYzn
	C19A7POVn7kO6/z5zWkYDeujQ885TchjGw1wF9hqAAJ4gE4vE8u4OhvhQHCM8tWJEc9Sm7nejDN
	cscgXm5t9BazLB5DW0OWiZ5PS/lvyeLmIQqCiZBKqDJF5gwcr/HOnU6f93xl6aGlImDrDEs9m57
	hzgAVyeiG6CBy9Vm/Swg812R5E/JHjQQGlVlT4UQpzQGY7T+rjO8ZZveL7m2/rwS9bZLUmT2pHU
	59/m9A==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Leon Romanovsky <leon@kernel.org>,
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
	Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
