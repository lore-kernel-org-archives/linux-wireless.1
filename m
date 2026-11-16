Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827332;
	b=iapxlTofvwdRQD8WR0akhmBkI9eCJBT4pc9sMq4FYu+STp+4X5BTQvxQpErg1Ed2jc9d
	 4aUjXIpldIQP3vRD2avyIXtpMV/Xemj6+qjavWZ33kqVyX0ES0orpoOFRqCHtkApOAmpi
	 KRWNa7vQKE/w7mt4DNw5eI2uW7MRtmJfajtMSrWR4UUygprxR3Yk5MK9n+MYWed9i+WyL
	 YksaoHRo+GeSqXJy/Y2wEYAnxZ6ZECa/+W2UlsTMHMSdaD2Uj8tITYoj0GaxSC2CL7nni
	 45lkQ9CeYDD0DvJoQ2YNN6TA91RdCtWY06dNn8rwChukwC70zC9Pj/H+WqwruKa+Etg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827332;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
	b=YQ1b04RI/uyJvzFf425x9QTGVAdK1ohE8jOLG5bhiMw4esmX5gHHSXfOtzakNbW7j1Lt
	 H3Y1xrbyI9X/NYpNeJ6PDX0wHhwxvvTN6NYs0msb4tzEdDdIYvk3yX5hOYOl0OlA2Gymm
	 Fo9r5vz6tug7Ae6zYBCOJ/+DiAYjxZXr3Eks/JGyzs7ULUstthQSC8c0n5fdvFawJHgFz
	 /dL1ba5YrQO0BFTDwi0kwtvJZPhG5N74SOwQR1Gf/uTYPXboNAc/o/K6A9vdzDK0pQm3z
	 EA9kCDSjX5yKc4XT0eE+zzMgOkCkQVANFsQNyrdFYzIcu0zr+wXe/c3I7VlrIGKYPyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="acV/63+L";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B18607785C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 11:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B18607785C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=acV/63+L
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so3217030a91.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827331; x=1795432131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=cfd8WIQB7/t++Hf6Nj4bSaEnxDCqRxA5L/IkcRQM4O3o8FMl3t+7+SNialVSVnTZR1
         OrxfaBaELkpIBQWq6zjpb+JkFE7BbWwf0Zgh8IJ0HI7WtqFPDHRCJz4J8lC6zXoLxpT2
         0kgqmzJj2EumrBzrnD15QMjxvEQZEzgcP9oC/wbCoufKLNQ1B9MYxOt9x/jv8gCEeVuw
         PdY136dKGcvP53Oqs9VVsn8Iq27nAT+bLq3gTZ+gocnOUCfmFuIFqXueib2PAkBQafZ6
         gpj4LwLTWuCrf2r376VMoKUF2o4r8EPRRIf2NvTi1VZRVYZYyz7255gLzHCNL7QXd7v2
         tTSg==
X-Forwarded-Encrypted: i=1; AL+hErGqYrTLT/w2x9/YnhUNQSiO9vsPovu8eI7B3+m+i2Oze2HiPQ3OZBlIAb+xy4Xhvv2yOyfAyTvTnk+bYpgTPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EuNuAJKO0uLmpka04vGDbJzl5CLN+MjEbmC/sUV8RTaHYCPtr
	0eaRU8fMdY9n0hp/Lyl2BNgybhVD3rc5TIZai5Z9QwXUEdsL8INVs4t8eEqWtpEhcLazQvmljiH
	paeFyO41u2Ybisby8I6JyPIySkBtMdcllcHF3E1eUBJcqVz1HeBhIW6C7A0+HfDCFL9fIBTTw5E
	mYJNaKIRJRJ/UqdTvS7g6zwAn5lwEy29ozjn50UlnMF1FZs0BKXW8bqZFa08Krccw/ZqwvM3KMy
	LDG394C2/j9CFISz8q8xF02w+wV
