Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986622;
	b=vaQ5jshtmjMabPK2Q11W59JAzGJPynScV7md+MouR6ToFvM6HATTqCXVB2Wb3HlyHgm7
	 5uly1PQAPdacPl23JzE2KFUUXSYY9QZWSQAb3iloeJZeBKlxRp6k8Wcou6UVOQs8uuC/B
	 Yhc5XQg8InSqxpkobg+o0CWgV4uVqhOBqGdN2erEDNOrn8xv8NKJXOQ1yPim8RiOp78iB
	 7n/WEC/xbXbINIYlLWuJ0/JszF62sqwjwj4CGPJP+5Wcnmt3EVfPUHWi71srzEX3hupM+
	 PCNJbWR+DsNIfkZDJPGE6kVJuSuTD62an4d7Cfw411306kOrL4yHOYmDsC5C8hC3MBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986622;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
	b=J6WokVKgbjSFBXU+qkcKfbbOynJZZQaOIKzLVX4+BGAMXDViUIHbPIT/xlnYzlddZ7Vu
	 UvzNO0Kmz5+CaKDNE31xXnYLM4m+2+FAovrcLIV0RLAsTemj8JLDvMClkAwk1teKxVfIv
	 Jfg22X4lEsVXd4zmVJJxCYVg9YBGaRide9In3jp6bxLXkcYJtDK68gH9HSkVvKmzEiQq4
	 31w7ROD3DrYGmwnWKkMnwWBjjoo6wRtPIsu4Sm51hIAY4Posan91IJQGvFc4B1kjRvQ1Z
	 xPYQYNRmdR1GEVokTpEH+Gc0iR3r6TrQ3JEE/BPDvhr02xvTo/k0oVQadHOHj0iHnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UjLMT01q;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE903606A32D
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE903606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UjLMT01q
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso768111a91.1
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 09:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986621; x=1794591421;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=jkgTIDWfgvhxVC5xwdqx618P20+l2M87gmN47LDFw8uD5ilWkLm/b9KUq6enzjuMrA
         E6wdkKw12ZlRcSrG0LJ61m8CaB0cVD8wvlPwbITRDyyuvshQ8aCCgL+PEfqLf0Qw/kUu
         yEvQpA45/F6/WcQYlqSFiMitPgc2kjN29CgQuXoiZ2l5wu8DOPw2wi22aqbQ3VRwqZj2
         ICDAps29WK0j7wUCzX5rTOBpWhfELMP69tRxXz+ctwpetcbov3BDQBIjaBCSdV8HnhSp
         9Mr7GkV/tAPEFb8saca2UYqUZC62s6cB4ih8xTUi7VLcsGhe3vVY+AxzyhU2kDoWC8Os
         q3ww==
X-Forwarded-Encrypted: i=1; AL+hErGCjLzrl7gN1P/apkMz44aNf6R62xPhzaUKUyyJjFgu1NaYLw0rZ9pNyr8T6E/18CrRh0adVmwFqj8JO+I/7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yP8ostvyWM9R1rnWp7OYXt8csv0RQfN1g/OCGIKdtX+LBdYRl
	sRHhwkJFBlEVhEDoMFIcClbxs6XMpJH68oKahqkKFMhqum5FV88kXGNipyLK3/veSvlSy6M1Wy0
	XHhAResgzWMdI2dN9MnHbkhukurjo3lmzoUEBXtJOC8VazFHkeZaGZAhTCmKys9D1Mq8IWa6faP
	+0tCnsXvg8ecxEHShzoETIky9HICrqfq2cBYVa7tU6CEbTkbCi+hY7qGKCJC5DAL2H9iP4oW4JI
	ZcE+w3hFktQZEJFN1dofNPM2kdk
X-Gm-Gg: AYBFou2yDpX0XwM6t+iMxZfx2Ps0KOs3OwIpZUx1DsoNxn19i6dcZ5iC1Fvb7XUs7Np
	EeiOJae3WfXNoOA0kk7LtGwbL7fPjct6uelhU8Fmfx00DEQQs/0hYszsH4WDlEcZygjKZvrB2lT
	5EpP9GpwDPrxifc6BMiVNyqgEtiTIRxpV2pU+nZOspCjuUSVLtelkRVMApo9HJy6O9uGUfE5/gr
	2QEAOgbU+JEno9IzWd8CdzRRUXZp7DKx9AbF/vKUvPHyXf6QXudsAzNPyfhLe2oEi1Bww1+Yj03
	PnQxM7G9TzA8oKDPXJnP6As4IIIKd659qYhfCu3orJ4bknzWm0niP525VGcjqAylrv5Erv53a/B
	zeKJd2kF0zWs9opyiSZQxmNXeKkLOWIU9cQZR1o/ghAG5/GtONRL9m0D+uaT8d094KdB09vyhSg
	8clNosK0qRbeUbFHjzyH4wvAUthW9AmMWXdouEB/Q=
X-Received: by 2002:a17:90b:4487:b0:3b0:d0c5:c110 with SMTP id 98e67ed59e1d1-3b0db70c7b8mr3167129a91.56.1793986621180;
        Fri, 06 Nov 2026 09:37:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0fc3c7717sm89444a91.1.2026.11.06.09.36.59
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:37:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so82677266b.0
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793986618; x=1794591418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYev/NC+kvw4uKd6ceqPEumrLblYo4RG50oIiemWCCg=;
        b=UjLMT01qgb5jh+U/1zOPAzsFWt+OBveBifEUvMto4uDWtCuU7rDkfZCxzXXpGRjkN4
         /UIO/JnVYQ86vF7NM6XFAwqonebR9Ki6QvvwVR23qxFPu5c5l4GhyZRoHjsxDcjSi0BK
         ORJeC2oBZ4UJHbC2vmY8PsLw0+pCdRgP4nj50=
X-Forwarded-Encrypted: i=1; AL+hErFaQkzkoBpaiasFNfur4NX/vao11q0JlObvaLjJPvrUDZ17nQono7/k+weBLPdK6KYqRq0I2v+6+PYjU1I9dQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516056a12.15.1793986617827;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
X-Received: by 2002:a05:6402:2b92:b0:6b5:90d9:70a with SMTP id 4fb4d7f45d1cf-6b5977c1176mr2516038a12.15.1793986617494;
        Fri, 06 Nov 2026 09:36:57 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ad2d0bsm919103a12.10.2026.11.06.09.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:36:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Fri, 06 Nov 2026 18:36:52 +0100
Message-ID: <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106153612.2aadef2a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 6 november 2026 15:36:19 schreef André Eikmeyer <dev@deq.rocks>:

> Hi Michael,
>
> I tested 01, 04 and 05 on a T2 Macbook Air 9,1 (BCM4377/4). IIRC should be
> the same chip as on T2 Macbook 15,4.
>
> Arend, with the patch we get D3 ACK on s2idle and s3. So this basically
> renders the D3 ACK WoWL workaround patch obsolete, you recently acked.
> So it will suspend now without refusing d3cold transition, but BT is still
> dead on resume, which is a separate issue. Just mentioning...

Sorry, you lost me there. What is the relation between the patch in this 
subject and D3 ack.

Regards,
Arend


