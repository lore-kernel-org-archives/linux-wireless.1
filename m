Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036196;
	b=LYjCuB/6nfBxGCT+MuSpkQKDxpX2Uu6JETIXpsFONI5CKoZ+oVj6e7QtSJ5Hlm1GkgCP
	 BgL6C1H5C648NNhaX611vc4UNpdNz+GbtFF+38A4X2W+vDBN2mA8xb7HErt4F7tVoCASC
	 O5k6RKJkMjQ3DuH0/VA6nqAPLTpGpItOXhrZpjaRe5fo2J2zvFbfBJubLrDqCk3zoLYtE
	 bjf31hn4Jvk2GJb6h4KjDIkHtEsm70kDgJHXD2tbtkGCbPbQrbWZQ4eYpvf08EgyA2EC7
	 RLPzMBzyN0R6hAq6FepPKoqiP0o97dCFUKB5KmUkGW3Z/XhLatv0mmWCM2+voYdZy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036196;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
	b=Jdh6dIQ/L7dTWtfVutg2djQ9C3s9K/Xjq2I5precEsZGBCMnEoXnKQkzeE8OkUpitT+y
	 sO0w9xyuFPyXsShiAEY9GDUwF0ikmq82y0DpHDtCl+kxjG/IESYP8SjzETbxj7E89PyNJ
	 GBu/UzNrPSIYwEUknACQemUFVa4cJcovVXcvQ0/8WJBIfADgfAz8il+gHqniKFflJRX67
	 Tkcp4ZwWBD7igEPYfwsztb4XceiBJmG1at7g48yR4/z4Bs67jqawl7qQIZkcMLrYJOut1
	 CZOuYEECIQQVZfHZwO79C4ZKxJDJ4BEqWSaoqyAZN0lZ33YLK5OWpX2YAmNB0zS2WVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UYbM0xb4;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50F606A32E
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 07:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F50F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UYbM0xb4
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ed1414df17so5204265ad.2
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 23:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794036196; x=1794640996;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=LhhAaA9o8RV59LDoqNVlLh+K/GtpARU+VFI7O893Z4l/0VTZSPmtjv+rZrB2z/gGU2
         /d28Yh2yv/NjTOUrfFkInfsVho9j+0CmeRSOlRFnUewcEN13vOegzaZmGFhDkNeykg08
         6BKimHBr6E2mDyTRDR0Z185NcUz5r/VYenJ2dObd2b1sy1XqstYQGgJ7vvO9D/K107KU
         csC9rJS7cnsevnZPbU6mR5d3rVxJ5zoSMKQg7sYxuFQKR2ZDeL7JQ+xJgJN/b8Ob8/Nf
         TNp3Wkt3Q2TIacoiHbY2UO49NHp7+9XKrUAxepHOOoykiSF7WmqC3OVjT7TQDveK+E8W
         prJA==
X-Forwarded-Encrypted: i=1; AL+hErF/odMFGizZH1WAgdC+mAeGU1zLvaPWO52BdUNjHj2Mt8xV24SeFQI1BECSF++ySqn7puAaQJkZjb9oVMwV+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bCs1LYQ1BRLCIMR+31iWvinNtBkYtN/xi8ADHLl4dClq2osuP
	3Owpx6fw8QZxb1ixjLB3KUrMHP1DRVcASLwYE3GcUFSKDJ93wK0XVoQokWKV+SeKQeVlZy7hq6L
	HrLti6KpHYAulEE3xtRFfazv6k4ZCIhI9087KTbxgeaJE8MR8cj49EWaL3xbm3PRfk5HBpXI39C
	ikGqiBBamk6hYu3Z4OaXMeE5RMAqtyS0FP4QHHo9yxFXhDdHxkLyZFKN+/wqUZLwtcp68Cnj5mq
	ysMuLnYn7kUoWMQz1ggOPDJH12H
