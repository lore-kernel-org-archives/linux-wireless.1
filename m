Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088837;
	b=euk0guu/2HqM70qIZvV/RC+Aigp4lfPH6Gb7gTI8NQRKxz/59W8U4tCsCNYS/542chxL
	 qcYNc0HQQFwGScb2El9wczIGjZfuU1/vqDmLN6Tkt9HunEL/12XAEriXAhS0ny5gbpR6e
	 1yFIZ8Gg1A/6xUaYTI2RjqZCv0xhwXII2In2F8+C24QiQppZDbnx/U0iVdp6BBXvLcst1
	 bxuyspON5UICxMJLcmvNtD4sQBhFeTe+ttcHFAmL0qnJAzqoLO0RoyAG0RaoahaYp21cF
	 /uFrRErd3Ihud+C8EaZU4VdTutJXr3I4Sdxl9r4Rc3GlC/ITx4QAhmN1AYo7T/2Iwgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088837;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=f4yi7Fe1hv21Vrp66F9o/4KM8hDCSEezf1sLeZgEqr0=;
	b=Lo42pJpOigxD/tDKpcYtyc1qkRGUHc1Ggbo9jpZ783eRndNpZMD4v5MDsvxatAyG8RXn
	 cYcvPspcR73stn4t9vkZcHEAVj707nckjwptTRGndUycURcWK+aDcIOsMJr2CiwlpbwMN
	 vcBr+w7UcNy1OjykbvAK/ofdvOVo9MndDa4CvqzBaAJXMHbUL1vJOWIOB1/PxSepqwwly
	 dokvNgrzk1PEboQMDFlCSQ4KXt17JD+kDiFgibKi5zdF/72kJODVQeEDGkxhu06BTg1Jr
	 rcBRqfz63A7rpTJmyPRpGReWfn25r5FooiXDL+gZFmAF9hrzxQaAJE1mrqtC7UeviRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=E+N16mBl;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E126606A33B;
	Thu, 19 Nov 2026 11:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E126606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=E+N16mBl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795088834; bh=ERVP7ojqfWPIgVp9z7FBj8ULKho9RTINT6TuDagxjb0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E+N16mBlqpL05elOCp8bCLYu8VuhtBEvWMAsYohKTtXrrY9hmjJe283X+t/isWlUq
	 uprv3rx8ZOLWZbjllGaHxtqE+vvLOHus+VnHX/ly9RnRoWojAfT18ni8/D3JicxT84
	 RSZlGHnBn2kNkSf/Vw/a8cbIpY9CTsH835TqRu1BjrF/IOgT4lbxD1hzipQK/mY8H8
	 kM+fiq/RcYqteDpK57aZ2FDIFP0y8BFfrFLcqwznYYi6jAocvjwNmtm0vmV2KLYlTU
	 iNpyPRMV7YdNZiOItcKv7LyeNvY6CYyXIvvwuFSj2ec1C3TorDEu5zhvvhaNiqOq8g
	 TtEVWH2uZzFQg==
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261117151703.1802556-1-mehmet.fide@gmail.com>
References: <20261117151703.1802556-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH ath-next v2] wifi: ath9k_htc: do not fetch the beacon
 of a finished countdown
Message-Id: <179493501302.5082.4534148268828040555.b4-ty@b4>
Date: Tue, 17 Nov 2026 18:03:33 +0100
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

On Tue, 17 Nov 2026 16:17:03 +0100, Mehmet Fide wrote:
> wifi: ath9k_htc: do not fetch the beacon of a finished countdown

Applied to toke/ath9k-pending.git (main), thanks!

[1/1] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
      https://git.kernel.org/toke/ath9k-pending/c/b8969092ae7b

-Toke

