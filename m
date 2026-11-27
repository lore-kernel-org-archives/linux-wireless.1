Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807093;
	b=ygEnREUj9sAzcgm+SeKflEsruRpEIIKSG+Q1l3g3MIjgBJsl2p7LRoUJmmk+1Ipn7zOK
	 SmdNMQkAV3O8tMZRmVsqdthwNd6ljUYrVuD8yEnQxLRCFuu3S30XeOQPix2KTjF8mgMYN
	 gNlYAXQvXTaMn6sU7LygJnNvAsrvhiDYAU/aVvzEZ3Na22g7RI4NENheDLPTpOR3L3c7a
	 EA+TkfKgXlZbr7dFP7KB3X6SMTz7+0JQF/wzyCEJqCWTfebRycm5xzgdzDEPCKALmFuqk
	 NA+D94u5JR1dMMuLw0N19GxYEMwiSSMbtrIan7/euMHy9FMcK2KbBuFOwWX430+BULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807093;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=+FpDgb1KryYOlH1jyhluUPViEOyJr/jEGQY6u3mwUdY=;
	b=k6Spo5Ofh9JTqVnjM3p2wXa3cVc1K4tdB8E5AIuMhiV30Rg3LoQ96Iko8Ggf/vY4pJxb
	 0fMlu8k5pxrfxfMh57uXSlXELNm5ixDd4uOF7cBWhygGQT6MoU+SxpawjrRLo2mJ7OQ+A
	 W5wMV7zgAncBkBT1o1y7Ju78lHpXn9L/DDxhKcTbdcZSApCG5FO+mgyBUhg8g/6CTEhd8
	 NuOYQFl00Z1YT1VpGki4hBqNwpeAX4870AZkf4eJisi4e6aIsMZpS5Gwsr706WawIrDFH
	 eQUDYb3trJtHpQzlWOrfFY8XuVjaMUMegNXPWTTkHX+IkmociMxIrrAYRktIl1BIqhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=NYXilNfp;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9031E606A31F;
	Fri, 27 Nov 2026 19:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9031E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=NYXilNfp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=+FpDgb1KryYOlH1jyhluUPViEOyJr/jEGQY6u3mwUdY=; b=NYXilN
	fp26NR/hB1k7cabtp+QLKjR4UzBEaOXFcRN5M78+ZpmJdWIwDX/P4uQT0pBeHa+Cyftn25bkGtXgh
	r8VVwWxcnIAZpHKyMC+9c3snQqIaUOB1xCSEDwBodmEqqwb5mkvF/9mMEEBbPvezupXOk20gQe53/
	dXK3ceqyGs1WD4oQJa6egm6Cv2XyopWnlWGHZfPai1ygVHz1Ug4DYvVYTpzKeazKC+RjOGA9RYR0B
	Bep8igo9iXCnY8OH7kaCOtwQ2xouOV9wkcxy1xEBYQa9RWhehIOXDlFvOKuhFmeq70PB4NuRdwoBv
	NIKOLbKYWsWGYAgixSOIaXLuV3yQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xX1SV-000A8a-2L;
	Fri, 27 Nov 2026 20:18:11 +0100
Received: from [192.168.0.33] (helo=mail.your-server.de)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xX1SV-0002dX-1M;
	Fri, 27 Nov 2026 20:18:11 +0100
Date: Fri, 27 Nov 2026 20:18:11 +0100
Message-ID: <20261127201811.Horde.O_c8lgqdTdEePdnm3jYazp0@mail.your-server.de>
From: martin@rfdeck.de
To: Ahmet Zeren <niko3x@proton.me>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Luka
 Gejak <luka.gejak@linux.dev>, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 0/2] wifi: rtw88: honour rate, retries
 and bandwidth of injected frames
References: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de>
 <semDCz-DacL4vKeB_8iKu6ZwI8pQDusEK2fvgerTJWRkQ1MAxvs0nX-lSJviX_LDplBuBKniLMaMy9FtGH2_EkckFD-LR2YY6pPSPwrTCk0=@proton.me>
In-Reply-To: <semDCz-DacL4vKeB_8iKu6ZwI8pQDusEK2fvgerTJWRkQ1MAxvs0nX-lSJviX_LDplBuBKniLMaMy9FtGH2_EkckFD-LR2YY6pPSPwrTCk0=@proton.me>
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

Hi Ahmet,

> Thanks, let me know how the repeat goes.

I repeated them with the two adapters apart (sniffer levels about -40
to -60 dBm) and three sniffers: mt7921u, RTL8814AU and RTL8822BU. The
RTL8812AU has both antennas connected and reports VHT MCS 0-9 for 1
and 2 streams.

- HT MCS15 and VHT MCS7 NSS2 at 80 MHz do arrive with the requested
   rate, but only at the RTL8814AU (17 and 18 of 50, one copy each, no
   retry bit); the other two sniffers don't decode them. So the two
   stream rates are sent, and last time it was the sniffer.
- MCS8, MCS12 and VHT MCS0 NSS2 at 80 MHz arrive at all three.
- VHT MCS8 and MCS9 at 80 MHz (short and long GI) arrived at none of
   them, not even at -38 dBm on the RTL8822BU, which gets all VHT MCS7
   80 MHz frames. I can't tell whether the RTL8812AU doesn't send them
   or sends them so badly that nothing decodes them, and I have no other
   VHT MCS9 transmitter to compare with. Without the patches they all
   go out at 6 Mbit/s, so this is no regression.

> Martin, may I add your Tested-by to v3?

Yes, for rate, bandwidth and GI up to VHT MCS7 (1 and 2 streams), the
retry count and NO_ACK, on RTL8812AU, USB, 5 GHz:

Tested-by: Martin <martin@rfdeck.de>

Since v3 changes the NO_ACK status, I'm happy to run the NO_ACK and
retries part again on v3.

Thanks,
Martin

