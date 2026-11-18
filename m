Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088849;
	b=vjrLMHlj9KRdKKO0rjTp2FuPi9ymWEsW+amuUUF70+1p68i9b0K8Uq/BkG7dixqK7+3g
	 sv6xqOZXHTqMMFB3l+uiBH2Pbds0x7WMh6fgJ8XHSEWZFwlB5I1FNINuyay2uamwYwPK5
	 LHAZFBkD+OtCSeYjFQTFUugo9V74JBGpe4YJgjW9Gr43uBoI0UXf8ugibwNxcEvh385s3
	 sQaZhivyJRvPLjayta+HSeEh5simvwz5JxAqqUedXx5L//ci50cYHEq5scoM3Yz8cUokd
	 xgwaXIzMcVHybK0GE/WZSo22zhIjByslVRZA8OiAcRhrlToTb8gqduT+XL9+gQY/f/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088849;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=98SKtt0O8YAW/r5JqTl8gSe1Tfru2e5BqrZVYK5+M84=;
	b=LGIi94sLnBhJImk/WKBU6lleKM+Q9xFnzyb+x+aKxSmfYusu/AS5XEfoRP635Ic7kNNj
	 5Lpoa42hDgXryHLlm/RPu0n7JnsaZsFwRJio6F0ZAkB7XtFkSvIdw+jacN6cPiTy4p04X
	 qZX0PWeNDKllIg4mggKgIiDlaoiD6g6M256aNR5xMWqPx8jXS1RpAgsy8jkBK2IQ1EfcN
	 kPqEn1TBSs2jIc3Eb0kf12bfyU8YVm79nVLvomBdHPiVf5Odi9laYHcoJmxyr4dB2JVBc
	 61VjSv44/HNhcAk48jGNRI2exfyTrO+9ZJ3RYIFmHRRDugNDj4pysku33YshBoKMyUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=qcFepCOs;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82FE60A3808;
	Thu, 19 Nov 2026 11:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82FE60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=qcFepCOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795088847; bh=Qu6UPp+4lMhMx6ZN4zdAPjMEbnngDim5IZoh3sRHonc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qcFepCOsINHHdANffQyAKT5Ymjn2yK7CVues+4HEOL6aQp+1sGGDvgiLGkHbXr9iN
	 ZYzhlBNrCDuEiy2zolqaWmZ/QZSV2+OtBvD1NokTbG+I5nBII+r+I85RLeR4BaSgRC
	 JrhfeX3lZOtgG5Ap/DIvZCHCqzKoRoo8bqQs/NSOdXvUexDh1GLrYcr02NZLpswpj6
	 gpgxoVsWuAMayoOrZdlHBNSnuVD0JauPxC+XxMKacVzMO3+mV7F82QjlpnfRFSsn1y
	 k51nEnAxSJJYihxKblehzG2uXXqPqKC0MV7c5DUqJA/eEoMuGLFJFzufgn77/8NZ3A
	 W/4bUhoBg++YA==
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: "John W . Linville" <linville@tuxdriver.com>, 
 Sujith Manoharan <Sujith.Manoharan@atheros.com>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261118085205.1989547-1-mehmet.fide@gmail.com>
References: <20261118085205.1989547-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: free an unsent frame with
 ieee80211_free_txskb()
Message-Id: <179499513257.20227.841268565722172639.b4-ty@b4>
Date: Wed, 18 Nov 2026 10:45:32 +0100
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

On Wed, 18 Nov 2026 09:52:05 +0100, Mehmet Fide wrote:
> wifi: ath9k_htc: free an unsent frame with ieee80211_free_txskb()

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k_htc: free an unsent frame with ieee80211_free_txskb()
      https://git.kernel.org/toke/ath9k-pending/c/df24f6812782

-Toke

