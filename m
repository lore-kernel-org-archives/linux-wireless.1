Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300130;
	b=Oiz+GkePpA2qGvoiC/tn6It4dVl81nP8i8oljjXZAGgAABwR4ZFtlBGm2c08uhtoDPwe
	 MM8OYyCSU64ONo3J8MUn4wGJGAW3ZEMaXj8oDps7h3Zoy6oVPGx5a2nRDR9duaVcnWRyq
	 2fDhKOaVdsKR+mi76Q/QFTVR2rqtTt+qHIqPRbFy2CmjrHRzbV+MQjiIYSB/Vv55Yupep
	 nUejX9va0DadQ4JgDPZVPDg72uGMk1pNN8qqTn/U+VTax7keVmMICtwAmyxYFQkDIcmgw
	 yYZP2S/1h4YwmqIQtDMi3o99rlYHQkrv+cTFiqL+3LWoBNwpGIIOOwlkffwpQzR0eeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300130;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=145TK+Lob1c0UyTImABgiwVFQjHyTBF+330NJmUEAyM=;
	b=ln7NWXoFn8dIiD2IWKCFDU5fHdTTtmr73slStNSOmZ85wf0JMoC7DHTJJCKMVooC1+Al
	 Tv6meeWt8QF0aJaVOTidkFgEG5P8CLVN3XBG2jXw7foVdl3rlIUNYGvyde3Pak0BZ6zmv
	 BpmzUV34IPXPKa9T2dwkTSqLLTbSa4ZlIw01ZcrccdUAadmLVMb5aVlGaM5SH9bKqaaLN
	 xIG7ktyR3K8xvcYF7j0lyLv8IKbr51w+W6jd4kwCtOYFLZGquqZCFv2BPgGERK8iSY/Ji
	 rUVRo1QLxW49q60iG179mnbuK6jjwjgFbux0WfBpQ+7ndXOwd8bJbIVGBJeFp2qv5EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ij2zog0B;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B7606A330
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87B7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ij2zog0B
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=145TK+Lob1c0UyTImABgiwVFQjHyTBF+330NJmUEAyM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794300128; v=1; x=1794904928;
 b=Ij2zog0BELciP7p5MMa2Am/WPPRQ+Y06gIfodPPZO1rpEUFVw7OzBM5xGBaYPmQy0ujKuYAf
 GcBH1e13VgMKeiT9vfK+ttvGehAIc6BJs3XF3Z3ZeBSgAG1f81clKp26oOIsFVLu8kFRmXVH8OQ
 fPqwJHWxGYiha0fNHMsjPx40=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 94093172365bc7a8;
	Tue, 10 Nov 2026 08:42:08 +0000
X-Mizu-Trace-ID: 94093172365bc7a8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 09:42:05 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, igor@listopad.email
Subject: Re: [RFC] Adding RTL8189ES SDIO support to rtw88
In-Reply-To: <A11FF135-696D-4107-B5FC-BBBB05303926@listopad.email>
References: <A11FF135-696D-4107-B5FC-BBBB05303926@listopad.email>
Message-ID: <977DC5C2-4EB7-45BD-9663-69E4094EE596@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Igor,

Thanks for asking before sending it. Ping-Ke has the
final word on this, so this is only my view after adding RTL8723BS to the
rtw88.

On November 10, 2026 5:50:38 AM GMT+01:00, igor@listopad.email wrote:

> Would support for RTL8189ES SDIO devices, based on the RTL8188E T-series
> (SDIO ID 024c:8179), be welcome in rtw88?

I think so. As far as I can see nothing in the kernel binds this SDIO ID
today. rtlwifi has RTL8188EE on PCIe and rtl8xxxu has RTL8188EU on USB,
while rtw88 already has the SDIO code and other 8051 based 802.11n chips
like RTL8703B and RTL8723B.

On my RTL8723BS series Ping-Ke said it isn't so good to maintain three
interfaces in the tree drivers, but he kept the existing ones and took the
new one. So I would expect the same split to be acceptable here.

Refusing cut I seems fine too. rtl8xxxu does the same for RTL8188EU.

[ ... ]

> The implementation adds chip operations, register tables, firmware,
> and an SDIO binding.

The firmware in the PR is byte for byte the same as
rtlwifi/rtl8188eufw.bin, which is already in the firmware repository and
which rtl8xxxu uses. So I don't think you need a new blob. You could
request that name, or add a Link: in WHENCE if Ping-Ke prefers an rtw88
path.

[ ... ]

> Would this be an acceptable direction for rtw88? Are there architectural
> concerns or requirements that should be addressed before submitting
> the series for review?

From my quick skim of the PR, I think the direction is fine. What I would
worry about is how much it changes the shared code. It needs an additional
20 callbacks in rtw_chip_ops and more than 20 checks for this chip in the
core and SDIO code. On my series Ping-Ke asked why the existing logic
didn't work for special cases like these, so I would expect each one to
need a reason.

A few examples:

rtw8188e.c casts rtwdev->priv to struct rtw_sdio, and nothing outside
sdio.c uses that struct today. Maybe those parts can become hci ops.

rtw_sdio_tx_handler() reads host->sdio_irq_pending, which as far as I can
see only the mmc core uses today. TX keeping the IRQ worker away from the
host also doesn't sound specific to this chip, so I think that wants a
fix in the common SDIO TX path.

rtw8188e_efuse_grant() and rtw8188e_false_alarm_statistics() look the same
as the rtw8723x.c helpers that RTL8723B uses. Maybe those can be shared
instead of copied.

A more thorough review will follow once the series is posted.

For the actual series, please base it on rtw-next instead of the lwfinger
tree. Several of the core files don't apply there, and the
LINUX_VERSION_CODE checks have to go. It also needs the Kconfig and
Makefile entries, the device ID in sdio_ids.h, and the fixes from your
later commits squashed into the patches they fix. The sign off should use
a real address instead of the GitHub noreply one.

You can also take a look at how the RTL8723B series went upstream for
reference, from the RFC to the version that was applied:

https://lore.kernel.org/linux-wireless/cover.1784047561.git.luka.gejak@linux.dev/
https://lore.kernel.org/linux-wireless/20261006130701.120460-1-luka.gejak@linux.dev/

Best regards,
Luka Gejak
