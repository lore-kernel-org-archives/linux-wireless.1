Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088842;
	b=3OW9jBB/Eg+aUIbfoDQcV2QD7pe3aXTXW1u/+wVHICC6RfEqhzUFOdCbsk54brVsBMcp
	 TC6nwoVMXl3i1W52CjEdMz3nBFUUhAIhIMbXHD8/ugdEPfRRGJtHutdGX+drGL/tvLdHN
	 x1yIs7UM28I/ugDNwUfWip9SPmEGuE0ejluxHhYgDRUNi8Rd6mHOy5NxB3Z8OMI1JrLLJ
	 /exTEF2bDRIqO9HEeC0hUCAq8OzlER1DKlhBfdlItu5yBmGcBJhSXu8PyWbpNYH+YYatJ
	 0beotPPSFykI7/wYxJL1PcY/stnZcAkpHjKp3JjCUcLbg8ClDe1AB3NV4/j83H5VJEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088842;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hyCFQzJqVUwhjzUSoJbQ1XoaVWzFyoCSL6/32Gsirqg=;
	b=B14thveBT4S9J+eoBOyaWZfk6IjzMI0fUlcHWHpk/Mw99XxgwGkwOaNSJvtTgQoz4mph
	 cLvTE6vm5FtFjJtW3hWeAiOpGd0sPpBK3wEEtg3g/0hxq1ZSY8etkIbFOrV0aV0886AfQ
	 nm5TyeXjpkyat4KeVkCqWuRF9wjCRdZhn4sXZZR1sSeXKDUxVgFKOkvGI0iWdprvG1SdV
	 jM1ut69KtY/NaBKHU5ImOMgI2uXLOwxmkwCeNCqxiwXw8WE2Y6lfxnWI9b6xCn2TfkaT+
	 LRXQZzsmKEYPlDH1y950o+2FnTGSnHaFzyCg0UypHqGB0aOfGMUm699vQgIkeb3CobA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=YasjsbTw;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0732860A2611;
	Thu, 19 Nov 2026 11:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0732860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=YasjsbTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795088840; bh=H70Ws3UQrCcFE+fsRhFVlAiG5rWHFDMtWOWKdv4VaHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YasjsbTwefUnvb09v9xiiahlXludV+1hCn4KLmPklASjUIPXxz9Uiyeqe6kmpc/T+
	 KOivR30x6Xt12itgT3knoIVKmlu2tPNkb1M8YzU0i5kNxmOMV3P8g/MHADtOniUqCr
	 KQPCjBKAtBab+l49uBmN6E8jVvsv2d8xqu489kr6JD/ZGx7Q29Rv5WcSRoGTq2LZUu
	 XKVhYBAy4rVTzZuhJLt7rDpHRdNFdJ45LN8Dd9WaRxUbaXkRBoUFn+pqEuKFzBMtfj
	 fhzmryOzQ4UKn9tDfcAVOxDDX5u7tIV7GEW9cbmbGy8VZyW9oek/YXo6DHvrndg1iz
	 tGzjPTh73Liaw==
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: "John W . Linville" <linville@tuxdriver.com>, 
 Sujith Manoharan <Sujith.Manoharan@atheros.com>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261117071620.1650281-1-mehmet.fide@gmail.com>
References: <20261117071620.1650281-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath9k_htc: count a frame as queued
 before it is sent
Message-Id: <179490486252.208602.629448781380032997.b4-ty@b4>
Date: Tue, 17 Nov 2026 09:41:02 +0100
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

On Tue, 17 Nov 2026 08:16:20 +0100, Mehmet Fide wrote:
> wifi: ath9k_htc: count a frame as queued before it is sent

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k_htc: count a frame as queued before it is sent
      https://git.kernel.org/toke/ath9k-pending/c/666c1149872a

-Toke

