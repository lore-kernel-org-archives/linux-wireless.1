Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570717;
	b=gK4gdM8rR40LiTXnWu+/YqcPCIiZxVr0dE/YYwQsCnfTJDuxUK2yTwvUhXYWmxSQhuNm
	 Z06X67LvSA5wtwWF6Kl8fJQ2za3EyfpWHBGhlWSc52IYTfYzp1tIJS3zdqgizHnX82WEZ
	 C84Mc/xhrS3nOCBGP/btO0599ut4DFIuWmC4xxt0x/tFlTNwX5INnn9+GTGMgQIauqetN
	 2eTI355dGMplOWEVA/mmYNc94EBpTCifu8w5XF6HIrqWB8pTNLhxzSVyOwskPCIwifXqN
	 wERHPDB1FR/FwpzuSiU4PFvk85D4I/MYL0no8Pa5O0PSRV+oykWYPtnmhfiP5s04vHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hr/ccE7CvbrXtthAd9FlF4NZn1q8fqO3JA1dQNOKxZE=;
	b=bpngt8bROgSwp80ph0ZwhsG1w0piPFR9onxzCXzhfLlHwvJKIEqTL+lsGgyC1tfnpVOi
	 4ZpH4YtSYKagN1SbNV5XtuwXgB3mejQtOediq5kr25Klrv/T1xo4+iRxROE2mrbs3CLX1
	 qcW7V76pkhxrOmHpyzKWqnDeoj1xdLQcJLerW0lOpROFXwhbAE8n311Md0tuYBIKv3izH
	 mTofLoCQI/C2NtxZiyzGFtqQW1QevcYQdor/cgl3Xnp4kNqflbCgRR+OpoDLHV0+uKOkp
	 3+tS68WgREBI1BnoTZlEmDz//xYKA5WpIe4YjerZMIpJNX6Yv3nhaV2glYcm9WrERmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmRTN7Qq;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAD606A330
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmRTN7Qq
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so3744607b3a.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795570717; x=1796175517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hr/ccE7CvbrXtthAd9FlF4NZn1q8fqO3JA1dQNOKxZE=;
        b=tmRTN7Qq+RSHGu2GaVqcRe76fvVbWru558lh+40yxsTfVLoHHHCKsGmbyjtIic4p2z
         J3wvs+cZf5ete7wgbB5qfc2usBxagJDgMZtl7weibvT5qh2C24g/sHsRU7YfN1ImM/bP
         jICTvOHHjTk8HQkCXD/WIzcFZCF7vU0ScsRb97tPFcj7yEEArFW7m9ojFOggG+7A20ph
         1bwMFypqgCvCOpmPPTIqAOhEIeavzeBsgBHaKHnLIpDWkttePrNY8B4UTbC3mv7db19I
         QKQEdZs7lpmtEPzrP9Hd1jW4XTMVhTxFIusdVmBfLd39mO7UCdftffCNv0xXHgM9B7L4
         wYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570717; x=1796175517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hr/ccE7CvbrXtthAd9FlF4NZn1q8fqO3JA1dQNOKxZE=;
        b=xjUQxyDcFl5Bqskcm8ENpzd3EKZ2xEQ//876vwyW1jELmRKojc/W9qlnPt24nTGZ5o
         RkAUYQ9T7CuJrbShXu3jPhaWzJgjzvfve4ukukIJA6jB4UQvMgXiJn0D1s4/hB5S/Vpy
         AdiJXRAqsPNhBzObV3jKnFh893KJTqxeF8CqSpWpm0UtYE11gxEEYaE4kju09tAbN/pw
         hwQo9E7ATHR1GLV7yQafc5ZQ2aIT0YGRf0huk8jiagMdZZOmfM4crsBm0UL+mTgrL358
         vtqwBwClXBuW5NbMFY5sFU9bFsim2UV22MNGg9dgRAsNFVHzDmJABiVlSACH2aO74lrT
         56Dg==
X-Gm-Message-State: APuU4Z+bK6YNiDWRU7Q8Ph1X7pUuFLMS7EB2c0xm1r4eNRsLCFybfIL1
	XzpY7vRiyZeUJjx1NG/lVEsqJwiNs1AIFibrqPL0JHIjSPtT0kTB8y15kmO6hKn9OYZEgwA7A54
	Nd0+xCXg=
