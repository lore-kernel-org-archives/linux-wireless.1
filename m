Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795358598;
	b=c61KoZLEU5X0O6QqFkj71U9VQxjEem8FjWaljPuXFAITfuEMtYzYrQT6P+ehnpDpLIji
	 C6FW/4U5038hpqzGKUQcyzryT0DqwONzdxi0qmRuF6euzDH+KXTYGrLmoQe4f0/AIRXqQ
	 jgaPpNFsNxXgB3LNUxrGg/2KW20Kzby9s8E4bjs2gCX4L0hYTtWi0zbfOgumW5OWLLg6m
	 L9z4wrjFTaF55mH31bcrWLZLVEQBItGchK6rw9KCdMqCLs2aPjs2WqXI6DFPGuZadh1TX
	 IgTBQ+wL2IEotqkM8TmWgf+qLKWUvK5PiKLr/sk9oW4UjWiewONQ+pGPGNeqDUWehow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
	b=1YR1e3V+Rmp/lhadI+WLtZecFpWo6SXXg04vbhnSwLiZ5Dw+cZdHvPJKbTJHJK4bLfLb
	 wjNCm6kn063HM5e/bV5AbksMk38WUEVwfT+q7P54g7/3Cw4FLaaaIibRZN0Egrspo2AbP
	 ejTwqrjyKnY82jlfMnYYGOZtV9R0apOY/dnO2Df1KI5QjsKCsimj0qyLydzmMC60Bg4p8
	 R8eCltE50SsM7Gt4k8XTzEtntuJCqoN+Xz9oOiOKMu2RCD88R3l7Kto2ob7ybRk4KTvaD
	 YKXJPTepz+71RIRUHQKjCy/QrrzIJ1SWGxUO2esTmbhjeM2OBs0K+On9ai3eIUMObnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oApxSGR3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68064606A331
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 14:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68064606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oApxSGR3
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b2d14968c9so22077527b3.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 06:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795358597; cv=none;
        d=google.com; s=arc-20260327;
        b=lWvfJvm3uuWHYQYn1SQSApIKHQihBEAA53/IweBDB9annaGzCLu4+NF9jMJJsr5uab
         O2yRwfY5F7YgHT7PmiX4z7eV5n6XeQT3rMnIjIum9U7T5HJBCwfjnMqDqYC153ndRwJF
         +Uur6/N6iBMsRQkfyd6uMdW3+xrlsP4v+/PLOuJst75qMOiPf03uq55P8JX85Xe/+8Mj
         Jr60BrjVH4tZ0L1v4k6b6dYhBNyi7GZmSU2u8ydTa74ENOmKo0ZI9UG3if+ZvawnIWkm
         ObsRGSRYnDcjjsV36dsJ/L1UGvCR4ftRZ5WnCdNYanjUrynIR2NYFaWp2sYpMIEV11pF
         eL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        fh=3Gm25RB0CjcdUyn2wfYIF4uXvG2PSma00irkDxIj9og=;
        b=cyHhmxmuVmQ/UIuClSKiPmCZ0UY5k0UWgI440GbolrX8M7CqHigJurolzjo2IbFDH0
         pY3zyyY+RHuaZWlGUhfuFGXftIrmK/ob9It1jVf98vHKCXIq/BKjBAN/bI8+DWFtpYar
         ZmAlPtSOTy2HgsoWRAvRBAsMkAwFPUN6XykqCI+wDFih+MVl6MzOHRA2yZXw3rqc8cJh
         IaIF8+U4/gdQCrO/7Su6XqwRuG6E1FcrvYkeMg4eCTy1QbRF8xIo4dio2hxOdeD+iRV6
         lOyOcGJGgMgbNoO85N18VdM0+KDjO4P5nKhY9rcRK4w3ps1JUY1Kt1P9U5Zy/2EADhxK
         idIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795358597; x=1795963397; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=oApxSGR3RW7p6aMboPcZ4zlCnsXwQlRMDPxKQ4y5OTtqmTm1t+oIBhNBbJ/RiFfe4Y
         x1cdNEYp5PKLXsDTJ+W8Pzy0KDwNTn+zjfTl21BBISAb2XUYt+Bh2VbngVuKxSrS7qiL
         /k9oR039kq1SvtmVShAgHEhtjDl2JGO2JWtSk0DjxdzLd3F8z30pBJmOUfStCdt9VQTJ
         yiHqVWEPjCyMXLOHSIG/aHrKTvYMo4pwTMixDhhtSjnO1lCKGWJP1Pn2TZ2L4H6tMN0p
         z75dvIJTHMLMZgfzjWiij5Eg6/FkL3oZTlirn0RNEbJMwUZBCq1yx8rniqILIHHOroBn
         bbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358597; x=1795963397;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=P257v1oquhUxwHcCOPDPsZg2Xh2kJFMCqD1lYyWq1XNSp6bk13ZjMlfnCIigAvIjxA
         Sk3bLWYTpM0iqGZdSsshojNYjw4ah/HqYee0E1cb633tQnuGLJXnbkXm8htulPnHEyrU
         KzNcycFa1HJREFgpEqr+8ed23LBz2SMYfeOK2ZgKbHSmTZMCg4S29WY5k5zX0BSOqTPK
         34adMdgVY5S2+Kd7RMobHhOr/67r/oJmR5XVTnV/JG5d5hYdzutBdR4Mp0turcN7Hjwi
         cP1E3dHFqpgbgt1liLkfL+Y/fsvNjdbbdtxDcXp+EFmZwq8QrSglSDWmKEEHTBS5s1jW
         Tl4Q==
