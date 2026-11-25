Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589830;
	b=Se1Uzm2Q2XvrvB09csF6jjNeLcXGfoYywwpi/LBoGBqR9KbbPcEwTXDy/lm6OpCNywvB
	 b9wAN4TuPHIwGsNRouLBZws2eeosZ2FKXVQo2Pmi2K+YL2t9yf4TNxlwvP+VCk3fcuzcB
	 QwF3DbC9XRxR4PEso7JGZnch4QYDbUpBvcYg4FlRQJVWg7iQPw3W3H230YUkwdf6AvYNb
	 QuywDCeE/oNvMBGwITDVJnkhLA5eQxi4nwtAQT/gkcW5jGPX8xwCqxfXJLxBtfc8q6tO/
	 U9kaIrkJOlqyOfxrIOgOkiXNKLg0kHvtdAzA7dm9Md2rwYjhcTVfHupZhIN4GLWVDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589830;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=2K3Gpjog7dE3wUUr+vqWsSLAuLG90clvYSPo9/+A/+I=;
	b=V9/1ZY4SwgybHT4g4Ev6ejcgVoK7CX08OuCaTY4/RENJAz1tFKBTbysJwlc5W/ShAfmC
	 59+gkUyUUzhZEo1gsAzduCxR18xLCNNaP3Y/V/mf+/frUshzKw2xTZduboQ+DG/yPjrwg
	 K6P5T/qg/ENQDJOqoXVkZd3YWRv0KUFK6JMYGvX6BNCTQldTL7+iT3ctrkyl3CPaLO5ZF
	 /VHUl85xd4aH7We4hyREU3vVeBFQHPG0kwgvb1YI130vS6sXmb6lmc8PgvMGBr2z/T67x
	 TUX3rOEAe+unlRNs90q62CBVLPCWqoe1jGiSjcMHnDkdmUHsBkT3IYsv+QXUxo0DKqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=mbumZn15;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88668606A329
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=mbumZn15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2K3Gpjog7dE3wUUr+vqWsSLAuLG90clvYSPo9/+A/+I=;
	t=1795589828; x=1796799428; b=mbumZn150Um6FZrX7Gs+BJ18Ey7N8NvMfysPsttkPOdHXW6
	Nbenv22HqR5r1em0Wnzr5xT9309tkMZ1oTCScde4F9HI7EH4qB70A5B2azj1YoB8HuVikIoDdyLcz
	6fSEfmLr+e3Mlrsw55MtnWBHFR+oElo6mtrgRfkkMbjf2C/UmJG/7ftR6dYGBb3u3F5wlL5kLb5nz
	gYvSK/y+vw/lZ7qgb8JwiWIXMxXe7ht9pVwJw2lHj1IUOs89x5mkaGfJ8qpRZSswAwFJPIvWvTtbc
	t+8RPfB02b88wOXDgnKxTwHhFNW6zz1wdQnc5A7JwqHZ70q8ROe6/lT2lo1Qsq4g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xW6wE-0000000DfZr-2IIX;
	Wed, 25 Nov 2026 07:57:06 +0100
Message-ID: <fb3146025af37481f714a0803708fa4eba90d6cc.camel@sipsolutions.net>
Subject: Re: [PATCH wireless] wifi: mac80211: wake TXQs of all ACs with
 fewer HW queues than ACs
From: Johannes Berg <johannes@sipsolutions.net>
To: Jason Self <j@jxself.org>
Cc: linux-wireless@vger.kernel.org
Date: Wed, 25 Nov 2026 07:57:05 +0100
In-Reply-To: <20261125023259.820308-1-j@jxself.org>
References: <20261125023259.820308-1-j@jxself.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2026-11-24 at 18:32 -0800, Jason Self wrote:
> _ieee80211_wake_txqs() walks only one AC when the hardware has fewer
> queues than ACs, but __ieee80211_wake_txqs() selects TXQs by AC, so only
> AC_VO TXQs are woken. A dirty AC_BE TXQ then waits for a later frame.
> With vt6656

There's no such driver. Either way, don't let LLMs write everything, the
comment is meaningless as usual.

johannes
