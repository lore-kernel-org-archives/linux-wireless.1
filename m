Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502654;
	b=yD38sKODLIGaUX/JTDpF42lnpQMZzumeL1gIL3ilorfSNx9qBBtH0Ea1KMfU50rjlQVJ
	 9FKN7o6RvGbyV61VZLeVgOKF461xF6fcNyYCFuRtINn2Favr7NCDmMKLLSfZ6cBHXTBrT
	 lGJX2ne+L1Qdrs21mr0DzJqEOkwbRnlXkdShYe91WkHlgeM6j/FTzHAkXromXEZwjdmBx
	 c7+z2MBDRxUe1kaN4Np4f7Qb8qqqF9Y6baXHHWhCymUvAC4s97Tb+pIVv9vHQJXE3Nzt4
	 hsFBhBNKJsMxkGY4U1UhSASOXeuCE1ybrdJppZ9uOiSZri6sOXqYwMRB7f/67fNtp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502654;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=794MtVvJUO0hVW/NFQMZ6F1ocZ9Tdo9x4c7WaFGvu8M=;
	b=srA12G8Y3Q+h8nt6MbeJrbdxLLOdYDUqyfof7WLB0d7uQzaeRYDfhvV7tzdeSk+iDKuf
	 u2oinkjx+xS2lbtPWARUue1t1Dw7O+xd93Av+uZ3YvI3pMC4b4IfC62GVb52WC20TKad7
	 Wxz6h+jL9eBklq1T58KV2yMAbsbJE6w66Hf+PraXv+FJcU8oQcEYSJfUEv5afNuiURPuZ
	 7dCXJI0pD/xqLWYqOPKaBi+qwA5yt7AGgXxBb5EQzzVR83sy6z53LZPK2IOrfUckbwUSt
	 QPXbkuTiQujputt7xdh0F1lJi17w7roHHFBFoKVSrID+yDcKttHugw9+8DqrW98+x0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdqoMZbd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38099606A335
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdqoMZbd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988C81F000D8;
	Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795502653;
	bh=794MtVvJUO0hVW/NFQMZ6F1ocZ9Tdo9x4c7WaFGvu8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HdqoMZbdLvYehqyZLbb8SnKkauuUCLAnuoTuRu2vqAEv/DeSlQszHXNN4StRuiLhx
	 E/6OQ4XHz9gB+Qd9jYeDs8C8nRd/gVKNGkogHFjoGgK5ijMtUGaVL1MFvHrpuV6M4a
	 KHRlaLhaz//1kmh8rJiTPH1wNAwLacFg33wuxQMDOterz7z5pTSwJJGQUC7h0J2tFx
	 mukHd5qQWqk/CW2d6x2YtcyPU40Bb2Rn1iP+1dVXUfxTqaG8XP+WPp43SvH6Nbh2uk
	 gsahAZzolS+FYDeNVludF+yczLIZ7RmQDQMoicEZJq54vm3BIn8Z06SKOa0ryIgoA8
	 XWEVkphTITKcw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E007F5FB9D;
	Tue, 24 Nov 2026 14:44:10 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com>
References: <2D65518A-EBD5-4E6C-B4D2-7819D488B374@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Update 60 GHz rule for Ukraine (UA)
Message-Id: <179550265089.1335742.9902198486401698781.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:44:10 +0800
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

On Mon, 23 Nov 2026 23:14:32 +0300, RFAREAS Support wrote:
> The UA entry allows 40 dBm in 57-66 GHz. The current list of radio
> equipment used under general authorisation in Ukraine, NKEK Resolution
> No. 361 of 3 July 2024, allows MGWS (WAS/RLAN) equipment in 57-66 GHz
> under item 78 with a maximum mean e.i.r.p. density of 13 dBm in any 1 MHz,
> a maximum e.i.r.p. of 20 dBm and indoor use only (ETSI EN 302 567).
> The amendments to the list adopted since then (Resolution No. 32 of
> 28 January 2026, current consolidated version of 18 March 2026) do not
> change this item.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update 60 GHz rule for Ukraine (UA)
      https://git.kernel.org/wens/wireless-regdb/c/d9370b5942db

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

