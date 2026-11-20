Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199188;
	b=xqZxGx9pB3EGon2SSvfoNn2/DZobFo8ZDhv1rk3JMTiGwAjLYqRQjHh7E5D2k/jV1e7P
	 g2F3uQ0sYAuQYrReSeGNQGtCA9YutVhXSqyRHNb3CzTJf9KvtBjmzM7dSF9zp8ttfmU1T
	 yJnimpMHSa+8M6zxOezrsYv7TI7tjPQMgrkWrMGGbGRabjkFzqpWD+0ZqmcinI3AWEFNQ
	 laxO6sfs1qxv6ZdpudN/HvMbrGauq5s+4aXquqhgWoOgRUbNK1jroc7C0k8vNvOOAtvFS
	 28FJspkCxmQXiDLZC2FVAvacgUc2h5JDt+yNf9UiZ7A7X9j5DTbJXo3vDU5UkrTM+6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199188;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VAmL/P3cbS7VpErxmKQCAD6JjHHgirS2soZqF2/4KsA=;
	b=HLE87VipbUN0kvkcUTB77MicJxL+pAVs+shDcvfVaJHNJJX/kW+AMahItpPjQL3VmwqN
	 Ljg7II+OHHuE/kxfz8A1SVGWYvBtJGrPKqWlu4oyYv2GPk0RdTOAx5aNfyaJR0BBRDf0H
	 AEYeG5jG3Cqv9UJJgJeJVtZ8mMqZSRZ7WDoRKQGBEVHzJYKKt56tX8BBgB0lHErGvrKRD
	 rw9SX5U55mhHSTB/WN8IOcsWzNhnJYvwiJoS4Rm3s52OyiT5/hWlYEaDQsOWTHN62HfGG
	 9ZJv0sm/kUQNdgXa8WlJzGOgB18yY79CC6lM1t/V+KrMOJHN0qUdryFqYLzHMNmx6Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=ZloQGlz7;
	arc=none smtp.remote-ip=185.70.43.96
Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480B606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 18:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B480B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=ZloQGlz7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1795199185; x=1795458385;
	bh=VAmL/P3cbS7VpErxmKQCAD6JjHHgirS2soZqF2/4KsA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZloQGlz7USCOTa1jA9CDu09ujSSbEjfAUfQ5bYloZFfXx2zNBVAjfiYqFHPoj19oN
	 Bw7WNydljEnToiGVBNB715xFN2wID5u5H8qt955AjJRzVQHrSsKdbChhqq37FJv35C
	 Y98ztCk/Nyawb7ViIFR/v90pqS/crAzg6NpeRzhOVmYHX8nQlXXewn/3xKaUTec5G4
	 q8xCa/GqgO8ZTprF63zCINndWq8amZj4sppotPiU58jD7rxQKwx+110ARjtMBrsGpR
	 T7x8A/KN1vnM6hflvAk82couKV4SQoU08Y/m0uzMp74sgi6wLrFDBhJKVuN1AZz3nY
	 pnQGr+czkQ+mQ==
Date: Fri, 20 Nov 2026 18:26:21 +0000
To: Farhad Alemi <farhad.alemi@berkeley.edu>
From: Chad Aldreda <ca@modelmiser.com>
Cc: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, Jeff Johnson <jjohnson@kernel.org>, =?utf-8?Q?Miko=C5=82aj_Pisula?= <mikolaj@pisu.la>, falemi@asu.edu, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ath9k_htc_tx_cleanup_timer -- ODEBUG free-active-timer and use-after-free on USB unplug
Message-ID: <20261120182614.1799276-2-ca@modelmiser.com>
In-Reply-To: <CA+0ovCgukr_PwQ89iC+YW6FC-m==na4iW6fUkiCM5xp09PMt-Q@mail.gmail.com>
References: <CA+0ovCgiXX28Mdyu5xA4mDU2pPwoByEzEKgLn5JnfapEKg+PmA@mail.gmail.com> <20261109103444.381459-2-ca@modelmiser.com> <CA+0ovCgukr_PwQ89iC+YW6FC-m==na4iW6fUkiCM5xp09PMt-Q@mail.gmail.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: b9b8f21f17340fbb88510707cf31a2a160286643
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

Hi Farhad,

Thanks for the reproducer. It hits neither of the two paths I guessed
at. It withholds the reply to WMI_TARGET_IC_UPDATE_CMDID, so
ath9k_htc_update_cap_target() times out in ath9k_htc_start(), which
logs that only at debug level, still arms tx.cleanup_timer, and returns
the error. mac80211 treats the start as failed and never calls
ath9k_htc_stop(), so the timer is still pending when the device is
unplugged, and then fires on the freed hw (the KASAN report).

Miko=C5=82aj Pisula found the same thing and posted a fix this week, which
Toke has applied to ath9k-pending:

https://lore.kernel.org/linux-wireless/20261117103918.33701-1-mikolaj@pisu.=
la/
https://git.kernel.org/toke/ath9k-pending/c/176a947f3d98

I haven't run your reproducer against it. If you do, a Tested-by on
that thread would still be welcome.

Chad

This reply was drafted with an AI assistant (Claude Opus 5.5).