X-Gm-Gg: AZFdTZcv0uPOHSv2uLIktc2E90PcfVf5dEyU40us2JLxgO0mMbwMDRHjfp8z/cwYxfc
	MNwM1BMrmO71QFevGNG0e5S9XMzgYgazDEyYoZ85v1AEnQatrCfCEjEZBARJI7xQknaIIl/+w8m
	e8yZiTEhOhmMwSeUYHne1ZuKjIBJp7xvyeDPjyxB3JlKyNMzs8mFLWea9/AYsIEU5+iBufzqzLQ
	4rgdco1h3jz0BhAb7T1s2atMHeRymnIepLCPYEQB0SaOhkV5A43e5KcD6NQDiZsI0s9BTS8Hkxb
	qvM0+q0UddgS7G4gOfm+vHX/lq56VIS0wflSkImtz03yR6SKRBekSrAWnrje48vrvBSdRl/45H2
	sLOqEU607Hd87uXiejQ2jGTa81xCAs8QLZD1tQ+EUrF5vhxFtCIaaHhxMCPJThNcVf9dtonk/4r
	P8OfU2tDSD/mI9zePD+Ec9/9zAMxNV1n8bxR7C/hE=
X-Received: by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr9468800a91.0.1794827331006;
        Mon, 16 Nov 2026 03:08:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1d1d744e2sm2667761a91.1.2026.11.16.03.08.50
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:08:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so1041651785a.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794827324; x=1795432124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=acV/63+LcKWaG+HXY0uKI+57ALZCiirM9GVzYyfwUc48hCA4dOv/TSGJo3nDXC2NdJ
         ix9PjDv5IJBSqzyhGj2vkjAtteBH2AR9dsixeHOpu+DcaiNTvc7KGR5XW1VJBY1ZvcSh
         n++r3ef3NX9/t30Rc6KbsBZy+vuoT1ty4bEJE=
X-Forwarded-Encrypted: i=1; AL+hErFCYC2yGjxP9NoDhSg6DD303jpirKXiLjrIseMeWffkdw1S54H/sXQ8MLRcjgoda40UMgacHGcClBa826Uguw==@vger.kernel.org
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401765685a.67.1794827323991;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401761285a.67.1794827323573;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c835b45sm825384985a.16.2026.11.16.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Lukas Klizas <lukas@klizas.lt>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3 ACK
Date: Mon, 16 Nov 2026 12:08:39 +0100
Message-ID: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151616.70623-1-dev@deq.rocks>
References: <20261104151616.70623-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:16 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Since commit 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering
> timeout handling") system suspend goes on after a missing D3 ACK when
> WoWL is off. On resume brcmf_pcie_pm_leave_D3() still takes the hot
> resume path when the INTMASK register reads back nonzero. Firmware that
> did not answer D3_INFORM can do that and stays dead afterwards.
>
> [...]
>
> Record the missing ACK and force the remove and re-probe path on the
> next resume so the firmware is loaded again.
>
> brcmf_msgbuf_delete_flowring() waits for outstanding tx status before
> it checks the bus state. Check the bus first and stop waiting when it
> goes down, since the firmware does not report tx status then.
>
> Fixes: 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering timeout handling")
> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 22 ++++++++++++-------
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 16 ++++++++++++++
>  2 files changed, 30 insertions(+), 8 deletions(-)

Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

- Patch 3/5 ("probe again after a resume through firmware") sends
  brcmf_pcie_pm_leave_D3() straight to the remove and re-probe path when
  the platform firmware handled the resume and WoWL is off, before the
  INTMASK check that lets a dead firmware take the hot resume path.
- Patch 4/5 ("send the flowring delete without waiting for tx status")
  removes the tx status wait in brcmf_msgbuf_delete_flowring() that stalls
  the flowring teardown when the firmware is gone.

Your patch forces the re-probe on any missed D3 ACK for every PCIe chip,
which also hits firmware that never ACKs D3_INFORM when idle, such as
BCM43752 behind 6f88e6ebdc1a, and logs an error for an expected case. Note
that the msgbuf.c change is a separate change from the D3 ACK handling as
well.

Please test with that series applied. If a case remains where a missed D3
ACK leaves the firmware dead, send a patch on top of it, limited to the
affected chips, with a description of the failure.

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=1208304

Regards,
Arend
