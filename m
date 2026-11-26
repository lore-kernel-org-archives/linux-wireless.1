Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709698;
	b=HjV8kJvSovnxUrjLFwdjjBxUm1iEq/A3nKj3TYel909HwyO6gb3lUXIp9XtEnfD+Gd1C
	 kTwcFzoqDhqmJeyy8sFaRjJ+iF7BCBmoyW/GfWwmdSZeJp25VpWPCObuDqMoPXCmrANBH
	 cwqGtnvHTKhIeyZrCyeovKrquad2rwZm2V3NldiYSwpOjVSVdaxxGrfEKNnrOe5enkt3e
	 4oVj2BJxYcaQLqJnmINIkWmx7LWVxTgavEtCpit1OlgH1wJ6mkN4YKE02Ly1hFRlLL0VB
	 gZIwLAh9/82WHg7zYV3AbGhrMLbMIZ9zdDR7lQUfl/QDe5d8lVTEsXiIctOzI6CxlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709698;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
	b=Cb8juZA1F/iJgPFKpSjXF9NeOZDmpV2qdhWJLgm/OcA+FhhXqeXrqcy/6U79a08imEGG
	 wn8Ulrl4ZD4CPDD4uks2Ff/4hZOCYRW9uvYkwpOuOIjWXGZgOiQw3b8fLmrqDTOIOdGzI
	 VuJhhxisVDb176MGFmVnDiec+CeITw4o4phq/4DCNojRMP6Rzhy1AUBgopKQAHkCXzT7E
	 vFSq/nKKDEXdlX6iHjI+qc5kUPUBwZB9+zUxT1xcWSpvhc+93+GsmFhp+PF6pQLf5z9wM
	 9xBMZYf3L5EEIA85nnr3DBSPaKOwHZskMfOe9orzp6NdeUKrj6Eq8QrRLicK7Sz7tMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jw3FJh6o;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E0606A69F
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90E0606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jw3FJh6o
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-38190551625so13887980eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709695; x=1796314495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=wJ1eCQE+ryeu1ZUDXi6DVn6aQg/RBidGMphEKp6gbpvyLbyD+QdqBC/jIn70vsKXHi
         dDj1l+uaY5FWg8DEqIOP7/WhX2Cw9pDKFAiY9kSQuaaag8YmG4K3BSnRMMV0u500kRYR
         AxsVUSL5dInG2uDK3uGuPNonb6fkk14n96T8PaBjwZtoa8KwxOoHpsFnczKBREgAW3XC
         AdCWGZPc3tB5On2Wx+dpg6OaCsm6c5USwJpENDVFxh9tkBFGS1pLXVfr1x/lEpUlC7wH
         I+NvxLWhg3MtRosRBGm7me4IS4Jl6zusbGKGa6T/OBDRZx6zKLa3aB2VwyI5MtJK8L+/
         AXfQ==
X-Forwarded-Encrypted: i=1; AL+hErHgRK/zxWRaS+S+TO4TnIC8qR4DB1V4jFkROqKd787l6OPOgpXPTIOs9bjA200EFGCfgGNFyRTxUGTyQ8h3lQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xc7K4GiXwOz1nqxEllhMASGHIZxqK78OcCXgZ/MjgGZgRd36V
	C97FcaA/8yuQhVxIeFJZ6pr3CDyTgGbInKclxWyiu9u6eGHYU6WjxPqMcjBAekkFKYUhqRxw9qw
	lLJ7XWZLw7yAnTbYzwjHK0EremdmNBCGX5YYCDvr4fz1pHr6Hrj9WraIA2Ikr/dNWpvgyb3Gekw
	mu0MxOyV8hPL+kwpgXKh8XHCWek/bDOqc/9kQITg1j2qSclioJmJANn3I9rwSHpoESNLeDmF411
	4ciMtH08i9kDKk120Y1mitbPoJi
X-Gm-Gg: AZFdTZep+Uwq2sMSNBk4l1cLMpdk8mAx99TBUXAUmrgaKvZr0ibttXOk895tlhcLAW5
	oSj0hG9A6Iy5IA2ySP1V2wZwafFE9455J/aU3hLvVU3ryMXb2LW5i2tCeX6U98U6IvV90ZqOlqH
	cSqwheyUs3r2Fa+KBJOciihlUkCg94ywnu8+5LEFYxsN2BC4x6FD4VBCdtmuSvQ+J+lbscBAaSw
	CwmU0I1HTLyIL0exDvrkUWOMZnT4JF5WOOCf0IeGHW1juO6G46Bi5jSYkeWxbC53AmckQzjb4rD
	0rlIy2BPqx+qLeRtDFiBCd3B2gdcwBcWOnHQAUynAo78iP3Tw8+SqJ+/DNYWMBD6BWNPlDefUtS
	RUNHsmFvAL2Jc1y4TpJFBkjwxbL47EfiGgvYyYMls+gU3FZpkYQvlpvD9BUJgG7j6LWNoV38D/H
	j8eUm/VnAwrdIQlRcBTKkpjTcwxicavmSqXOO/um4JJw==
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr12396366eec.16.1795709694683;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3856466a037sm3351497eec.1.2026.11.26.08.14.54
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso964319985a.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709693; x=1796314493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=Jw3FJh6oFHQrn5NzkXdxTwc6XSaMka39DAPp5SO/iPdJcUFtIgkBURB9nY5XoZWD7d
         nWnE8zEWH5F8pWaxSzrMD6BC1zh1Pcfr1jZTi5whx5BOi04vEBrtc95tVPDd0Y+n2I/8
         jKB2P2CIdu3HKsuy2ubLGAfrL2LJgl9e4bOm8=
X-Forwarded-Encrypted: i=1; AL+hErEmUJ1X7u+DGGb/Bh0yrCl6rhkX2qlTNq07Pn1FwQT+wjWrBo9f8EtxeWgxbzhxkrpc9kFaKWPrJ2KRtTrmmQ==@vger.kernel.org
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743263585a.38.1795709693230;
        Thu, 26 Nov 2026 08:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743259185a.38.1795709692822;
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 2/6] wifi: brcmfmac: detect AWDL support of the firmware
Date: Thu, 26 Nov 2026 17:14:41 +0100
Message-ID: <20261126161444.2484980-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-3-dev@deq.rocks>
References: <20261125190254.176055-3-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:50 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
> Direct Link (AWDL) itself and announces it with "awdl" in its
> capabilities. Add the feature flag for it.
>
> An AWDL interface is created with interface_create version 3 and
> interface type 2. The host gives the MAC address, the interface index
> and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
> definitions for the interface type and the two new flags.
>
> The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
> every interface_create, including the version query, with
> BCME_UNSUPPORTED. Keep the flag only when the firmware reports
> interface_create version 3.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
