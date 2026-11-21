Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283678;
	b=IL/h47jx0NmQFvvNrPBX63GKJIB4ZihFx4he95ljrtt8yJXidE5I4KmLd5/KoWwXPBsj
	 ZKXiIm9SBxakcAhj2aW3eNum5AuhJfCCTIs1THPEJ7XjXVybSIUCK54wV9bMj1DiP+L6P
	 O6+yZdgC+ZMnoN7eSGQq3FXFG7QD6v4bdl98xS5D7mzfaLzsUsNoKoOolRm8uvRHBdIyL
	 myv1baZ9lDTULP6L20D0KmThLfOY08OAT+0Yfs6hAW8AhPDhTtQTSMEIMUmOCT4edVgug
	 sZg9cMLFfsXUaBW/kqDoKkT06CUB+6w91aUtmZQkXPNlo9TIjBBHRSysnwZM4EYymew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
	b=un9i6v1Ds93OJI1XHJZYdzSCZM9iM119jp4b3u+Z4hZV5JvmLqIHqagiqIfhYYisSSTt
	 XsZAZ8uSXFkPopN2eOebuIroowOKfyJrjIUFFtu3lkjUH1yueq0+8qoUMQujzA5BzJMGS
	 ITAhSOwMWsEsW2PqedvOeH5XgXxSlmtiv9dqvEc62bFvsPAFQIC14cXjwlKGGoVHZo6oC
	 QMrkuvqOnbRnzTpjfhiqaGnirFJr8L5eAmFC++OYBa/T8561VPB9VptzO0Wi/bzeP6OiZ
	 6gs7fieiHggWbTuaz9CKfuJ0nyA0aOTtsBiTtT5+i8on/CriDBNiAvROiNQ/88rIXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AcmbfQeD;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB830606A332
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB830606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=AcmbfQeD
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so2534420a12.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283676; x=1795888476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=AcmbfQeDHF1SP1rK2vBlLSRVF766CGuZPoSMy8YGszfU7has5aJWhVIagP2sla7fGr
         BsbApheicPLt8y5qCtqium0lp2rRxlNa7Sww7sD5+LnXIJtmO/29N/BFV2dQApmhiqLh
         K2N+7b6pFvJ0dduqgAgIR43Na599F0Y6nqWNSuiXd0Iv3DSnsG4ZcTJ4bqlDaV+YnZS7
         uajU1LN1akKOoV/aLmQkZcoFexWiHWjIKqKCQop03M8WQXe/NOxvTawifJtaDqPV1K6C
         lNPJDP/YzeQk3+0UrC/EuNH6EQ9nY4dicqskyLIJFiORPQyvE4aUMR3OJ2wXrzbmX5Dq
         RRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283676; x=1795888476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=Bq6Mm4iF8fbQQK/aSW5vNe5dK4OOtRLz16tXqTILnr7xNpuB3WZqNdD10iCgSoHlm5
         sBd0bV4xFNYcX9F9R6QSi+6muxankjYllONMg2wwNaOFrACdOFZ60UF3JH2C2WhMwnzE
         cN1/ZvCQRLF54ojQKV033qavNAJ6Chqp0Mrg662UcEm0m5pA7ZVqD2XvEF1E4tR9vUpy
         WuZ+L0TcpBaIGJEonbMdLlWcH01YpYBuEsQbDQsosw2KZFtmVzo6iVcvReRl6iSKkiqq
         drLaXdeLXAwy7eeOjnTDtk96taVfkiGoqqZ2qsDf5uNrJ20Z32VrXRJqMrbGaTkZH1Od
         xcEg==
X-Forwarded-Encrypted: i=1; AL+hErE/CevoZWbX8CEkoWP9xjt87krtJZD2QPWsr5D4lK38B/onAXVrRM8ypfDv1/lFjqJ5IzTCuww8Dd1zOJl3cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FitQd13M3nmy3fe/VzTrRK9i8DwzKzv1bqJHw9W7KbzeZE3VM
	nelug7ldRLUokHyZGy1LiCDEKR/9FiEryjfDJl2AUYEHK0OY0UiWPLALxR3Pf2D1sA==
