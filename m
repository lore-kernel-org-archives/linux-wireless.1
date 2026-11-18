Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004510;
	b=dK6gHht7Mms3cV37AzG4YUVjMF93GqXmhKEegKGJ/C+Q4kHZTPfl/tRCbRNvfEzw7gr/
	 CU/xxq636+B+T1a63LjYpOjNGFv7HoyYPj4MfMfIATDsBSMi4j9CjeNVL1i8KUF7MuWHw
	 kKWjyNISLH9XqjsZhMD1S+c+XHFY73dWOc7WXLkWnzJ7kVzh9TCV0scK6QXkNsf7giW3h
	 dk4MZZCvgHhDsErZy2kl17MGiz2CaiRD7zl0seHDfu6/H8UfbpxB1615Msx8Bel4x6miO
	 yXWnhYYbC/B+WF4z5eFRB9neVhxQA75MoLy5g+JRExk1z6ZfQFBL19tWlwtTKH1s3xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004510;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
	b=MFRNvrkUxtIYVVxlMtE9HpzvxXHWHnHp2TCfL2GVUQ18gzdrhrXnSb/4NyOcvtZPDv+t
	 Qiq4xd+/0F53L4Lg6bZME+NRt+6MOY2Br85wUASXpKBZCHuXBI/FcsCjLGbM0Ciko8oPR
	 quiEusqgVyCWZnnz8GVzzllmPjcrHypI36+/sZJvd0Tsyty66wkZrLe87VJZxtb9cPJ7z
	 r8MnZzHpFqsSCOauVvxKi8tkTOfAt3wqKcfIjURWRyjBD55DCMNkdJ+5u5lDEdl+uGKPO
	 s8l60M3sE8HE70SuZFgudYB+igEdfmGSw46QcRtUf7uOuUjR8olMniXD4jsBT/Mek1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WERrGwEi;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCDB606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 12:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CCDB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WERrGwEi
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-382f4710a17so917744eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004509; x=1795609309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=ltIofABuE60MIthZwERBuIHeAJrIX0Lb5X8bCdztUMmaMjPEuBD9oWwzNhvdl5qLSi
         oRoFdIdaIV1E52usqU6kocX5qKgFnAfYrHmvDc5LBugitoarex5sbt11EUuXl4BtucG1
         U6vt9D9FlWThzia//7JCk+J0czngMxE3ratRiyA7RaAQDSGpMpOvj5vCpnp/A1ahEh5E
         yfL0UuwnJmaDIWeMlg5pm7RhK1gG2NiJUZzxkmp6qCyHWZIOegvt0eoZWF4p05YwBS0I
         ++tvowbyKg53eaGk66ca/Jdw1cUUDEoviIPnLEhpWom2sZYLeDGcTZdbYbZiAQKN4iuR
         MkrA==
X-Gm-Message-State: APuU4Z/1leKl2E9NQtlFwav49Q6FpprQa5KLxe0f3fewPiQxgrlboTjK
	H1/l+nGlrtFdVgllEVTL+kb/a6WEBPAkAx647rLmlE1rxZM2cboiNi6/kOwrXWIOd8KAldvgLj/
	TvvbwqS62kwn19ePogGQEiAcFrK8kwcRdVa4KyOgtRT78QUCwhvFX3+4icVgzMMC9CYDdag/FFp
	A+u6gRKrGrpa2q+MX4odFi3z8uj9gHju8IVnqgjQCF9a0noAXFPs93+0YrDe9RLOCLu7wUvyE9j
	WsCZpDN86evVCJfmBvucAXUCyqI
X-Gm-Gg: AZFdTZdH8eRZV8gRzIbgu1wqGS7wW3HyqQMbfJiNS9LpdLQFEuTTgm6IlmItFP1wVHE
	D6CWzi+n1PywjTLqqX+j8q39P4bEqC0A/WG4c9Ld5ZdWAL+1LyseHDrCdYtXwCtLvR3piQBYZCX
	75bsRAF9+ZPU2GYAaX6wk4H3FMHoFGaln7BieYRK9nWmSNeFFepDhZv1DMsmPDGTJUvLNSpQ+dw
	VNnhMWYTyHbLpZzz0HflbhHxKvA+BZQtfBZVOYdTC1ljSCNz/G46qR3UYlGUhoYPtwsCXrBdPiJ
	g3Mf1hg4Idz+Vk1NQ4cgAX4PpOaTLO/IAoL4hurcvhehc2IGCTIjpQbTl+PcfvZPEAdGw2QWclR
	oYuHQ4xxJE15l8ouEj8SBqzZnRy8c8eYMZwaZAveZpUXO4XYLfWbLTuzqoTpfFGXHpPV4WdjaAo
	OTdEoEHgcvYCK9/R8OoBHj9RRw6mjs093mlDuyTNk=
X-Received: by 2002:a05:7301:18aa:b0:376:b957:c08 with SMTP id 5a478bee46e88-3828007a779mr2258013eec.9.1795004508743;
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-382a6df3926sm83624eec.10.2026.11.18.04.21.48
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso133348985a.2
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 04:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795004507; x=1795609307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7cQ0TqQjtgioJTFXdfvZ8oEUKYc3/mFBKIQJtrSBN4=;
        b=WERrGwEiUrfb0F1OTj5Z8wzeHIlVNZZ5TXM7wBqzymnR8WJ0OeHvchNgG2SBjbQIYV
         WwjfDE92TFJXGdx67ldf1ZQxqOpuGiQh/IHbhx1f1oM5l46higoPIf0O2t3BQGXQpW2W
         pUlhqRYGp/ZFE3g3PtsdIUn0EqUuaXS01jprE=
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468918085a.72.1795004507037;
        Wed, 18 Nov 2026 04:21:47 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:7502:696 with SMTP id af79cd13be357-949996230bdmr468913785a.72.1795004506453;
        Wed, 18 Nov 2026 04:21:46 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b457495sm168164685a.2.2026.11.18.04.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:21:45 -0800 (PST)
Message-ID: <0d8104b6-888f-475a-99e0-0275c12f7a76@broadcom.com>
Date: Wed, 18 Nov 2026 13:21:45 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
 <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
 <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261118125034.4d257b01@kait2en-mbp15-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/11/2026 12:50, André Eikmeyer wrote:
> On Tue, 17 Nov 2026 13:12:49 +0100
> Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
> 
> Hi Arend,
> 
>> It is all you ;-) so you can probably confirm whether this is indeed
>> superseded by the series mentioned above. I marked it as such in
>> linux-wireless patchwork.
> 
> Yes, confirmed. Patches 3/5 and 4/5 of the T2 suspend series cover both
> parts of it.
> 
> The same goes for the older "wifi: brcmfmac: handle missing D3 ACK on
> BCM4377 T2 Macs" v2 [1]. With Michael's mailbox over the control ring
> the BCM4377 ACKs D3, so that workaround is not needed anymore and can
> be dropped as well.

Understood. Thanks for the confirmation.

Regards,
Arend
