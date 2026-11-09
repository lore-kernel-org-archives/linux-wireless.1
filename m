Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252881;
	b=iHz9jSZfYLz6FRpYKMVmOSPbBocTXBh+kfkL9tWNNzlxLFVcC2o4svj/EHkat8dB6oMI
	 uOQm2lcFn9CRI5HsxjlHZgPrSdh9O3S1iiD05LuL9WKYI+hBw97n+p4GGpA+0CGvZPObu
	 CSGg0/zHbRVqxhruHFwnUkt7Q85fdSSSY4OY4XLWFz7HWM67Brt6OdHX9870D0mPtSeYk
	 ++TZdZCAAGP5qnQguKsZnMTx44rmWJ90dCSXiLvAFUyBietp4f2b6cyHpZ2f3YVImcoEe
	 9jLl9fTou11YD0A2o3/4i6Qmf3D7SdKhhBsDYau1Vpotb9w/1OxYxPTBnCdtWUDjuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252881;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9qyvTlIi3CYKbLM1zH5Gzq2+ylxNfv23rH0H0jS80l0=;
	b=sRwOULeoaiASyyQqhGCLqFKU01xtQGR5WSFiep8v/MofMlt154A3cSFbdobC1DeXUeMG
	 VMRvPRglIq7b3te2QdNC5rMXSeIWwmkHJEgL1xU5IQ8FO8OSX8IaPJV1IacyvW2DJ+c2q
	 hg6PMyjdQLar7W/WnHmAAa8zoMoSfJeIdnrg9PWFXXlhPZEjf6kYJ111yqanLnmM4bajG
	 7zcV+OGLpmzagwdbR/soC+3ZxUa3+knK27ljXJTyOT0dHRTfsE26sRVIazJjsIkS88Awe
	 v0WWNY01RBJTtSEoIgTvOh53qNFQhNuEV1kHcJDjHSV34ekqYP+yHO2TEieQvwjplcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=B9u4FrZ2;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536A606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 19:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8536A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=B9u4FrZ2
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb684859cbso721323a12.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 11:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252880; x=1794857680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9qyvTlIi3CYKbLM1zH5Gzq2+ylxNfv23rH0H0jS80l0=;
        b=j6ar1f+Ey4g9131gx1yBA0dnkiHgBG+6as9oZp7vvgJxl8jG/uKWUE3z4S9ZItIKqC
         u2N/27MCZMdd7Y0jjLQhL1rODSxHyblZLeRiJY+AXkg0n/by6NusNB0fHbv1CzVwxCOA
         IddQimkE/f+0La2gfZ94Q56DlwPv3J4CY+If5BKqQ5oP8i70jxGW4LBlTLOmgfjOlJUv
         hG1HaX017se7+lTJ06wNDUUABGzkFmgo0y+UBXvKPA2+b6av56F4Oh+qIlo9yEKPHgic
         TywrbKDKyPcRYK9w7Kl95Lu0HLQqnaHBHrbT9OTkBPvrUMDmWiPzur14dNqhKpgQG6O6
         VaxA==
X-Forwarded-Encrypted: i=1; AL+hErE6N3hcLDLlFMJWniKe5dYn3RdnAzdD7tt6DimYUfmhEuZ9RSF/kTxdeuDDXL+ppvJNsOkEW9dp3ZCS5EDmhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z86+faVdG2hsxv8StveIsoSHof0Xdc7QV+eXls+OAiQbLPlroRI
	GDjo3C61ZuZHuxaBGBHP759S6CuG7Df59yMahcZMP+SRfzx2HeGf3fLfRLescHoKg2QvzWeM8+O
	7TPxzzKIC5pPa48rFX6OzR/F144Hx72FaNi+x7cEx4km+E7xrD3uuMdmmjsX5ahVur8vMBCHVPh
	Oaf9vS/1RQOvnCFwKi7ghShNclYspBklyMZ9wydabNxDc0GniOuseXzgvJ5UBlENBNO/fBUTtd1
	s6ycpm6cyYAPZ/0r9yxsJoWkjEd
