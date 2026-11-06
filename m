Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982402;
	b=WpIzMbk7vENAtzKgFpfqWq15Vn3Kh0XDJdTfArMvekgxAo19NsK/UaSa90qJtn5mpdNy
	 rCysE/q5tzTtkF1eevVmcrVxVLqCyR00jm60QmK95YdsgSnHQo7a452DckL6M2VKIsGMH
	 yJSbqVTsJOJs39U6fGrW/mKukI9Uc8pCf571vmn10AeHDpOcZurHCRWnsZbKlKuJkRycu
	 dqrZetar9VNu8nHmkq6bDMWpGOmLLDMdSM6hhkMCuM5bL+7J7mRty11j6xLCGhDCRlOFp
	 kDjIjQdRxtlj75jBRL+QDmWi6+S783/PVoV8zF9BeCRbC0yhl5Q36cmpOpEvhQsbeHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982402;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=alpusfvoRT6oGudZxQ935EuMdR0/lgYD2O3y7Q2/aOU=;
	b=s9KlJeFb7cOaoLY/BMInZynWACcu5nngiY1nT5lqIC5BWxNJgtHfKdJVp4IaRt0V5ubE
	 bqvJERJyQB7XMQZ3UGrpTjAwVRyQq9AFcTHyo/HPkYuehO0dElz+2CcdzfZt0cmEieWlS
	 FQlgeru9ywSH2yyNIQhyt/j6zGEh4YdxxLEqWrT0Yj3hT8sLsm6ec391aiuglFkfeP2qy
	 sWG0wLW88CuO8RyvSeulLvLvBxopz/mNGkZabL1Hg7PIKVLqC+Unh/Y44wbyfn6WtV4kd
	 OEVkr9vSShXPMRAjAt09VkW2YhKYaJ/Pp2zde9vSoTxgE2zbnyzPUhjsAgNPJUmGiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=GvkWpRNq;
	arc=none smtp.remote-ip=62.149.156.87
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADF606A326
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 16:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63ADF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=GvkWpRNq
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id PMlrxiLs36q8sPMlsxN6DK; Fri, 06 Nov 2026 17:26:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793982392; bh=sim4+jHEDkzlQynoThIqdD5EF4G+P38YL2QhJLOrfBE=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=GvkWpRNqLmOg8IofCD2s9lZRWj/4k9cMomn1ts1tkJSDiFDXXWx2KZ8wy0QBGnuFL
	 V3jScTjmFU98fQI7g9lxureRJ8ZAUmgMkhJUVgg3Bd9yhT5PHnhF8ZO6fG1drwbRog
	 lZjW5+yCuEfFTpNRlA2a9l6Q6PnYTPoZym+o71Pq5NfBsgk8pwtJAdkok5b0Iafh4p
	 3J/dBtpnIS8k6XsEiVpjcY/FKEv0eh6XFaST+bdZDjur0lwy3mAeyYqEEhprkSNFtc
	 cpNJVhL71FpyW/SMGIQL7xUr8qyNi1BnAHppxAy6XE7WvSFDtplObFkQm4dmV/fwnK
	 nQSIDXF5QufHw==
Date: Fri, 6 Nov 2026 17:26:31 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org
Subject: Re: [ANN] I will stop applying driver patches
Message-ID: <20261106172631.00002d25@mythread.it>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPmdhScLU8zXQ6KUh3GdY0jYotXfuhLuYqQi6R3fqwKtNZhyy4XkOfHgaUk36fLA8HIbAUd0Pk+cUg1IXNwau3LRjl6ltsQXqs3Pb+4y6nwzcYoeAHNO
 lwyvgt9x7a8qhxV09llkvWwVL9QdCngoNVYyS6QcoLjSJX5x5Zs4MvxqjUxd+D7iLItaoCg+ys2k5tciSLhNTcXdWGiQnXH32JUNN5LP1T3Xn+g45ROoACtH
 QwKKKOnoaC5rpK8901kGlA==


Hi Johannes,

in defense of the people who "send patches to decades-old drivers":
Those drivers are incomplete/buggy/a pain to deal with, usually because
of the poor vendor support or totally missing documentation (no need to
name names). 
A lot of people (I am one of them) have had to deal with them for ages,
with great suffering and little hope of ever fixing the situation,
because of missing developers interested in fixing them / no
documentation to start from / no time to reverse the whole thing.
Finally today, with some assistance from an LLM, one could hope to have
working hardware with Linux, or at least try to; it seems then natural
to send patches upstream for review, instead of keeping them private.

Sometimes, even with an LLM helping, the work takes months.
Sometimes, the contributor has no idea of what they are doing, and
I get why this is a problem, after all maintainers are not review
machines.
But, there has to be a middle ground, maybe a small overall quota per
merge window would push people to self-review their own work more
carefully. That would avoid creating perverse incentives, like
forcing people to give reviews, with the risk of having people give away
random Reviewed-by tags just to reach the required number.

Best regards
Alessio

