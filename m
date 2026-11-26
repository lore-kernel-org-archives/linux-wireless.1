Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709702;
	b=EM6BDhGp+stFi8XR3lgQxu6uaVRZ318U9VaQVsedv5WGmC8knLnBAh5958zIXQrc7xxi
	 EJl6RQXxd9Ac77LDu2a4IbQanaHPGZuM2P7jNar72OgfPN1ZzMHY9/5SEH7nmHJxIzYp/
	 wmSNVll+yM52xrU4Zlebxn3k8IEsN9CqFznUDT0BSar6YqvwIIu6Gygn6gnUwacgF3oAp
	 +esIxrTy9zdLu7te8fhNThbj63lWP/KfQru11pt4d6HzyuNTUGXOLFDwqqKFQffTTyvCh
	 khqt+9Mm5VM/Q8ft0ejn2XrwUrx/IxoZqIk9PpBYeWhV3wsVDzZY8fZyY5qtB2AhCPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709702;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
	b=gPRVT9dK+7/PL3MRJUxKq0HgmZSbjMhY9b5HqQ4+HRL9QrULd/yrynY8/DnD0UXeFmFO
	 0TPIb+w4EEf/HBaohEBZoMGkz3Oq9FKmEUta+t8fPMVDmnI+SqYwCUZrxOxS/voXkfZPh
	 L4wmcd8SwVGfPcuQ4aWPkAU9+AN9b6ECREt6eJGbl7stwi7FyOBPniqNtQqbgtEZdRz9/
	 tl+gn0WR2FaOGl1JJSitxaYDJLjYE0uvlotYSrbmB3/Cs82AeETY9iig1oU3lVyGXAuJH
	 RDY31GeNKSCYN4xxMsqQE9U4ip0UlBU+JNURxHjRjSOub0t5P8NAN2sQGnddRAVG0JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GbtOW6Sa;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC016606A682
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC016606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GbtOW6Sa
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so3679942a12.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709701; x=1796314501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=S+oBvWHfujUF8J/CpIB+b9iC/0tlkIAa7neWR82kD/57KCI6Tdv+n0qTZkPmBTHfVa
         T/dpD3YflbM6JGdi7HcFAwsLLpHPGWquNN+Ur2eOE4vD3DFoBhZiRODZpGCYMBwrHWkZ
         gayjgo6P39IgjTiXRhN1k0l9cFtjp+NX1B/Od+VrijPQ7JVqeu6LGGTBFNkwNhbGz30x
         yScauleA52BPGBBwS2N4ijxtYnb0C9qn1GM+XhVbWAGeJ+yNYSPkrNlLQAsvUqRRzBCF
         wYvSCkh2xveVX9hHd8dv3gXGHR9Hh6bGpyxczMP/W+oic/2iK7HgBUONYkywJ5DUHI20
         7XuQ==
X-Forwarded-Encrypted: i=1; AL+hErFiQzJqMCkuvQdZSv26AEPwNLz1uGQ2lgIT1yrSrlfNrkEnvGLF/pvowa1LD7vJJERi2kwlF9TMJo6E74VYIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SuiSQxBjXKE+q5aDKc8M0ScLaBO0VEhCD/vXI34adgYU8PtTM
	AyQxQQLTP7k4FTFn7+iBfvMXeOp+DJSie9aau1N5Gn+0sxML0iVLkoq8bsAwohzLUBhhF4a2A4P
	JZ9Sgr5MHO/iGDVoDnhLmyGdgUyS/Pc6hKQ8/DLikFI7KTt+Dk+IaG2IQvq2Twt2zGAPoJXqVh/
	VTUSogEIoZt863mwSpn4zu++aD4IeMy9R6/Ykn0H5dBKkNSCY/QLf2BGk5+Eqap5F4wxhIRE040
	0ywvSci1rIzbgKEyy61LehGMai3
X-Gm-Gg: AZFdTZcbAME1Xpn7Ph7kYrICyDPxZ8swrMaHZhdi51SlxzV7sIjdT1PkhC+/bTjYSqQ
	jsa1aW6h8agmZuzHKIajvEqymq+7RFkwJP6PD1ymV2pB9Wftg+k8s6XNnhYn2L3pRd1EERIvMIC
	2q8PhhuMLgnF4E15eSSeYNiX/qtkw+oCofAm+7VjqemhjvxphzytEPQ2hUOFgjd8hewiSQ6B7ji
	fQ+O0TQNfhO0q2A3u/jAD51FxIf8ToCTFT4/ZCR/IGfjsMFiTrGBnhLjYOBTABRvc9gfYiBmtSm
	7V9Evr0huHDgKVmpTrwaegUB360aVPFwjqAukdOFsZcO1jqrUlwLOpTdobOszNcmCljQWC02Kak
	1AGC/7kdTzRTiljDu0PxB/6UA/7wdXKumKKjpatX2fH3tv+T1cKCc3Gm/7w5nwd/bMy+2C2H2/E
	VaPQRqFqtp5FhiTmFXDbFbkqOETWe9T7Ca1KLLPfx4/w==