X-Gm-Gg: AZFdTZdHnzyT+dreKgIdvv4eeKKkUIqecrt0wQWdEsBu/lWTZ1nl5vPvelJFeNZfUv9
	iUxamT+u0aBLjUcao+TMdlJHQDPGsCFJ8QJvA0IRGtt5KKSUojEifdENpcj9V5XEhlPmVB9175y
	uSX8lHJCkuGuZcpdUztqknhRVwwmAuSR9obm65zu4vqKk1bphcMXrDrKr3qA6KwtXuiVvGwX16E
	rucZ1hXnESsGbX0aXBGOwqcnuNJgcrklTXTgRNPXPTC0JqFaHATAN3sh7H6pRDyGolWp2hzzIa4
	TmhL+KQxchBju2UlMWOsa6RYZ8DX9sHMpozKkoKSpBpr3D8VStOfHW/ouxneTmo5hrx5QlwMxrY
	4yT5uB7kHlih8yDGUV9eVWIQJs/NWIZ6/gtGi/hClfzlArxGg6IZ89Ztub3/CUPoQdbMgKCmbkf
	GBmqU9k9Lvdjs1U1tOw+JfEzfVkz+wXRcg0LopSp9/Y5xvVhlZ3I1wmcs2/n43MacR3xgQkMF5R
	jYEVaRbspxKwvG/VDUVePMyaGoBOHM6JWzF9dR9hU9DXrkDjHz5Fhw+C8EE7qnc6qn9zY6BMYEI
	t6SI/5oLk/h7OAX2EFqRze5GPrRWbPkEcyMugsw0LMILAsmHRuOj4TXG2n1UYZ6NPs7hNKfxsHN
	k2s7821mnlArB1w0=
X-Received: by 2002:a05:6a00:b80c:b0:8a0:644a:d1e6 with SMTP id d2e1a72fcca58-8c87bfa20b8mr14937880b3a.28.1795570716663;
        Tue, 24 Nov 2026 17:38:36 -0800 (PST)
Received: from localhost ([60.227.220.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8033612b3a.46.2026.11.24.17.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:36 -0800 (PST)
Date: Wed, 25 Nov 2026 12:38:33 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net, 
	benjamin.berg@intel.com, miriam.rachel.korenblit@intel.com
Subject: Re: [PATCH wireless 1/2] wifi: cfg80211: only parse multi-link probe
 responses on MLO bands
Message-ID: <z7hsmmxhck2mbhhqww3wtji5zmdixjtixkx4dw6lje7lv4kxzv@f4ieebr2nk4v>
References: <DB4PR08MB91891E93B7DB8C05BE17CF4291432@DB4PR08MB9189.eurprd08.prod.outlook.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB4PR08MB91891E93B7DB8C05BE17CF4291432@DB4PR08MB9189.eurprd08.prod.outlook.com>

> Since commit 92d77e06e73c ("wifi: cfg80211: restrict
> cfg80211_chandef_create() to only HT-based bands"), that warns when the
> channel is on the 60 GHz or S1G band. Anyone in radio range of a
> station scanning on those bands, e.g. with wil6210 or mm81x, can
> therefore trigger the warning with each such frame, and panic systems
> that set panic_on_warn.

Well I mean, an S1G receiver is not going to pick up probe responses
on the 2/5/6 GHZ band.... and I assume the same for a 60GHz receiver.

> Fixes: 4d1d6b3f4599 ("wifi: cfg80211: add RNR with reporting AP information")
> Cc: stable@vger.kernel.org

You are missing a SoB [1]
 
> +	/* Multi-link operation only exists on the 2.4, 5 and 6 GHz bands */

nit: is the comment neccesary? Code is fairly self explanatory.

> +	switch (source_bss->channel->band) {
> +	case NL80211_BAND_2GHZ:
> +	case NL80211_BAND_5GHZ:
> +	case NL80211_BAND_6GHZ:
> +		break;
> +	default:
> +		return;
> +	}

Change itself seems fine I guess to prevent malicious S1G/60GHz
probe responses but I would reword the commit to focus on that
rather then receiving frames on a band the receiver couldnt possibly
receive on. Also I probably wouldn't target wireless for this, it
really wouldn't happen in the real world.

lachlan

[1] https://www.kernel.org/doc/html/v4.19/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
