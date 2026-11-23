Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430310;
	b=1mSm8EsnHLWGYgOGNvk4HXjNTu+8SiK+LwSYgwsYiOlrmU0q1LC3Aim7Qkytt7xEGQFZ
	 tAmgfiIOHnCL+Tey7QxnGG1T8d0m02q3vL1s9NhyqV1dFjmVb67q1h7QcVuVxPjQSIajw
	 ZSOgWkW24cbqngjOJK9pdrG98nW+2NM52Fv7keFSiI//vAwy64VRPyyKbzUpzphVxbNdP
	 MiVgBUi7q6x6OBMCNR4YLtFjE0AoDcGqx2Q9byUfKA1CBHpocF+bqu8Vk3Tfapo2ZJK/T
	 0fzsO45GoEbHuZkVRYrQ54SPXFwjRyxT4cNmOd+Yl7zkWEKJj+hLAld4k18ctnj5hAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=2VHu/JC5XgyvHKRJdSzzx9OUQrYgrLItr9VLZZP5ZNA=;
	b=AJhMeNkwjsNWsuwYkmagivtnV07t+ZcvH8ZCVkhxihXYty3xs4UdCgr0boclKGARCqrB
	 G/gjUzOQfsVAWqwY06XtJPX4G7QFfviULENz6pNvS4ZSiIZ5v/G4Wie4FhQMxicF8IG9U
	 JqQot+T8DJj3uEdcbYJz3wig0yFCP7wPiEe1s0FCnTB2L1oqaYb5pJkpR52YuvJjVnPPy
	 su/w8qi7YaZdsbKbpF9s8a2BZ03nu2LhmFYjo54+78GAXNdfmQ524mWTHCUcNAxx4oqqf
	 uTATQ4zIp4gLVo3VvB8EsO7WcoLOoKCx6vdya2mZsjUHzbz//4ltkwAIUuXDe4TN+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n05/9hYo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E04C606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n05/9hYo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5C81F000D0;
	Mon, 23 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430309;
	bh=2VHu/JC5XgyvHKRJdSzzx9OUQrYgrLItr9VLZZP5ZNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n05/9hYoHbNBfBogqxMzpFk2AQXIua91nr+370J6ne3/O7XcyTGuIA04j24VoeKLu
	 M7lTVD6z46dM+zz7vTbd2TP96vL59prilJgDpGlHkEeK1biFq4PQUxYOJi2zh7HcCa
	 M9sYzJTa6Nv7/qmsob8RX0LEGQrFL+GnLyzQOvogJBetoiNnwZ26zfyBhvhfU0qhAN
	 DH2aG4bt2d/sgDZhyV986R1xtH59sZEpRZTXbs5HfCtIzVGOc0OZv/ph2bBe7oR+P8
	 7JJITKG7CqWNTdCswCPKNcqT7Ic7poMZV1ETAbqB1dzKE8cDCTxUubM6ttxrQ19dqh
	 xpElD4mlNQVUw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 69D905FADF;
	Mon, 23 Nov 2026 18:38:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com>
References: <5DB6FB38-A5F9-4CD4-8AAE-7A3FCFF90520@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Belarus
 (BY)
Message-Id: <179543030740.976281.2095554195000523258.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:38:27 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 22 Nov 2026 21:13:58 +0300, RFAREAS Support wrote:
> The BY entry has no source and allows 5490-5710 MHz at 27 dBm, which
> is not permitted for licence-exempt use in Belarus.
> 
> Licence-exempt Wi-Fi is set out in Resolution No. 9 of the Ministry
> of Communications and Informatization of 1 July 2013, the list of radio
> equipment operated without a frequency assignment permit. Items 7 and 8
> were replaced by Resolution No. 13 of 29 August 2016; Resolution No. 1
> of 10 January 2018 changed "output power" in item 7 to "e.i.r.p.".
> All three acts are published on the National Legal Internet Portal
> pravo.by.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update regulatory info for Belarus (BY)
      https://git.kernel.org/wens/wireless-regdb/c/5ead4f45c79a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

