Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844430;
	b=gItG2uACjjjQRameetF1+EPy26Yn9xeW/kLx6UhHOOE12HVqm+ebAvz4Ms6ZhT1qtEWA
	 AnE0lJA0BqMMyWNXjzmjZJksHR7IgRdZr8TxvOIB5okzyDefNNAqw+fhX08C4dmb7txJg
	 j+miI6wBiGlB29HlbvboX3Uf5EQyBrdzyZwyZO03MxwyZwdp9sMY4AT7yKSE/U6XNurZ3
	 yHia5aGwp1eE6akYNJDIPi/6pTXwRsVOGg5pUViwQVjf4MMZ9N/rfUbyvzqE0vqI+lsWh
	 pSkiTIEXGcY0Cco0nCwG88O0j75fQRf+l44RO/RkvrPo7Bi6oQ9Z3qwDppvVIgjEaGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844430;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XggxtMr34MRF73x6jxhSBCFkQOKWAeymLo8UC/eeCrw=;
	b=mwjcx2g9oUTfACkBetFSU3+VJtwboAWW3eV4F/tijuILBj9vg39ITE2K+QfRdElsbfYh
	 Gcz4w62yDaLRQWLKMxvMQIcGzUAu5suLRba+QOrMxYUOI8U9U5dKUv6RchhHkQzqYfZ1N
	 /my0woq81cbG/JoKRNGsiuhwERP1u7IcFkBOCb2ZqlsrLEJYDIQatZxmv82SOFi1C7btD
	 tkXjm2B+MSn0rxsJPM1LW+/XX6H5+dInVjLTIvvwwnN2k7nbBxEdPvdll9NQIl7gJXYnG
	 23oquS/kVicpDWHFueEbYT/VDOJC6K1+4qEWT4GfDvAtvu4mtezPAlUO5pDZft4QQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=q1Q3Dlh0;
	arc=none smtp.remote-ip=91.218.175.114
Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08094606A8B6
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08094606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=q1Q3Dlh0
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XggxtMr34MRF73x6jxhSBCFkQOKWAeymLo8UC/eeCrw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794844427; v=1; x=1795449227;
 b=q1Q3Dlh0n4zHJx48FGdF84yBRH78lR4So50AGsRvIdzTZzYKd4g4L+kMyaFIKSGeNzSu5i8V
 dNuuq5o0+QJu8aShXMWyCifOYDmLvybNO1wHzHfHhYlPMgO33nCi+TRfn5UMsvs/vc09pcEOJNW
 aO72iimbhH6LZXhLY5821h36e6RZbn793XebUJ7vCOaz0SP9vE4Mx6rRD++uV2WfUVzoLU27H5o
 mAnBgS+CEONKVAEgDTecho2buL1huLoumgNuyDiYXupds0+qqrg9ldfGwjGdfVp6hodBf96ii/8
 4RK+AK0zlCUQ880ym3wbIprPFOmqOs7bYiaEWxCp+T6JQ==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44fc32e2ddb5c695;
	Mon, 16 Nov 2026 15:53:46 +0000
X-Mizu-Trace-ID: 44fc32e2ddb5c695
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Martin Moosbauer <martinmoosbauer@vivaldi.net>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: cfg80211: don't call CRDA for a country regdb lacks
Date: Mon, 16 Nov 2026 08:53:39 -0700
Message-ID: <20261116155339.6127-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060723.37130-1-lucid_duck@justthetip.ca>
References: <20261116060723.37130-1-lucid_duck@justthetip.ca>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Johannes,

I see this was marked rejected in patchwork, but I didn't find a
reply. Is the approach wrong, or should I change something for a v2?

Thanks,
Devin

On Sun, Nov 15, 2026 at 11:07 PM Devin Wittmayer <lucid_duck@justthetip.ca> wrote:
> Connecting to an AP that advertises the country "EU", seen on
> Vodafone routers, looks up a country that isn't in regulatory.db.
> The lookup falls back to CRDA, nothing answers, and the CRDA timeout
> then restores the world domain and drops the user's setting.
>
> CRDA has the same data, so don't ask it for a country that the
> loaded regulatory.db lacks.