X-Gm-Gg: AYBFou0beBDK8hD5WqvqyWxosI1xCB32hJ2uElQBZrXNWlmjEKag1KZYkHgdHLdo1n+
	3i3yWCeYQzF8wP7U7mq7Z9YecjE9hXXWJEgjioI7uJlwblP0ZZVVGZ1RpebKrxw4cMxPcHMUa0U
	tw8UZd154JqJqLz0D8NhqV0R+OlLyHIcbMg0K9umTatESSUfakV57MsU3Hh/SZvq/baDu40FdCl
	YNkR+Hvw0owsL7VrX/DrLmq4FFr62CeziprhAioKES8HodYO5JxhZyovrWk+6/L8zLi38mbmvhj
	TmmKIf7qAEwtFO/gJmzJV7lJyo7TEWN9Tjx19XU98QvdK0d/RHidslUAmixzseAioYaZ4+dA/8C
	sp72VObzixemljZykvyz/B/o+u0HY1ieowPnQuQJMF85aMbvCc251IXPeSIyQZVWYwyT7Mq9Opn
	Zwlas6MOHo23ZC2yEqCcYsZMrUsflrPqDo/uassGo=
X-Received: by 2002:a17:90b:584e:b0:3ad:6ec8:35cf with SMTP id 98e67ed59e1d1-3b0db6eb6e4mr4845082a91.51.1794036195601;
        Fri, 06 Nov 2026 23:23:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdb7062bde2sm36199a12.7.2026.11.06.23.23.14
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c40285df2a0so89982666b.2
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794036193; x=1794640993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0FgIFQtxvacrqev0zCbMfAujPCpt+ydjgI/Lt3fFqI=;
        b=UYbM0xb48vqxco1EjJLbT4mx4zKbRO5rOxHqpxm/lheuD1qTPFVMjg1ukd2m5XgDN1
         K5LuSAqMyTot1XPVhxZq6tz0Z0HF+/IK28KZhTl9/idIP8i3CBk5TI9lSNWLhPUj9Y1e
         BwgMOHE8Enku+0Ac05xa23rCVEOpZvGLwiNP4=
X-Forwarded-Encrypted: i=1; AL+hErG0nx8Cb4fd73sNOCwVxOiexwoR9rMns8WeozAVV7wSHDaxFm5RmqDeN1JIvhpsO6rDIT7FpskAT8AFQMtg6A==@vger.kernel.org
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369014366b.43.1794036192745;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
X-Received: by 2002:a17:906:d54c:b0:c29:5d41:dfe8 with SMTP id a640c23a62f3a-c4d34ca43afmr369012066b.43.1794036192265;
        Fri, 06 Nov 2026 23:23:12 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569fa54sm134100066b.58.2026.11.06.23.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 23:23:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: =?UTF-8?B?QW5kcsOpIEVpa21leWVy?= <dev@deq.rocks>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <dberlin@dberlin.org>, <frankyl@broadcom.com>, <gustavoars@kernel.org>, <j@jannau.net>, <kees@kernel.org>, <kvalo@kernel.org>, <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <marcan@marcan.st>, <meuleman@broadcom.com>, <michael.reeves077@gmail.com>, <pieterpg@broadcom.com>, <vanhoefm@gmail.com>
Date: Sat, 07 Nov 2026 08:23:10 +0100
Message-ID: <1a1b4e3cb30.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261106191826.4ddb997a@kait2en-mbp15-1>
References: <20261106153612.2aadef2a@kait2en-mbp15-1>
 <1a1b1ef4b20.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <20261106191826.4ddb997a@kait2en-mbp15-1>
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

Op 6 november 2026 19:18:32 schreef André Eikmeyer <dev@deq.rocks>:

> On Fri, 06 Nov 2026 18:36:52 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>
>> Sorry, you lost me there. What is the relation between the patch in
>> this subject and D3 ack.
>
> Hi Arend,
>
> D3_INFORM and D3_ACK are mailbox messages, and 05 changes how they are
> exchanged. Without 05 brcmfmac writes D3_INFORM to the TCM mailbox
> and our cursed Apple 4377 firmware on the 9,1 doesn't read it.
>
> That is why I mentioned the D3 ACK timeout handling patch. I
> submitted that because I was sure the firmware wouldn't send it.
> But actually the transport was broken.
>
> https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/
>
> which was superseded by Sebastian's patch here:
>
> https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/
>
> So probably for addressing Sebastian's issue this needs to stay
> anyways. My memory served me wrong. I just read that his device is not
> an Apple product, but his patch incidentally worked around the same
> problem. Sorry if i was causing unneccessary noise.

No problem. Thanks for helping me unclutter my head.

Regards,
Arend
>


