Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795871362;
	b=wKnpo1S7Tn453I1ytcgiGGE1I51H2Z71NH4QTKLcIBEHTru4iG9T3uXoMH50urB7DniT
	 mLewbcVxv+uKanTEURoJyllKqAiAueLzZqa5uECkKO+bPsFy72XOL3eqvdzZiJOqS4X/M
	 KXybPiTaWFqhEsBh+fkP6pK7T2J8JIXIuUz089J/TBD2tCbrJdQUxEf/k4W4Y0Bz0m+3O
	 gjGO56Zm1kjIkMUq/MaZkoPDvyfUaIpKgmYU65txnnhmWSe4i8mRZy85V+J64iy3mgD3D
	 PNAeya2Tw0FwkDrbeIMuAsJbDZtTm+izU4NuADtn64vINK0qHYVhJSZaFE76at3UAVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795871362;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=RkFBDftSWSeXoHyoMZO410zae8B87vQ2YQXaCOtoDUI=;
	b=fGKS3/nCyxvSyLlzNIALc38ryXucXg/duBslzPFphFOi1ffNcuaMsMGwSQPAK1Xg5sGv
	 2UPSDiomv+w8kwxFX6Pp/Z5VDBTlCwkQiL/lCFwHJGoFMYD38SkrT9C3OB0A2QheKEoPY
	 MFZXNu+SQPeYAGbLwJWwaNrQvckTQJA/EzXzuSo9ecPordaMbtaEG7SM61jKBdAbcqFJP
	 p8PumnVSj8ekpMMwlsC6TSQjPTSdVgC+RzF2R45JxXvUwU9sRjHgaQQppAfF2lzuG9q3N
	 j0xWXIa4fafwybyW//lUwkek28Rxm0vGOFmNZWYJ1md9IGLmlkT11e3U3LBa7l6Uypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=Fatk6iIR;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820A606A31C;
	Sat, 28 Nov 2026 13:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5820A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=Fatk6iIR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=RkFBDftSWSeXoHyoMZO410zae8B87vQ2YQXaCOtoDUI=; b=Fatk6i
	IRt5ZP/RRqL++rlUwM2mE8QfroTW/Z/o+yif0GHwsy4eE8ETEe6B6lkzO+bWjFnAVsHrskk642ZY5
	mVZmg3hgoJFofo2O+zBXIKvXajMwczggLdpxz8bM+iB6KacRtuc28HZiWij9Kvsi1ZZmZkuozJiSU
	gc7r4sZbcECjrG/SG6wpBa8Z8tyZCi6nnClfYiIjJvBj0rdysRUITH8mXBVtYB5YopJv61Wn1b/2M
	MUv7ClD6JJiGDoTMYMXOx/BC/FP9ZM9DaLL/ss4GkfHQcKMfpvpz4YZxMhYB55CCdPVBO1/yWhZ8q
	qCbKtj4a0bm/3eDOWHeJ/gelvZ5Q==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xXIB4-0002C3-2R;
	Sat, 28 Nov 2026 14:09:18 +0100
Received: from [192.168.0.32] (helo=mail.your-server.de)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xXIB4-0000mL-1A;
	Sat, 28 Nov 2026 14:09:18 +0100
Date: Sat, 28 Nov 2026 14:09:18 +0100
Message-ID: <20261128140918.Horde.8QMYup08ZG5LMHxtcgKoZPf@mail.your-server.de>
From: martin@rfdeck.de
To: Ahmet Zeren <niko3x@proton.me>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Luka
 Gejak <luka.gejak@linux.dev>, Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 0/2] wifi: rtw88: honour rate, retries
 and bandwidth of injected frames
References: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de>
 <semDCz-DacL4vKeB_8iKu6ZwI8pQDusEK2fvgerTJWRkQ1MAxvs0nX-lSJviX_LDplBuBKniLMaMy9FtGH2_EkckFD-LR2YY6pPSPwrTCk0=@proton.me>
 <20261128113304.Horde.AlVGhIssVk0T26G9XwXTpD-@mail.your-server.de>
 <VlXplLX5apZBM3LPGxqkM1o7u2AvhUYD8YHGKQVhZo2aZhE5oLqDDEAP1nheF3fmtNHE3TCLvFSMhnFddrGV7PBF2z9h_kXHMHxX0BlLyBA=@proton.me>
In-Reply-To: <VlXplLX5apZBM3LPGxqkM1o7u2AvhUYD8YHGKQVhZo2aZhE5oLqDDEAP1nheF3fmtNHE3TCLvFSMhnFddrGV7PBF2z9h_kXHMHxX0BlLyBA=@proton.me>
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

Ahmet Zeren <niko3x@proton.me> wrote:

Hi Ahmet,

> Does your RTL8812AU ever reach VHT MCS8 or MCS9 in station mode, e.g.
> in the tx bitrate of "iw dev <dev> station dump" with a VHT AP close
> by?

No. Unpatched rtw88, the RTL8812AU (both antennas) as a station on a
VHT80 test AP on channel 36, iperf3 TCP in both directions, with a
sniffer and the AP side watched as well:

- uplink, at -54 to -63 dBm at the AP: at most VHT MCS7 NSS1, mostly
   MCS3-6 with one or two streams, never MCS8/9 and never short GI,
   although the AP offers SGI-80
- uplink with the two right next to each other (-47 to -54 dBm at the
   AP, -28 to -34 dBm at the station): still at most MCS7 NSS1, mostly
   MCS6, 0 retransmits
- downlink: the RTL8812AU receives up to MCS9 NSS2 at 80 MHz
- with "iw dev <dev> set bitrates vht-mcs-5 1:9" the frames in the air
   and at the AP stayed at MCS0-7 NSS1

So it never sends VHT MCS8/9, not only when injecting. That points away
from the rate ID of injected frames and more to the rate adaptation,
the firmware or the TX side.

One more thing: the tx bitrate rtw88 reports for the station doesn't
match the air. It showed MCS8/9 NSS2 at times (NSS2 even with the NSS1
mask, and "VHT-MCS 9 80MHz VHT-NSS 1" with the mask), while neither
the sniffer nor the AP ever saw MCS 8 or higher from the station. So I
went by the sniffer and the AP side, not by iw.

Thanks,
Martin