X-Gm-Gg: AYBFou3zxbV79AWrCXd44ZnYhsD3vRm/+z7DgOJcwPYWMH2uLY8CWqWZhRFWfOVTlr5
	JCTKZJ3x9oGnwFBPwk2U9wTTxC7OJ6xP/2qmqKmyzIh4wRsSc54HDYJXx8wAdcJ8u1gTwX/B1F8
	My4lkp9mHCipYxUj8oGdnOjHyJDfg0r/61KfWW+uD6Sc3vsoNMbgm58TSG63JXWy6KEeZY3tfrn
	Qa08LaHtWTS8OInIUF4wM3WUOjQHszkbiSVvNbzl8fpKyljhFgOShSftXih7tZuyuMHoxK05LEO
	tVAHQN0HlOUQHn5ljdo2JtTHOd4WrWzPj7B/Q1cZ+xizxeHhbtwNj7hwLwI/XN7H1nfA8mIxbpf
	k7I4Jvsl4eT2EiiZb0hxAoAVCT7DCJgKi9sqrhZd30PU/H0dskKewUPuNrie32/bv/cCkK90erh
	XWbkuBq/Gmjjum1kBQMFiY2dUy1U3u1M9S/TYx1hY=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b166fd8b9cmr609118a91.57.1794252879571;
        Mon, 09 Nov 2026 11:34:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1690d6612sm55560a91.3.2026.11.09.11.34.39
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:34:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-537548d4bc0so23268181cf.2
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 11:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794252878; x=1794857678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qyvTlIi3CYKbLM1zH5Gzq2+ylxNfv23rH0H0jS80l0=;
        b=B9u4FrZ2ORne5WCP/1cq08JgRzdaN2AxNuQItgk1B+J2SdFvoO/EedXV5P2LeuJTrP
         vVQhLU0a4pz4F6OJK4sw+QdCH+ikvNtxNhNIGJuY/TeiuvtRIbX9OcPYSzAZYaE9zhXw
         s4p8R/5Bx8PD4faNMM6030o7OzS6HFu7QQuNY=
X-Forwarded-Encrypted: i=1; AL+hErEdQhUDnbBnXjKPwJwENLyq3N/3RMoTV6cKAej/i6gPt8BbWFqcDED6N9DgRBgEMBBHhLwaIIZxq//9eAprug==@vger.kernel.org
X-Received: by 2002:a05:622a:587:b0:533:2c5b:d668 with SMTP id d75a77b69052e-5552791d57amr5838611cf.30.1794252878301;
        Mon, 09 Nov 2026 11:34:38 -0800 (PST)
X-Received: by 2002:a05:622a:587:b0:533:2c5b:d668 with SMTP id d75a77b69052e-5552791d57amr5838341cf.30.1794252877902;
        Mon, 09 Nov 2026 11:34:37 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ceadcsm3299166d6.19.2026.11.09.11.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:34:37 -0800 (PST)
Message-ID: <3ef121b7-8733-4179-854c-25dd39fb11a1@broadcom.com>
Date: Mon, 9 Nov 2026 20:34:37 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ath6kl: synchronize scan request completion
To: "Gupta, Vishal" <vishal.gupta_1@philips.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "Schnick, Uwe" <uwe.schnick@philips.com>
References: <20261026131631.1229744-1-vishal.gupta_1@philips.com>
 <MI7PR10MB180666D717ACA48C2EE0DD3F90FC732@MI7PR10MB180666.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <MI7PR10MB180666D717ACA48C2EE0DD3F90FC732@MI7PR10MB180666.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 09/11/2026 18:17, Gupta, Vishal wrote:
> I missed adding Arend Vanspriel in CC on that original patch submission. 
> So, adding him here for review.

Okay, but why? I am not involved nor maintaining ath6kl.

> ------------------------------------------------------------------------
> *From:* Vishal Gupta <vishal.gupta_1@philips.com>
> *Sent:* Monday, October 26, 2026 2:16 PM
> *To:* linux-wireless@vger.kernel.org <linux-wireless@vger.kernel.org>
> *Cc:* Gupta, Vishal <vishal.gupta_1@philips.com>; Schnick, Uwe 
> <uwe.schnick@philips.com>
> *Subject:* [PATCH 1/1] ath6kl: synchronize scan request completion
> Protect vif->scan_req with a spinlock to serialize scan submission,
> completion, disconnect, and interface-stop paths. This prevents scan
> completion and abort handling from notifying cfg80211 more than once
> or accessing a cleared scan request. Without synchronization, one
> thread can set scan_req to NULL while another dereferences it, causing
> a kernel panic.

In theory or do you have a kernel backtrace showing this fails.

> Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
> Signed-off-by: Uwe Schnick <uwe.schnick@philips.com>
> ---
>   drivers/net/wireless/ath/ath6kl/cfg80211.c | 45 ++++++++++++++++------
>   drivers/net/wireless/ath/ath6kl/core.h     |  2 +
>   2 files changed, 36 insertions(+), 11 deletions(-)
I noticed the email message is a MIME multipart with html and plain text 
parts. Not sure if that is blocked by linux-wireless list, but better 
assure to use only plain text and no disclaimer at the end of the email.

Regards,
Arend
