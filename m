Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708996;
	b=kMYy92KY3vDqm2syr1JfgcDOFpwt2ITfqdhGIHBPSlac9Q7VTZHoTf5DNIpaEPRggqYS
	 Ab/r7JXzeC2Yx4rQhc2IIZMFkiiBYhOrzqxnhHbjSYdzx6MtB0N0oMkcn3Hh/uC/DZJkE
	 MWqjiEIhsC7AkiZqDePdVdURqfiXMR4sO8veI8CK94jzyGNUctwPZo3xY4VLaCmm2urk6
	 6VGGJQW57owc4fF2RjMBtKeutLG0kR+2o53x/mNzpWwWiPbjYX5z5gqNmphnhlkmW63Fi
	 7wVJqLSofS+QY4BPiKJWta3S1gwvJC0Ax1ObpvehihnRj0sSHMctYKA5sJKXZx4fJOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708996;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MnGCyZCgy0uZ1q7rQsrc5ccZDwKH7+29K/9rrpsqcUw=;
	b=heLEnOXo6qH9VKNNXnMF4eNBlMS0UQumMFFOo+RA679npYpTyIYuO/YEUzn2Rjynosn8
	 mtRTSGKcVNi7Noz7BbcZCNunJ9MkZiad7fv7BObuadbrfx+Y8j98gXcgZo5kXbK1EyWKN
	 SRnmF/vCALMyYTwhAwAnhcmEF+XDzWIrjdOpyjxda4MepQtM5ttSaiAAOBNELC+XGqVmH
	 ei1MF6hsK4oxn788Y6UTyCGVTebMCoQ1EX58RrSlwh05qQBWwsa5Vd3VTVsbb6NSluVRL
	 XS6ZX2wgPe3YxQRps5SNDp4IfI0LCltCmDR/X0s/cVbSwj6QJwn27mNle7HqyhLh4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YagE8v8m;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EB606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=YagE8v8m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MnGCyZCgy0uZ1q7rQsrc5ccZDwKH7+29K/9rrpsqcUw=; b=YagE8v8mBAX/1uUkdZqBS/5UPD
	zia9phex4DzoCOlsJRUUpz4axY65O6Fp1yJ5B27YtIksFqH2Est1W0nASTF7x2fOkROQQYbRT0ZTg
	GfwRVxptBzXTEQc41At7fmMd8bypaDAIVw6s6KLn5Yr5jfGQshEbnVbldtb87Q3XaOmA=;
Received: from p200300cadf035800789f81558e58e91a.dip0.t-ipconnect.de ([2003:ca:df03:5800:789f:8155:8e58:e91a] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWbw6-008giG-0k;
	Thu, 26 Nov 2026 17:03:02 +0100
Message-ID: <6c37a7e4-a2f1-46e4-88f1-0439be6eb928@nbd.name>
Date: Thu, 26 Nov 2026 17:03:01 +0100
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
Subject: Re: [PATCH v5 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per Tx/Rx
 stats
To: Anthony Liu <anthony.liu@mediatek.com>
Cc: Emery.Hsin@mediatek.com, Jb.Tsai@mediatek.com, Leon.Yen@mediatek.com,
 Litien.Chang@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
 Sean.Wang@mediatek.com, kun.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 lorenzo@kernel.org
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
 <20261126095455.3280998-1-anthony.liu@mediatek.com>
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
In-Reply-To: <20261126095455.3280998-1-anthony.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 26.11.26 10:54, Anthony Liu wrote:
> This series adds:
> 1. Read the HW charactistics flag from ACPI BIOS.
> 2. If the HW needs, collect and update Tx/Rx statistics to FW.
> 3. FW can then decide how to adjust PCIe link to improve T-put.
Please don't add tags like Reviewed-by for me when I haven't written 
that myself.

Regarding the series - why is dev->perf.enabled disabled by default and 
only enabled via debugfs?

Thanks,

- Felix
