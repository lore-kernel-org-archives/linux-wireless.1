Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794285;
	b=M2jLjxbG8i26hClMzWE1dfpPCvmVns418/lO9BgvUcEbhInNBDs52RlQA9dMtjA1iz0P
	 MVOzV2LbxPzyvxrPZIeLhCFrDlZSfVF30Z+JpoX6/K/UEnorEv2lm7yCM7RIWW1J9ohIX
	 nII6Q3k5taeEC5gOhKDww49E1PgHVz2A46TQ4LGHnvnJ+5jGg1pVYHBVopc0S8j9R3+u7
	 gdAV5pPbOn+6BatbivlzhjCIyA9nf406wJqq8Zcps6uQkZuSob5vCTg3iwMSiTHipJX+c
	 bpom/4hJq6eR+Ypfb+e6xf/glrYJqPE2zIo82PckNpaFF72/oyS8h5RCcOuRPLxdHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794285;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GLhy4K3WXdEuc7Y1GQAeKRwxsYwUKNxpVXU2auX8AUY=;
	b=hDMkm2XFPQ+oGMHIGF7DKdmPLIkuqWOHcgdsteq4zZdxj0DDciBmxI36DgNdIOr+SaC9
	 5jaR0wPqDd3sNFG769msImSHdnajKOfDXYROqByXozwUsfED0SmyHP21rCz2suJjhz7yu
	 Sgmv3iRKH92QUJqXd9L5Vx6k+fw6qaEptGTWOtzsPN4DhycOXz1CJwCPiVrQZCi3nIS/2
	 Q8W5e1L6OGY3iyhufTHn+z+nGC2OPA+k6oTPJtAklzQJU0A3hVcSPW8c+jT2kZmxTmYG6
	 bY6P3tWCL+Pxwg6OUhTZ6iID8uMUU5R4XEue0flBsjHFX6j5QdmW51dvDqCEXnO72Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=syPbQvYg;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA48606A334
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 15:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=syPbQvYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GLhy4K3WXdEuc7Y1GQAeKRwxsYwUKNxpVXU2auX8AUY=; b=syPbQvYggm8pBQ99HrVnmrsN4f
	7qNAXgVORKSkHNfW2cmFW921cnUAM7P1Ze7FjZtGYj2AEQcOObLsnmuV8DkefuLsVgpo99gtdAd5Y
	vOSTxIiBWWcRG7d2AiHDkREqOSVTb084sRLoPxdHhQNCJNIlTEghSN8P0Wrx9RkYHmLg=;
Received: from p5b0154ac.dip0.t-ipconnect.de ([91.1.84.172] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWy7s-0098rv-2g;
	Fri, 27 Nov 2026 16:44:40 +0100
Message-ID: <486b142c-b189-488b-b7f5-f0a06795dfee@nbd.name>
Date: Fri, 27 Nov 2026 16:44:40 +0100
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
Subject: Re: [PATCH 1/2] wifi: mt76: mt792x: add ICS logging framework to the
 shared library
To: JB Tsai <jb.tsai@mediatek.com>, lorenzo@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean.Wang@mediatek.com, Shengwei.Lu@mediatek.com
References: <20261111054811.845536-1-jb.tsai@mediatek.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20261111054811.845536-1-jb.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.11.26 06:48, JB Tsai wrote:
> From: Shengwei Lu <shengwei.lu@mediatek.com>
> 
> Introduce the ICS logging framework in the shared mt792x library so
> the mt792x driver family can reuse a single
> implementation instead of carrying per-chip duplicates.
> 
> The shared pieces are:
> 
> - mt792x_ics.c: the ICS MCU enable command, selecting UNI
>    (MT7925/MT7928) command path by chip; the RX
>    log header/aggregation; the ics_worker that drains the queue to a
>    file; and the enable/disable bookkeeping.
> - mt792x.h: per-device ics_worker, ics_q, fwlog_seq, ics and path_str
>    fields, the rx_ics ring on mt792x_dma_layout and the
>    rx.wm4_complete_mask on mt792x_irq_map, plus the exported ICS helpers.
> - mt792x_debugfs.c: mt792x_ics_get/set, exported so each driver only
>    needs to define its own fops_ics.
> - mt792x_dma.c: ICS RX ring allocation, the ICS napi schedule in the
>    irq tasklet and rx-poll-complete mask, and the worker kick from
>    mt792x_poll_rx.
> - mt76_connac.h, mt76_connac_mcu.h, mt76.h: PKT_TYPE_ICS,
>    MCU_UNI_CMD_ICS and MT_RXQ_ICS.
> 
> The ICS log file is created under /tmp with a timestamped name and
> appended to by the worker; enabling purges stale skbs so a new session
> never inherits old data.
Do not create files from the driver code, especially not with hardcoded 
path. Please take a look at the relayfs implementation that I made for 
mt7915 years ago (fwlog_data).

Thanks,

- Felix
