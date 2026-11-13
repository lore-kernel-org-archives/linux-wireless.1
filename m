Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558571;
	b=Zotu60RsuPzc2tyxmDgvUAxjf22UU64Nbh/mzj8PJZv72ratCV3R4yFmF4XHFsAdUdCy
	 sjNLoelQnlvOJo5OHo8lVmXsw/0avLVpWcPOX5VDj6ZgLHRplUxt3qDIYTD0QQ8mQhv03
	 AztjwrzZ693bI4Cue+TCULjFfAnqMv0cU+TYXU1ZkGFKMO50/v4MBE8F01WjvJx8jq3wq
	 OalPXCPOGCF1oV3D988H3Coi5dRFmqbo+AkQbNpbhe+uom18pZ43bCK7TaAGHIPPZ38FX
	 aWISBy1OrQWUBsYbYbAhSNA0GynMhvaH0NmKE5BAL71cifgLIyylgRGvB903oi8qMgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
	b=HWnf3/jMMjiD3mk++dtBQiWrjFYMWt892xO2QeFgd+fJbm8eCFXEVZ44+LuKHqAsaysL
	 P3702NlONbbc+cm4SrDM8OU4RoCkUSL3IijqqQwv7KAHSL/SDzDebkO9sQKWee6uDGgZM
	 ugW5wTy7sHU3H7AUfinAp1Fzhy0C+E3HUHqqwQh8sU4OVt+KtBrLlxskt4cOBSyCutqJb
	 1xjvUtDuOOChNZItWKMFMqMzGEQiiduFrbm9EWEeltVOo5lKbHektN6AqR9hxNj/krSxT
	 dgBlZHNcXH7Git1AOk1e9M6SbroefwiGUYhpB8UInOpVt0k5WdV/Iut1W5GH6YAaAxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anJkfSbj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99C60A3814
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A99C60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anJkfSbj
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91eb449364cso15189586d6.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558570; cv=none;
        d=google.com; s=arc-20260327;
        b=JpCjPNyfMsdHrx5o6BvElI7L4vpLzRX+309TRlz8ZZJ31+Cn2mIAcOkWFxP4EmtaDO
         LA/C5TGS+jOLtijKEwR2NnmcVp4K2iNnVj922UqCAph8lv6jX2o3wVmU9/bqSllTsYP2
         lDmqZRvjpCO2PR612gzUQve2yVAr+qBZHKAvx+uVen/7HvVqftv+839PeBvo41SKeq8Q
         p9NKkKt9p+GGd6z8c4CMA3M5GdNNsc4CyM/vLUTDmHWL3gJ+7xvTBQxak7q0bVcu9Jxx
         rk2H9WBd7V6ANGXtP4nBy3oqzCGOQRg1t5kJgpqStv1I70w3dAqY7VvxImts3kk16F/L
         pMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        fh=0s4bXjmUVcKEa4hVx+Hobm8APB6rI1z203ix07SZdI4=;
        b=eW26n3gIiw+zvLcjIuRo5w5C2TrwCwlcES5iHAGf5+fAHhj2Xuv2jyhB73ZQbdLL36
         LIc0TU/qBPGiV/XURTUR7CgGg9H7EPtFycLBp/4OKD9iiesYFTKUKIZtlF5RrVVyhSoa
         2SmuzWSuCrUqodWVGDG/Kk5VcIiSoGo0G2bODD6BUE10FJ76MCtBAy5I30W4DD4zCj5A
         r/dAkmXyN+x8vrydqJVxY1Tfe9rBAo3ykmk/9wXIFo8bbSPaMTpOPLt2MlERfx+eHlbS
         UVc2FWkrrnWYUOPSlE8C4ZWEn4ZYHu60OQ5iLES49W2FwCitT7mcHR2VN/734g53BbcL
         jB1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558570; x=1795163370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        b=anJkfSbjYUXwP6C6W1cjkNevxRSKt+cHELYHE8aFEe9stpNFmIUMD0ZgyHtdZwzMec
         zc4/ZOAOhHNEjEYMueE1Df1xJEh2wtTOkKpCSK/nOVWQBhxf2wU6csV9ufWeXeo4Jcag
         Wp7s84Zh18VmVtIR8IMhatLzPyFIuFAAetuuzRPx4Rn5l858fzaHo5sZgglcsfkJile+
         OamVnOVDyGn8E4oXkV6F+6/ljjJbao+CHtkPk/jM2k/4TGKvc+kzlgMlR+ubJWqX+Is+
         2JQCV1otEY80zeU0+c65aR/UJ/O0o/liBXnukGW5yfVtsnthYEnEuIy9CltG3q2zffip
         NonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558570; x=1795163370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/VFBZuAGyJu2CUgSmYUwGxL2qE8W+WmTuX+htbAtBY=;
        b=m9E56FAoWSOpg0R+RNSeMf8u1jeK8lFGpKtkIoEmdGTS26sUmL910GWeW7Ap3aPxa3
         3SxP3cgFYKTvDBdCdYMIB7JIklL9Qml5jOZLxb7HekAVOlUJhCPdplxYMoyNmXfvM62H
         nMimhOWYiF2ngKnFyobVYlt+mSR2tMSETEGmBnojLM59N0lBDUBARAur3JCkqVHGg95b
         sRB+GyKU4+QGRwj80uWrilEp0eBjWoePtHwJrh/s9JI20NDa7IjyFUNMlwgaO6jCa0HF
         M8gY0m0NmlC4X00euF96gxF1P+wwve/ZoFMwg74xb4dVVHAHwU+e74hXMlDtgJQz7s5V
         ULQw==
