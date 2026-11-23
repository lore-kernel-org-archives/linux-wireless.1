Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425631;
	b=wV1am8+uSHlyKgsathT5zM2wxCxpf7AziVLSOsUFYF0mMQ0rM4TnTQVurQ2tkXRiXB1Q
	 Yrti4ITA/N3FO1RnSpdx2gZXrUsl00D8Sg+Dz6kIJoE1BTjLtp+yoQ2oUJcokX/hxEblN
	 15JRpZ2SJD+C/aw5P937TU7R/u6vnGbK22PKQfDl4epaCegr4P++mN1/GCs1IbPqUUFR6
	 vcsTPnlQvRyj/efCVAkczm7FEu5hIth7LD64d5zOaLbgtmtHNKJ5UdLOI64IBih1NEoIZ
	 Z815JcpKSFvRvsbLZI88RASvnY5djIkfmloN+v+C00vOjxSvHbyHB58te7YBw0XGJvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425631;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Jy9jkms2VGlQSZZ7VbsWk0QGJkOBzdwisB1mlxDk1u8=;
	b=KVma/zrpvjExBHVzQo+wKvFh0JZFPE/iLy5xMf31NZBYFMwVQW2kiFwJml1JpeTtqGMQ
	 d/lq4dcoXkvw+PH7Q2wqQodzz/NrTzyvUvOE6Ry7RQ/WJQc8VSA3ilRmTbAKZamn5EY68
	 o5h8T45xC6KbHpVXkwX9lHl5vY+YX7rjjAmhGc6Mum/oCNjRICVJWJXMD7q4r50+xnixM
	 xLMoKRhM1Jxk5c51ft7N7GuC+oNJcHBufrcGNcV/RcQ/dqPOxFXiR3L7gL1/LoXRYkcrc
	 u6cuxIN834fIprF86xti7qnm5LnD04XtDLDjaMdtAPoxdKVPfGb5TPrztxb3gAD3vOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACQDO2Dm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C0606A321
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACQDO2Dm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEC21F000CA;
	Mon, 23 Nov 2026 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425630;
	bh=Jy9jkms2VGlQSZZ7VbsWk0QGJkOBzdwisB1mlxDk1u8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ACQDO2DmpkDpQXUe3UzPy1Ha4xMkZMS5IS9mGjX4RWTeD3kUZSnVvSrqkAI+LI7a/
	 1k8Lje6Gmp5IfdBHdGbHyKMS7wQhgVqTj1M19V2mPZNZDgIfTroA5V5QWX5X6uuRKP
	 GkIvXX8yhCu3M5ab3L6k/PLbzU2Bq36ikEx3h6dRtMy3yOdTqIRE+PQ74GT8UsDKqQ
	 YwqpRVLY2WzaVT5PHldi3NlRCTy6yxexgCDP1aAPu4ufjkbr+jMMl5m6naUI6mdAOH
	 MYuBulsR/fjBC3nx7zYq5h/Hrg7JX30WEQaBxkWtAW2WdonEcKSSt/IiHZTszoiqw1
	 MJWw+K9uV7dOg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 435725FADF;
	Mon, 23 Nov 2026 17:20:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Vitalii Zagorovskii <support@lizardsystems.com>
Cc: wireless-regdb@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20261022163910.1292-1-support@lizardsystems.com>
References: <20261022163910.1292-1-support@lizardsystems.com>
Subject: Re: [RFC PATCH] wireless-regdb: Apply the FR rules to French
 Polynesia (PF) and Wallis and Futuna (WF)
Message-Id: <179542562825.953421.14959438860261477512.b4-ty@b4>
Date: Mon, 23 Nov 2026 17:20:28 +0800
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
X-Mailer: b4 0.15.2

On Thu, 22 Oct 2026 21:39:10 +0500, Vitalii Zagorovskii wrote:
> PF and WF carry the same block, which matches neither FR nor TNRBF
> Annex 7: 2402-2482, 5170-5250, 5250-5330 and 5490-5710 MHz, with no
> 5725-5875 MHz, 6 GHz or 60 GHz rule. I could not trace those values to
> the TNRBF or to a local decision.
> 
> Annex 7 of the TNRBF (consolidated edition of 26 May 2026) says that the
> use of its bands by short-range devices is subject, in Region 3, to
> decisions of the TTOM assignee, and that in the absence of such
> decisions the conditions in its tables apply:
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Apply the FR rules to French Polynesia (PF) and Wallis and Futuna (WF)
      https://git.kernel.org/wens/wireless-regdb/c/9c89660a9c80

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

