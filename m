Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861988;
	b=WNgq1IJMtVqBE2lo+e6OOTetreHhfFkXC3UwT9PKcaDcS3VDGUijrUum6qTotht5DlX+
	 ZIEfsTv9WH+T4cCw2WI3RCPHfQsNzRJwEGV1+C2thzGLNYA8A5St/fuxtLnnZIe1HnbQ5
	 /WfUG+ZDmhGcpViz4dk3hH7Y3iQG2b7S+UTiCyRdcwQkO6b8oqrBhABRQUtFctWd37/PE
	 rpC+QnM5ZvYG5kFoFkUlQtUQzHsA2FvWl9j48ySgMDzaL+khetRObAKS6xuVQzFWUZ0Ss
	 6hqD7VH4HayJZ8QFGPbAVRtuMkiY2kZWmAMp2S0ZO1IwPJ5itVzat8zRv95vJJTtakA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=vSROSlyunHVilA5mcI2D1PLOCGtd0jT4tqpO1YqeQR4=;
	b=on2svCNpi/zTfEHbBq/rgIOUXPi4PkVLDwnxNLK6p2tiYELruWtE1fpNyIywvyf4x2pi
	 +6q8ryGNY+EshiDUurGAp7nwZVsyDDtSm4klkOSoteAOwh3T+CTs/+bj0Ho0SIJSSL1Eu
	 6Vb5WBnzd7c6ykdHCBsQybUHM4e8Jq3eWGr9vXtqhhCMwJPpZOlvtriBMaHL8Rt2D8vIu
	 sFQX2N5YrCYsXVr72oYDG8ktHCYj83c3Fq8WUOJLeVBdflHlNZpE0gBnGBr4C4K+SH8Fm
	 EKR8/eZCe07m5040OkamYsbm2+8vhTxKInElxD4J1qXwclggE0HUsTp5aKGBKZdN+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b="NX9E/u75";
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6325B606A31C;
	Sat, 28 Nov 2026 10:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6325B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=NX9E/u75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=vSROSlyunHVilA5mcI2D1PLOCGtd0jT4tqpO1YqeQR4=; b=NX9E/u
	75HF6PjPpnjaxVR8D0xorRuI1reod2VHZ7juZQ8lEtB0IcX7hrvGcQ268G7aDsI7YGj6P0KcJdtPc
	+0/wWOMfQ4X2L10EDoyphcwzZs+s5r9ayQKYJ+8eVm9WgAM69ev86EgUsPHguPfy0+zZ7cBoejmhD
	57Awhcnu5tHz8dRTNmNEeNFigDCgK2kx0vfZrYQGoDNQMVHXUMTx1eXid70SJRwBWX06T2jUHndEI
	1hMLcot4hLHreXE4zDlY0trQyab56BqGP0JiS5/IBcXVTaY5tUcTwow4YLqmg9FkeXFMzxkxd7VbR
	2IiztzfeGElrL/me7rU2ie5mZILg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFjt-0006IU-1W;
	Sat, 28 Nov 2026 11:33:05 +0100
Received: from [192.168.0.32] (helo=mail.your-server.de)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFjt-000FlQ-0S;
	Sat, 28 Nov 2026 11:33:05 +0100
Date: Sat, 28 Nov 2026 11:33:04 +0100
Message-ID: <20261128113304.Horde.AlVGhIssVk0T26G9XwXTpD-@mail.your-server.de>
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

> If the two-stream rates still don't show up with more distance, it's
> probably something in rtw88 rather than the sniffer, and I'll look
> into it.

The two-stream rates are fine (see my last mail), but VHT MCS8 and 9
are not. I now had a reference: an MT7921AU with a fixed-rate patch
for mt76 sending VHT MCS8 and MCS9 at 80 MHz (and MCS9 at 40 MHz). All
three rtw88 sniffers (RTL8812AU, RTL8814AU, RTL8822BU, unpatched)
received those frames. The RTL8812AU with your v2 injecting VHT MCS8,
MCS9 and MCS9 with short GI at 80 MHz, unicast, again reached none of
them (two runs), while VHT MCS7 at 80 MHz arrived in the same run. So
on the RTL8812AU, VHT MCS8/9 either aren't sent or can't be decoded.

Two side notes from the same tests, both also without your patches:

- broadcast data frames injected on the RTL8812AU don't go out at all
   (6 Mbit/s, 0 of 20 at the sniffers; unicast right after: 20 of 20)
- the RTL8814AU and RTL8822BU report 80 MHz VHT frames they receive
   as 20 MHz in the radiotap header; the RTL8812AU reports 80 MHz

Thanks,
Martin



