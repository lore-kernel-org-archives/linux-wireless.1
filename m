Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776595;
	b=gQzYo2Hj7BtwFOLaeXROse9BFqZdO+FkfJIfGbtJJaLxAUBdwtwcCsLuCU3f3dchHgwY
	 zB4OLI7b5UX7ujARztaS0o4bRogGteQgnwIQi+oPcLQ1OQrBqNO+5wpd9jsdt/pmiEud8
	 CmStaARYwFAS0cd0ou+k2EvYBWriQX5mx4InNE1/hGCwarbtaTsTNCfwbasUvJ9hK3Ns0
	 6ZguT89aa/F90kiGsMUGY1rdZOEyirKOLEJPG93WpJIZsDj7v8gccQEG6Rub+pl7Y0rQk
	 Lg85vqEi5auF9SZ9ZonYQKzBVKVaCe5bKxRKI+GS6KVph5O9u0DDUapew+RnqueV9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776595;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
	b=e9dpk9wyDdbnoWP5yX8RR7Ka5fcXaIzn3090dFkQlS/f/ts/gsQLLb8LZBIzVO2QdD6d
	 9wobFP0zDX294Y30mPsQvIwPUam26FhGu2Czy4FCVivwiLa9ElRZzMLXoqrNZoGQRacJ+
	 odGp+lvWcZYrE2dFkeYOjzFGJKe7Sk0ZeCOSO5JFFz36zsYG1cBxXqKPBdyeVmNIm/pSD
	 1S9b7xn3MtX9fbqK1cyi/VqneVO8PTEKnAG+yiq9yKGAYKwhU6AyhBXBen4g0L00mM267
	 5tv3fJ1TDrTKqd2Y4VLnxbSeYPo8hDM2GB2XY42uqqXyUohwuRTQD0fC2qV2bwUWlMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mi5pJsb+;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FA606A329
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mi5pJsb+
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1990034a91.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776594; x=1795381394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=vXavOShXCHdb6USvmPZJadyV7uTpm60n8nbP9pSDiFYIsvvT9nk6yieHC2dRLyBoHk
         y3tGCgM/i3j8+kyiu+NpPoDRa6JaU6hE1wXXG8gUyZTCNDMtMa+kq2MnfS/5wTomF35X
         nB87uaj8vxzrVRvNL/Qcz8aplHtaj38OPGu7n4MCdf9vzoHZn0bMicK3N82NqqAbF9bx
         AK8nVkXrD4Uwy4LuEewON4YDHZKli7OEaSLdP6KhGufUOxKOmX6cAGCenssXHWdEfAUg
         OSlDuAtNQzgTinabQkORwb0uZ/1Rh7ClNolEK+BAhGdWfLaJHfovtfIYozpX9f3Kiu8k
         7jkA==
X-Forwarded-Encrypted: i=1; AL+hErGZvxV3Kyh1sT8iB9OLYDcIA7kF2/F4tKFvWUwd4F3dFZZ7PAYr0EVxue7DR3YMMzjaoRgJNpaK//gDCueoAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XnAzIFx2gdN39Tvlqhb2T2B8bHUai2fk68ysoedLXFVgt29ML
	QOT146d0pde/qmKfDo7VeGNw+J/9o+VS4nD0q7wzToRakHi25K5AhxZgTS+Oa61p95h7QyziPKr
	GK9U/A3Nnjot3WAAPAMZOEXkkIGgBaYLGgRDcZWwwzWGAxGBWdEptv023ZT0TtQVZYDA2XFn1EF
	XE5drA8UqwVy4nuU28YvRaCY8Z2HWaGwaViWPYr5aunHdYJQ2DthsDlD3AdeFfveTAWdluy3Iwc
	J0qeCN//kHZ4mI3QtvKg+aFwW7g
X-Gm-Gg: AYBFou1tuP1E+OAOYcOVlb1w77SryAsD9H1dI3smBkVH3+SXSOr+o0upu/LAYG61mQT
	+kGo684Xz6Ct3tUp/VL5I8cNJ0I8+yC8Mi4eFUFBMuTD7ys+49s5ToYmPf85bz5jtbJJCEdRnn6
	OsBz61DKdSoYx17qvr63oelFx6Uom5dK2YelDVpf4yDTxiUD7lk/8jetJAZcHjPOMtMwql0kG33
	K0ONGEibzG0Pz3hmEat+o4iwQUI6NAI9jULUajMKLPgB0oPYPmjgFrj5SIaQtcKScH/FIksLjFD
	CgHdVPBPCCRpQ5kBof4R+NlEf0lXgTuY3RsmjIJROPgL08qAgm4Dk6ICgmcyHdN9ZNHBUg/8lf4
	O9ehirXchLtx45NIoHF2LVHNxMnqQYEJVAE6cp945c1+6jSKwTomBBkXmoS8ffGxQSI8/qkDnSO
	lIlv+UttWYWUphuQQfL9EMtb1XBJzqcdHD33yikL0=
X-Received: by 2002:a17:90a:fc4c:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3b1b0b962demr7857725a91.54.1794776593969;
        Sun, 15 Nov 2026 13:03:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm13219961a91.0.2026.11.15.13.03.13
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso7549933eec.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776592; x=1795381392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=Mi5pJsb+cf+7BFKJ4qwe0XBLtzNr5KV4R08ZsOomId3sXz+3cBTkxmDRJR2ndr0ORF
         chmI1vwcbNZSJibperqtecHfie2UxyT7EYtaClfpGiLGPCuWcCyvOdROoE4pkooKNamu
         rdZkjuR8lA7JvcMzq66WN2wNYVhFGgnl/vEts=
X-Forwarded-Encrypted: i=1; AL+hErEPJHEZtyxIDMcJQrrktYGZ3Aenep3F2b/t0cJi7P3TqJXQB8OUZcPjSmN7316IuvzNuHhDY8RHSFmKap8dsw==@vger.kernel.org
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383049eec.5.1794776591909;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383015eec.5.1794776591057;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: pcie: Make antenna SKU check optional for Apple boards with BCM4364/3
Date: Sun, 15 Nov 2026 22:02:53 +0100
Message-ID: <20261115210253.883721-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111141756.11564-1-aditya.garg@linux.dev>
References: <20261111141756.11564-1-aditya.garg@linux.dev>
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

On Wed, 11 Nov 2026 19:47:56 +0530, Aditya Garg wrote:
> On iMacPro1,1, iMac19,1 and iMac19,2, the Antenna SKU property required
> for firmware selection is not advertised by ACPI. It has been found that
> the firmware shipped by macOS for the BCM4364/3 chip is independent of
> the Antenna SKU property by comparing SHA256 sums. Thus, for this chip,
> make its requirement optional and use it only if ACPI advertises it.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 61 ++++++++++++++--------
>  1 file changed, 38 insertions(+), 23 deletions(-)
