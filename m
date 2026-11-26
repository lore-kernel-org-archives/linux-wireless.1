Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703394;
	b=CsNbJF5sgCPzQwXRQiMystukwIjj4IXv1Hhq7fp9Icsa+F4yPEThXN8xOM447L9zUHQg
	 /pNUwe2YZ1oq/06xHMFFbuX4e9qMBaFvUgOy/mzhF9G4MBCId1/clgGxUwd8oDJywqGHw
	 udaXrqhvi11AR+PjihZgY7p8vZYD+U1loK9kFiVRLn5laXqxFO05z20FsmmrEjUTn4YPK
	 tHCx5S9AkrTPdAfyCLu7X9rqnOHmOuliMUvODyUa9zKCdv191j/vw33HMmGQanJBuq9RY
	 HSazbGEUARfUXhlSjEGiSx8IxsbWizfQgip8vv8e4ZughuM/V1ggGN+zHE6gbr3cQ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703394;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
	b=bsXsk0PIGqiGhmtBwinPc8ype1GmtQzgVFiy5P7zVIadaNXB+T3E58oYmIzVda8ZRBfV
	 hI/5damKVoNYfToEZeT//U8cRgn4Sekd/bKKfAbfna1uGCHoX1imiXfTl+P+ePrnhJQjc
	 r48qRQPXeztvz8+emoEYPD+35tggYVZcHeNmPpL3hthjgoU98gH9y61pzQRxw+n7btPfO
	 iKD+fyd0Eh7Pv2InJIqGNRsEJQBNzjrJB+kxBpqW5RPg1HP8qKdr3rXjhMSKj/cqrpeM2
	 6pQqc47NbvKjJwQQQ9GmlxpsWId3DKvU8c8ipvPv7clZld5K0GmS3wxVAcuSfDfp+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="VxbSpa/w";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E3606A32A
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VxbSpa/w
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso4234595a91.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703394; x=1796308194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=qapdSvNgcpDKKNvJTtwzjfQxVfhKvieF6j/Z8gIhsrn0df6WCg4GFQPfIAGeMfxSTS
         NrnUBzS4XDQ4+Imdc/e+MjJ0Dgs3izAhvUq6vjjxM8rr4w8wz5LI9eflOX1hcCJk9oNn
         pegkvPEhMtMM1wWz/VMoUvOrZTMrC18gh5iL1GzTHukRvFCqAPMUjoC0w6/L/MleQ281
         Uen3KePYXFK5KGOlstq8NIjTaVKiktVKwvMCPRzmqiNWgIzSljOHsgrUmqEjW0izzD4d
         RhOdnd+qnVyI8HGklqNOstDmjWhKLZ+pdTgJIAVD+fULhcHTwUE6vj9q7qvfmTrHOahz
         PowQ==
X-Forwarded-Encrypted: i=1; AL+hErFwcWfeboNa7wuoZbDw4yzokaxzkg4azueSiNKn4NVXoV0U8ixIr5TU70QLSHLQ3II/jHggpanKGviXksXhiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sipg9kfwSMzQHAFfTnSoj3rcKVtbkdqpwjvmVbnhdxrNCvh0G
	cOjd60XA82joCItF48hft8ukXrlDcvXFYaXo98yvxPlIwFY844DM5Y9vRi01BaleJVqgkGF/7TI
	aOvIkhreScN5d+vGVwS1fGEnLCuWdaMLCklgsmWIIyLlOhpa3osdMBwLBjWg4d4Y7S6VdmhoKQB
	BwFjzThV2L3/hITfYO9a4zMMMg7/qhi2uEF0/k7qq54ERWR4G1S4wgVZNvhfPbwVPK1GTpb/zNd
	4aWMAXnWCYXGEZEE1oZh1Am7A==
