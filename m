Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506040;
	b=D0/krcl/+dhv2L9q2D18LWR2sCL1EIr2Fa6ixPrLNGm10bbuMBLWSxZQ+SShCGh8zJ//
	 IzvTP9TEaiwEjw1ytCEM5Pup//ZkTaENNWe1mhAhOAgYSb7I60Qavwer5xdJbYvoQBzs1
	 hkDAJ/ItpWtOJAwaE+4JGz+QS+4DJUIyG/6rR2ghjjhBUd5c/YagRlcrADVf1tXrsLLuZ
	 IPfMdHi9E0dNvIvUVgn/6BTgGvwIq+5bmB3zSyjZOjXV2Xv/OfBZ3XcW6yWosdjx49IzX
	 efvLc5Lfw4ISKBZEHoecSAlc9CK1SqD9RkH+iOC9RzbwRYGiGVdbHrRXQSP54Hke6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506040;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=LTD0HEqligpNJdm5AHVoKBK0ntmv1MWw8QQxRHSKNLo=;
	b=o5ECaKRphtUEpPTLb8r1NowgFt7gQo+YAPd5IvVAiVraslc1KzZx5tk6XUxPsCftdHo4
	 HfB7ptG041SFFxNzVHyIbEJpedKuzjmxTStgBcgW+PzzQPG43G+GingpYKAxqXzJKtyB+
	 +nmknKoGctoBkONfB52+Fbpw4wbbEJVeFb/UJE9aWu0iV6NynWGByyvTVD6lrTSKQFBdw
	 r1cDxgknihNFv0hQ7xuPHshPM3gdkIJG5KuXxlT4LLHKaomYeUb2Q+1skxHVTLmIEO/6T
	 gesG2wBQvg60MYSGIsUB1zsfXFDXNsSavIZK3XF5RSM+R6/pURXByr0Gy30gcURK0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nt3AwwQU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8EE606A680
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nt3AwwQU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65561F000C6;
	Tue, 24 Nov 2026 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506039;
	bh=LTD0HEqligpNJdm5AHVoKBK0ntmv1MWw8QQxRHSKNLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nt3AwwQUEzZoV4wTpMDVeTTNyKT2a2mjxzkfCudXNPRQl6eTIFutLNIPeNXlVjfkH
	 Jbx0KCTo2547cP2f9Hc2HuguA0g3yGX5iVJ35mP6udzbQbGMKTd8LHM/RsWcYsfYkf
	 216PhUMjuf0Q+DWcGm7EtwG9/040vbxfE4xXR76yepU7pWSA8p1Wa+JVnUefS3ki/Z
	 nmmdWyApdH5rIfkErfkx6XC6RckdbGouwESKRCtbdvgN9QAR/7TFeaDOz2586ln/aB
	 ffwOWwmrIvzqiKTip26fGc33jiswhbh+ih/DRXHbssjpgNNkRPFIuXWBJRDti9ghKx
	 Rps/gIQZycknA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 82F9A5FD99;
	Tue, 24 Nov 2026 15:40:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <EC40FABC-4701-499A-A1D4-0BD6AB88FDF2@rfareas.com>
References: <EC40FABC-4701-499A-A1D4-0BD6AB88FDF2@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Allow 5725-5875 MHz short range
 devices for Georgia (GE)
Message-Id: <179550601853.1353826.5832206608526755293.b4-ty@b4>
Date: Tue, 24 Nov 2026 15:40:18 +0800
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

On Tue, 24 Nov 2026 10:12:42 +0300, RFAREAS Support wrote:
> Table 1 of Annex 1 to the National Radio Frequency Spectrum Allocation
> Plan (interface requirements for non-specific short range devices), as
> amended by GNCC Resolution No. 9 of 25 July 2024, allows 5725-5875 MHz
> at 25 mW e.i.r.p. under EN 300 440, with no duty cycle or other
> condition.
> 
> Add it as for the other CEPT countries, and correct the comment, which
> only mentioned Table 3 for this range.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Allow 5725-5875 MHz short range devices for Georgia (GE)
      https://git.kernel.org/wens/wireless-regdb/c/412d41068c46

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

