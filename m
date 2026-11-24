Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551227;
	b=xAWK+iv0QVG19OVezozeFl4M0z9P9JZaJOynHNAwPOllIb1Au2Mrdo7X5JOhFrsKeN+m
	 8VqeHdNgdmrXnwMXyMi74Cm6+uPKaTJvDhACsbjnHB6z9UuTezg7ioES7OqfpG9/OHbQl
	 67UfsCcjD0DUwQp5GUXAdpiJKzdLk1TC6D1QjuVt64+4Wk4/A3adEU1nLb8EX/BMS3lOw
	 uYq5LnIBkrrkZKY/WqtPIUaOQ1OcmeWAHJtBqcRszkqdyFqKX0sq2VRHTGc9PAJj6kOEL
	 ighWxAIGb54DSG71RWkBcifpRKlGEatgNdeJg/UdiOGjAHLuQYKBCtOVvx3b221Ci7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551227;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
	b=128OUZbH5lAu54gPceSa7b/1lO/Zx4ew0zRMPcm7FL+dCnSlqI1+qm3pMB3O02PnDHGr
	 iNA1Fr6nVKKgucfnI78nIgtJRpZ0K55fWM3DuXnm/4GKBr4ywuBefYQZ/oA7VPp58Sx0C
	 q64ldTAq20DWoM+AOxrFFikGXQbXBEACAwwc31FWnxDaLCWAIjgp8/BfZLjfNS9m0Ii7N
	 LeLiybwQT0RBtYUlwP8loYHOskEZjtlc9YIHVkNAhPjmcwvMR0i310U/zZ5b2uraOnHv0
	 QuaGWhmsZLUjLCxUyinTCn0YuXMaWra1mE6MqxNAM4SGvTBkoqGXMEPrFcTqvzVbOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dK9cW/th";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0AC606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dK9cW/th
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2095680a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551226; x=1796156026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=A9BhyvqHN/qBz32UyXddXAEyZO/7FrWwFmRtNTNq3xnG40KcPh/MlibMY2qNhob3Ob
         Hqnh6dR8GF9cnfgSSjE2hK5vEgbT1BZdQkvkH10KatDQRinzJqoI4PPML95SHu+0Wwz4
         1/PX8UH9fYaZaadH6H1Fm+qcfs0PEgXmD0eWeOrRMXRZ6Y/4porsfSq3YTWwQNkkeI/f
         S0LkfYAXrkZPt9DLn8mcg9/J9D4SaPn8sUgLlN0t5AW+CoQrttGyiAaxMfqjZdAWV06w
         2/C3NWQ/ziPgPzP3VmjLTHuKja8fAUHUQR291iyqPBOW4ulbOaZQys0iPd7lVag09BsW
         66lw==
X-Gm-Message-State: APuU4Z8E136lL1jO6V38Z77ns0ww9IcNMbxU4yEHVI0yx1yoNyREQWFW
	6wqh1UVWOVqkAwoAKf7j/a1ZEC0/Wblf+NDHpwyvxxng5tdhJbNGxpDDpehHFg5nocyaGfhDVyO
	j2LeBTz4OsFNqf/DIDzn5VucZCH6JciIWnkOaI7D+IRNAGTRFeEcGQExiJhKaxkhUa0Kbfv1oIE
	CwXJZAv8h8qkOawihLsfkOu8hECWM9x/QynJ1YXsYc3qxxcgf7RDa8J1/CzjWhJcQkJWMiTaNwZ
	UxDTe8bjqNfyeCH3G8gkT4AzGiG
X-Gm-Gg: AZFdTZeaQF0hvfX789oS5UD4ZJSRNBdsZhMBXTJe9fjFc85duMh+czECQnn27ZtkzYF
	7NIr3ROC3r4jt12Bu4K6yWqeOxk3zoX2D/nih6eFpErsQi8d0QK/X97XUcagQkitWoDH/rJsLZY
	9JM5XHdLObeyqVtLc2vhn0KjDRwM0F1GbxHdPmHAvDCVciI/SHMkXgxJLIWTuBYkflSfoGupgaA
	XE9raL7mZtSqqgATalwGaliSKfLktOVnI0rwuy8/5SMXNYaXkToD37K4UOVNPT65Jqqd9ocJE33
	lD6fw20xXL5ozXwTCxwSYw2v0obGaOKVCYH/McmYBpkAzKefDH6ccY5/6CRB9pp2WdH3+3l8tR8
	lwqp95Oxr8D0QksS7xYHhBXvqqky3R/TR1DBLB9uI6PtX78lnDeniD0KMDVlsohLCDCCTwjZWq3
	Ru6OT3omKTegaJ2xKIES0bGsMEadHIPmv1H5R0jCFuuw==
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr12108106a91.7.1795551225982;
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm6004772a91.0.2026.11.24.12.13.45
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210bbc04abso96061456d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551224; x=1796156024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=dK9cW/thZ4l0hKQLSM+LfgehtNHV+ubyhysybRmvj9CjCApbch93zLCJERNgOSm84C
         WRjKBK96/P9P/IA2kRU5ZmsT5zmyh91SWOdGwW0WMME7w62pN7knn6A9CtWCZPwSjkdH
         nZa9PUiXzP7i+/ekD3QopuThZfamyl7eNpnso=
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262816d6.46.1795551224490;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262316d6.46.1795551224014;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b081csm141186546d6.7.2026.11.24.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: turn off TX beamforming on Apple BCM4364
Date: Tue, 24 Nov 2026 21:13:40 +0100
Message-ID: <20261124201340.3494125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141020.92306-1-dev@deq.rocks>
References: <20261118141020.92306-1-dev@deq.rocks>
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

On Wed, 18 Nov 2026 15:10:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac sets "txbf" to 1 at init. The Apple firmware for the BCM4364
> (9.30.514.0.32.5.94 on the MacBookPro15,1) has it on by default as
> well, and then rate control settles on a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP.

[...]

> Set "txbf" to 0 on the BCM4364 when the board type is an Apple one.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
