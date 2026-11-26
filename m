Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703381;
	b=oENLXSZCrmyygVwvwksa3g5KGlcsijYinFoIqT5LuwzGDCSZ96jVNrjxcQaYRvX+UGfP
	 PC83RYF4KQBF5DABfwJc3eah3XKxbmdleQocvYyM5I/9/djpsdn9OFh6LEFBll3kbJNqZ
	 /foI9qWDFcZL6CpyNHDEROhG59fUiDbegmmVmUam0vOUkFuNIYz3TaWX3g8Wc8XADEM7D
	 vKryePvosqFhSEJHmProaoQ7VYni75SyCapCfLNqjmtClvwbAwEwlGJ+paOFiyfqiMgG0
	 TTTHsT6yJnGERbKdIl3BcWQqQYtyZrEUHR+uoKi0QR5SSh2JH2wu2fpSidauwelzaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703381;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
	b=l8RhmI9hX69aoGaz1IL3GgwzDV0/GC3hRx3GAIyzzmTNEUAC3hBauqZZvp6RHH7uEqbO
	 IVDpzfaYwGpNBr2zmGtlRISyXV3B+4pioEXVCBUlaDNxXO0hIHzaOR9qcJQ7FHUve2oet
	 HICwqop2UjSe8xbsmokpdvuN7tCoQU5z1bgbNWYa1uDADTF7/fFvrZ2b6mjr2nueeRcgl
	 Qb2XeGBA6+A2bmFU/EMiyNOz9+uEBH5EkEqAvHHmc7sBwmvhFflyRWaJ6DJa1U7+IDoz6
	 aaXFhiiw8tq9fSKTWrVORuQB/8Lr1k/3T4B2Re40HOXWHoGJNHkxSUq/F6U8xMXc0Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWKjGQQO;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFF606A327
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FFF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWKjGQQO
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4789479eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703381; x=1796308181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
        b=eoPDf7M6KQuohW2/KlNR5ObTYjAosM+R0Uspkqc7GafDiiP681mricWNJ9LUZn69e+
         Kzl5OQY9NbTW8Ai4cPpy6fx/2Xr1D4CzC+QyQI/EWSw/o9IX1SGFB0VN1h2LJ1Ds/zOg
         BFB7nY1gkycaaoJo6sVKOjzm3F2gZU2A8dOeTTRIu158I5rgBA4bgyE4FVRntcNYLe6s
         1l1PrytcYkz7mGMAg1TP5M9CDxmsUJnvEOd9Yw4GY8tMyzSCv1NISDCgNTq853DaTDZB
         DruK7Fg56ro+rSCmaO2Sa0jXJ4UmgEPGCmjNBffSYlw1Avgp33beoHfYFM6U8j+kOURK
         p0qg==
X-Gm-Message-State: APuU4Z+IoKoEeTE4hheSnP3/9X4DbbI/VtRhqK3ltlgzAb4VB6Uodx2U
	jnlZwLYIxegzWWVaRcnE1LYr7hbE6NT333SYrnUgjKHyC+OKXiHC+oNxnWXOfaCRzTZ7TblIp7A
	mPOsK70HIGp4QFzpbJu1nG6aY6OD1fcD+PjVgztB+sOQnJLxmWUPjQYHoypJ8FjdqEe0p1G0BFX
	nn2J5efMb9YrUgk30w0Ik869duRtseHukLbrOpZLAZAHqN5GksI9/3+L78uGutWdxbRoGDm4vl4
	SeNCg1Ts9MYg9jrbEmM+piADM8E
X-Gm-Gg: AZFdTZczvsINfn2iL61IwGFfOvtMDxgBsPJPokwGRTX+Rn/zQzJOP+58uA/ZwkYx+EG
	eecMxOe6vJD9U/vet9dhJISqHYxYJFbAhcHdqUR1FxsX5vJmbSd/+9ztK2Z/JpcMosNnItYvCSu
	cG/haE7tvJCKvwV4GxIrj8fwL8yuTLL6SarG2P1dxJZiWjBBNNM0tDjKlPtmDa9ZmH9A3scHEY6
	thIOOrdyz3vvRstT/WumMF0c+Ox/b4+5a/1Fs9pxI3WNHTS4sOsY1ebTHui3gsZzicrUrciPqnr
	7lZIFSDSAAAgp1VLgaVK1xOINhFmN8/2jZ6kUueJG8n+TzSilG+26GaBoW/wSoDxHMeTUjJL/2z
	pVtZQY0ZwNHSTwV7S4bsPcUfskx4P05jo4nTtSIAjVG/9xjTitzDloBKUIniY8PVgtCfs1Ks3oI
	vuo1rpSmGLwc+9IQv4bnF6aqmvny9bQOz1QTwK2tp77g==
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr31070044eec.1.1795703380305;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385671d1b2esm3258671eec.15.2026.11.26.06.29.39
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92109408212so142397856d6.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703379; x=1796308179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
        b=fWKjGQQOEPE5bGh67ewNe96AjBjVdhKYORex7yBzbCAOToFNX+UYppeDlgbdNw9Du1
         5k8zVEYUjd2kLmffFvD3B0a4C1AtCuUngZngrw+jQJOeESYBaj/Nfaph6XgKTsFWj3Ku
         67eJGXsP90OVnhjI4MDYtvTKIs61CxVJXgYos=
X-Received: by 2002:a05:6214:318b:b0:921:1042:c46e with SMTP id 6a1803df08f44-92134b32b0cmr388369826d6.33.1795703378949;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:6214:318b:b0:921:1042:c46e with SMTP id 6a1803df08f44-92134b32b0cmr388369366d6.33.1795703378380;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless-next 1/3] wifi: brcmfmac: pcie: stop console read on invalid write index
Date: Thu, 26 Nov 2026 15:29:31 +0100
Message-ID: <20261126142933.875175-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-2-sorencoremans@gmail.com>
References: <20261105215954.184290-2-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:52 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> When the device drops off the bus, MMIO reads return all ones. The
> console write index then never matches read_idx, which wraps at
> bufsize, so brcmf_pcie_bus_console_read() loops forever and floods the
> kernel log with 0xff characters at several thousand lines per second.
>
> Seen on a BCM4366 after a firmware trap followed by a fatal PCIe error
> (FCP): the reset path and the failed dongle setup both entered the loop
> and never reached device_release_driver().
>
> Return early when the write index lies outside the console buffer.
>
> Found and written with the help of an AI coding assistant (Claude Opus
> 5.5); the cover letter describes how.
>
> Fixes: 9e37f045d5e7 ("brcmfmac: Adding PCIe bus layer support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

You may add my acknowledgement in v2.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