X-Received: by 2002:a17:90b:4d10:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b41c8d9bedmr20508872a91.23.1795709701080;
        Thu, 26 Nov 2026 08:15:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ac86baasm14440084a91.1.2026.11.26.08.15.00
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:15:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so1084415285a.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709700; x=1796314500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=GbtOW6Savwp3cwwmUI9xT4ybqKHdw0xxHBTN13THom7GUVdjaMyDcAIai7bKyWYO8M
         PI985WronS0+aAx5/6hCFPOtsl+EhP4cF7uzUjQsHQm0m4YyiRWSj+heZPP3WEZKkrAB
         1zaVNb8YdTrUbD6j8dG1DCyk0aa+ey9WcYXO4=
X-Forwarded-Encrypted: i=1; AL+hErHD4KO+ftEsZ5vYutok19zNK/mhYne9ZM8jWoHunIsNDfXj90f/7peSTyvhLvketHj6wEbs+Bwi0rG36vFChg==@vger.kernel.org
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583053985a.0.1795709699846;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583049185a.0.1795709699285;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 5/6] wifi: brcmfmac: add vendor commands for AWDL
Date: Thu, 26 Nov 2026 17:14:44 +0100
Message-ID: <20261126161444.2484980-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-6-dev@deq.rocks>
References: <20261125190254.176055-6-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:53 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space, the
> firmware carries the AWDL frames and data. Add vendor commands of the
> Broadcom OUI on the primary interface, described in vendor.h:

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 644 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/feature.c     |   6 +
>  .../broadcom/brcm80211/brcmfmac/feature.h     |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  82 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  92 +++
>  7 files changed, 881 insertions(+), 6 deletions(-)

[...]

> @@ -116,9 +238,12 @@ bool brcmf_awdl_if_removed(struct brcmf_pub *drvr, struct brcmf_if *ifp)
>  			awdl->ifp = NULL;
>  	}
>  	spin_unlock(&awdl->lock);
> -	if (!requested)
> +	if (!requested) {
>  		brcmf_proto_configure_addr_mode(drvr, ifp->ifidx,
>  						ADDR_INDIRECT);
> +		brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +				       -ENOLINK, NULL);
> +	}
>  	return requested;
>  }

brcmf_awdl_if_removed() clears awdl->ifp in the firmware event worker
without the wiphy mutex, and brcmf_fweh_handle_if_event() then
unregisters the net_device and frees the ifp from there too. awdl.h
says changes of @ifp hold RTNL and the wiphy mutex. The vendor commands
(wiphy mutex only) and aftx_work/settle_work check awdl->ifp and then
use it several times, so a firmware initiated removal in between gives a
NULL pointer or a freed ifp in brcmf_fil_iovar_data_set().

AWDL_STOPPED is also sent before the interface is gone on the host, so
a START sent in reaction to it can still fail with -EBUSY from
brcmf_awdl_ifidx_used().

Handing the unsolicited removal over to a work item that runs with RTNL
and the wiphy mutex, and sends AWDL_STOPPED when it is done, would fix
both. The event worker itself cannot take the locks because
brcmf_awdl_add() and brcmf_awdl_del() wait for its events with them held.

[...]

> +/*
> + * Removes the AWDL interface before system sleep, with RTNL and the wiphy
> + * mutex held, while the firmware still takes commands. A queued operation is
> + * dropped.
> + */
> +void brcmf_awdl_suspend(struct brcmf_pub *drvr)
> +{
> +	struct brcmf_awdl *awdl = &drvr->awdl;
> +	int err;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_NONE;
> +	spin_unlock(&awdl->lock);
> +	if (!awdl->ifp)
> +		return;
> +	err = brcmf_awdl_del(drvr);
> +	brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED, err, NULL);
> +}

A queued AWDL_START is dropped here without an AWDL_STARTED event, user
space waits for an answer that never comes. Answer a dropped START with
AWDL_STARTED and an error (e.g. -ECANCELED).

[...]

> + * @BRCMF_VNDR_CMDS_AWDL_SET_SYNC: synchronize to the master of
> + *	%BRCMF_AWDL_ATTR_MASTER, %BRCMF_AWDL_ATTR_MASTER_METRIC and
> + *	%BRCMF_AWDL_ATTR_MASTER_DISTANCE. Without %BRCMF_AWDL_ATTR_MASTER the
> + *	device is its own master.

The commit message says awdl_opmode fails while the firmware does not
know a new master yet, and SET_SYNC returns the first error of the
refresh. So user space gets an error on a normal master change and only
the next SET_FRAMES or SET_SYNC sends awdl_opmode again. As this is ABI
it better be documented here, or do not return that error.

[...]

Regards,
Arend
