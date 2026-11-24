Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551255;
	b=DK1h//L+Yc6rclMDT/DvX651YXl3FJZeKFGaa8hquENNrEZWxjM1tSlAmo3nrz0A2p1d
	 B5ib8NWYJTmRyO++cPLoRwH+Q5VBZy5CsqDaijuqagCXZ2Ije8PPM6szLCL8rE+udVARe
	 BGQ4bwBtOeWUzATTyAQ9r7q+M7s1lO27tP9mgKRdTb1w/7we3EmzFiZJeILOYPDVXURJr
	 Bmnr6zQQFwNqig7EaULRBBvMhOX4mIRbfRkTFMJEpAWybG9I3Pa4UCyguXgdOTFUVDDAU
	 EBUBAZN5e0XVIYshzeMUXK7i47xYV6YQHLEfn+i4NUnK/WeQzwoQwe4ly+SkOAuJg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551255;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
	b=zxxq4/jThlVxvxkyG2ZGlwhnJrbCa8SscahrY15AvIYCckgR4l+6Ar6VEScS+QPC94v2
	 zbOajy0Ig5mbOzzrwSkZ19MDoTIYmaLaq/nKSUVuutoqnJUoKnViP6FjEpxtQuYtCrHZJ
	 z4xSsesq1VJY98Mat8usG3+IcGeRZMMvMgVMlsE2LDuhFNqAeLosskiKPszPcFCV7t26T
	 DqXhZhXRSLb54UQ5TUCmDbkIB079Gd1LYsHUbTUUVwJkrLhYXMyHxbG0CzZgk6qi8dbSX
	 t2ZrhXpKesjFIhHjNmsvIYlxmppflR3AmJvFP5OMciTm7a7UmWp26/LIbC6l1HzUQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DBu4gMcp;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A260A262D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04A260A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DBu4gMcp
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f2f2edb19so428701385a.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551254; x=1796156054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=amLD5J5GiL/kXR911oI81/j7l9U73QG+ZeTeSlNrw2OBOgypesQkJtJx6E1iDK8oaE
         x84wVa53A5FRRMgHVnWzeMR5vgypG04/ST/iALU2NBfYSQwXUYkUCiivdnCiPmkbrlQD
         fOqe174bB9mNvTyhP09540E8ZSsHY+CCY3Dp/Wl/N4rfJM84FU4FbERUZc91U7OCn3I4
         S4CiLsYnW5EoWsKzomBoOFbihBL4EeqAfZEoLegZ8ReG1If0oXPwSi+8rQttBXoOkRgI
         13mjwGspjalSJm9Psn0q8UK42RGrRSfqMPqphGnSwkkLHzC/d0q7X+oSJUAUp86fNcKJ
         NbSw==
X-Gm-Message-State: APuU4Z8PLe/60Z8oP0d4c2imDb/ekM3Rf/Rl7EI6DyZa+09qnqlvyz9Q
	z/AlFiQEyA2qjDFTGbcAblBt6WvaGPMwZvtNvoCpmNl9cx6KH6vFw+7D1k8gi/TTFABKLl2BFXN
	TV4daLcMyKaejY6GXuADznO0SKQAXN9xnHb2n6oLmq/AndZjWVkdyB2hu0W6tnf1bZS7cH2EC4X
	bnzxBHv/5+heX8fxVWwXcUS5SRZ/maFMmNChQyyVoTupfw7lR/rVZ/uAc3QlX5nwcvhZ3gZ6jKH
	BL+6huNQFMjUsW12FAxf3v+j4vg
X-Gm-Gg: AZFdTZfkVmVBYhE7NXYvk9CFCTC5xczu5jUqEoaKSFNRwPC1bpOpJTxf3Uhg8fzNWm4
	rfhxP+lMBz9ueyR3buIn+4r+y3u93vyeFoPIejcf5fSiR+plepGEJYJ9XepMGMtvrvUlUZJvxQQ
	xcKih9h0Bn1CdyWnMPxVFZ2c7akjbV762vRoucx/3vXe9BVtkUxQfUiLYACc8CzLyeVxV/ZXiDq
	GmIs/SB3v83UHMvhQ/VKNWOqWLcDDvO8zaunlTUkm71YiUWxLB1JZOPFaz8BQY4cA8wVxl4/MhA
	7sZpGZ4kPkHURYogw50yKAFOo4DJf+jN3nKdF/6E+VLzoBeiWbrwQr8zgK2LLLyP3n+SAwA05ny
	lnvdKXC3E1/VWbNafFSXReeoPU0YruWf+hyTyG6D+9pbdueqsV1pYXBHwvKsH57KD1tqA884Nbu
	4rp3w9P5CvQ9hd1mgKEIErt44vWIZJm3ZeqvkWbRBgwQ==
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr2734440285a.68.1795551253687;
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb224c9csm105189085a.3.2026.11.24.12.14.13
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso96070386d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551253; x=1796156053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=DBu4gMcppjwDDUbqObiqwpC20dr8D3ByFD6h+B8DiUVeKhu3Z+HifWRYFtEQc44caf
         TkEKuOwWs0TtA5/wGpH/V7dUrTAHQo5lU72aBZ04mCLTCpkdiYVrxsIadh+KpKrdJYmP
         NVHOE9xCKpdEWkPcSTOdc4KUj/QVcnIvUEZeU=
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225168126d6.27.1795551252933;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225167466d6.27.1795551252306;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:00 +0100
Message-ID: <20261124201402.3499613-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-7-rosenp@gmail.com>
References: <20261111042554.232998-7-rosenp@gmail.com>
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

On Tue, 10 Nov 2026 20:25:53 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> There is only one struct brcms_core and it has the same lifetime as
> struct brcms_c_info. Embed it directly instead of allocating it
> separately, removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 2 insertions(+), 9 deletions(-)

[...]

> @@ -470,7 +470,7 @@ struct brcms_c_info {
>  	/* multiband */
>  	struct brcms_core *core;
>  	struct brcms_band *band;
> -	struct brcms_core *corestate;
> +	struct brcms_core corestate;
>  	struct brcms_band bandstate[MAXBANDS];
>  
>  	/* packet queue */

With the embedded struct there is no need for the separate pointer
anymore. wlc->core always points at wlc->corestate, so the core pointer
could be dropped and the users could use &wlc->corestate directly.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
