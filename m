Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794525841;
	b=FxzQO/bBnrXUFoVzbwQKZV0Glebl/bJEVYEeGDz7mLG+YOgRpfE+6d3NCfviSah+Frgy
	 skLHW8H+HCvsFV0MLHPZrmd7KXIslahl2ryNDtswvQnxSBEAKTlhDykmA4gVzaNowQizd
	 VfJNx8OZzljY2cac+qnS/m0GpDny2a7PqMvaOr6bjVaQA4PlFO3cDMFuoCtYufWhwmdea
	 ITVytCBtkktwTOnHzBpfxWxCo1UOlEXf9unXS38qUCGvMQnZU5gmY9rYL1ss6yif7O7Od
	 XRlqjo3S2iDEQK+MTGLaOETZTNfvLAHw2qADHwGD49phZPJ2k4EholT+fnt07DFTsbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
	b=HjZFEhu5hCnDGWBhW+Dqs8U0p+S71HzdlDA8NmPsIwNlRtznbLXcSwqNIGU2NPpmKMBX
	 7nj3lOXiAClcRKKEHi9Im+IeeceafRxIOR/NMgYxh3wDb949nmfGrCmVbcf3s9tQcZR69
	 irJGZBde+9jEOAp/hZgjuT9x1yqG+WYGPaM0TD19eGl1WvgKCiyBT88/eprKwekymlXHe
	 23xlYSQA3kG23gbbgqpSAbnSFgQ8mrbBLI4KB0uKglhspTRqdZ5z1fzp8T0C0XWO7LvID
	 zWW+7OpOEhQSM7XsKZj61QQFiAiqHCQAxrx75SQR6dQm01i32R2pK/8ryHZdu3Jp0Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ausil.us;
	spf=pass smtp.mailfrom=gilmore.net.au;
	dkim=pass header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF9606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 23:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ausil.us header.i=@ausil.us header.a=rsa-sha256 header.s=google header.b=focqTQf7
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94937a33cfbso47874385a.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 15:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794525840; cv=none;
        d=google.com; s=arc-20260327;
        b=X4DHc9xXGZBHFV2QUaMhNcv0ElpsXmcH+Ge1udUVPcGexWqb0E/yOkId+8IBak391K
         pSCeZ/Db4NKA8SY6pM6XWebmaSfdZGWT6kibjLXCe6VSHlI+ZDfnQkJ/a9vFmCudcXNP
         xWJajRejAHAtVfNinGvXDaeuIfFpyvtExtCytH/I826Dlh3BAzwfZzThEXrQqyw/hT8K
         oZHS3QD14EzwPhW0rH7FzLF2sS85HXTS0x7Bsy0+rB+EH7m2HPRfPPxLHePKdFGwTvLh
         qQAO5s9+ABFUXZaJiFhDuGGmDbazWTWf1MVr862c2/00Mavg0D7vrJd+Atl3EZ6x/bX1
         Xjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        fh=JdZQDx9eU5CxK7VdBtjIz7Iq0i2wnKvDYInPhkMLzNw=;
        b=qURbKsMReB9S+eU24ki43IML2Zvch9VE8R70sWRBUlRW3eB5ogfVBFbhMNbCec/yG/
         hL2/5XQ12iPYSrgsY5VqR5t5VtUl97GO6FNYPv56zvAi8TUh0002mvSQ/DzR7h3kEdFQ
         fRmyGAb1saL5C5eOiLrpnC4TUAoBncWK4t3fFG3sEWVHuzYWJkI9tW4Iq1GPP/7At7oa
         6Xu/6wxILHOXWAkPNbUGczpxSB6M/X4vpYKBf2LI/NZt2Vuw1yYnv0qMt96lCsDzlQVd
         0qRgQGjdWr/h+Tzfc6MBHb8d399Z3M/0tJhY1PfqfngnzYJyWns6P7dyj5RRdVAa8j91
         +o9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1794525840; x=1795130640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=focqTQf7naFVCGV/My2d+xpcLS+yKtintmrypuRzht8YS8h99AlJDL/3AsFgqMzzSq
         LiYGDn8kpDU+Vupp3Eklu4tet98WA+Gg98hsss9HKVRYsSKcuOWLgCqfGsfC9WtJjhFv
         LVwgrg9eok9OlzpqlzH2V2tb6xEKnyNGK9EIbw7aYhPvoo9CRZELkbf0uLrIc2cGVhxU
         6S4QL30WvyiEW8bbRF9PJYgUnokd8ZbLUVvW9iSO395H8jdjvkvbCelBuukjOeNCOIvm
         Fgkyz48jdUU8emc2E0zd2TfHJq+ABdg8by9UYtuG/i481sA94eZ4XT8IFqFFLbKcla+Y
         4srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525840; x=1795130640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drls+PXlcGZoLfnoPObObwbc1/HPzgky5rGb/FCeY3w=;
        b=pEXBh0VuBmOf7Y208aCXRdaGBejSGXx4XDeLXBB5cfcqOlACFmut7S69MMDpFS1Rfu
         Ym8hFtp6d+I8JbZUFFJOhSoFtAwpBen3VXgV2WIcUi7IkMicD+RXT0Vc/qbCOudHX917
         4CZ8x0scmUNtI4b4JYF1soNI17Mt5I1WiJ/hvY1Ih9ngxdlUuZvg6+S6gyJy4n0N5Ol3
         MII1Fz2sEUWg9ql4hvJGWF2r3YwXUmqofTVBYBGyXv1JQiew3CHGrgUlcvALUsmelucd
         5c7E54mPumM6s6fqrwuu3o7V6yFGdg7FbC59cLPbEWr6CBj48mGP6bp+EiDVvab3jiGB
         au/g==
