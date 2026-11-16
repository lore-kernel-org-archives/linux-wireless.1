Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834612;
	b=Kc6dlJoNAHaX8NfDNimA3j8NghPNzG7GlxzAdM9reIdlCaf1uZqGihDNsv6HP1dyqoCT
	 iDAFLrixuzgHFk3Q3U7dEwe6xQjC0sT9tiB7D6dw++fNU2PWUa2ulMopgliWSx+XvJgV1
	 J6wDN73eVbWe9kMeFQyL9wRBId5KOoOYHJ4tuzNjo/rCT5Vr+4XjkegXtPrh04a9A+c3h
	 HCohqsfLdlyZ3s1fMo6J29jlpRWZyDsT81RZlryHhmGIy8P9n2uebQh/Y7JSnuwQ7wMqk
	 4hOLYbcBDR5n2qEgFyAav0EBCZIsT/YHDj1eUqkliOiH8+IRO+s3sCaFTqFhOWAYgZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=;
	b=M1btI8nsRocKfyYc/F43xYkcuVHRfkY9xduhu+/dRfLeiQW3eXP30ybIQB3dEhCp1zJT
	 tSTpPd8RJMsbjWrESBRexQS+XfG3zgXNdZzdFQT8YI+UOmPfL8l9DP+HXKWJ72W0USvXS
	 Z3+GY+o5kaNmUey99o4Wmr6zCMbrXnHM/9hmwetJk1r85LtTF0BjtMbAaB6CboWp95lf5
	 bjlV2oajZObkCYzuB1uaLgxjUSmv2d8ISs3cULJ4KIu1KcoxI8bIoBrHeipJum78TSLEF
	 ALiQb/NmUMj+3RUNYxdJ/IEi12Y2dbTSzNMpycIrQYt1BpIn9QegQNjd3gX4uE3nPLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhR72kYd;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73273606A886
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 13:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73273606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhR72kYd
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55ade1de0b4so46825921cf.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834611; x=1795439411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=;
        b=EhR72kYdA/Iu3c8YdYdZpjcgdHwRlIFXA73wyZj/PDfuRwNZwZpeZyp2hWGot7dsQ4
         dd0x8XKfFPDPWMKqloO/aBSe107vRG60bsclIK5DNCdgbqXqwAx9RB0pnGNBlBqoZ0oy
         /V/f3I8jEtYGEkdlqZmJhs5FyluX62Cicq8cwpxUJ4ckqzaDA+9TtM4TwodWCS8qoCaC
         qY3y/uvJWCX408jrdO0NBbq7YaBTIZvoXqR4cfYrMDCCFv3bLZsczJ3xZxspmtlIFhJC
         1CPzAy9HMCfTpH4GveeXfU7lTiKa7/r2oodqWtu/p40BxVKUvplLuLX1MJaNcExveB4G
         2UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834611; x=1795439411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=;
        b=yotHGNn4FdkaBUCInGLZ8paWqhN2lTjV+XVnQvL7zPweG8XVuuKWXHiprO53rI4nJX
         XBFIJS2HiSFy52/ZkY3m+x/q/CMOby4EH+s98Tox7/eRGYgD++EQveRBp/2Ed4Js6cG0
         Grr1McZB/TmV5+f9SPwnsKtMNwht+hDX9mbgjRbWixVFGNmaV8ZmRrgzcOjzwNRhSVMm
         nv+oxetIYLpdM8rXZk6Kg4awuCtZWxnOho5Bw5NQdJrWu1fTZvk1DTCTLG0NB/4MC1es
         NRQ/qDGYXpDxYEdPc53BOE6LmrFBcbW1k6xrh+GQRaLlS2Fb2XeGJpveFISi02JHb1zg
         5yFA==
X-Gm-Message-State: APuU4Z8yFBowqzvBsVj4pB0Q5qJYWiEBsM8ZqjZA/Dj0/UqezBC3MwvP
	VhfxYPb4B7y3Jt59OI+FYGCtIaaA8u25WuJVYhohXAUaz6PKMLCT+BlPHESm7VUk
X-Gm-Gg: AYBFou3dbUccHwwFq9Aysv896KgeyxhWvHgvy9oBmxtTuHAl5tLd9r1v2bPe+P4Zuqa
	gcZC5DYDPJmO1oFv0k5QvqJctiNGIkGevk9ORK3vTVXKryaqOF2nuZa8NwfRD3msB+nWlh/R0/j
	6Nyg7VChDNLsHp4Cp7/XcoaqIco0cdElyQG+C6UM1OMg6X5LVKD2STzL3f7IeX2kCMbAU8Qtqht
	Botm/dXiCrrWzlGCOWCCugDTx4jpDa0Us4FUtzTYgejV/A9EvTY/0KwXtrXBClEfWDL+mLpazcU
	S75zSBb7yHKGfKFF4PnC74pAEL6xOBDqipgJdvHaDVZXo3Z+xZ+fpn5Hj1OHR4Z0jt8pYrnJvTo
	r/1y161AQ8IQobyUMjfrBejsuikgPhG2V6k2U5TXEYpj4WOyF7XlQRQOZKxb8Y4AHj8sS1Cmrz2
	PI6AEZviiQT3xk5w9abKQc5Ex5A1V0sWE2PcrwQzpvEk8yiMutk3TyWGLhROO9HINgXzlvJhUgL
	OLprTmZxaNV16kiWZq61arDKyU1Gw59ceE9rNsEH6kJkPUYpZMeRUdOeuluFL2kXdP3BminVOXk
	qdl1ojpSEFdLhcv2srhKzxVWK1Ee1e9vci5TfFuhft3gMQ9dk3+xj3VUXnBQEKq/PLlkfgjV6cw
	75p97GihyzIU=
X-Received: by 2002:a05:622a:22a2:b0:536:52ae:d91c with SMTP id d75a77b69052e-55ac80705cbmr164197351cf.47.1794834611428;
        Mon, 16 Nov 2026 05:10:11 -0800 (PST)
Received: from [192.168.50.163] (99-7-255-95.lightspeed.clmboh.sbcglobal.net. [99.7.255.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d37daf422sm25492351cf.15.2026.11.16.05.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:10:10 -0800 (PST)
Message-ID: <261fd10f-8db0-4458-b7b0-a8875c37ae85@gmail.com>
Date: Mon, 16 Nov 2026 07:10:10 -0600
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
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
 <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
 <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Content-Language: en-US
From: Walt Holman <waltholman09@gmail.com>
In-Reply-To: <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:28, Baochen Qiang wrote:
> 
> 
> On 11/15/2026 3:35 AM, Walt Holman wrote:
>> On 11/3/26 09:26, Jeff Johnson wrote:
>>> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>>>
>>>> Hmm, forget to reset revision number ...
>>>>
>>>> Jeff, let me know if I need to resend it with number fixed.
>>>
>>> No, this is fine. Waiting for a R-B from the infrastructure team.
>>>
>>> /jeff
>>
>> Has there been any progress on this getting merged? I need the patches to connect to my
>> wifi on anything other than the 2.4Ghz band with 7.4-rc2.
> 
> the v5 version has got merged in ath.git already:
> 
> https://lore.kernel.org/ath12k/20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com/

THank you!

-Walt

