Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703379;
	b=aL1ZkmnxtDfasmrxu1xpXMW3xP5YjaQF+o8r5l6T7qyx33vv+L88NTPrFSsEL68mpo8B
	 QiczUiVtjz0FvNUfY490pwcIu7akHQEa7tUe8emP/VM1CiypGUVfb9HS/7FozDfC3ayv8
	 fiJM4juIk+thYWnTEXmnnBIqbDJ0kESt0VGU9nYPri1gKZfwPHs9bsKYWE5gfKR6t0YwD
	 kcBdU9FnsUNIK4PqLZxnkXq+Bu9CmgSGQABhZBKWiXQJbjSYM8hfrM9j4q7uA52ACOLoB
	 UfOqpZnDaVs1cg8V3MbIT0ty8AxHh+1oEAXcrP0tbPD5jlzhjdbD/InEeYdTxJYUp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
	b=oBZFxNbkaHax55Wa0FwdBVZ2Ir7hVVhyYCeHN+ISq335EtPkt8TufK+tQZ8PclOFh8A8
	 o/w8xA1TUqpU5ryadqrFsBPBETW17c5cp04OUeSkAbdkFjixdVxjZYsuDxXzH15mNqdtu
	 cqZ8p88njnuG3vpjfypMDCQhJPoQyvwKsOi8QMmwZLUV8omLcSrVzNrWh6n1cwb2mdhnx
	 5K4vquudr/IjZ5sdy1LLl0i6F/dz1LZTErexO3g4or5jLvKMvLrN1an9ROnWfk1m08A0J
	 184JBzVMRbQkeb9+STdN+iGyGTbe8WyvadFELK3kV1VTjpJiE+KPPCW1XX5vUdXY5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BsSQuKys;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E5606A327
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568E5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BsSQuKys
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b439e37813so3673656a91.3
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703379; x=1796308179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
        b=y1J4LgWzz+C41LT8hRx6zSTb106lmZSXKSTmVRAqvfkMd0P/fA0iRJ0OiE9jQLWubX
         uf0RaH3gGHeJAIIISSG/lRtuLAc8yIL2cPubqHJk7mXFwBAqv4QGqSZPfy3Q3n635/B3
         fCOyUEv+K63ZCxTy9KYpxyL15EaeEV6w4Mr4RCksRxg8d2P9qwTZo908M6uhdxoIoYot
         iN40SU3I8DhHrszv4IsgNrf7jvBSD4oyIEyGORG0BVVMkbvu178rwY7hFuXedw4LE7M/
         XYEQnteMMoF24wJUOY3HkfT5SO2IImV6HPTuDs5N6MuAKVPtAhb9jBiThhnzUN3vwnMu
         RMyQ==
X-Gm-Message-State: APuU4Z9P07T0um0MbisNSz+xN0KKfWbZsuCVTRbVlifa1GH9vptN3PBx
	+tt6ndFNXkx/QSnAEl00qRwoBcbzFePxO9rNKvRsLuBzMj/fG8Ely5Gp6f8/tnufuMsmREGuAj7
	AGMI6/DFScP7Utekwr7JqQEnhZEG45EQGpETMptuKFDLJVrQkVQWMeXGvm1OPff2j82qMuqlZEZ
	nnGXBnlCXanvgOmbuXp7nKAQa3seTsH9wNp6k95E5fKudLz2i6/PVlkRAHql4wKo3sc3RUDAymc
	kL+SCIT6GHkWCK2xC9lG4p3loEA
X-Gm-Gg: AZFdTZd/7GUKmuWVs85o+BQwCeaaysm9up/hZt4Y4IWWN19+YE99K2AIS/qaent/jMD
	GrO5/tuVhBTh01qOBdNknsS3MzDBPlX5EVDNUHXRyUdpzo4nSM8adDUtGQWfOgwYqu+GMAIt+lu
	Y6I2nWlxKop6bC/EyzFtMIF8qSbOv3Xn9iC1kHd4QOF8S9MLhD9rTHjlSKDnwFjAYC9cxJSyU5K
	iUNhaz6LMCKAdkSTFQ0ISHIlei/0MS0NfJL6/x1Yl83GJCnvD3WlOzi4u2qd+9/fJFXBNRNE7Dc
	xvyEsXSaN395dlgAe3w+P6KVQalHmw4zLfYXNvML3XZg8GgbtGQ8FXctRVJUYcA97AOEclJfMVf
	+RjnZ8PU2FkBm1xDw3Loij0XBAPQR7lF5Pb7ONhB5ifXB7Juy5ghwZXGiHSEyuYPKu4S7Dq4EQn
	EKZgCACNlhT8AsCA+QWtw59g2Hp6WRqEV7zQTXe79Twg==
X-Received: by 2002:a17:90b:17cd:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b41c9d3111mr17456261a91.34.1795703378548;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b420093e30sm7621527a91.5.2026.11.26.06.29.37
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-542fc61841eso131972411cf.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703377; x=1796308177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
        b=BsSQuKysFY9+xKlUwoK2wrphRf88PtiT/0MgHXmqQKdjU8qdjJIXUnOr64V7OGdoMs
         scIse/N9Lm2an8BUh8g5ojEUO6BuDZIA4i/o67008+1e0WGk+K4qD9HMD16/VxXShxGe
         3cu5MUnwchoIyVE8IDGS6L4PTwE2scShQn12E=
X-Received: by 2002:a05:622a:4a8a:b0:537:dea7:adb1 with SMTP id d75a77b69052e-55d768a3a8emr386242011cf.4.1795703377244;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
X-Received: by 2002:a05:622a:4a8a:b0:537:dea7:adb1 with SMTP id d75a77b69052e-55d768a3a8emr386241611cf.4.1795703376681;
        Thu, 26 Nov 2026 06:29:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:36 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH wireless-next 0/3] wifi: brcmfmac: pcie: recover from fatal PCIe errors
Date: Thu, 26 Nov 2026 15:29:30 +0100
Message-ID: <20261126142933.875175-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-1-sorencoremans@gmail.com>
References: <20261105215954.184290-1-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:51 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> Open points
> -----------

[...]

> 3. brcmf_pcie_reset() and brcmf_pcie_remove() free the DMA rings before
>    brcmf_pcie_reset_device() stops the chip. In one of those unloads, the
>    device wrote into freed buffers first (8 AMD-Vi IO_PAGE_FAULTs). The
>    other real errors showed no such faults, so this looks separate. This
>    series does not touch the order; you may know whether it is deliberate.

I see no reason for that order. Freeing the DMA memory while the chip may
still be running looks wrong. A separate patch that stops the chip before the
buffers are released, in both brcmf_pcie_reset() and brcmf_pcie_remove(), would
be welcome.

Regards,
Arend