X-Forwarded-Encrypted: i=1; AL+hErFn/gzH5E5Xarnw24SeoRAz0ymvRdOvXj6x0NuNULpTvOHZxQlzTAPRAjQ7AceIwTlixlvRW6L0StRtzxL4yQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7NOA0Jg8C1xievWOiBqNYcrHmbFNol51DJlO+kpXxYDcsdF6q
	TRPoSVgj2EtcNuFA5xa4IidasGlyC9k3EgcJnlP6QhPAaOibtH7/G9lM92eHqiADas1QrjZvyao
	DWhofoe9JXfu/W79VxzE+ZLPrznET/cPMPDBm6pI1qw==
X-Gm-Gg: AYBFou1cOBjfas5XZ8AEQbrwdj70FDtsRxxn3R9fUhoRkLWZUDVZKXtN2VYZ+QRpWXh
	DFt3k4NaVyRHT1krBlCRejDeGFtPWYCxhFUwXc7B7jI2RJrDvsb3KXp07Uqtn1oNC3mrp6oeRXy
	vc1WVmPEl2FAmfVI/oIec1NiSQ/aXRPw8M41fFssSK4TGlcS9QVWCPMdYaD8TEtpvftzoqBOkZP
	WHqtIChNEBX27nqFOw4Nx/RVU0K6MTgqAhH+o26pGLdSgQNei9o1IJBTApNIVksk4NXq3KTEmCN
	fROTzXD22yCfpCNEXD+kYBxcGxyyaD8T2wlEBeFd5K/hSu/+gyjOf43BVgYsgBpFusK4sPge3/o
	R4xqi0h644Vgn/IlsZdIl30TZLJw2re16oH07EdfcXC/rl65TcXwV2vqoEVqW0qdndy8yUjFL7u
	wTK/pAwiF6Eoc+5WkgsqqD9nvL
X-Received: by 2002:a05:620a:371b:b0:93f:43a4:a48c with SMTP id
 af79cd13be357-9494bc3a400mr175911185a.45.1794525840268; Thu, 12 Nov 2026
 15:24:00 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112025252.71375-1-dennis@ausil.us> <179448342405.66517.5463730214277229760.b4-review@b4>
In-Reply-To: <179448342405.66517.5463730214277229760.b4-review@b4>
From: Dennis Gilmore <dennis@ausil.us>
Date: Thu, 12 Nov 2026 17:23:47 -0600
X-Gm-Features: AclHuK84GnsbCUnbGFWAfzcRIsf9sLCdYOCcLTFaLBRnNzS4e4KBe3sc65us-XE
Message-ID: <CAABkxwsn9bkx37C1oEuMC1o+5Jtf+EnJgw5o7pso8hGxxJx34w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: start rtd->num_components at zero
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, kees@kernel.org, 
	gustavoars@kernel.org, linux-sound@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.hennerich@analog.com, nuno.sa@analog.com, dlechner@baylibre.com, 
	linux-spi@vger.kernel.org, miriam.rachel.korenblit@intel.com, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> > Since the conversion to devm_kzalloc_flex(), the allocator sets the
> > __counted_by() counter num_components to the allocated length
> > (num_cpus + num_codecs + num_platforms). This only happens when the
> > compiler supports __builtin_counted_by_ref() (GCC 16 here). With
> > older compilers the counter stays zero, as before.
>
> This doesn't apply against current code, I think this is an issue that
> was already fixed.  Please check and resend if it's still needed.

Looks like it was already fixed in
https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.c=
om/
I missed that when looking.

> --
> Mark Brown <broonie@kernel.org>
