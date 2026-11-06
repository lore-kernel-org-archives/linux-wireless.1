Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003135;
	b=FNaS+/lvVy3CDFsHiJDj/JEZ+QKwYk20GiRCGwdw5NyZ1n3mjYYIa8wz8+rC/IlBM1+I
	 kokNuaJxGpLty+JDlPOlJWkVBJkDv9poD3WGFRG1RIHXiZ7f8RlUb5EpxNUXNcmbuzUra
	 pPDWxag89kD8oWaesrtKmiqtsceouKuGDxrTnN+GOgM75N6IWtSbZgUrL7tacyi3t5EyI
	 Ju2v+gyIh3hr0SWq6tPvxIDZLosKCBUNsR6oQYjpS5whwnOgWFv6oXC1AqtZiYT6zzbmO
	 jUPAi25UEjc6KuGgG15u3pM3j8Kz07AWzEBVi2GzuzoG3pPC4S5k62vNfXUPXBn8HJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003135;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=mJl+RwDvzq/PplYN8DwtJmtkz00zrmcGgZgazx8qzZ4=;
	b=3iGNPqTRm6TarXMBJQa9MfnPtMAbBRIQWcEr1CYPIqS8aBbboP1ITy4FYN/KoUvIKavl
	 ck2ctQrqik1CYVLYQr4rfT60aX1aELh+yyMtnq4I4/+W6UF9q3BHq/+9K65WrP9q61xVw
	 WWE3qtFQPYpE1sLVOV4hDlc3irVXwyrPpzPw2zisYMi5p7/dEqNfDCV8pdqVIZ4X+MSPG
	 TQ9HXUEPN4SXvCBsvu0vt3uqUBQiYZjgBxXH+Og9ph5Wr2Qr4n8EFvFXJ396QmAmWjw48
	 lL2ZeBL4TbBC0GmDHXNizL//vf4L4X029zGTfNx6BPK7LEhGuFOZ0X32wLJS9RC2Euw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=b4fM4jZx;
	arc=none smtp.remote-ip=62.149.155.116
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D9606A32C
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 22:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=b4fM4jZx
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id PSAFxplkKkeHhPSAFxTcEj; Fri, 06 Nov 2026 23:12:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794003123; bh=ZGt9E16nzykH9Ajz1azleSM2KOUHnN9gragopg2dc48=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=b4fM4jZx+A/efqkwy3m4W7yXmO7VPj6iFpgE5yfAkjIsyHQ1RGp3bLEFs5eXkt7Wx
	 F4zoejSXHRsvsUaBYQ6J3b5EB5Lx/1NasmaXywN0fBb7Xh8vL7iVSZqMlI5PfWT5T9
	 t1V9wIIyBS9uUlWwPhPdDVayi8PDXNb9QURGspgAgWZCYhPC33qzLNvoZPW+2V8TID
	 WVr9FzQwxp+P44xrZpmKqn9ruY18HwtvV9Q5gYOz5rEasZVER8l19dME9KFa/dR3Sq
	 tzVo5k+++di1Vllz7VmvLPHIL+g6Xu2oSBTnn1h+Q3HOh5J4IRJ+Yu/MmHO2HiBA3W
	 UqKR46w8Y+Tjg==
Date: Fri, 6 Nov 2026 23:12:02 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Luca Casati <luk00casati@gmail.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net,
 arend.vanspriel@broadcom.com, b43-dev@lists.infradead.org
Subject: Re: [PATCH wireless-next v2 1/5] b43: N-PHY: fix the TX tone sample
 table
Message-ID: <20261106231202.00004c8b@mythread.it>
In-Reply-To: <20261106211516.273791-2-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
	<20261106211516.273791-2-luk00casati@gmail.com>
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
X-CMAE-Envelope: MS4xfBi88QmP7VZAFmeKmyOG6wE2hjbZ7XwFngFelYV3CKcWoMyOno4/el0tga/zV3LFCWEajCIbm4rQlPv1JiaDTSBnJ3BSe8aHTkCkqeiVUx72/2Db3Sa9
 s9BrBjb2MuNsQTXu+q2l4fkMDiQ5oaXtfTHBIK16cPc5VVwV8ox0OtDD4D87M7Rj69PL9Ku/R7uez/gpMY3eR3sgu9UVE5F3WAl3UttFijRdEHw2sWUQufnS
 Hl/x/nomOeoS9SeTpTavqCiZx74UfKpf79UZSgcRNqqEHQGh9z1x3fRzb+QaUyuZO4f5PeGPvS5w8Rj+oUGZ1zjTEt+z4JltgL5ui4TexLoFGNGnoUNxHJQJ
 /+QUhC8Y