X-Gm-Gg: AZFdTZcUSGaLHQYNc+oB8snKNR8jTCfXFVTkqGopFvtGTQoupWB4GRpLXCADy2+rjB4
	eqDRZ+2BmDxDzn2580PHhl6IWwZy6lQ/o/x7BkwsD7IY6KgDeFdpdEEevKTPx4NjybRTxwOt2ZJ
	FAvxfiUwrIiBPr279Y0QIEk/VQ6ZK3KTPMoZAYR0PnEhNAMakCa9dxctlwq8Hr2jynOttuG7neN
	ZPLgKIakZJ2Qv1lsx/r6yvY15Qi1HjC6VTrS5OMc0qoCGelhJ/mP75C6hVIJGh104+Ch9CbXQxu
	2JDn4Pv2SAskWLCVI4KYl9ZQYdv+1oB0lqpZPyP3UKh8T9j7CurQZhdPNsNFnvBhjoabDl+8q7j
	8zlh9/BMLDRxT9AaFXoQYQIWupzRPze+AGuLr4+EUQUrt4VAd3J3uI26/hCxohhNtW/6yj1HoXF
	ead98NuL+Fg4LRdigsmS/3Oj65CVXqkltmkX5N28OrZw==
X-Received: by 2002:a17:90b:3a4d:b0:3b4:52b:4dd with SMTP id 98e67ed59e1d1-3b41c9c0507mr20821758a91.65.1795703393605;
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm14881568a91.6.2026.11.26.06.29.53
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d7544d113so131049831cf.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703392; x=1796308192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ni0P+OonBPhIdFE9YXhQeXLtmxxlE4xbNiyVqsQWDK8=;
        b=VxbSpa/wd0Al4wo9Kw2Y2KhH9hV1GOTJ8/pl5R26zk+DHmUFb4XhstybGpKHsUF+4v
         Qg3kKF9bIuS28mqZMmk5qLwCJb2ig8RDu44skCs7naCFHqqmWjW8JEfa7CECwTzgxJF1
         sDjjMLvcxL8zD06rnQZ3kplQ/3ZAu7VS4I2xw=
X-Forwarded-Encrypted: i=1; AL+hErFxQJIxonRLAvXtE6pMWCJCi8AoFCg9C20xzhwHbmu8UOx+rsnKIFARbTsXehWFIVD9Duu9nFLZmbN8JtCprQ==@vger.kernel.org
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394072321cf.0.1795703392453;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:2586:b0:55c:6d3d:b688 with SMTP id d75a77b69052e-55d767ae63dmr394071861cf.0.1795703392021;
        Thu, 26 Nov 2026 06:29:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
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
Subject: Re: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Thu, 26 Nov 2026 15:29:40 +0100
Message-ID: <20261126142942.881504-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-3-dev@deq.rocks>
References: <20261111120748.23795-3-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With host ready in the host capabilities, the BCM4364 firmware halts on
> the doorbell that brcmf_pcie_preinit() rings, before it answers the
> first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
> of the MacBookPro15,1 on some:
>
>   brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
>   brcmf_attach: dongle is not responding: err=-5
>
> The BCM4377 stays silent without the capability, so it stays. Once host
> ready is a capability the firmware takes the doorbell as the exit from
> D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
> init only when host ready is not a capability.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The sentence "The BCM4377 stays silent without the capability, so it stays." is
unclear. What stays, the capability or the doorbell? Also please add a Fixes: tag
for a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with
firmware"), which introduced the host ready capability.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
>  	brcmf_dbg(PCIE, "Enter\n");
>
>  	brcmf_pcie_intr_enable(buspub->devinfo);
> -	brcmf_pcie_hostready(buspub->devinfo);
> +	/*
> +	 * Once the host capabilities enable host ready, the firmware takes the
> +	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
> +	 * here.
> +	 */
> +	if (!buspub->devinfo->shared.hostrdy)
> +		brcmf_pcie_hostready(buspub->devinfo);
>
>  	return 0;
>  }

This skips the doorbell at init for every firmware with shared version >= 6 and
HOSTRDY_DB1, not only the BCM4364. That includes the newer chips the BCM4388 series
was written for, which as far as I know ran with the doorbell at init. Doorbell 1 was
introduced to tell the firmware that the common rings are initialized, so I would not
drop it for chips we have no data on. The B2 only halting on some loads also suggests
the doorbell is rung too early rather than that it must not be rung. Please either
limit this to the chips that need it, or ring it at a later point if that avoids the
halt. Otherwise I would like Michael and Hector to confirm that the other chips do
not need it at init.

Regards,
Arend
