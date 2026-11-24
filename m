Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506034;
	b=rxpFYEWaUufF7ImxG03ePG+zt5YhsgqXC9+uiMmduPmm7rQf4wo1z1FbAr6aPtFQQml5
	 uefHzje508/J0Y+UhS4tngdQ1JktpM+8X8u66SyP2h7tId1yiepnS2KyuSO8vkSVWAYvF
	 EzT0EUEN2tSmGeIw5UKsvQEGgz66nJaOnCGKDXP8sywvM42rCZTc+6yXum/kfzciAfxO0
	 6RfAutHD7HG8c8hGdeYwbyyYlOgby8We5sMoCpRU+3PKDUBI4OOHs95pW9bwZf4rR6Jaw
	 jwt/BViaQFeKfK6AHU1fSvkGyWea94panhk82tmgGf+qASNSrgvRQEZ+H2sJ3iaOXsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506034;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=e4+sGCCv9a1UDa7tbuCu/ptweMZKBIyQH0q7JFAxVsw=;
	b=xNcBr6M7fQCXDybYgJIMQxApbRbUZA6VcWr5teV2x2kEeUfYyXY/03k614GcSGyAFcgv
	 Z5Us1OUinymYNyCVyb0tf5zBQdKV9BGtzaWEmVlQ2V3ATh/Cq0V/cTQ3dKUHFL6ORQ27E
	 aQ+x5l4EtRy+9Y5bQolToQz7+QrahsHfc6WT2cW/KQ32RlaQUbJlU0jUix3lJld/rCKLT
	 LZUDScBCzMkTIZJr6rcGF/xp+pgKW2duZu6+1FEWFoK6ESzcnmPlEjAecy4qNwMA/eoQO
	 DzP7al+cmq/8WpnS3UtBUSiQp5/idHYrzAjmWsjI4OC7m/HdhokS+92msI/UE/sGpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE6Ga1S9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8190606A332
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bE6Ga1S9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70801F000E0;
	Tue, 24 Nov 2026 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506034;
	bh=e4+sGCCv9a1UDa7tbuCu/ptweMZKBIyQH0q7JFAxVsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bE6Ga1S92LdT8Vt6LSkWG5m6cSbZUBm8k+Djoo6JpC41jEPBM8K/Kxb8JBriQAk3H
	 6bAF2ccSoWAEaIrht7uKGZmmp+EWbx2Fccvw220EqPj9mtlLhLv/CCG0xVe25UdBP0
	 ZzwoDMRMteskYLHU06D1zk46YYGPnLHYWmztvB00oOhwHM3uylIbdnvZKpCutP4k4O
	 8biA4SeDssfwUv1O55sToMNoaTsUFtjEAYdmizQDgylTCYR63zn1Xwip9B4Tciwp5T
	 zMaywjlBb+Vg4M5hDyp5MLdKn8XOd0UGl3H4wbdYo6E01B/oZUN4Bct1Ak8yl0WKkp
	 8AYKtq2J8IHvA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 7342D5FD11;
	Tue, 24 Nov 2026 15:40:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <119360F5-6878-4218-AB28-D56C4E76C999@rfareas.com>
References: <119360F5-6878-4218-AB28-D56C4E76C999@rfareas.com>
Subject: Re: [PATCH] wireless-regdb: Allow outdoor use of 2.4 GHz for
 Ukraine (UA)
Message-Id: <179550601844.1353826.1904895525883818530.b4-ty@b4>
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

On Tue, 24 Nov 2026 10:21:40 +0300, RFAREAS Support wrote:
> The UA entry marks 2400-2483.5 MHz NO-OUTDOOR. In the current list of
> radio equipment used under general authorisation (NKEK Resolution
> No. 361 of 3 July 2024), item 53 allows Wi-Fi access points in
> 2400-2483.5 MHz at 100 mW e.i.r.p. "inside and outside premises", with
> the antenna at most 6 m above ground, and item 52 (RLAN terminal
> equipment, 100 mW e.i.r.p., 10 mW/MHz) has no indoor-only condition.
> Resolution No. 32 of 28 January 2026 does not change these items.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Allow outdoor use of 2.4 GHz for Ukraine (UA)
      https://git.kernel.org/wens/wireless-regdb/c/96a1346fbfef

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

