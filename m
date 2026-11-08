Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152509;
	b=49TI7l4xkMtkhTA6sSh7FMzr8bDEmn2+EODtt81SgpfNeMGwYo+3qYRkyXsBDpufYViM
	 tL/KWP273O47r26vlnP7hyRaMDXH7JmkJ4Fj5G+60KgHpY8nYqGAwNBlhZzSWGPiDs3Pz
	 SNESyeIsWPHGhTg1qq2YlLSiK6R0Hv0UgyMy24oymlKDvAlr0A+5Mo9Zs40r5BXbW1PtY
	 lstJq6MqC3bgeP1+/kClYGbyvOmfVrqKzIGTAhm4j6pen871ymJQFmEMHHA5yLSMY7Mxt
	 zj+IClj056qF/PeC5Zhdz3zVj/PTMWE1d5rlaWIuDRIqF1AIZYWVxFy6Ba84TyaxJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
	b=gWDbJcF8DjEPT0dMXd1sJweQveQV0Byt4dhU3nph7G6/mjMhoBc8cnQUW09/7f0uEC19
	 /tLBCDvawPWvB4ekZZ+Wb7FGJU0htvctevdqZD8QQ8c4JX+N0/+oSs5wU3bRvo7zQjHud
	 H+36jNKmejwhrbP9MdA0hNtsCs0Blts1asUrjQbOn0qPA1+lhpers6g+aMAoOKe9fUc86
	 ljrP5P5XuCrm/GVYgeb+OSbnEFyfTLjtVzkJpfxgvgcW6p47+7SvqZq6yEaEI5uabpa86
	 /CHvxlFibqd2BiNdJWHU9ecsiES/u/DwDzbitT+x/Zk2a/zxKybbvu5Dy7Os2K8SRFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xy1DDHgX;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6F606A321
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 15:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F6F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xy1DDHgX
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso58462a91.2
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 07:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152508; x=1794757308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=cU/nakJRgMykhiDadByktOjAu3ttqZg2jWuHSIJ6zTVCiMauPVi2svIK4sFYy6uuPL
         kFG+3qCj5ZHTU+Km+IkDOJz/GhZez2ToJ8m5lC9uxjbltM+97CW/AipRVmleWiPUPwVz
         5XyxGSMbAnIZ9YmkX7kmJ3T4y9e/cFO4BTd5P47hJBEE3zDbJVsdFXCO4ZTqLh+rZ9Fh
         8vwcM4EjvKKE6sWJsnBF7k1WpyDorTUP3QxBkE9ctn94BQSxBf3b9nvenluu1DXIGUDT
         qp6qGWrPEW+BL68oE79iNKh0OT4274pheq5cByjYJiABnlQFV2eOeqEYbIkUSB6zCukD
         iemw==
X-Gm-Message-State: APuU4Z/dUh2UZDpl9TbKI5qPsHCb1go/YG4SXiPrqIV45OJegW3l2W8T
	oNe2FrJpYjDJUkXG4fcRI8nCoINqM4m38BUe6O0jXVG3VJQw9V/Fa2mopIvYAMlMKJkKmSLD/YQ
	gProLvsGF6RYMljEfgsfgDwGcNzb4QrliBffKu97ReCBjOdwFm30bPVFycRJHyACbAAaQ7J+GIt
	qXQbWAHRdzjXu62iIdKdqSsVl2f9LwlEpjhleGZWIWQf0sDVF7HfduPVfR3AVXaiNLszhZI4deL
	n/ejUbmEFJ6doKS6yZgwNKvfS+0
X-Gm-Gg: AYBFou1eiI3RpfIQYHihv+LjOliab5UTKL51rc1L8U1VyXDxEQQGvcxG8iIhoPqUDuq
	kqCk1Vk6TkjRHJMxhI4Ewjiv3C6T1XX9TXReEky+pA7GvruzqfLBwx1uTa6bUuqLjKjMno3NEDr
	oYDuzgeKl+ouRatmzi93Mwo1zPyN2Kxkr++fbOyxRZC8kIdc0Aee69y5C88G/6CsvFCKZsdNSUh
	yf7iY64VrUL+n/SoAedfv+FmKVhLcDzCFytSzMMfdiL8sWDEOPCFTnfqmOn0QmszJlQuzT55GLm
	YlZ/T0leGJe+COqwrTY7G2uok7yApOu9RTehu2jxJfo75AhXEY//bMPybrNh+7s7LF33tHBj8l/
	SwzbrFZAKEJACAosB5K05cD0ql2mQGLksA5oMtrzALgKQDurjNhVHR0Z+nypctLaLzSJ9NL2C0D
	21+E5rs+HOyUlGa+8GHGK9xzilpb3gtcYGrxQqhgs=