Il giorno Fri,  6 Nov 2026 22:15:12 +0100
Luca Casati <luk00casati@gmail.com> ha scritto:

> b43_nphy_load_samples() masked with (0x3FF << 10) instead of shifting
> the masked I value, and b43_nphy_gen_load_samples() fed
> cordic_calc_iq() a 16.16 fixed-point angle (CORDIC_FIXED() of a value
> already shifted by 16) held in a u16, while the function takes whole
> degrees. Together the sample table ended up all zeros, so every
> calibration that plays a test tone (TX IQ/LO, RX IQ) ran without a
> signal.
> 
> Compute the rotation in whole degrees as brcmsmac does and fix the
> precedence.
> 
> Tested on a BCM43228 (N-PHY rev 16, radio 2057 rev 9).
> 
> mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch1-tone-table.txt
> 
> Found and fixed with the help of an AI coding assistant (Claude Opus
> 5.5), by comparing mmiotraces of b43 and wl on the same card.
> 
> Signed-off-by: Luca Casati <luk00casati@gmail.com>
> ---
>  drivers/net/wireless/broadcom/b43/phy_n.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c
> b/drivers/net/wireless/broadcom/b43/phy_n.c index
> bbc30cbad..c4e6c1ac0 100644 ---
> a/drivers/net/wireless/broadcom/b43/phy_n.c +++
> b/drivers/net/wireless/broadcom/b43/phy_n.c @@ -1515,7 +1515,7 @@
> static int b43_nphy_load_samples(struct b43_wldev *dev,
> b43_nphy_stay_in_carrier_search(dev, 1); 
>  	for (i = 0; i < len; i++) {
> -		data[i] = (samples[i].i & 0x3FF << 10);
> +		data[i] = (samples[i].i & 0x3FF) << 10;
>  		data[i] |= samples[i].q & 0x3FF;
>  	}

True, this is a precedence mistake, the shift binds before the masking.

>  	b43_ntab_write_bulk(dev, B43_NTAB32(17, 0), len, data);
> @@ -1531,7 +1531,8 @@ static u16 b43_nphy_gen_load_samples(struct
> b43_wldev *dev, u32 freq, u16 max, bool test)
>  {
>  	int i;
> -	u16 bw, len, rot, angle;
> +	u16 bw, len;
> +	s32 rot, angle;
>  	struct cordic_iq *samples;
>  
>  	bw = b43_is_40mhz(dev) ? 40 : 20;
> @@ -1554,11 +1555,11 @@ static u16 b43_nphy_gen_load_samples(struct
> b43_wldev *dev, u32 freq, u16 max, b43err(dev->wl, "allocation for
> samples generation failed\n"); return 0;
>  	}
> -	rot = (((freq * 36) / bw) << 16) / 100;
> +	rot = ((freq * 36) / bw) / 100;
>  	angle = 0;
>  

Correct, although changing the type of rot is not strictly needed.

>  	for (i = 0; i < len; i++) {
> -		samples[i] = cordic_calc_iq(CORDIC_FIXED(angle));
> +		samples[i] = cordic_calc_iq(angle);
>  		angle += rot;
>  		samples[i].q = CORDIC_FLOAT(samples[i].q * max);
>  		samples[i].i = CORDIC_FLOAT(samples[i].i * max);

cordic_calc_iq calls CORDIC_FIXED(theta) as the first operation, so in
the original code that would be equivalent to CORDIC_FIXED(
CORDIC_FIXED(angle) ), which is zero.

Reviewed-by: Alessio Ferri <alessio.ferri@mythread.it>

Regards
Alessio

