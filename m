Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886148;
	b=0RxgBjklwZQiMka3ecBuufl3pZn8YzxJLFAGEc4mLtb3sDSkl0nQcPxAc9eRb/V1l2FX
	 vSE73qb4jT4ieEDM1yKGCTUWDgGWbax3AJnFK041L5QND88XSoBwktlY6kjcQrdSVBY7w
	 3FC0uOJ48tMG6YzphK9yB6eAsfjNUklDMk3PUEAjofAKRm4AYz3TtanwXyoZ7Lo5Flaa2
	 hJVS0mMm7VadkOuldo+tInZDEqz+hnxeHPvHpErgHavj4aeNDKUTU1tqvo3dFKOkCrVn3
	 k7Z5WR1D4SJmLAfR9vQetsL8pl+xf5QQF4rppOpMU5EvVeDfAXl78NCup4ZaABSgXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886148;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oqDemX6ZwjJ1i6EL+hJchHNeErURI1NTJiCawPmRbL4=;
	b=maX+mCQQPgDeEO+z3wiIxY0oa7Jn8hwB3f263KDyBiH01RRptrOcDnGtngO/JnzlleTD
	 CQVnU40ZD5RFYOAopvLiZ+S/recrOUwp5nx6xzVDCjIlhshYnIyXwowhxhFpJOKvgqrNV
	 DGHTN1RRZ8/WO6bhpt/Q4vRdZaa7VDcf5Wl4Dzgk931EuTsv7IT+oFY32pRnxvTtc+MiZ
	 06/1N/IBTLLaLeT4SdgqKqrFa3EOWj8tR5mXbQTJu8OKdIWdh518zNcE5YXztn7RrJiQF
	 9O+X4QX62WWYp8DzpBXrmr8Cdj0hLeqC1KCB2lUoC1+B4nBSBOsG6dFKilvV/qz2bYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Cs68EPJy;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB9606A324
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 17:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CB9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Cs68EPJy
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oqDemX6ZwjJ1i6EL+hJchHNeErURI1NTJiCawPmRbL4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795886145; v=1; x=1796490945;
 b=Cs68EPJyuIZX9t3Dpp60ahWgHJL/k1hg6kT16PVxXMoRPYlbHYMWNXthlV0xukuicE+5VIp9
 P3myz1ZdA2FEkyefQammwGg8ku7utM7ABqLC9B8EeL7AWRkix6ldY4m54IgcdkwpJcAPW3aCoyw
 CWl/05tZBwFnFumv+AstjeegUpuCtXfn7Rg+ug2AoRETwtinNnvOZ5VvWevsONpqobovX0wpxnG
 hnep951DAviroMEmH/sPzxUB+EyYe9mOArVz1IbDCfQa0vx/F3+3xeOatQlqChHL/mzxyod6lYm
 897QQrEcwkfQMbhW5qkpZgkjq2SfmkoM/rCCwk42Emk7A==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2901eb0e4d21435;
	Sat, 28 Nov 2026 17:15:45 +0000
X-Mizu-Trace-ID: a2901eb0e4d21435
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: martin@rfdeck.de
Cc: Aaron Beckendorf <albecken@mtu.edu>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: connac: honour injected HT/VHT rate and bandwidth
Date: Sat, 28 Nov 2026 10:15:34 -0700
Message-ID: <20261128171534.98125-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
References: <20261104142737.186484-1-albecken@mtu.edu> <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
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

On Sat, 28 Nov 2026 11:31:58 +0100, martin@rfdeck.de wrote:
> Maybe set the fixed rate for all injected frames
> (IEEE80211_TX_CTL_INJECTED), not only for mgmt and multicast, and take
> the GI from IEEE80211_TX_RC_SHORT_GI?

I have patches on top of v2 that do both, and they also cover legacy
rates and LDPC/STBC. With them, injected unicast data goes out at the
requested rate on 5 GHz too. Without them I see the same as you, on an
MT7921AU and an MT7922.

I've been working on this for a while. I'm doing the last tests now and
will post the series with the results soon.

Thanks for testing,
Devin
