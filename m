Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785351;
	b=juDPadBfNgZxCnQYOOdmtjXgP1MFDRHKaLK8jeh9VvRtUwxB+50pcQoxXUEB2HMfQMd6
	 1WjfN1AdDshsVGdsV4cI4AxjI6wLqfhmk8jKhlLHVIMfcmalwUhot04Jw0X2uwNEVT566
	 0K79tAOJz36Grm7j7d1Ymlgh7vZY8FFhZ/PhyMCPDF8UJzvdeKsGaKFaVaeCEG9eNtsLQ
	 NkiNMLW4XUypsAcrptFSg4JV1lll/KUyj83/oFWgOSNqeC1CLWaWoZMvivk6P83ia08H+
	 mPms9sGw64LKsPbhCTcpPnWjQcEQAlgg0Aft/Yzd/f3CH6WPFqkMzO/IyNOTw4h4hLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785351;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=rOlJ93GB0Xawj1f2mdWR4secXAw/eZZaynBW9vFh43o=;
	b=EnexceliPMs5VDd59Uw/vS/NOUB57KusL31ABljAy0T06QHWCVm78bMt4I7KeGzbXqJ9
	 EdNfbBXkYBA6Z71jpXMJ36+74XWj7dAzfbJirKdvjtG+5v9Ykl+JjcOaex1zBJWDMCvRF
	 Ae765JGFyxVmqS30+NbZ11a9nr0gvrIAED1X9yLSv2mMzQzHB3U4/EMgKCfiSzN1JgbZS
	 8n78KU7dClF2MyUtyllLusw0j+Q3vM3FM2/kZq4hpGwkcqpFM5ZQcnTOHcHyJUPNIXOpN
	 bUfJZ5YCpOuYGMSeOr5mHyV9aAU7JhtUGH02GqO9ER0CYjA1vcqcNicbfd56WX5uZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=G8K9CRB3;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCFA606A31F
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 13:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCFA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=G8K9CRB3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=rOlJ93GB0Xawj1f2mdWR4secXAw/eZZaynBW9vFh43o=; b=G8K9CR
	B3HCnpuoGb94K8/DHbK/5r6FpFRM84ESnIS9rFtn9MFMwYYjSMKHZLbMiAQfHz+lyW1mmC+8o+Ivr
	jiZChA2+8J+HQQCnRk36fVRN1QCIjMYxVu4nTsXiwyMiUSb5d5jGsT7UT20kdzcegTaQkFTaTo9sL
	UgIeKxPjD59IfaCKXNtiX4sIeFxO/U5roOaYRzirn7oNKV6D9zeWUcm81qYFZ4yB5R4kePWhHnnx7
	9LKaBvatVkEByBRgJsJFQ+AVvgqqs2lUvKi88MPTrM8Ujc8z6HPkM7nP+xzvshPFF0AVXffHaWm55
	uxWVZTDIPH50vj7qffg1SVmym3tw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xWvnh-000AmN-19;
	Fri, 27 Nov 2026 14:15:41 +0100
Received: from [192.168.0.33] (helo=mail.your-server.de)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xWvnh-000Mle-0F;
	Fri, 27 Nov 2026 14:15:41 +0100
Date: Fri, 27 Nov 2026 14:15:40 +0100
Message-ID: <20261127141540.Horde.j7w80xrIVq5DshPvlKMMIr2@mail.your-server.de>
From: martin@rfdeck.de
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
 <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
 <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>
 <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev>
 <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de>
 <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev>
In-Reply-To: <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

Hi Luka,

> When the low beacon count happens again with the patch, could you keep
> the same hostapd instance running and bring only the monitor down, then
> up again?

I tried, but it didn't happen again: 15 more runs of the same fixed
channel test with the patched rtw88_core (monitor up on channel 6, AP1
and AP2 for 12 s each, no update_beacon), and all 30 APs sent 113 to
117 beacons, so the monitor down/up step never came up. 0x422 was 0x71
before every AP1, 0x31 before every AP2 and 0x71 during every AP.

So the low count is now 2 of 25 runs with the monitor up, both on the
day before, none today. If it turns up again I'll do the down/up
measurement on the running AP as you described.

Thanks,
Martin


