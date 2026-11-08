Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=152.67.88.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098745;
	b=2TxKOSH7uRSKx2WKRvrxAgsRGhiJZBofjwwYoUpw68+h2mZbbzlc7eQf6tz53ZvG+mPy
	 nmFY56DymFU/9CTEBU6z3w921lzQz73Gnm1DdAwUGRsqdixNycXpExjKHWUpnh2d6pDqA
	 0PYrTaWAQkC4u0OL3ThfkNHSEP852kfwnCP76j4n6ypsjfl8unYEZwGRSB6aH6SsddFCy
	 70yijg8jnNISsTkBYO20y4eA9ABBVZgUEtLdP5m3Qzqh+fRFaFWVKLQNzSk0jwl+//gE0
	 vltLQ8oP21FGmELE9qIfSjksrDE3H8R3khvEmczl1PTZZctQfYgv786712pnsmUlUTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098745;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-Instance:
	 DKIM2-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/R/Zm+QxroQvLAK1Fqfpt+hCcUE7nMMqtwRoKXNN4X8=;
	b=viBaJWPt0M9CMuRP/5T58qnxaqkAZOyK+wklZjkoOpKw9Z5IswBd3jHw1nN/PDPB4iIz
	 n8yLs10dXld0KVCw3SM9g5RD/rnaC49oZnB2F7WaPJypXHxfDBKU/1bVk3JrwYCFugM77
	 6VQe9d0iCQtge8fPnrK5AfXciKe38lReZimpnTko0UZYZpHTxBMMfMSX0HMEN9K93+ul3
	 KHK2UJzDYcmaF7p1HYx1dk4tRJoD0H6n0oNwray4AenahDFDMKnVX8jPUqHawv/CUxhny
	 76TL6evgjC1FRt7m6f/awcUW9QB4P2WVamXtsRqZA1cb0aCWICpgSArCZS788ohLVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cubiculum.net;
	spf=pass smtp.mailfrom=cubiculum.net;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=SessLvNT;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b=NoMQQfE0;
	arc=none smtp.remote-ip=152.67.88.11
Received: from mail.cubiculum.net (mail.cubiculum.net [152.67.88.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF8606A326
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 00:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CEF8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=SessLvNT;
	dkim=pass (2048-bit key) header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b=NoMQQfE0
DKIM-Signature: v=1; a=ed25519-sha256; s=202501e; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794098743; bh=/R/Zm+QxroQvLAK1Fqfpt+h
	CcUE7nMMqtwRoKXNN4X8=; b=SessLvNTA17wmRAVkSI2Wnau/bT2Ujn2j/3JPvI5UPGiLAy6cS
	8k7LVLcGj124xiUwNEYQ6m5n+zgCkTB0p1BQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202501r; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794098743; bh=/R/Zm+QxroQvLAK1Fqfpt+h
	CcUE7nMMqtwRoKXNN4X8=; b=NoMQQfE07FKoC8w8gsSNaNyOOzv0VHXWf2YxSBskSRTDRqzf8s
	aFqg66EzGg2NEbzxv3fvOX8N4W0bV98Sr5qMhsMlHMUTh2RbGFFH35cua4XT/EF7KRpeC14EFVa
	CwbUha2AJp6+zqTp6dIrKnd9XYZdJfdwbtdle+H5eHrQtws0y+wVTP5hNU5bBqtWA7WFx+NByXa
	R8yFceFkQEh17iULkBUuHpVJq+uAEBpCSA+Rz+dItkHDcOhgzcKMcNFpkG2GBhfeDBkzeH7oKFg
	p7Cc2UYEXg0eZQLntTV9ivryrAJbU6msq1UUMrWREkLXgce/SUTbMQ9GUUbiEs2ViPQ==;
Message-Instance: m=1; h=sha256:SzxZBJottE2HEh/IXn9bS8ydZmCkWfTcN0dvxXqr
	+aA=:/R/Zm+QxroQvLAK1Fqfpt+hCcUE7nMMqtwRoKXNN4X8=;
DKIM2-Signature: i=1; m=1; t=1794098743; d=cubiculum.net; mf=PGtlcm5lbEBj
	dWJpY3VsdW0ubmV0Pg==; rt=PGpvaGFubmVzQHNpcHNvbHV0aW9ucy5uZXQ+,PGxpbnV4LXdp
	cmVsZXNzQHZnZXIua2VybmVsLm9yZz4=; s=v2-ed25519-20260926:ed25519-sha256:2ORe
	Md0TUTddHb0okW9sWYvZhNB8FvKMJNbN6ek35lducc/lUul7KtKz8eP3E0HN0VZ2cesaONtk
	Z1dmzU1EBQ==|v2-rsa-20260926:rsa-sha256:M475VRxjRrcuAbkjold0VhVeGJ/QqraT
	BqjWwFKKP4hzQ1a6uNp/fivWl9Y4iiXDmyYWCwA9+vsi6EolTPsDRcbF2JXK+80n+8no4IH4
	anNOSs1uPsvD4RH+bbJEjuPFXjrjHkGVmD+aoTnYMS1ZQatHCuvbOlcmh55Zfy2EV/WLkzvz
	4wPYID0xjeaHeVPLS6kOM0Yt7AS+KG6rlGIR9p9k+FXT63AZZKwk7HOpfxDlBeXG4inbKAg+
	KtCHgfAvmoua3hmImH87VX82gQxcbyJyGltiGiBBzlH9VV1Wn7RN+sKzvMea5uWX5+SdnHqc
	Wv97fc2+DR77sUJSjw7FBg==;
From: rcfa <kernel@cubiculum.net>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mac80211: deauthenticate on stop if an association just completed
Date: Sun,  8 Nov 2026 00:45:36 +0000
Message-ID: <20261108004536.1897266-1-kernel@cubiculum.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101201251.1106968-1-kernel@cubiculum.net>
References: <20261101201251.1106968-1-kernel@cubiculum.net>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johannes,

I see this patch was marked Rejected in patchwork on 2 November, but
I couldn't find a reply on the list or in my inbox. Could you say
what's wrong with it, or how you'd rather see the race fixed? I'm
glad to rework it.

I sent it for mac80211 rather than only for the driver because the
end state is mac80211's own: without the change, my reproduction
warned in ieee80211_do_stop() and then hit a NULL pointer dereference
in ieee80211_rx_mgmt_beacon(), with the rtw89 fix already applied.
The rtw89 side is posted separately:
https://lore.kernel.org/linux-wireless/20261101201344.1107256-1-kernel@cubiculum.net/

Thanks,
rcfa

(Drafted with Claude Code at my request.)
