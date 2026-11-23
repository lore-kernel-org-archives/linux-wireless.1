Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430310;
	b=SKQyb4NIf9ogOBbQkrPsv2mzTgDayhkdANqVERT3BqOg+0+omHOBWLTlGwewXoqkvreA
	 7dx8kxX6bxJFPaGAPL0QMinwbW+OxGgIqn1rUy6BWBzFhikDYykrdKnH2BQvTyFzw6OMr
	 J95mcoxEJf/PNY98y70ZcCDkccdcDFGDjuRIFutWsFbI7eAWz9uAdY7e/QnJ8fN0S+0hB
	 pjZ/K1sdc2fiGmII/3qv6FfDnDsZ9nrBd5U0Da2V3BDnfeewbZZCg/jIYuL0v4ObvlIgn
	 OsozKfqQejntj5RUZT4m/6ScXuMydYvc35oRpSFLmmvjoN5gahomMiEzFQH5XLzWg5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=oUNLJudl4VFe+YJkh8pmCdM4wjXdnnuxeEY2t3R11RU=;
	b=u41l7vaT2jtW8SERpPjflzHazWzgaR7HElRnBmoiuMG6NeNhZoHFPSkpZfi8rcPh3btb
	 LNBHJxtk4LgvFUDZH3jmlyDNVZBSUcU4QfySU5mtobLKpIMD/NIJPVEHpKhcqHtaZ21u9
	 LeYALMVLsiONL3bS+JMM51Tm0ofw4dfAKZuEbIVStZloqUer4PE734qiL7W/DyGlwauPs
	 y5432yhs971RN4YEuWbZAd00uYlFFM9gYoP9+g0RqnxU5KwvS8022l15vzDXb0QKO+f/4
	 tN6EDE1UnnWDWAURmkpsFPA+HmleEVjLNJEgk3R6p5jW2ltTBQ+WH5pqYdeGbQx0H4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP9uADon;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50918606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP9uADon
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960361F000D2;
	Mon, 23 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430309;
	bh=oUNLJudl4VFe+YJkh8pmCdM4wjXdnnuxeEY2t3R11RU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bP9uADonEU+sgpeMsaXqy/ysCfnRTsSWYrYNBtZTNft2+Yi61bqOSVL09Corjlh5h
	 WkOIlV7b+0cQRxvrJYVB4EuHtxL1HAd6St2eIlSStU7h43ebHzLzsc3FEpZTlm+P6W
	 1Zi9cE2wWL2PLA3Syf8IiZBr1RtNw2nmc7tCDrYuUCFOi3b4N0VurDGHZkAsgaMnpf
	 GWgdN+us4ucoaNd2b4LASXxSN2a4nlhvIILo/0DuRjeyaIk/MJM8IPWMz4+0KBa8Rg
	 e/+Qg3FvQE68cO2ujZ0uylBGfixNdQEAWVdWf/JXfsoRVl1zcgG76R26mj5/9ktUs3
	 rjjdJs8GyMRMg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 790945FE03;
	Mon, 23 Nov 2026 18:38:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com>
References: <7C3E3534-43A6-4D85-BAA7-9BC337438EEB@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Kazakhstan
 (KZ)
Message-Id: <179543030749.976281.501260389616117021.b4-ty@b4>
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

On Sun, 22 Nov 2026 21:12:21 +0300, RFAREAS Support wrote:
> The KZ entry cites the 2015 versions of the Rules for the assignment
> of frequency bands (Order No. 34 of 21 January 2015). Item 24 "WAS/RLAN"
> of Annex 1 to these Rules, the list of radio equipment that may be
> operated without a permit, was replaced by Order No. 564/NK of the
> Ministry of Digital Development, Innovation and Aerospace Industry of
> 19 September 2024 (registered with the Ministry of Justice under
> No. 35100 on 23 September 2024, in force ten days after its first
> official publication). The consolidated text of the Rules on the
> official legal portal adilet.zan.kz contains the same item.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update regulatory info for Kazakhstan (KZ)
      https://git.kernel.org/wens/wireless-regdb/c/3cca5d20b17f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

