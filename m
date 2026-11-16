Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=E4S5flkhfdrt2tllc2JPBcYQJJhVhb38TN9yEgTIZ0XPMKnxr2Kk7l9ghmdlagdMGsid
	 1HrWFYMZLN+4nXijaI4G3YPY6bwK3xwo46zMF6jG6GjhU/OmxjAxQr8laNmhpzcI75fSy
	 E6WoeTrtE9Re+YqzUE/tD7noPsWpgp3gS/FNJGOkgLWOTaHbB7gHaspWSVn2cDxIpQw7X
	 eOs7p3SJC+EyGj2FDHRf0UTLN5fKV1RghLLEpwPsk1leMCD8FP1A+n63XyBvnSBheAQh9
	 HkVtX5g4/9yovbU1ysofIzgpuUZGgIhOaUb3syJWD/qgnpOrRMoPS0GVEt9id4ejtZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=gtFmAHyOE78bGkqbzTCcG0H4QZlp1SI3v0Qi2FxYG0dc+6LangLhJGo9z5c1WKVVGs/D
	 1EeQFcLLqazlE4x4iQ3T9ad2Pm1WXe/kzHhT9ZrMdJfo2doBO9MK/CN/DQW4E5ckfqBLv
	 E27cn5dg8ZgF0wqoIOnPaLX+M83me0HvFR370Ad1ZJezYoNGk5XtHKylyT9Mp75RWX0vJ
	 t/YV+d/i/HDlsw/oqSOZewb3+uB+oe3RNDaxh6IJNEncCwoPEsvoWcOwXOpGjC7DVF6Y6
	 tdZbYlioWs6iIPQSTmkldQ/QuU8vaPM30h6YWoUa5kQwnZ93tzRs6Jk7UfXqRAfoA5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6839606A33E
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6839606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9496400270fso215429985a.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=dLdJyonbx/GT9GciisxRrbnKJNPmXRO37SMr0DcL0fOWPt4npP7q6oSEFPRBxyhYBG
         VwQv88je59xwJGF1tzvO02VHIK2UoI2gFnHM+RoqxVUasg9DyQA32ToeKqV0tOS8H2/F
         utZ+RQHXMciPdHoqR96pmDBV9oFbAflIPtcSFhX2+r9dDE0rLhaGZCPsZ1j517doL9zB
         RpfAbapy98a71EK1akS809jjM1beUX7TmDUaCrtYNcz/JJbJ2sGjj2UfCKl0NoQ68uWW
         NnufbW7FWZvXAJBZh4GXQ7J60xB7eIn/T76+zn9Pq4vvTPBJTSoxoiKRgL0R3QgrjVbx
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=DSd7XvA8cClWpTAX6Te2tJHXWa+/sReLfokUPbHcTHiQU1O7DHdKzCZ+6FsHq3MqtK
         W3CVFLCNwsVS1dheEpOZ+TTmjp6fWukU2VXCbcm0OAdCAZLyoD9Z2kuPCFm1vkBLJICr
         oJoHJXFMbjFslUBnaN4EQmT/Cw4zLMObotRIyGfyYJKnQtOdzymDRaGdIsrMRYiFOysQ
         Zdy6UPY3zzXoQltMmaQV9HJV0THiZ4sTquEqI1tlPf35qmmhpCkct0GinMl067xCCttj
         PgAw9RYijxtOR0+9HbtkhXVd1ZsKDNBx8AeEO9VF7+10+Je0wOyWwbedds2uLyDAqym9
         oSbw==
X-Forwarded-Encrypted: i=1; AL+hErE+i7Hk/g3In47M+E6cxW6kDjP6KgsBSz5FUKkMBCIxoYVWDt+95J95+8fF25hS3rhTohldquEKYIn+/EBK3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+jRqhXm4PFmtFBjOsQG8Bl4E33chshaM13M3SSBy2JVUVapqN
	JC54bFxpXuvcssrkKa8wJteginv/pmCIBYGIgLLzIts+AlTu1UjGYvDuD3sAAS6umds=
X-Gm-Gg: AYBFou36znWLdqUyl4LWrDxahwc+gbQ5pvG7ORmb7V6sNucw1YfxuvexvoAnRKCclRd
	gZGUZxGlgHWbRaqoUAtCKAGjCMdfnALUJaLBo6zh39FtxGg7ixgLQC1C6PHY9ks1qjkg+iGBJ1h
	rRRzDPRJWcTLn6159Mbmxj6+ADm4n2tI/5+AIuu40+r821FB3A7VfKiFUpAwxZ0PJal3LW3jPIl
	Pi2bVAT0ah7v8idSKQexbfhdwQG4U8UTSgScFHh0qhAKy9ccWxaww0H70gzTywzgGiAHBTTLM+Y
	BxCXfx83Gd98ZT4Awh7KiGhr5Wp1B1JcclLsQtgcUK0rrwJvsETJJwncQTQOkhH78nGMBuu1aYQ
	ReMJyJPDFKTzwVCDVli/9dztYmg5Y5A6ZiqjoergW5h3LXTG/a7rnPofazbfSglwnhBZgPWmV5W
	EbHoJtgAJekePZ+1HJ4ZG4xgBNj9I/AI5IVgFpSsV/tPJ43Q/4d22A4FxLR0uR3ah3ei/f1NV9Y
	Z3N7bH3uaL/qezsmlPXud0AELnVO7PoZCggRAYq0BS4WYroH2CNdnlz3UgS6aYOCzLh96VHZsOb
	kK22dw==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
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
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason
