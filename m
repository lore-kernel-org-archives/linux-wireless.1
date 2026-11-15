Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776817;
	b=Ole8WA9jDo978vqvPSc3rYLGkSOdsf+0gBixRA54GErrhXA3i+D51XLGrUuE3ITzUO7y
	 wkrhn1h25YPoh6TtrVw8y7ZRYF+3xi1A561DgC/zh0KzPFW4kIkWqyOUQVt6QCTYp9cJe
	 WSatptT4osSQmKFjVBYildlAFQtV4zWeGXsoqLu7/R6cVFilpK6NzCM/kQqLULXmWPycS
	 ETnQQzdqtm8vPOpdp687io+ajmJbUNAhgzw1E7Pi/AXCPIn12rB1RZdn1a3DQEnkWSIT2
	 0shcdoZd0+CBLHVrDVQbZHDlyFCmUV6ixawLkgR+hnBPjO9B9us32r5/JkeIbxvkFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776817;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
	b=ShjLZGkusu25pfgyMsts2Gw95w3Vb6nkpjoKxKMf7i+MAMZJb8WupHQ8tQ1O4eo2pbLw
	 gj5EL3HolEro3LVKF7GxZNzBckYaePAA3CzhkAhtBvK9FQdqVBD+QdgR19lzHkm1+cRUi
	 6+Ua7RmI+w5A17QNpaYjTCvs0ot8KnO8H2Auj8k4Y9rHs1sg+8rUvCZG3toc8xa2zqGqc
	 atJEfLak0xiQSL8bk2HkYkEstCcluMh7eDFGY8WP5Nk2S8SiNFKDN4dGIj1/DTHV+nLII
	 hJYOwelI210eR/TxxZNZFjwxnmqdPsM6OxfUCXA4PPoRm4Wh61xuzeR+t94OCrOJ5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Pihjmq93;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7CC606A334
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Pihjmq93
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e9eb579c0eso14095315ad.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776816; x=1795381616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=qwkyM5dhvrpHxeHfPMGPkoTNlm+Ho2Cx+7AtwlwMEzU4qAQYgBUypuhAQui2oa067w
         Z7TXtau6Yb1gqrJ9aDON9SBHpD5v82c0ixQ9sOnrQQ5UgeVXz4BMqfSzHWHJm/nCD9c4
         JBdm5TUHHa11hFK/ZaKIC2UTGV1aD/4M/RQ+Q1ydU30pSHcKlS1vlGbCMieGc6tiNdKU
         eaOgVj42Oj12eB68Gx144IKQ23ttBoEFe6dX4hwmEfFt/1Sw+XApxQvqTqJvQSZVG5I+
         0OYKnHq4s6zUAF4tcYyCPL89K5E/gPJ0r+cY+QtgREIFvGysdMIGzYrGXFJGku/uBKN1
         0Wlw==
X-Forwarded-Encrypted: i=1; AL+hErHLhd0mhZ0f+pNFgbMxpetHDLaGCbj5BetS0dstBmuoEiTiVfG3P01GXQSU/SAbfgqDjcxFK3v2K3aFKSV3mQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VfcbQwMg/pmPl0O8/eQQTSesIS9fTz8zKVB2fT6gjRyw5MOae
	cZDTXsxDt6pga2PMOBssqS/GJxIfC2ejJ1MRX4YRr5RwqjBmWnpvqV30Ps5+4Ruh6m3TdePmRbM
	hNUNeuCo9x+CDthc8pYDNtNMCM9Y5d1rRC5ud1AkmetaHIYXZXSdqF4aXpQwaiWUhyhIHhb490W
	VP5eyn26gSXuIGpwhF0o33g1LPiGU2J4wQXJqcc6ghprjyPVNsm3wMX/aW8C35+wA3pxNN6ccTr
	0d23D+exDf+UXF+qulfVmY0pw==
X-Gm-Gg: AYBFou18s08Oo+hF98U6gQvJAkrz8giVKJLWBTTo489pYOoCf9fFf9tBvW2Jz2n0qY5
	wyCPMa8w2Qrdlv3/opZcBxpDSoPRlSywe+bdH9ucGVsm7exVVKjXlHfcWh/RaYndsapQ1XLBi52
	+43G0EhlJTSC9guvvNDBYhfHgFQc9TwsCjyJUqHpMWPkSQJ5hI36mS0l2OOreUWY2at9l0fOPAK
	/KjZdH/FlqW7J+0kzSGRPbI+Y/GtCOjQPhbGROJKO5QzayxGx2DI257YW8znOc7JU7A1kQ6SWVC
	mnGtLtY0XLyaIaQGkWf4FAf3MDwmJnLQ9v4vJM/nAxBMm0+9LbCoVe2HEBBO7gulju442nG3HgM
	2aMTBR7skBjeenwz1RjkSNjbkpcqTGmQPaqzeH9emwLWRn7MYaY8O28/oIJYNd12XT4zw4+J4bQ
	SFM4NPBl/ywbwR7+P0maRRTkXdPayAyaG2X9RpuAg=
X-Received: by 2002:a17:90b:4c0f:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3b1b0b6566emr8047755a91.56.1794776816174;
        Sun, 15 Nov 2026 13:06:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm10624884a91.5.2026.11.15.13.06.54
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:06:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso2620953eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776813; x=1795381613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=Pihjmq93+ydLw/QwqloP/87X/p2H2h8JbkfGEB7Zz37C4ErTSkKAtgkme/dLgDvNIH
         ETlniro1qPFH0xV3XKu8HichpOYLw3AfnBItaPu1Q5nr8RUaF60oMgMHcNDcMVuddW0D
         RIFKayaOlH7VCZvhe7RHhoP+yQ/FGeg+y4Zg0=
X-Forwarded-Encrypted: i=1; AL+hErFbkJKRyyWesff7D+PWa3f6sR9x272HCgNJFEmmStAZyKz6FER46T2xxQYe64r2rYPgN1TiUMl8kg/Y5ZwjsA==@vger.kernel.org
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998728eec.10.1794776813219;
        Sun, 15 Nov 2026 13:06:53 -0800 (PST)
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998706eec.10.1794776812568;
        Sun, 15 Nov 2026 13:06:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm28693790eec.9.2026.11.15.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:06:51 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Angus Ainslie <angus@akkea.ca>,
	Kalle Valo <kvalo@kernel.org>,
	kernel@puri.sm,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: use ISO3166 country code fallback on 43752
Date: Sun, 15 Nov 2026 22:06:46 +0100
Message-ID: <20261115210646.889090-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
References: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
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

On Sun, 18 Oct 2026 08:52:43 +0200, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm> wrote:
> Without this, the interface stays confined to the country set by
> ccode iovar default value, which is usually 0 (global).
>
> Tested by verifying that enabling the fallback makes channel 13 APs
> visible in scans while in Poland without having to manually change
> the ccode variable.
>
> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
>  1 file changed, 1 insertion(+)

The subject does not indicate that this should go in the wireless tree
so wireless-next is assumed. The Fixes: and stable Cc: suggest this should
go in wireless tree and it does not apply to wireless-next tree. Please
clarify and send a v2 with [PATCH wireless] in the subject.

Regards,
Arend