X-Received: by 2002:a17:90b:4a82:b0:3ad:50ef:f5ff with SMTP id 98e67ed59e1d1-3b12d3fc2a1mr1477646a91.37.1794152508253;
        Sun, 08 Nov 2026 07:41:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b103477cb3sm1787708a91.4.2026.11.08.07.41.47
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so217202c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794152506; x=1794757306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=Xy1DDHgXIqn+VULlq1ya1aelptGMf/FW+NmvpEh/fSKmsozeE1GEnEZ3yP+744OQeN
         JbystK9DAifkGe8hJBLw+6OiGrjagjrUduTIlaqmm23llBbHqaHz7mYuTVdKm8/NipEp
         ZZAUuhxjNdx1vU246trC2leXzRglqcefGJ30s=
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453821c88.39.1794152505919;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453786c88.39.1794152505155;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm7469375c88.6.2026.11.08.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:44 -0800 (PST)
Message-ID: <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Date: Sun, 8 Nov 2026 16:41:37 +0100
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
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Andre Eikmeyer <dev@deq.rocks>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20261104151547.70333-1-dev@deq.rocks>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261104151547.70333-1-dev@deq.rocks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/11/2026 16:15, Andre Eikmeyer wrote:
> This series adds AWDL support to brcmfmac, so Linux on the Apple T2 Macs
> can send and receive files over AirDrop with Macs, iPhones and iPads.
> 
> AirDrop runs over Apple Wireless Direct Link (AWDL). On these Macs the
> Apple firmware runs AWDL itself. The host creates an AWDL interface and
> sets its parameters. From then on the firmware keeps the AWDL schedule,
> sends the AWDL frames it gets from the host and carries data frames to
> and from the peers. Election, peer discovery and AirDrop run in user
> space.
> 
> The driver enables AWDL on any firmware that announces "awdl" in its
> capabilities and supports interface_create version 3. The linux-firmware
> image for the BCM4350 (7.35.180.133) on a pre-T2 MacBookPro14,1
> announces "awdl" and answers interface_create with BCME_UNSUPPORTED, so
> it stays without the feature. Other Apple chips, such as the BCM4355,
> are untested.
> 
> The KaiT2en community, about 280 members, runs this series with its
> kernels. Users reported it working with the BCM4364 and BCM4377 on the
> MacBookPro15,1, 15,2, 15,3, 15,4, 16,1, 16,4, MacBookAir9,1 and
> iMac20,1, and nobody reported a regression. AirDrop transfers on the
> MacBookPro16,1 and 16,4 are slower than on the other models, the cause
> is still open.
> 
>    1    match firmware capabilities as whole words
>    2    move the interface_create definitions to fwil_types.h
>    3    detect AWDL support of the firmware
>    4    create and remove the AWDL interface
>    5    add the AWDL data path
>    6    add vendor commands for AWDL
>    7    pass AWDL frames and role changes to user space
> 
> Patch 1 is a fix on its own and carries a Fixes tag. It is here because
> patch 3 adds an entry next to the lines it changes.
> 
> The AWDL interface is a network device "awdl%d" outside cfg80211. User
> space talks to the driver through typed vendor commands and events of
> the Broadcom OUI: start, stop, frames, sync, peer add and remove, and
> events for received frames and role changes. Creating the interface
> needs RTNL and vendor commands run with the wiphy lock only, so
> AWDL_START and AWDL_STOP run in a work item and report their result as
> vendor events. The driver sets the firmware parameters itself.
> 
> The firmware interface was worked out by tracing. A dtrace script
> recorded the iovar calls macOS 15.4.1 made to the firmware on a
> MacBookAir9,1 (BCM4377) while AirDrop was opened and closed in Finder.
> The other way round, the MacBookAir9,1 was traced as AWDL peer while a
> MacBookPro15,1 (BCM4364) brought AWDL up under Linux, together with the
> AWDL frames macOS received and the console and events of the BCM4364
> firmware. The BCM4364 handling in patch 6 comes from these runs. The
> iovars, their order, their values and the AWDL frames come from these
> traces and from the frames the firmware passes up.
> 
> The user space side is t2-drop, part of KaiT2en-Fedora and published
> under the GPL:
> 
>    https://github.com/kaiT2en/KaiT2en-Fedora/tree/main/apps/t2-drop
> 
> With it, AirDrop works in both directions.
> 
> Comments on the vendor command interface are welcome in particular.
> nl80211 has no AWDL interface type, and the AWDL schedule and frame
> exchange run in the firmware here.

I really have no idea how to deal with this series. AWDL is not part of 
the IEEE 802.11 so I can imagine the kernel wireless subsystem does not 
care to support this. From driver perspective I am not keen on 
supporting this upstream either. My limited understanding of AWDL was 
that it was Apple's variant of TDLS (802.11z).

So what does AWDL provide to user-space and could the same be 
accomplished by TDLS? From the explanation above it seems AWDL provides 
more knobs to user-space, but not sure whether the awdl%d interface is 
merely a control interface or actually passing data through it (patch 5 
implies it does). If my memory does not fail me then adding vendor 
commands is generally pushed back.

Regards,
Arend
