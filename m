Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564199;
	b=JdCEyVwAFW+uAnZ82Mb57Lmj9JV6b1CE2q856rDSk8JhAzum0DZPDEdO0fBPmZZ9tLKg
	 7IVhuFHOfGgfgFtChrelo03FR1b7xBMjEH50JiUXSLpNWGltv1Jd1qWFhRKTjChmY+hQL
	 lTRtUy3Osyho+cWoiLhKCmQ/WqIOjbP6HFnqBizDk3ewlmq+0WXU2o4AZaVkHH6rXw1/e
	 LaFP98WK1JN8rkCmMsLCxgxCmqx0VVBm1JtE0/Yh/Wb9mAjoQGo3YT1/C25viw+5MUeB1
	 wiYVr32TtXXnwkQw0Yjt8JLqREfPSCtenzue9lYp+J5oKbb59Qohgh6g1ULOH8ExSig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B3e4IyFODEQsC0hyRi4isfuZQbhHhE+b32DcYrfgHgs=;
	b=dm55OgAStg4oIlNLmU9zKwn3P0WXLV5WPQ4uhQGcJipqKHLXPkaxXnoS88RBsEcQZvNW
	 gNJxSI9FRhHDGAjagWe4Oyq8iM2YqXRE5kQUCgjvC2pBjHRoASCrPrs8I0WVRDRJUCP0Z
	 U3xp6JSiQhkKG/BuWrsVuyC0cMzazQ/fPZ8+iZbmAAIDPPRFnDfUm4ipXNvoftQE5nyWI
	 LTMNzsCvi8wD4CQotfHtdSAkvQOX6uVMmw7egY/Ewp6A66nBiWYHr+sEwPYepxVvxCThr
	 TdGW5EwJEyATTo4GAgi8ihMH85m6qR1c16zpZaxjSOmE4n4QUNVsczbCxLCiZ1Lq+bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pc15gism;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D6606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 23:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pc15gism
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2309212c88.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795564198; x=1796168998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3e4IyFODEQsC0hyRi4isfuZQbhHhE+b32DcYrfgHgs=;
        b=Pc15gismD5Q913IxsV6xhp3O5Q0OLebTAQgGlifRzFzl7VpcdanxkRINFhIg6502fx
         RLTnrLkPmDAs3yTsjCAwnGSz+OTfX3zMemxclhAxzNBGnzCbUHIu3YwFE1MzNC2udX5V
         DOgJeBUMhDmYpSDUfiwzcJ1JWV+MC99xefLsTJ42dt9LwZQn8IoVhoXimidDSfo1v2dI
         GhlUGl6pEZoYUniRnkSNiisVW9gA1a4KjZwNddaw2ThOE/Yp0YvyPPjfvAd42ancU9Br
         UuvJiDSZCHfGUNziagziTQ6wyUzbcSJJnkv0fFIoQKKcm9aJ5JVsJi7thecUAw0xPNvN
         3glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564198; x=1796168998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3e4IyFODEQsC0hyRi4isfuZQbhHhE+b32DcYrfgHgs=;
        b=PlgYbnVjKp4sZAJ09Ta4N480WGFoPu0NOYMbGw8fcynCnSuS5AnHVCuWTWGJl0NIh4
         TU5h7BMcYHilqbprFLmRKnfbu3IWYhumTo5DALIZmSr6qkWgnXlsPVxwi4BBd27v6Z76
         zpdghYSGfan93sXtoUgalDu8gBoO9+9MkKnlu1a0YZCikHJWDFKCvBnCdtfjv6FOdeSM
         gU1zBEc9gkqM2ahFL4uiSufe0nVKCR1kB85sxx05Vq7t9VrQLlpesQEd1hoaeXIhvYUZ
         0XCEcLyeZLiyntv6DygSFI/PvSPUuV1xvgVbyzw+RXn3DSaLv1ndsRqfpXxENlyna8+Z
         SsnA==
X-Forwarded-Encrypted: i=1; AL+hErF3ouarV1wOA7MheABNMU91bbTxO5I8Jelehdd94leLGzm+L6FOngo2xB8r631kLXFWYJtY142xickmAN49Pg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9mPuWL6yhbVQsavbJv5IjrYpS5ei7laEsEbVWCYgZuVCcPDKgW
	DMy7L00nEje6dVg5ZoAfGQKdCJXjzaXnJ67xDpJtiJuCyRPDr3+jOvEFJkWeT5jfj5c=
X-Gm-Gg: AZFdTZeygEWsXGJZj3V1hgnbHqWEwS3bIAAV8auu2/FgRt6+539OeddWRJ9NetBGfZv
	cli+ogstVuFCodTFo2RoTrgNjirgwGpQPSWRKxauan1Ctmwzk7WWofOP/doKOZimbCTDHyIIe7O
	ksZ5R3MZ9mxejstFz5OINiiYJrlLF5fjcKkl6cmJK+6+ZqWeexWqqS4oAECy5e4QpoYXzaYFWmg
	sqsW4fTeVSNpZ8RGz57G9QHr2Ts2YGIDvlkkWTKyHD6uYJGS3ykz0ibGgMP55PhphEExKnvCht6
	Svs8r1GRkUg6XoU4BfW3rYPRtE0afEDnDjHC0LuNI0b5sXr2c/gmpW/tTFFmYadlpNjFsP+0pIw
	Omz6gw2vqz03IRRSmJWVnC8+EjHbqhDe9NKqcd5Yzo2kChPvT1sNECR4LMkGQYV2aB6e6+q1N1w
	1FNvkDjV0AOUw0JeK9CfzTYhGoMkyewjdJPFYnePHQzE+zYbo7n1saB4scrBQbEd+CelHBWJk2s
	oNjZANtlBiPO1Q1muYa6u4+oXbWIOUOfE5uAxs3p/VOLFBkxZ9qvYQB1b8x9PsICe+ESWehbyPE
	UfiX7PNRE68mzdfQhUmu4S4XqbVZTg1fpKrS7tIciVrDv9/XDcUd5Hn4TaXdG0l3pCNQcQ==
X-Received: by 2002:a05:701b:4555:20b0:190:8f72:445e with SMTP id a92af1059eb24-1b556877915mr18144318c88.11.1795564197416;
        Tue, 24 Nov 2026 15:49:57 -0800 (PST)
Received: from localhost ([60.227.220.243])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm37549286c88.1.2026.11.24.15.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:49:56 -0800 (PST)
Date: Wed, 25 Nov 2026 10:49:53 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>, 
	Arien Judge <arien.judge@morsemicro.com>, James Herbert <james.herbert@morsemicro.com>, 
	Ayman Grais <ayman.grais@morsemicro.com>, Andrew Pope <andrew.pope@morsemicro.com>, 
	Bassem Dawood <bassem@morsemicro.com>, Linmao Li <lilinmao@kylinos.cn>, 
	Kees Cook <kees+treewide@kernel.org>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: mm81x: stop using linux/gpio.h
Message-ID: <4pardxfrtr6mzyv64lppycz5zrlzoa3wjidsei35dr4sq2m6uf@q2cwbosopqlu>
References: <20261124143538.3253500-1-arnd@kernel.org>
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
In-Reply-To: <20261124143538.3253500-1-arnd@kernel.org>

On Tue, Nov 24, 2026 at 03:34:59PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The header is being replaced with linux/gpio/consumer.h, which
> is already included by the driver. Remove the #include statement
> so we can delete the old header.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This was previously part of the patch to remove the header,
> but we ended up splitting that up again.

Thanks Arnd, FWIW I've just applied since I was just about to send
my pull request so this will land in 7.5.

lachlan
