Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844785;
	b=hvs9QZmU+zANIloIS2XH+4vUF5XwdEKySfyaun+0ZueYef+TuLUBQzQLV4mknxQGFSEc
	 p1gZNalEO7PD1Zud25ISsbLKArQsuhDKfBfms48i4nT8Ishm9AMCI8rRDxwoPFGNSoNoI
	 AAO89ctXvCe9M3x6Dq0vp5atZrZu7IPIIBZYp5FypbANjdQCbHkV8O5BO9qWzB9dkR09e
	 9jSxcyqafTjCIl01vT3wFmtWcwci1FHwcHhUutYkLTUuScnUYGu6hMedT4RWqDlUj0SzQ
	 S4ie2N8KCSf4S89vWEN12AnACvdSqUJCrEI8+D6YL+kYvObrYQ/cjAKTeQ6OBXpvTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
	b=MdPRnhohwzr5oBQwBJ+7bGs3z4S6wF/bMtljKEQhvvaf2q8kRJQLrDN8KBFThzwQIdcT
	 LSCRy+746H4IiqvAzQCV93k/xtdGVSi9jT6x1851lOSZv4uSfS8i4JblclmKxt7ABIZf0
	 MWL6yYDwzdLbjJN9DVeX3iIhBXz/9JDgAVviDRTvA7+GNmdTyjRbDh2f3S2GqkDWd07ab
	 8YFEQBuP+vp+nluWTVgHo18saYb3J9pgl4taeTUQm22mECAMF6MjDgNNUXc6LhW8O1BT/
	 kvR9+eg4isxONQMgKVNfMQSXjzJpXRkiIaGogtT3sXpPKLYkB4VC74qlVLBOh+WqLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="T4EaFVj/";
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB102606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB102606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T4EaFVj/
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso56873976d6.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794844784; x=1795449584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=T4EaFVj/Db2Oh0QQIN6fEsneaLWasSmYdaomNevHcWQV9XfC0eku9uiWRA8yiTc/gq
         beN2zhlEBUDpPwvlJXNnJXYG7SLeGP2RUl/CIxz8vHb+CRPGvwOGP84P37zc/ASqwdCv
         a2ZImH/j9PEIljcRTrH9YjQx1m9XzvHX9w4v1GGAYhpr16oDLUf0JwGEJPe+tOCosZjE
         d53ULE5uBklWCIuWvycUfx9hIvJ8w6anXEcNacgC3MbLl4k/Apkhq6kLpk0rmKpAkcTv
         Trqjo9GQ8ASe6EH/m27mrq6sK/GeD3Uc4wVkpatMXBaBSojYeEkRpq+DgrGx3awVmJv/
         hg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844784; x=1795449584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=YqOEPtRnWDCHSruy1oNmqvFkH6m95Va8A2u9T1s0oGGLad7fjbOGFvb9VpawoR2ers
         wfw/UayjIwvO3aeCEf6cZygdvYZvlgfpaig5CG6Wxsd/5961jnCylsR45yFx4BMkMd5n
         5BhDIdkwGHmMUe50rPYeJHqS2qy11nGFr1RBZPRSrRZiduzQ/QXgeAOnKBfM7/DSPBfA
         WIwAW4vo4XAGjAloPxLdWBqHlJvOoD1Qgm3bHeToJUOkPMZ/ps+lzJsXmNb+E8aQQKdO
         IVi3m25DIO5ndBS/HUY5tQw3NCMz0r1E8IzlweDBeN9a4I+uoSqAgEP+YbaYxrlMeYKh
         gWeA==
X-Forwarded-Encrypted: i=1; AL+hErHBVOrP+6A0zczVE75+basnPT18eUFKTYfD5exiWjuJIqhLjFJSvx/eJcKawcDbnqrG68pzgGPH7pgAFCYxbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z93UUbqQG4uF3WBSLlma/8FVn21ulwCW/gUSO94uBUSqNjXKgr6
	LgaOQZfRYMlGibbt6knGIkFlIfoRVd5vtWNVIDG0SPIskCjKdmtXBCwDm9O4yHCdz1c=
X-Gm-Gg: AZFdTZdzMX+ZwM7kK7IQuteO0my5KSSf/9gXi1s0BKDb3AIlfGN7O8E+LQEhI8w/H3f
	drN8tNGvxRepsQdfaSOIYuDeSqlsgaAp5oOVLY5qxVYJH//fFRUVfEGsNNuMFWh41h4Aii4pt7N
	PWCKy5owjc/Z0eVl28r6iUIXidYQJRSL6mN5JFU3UYW5H6Q6TK0eBuwyPcH1jENGi8SGYKUhqDV
	uy1yIsYtfjbe91dSpxRXY9mrze7vRQ46imNfBsTtwgKcuK38A1RhZBEWsOmPtMa7u1n2xULrP7d
	9/ryc4yY7EZIwWRs4pn8JkqmsOb+1dccehZjv5uvU5ThjaPZH/1ElXUTZEHqB1UjDPSngy8b7ij
	1sRwgWp3a/WkUj0qf57zivStKDOFXLHVNzYT2E9R1hJze/SYmt4uEIA8304pkNAWBM255kCtmjm
	wBMugDxsPHfBbn/XDu0hLowgzFOIQieXx4Sk4mekeHSelnX0PnWvod9Yagjyp36fZDo/evJORFk
	RIWBBhkvOI3PBchIWSPmEXujipNPLTZAQ2WOhYNnQzuNVlD6AJcuC8/8VMpafmZ/Mcp1gnMPxl4
	Qva/OQ==
X-Received: by 2002:a05:6214:2467:b0:91c:7f1f:2c9e with SMTP id 6a1803df08f44-91f24209db6mr171122396d6.55.1794844783992;
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm87735096d6.30.2026.11.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSz7O-00000009eOI-3Mx3;
	Mon, 16 Nov 2026 11:59:42 -0400
Date: Mon, 16 Nov 2026 11:59:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116155942.GA2299285@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <yq5aa4n8ydsk.fsf@kernel.org>
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
In-Reply-To: <yq5aa4n8ydsk.fsf@kernel.org>

On Mon, Nov 16, 2026 at 09:22:11PM +0530, Aneesh Kumar K.V wrote:
> > Once you turn on TDISP you effectively activate DMA, just like turning
> > on the IOMMU.
> 
> We considered two options for doing this:
> 
> 1. Via the ->accept() callback in pci_tsm_ops.
> 2. Via pci_dma_configure(), based on a combination of device trust and device acceptance.
> 
> If I understand correctly, you are suggesting that we stick with the
> former?

It should still be done in #2, just with nothing to do with device
trust.

You can't run a TDISP run device at all if DMA_ENABLE is not done,
there is no half step here so it has nothing to do with device trust.

Jason
