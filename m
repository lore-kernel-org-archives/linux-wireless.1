Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052858;
	b=Ne1MiBBzRZFCy5yshO+6tGIJO0n28VwnzrxfsfXOpl9e9Jtdjnb3VAGHAaj3KuvD8I6g
	 1Y/5Q76cIyUe4OBCCuumCLmjr31A/m5OO5W76hQW7LRB7KgD1+Lhb8VbwGAHDMfjos2Am
	 xNEJjqFN8nG3arxa2azHC7YTFNr9HSKYJJV3xtBLBATykx2ngKveRbnV0pMGI+vRjSh74
	 T0YbA440LEe7RGIX4tlxSCegz5gYhqCwt8uZbwILFITFAx2nfIqtGvryewi1zNAUBpCwc
	 LY3sWrzr+XCwIckFnWWrbnoPTcF/k68a1zSHccbmoFR97QSm60SziRnYcLjWqtRfOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052858;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=teDQXA8QwN9ovTcI000xHHFFBgFNDOVSRXNkXxpiD58=;
	b=pxTidA9EiQvj4KAIu6cAbFchrVL9gxN9m4/Z29z5ge+24x8/FW7ofElWrnMsKCNYtfDI
	 dLuIYWcDfVUvGpq2ZaoUoW2Wi2XCq12clKaFPbWREAPcXndO/HEJacRldTrV9Zogjsrbu
	 wHFn0IG7Mq7YJ0dSMsB2mJ+X0fTbOk4bMLZw5UnsDrdQFkWFYlMsPYpYmkXnsxs+VMUSv
	 pJgi2uYv0sDMc5OoC6CzZ3t33UUASZoQ58K8VDrnrLoc/h0VSh4MazkG8smx6eRpmRr9O
	 a/RKQAxy7itfO8cChVqBt0xS/B3D2Vwzzf3ApUwkfkQeodFs10xlEXx7lbEbB3Awc1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=jTh+l0VJ;
	arc=none smtp.remote-ip=62.149.156.132
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05359606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 12:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05359606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=jTh+l0VJ
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id Pf6Mx0fluV5J9Pf6MxrqXX; Sat, 07 Nov 2026 13:00:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794052854; bh=na2sHEYJEeB6e7NhX1E8BmZ+aTMgCGr2QTzvM1jjjwI=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=jTh+l0VJqMWA4Am/G3Co13pGGQtzZE5wme0z8BA4mprcgcgf46mXctRZ0mTFeGHRs
	 lDrUxcYS/wrfzlMihO3a+xz2tIB9QnQAYBSXZ2q+xRfUxXWS6YJkX9sBnKR2BAqOp2
	 3EkcQFLxXkioxEvbzmdeiOQsh1/Z1vlzl1ZeAg5KEWdYpFjA1Vnr9BC1v73JPv6/IP
	 Hdeo7c0dcPnGYPVV/SWi0IXiS65I+mZ5CPKLpQiRP0N+qsH6f5BfPLYy6h9lPyxn+S
	 nQ22RK2hkKy8vbvUOxC2h51/0wrPWUmaMHtJW8Ek2s5/Kb4EA1K6Ia7IVjmwrc20ea
	 6ATWAIJbAz4SQ==
Date: Sat, 7 Nov 2026 13:00:51 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Luca Casati <luk00casati@gmail.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net,
 arend.vanspriel@broadcom.com, b43-dev@lists.infradead.org
Subject: Re: [PATCH wireless-next v2 3/5] b43: N-PHY: fix rev3+ RSSI
 calibration
Message-ID: <20261107130051.000038d4@mythread.it>
In-Reply-To: <20261106211516.273791-4-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
	<20261106211516.273791-4-luk00casati@gmail.com>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFCngUd5vyRDeCf/xdD3wyk6twAO3SLzpOSdI5kURY1sIIl+9BIaFkvMw9jsv3WXhfjM3zTxBviNLZJmUC8E45o7ZOb0st61XfPbll7UBMc6NbEUSvwq
 pz1khMozNtQx6TCRUznBn8nsh3tBbcZ636C5RGOkWIwFj5K2ZSUW6LwuwBlkAGiLvnq1Eq9HXSZaE67PJk6HgIZ6wGaoNm6BPr3UYpKCKEhQvYZCHgvwXtip
 rGYZfg4lC5j1sC2tCpuGPYWGYJ8jHilwBxhd5EwzJY2FhU4JREYolP8YtyMwljJ7+Ab4+Vrab1G3Hi9It+g3DNXspyqAJ0orpgHPPP3qZXhB1752J+7s31OU
 K3pSnSJ1

Il giorno Fri,  6 Nov 2026 22:15:14 +0100
Luca Casati <luk00casati@gmail.com> ha scritto:

> Three bugs in b43_nphy_rev3_rssi_cal():
> 
> - On rev7+ the selected VCM was written using the loop counter (8
> after the search loop) instead of vcm_final; the 3-bit field turned
> that into VCM 0 on every rev7+ PHY.
> - The distance used I*I + Q*I instead of I*I + Q*Q (brcmsmac
>   wlc_phy_rssi_cal_nphy_rev3()).
> - Negative W1/W2 offsets were rounded as -(abs(x + 4) / 8) instead of
>   -((abs(x) + 4) / 8).
> 
> mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch3-rssi-vcm.txt
> 
> Found and fixed with the help of an AI coding assistant (Claude Opus
> 5.5), by comparing mmiotraces of b43 and wl on the same card.
> 
> Signed-off-by: Luca Casati <luk00casati@gmail.com>
> ---
>  drivers/net/wireless/broadcom/b43/phy_n.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c
> b/drivers/net/wireless/broadcom/b43/phy_n.c index
> 6b0140f05..36c07d891 100644 ---
> a/drivers/net/wireless/broadcom/b43/phy_n.c +++
> b/drivers/net/wireless/broadcom/b43/phy_n.c @@ -2167,7 +2167,7 @@
> static void b43_nphy_rev3_rssi_cal(struct b43_wldev *dev) continue;
>  			for (vcm = 0; vcm < 8; vcm++) {
>  				currd = results[vcm][i] *
> results[vcm][i] +
> -					results[vcm][i + 1] *
> results[vcm][i];
> +					results[vcm][i + 1] *
> results[vcm][i + 1]; if (currd < mind) {
>  					mind = currd;
>  					minvcm = vcm;

Ok, in the original there was probably a copy paste error.

> @@ -2184,7 +2184,7 @@ static void b43_nphy_rev3_rssi_cal(struct
> b43_wldev *dev) b43_radio_maskset(dev,
>  					  core ?
> R2057_NB_MASTER_CORE1 : R2057_NB_MASTER_CORE0,
> -					  ~R2057_VCM_MASK, vcm);
> +					  ~R2057_VCM_MASK,
> vcm_final); else
>  			b43_radio_maskset(dev, r |
> B2056_RX_RSSI_MISC, 0xE3, vcm_final << 2);

ok, vcm is clearly wrong, the loop is meant select vcm_final, vcm
simply hold the last loop index.

> @@ -2219,7 +2219,7 @@ static void b43_nphy_rev3_rssi_cal(struct
> b43_wldev *dev) if (j / 2 == core) {
>  					offset[j] = 232 -
> poll_results[j]; if (offset[j] < 0)
> -						offset[j] =
> -(abs(offset[j] + 4) / 8);
> +						offset[j] =
> -((abs(offset[j]) + 4) / 8); else
>  						offset[j] =
> (offset[j] + 4) / 8; b43_nphy_scale_offset_rssi(dev, 0,

Fine

This change the code also for other revs, correct?