X-Gm-Gg: AZFdTZcX2SNnk5oXU+o8598sDhGDxPpJH+qBDbr4W7TQ2XekbDFr8JMklo0zgfSDoZt
	XBl+AdU/5se3Z0ycZ6wZSFsnMATc3OPZFqHaHTnEbmY+Xa9ZcE/h+PCXza2QXFMsOEOw13iyye8
	iv7/FbUq+MgKkmEyEyzyCUEZWGb4Ha1iPBvRPzQwUdfqgYDzLkORH32bbpjDsDyTwoXn6LBrIqI
	EmtNJqabBNMmj3S+YzP5oUWwtVSGxmomLN6qUTxw5InI+WPEn0Oy9Hx1t7mHk5exV6CmEPC5+1v
	aInsDUgvRrQijRy93equrcVi7mpBe5z03d+ZOsXOZY8tt2P+O80scLsiHjkZoG9Nx1mJ9wpLCZU
	DPNHdbSnVFI7q5L8fUdtwC8A1HsdTjqlU+rSNXYJFyiCUBh+VBVofWKuBnQwRnNRSrDOea3BRzg
	WTCIV23By6YXSI/WzEKk8EAyxCeEz8HsAvQhJPl/aIqTeNM4DXj7pHuFWjrnywxlxpn5iNE5uSi
	U0mvK9/xm6kna4W7QxZWVeukwkphsGqQZoKiG8O1mLSnJ0UulljZuThsg1o7s6g1GcDlctIHBuC
	Edh6hGPrt6FPBPY64f8C1ufjNdUD8aPIe80pPrrALRAemgqR5yO5KtecI93RKxkJ000CLrcGRqQ
	bK47ydbjfNOm7/PX5jwbjcaXn2FDH5DnbRyMmBCkuxanw0Zy5C0gNofOuSPt6D8Q1L0Z6UYMXCW
	w1/labfRuPx3qU6VvotMgTG6ro53rIETlWSC4S8yNOwVSAPA1CEuePLsN/FOdGTzaC59o7QLWbV
	yjLcc2EAyX9gUQ4bRiNe5eNEVdqfH9qxuH/V0CoS/g05D7DonlD1CqtVkkHlHhwr8n6NVqXYeip
	IF/1R7Zy8uMcTBYTEBrx6Sf6lEUh5ClxozIZyfLptKW0ByKCWwETHiU=
X-Received: by 2002:a17:906:a11a:b0:c4c:d96e:80de with SMTP id a640c23a62f3a-c513a5dabbdmr467707266b.8.1795283676178;
        Sat, 21 Nov 2026 09:54:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm217895266b.80.2026.11.21.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:36 +0100
Message-ID: <20261121175436.648565-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
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

On 11/18/2026 11:57 AM, Jeff Johnson wrote:
> I'm concerned that you are taking an approach to benefit routers which can
> actually harm mobile clients (which want to minimize the number of CPU cores
> in use to reduce power consumption). I'm very hesitant to consider a series
> for upstream that could be detrimental to mobile devices.

Agreed. In v2 only QCA988X, QCA9887, QCA99X0, QCA9984 and QCA9888 take
the vector block, set by ce_msi_spread in their ath10k_hw_values.
QCA6174, QCA6164 and QCA9377 keep one MSI vector and no affinity hint.

> This looks like something that should stay within OpenWrt, which is focused on
> the AP, and not come upstream where we have to treat mobile devices nicely.

Without ce_msi_spread, ath10k_pci_init_irq() calls
pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI), the call
pci_enable_msi() makes, and request, free, sync and deinit make the
same calls as ath-next, so the client chips see no change.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius
