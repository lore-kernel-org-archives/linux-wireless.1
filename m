Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826400;
	b=hE71Ifgj0mdz/Z76p5GUE33JrrQW2nRC+Jv5cYCB6T2/KoVyz4uC+QcGk1v27+BrrwOF
	 Zp5kFzhSXHNqtUHAHT7JbjFWPvTEY4MAvqRrxKZj2hxhhr+9LsF4mMr7SlKsxlFmKSjNZ
	 dFsl6s4/V2duArQJOcSlo5NgEgv17LW3vB8CfXiFanYOw8ngfhHogAHJssdPUvAJsq6vj
	 OI3Yp72SdkrKt+7VR/3iNZfqQ/m98NdSX2CEcZiCWrplVNPfX+X6xjGz7gNJAejfN7V22
	 P9J7JeHzmaVTPVduvhbI2a3AiW27TDg8bcyw6Jj/7uFjemYtaPr2eF6dxSEoALIqnow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
	b=KN8UNNJHkh8IwadTGHGOyXlaOfcZUXoTUu+cQM77TO1hzNsZMyeHzTxD2mkDsxD//PvS
	 1OpHo7v20mPfzIOCv3CLGNE27jJ+lgsRp3h8LrV86Ywv9E0Dwr+jhwv/EPpdEiQx5uRQY
	 2lO9yoiO3qgseGYsNVWw7qf0f93fYfhXOSATwVHOaAXCF1/XVyiqEbCX+FInqXnubYF0w
	 mxGizCZ0BxowRKRY8fmIAs+i7kSz24KTDZU7ApXZ5TFZ3xmaO91OG8PleKxq1VHCf2Tzt
	 CVU/Aed7ztlznHvWhwwrPXOvgAuSzsBn/UTO82JipZ21UyTCkiEl7jnj3Xmo9LatM6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="gVOy/ThH";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CB606A8A6
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 10:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705CB606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gVOy/ThH
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2623360a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826399; x=1795431199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=AngCT36yaWNrS21Az9GHXXRCYG2Zey4SdrEi40KDBg56m2IGQrGveIfLNVqxn4dlqy
         nJaVB9ulhJPNhmOlNo1D5Oac83+oi9lJOy7qvNnO4fkqt/r4JyHzgvvOZWpPA4pGVhNY
         xcoDJeM/yLk9bwTuVlxenCgAzIg/+pdwllWto9iyEjcad1H1ADUGfVizaer87k0PuYZ5
         q9ddlWiItUTQI4q/d5UfNEJNxeXfbOlWquTYpuYVGIn5a/QnQ7o4JuBb5n6+z8XXLopF
         Vtvsm62FBNIPPAHkVTDljBNZxK7nyMsPWQgvVzRSu7nvVmOI0bmsc5wyzBhF7K7b8fDL
         aUHg==
X-Forwarded-Encrypted: i=1; AL+hErF6D7nsPkic5VpgZZPCYNg/YuIlUzjV/oHJ6K5JJXsqn/cPMHDzMmFIVeECMv9Fqvt4u27t0lUViimKoQ1fvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ViHzOzsRU/ov7ahYRRlDhyZa5Z0fk1+XSQQaUswtvMct7e5vV
	k+j1rjNpuLruyn7cgLSYuZ2Xo1vDWd5cwTLpG5PdUc4x0bJZ75ZSFKmaQ5ipqXufjRQ0NVBphby
	Pv9aSkN+4eeIBzus1NsIndhO/Lda+Hi7UIU5ZJDXkA2MXuB4JigjuSCX/5h5nAuSf49dbvTixJY
	uXM1/hdClxFXtCvrK/ge+hVlMp1wl+6PK5V6sDUFfot8iqz/Eq0pyo4be82NxKoZkfW0KUEIr8H
	VAbtSwHTLl3W9se+FL7YIAJKg==
X-Gm-Gg: AZFdTZepG9cMbev67/BSlPDQ6eGYccgBpeB2BDUKxc8232LHuvehfpEZPbpmI9YfxKT
	hMF6G+MbrnX5eaek9t7kOUBqcj2HadCGNLPnuk2frbw/jCRoDDKWpWao/nLrSEtUpr8/gsQYAjj
	sX6rcjQ/yGiifydhLpKamic2iIvsfC9a2gmYbCBiVFGYYkBt3iLh+1FDFB5pp/pAP8rDfZI9BO+
	OC3k1Sk1lJVm+iRnG5VljaCDbaUbCELOBTdgV3mQqEzc9T20WEgVDeosQtKbr2sms+Vkr07E8hO
	8FemGdNBsbzy96LtO+C2jEMQ5svJ+8S5Mn4cswhvXHNLCv+adfKAHrxHLxCNNKIy6N9UALIXlab
	r9Mxby/+bv347eFIQoe69XRb0DoKZasXYIjQaK1VWyCokmilFcKXOFtp9+vG+sS7EXoDY3qqCeE
	C5KLRfLxB7vt/pnT3EMCHCZyU0HnGoXMY9jzC+PmA=
X-Received: by 2002:a17:90b:4b:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3b1b0d75e68mr10064902a91.57.1794826399500;
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm13659800a91.1.2026.11.16.02.53.19
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so182085485a.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794826398; x=1795431198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=gVOy/ThHKXUgs1OvPpLYhMH/sQgjvWOvzLAUqnIZKQn69+idgqqFb0nESnT7u8LyjC
         9MyPVIZjBhBRKAbr9Hqjb7OcJtCQhztZdUnayjXqb2fH7CQ8Dr+dqODaj6gP5NoX0opu
         xWSBP8Ywx5mA6kVppv2sCNbG4ApEfpMXpAXkw=
X-Forwarded-Encrypted: i=1; AL+hErGeXIlLls8uDpdXe5tWE+EieVrWLVUiLharEcnLhTH0KkurL+VTOtXHoZ3biBgWx1eGtXpD4nOjyX1CLzW8SQ==@vger.kernel.org
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588959485a.8.1794826398318;
        Mon, 16 Nov 2026 02:53:18 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588957785a.8.1794826397898;
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949825e08b4sm125151785a.37.2026.11.16.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Mon, 16 Nov 2026 11:53:13 +0100
Message-ID: <20261116105313.3479803-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175754.396469-1-kudzo51@gmail.com>
References: <20261112175754.396469-1-kudzo51@gmail.com>
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

On Thu, 12 Nov 2026 18:57:54 +0100, Kordian Chmielewski wrote:
> brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
> flowring to reach zero before it sends the delete. When the wait times
> out, it sets the counter to zero with packets still out. Their tx status
> still comes and takes the counter below zero, and since the counter
> lives in the commonring of the flowid and nothing resets it, the next
> flowring that gets the flowid starts from there. With the counter below
> zero, the next delete of that flowring waits until it times out as well.

[...]

> Reset the counter when a flowring is created. Give each flowid a
> generation that goes up when the flowid is released, and keep it in the
> tx pktid of every packet posted to the flowring. A tx status of an older
> generation still releases its packet, but no longer touches the counter.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
