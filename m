Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944806;
	b=hw/cr2ap0uF5X0JyTYjS21iJcLlKWcHPf9luGhN7n0DsQN90nzDFqolG5XIara/7IicJ
	 K9H7LqMrrjQTeF7HrJq9mE1AGRq622zNP4aeHYSJkwYizOffzp+eVoUOjelAzYYsIBtwi
	 nOXusW6N8s5q2Be+OKut7vwxk0JLy7gKN4iD+vuDqS+PVUjy84ePJAgkxN4Rre8EYQAA7
	 dsPCadfbuCbByECQ30AboyeCxutAPbNSW4mJDsV4SRC+YrqZlo0jljzpcLIIWnaCiQGpG
	 96YNKO0Fyp+1czJ+G/oo+VoEocuWgo7UNmm685/52rPvblpG2E5Att6OdVXYAg7A8Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944806;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
	b=aZ+ngVPvpgSYPHp72vSwxqAaWV4U9HxXk5Ev3vJsJYz7ayUx14HkLyFTAgoMBuDOUT61
	 qPOWoZgb6QIAQksIoVSVg9nyUYpOxRxoTLQgHoAWdnofXYsiTGshJJPDKRyys0l3WsxUi
	 4nBK6lXqJRdulqhpsLRzwVPnBGauzPbDNX/HeHudlbg9KX5nnYb5hVRRPYtGIUWTzEZQr
	 4ovSGF7Wizie0VJR1WIjg7yClxCWIFemLRVkyHrzXUh74EiTlyru95SiUKJAO7xKo2lN2
	 NMzfIc0tg0Cx7yic/jwYPNmdIhhHQhVPUV1RK1AEr7j41+/eGtRmQ5fKDQDl01M8CgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CrJioLXS;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB297606A880
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 19:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB297606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CrJioLXS
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3b3c072eeso42328a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944805; x=1795549605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=q16pzSggxsI1DfYZ1m0o4luXzkKBdbTPaIBw1X9Sy7QZmxGCbRNuJYEbCZ7j4HQ3KW
         uaX20gD2kMZ7x6Nzm247t6Egn1po7f7RrKiAa3jqVJ4ubAXAp6jUWYuBGQ+CwhTAMvOm
         FVczK0DnHiWc8egit52dYLi4wrVEgbgipLvGDskD3Yd5+vuQDjoyJBlfvY24+coK7k8q
         UEbnjDa0w6RLh5Sm+cxPTn4or7qI0I7YAnfoPbojMJ4mgJtOaq/r7Jxd6GCiD5KpiFIZ
         kPJ1EZ4b6eIsh2lzZQQcm/6R7y65MV3O0u44Qm00HezZbMSqZCQ1Ym0uzknTgjY6200S
         +AUw==
X-Forwarded-Encrypted: i=1; AL+hErF/nOMKGG11Rudwc4PRm/pj9Hhe8G8l16eQAG2icNQiz8plKH5tN7iJlYwGCDDEBIu2vGDTtPuJdDt9R7H1BQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z//fibB63PnhYLQZ+76Dat7C26F6rhjUQkNpY33ZsPeY7PQvpD2
	BQpb0fB/ZlSqsmB/0Y01LTk/H6AyPfFocR/dCwWRWxaEKT4ChJMwzBdbC2ZNDNwfc/DnY4ofGxE
	vKHXEPOVFuaKYwO9nYpKF9pp+m7hmPhosmf9t0u6hYAAeEymwjUm1UlXoXhdG6QN6dSpKvAp2Q1
	UfyyCRiKi8h1yiY+ZiqaRkC4CVi6BoYcFTDiUZTUvjrbFeBKwXmNYbNjhvjifaL0pxSQt3frCGp
	apfMhLTQwFfncL0ITuux3Mjgw==
