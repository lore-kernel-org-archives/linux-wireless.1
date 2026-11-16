Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861449;
	b=A4lUGP7nRVZST/Rnwio6wH4nBK98SSYfUeH4hzUBT0q6VZNVdg+CfCsQ/lJgvzf5xFrc
	 +rMU6XShpA96dy+Y7wANil3tSMi6p+DcHiYTs5lIWrpk2onPfjAnH2tRotUu9W5u8PdGs
	 kprGzFeH7vDXgD01DDj2fZ1lDnbbdgO/Jnx2C+H6TSYOuG2l6dXrjKZI/UX7GcSfrlZsr
	 TTWENAVk0mTFkEVni81E2Ogbwk6uj3/IqDHTdDhsRskwXu+rVC34Ew50ybdVyrTxDEgvG
	 vWNVA76SSD7ypBL7SoiOcYs2fVUb33ACPuo3mK+FVN/SfVe+w6Gyc+Q9UaTW2V158jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861449;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
	b=vBOKdVnOR2czrt12btq3JJge+ENu/7G5ZwSi1PnbnGKFPLJsYLl7UazfZ9hSEFcutB9p
	 D17oLUHa7mhNU0SeogSTZ0Dbb5x2EEykGDWQ8p1Zb1GGdM0VjQ3JY3Obdw3A0CZ8LOPFH
	 bnOlbW6WL05ncOt9ccal7Z2OR3P10GRK6KF4yoEE3TECq38kaKevU5GlIYLWheQtQ+6TW
	 794NhBz80OwlzyNk5WXKo1daY20SAgx4IKUiq9MafW3hTgfGxgjuKOIDDLiNr9DvbN7Ae
	 g/knTW4IRomlo706BAiLaMMQDBqM7mT1OEP0Hr8xmSj6CM2XWWuO80DwyF7VXzSZybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XjVceYwr;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C334F606A329
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 20:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C334F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XjVceYwr
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2992837a12.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861448; x=1795466248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=lVaBitrYTdge3RvLiTvvLYe5mJQWSKB1cHvY7my91OyRC8EljyuJlkUEY0d29T81JR
         4WgIp+HcFIN4gtJXbTqBbhosSQ0PbzKtSh4cN090UPJi9Bbu5ccaUJ7HTFnSZGFpY73D
         Zrrrvqrn49n3vTJd13g+rHR6x0d3mwEMdSpRiBMNPkyq4BRb6kTol+S35iNl/nKkzcrU
         LpOBniWTc+wUbMZNlUlyfIqyr6sGoawZFiYScOivFJHQHhCGk9Df0u3DwoN3eUAcifLb
         HmiSAHMUOisYbUZZs1LG0Jey3ARf0DIqnK5bjK0cqcr/q143s7mAqi5Jhh+yZzpJPjyf
         1Nwg==
X-Gm-Message-State: APuU4Z+pPeOzO6KZ+Dh4F2mT5Ck9EmazgnKLJ28AESahcGUWQ/yrh/+u
	8ZYg1ERHstE5fSKPkjCM1krgW3A1UL0WpwGZylbDeh5fGyeesMv0Ey1DthCjvv550VHTWfC0cM4
	LonP9sorRz719vragVNbzSrUSlejlBt7xJE630P5QuJmfHwYczEC3IZbYWzj3cQlkJTB5N0ZW+V
	9EVHUnYU+U54cXM4ovRN6QIgJv2aNFPbmkl/Kob4gbsVQhFtLMYn4qhst2DILxAQyqgvMAm0wUP
	6HP/rqDbwcwm0NXtD/vlwCBDyEt
X-Gm-Gg: AZFdTZcCHAFDVWj6/EZ1vsOOa3osaDGfL/tQeOG7CHo/4uyNnXK3JU7O+bCJYU8DZl9
	E3mk7tq8YdhaMp/DW8gma+n+sS3rhnYfhI7+z44bjmAdM8b5cGqTg1Xfpy8UCdk/+qAv52S4H3A
	OXU7Gs9FU562hNNMIt6ZTteX20tP/3vWSDh8u+aKeGFycLRFSF6mmon7WaK3mo/thIqA/CENjB/
	FElD5jeU0EljQD9CQWom6NZuVEN9sZ6w5RJpZHEh8Q1YNMs6E9yBrgO6pElkIwqpvMJLxu4Zupq
	Fb1IWcBOD6OlQRQ4nAq4+vLLMUI9bKYwV1+hReo98jtHlF/sqZHhn9isB0RdZTRj5stH7/4/dUh
	S9l92cUOi7F1THfGHO03sGvMv2gmZjUxPvlovMm130Zp7WPtG+RIZvtfyNdu1LRLE4sdsydrj8k
	zetu6eHG/d5yKh0ggg5NZ7TA9f3SykzJOeTnifEWL8Bg==
X-Received: by 2002:a17:90b:2749:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3b1b0cfd813mr11064274a91.50.1794861447890;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abeca517sm346816a91.8.2026.11.16.12.37.27
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3843748eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861446; x=1795466246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=XjVceYwrfAgpEEB+p0FTO/pKtIYXh4lgnCCw9NOd1uFD4l5nuY6Cir6ez9JdKQZ0Gn
         8X2ZvAC41KvSL+JdnuXTXFYdUwvWRcFUgfeXL293dkhj+5lKeSBb3ydIezKtkKHG5wIl
         0VZawNkspPmJmd/+hBu7Nn5wVsRFXOr8Qwl5c=
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214375eec.7.1794861445627;
        Mon, 16 Nov 2026 12:37:25 -0800 (PST)
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214351eec.7.1794861444883;
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: keep ARP and ND offload off on the BCM4364
Date: Mon, 16 Nov 2026 21:37:17 +0100
Message-ID: <20261116203719.281605-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151620.70671-1-dev@deq.rocks>
References: <20261104151620.70671-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4364, ndoe makes IPv6 downloads collapse.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/core.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

> @@ -103,6 +104,15 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>
> +	/* With ND offload on while awake, the Apple firmware for the BCM4364
> +	 * makes IPv6 downloads drop to low rates. macOS runs ARP and ND
> +	 * offload only in sleep, keep both off on this chip.
> +	 */
> +	if (enable && ifp->drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on BCM4364\n");
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

A few comments:

1) The measurements only implicate ndoe. Do you have data showing arpoe
also needs to be off? Otherwise please limit this to ND offload.

2) The commit message says this is an issue of the Apple firmware, but the
check is on the chip ID only. The same chip IDs are also used with other
firmware builds and boards (WCC/non-Apple), which would lose the feature
needlessly. Please restrict the quirk to the affected platform, e.g. with
the Apple board type (settings->board_type) or a per-firmware quirk, or
move it to the vendor feat_attach callback instead of a chip check in
this helper. The same applies to the other chip ID quirks of this batch
(txbf and FWAUTH).

3) This looks like a bug fix. Please add a Fixes: tag and Cc: stable (as
Aditya suggested), and mark the target tree in the subject.

[...]

Regards,
Arend
