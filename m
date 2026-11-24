Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551233;
	b=puQlIjeq4lpxjtektToqQ9Y3OPskvyIaNsbRYswXIICrPYZYiosd7SVOffB+QIgllw24
	 Nm4CD1TQMjkhTEtpSAsMBk7oW5bOimqR8HLK3A8zeHUBMbSXvQWho+RUZuH1xs4zdTOtY
	 X0ulamwzto6EZbb4RRGb1Kx9eXafhVG6fRM5UmhEBpxtKxtT46QBk9JTJYmz8FSBEL/f3
	 1KXqOXnfgbYpUqHfXZjRzecWAf+mjkYqrTb/NE6c/1IQa9a4afeKMwt4VdZl3fAAS9Z6T
	 b3WDGmkMl0Uzh4VVWDGcwRXBcairYx8UmQDSXkhFhdBNqupd3LF7APqjSGHICghkm+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551233;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
	b=1EMSbvSkzvJkk7TFC5hdMqNiqGP8YkcQQhMWHb6IRDrwmjhrCU/IuARsbNfnsA4Zp71P
	 e+uFfsXmK23QXtZkosCmUjDT6YqvQTfU794YhF3mMfCVAEb1PcJVJDnR91vZm9jTeIFwV
	 ijdRW/WvSJ5ZULl38dGtO4LS71sUwV24Z1i41qKfq8tjVbabqTu1bc/+j1rAC5figfB/E
	 EGZLeVQCM0Ty8cnEaXh29cRC5ItDlSY9onX6c9GKFrr//QARIHBMQjGb0YTVTjS13x7AY
	 dTP1usr/ZdGZN0Ah1757Djk2lx2ll2BLzPvkglk3F+nxjHBq0zaU4TJShMlYvF0SVaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=V4U0ayHB;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E6606A6B4
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847E6606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=V4U0ayHB
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-9214032a2fdso40421726d6.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551231; x=1796156031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=wWZLEvtV05zfJNDKJAT9Y7klC4oiiGIDnW7wDZmSmN30XVf0+d6bGZ+KvnqrqvHIQ0
         uj315+Zpal/FgQzXtfdG1mvXdICxGI6WdfW0I6IGxdQgeboh7+Pfysx9d3Y03yXMQXfO
         jTumhyGI9jiG8jn77/p1zQ5fsz3OEMHhh9cykbYYGgX+dDYzI4HwxrA08yxD4Z7n+C49
         zqBbWzxaG1VnqnVvnaapO7JH2ss5NowCTlHOlGcDipQhpBQCLUSLoIATzYJUIlMAkyRl
         I34DeIEA0Okx0PaMSMbIQ1tGJYIkhq8hXeyB9S6NqQEGFYeIsTIUtEUVw3sWvLx/MFBA
         tmzA==
X-Forwarded-Encrypted: i=1; AL+hErFReBj5qExZMc4WXjPWeUM6ABwjDNLHoW5iKf1CfKZGbw4tL5FmzpycjiRHTKQk/XzXWZP8hvmcjwavEs2Rdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+U335rOoN9wPrOzkSNHu41cgi298dmBZz5NmUjOAGrNjelEeew
	JUV8D4klUBmxxbHfollqJDk7l2wsf1JXso8l0++bbrUecsLz6XUO02Ic5/Mk1pDVYFeDG2aSZ49
	WegGXWnayogG21MkN59qaAoZmulixQAfS9jDxXyFVCbGyhlpxJSCta51VpFyLbiizAGL2WDfe6A
	BS1sPhZMwzt6NfH5eVApk+fzIghnGqhn9mNsLSlRA1SG7EW2ZVTWXtwO1Skc6hcu6SgrzdiIvPT
	B1RYAtR84ryH79QUEUwjXLNk+Ng
X-Gm-Gg: AZFdTZc/CGmk7l6AWONqcuFT1pzBC/lax1PAKPHbprVRe01hHurulHByLPIzxHLRWcr
	uNsROG5QifOFPUCPNbuGn8ohcqLB5EgjHAYm+HDxUZC9CZ83FGu3KIbsEqrI99D2Drcul4Ticcx
	qUviBOcKF8DD04Fu6F8Zo/F0QEOBUe8dPTaqK+FWr9JHscWj0ejwF4VR84ppRgQE/v/cNT9Nj0z
	wnFGvg8s3xE8eEwdhjweVmfwEYpYsIQzWnXxo0wM0y8nGJmgTKExtPSKjMJHTZGelOO5Uok8b8H
	68b+UU3/IPArg5FNqsIOD6SCWWNOgrjnZClI8tW/9cyloAAEkuz8AokVmvquCqsVA3eB16zuYvD
	m3KnnD4tYWpWeWMtuivosOHNc2juu3XzvAi1rin2Fe90FQRkW1l3COIdpc/AzRCHFSDYyTlQXQ7
	D3JYhAu+BsVzeCzfPKVcjcBbl5PGm0zyri1B9xgVU=
X-Received: by 2002:a05:620a:198f:b0:949:5cb8:6be5 with SMTP id af79cd13be357-949bab27551mr2852971685a.76.1795551231296;
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3f55d3sm105800285a.18.2026.11.24.12.13.50
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso768243137.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551230; x=1796156030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIxa6RhBv/qEcy+umQSc3w7OHrCV0S/F1qqnnQZxpQc=;
        b=V4U0ayHBYJdc62E0XX7iYYnLYjvvF4v4PFODp6nL11OP8KBRyQM0x+nVPwUH0Ygb32
         HyX+ggzf7x8MxHP0vNJyS0vfTrGDeblTLCQStMrONVfADWSDfgVO0zCQ/8/TgXme+pmy
         Dc9gBx9kD6lxn+MmNbjJJUx/as1gPJD7dzneo=
X-Forwarded-Encrypted: i=1; AL+hErF+imqxsr/FYgi7I/xrECgTodGW/z7VYF/w2ZRCMGp2aUQ0HYXdamIdximOna2btSLwf+s6QFO0mejDEJ3WbA==@vger.kernel.org
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935575137.37.1795551230462;
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7cb:288a:b68b with SMTP id ada2fe7eead31-7d74432e4a1mr7935544137.37.1795551229967;
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:49 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Tue, 24 Nov 2026 21:13:44 +0100
Message-ID: <20261124201344.3494326-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-3-maoyixie.tju@gmail.com>
References: <20261115185843.64633-3-maoyixie.tju@gmail.com>
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

On Mon, 16 Nov 2026 02:58:43 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_macdesc_indicate() stores the interface index of a
> MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
> uses it as an index.
>
> 	if_entry = &fws->desc.iface[entry->interface_id];
>
> A device that reports an index of BRCMF_MAX_IFS or more makes this read
> past iface[]. On USB this parser runs with the default module
> parameters. Reject such a signal as
> brcmf_fws_interface_state_indicate() does, and count it as a failed
> update.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged shows the
> out-of-bounds index under UBSAN before this patch, but not after it. No
> hardware was available for testing.
>
> Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
