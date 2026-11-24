Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551249;
	b=Dj9g/HTYwRXSSnbwyQtxBPTkbPKVh+iPSCaR+qOeydarGApfG6Vk3zuEZvZ4BoIIpEGw
	 /K7qcLLRTwikb+5YWQShyVoThCmbdjmx9d5SxxU6WpaKVZFKL/gzZ7oOXyQBjSON/imzr
	 7eAWsksbuaF5aML2wM6BK4GNYTInoniFuPAa+sTDKWSt+uwMNdGjXKTHIxEF5vXi7Vz1+
	 fTTvOU9355nM14w6T+1eERBUtCTPH13is/TQ1/EfwQmNM5HFxxGtc9Q/85fsQEeX5RchR
	 LBb1CeQxuCKiW36JWPPlqqRA1BeT6/AlTm702XYGT/EeIdpoEZPPIvRyrKMggT0lwbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
	b=HbptwM1D39Uu2ITaeYX1e9mBK5nNhY6HLTauLv3ZtKZyeZZqVW5JQ46BAEi6hBYhMb66
	 szihmjgNPe5Y/27hJIoKr2byVzvRspXIXoCyMK0OC/B+BbVupMiC4wpc0T0162UCaKtFy
	 iq1SvM7Dj6kQjQ3zftr+SQx2yK4tLMjIarkZPwNU80pP87HrgcIN+c1DePuniLbeB7Twu
	 fxyRaJTHsa61xH2EQC0k9wBvxMVcKAZabirhZcBGZ1OYweecl7aOyr/b1bJjRS95SHV7o
	 Zt2V88MpfTuawKM8rPgknU6zJTU5/A0KTHDnsfM3XtRrTT/mSt7KMG1NIOJ+XxSS+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aul54bK2;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81E606A6BD
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B81E606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aul54bK2
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-33fb4680717so12864917eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551248; x=1796156048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=Z9PJpphy8PVKYz/RV/5O1/wmsqUF2D5IkkTVOD4vUL3ON4J2IiU3T3eF3tv1KlqfDV
         WWBx2XbQsS7DvnJ/98q0u8rKIMYqjCc2aIYb9cfroMf50TBPG4wJhkSV68JQg+wJ2UtN
         O+o1wP6JAVI4R19XTCMUzrjFvr2Dt4zGn0bHw7XHTVENQnb1iXs4gPOCJumAY/oerPDO
         iAfo3RCA/X5oCjBraCj14vysHjDTS+rG9bX5JXDcpsoTfHLPR90blhAxQ1hdlXlIMtGE
         6ZkN56dMhpazOdU686iCIlf42gxVA5Mh1vs0PF54yTlxbwX8bXSe+TO+3qJSsC4NPo2m
         bC/w==
X-Gm-Message-State: APuU4Z8A6BrkUM9wIFPsnn8PfJJkV1TUUuswnMlgw6GI5bgi2gqrq7K5
	5CDnAjLeHvqViKWB3gJv6rYnDJFQwXErUaLywfdjPWITyxIz/mvvqKuvv8fZX7L0OfDn/Ba/qkB
	RzPmPcDNt1SAptkGclBCvFGlMhH4oRG6Fu2vEmqbdOmnr9Siya70DPumI13+XE86HOXfsdIglzJ
	ptFP7hRNVV3q1EiCJxxRDmnnUwBHWnbK2oy1l2Lt8hrShr8sktT96818AoSVyqsm0ig4lFEggr1
	zyOOuqvfIR+9lHuD06Y6+cn5a1P
X-Gm-Gg: AZFdTZeIm15FDG0vEjS4DHnexF9HONMsOXDqh5pRErhhmmJuQ+ZG7wlMbeEBAXcbr2w
	A8/ojalrt33WDzPIu1/fFPN2+W/J/ObLLahwNZi3SrwCPMOxk7yHnGyaYCrAdvo4og33EjApQGz
	PMcaCgIyFveik4W6/c2FM1kjPTjCxrDgiCjU3Engw/cVmyXC8z0+pHrekTlhLAFQxXleAxwZ+Qj
	WaNhF8FSEvLNGATrypPqM8NofL3T33RkeDXRCrStK0dNlL6McqD/AJDueaoLtI3qn2secjzkAcE
	r4mLE7e2y+vZ4Mb8YYEdkXOP+W5WDHTbjATNVtWhh1sHWsWij7agMHdqjQ1VOvR89UwIPCnGlt8
	y4PcD5rqxkVbmY/X/ALjbmRY+Il/wevIWqpMDQte+sVZ0qg5ZpXSYF6v//gcBN1U/GndJwVbNBr
	5s8oU5z1uC9o7YPU4ifsc2WB0QBIafffexyKYcxSySKw==
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id 5a478bee46e88-3856f859121mr17942302eec.27.1795551247597;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c24ff26csm587408eec.27.2026.11.24.12.14.07
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so323972285a.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551246; x=1796156046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=aul54bK2OLJItCpGlEWsTxaea43hgxbNGfFzr61cNV51ccuyxWS9pwY9HfRO0vBhGE
         7sq/waUzW6k9wWufv+HSBq3XtY/H8KpBXUvrXPmS2QmCRqSznfELjs7NWtfRErcDgF2l
         UpCcoE2ol0vcWnB4euAQpeXJ4aTQTltCdBexw=
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301697071cf.44.1795551246149;
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301696581cf.44.1795551245711;
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 1/7] wifi: brcmsmac: embed bandstate arrays instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:56 +0100
Message-ID: <20261124201402.3499613-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-2-rosenp@gmail.com>
References: <20261111042554.232998-2-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:48 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated per-band state (struct brcms_band in
> brcms_c_info and struct brcms_hw_band in brcms_hardware) with directly
> embedded fixed-size arrays. This removes the manual pointer arithmetic,
> two kzalloc()/kfree() pairs and their OOM error paths.
>
> MAXBANDS is 2, so the embedded arrays are small.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  8 +-
>  .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  4 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 82 ++++++-------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  4 +-
>  .../broadcom/brcm80211/brcmsmac/stf.c         | 22 ++---
>  5 files changed, 44 insertions(+), 76 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