X-Forwarded-Encrypted: i=1; AL+hErFzHAEaAo9PwbfrzwHIt4D4xQthYXACilhFwFYEzpBluv4WHPU4JnYW8KzUAZoMNQYphJ7sDb6iqhBxpdvsmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xtmLNqikNhx5rXFnMc4rdKon0y4bLzDTeSuKXzB5gbCVlHnH0
	zuGgShQ86Cg+LooYJvJhpF5RtMZyhpUGq8tvQho8OURZGV05cC2KzvdHct/SWSAPaOil1dL+dfp
	a7SwPdW+BzCWLshEF6+UCLQq9PS37nCQKF49TmHGr
X-Gm-Gg: AZFdTZcGIpc+2x74nOjr3u+bjAgzNSR5pBhmXKm11udZ9Z2HRv1eF6WxFfpYN8RXbcJ
	9tamAA0ggDlKD+iorU919tfCmGoNRE4scb96uy9HdFZtabHKzZ7e34UIklfUx8aNrc5gY5kFmdj
	PrOg07C6sOdF7tAIyDvw5KdOrjhSN8KGR0LHU1Vzsb0wFHFJRHYxgd8WIPyIO5iCAEwLx5Jvx5O
	p+e6mpwIsGskqMXJty5oBAO5XiAdXYRmm3H2V4Mvd7on7EBNf/pvZsbcfPdw3zidMud0keqRXy7
	yeowSR18JIHBhc1WEG0bmZuipDMMP+vPcTwMWEx/UAOm0vn9hlhNFiYt+BPBJ1vhGyBSiliiYVR
	hJoc1OynmPh5nXazS1GodZtpnxWedjwAkcUpD26IB1n45kZRha26LiL6Gu+A4B8rbeaq5YyUtga
	oEtlUatPPX2gKIcCL0RfvmVsaUK52K1Ccx1l1vsvSViqo59SGqJ5Yv/EG4worM3xQC4So8cMn4h
	Psg0KnH1ea+AzS5mW6cM8xHmz5mORU1CGhMdTKNJoXN7BkgYRFJfLUM2ez4X2Ky0pp+SId4+g78
	eTp2BiP5/9b3/ZUxo8hyl1tpThpnNx9oNrMRwhTe3hiYFWn20fNBf0A9hC/okk4xgQHrMNHXic3
	jwXv3HiAeeBSPOR0snfzOSnh+0ekwti8=
X-Received: by 2002:a05:690c:a:b0:8b1:2db3:b845 with SMTP id
 00721157ae682-8b520435b3emr29200087b3.14.1795358597254; Sun, 22 Nov 2026
 06:43:17 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de>
 <20261121175402.644803-2-julius@bairaktaris.de> <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
In-Reply-To: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 22 Nov 2026 14:42:43 +0000
X-Gm-Features: Aa3M54o5gEPUswAYHgd42TPsZL6s492wQ5gYbnXvCBHvlFH15c_NQ64WYeVIsGI
Message-ID: <CAC1t37JxedSiRn4rjGRSV9a4N-Wm0mvGQW_WGhpitq9qJSgs3g@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!
