Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873921;
	b=wxqcXlmpHYNPiku0WW8jS68go2/MsqLdg/t4gqyaPOTxAUlClaoNJvOgNM/hBoB2K9iC
	 vuEDnhHmmklRvY3iR8j8Mgyj8W5ckyKEEtmfNp+4Fs0/geLz3155rWjZf9eDAUH9yJ+QV
	 jjj1g0lexyK6L1B5O3ERVoQRuDVNWUPhypFvU+cK4tVVUZZ0zhQrOZyTGm5c5XIf1uIxl
	 46Knrkg1XEwF5mZgyBWbIEQVzMpIMCSpzcB0hbJsepjfGbE5xxBdn2q2KwroMSEaZkZ0M
	 axH0d2EnC4LKecGg435wGKy22MPxt8G04v8krkFOSa1/Fs/JzBGsfgU1jRAoYOj7A2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
	b=evOEJ6oV9CBtXpd6lFwrwJyl7EmyGGChwWzpshqydVByhaGWx4NJ/+0MRa3ip1Kd0bvM
	 2BUfVJuT7c9xwfISZRpLcJD5Z0FIDmupPwmS6d5lKGB5VvivpzPocKyT6SXp4O5FvS4Vp
	 6uycxhm8shT/nyiv1g3F+mlZu/bwlfSeM5xaGFU+4lUkRykhbrNANraFBqN5zSU8ZdKfT
	 sOCE8Lyl4os85dBgB32GYHdVvFA/V5IP229ZTUC7vRX2+yoVEEjFB8Fa6qSbrp1Z1A/65
	 0fCD+8HBjwgUwLBCUAGa1jgrcBA2lhQF/T/CxI2e1sOB6JcB2Jon/1K9w0WY9MKI4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE2606A32F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AE2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-949589c1495so334703385a.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794873920; x=1795478720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=o+1molFffc9e6T9ddIDnNeseSjzEf2bQKujHs4vpOVw4OzSSGS4YQo8BJrSN9kd667
         k9JFBOotGGRYa0PkAFx2E0FiQp1pgsnwgn6pcnUL3Eya4+1ObVIZXwVWtTnGOXsLpAKM
         Qm4w4F5jBIoZdwaJAnrycuNhvr/nMKvlaRPWeoY+KemZwqtCHlIRV3pKlOZAan8ZiPyk
         dg+rWFVtziAEodqueYjujOY8FQIiLOIqi0nCOki4SNuEx/vo4myxz/px2YhfTxnQyYx8
         5SnT2fX1BMMsw9KBqqyDMrnK6kEETUe11lAAN+nPzvpxO9VlnJiaiLVZSGU+NSdcdbag
         q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873920; x=1795478720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=LmlitLskmoz/+Kyd956KvFr5ti9eJrwX6U0YbpAP75E21+U/4YK9S0NjNZZiCN8gKG
         ESdDsm7kf2gpSSYOR5VLN0jwbaC6Oh1WpX8Zz6Z4eYe4WXGVq2f7d5ozlU2tc5aq7XNJ
         NLfYt3oJAoHpY91+toHZX8Rap9Z8rX2wbJXaNcT+7ZzV5DPNKZb0xi4ezx1Nt9IPZI/4
         24q3jaS8a6TJv1F3WTs6UE5jbNPSdhxwjBniAPrJd0gscDFX4WJ93oVu2Tm5Dzzd4/s1
         tdlTmEGiAYHS0aGzNL7Nk4ZT+r3VQaRwQBFIX7L/HZmP3TYVs+Wc1FNE77Kex+0rkKT9
         UabA==
X-Forwarded-Encrypted: i=1; AL+hErE8OZQ61T5YFYJ5a7udqHeHGFTheDC6FGWIcV5aEe2pajFksO6yhftNa18qbcjRV2IOk3uOyC0iLrfkM870PQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z83KajZguJ61CLWNcNZojMMS0GBvhkiBgQjvEU98K8KVp5GzjOo
	8qG6tEtnRwp80J/9UQN5YQsfoqkKdqblhXBLcXZWSUGcxOEHewOr3oMToO2S/Ravqlk=