X-Gm-Gg: AZFdTZeiBeoqZVvCkSRj7SnWspas29Vz/7Qm8Kz+sHNUGz3PY2U8VhcdwPC3eOWixdx
	uh4OT2HL+8STgIyAV0tma3p/laOCc+mx2Tw5MlDboNsgUdVueK6mGMXxcA7eiqvtBW7g3V3TIph
	9Lvi19YItJ6Pagivols3qZfwHlqV5VNbl4Jn+rM1Jiy/fxXR1jJTh161DGZP/TYTsf7WbuHDivA
	UBi8MoceOP8F/E7/OXGjUtqT2FCPtLWdPKTZuIS6wQTpDPne+yiblXM79qD0yMl1MBdNDnd2tUE
	qEfhVWX7LfrIXP8v6NuoN1LXfwYQFvi0P9cm8ansCXOkH2EQx4HcKcv+UAhuaAEwGl0hHncdcub
	ICxhRCg12kBKjaepAXlQt9WaduP8joqnGUWlZM3z+BGYllRSExbvWsRvAj94sPmkosv6RV28fKN
	lMTI4ggXtwQnQe0vjt4ebSWmyDqXk4Dim4qXJYwvCa4A==
X-Received: by 2002:a17:90b:17ca:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b3d0763168mr392557a91.18.1794944805170;
        Tue, 17 Nov 2026 11:46:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d0987ac9sm271434a91.0.2026.11.17.11.46.44
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50b0de2139so4200766b.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 11:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944803; x=1795549603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=CrJioLXSrQrzjyCedrcFdZXOQlHTUrIFqi9+BjfX8Z7VPZaPMfbRajtr0NN9SPy3x5
         fHxPu9u37H07G/qmq6Mlf0d7L4RE+mSsZxssONsmMC2HsB9Blwv2vLl7qANzSdEpnJrS
         rvrGrGNaFTr7LHCSLh822aPcX9FkB/E3jtsak=
X-Forwarded-Encrypted: i=1; AL+hErGatK2E/Bw/tqmaYA4Ib8DHDmm/keTqyBYzX2SUsi1WAroAFibFDP3n5kPzpeUkewM6RF3Mt8buY85ejFfZOA==@vger.kernel.org
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21124666b.36.1794944803139;
        Tue, 17 Nov 2026 11:46:43 -0800 (PST)
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21123566b.36.1794944802720;
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca09c82sm16249666b.21.2026.11.17.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Message-ID: <716869b3-adaf-4155-88bf-638952dd358f@broadcom.com>
Date: Tue, 17 Nov 2026 20:46:42 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
 <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:50, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
>>> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
>>> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
>>> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
>>> enables "txbf" by default, so the driver has to clear it.
>>>
>>> [...]
>>>
>>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>>
>> [...]
>>
>>> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>>>         goto done;
>>>     }
>>>
>>> -    /* Enable tx beamforming, errors can be ignored (not supported) */
>>> -    (void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
>>> +    /* Enable tx beamforming, errors can be ignored (not supported).
>>> +     * BCM4364 firmware enables it by default and then transmits a single
>>> +     * beamformed stream instead of two, halving its uplink throughput.
>>> +     */
>>> +    (void)brcmf_fil_iovar_int_set(ifp, "txbf",
>>> +                      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>>> done:
>>>     return err;
>>> }
>>
>> The chip ID check has the same problem as in the ARP/ND offload patch [1]:
>> the issue is described as specific to the firmware shipped by Apple
>> (9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
>> restrict it as suggested there.
>>
>> Also, the comment says "Enable tx beamforming" while the code now
>> conditionally disables it. Please make the code self-explanatory, e.g. a
>> local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
>> txbf value spelled out, instead of passing a bool expression as the
>> iovar value.
>>
>> Minor: typo "refression" in the commit message, and the subject lacks
>> the target tree (wireless-next) which wifibot flagged.
>>
>> Since this is a throughput quirk (not a fix) I would also like to know
>> whether TX beamforming is functional at all on the BCM4364 or just
>> mis-selected by rate control, so the commit message can state the actual
>> root cause.
> 
> Unrelated but Airdrop conversation seems to have been stalled :(.

Indeed unrelated so let me respond to your earlier email that was more 
on the subject.

Regards,
Arend