X-Gm-Message-State: APuU4Z/i9zrxzbjP6K/2ob3tDQxP/Z7A/lz9NtfeTuVizB+LsrcKpbQM
	M5mzt3/yvYgJZA2lgtgGOKFmU7FPJw8/1xJRVZGbt5HQzT6m2Pniib6sBA3lGomdu4a62zAImsh
	UwgnYnfia6osQF97ExCNRZcANpYWILVA=
X-Gm-Gg: AYBFou1K/bkDz5/MmMOCJu0T+uHMng4Y3Svv5Qkun4hAcGmcwCMdOCDXprFQqkRxP3t
	5KgJJZXl/T2QheKO2RM1NAliH4Y4IxABTsEUc9W5UAK8AWRp9czQ/9M52WuZ1EoIyNPL4grsX7K
	StbgDSlKi0hajHjNJ+VpNFIXbJcIqZAOwB4m+Uuf+VksWq2bhsCLdB8aom1YpWghOyGxzIXwFH3
	0hCXDIpmCSY0yHebHwxWTSYQnhIEsldrLdg4+Ur3lWLp5ndiOpJRGF7fxz3fkkq+H3kx+csg0SG
	ci6JmjCPRiDES+c0icXEMcYp+1Ni6fZbSCubCTv5O+InZ/x6qEePfQNeE71LEHeDKpZ9tVAWuX7
	z1f93sPCN2PMjPsAN+JEJQ+NmL3lkoafTynBeOtBCL0oHFaIfYM3UT7SrqQ==
X-Received: by 2002:a05:6214:c6f:b0:91c:133d:4916 with SMTP id
 6a1803df08f44-91f24258d3bmr27365136d6.57.1794558570089; Fri, 13 Nov 2026
 00:29:30 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112175624.40547-1-gonsolo@gmail.com>
In-Reply-To: <20261112175624.40547-1-gonsolo@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 13 Nov 2026 19:29:18 +1100
X-Gm-Features: AclHuK_22IBl1HM0EmP8TqULn6mARyFVsz-pBtAjutczCKWrwrUzs-czsdinmNg
Message-ID: <CAGRGNgVXgWeFVkTcFxYvGg-DOEsmpPQZ+atEF0fq4m=F+BHWjw@mail.gmail.com>
Subject: Re: [PATCH RFC wireless-next 0/3] wifi: b43: core revision 40 and 42
 MAC setup (series 2/4)
To: Andreas Wendleder <gonsolo@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	b43-dev@lists.infradead.org, Michael Buesch <m@bues.ch>, 
	Alessio Ferri <alessio.ferri@mythread.it>, kvalo@kernel.org, jpeisach@ubuntu.com, 
	rosenp@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Why am I being CC'd on these patches? I've never maintained or done
any significant review of patches for this driver, have barely been
active on this list in years, and am unsubscribed.

Could you please fix whatever script you're using that is spitting out
my email address? (Also Kalle Valo hasn't been working in the Linux
wireless space for a long time either)

Thanks,

Julian Calaby

On Fri, Nov 13, 2026 at 4:56=E2=80=AFAM Andreas Wendleder <gonsolo@gmail.co=
m> wrote:
>
> MAC core support for the BCM4352/BCM4360 core revisions 40 and 42. Things
> that depend on the core revision are gated on it (b43_is_ac_core()),
> things that depend on the microcode layout are gated on the microcode
> revision (b43_ucode_is_ac(), revision 784 and above, set once the
> microcode is loaded). The TX and RX formats and the PHY are not in this
> series. Based on series 1/4.
>
> This is posted as RFC so that people with these chips can use and test
> it now; b43 is orphaned and nobody is set to take these patches at the
> moment. Series 1/4 is on the list:
> https://lore.kernel.org/linux-wireless/20261014143225.82149-1-gonsolo@gma=
il.com/
>
> Where the values come from: the register sequences and table contents wer=
e
> taken from Broadcom's wl driver running on this MacBook, by tracing its
> register accesses (bpftrace on wl's MMIO accessors), and reduced to what
> the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
> init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
> Farrow resampler formula, the VHT fields of the TX descriptor, register
> and table names), and some formats follow brcmsmac.
> The result was tested on the hardware as described below.
>
> Each patch compiles on its own (kernel 7.2.10 headers). The four series
> together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 4=
2,
> microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC =
PHY
> only comes with series 4, so the earlier series cannot be exercised on th=
is
> hardware alone.
>
> Andreas Wendleder (3):
>   wifi: b43: set the DMA burst and prefetch bits of core revisions 40
>     and 42
>   wifi: b43: MAC core setup for core revisions 40 and 42
>   wifi: b43: address match table, templates and beacons for the AC
>     microcode
>
>  drivers/net/wireless/broadcom/b43/b43.h  |  14 ++
>  drivers/net/wireless/broadcom/b43/dma.c  |   4 +
>  drivers/net/wireless/broadcom/b43/dma.h  |   2 +
>  drivers/net/wireless/broadcom/b43/main.c | 242 +++++++++++++++++++++--
>  4 files changed, 246 insertions(+), 16 deletions(-)
>


--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
