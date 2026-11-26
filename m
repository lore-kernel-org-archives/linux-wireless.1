Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703390;
	b=aieprW/7StheMMlHZ8npZtWN/y4q6j8ji8vc90TofmQPiD+Lh9i28ZwLu/nkAAIkltqB
	 S4zj0jctTiBR2seUHyrgJUPtlZO/NrfJEq9KttxyWDj936j1w5gXsbDcWO0z430x8yCNO
	 Orts+TYyyKnHGLeciZ5K2BbDTV/w0qUQO0HhHQ3vjXM6jpL+sDYJ50rTYeJSVr90BLBSF
	 3NNfI0dyGltDwi80PUTGMXCUfyfm297uWrsYeRec7xpNpbu3XqgvyZLH6LvzbLRvFMNZj
	 +qp8BW5awYhgfYRvIx9amnzTt8kLAiDytjxa5xJ4wwMAgymK3jbgVK5g07kBEYkZvxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
	b=IybUqflqcBGGKIynxGVJPTkIZiIZmTrLzpYYt5IV3ZKrAyoUCO6fGZYepoSWZZUFd8mg
	 LRR1JSVp6EiZJFd3yUrukzV9ma05dQZmAhBHoEPBml6HCGCIQYyIgSNLlFWNy6db4sQXa
	 gouoGqFHPjpryi8z/Y/CjCkPo2zrJbJlj8BdJpBbFAHT/5bhSr/ZA0ukrWmqT7+yCPSCP
	 5stAIlG/ZNY3MhQRK4g3JhSpQYln8bH/GkS5RNus91JUldLAdmQzzUpEDsGYx+iGGF1Oe
	 odHpAcIzq9vC1MYH00YHjc5aEozvcMvrUgKT4I0BsUtp9XcxV+QBQwjG1WDmhSvq+vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c101GbXQ;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C4606A329
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4C4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c101GbXQ
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-38644aedba1so10565035eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703389; x=1796308189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=BYZWUCWr2JpQKv0ggG9y9cjdF/FaNqqMFMi0gr+lZrWrvAhyD3kUBqTJ4oqt8G4b/x
         aRud6jVPXr99mhyskWnxWMAh7tQeOHOm5AdE7yi2yzx+ZySILOh5qcP/o4WHPepjUG/q
         MoU/5adJISLLKMSEndob+KAfgEj7I1iEnWhUOGP1oB1c9cR5pXbwDgmZKilYuy79hJhg
         QfMpBujI3BqFVRhw5NzR4Xk3UJmsPc81mmTdkYvZoPPv7nuTHEArZhs6A6xkOq3of5hh
         lavGVBChDspiu3qeCybVngQEH5UaL4UILUEWmT6qDwkAzuvfJLthKiZG3WGeUiPUkQ3Z
         aSzA==
X-Forwarded-Encrypted: i=1; AL+hErEZtJabus3kR7edQJnAlT4I6MUky3D5Do/oRwrsDjmg4iBec/k11uFTGiLMFFCAwLDSUSork8ZtPiHoR7gLLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8J8ogYH/HeBgZprc5YAxyC6bhngGRrAt5bNKazwVNsauB1WFmQ
	ErJIgkAnXLYU7mAAM7avkdVT4Cpf7X/tnehTbl7UQq06CRh2lvsK9zgWwcGqPwnLpV31Obcms/K
	YEY26FBI7G6GyYOSUyxXBTEURfGtVEWRYQ7pBDn/2kjB9psOp1Y1fB1AaarGI6LMRcFmak7gNhV
	jJRJE1Ou3CVpxmwcLz7Yq2TzM45GZFgnW41mersP5qCEmDO/iP2BX0oa0e5AoxKcvh7s2+5Le7E
	uudK+/V2PQABSIspbUvva3WZxtq
X-Gm-Gg: AZFdTZcnSnk0XSZo7wFiYwk8QfVRSk6xPiZJCZhN1BwSpI2WmKsQsB28z/pVFtKKx8b
	0LHXXAUubhErAVgJ7PFDOU9oANKqUF8V9ChaHBh0eg8JFqIpP/GQ1ZkjcAr959R/oRhILg/71c6
	6ZoAenyRWLr/QGevFyD692B6w4exEg7Agfhkdv1eeHgmiuf6q3ogN2TdX7k+8IWnsR7bN+rN72j
	A+O92ctUM5GTGFf7wt6SMCdvlQOjEZ5FpAu7hqcOwFPBoZXDsHhbUpQLZCkU61BYD5M5zk3BCuQ
	dPKQSh16gr0AvGm2EYi5o39pXBBFh/5QYguhhHN30lSp9jnjKiKFgeL83pr9cNpdCszT3GYrJXg
	yIsdntssyL5iI5zkeE8GkEk3UCOLX7IJRZqNF3QBoNIppWTcqWbqO8YTLkN9aylTqh/yREHEYFX
	eSeDFJup2GrmW4KZfv6RMv78oekIYO62FfoDB2wDI0rA==
X-Received: by 2002:a05:7301:1402:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-3856fe564admr24292185eec.22.1795703388993;
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566dd1e87sm3440041eec.11.2026.11.26.06.29.48
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d62b80650so166175401cf.1
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703387; x=1796308187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=c101GbXQ47KgbICijQTSDbHGAVCZYRPP71i01elyv1A0RA+epRAhE0k9DiR8uDHrGN
         E9aHOqDgibiVpVR7PeSzHVtxoxzdPOS/7+xz6BwrdWLwBe1NpdtwnuokaF0A2DBLG6OE
         YZ9T0V7I5JN/F82ueMcRvOMqcRuzVMzN7/KRE=
X-Forwarded-Encrypted: i=1; AL+hErGoRvOAJY4gfUOyJTh6vefqGaftu1NlaV4Loec73i9R4F1UqtRB4qKye+1U48czB3z+c/JsW1JUp/+8XVo79g==@vger.kernel.org
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901981cf.24.1795703387404;
        Thu, 26 Nov 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901581cf.24.1795703386998;
        Thu, 26 Nov 2026 06:29:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Thu, 26 Nov 2026 15:29:38 +0100
Message-ID: <20261126142942.881504-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-2-dev@deq.rocks>
References: <20261111120748.23795-2-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With the mailbox on the control ring, D0_INFORM goes through the ring
> write path, which refuses to write while devinfo->state is DOWN.
> brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
> hot resume fails and falls back to remove and re-probe:
>
>   brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)
>
> Set the state before D0_INFORM and back to DOWN when the hot resume
> fails.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Please add a Fixes: tag for the commit that moved the mailbox to the control ring:

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
