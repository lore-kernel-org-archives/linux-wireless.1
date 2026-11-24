Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502654;
	b=ebAG4xILEIlzubb/soB7Fg5Z4IdAdO8QT8fBrJoWQkLPr5L5DwQ3sV3ltGy0GqTIEHFf
	 vTwljAOUzxXagMCYLeO/LUFzBy4/Vb2cF+fVdtdHbBoHDmXwY9MleXCj9Gs0IzbRBptkU
	 KjrvAzPZ/lbMSFmMkEjVOdCyuH8/jJq7GDPbdyFhMwEEQBEpSUtXUF2Hy6eFwKvyGoS61
	 ua2dvncQBOcysRjUY1uhkOeTN55X2/ZV8lQMyvyMU1aHxcVAn3+HmIBZcIPrG1gT5UQci
	 Wp8F38nvspxfmi11KBaDBpdCrg2mSSxEvLcfDGThv1AA7mtA/BH4eMoSez3kIuKZrpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502654;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=aE+bxrote5btcE+FjYe5ChvArIhBlqI+iByV1vlnMS0=;
	b=Pig1jrQStW8wYZKy5fUz1dP4757IE9AyESecnIGrS8V6xikl2T8UIousxNHS3R6unSyh
	 iqVBHY35SnIM0qom0IO+1X+38JpSoaaDNwGw/yqWjR926NEbsDoBnMaXqgwiFtmv1NbWM
	 svMJFag8Ov2PYTaqah6re5A6KVaN72x6eV+UWvgLrl3OYcVhlajqJ+OBpCW+YiKyJgu95
	 gpES9cnahBD8FZ6SsGrZCHSKJjCROYrast6Pa8DYD//ZdGohoHSesHcd70iY7MIC46Lkg
	 QQ44OA6gg/x1Zc/yYbaz+xaL9/oZRi8Wbn3nw0AdVSWaY6EgrJWw269nO59xcG5cC/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GDFB/mb/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E4606A336
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDFB/mb/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A051F0089E;
	Tue, 24 Nov 2026 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795502653;
	bh=aE+bxrote5btcE+FjYe5ChvArIhBlqI+iByV1vlnMS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GDFB/mb/QiFtQhrVT2l3+LaSCP9tGW3ZNishgmH37nJXBmNTouTE5FtXdm19Wisfy
	 RMX3VKGgS4i9u1NADTitr0S/NTeB/DgwOhnISATRAMx8UszE5cPUxG159a5FJRRZa7
	 AIfF5Kl5WRODXdndnvlWGebq5lzHOGF6VV9JHr7QDh9gtQTfpLXUJyhPenekrNEHWG
	 hUrcTBKpJHd6fwobIolnlzpoQH9FIrvi8MZ/ntwcs8+WD0aBR2BzRNjbzyrDRY0ig9
	 f0xmsFV20W0VRrM1ekWYUdDPajT3TEpln6KWd4exOfK+MRyN/C9OgDaeNr1dnv/eBe
	 VG6R26tYJyiFA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 04C4F5FD99;
	Tue, 24 Nov 2026 14:44:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com>
References: <C1FB55C5-D453-4358-856A-54D0097561C8@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info for Georgia
 (GE)
Message-Id: <179550265101.1335742.8480642077239151432.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:44:11 +0800
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

On Mon, 23 Nov 2026 23:04:00 +0300, RFAREAS Support wrote:
> The GE entry has no source for the 2.4 and 5 GHz rules and does not
> allow 5470-5725 MHz, which is permitted for licence-exempt use in
> Georgia.
> 
> Licence-exempt WAS/RLAN is set out in Table 3 of Annex 1 to the
> National Radio Frequency Spectrum Allocation Plan (GNCC Resolution
> No. 6 of 30 June 2006), as amended by GNCC Resolution No. 9 of
> 25 July 2024, published on the official legislative portal matsne.gov.ge.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update regulatory info for Georgia (GE)
      https://git.kernel.org/wens/wireless-regdb/c/a6ed240979d1

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

