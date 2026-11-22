Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305832;
	b=rZrdGTclmfDQm2ZwenxDbPbyb90qSXMOq5oSibNCR01GHv6NqQwUdQaJQNACuxzaX1CO
	 lRp1+MJjs6Fbgw8I8Cavcx/yASwbN4jAWIt7ZY08FrMB5pWmHF0XDu0dqO4bOTnaffMoP
	 kcSJ3AOFL5B4WZwMZbQcZlNKsMdwjf4leKsv/oxVvR0lX6/ERu097rtPeAGui92h7x7Ey
	 8MZmwQZNy7ylrCHv1fun28FyCfZG8qImJap7yDGms+aMUSWZ8tVU67pKtaeBw6BkbmAjF
	 dO44LIXsPuhr7C/wHVpxVfNJK7i6+5XdtpkEH7w1WRnCriPs6snADCsou0WN9Tda9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305832;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uERbU/geEoE2PYgfKwfjPiCmNxKQAB8yo8pTQ9hqQUo=;
	b=5VfXb4P1qXEEMEcA+M5TlxrJ+V5OJn7gLC3288e0uRYJywb5WTI7Up6PuIe/qe4rEgB+
	 Rile3qu+ggfRc4N/DIgvKUGAwcE8/Ic+1Yji/W11qxkfVSLnd6sfPnU2XyUbTaJ3oYiTx
	 5bFOZ1O/7x3avXNs7QoxyZFOBRK2PBOyPahBw/W4ejbSCxQBY0m8hszp4kB0oKeYci7oC
	 NQTHDZSjjF/t7qs3P77eTY+rQ6FZ7/q5ZgblMzn0Uc7o2u3HsXSmvFMij9yA7AbXWiDef
	 Lif8d5oVIZPrgOzC1Q8bfox6oCDvb1VAoKPx0vEGk5sx4BNwq6vrMfFe5RvM2gFqNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=FC24UgDW;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43669606A320;
	Sun, 22 Nov 2026 00:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43669606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=FC24UgDW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795305830; x=1795565030;
	bh=uERbU/geEoE2PYgfKwfjPiCmNxKQAB8yo8pTQ9hqQUo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FC24UgDW9ZdHqeND4k4FtPGc3K9P+zl44j/UbOUS/XXh46SInKVTe2QtWkE1ttS1W
	 pl8Bp+lunug19cm703+MJpwpvo51XVP9xqUSjuSDbztxqx22O6SDY3b+jsoCJruQVY
	 W/mavRVf3aCllrO4Ndfct3/xqNMmjXLrmwlfMaloma8mNGc3GuU+0nbc45wieqzM3v
	 TXSGMHebY1Clo9nQRN+Hm5L9Pw3e5akw2yi7bC/QMOREp/WYsOkbuEvM8/UZZUMX+3
	 qa+E6rlHx1CyROmg6Ypu5yQORKaRuBhDg6Z/7f+wb8VknU1l/y3ObWEe6jq4OPif2U
	 MF/8GEnDHarIw==
Date: Sun, 22 Nov 2026 00:03:47 +0000
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in dma_buf_io_ctx_create() WARN path
Message-ID: <2xySoxkTOy_cwwTsVb3MjcYIN2J0LJftOab-bhMICCuE_LxaBfqRKUCBOrBQQpQeTBzizv3ci1RqJH09_VL9RbAFk9n8dvQO9YaWIoIT7tE=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: ee864e9dce6eab20a93be49bbc81f89a7859eb0e
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

leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1, pa=
tch attached)