X-Gm-Gg: AYBFou0lnzkXS1D8VCD0YlGW3jMmXF1wUSvUFkNdcYMYtsGxkWX2VTY9IE/aK65oKi5
	6+6/rRwNFsL+nnochmmUe7/nm5reK1bsNlMPWqMLAPZ0F6d+ECEKU9RtauqjIsZtqFiDa66Kcuq
	MFAcKQRPigvKQso7zwTGbkpMz9S1GOxIH6QJb7J5+DpNHWZd2lio+2cypoLDHyLzdQlWi9ZtS++
	8g1Atk6qkFx4znbYXUqtFKf52Qaaqa4JOeiLHetWr944qM4hTFxnfW7LnIKNuQTvcqMS+z2jUMd
	OoeVuxbZcxrpupV08e3qOx71FTzIez1cubisXmF173PEJUSPrzgsh2wKR97S9YzJRJxTdbJ65qh
	vK57jHY9F70/l75ckJ6pWP3SrhZhgFgW8X2URuJaMYh0EGbuHyCZzDsCI0KeipCM0ygMe7S7FU/
	+S9dCKbjLzIWQgJYJsP3zYJgFHtqLizNaaG4cu3PrpPV63W44FhoUz9iU63aS9PqtuYtKsgooOK
	RamzNvXs/M+o9YZ3LjEwWIF+HoBSU79nlrtvZy5ifm92TWceJ4OJ8IKWCnTu3zn2bFaL7CtQA8w
	EfnuMg==
X-Received: by 2002:a05:620a:aa0b:b0:949:7473:b1a5 with SMTP id af79cd13be357-9497473c077mr807892285a.55.1794873920005;
        Mon, 16 Nov 2026 16:05:20 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm969866585a.32.2026.11.16.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:05:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT6h7-0000000Apgy-1pGN;
	Mon, 16 Nov 2026 20:05:05 -0400
Date: Mon, 16 Nov 2026 20:05:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
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
Message-ID: <20261117000505.GA2488304@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
 <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>
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
In-Reply-To: <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>

On Mon, Nov 16, 2026 at 05:13:59PM +0000, Robin Murphy wrote:
> Even with the slightly dubious argument that this series only intends to
> shuffle the existing PCI code around rather than fully introduce the generic
> abstraction that it claims to, if the PCI behaviour is still just based on
> propagating the internal "untrusted" flag plus the new global override, both
> of which *are* known at add_device time into the common trust state, then
> there seems little excuse for not doing that up-front so that the new API
> *can* just work as expected.

The desired iommu flow is to start out as blocking and create the
default domain only right before driver binding when we have the
correct trust level.

If we try to do that without this series then we have to do it all the
time, which I'm really scared will break some embedded thing that
expects scanout to work or something like that. My hope was this
becomes opt-in based on the new command line stuff in this series.

On the other hand this series works properly on systems without an
iommu, which is pretty much all CC VMs today.

There are probably around 15 series to complete all of this PCI device
attestation. Without everything it isn't really usable, IMHO. I'm not
that worried about the series ordering.
> > We have two levels: policy - that describes the default of all devices
> > for that bus. level - actual decision on how that device is going to be
> > operated.
> > 
> > "Disabled" prevents driver probing until the device is authorized,
> > "Adversary" permits probing and requests the available protections
> > for operating an untrusted device.
> > 
> > Both need conservative initial IOMMU setup: a disabled device may later
> > be authorized as adversary, and authorization does not rebuild its IOMMU
> > domain.
> 
> Urgh, I can be absolutely certain I'm not the only one who is going to be
> confused this way... I see "disabled" and instinctively take it to mean
> disabling the device_trust *mechanism*, as the logical thing that people
> will reach for in terms of "I don't care what this new thing is, just get it
> out of my way and let my drivers work like they always used to; I want to
> disable the new thing."

Maybe "isolated" is a better word?

Jason
