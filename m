Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805792;
	b=Yv1DQg/CofnXgZxhmTb2UnaowVhG2dTlC+5pJu5xOjDhYvLavmj4clreaTmV1OKwESZh
	 kT2DIDAi0haBJrLjM8ZTb/hO2WwlOT5UzPKtdn232ytb8LTe2F2Nl5roMnuyFM8kFPauP
	 QiJ+SvbciXEwbYrP2/SPJDoUwugciD1rR3+G1D4+EdT9b3/zHf+LQnGHIKGQaRHfBHTjw
	 +SGQb2L5vumHQyPp1clcODx8l/pVarFj3xTYXog9zrimZSmkTYfk7mZu4jySh9Vj5jVtg
	 2OXJNQIEZVtIbj5NAr9XFzpfXR2R7dryO1Xu/h9V69P7O8dpoNl6D0d01TRIPI/35Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805792;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1I69IFd7Tmg3JJp7yrDb8UavXsvpmNBRcQJmMmp7oKY=;
	b=lDQ2PyEVwu0KpU7XYGXjpRI10hrG52CbOxGFN86TIjNbOHKa6nA4ta9kDI6KuC71ZobC
	 mc37v+In4z8bXznwv/VG+FvNv4usfxNwbU5mKpSuXhCP+oaPcEQxhOxK7lYJjj04zduFa
	 Qlw+f0HECEQr/oZoeAf6e9H9WnlDz0DWaz/esU8bGbW5Ff76s05+CMXWjSv1S13CcJ06M
	 ZOTZuZBz0DXV5Nh/3cIcoZqZmfnBMAQU10KPUcJGYpVROKcyFG6WpZ9oaOSgrL6gLiTjV
	 TGt4xc4cievS5jkD8Jci+zQTkD60qgaGPkEtjd+wd48uGEifCOjyQOquzv5BNglCWcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=tt1abWDV;
	arc=none smtp.remote-ip=79.135.106.102
Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20E606A337;
	Fri, 27 Nov 2026 18:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B20E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=tt1abWDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795805789; x=1796064989;
	bh=1I69IFd7Tmg3JJp7yrDb8UavXsvpmNBRcQJmMmp7oKY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tt1abWDVcuelrzw0ckHimYagxmXUlWWuu9aRcBY6p8pEjOK+bpVH6pWym59j2Ro2b
	 H0oWHWySXq0boFQiyomIRyeILhCKyiwlBciyPqa+zhAtIR/cII5bWtTnwL41f10QHe
	 TRN7NdCeJN4HZ+dfwCgBk0LZzK4FqfkvZcMXjNnKmGafLlGA6RXl2bLQyEWPhCEm2+
	 x++44z5XuUTUMKHSc7RNxxmavxqIndXf9fL6AWaGSkkJWgtPGpX1g5HsYEcJb06AEC
	 nebfL2TV/WqV0B6rvMDzDpUqcbActC66hpuzu65cXvvA6pCf0Gzor8qVglx9BE6kfu
	 KaLn0kOI3wbtQ==
Date: Fri, 27 Nov 2026 18:56:22 +0000
To: martin@rfdeck.de
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 0/2] wifi: rtw88: honour rate, retries and bandwidth of injected frames
Message-ID: <semDCz-DacL4vKeB_8iKu6ZwI8pQDusEK2fvgerTJWRkQ1MAxvs0nX-lSJviX_LDplBuBKniLMaMy9FtGH2_EkckFD-LR2YY6pPSPwrTCk0=@proton.me>
In-Reply-To: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de>
References: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: 6a6e11b9b171aceab7b34dbddf497597b20bc7f4
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thanks a lot for testing, and for comparing against an unpatched build.

> Three cases arrived with no frames at all at the sniffer: HT MCS15,
> VHT MCS9 at 80 MHz with short GI and VHT MCS7 NSS2 at 80 MHz.

Thanks, let me know how the repeat goes. If the two-stream rates still
don't show up with more distance, it's probably something in rtw88
rather than the sniffer, and I'll look into it.

> With your debug line (debug_mask=3D0x2), injected unicast frames to an
> absent station report CCX status 0x80, both with NO_ACK and with
> retries 0, with and without the patches.

That answers the open question in the cover letter, so in v3 I'll
report a NO_ACK frame with that status as
IEEE80211_TX_STAT_NOACK_TRANSMITTED instead of failed.

Ping-Ke, do you know what the two CCX status bits (0x40 and 0x80) mean
on rtw88? I'd like to name the value properly instead of using 0x80.

Martin, may I add your Tested-by to v3?

Thanks,
Ahmet




Sent with Proton Mail secure email.

