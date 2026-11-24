Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=15BF7s48wZc7oZgYllwWVECbz/DGjcX9EFBXcNM7jpVlfvHWF0Y0LFmgKSIa04EhgfVh
	 0mA2aMdDVTnJDIiCtMuD31edGHoN3LXxcouQYaLq/aZqkW+g1Xvj9vy2MH5hFhar6ZUl/
	 URnUo/5LLWSD/q+zY2YWIpIOc9nd6NT76RKSnIYjs4iN9XgqqTrq58SfiVGNFdH0PYtEp
	 B6sRZh6g5dTa6HIPApvZVrXj3DJOX8obal+7Lt/mnt8WvcV/kOFheBu6d824Km9VUkAB7
	 kpq+hRYpA77TAqQh8o8dfWO+11BO4VEarHREZUGJsEb2tfpzKl6FyNwpJZoGzOuSqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=kJ0zWWyHeq59JssO0846bgNL79cMPZoK1bhmAtWZ8NDCCORTOH6ysvPHI8uf5Hs6QQjr
	 KpFTkqz5GCSC02/p4Las1YcY7wkQC+QtsgQZQtOF2xy70QG+PK568i2hJ9UBS/gORom0z
	 31dbVX+IhOeMr4waSf3i8GSCCLi6ifVO/NbXQv4aN0ncaqpIqVFXPXvkKXp/+tafkCsFV
	 dnrpjVfVUeDEstEdnM9hiBEs5dkZacXO89msxLyQPzIbI49swK9MPs7I6fkW4NqhFFJv0
	 IPHEL+ArxIJLHf5LMU0UI0K4w6OuEkiH+JLatDgHznQX/x+MQxQAmqIhs19P8Vr1/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C69606A332
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 10:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C69606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso40111005e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=onaMGflxXF144I7ISRLDuq0PXOjSZxMtkgM6p12tqQLl+j4aJbkqR01ishxVbf+inT
         4isDJq7zYe5kjNkf01JAwkE+hdvwvc2YQ/aMfwPHQhNUZopEfKBQuV4eSlKW3fmWhvhr
         h2SyA0oEc4ko4Sz6lQt7ttWFYwVJZmwGTaDqTzGPPbhO2Jg3et4p42/qzcrNHxWIjdcd
         vBgmG6zHwpGtmV5QIdOQ43C7Ca3a/lUDj+GDh5N0qF2AUPH499l5duYhmsuVZfGQM5FU
         +MkbHJXrvZOt2zT4Sis3uuEPvKOs5f5A8DFHX5geKe699KmCP1XW1YzQSI/T/8KFdbtn
         /oeg==
X-Forwarded-Encrypted: i=1; AL+hErFXbrY3Ud0eu57gmJyFOuYCALx2sn25b0nPl32r+UmrdHTMY3HScA/RxtfXBK46W3wZCNlFUFwv0uAloe6rrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8f176QQO/3iKgRfayqV4CEE8SOUpadhUUp/h4879H5z44TXKJY
	1rJsIxJoK1/nMCrttj3+0pvAaCAH4RKLgqrwz/QgIGONH+Z5UIArc/otUP0TimiI8zY=
X-Gm-Gg: AZFdTZfUMa4GuzFPy2+fdkfPxrNruy5WHjhF+YYUTd6yderdmOb5C6xEFPG9WB59fdQ
	2XM0kHg0+LjtwJA8uyepvI3UmPwnJukYk3nakf/A1pHALlGvKsKcMpPuqnhgbaIS/uF3A5Mgu1K
	gyzW46bGBy/1CiDom7MJCXrA0SZz1Ven9wlsUeClC2bwv7aLsa63SyhMfhZY6HJxb4fThBd1NDK
	Ji+Cp4m4YTV1H+KWaay3SceOxY8BRRhUje0y8Xks0w1dQj/BKZCZrrmxmn1g9cAMC2x5Evv/mez
	M9SnYwreiHxCzNmik9iEfqrjXyMyLBkGAlJIhGhOmEyJA/Oa94tUaxmcwoD2JFLKFgc1ItDPV7z
	rvEJafTb3rPPmkV12w5znADcfo7ccGIGr2fYR4cSj2RViy5dnMWjFQfcy2KrqTZMiQWoi7hI1+N
	RKLQygC1w+R7f3BwwZeC+zVTICiIFuKhiLbAJJUP4pYqOywq6+wcr2/3moEJJDUAl3oOoT4fzm+
	Gy8j+4kBP85bvAj3g8wt/ykZxfiwxllWBen78zkDRjgbCrIhJw+rZts1uoL1WEZVdx4LCWDmkJ7
	0o5MAGwPvuJKbRHB0hEzbgx2FgoYFBhjIQV5q8bRXsb5reJ39IQGMRB/2OdjPXRRD0hL
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
