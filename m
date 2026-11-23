Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430310;
	b=mOVcLuJqJHfeZ48/npuHN8twdXtyRlTKsQoTf+z8alM2BwTSs2PlUwLWiJ0eo9VIFgxE
	 Tpxb5yxrrseiBEdUgxmFeDWZtLTVXstOATOyHekiWYq7VmZOzFVgMoIdgCifPgda04C23
	 vYAkawOuMC6UpAX2Tp5xsU055AiiKgy9JheVFjLw0o/TCCBm64nnb2EeBXkywlrBc40Wt
	 YzrtAQwUAyFBubEJoQv62PbOJfVgplYWpqz8JFmaymUrlQv/EVaUCctD2jHp0VNqkXebz
	 fYla+kBgwK9Z1cF5rnco6f48lqUwty0G1su6phpuUVpKsNWnOH/RckkLKb+TPNhY8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=SWYJlWBrNPFFt3oGJ5xzmTr/GRYEfgMzc/h9mFC7PfA=;
	b=T36RHLdse2Kk0gOc5MwgMORjQMLLy7TfqTWZvHWQdC+r8GUQ/Nvxbka7Vd2KUwjAEyGH
	 ReYmLcqTw1z5OTpanaaj3/xrO290ZUUD+97l58pD/tZFTt5/W98pCFsvZ2nl/9Cgq4dbc
	 qJux8eJ0RXenvO7aOgxkzC4ihYpoGAIopWh9RqpnKrB5DJ3tufx3rgVPumkQW+hh20Hao
	 1o97EokuhTxJqJf81FhrRMyk5WkxWBi54rEHdxq1WQecOhnsJydymDPNYwuzhhawEC/fH
	 bS5l0i9M9J+iS+TuncrY4w7MdI6ybBKtqNxV2s/HryzhseHe8G25ZwTNeOzx9qAZC5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpMZVTBN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114A606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpMZVTBN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814AE1F000CA;
	Mon, 23 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430309;
	bh=SWYJlWBrNPFFt3oGJ5xzmTr/GRYEfgMzc/h9mFC7PfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jpMZVTBNYPXbUXVFLVhRE0Dvhlj3gkW+q5u0M1+kcSJIWG+7nYNrQHs4PtpLenBic
	 2Ybsb4HcGby6Q+a53x9E3QNT0RR0OBu062qixnryUfri3aaRuaPmEfEnGn/si2bHOk
	 lG35OKfPGKJzSSIZmHnXR1/h1Zmfmw0FSv53R4orUjTbHvKre76Unrqsrg6pDhYgXX
	 hNLI3JFF6xNL8iK7fjANb62oOePgg8GCrBtS2JBo0YQI5Z14SJcIhy52FcvPynjrRC
	 ue4K3pPmjFECJ5cXDgBhyTSQuFpXOCCuQIWLYJOwkSxcrW4KmO53KOxOBFONi9B5Hc
	 e7PTzEAJuUD4w==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 9B7C45FF52;
	Mon, 23 Nov 2026 18:38:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <8BB6488B-D0B9-4ECB-9740-E892DDA3F4C1@rfareas.com>
References: <8BB6488B-D0B9-4ECB-9740-E892DDA3F4C1@rfareas.com>
Subject: Re: [PATCH v2 2/2] wireless-regdb: Allow channel 144 for
 Kazakhstan (KZ)
Message-Id: <179543030763.976281.10810918160433779862.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:38:27 +0800
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

On Mon, 23 Nov 2026 13:22:29 +0300, RFAREAS Support wrote:
> Channel 144 (5710-5730 MHz) straddles the 5725 MHz boundary between
> the 5470-5725 MHz and 5725-5850 MHz rules, so it cannot be used.
> 
> Both ranges have the same limits in item 24 of Annex 1 to the Rules
> (100 mW e.i.r.p., indoor use only); 5725-5850 MHz has no DFS flag and
> is the less restrictive one. Extend the lower range to 5730 MHz and
> start the upper one there, as done for the US. 5725-5730 MHz then
> requires DFS, which is more restrictive than before.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[2/2] wireless-regdb: Allow channel 144 for Kazakhstan (KZ)
      https://git.kernel.org/wens/wireless-regdb/c/c0b2d4b1b27a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

