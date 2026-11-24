Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479887;
	b=vy17C0KBq//qj7+ahC3BivcT8LKINUJAScFKgCG4n8gheCnTx48wytxNTIUoDgBe7pV6
	 aVlKFZeq7OBcOFp27QHK19CBKNM1X5/DH8mS8pdboBO1ieELLeSXcnA0ABWWSa5GfqZOS
	 L+kBjKjTMeoblj9CkJTlr1Ke4aiv4FJDNwtpFFCjmBApyJmRdSCThdN2uoN6FVmqnU/M4
	 4mR/rAIKQt2EHAlPVvuvq1JTIeBnRil2KaLzChLE6fKwfOLgy/jCtp+heHqyRa5IrJtnO
	 HyJ/SqWF32zF5zY0wR3Sj6BpxWxVEvpjBYsc9ekdhjjhA8MY2r5A+gv1rUnPPITB/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479887;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yGhlkWyDtC7SLCggn3zg9TrnI8Kvcx8WwQETmzZNSTg=;
	b=nk+QYYTmCgIdq+EeZp1V71FhuvVVBELM+VaJMXBbOIKQKmWYw7RGs5atfAsIbgTFXi5Q
	 9PujKKPb47t40ksvubTspOe4k0LyQyALZBEmPUGtKPdenkA6C6hgvP2xZXqJALRZlXoob
	 BSWwpizqy/DuOytQuSDAZ2U+FnLMPQpaSeZg81Q5LbbxTeRQ7Xf+Nn2EWV9LYFv+z4Oat
	 DbueyChCshFqRAD2ebfFHaDO5Cgf/CKCfKyCAbjCfkiujLuIwD+e+cyLEXKvUgRWKuGaE
	 YE2jA6OKgu+DDpVKZJC5OaW2TgonVv42UPusTlYxk+5ilB1+SxquvU0z8xtU0MOzCIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tFoStmYu;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7016606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7016606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tFoStmYu
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZLEk++sxt/bNuIsvPfZnIr47aRBPY+SnjtKozMvkvf4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795479884; v=1; x=1796084684;
 b=tFoStmYuHD8F4RUf18ulrSoi4h2iLZesKb/QdiI3KXFwGCtQdd1XRoVQh5MZMsZRTx/zUHM5
 ghwwGnH+K+EDnZQOJFddk/dIOC6zGUPgDbQo5rY7pjTDSXViYv+SfACJX3SCF0azQEsY81SIAov
 Dg4g6oUgqjoNckT0QeZ9ORwY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dd40ec3510d58e4e;
	Tue, 24 Nov 2026 00:24:44 +0000
X-Mizu-Trace-ID: dd40ec3510d58e4e
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Tue, 24 Nov 2026 01:24:37 +0100
Message-ID: <20261124002437.213112-2-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121193644.603289-4-mehmet.fide@gmail.com>
References: <20261121193644.603289-1-mehmet.fide@gmail.com> <20261121193644.603289-4-mehmet.fide@gmail.com>
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

Hi Mehmet,

Thanks for trying the shorter margins. One comment below.

On November 21, 2026 8:36:44 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:

> +		ieee80211_queue_delayed_work(rtwdev->hw,
> +					     &rtwdev->csa_beacon_work,
> +					     usecs_to_jiffies(hold));
> +		goto out;

I think this can still miss several beacon intervals on a kernel with
HZ=100, even without a slow USB transfer. The timer wheel adds a tick
after usecs_to_jiffies() rounds the delay up. A hold of a few ms can
therefore move the work about 20 ms, which is close to the whole beacon
interval at 19 TU. The next run lands in almost the same part of the
interval and can defer again.

With a 19 TU interval and the TBTT and tick starting together, the
timer arithmetic allows consecutive steps at 200 and 550 ms, even
without transfer time or a late worker. A station that timed the switch
from an earlier count can then move several beacon intervals ahead of
the AP.

Could the wait for the safe part of the interval use a finer timer, or
could we limit CSA to intervals the timer can reliably handle?

Best regards,
Luka Gejak

