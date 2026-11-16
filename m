Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794812080;
	b=zKWfidQ6q7nfFuU8BfoSMWDK4UB02RXC4w4GRaB/1wgL3eWLcNNkxNBQaWrnvd12XQY5
	 axinflWxpQKFH+4LGGzYzyprksvhvqT5XHzg1BcQMEqN3t8fpq2EPC8HUWdiOxt/7g0eN
	 6MiV8WYZ372g50o172JhaQJpRYT4L+y1fZYHEDzeCE+yEyqpq8SK0v++bGfdBlvd8ntJE
	 CXLEbySOhNeem0pTo8TIX+WFK6TvPn/t8IcGuJEz5D+S0vNaLX2SiFIW7QpLETftTZG49
	 Xgb45C6368ZUNtlEvobt9SSFfPovw+pamYLH7OjjZGfD0CtwOMl1DxQNCeS/vJwYwhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
	b=yrCXbtz4rE4wf0tngps920TgnNB6FcvAnnwdqr2EdZg23sxh8UsvcMoV/Ebt0L8t37cG
	 11mnQGJbErA+YfxPlnaphgU8VFED9B1GLmsaGMeXnZcLkZrwZ7z9Ek0ffQC0Ffa/T9IZ0
	 NQeBDa1PIzw7VTIG3UQHiPeOsqcuQNBmmZ4F4bucMjDj/r3xtImGdkUO3Au3rLKnSJsQt
	 9NDSrRC5kiRJVx8gidyaqXxz+aGDuhZsFAx5me3DevQcfcJaYQZSS0JCdg7ZYoJ5xoWHT
	 A1642na8ak2HB1gKTkSpKDnXmjWt59CuulbuFMs/BYXYZBzp8pXu5MaCEJBDTpEeDAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiKObOuX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C35606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiKObOuX
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71adbbf09d8so1089604eaf.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 22:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794812078; cv=none;
        d=google.com; s=arc-20260327;
        b=XVcZj6VpA19Ag7rUFNtNpw2h5X/7eCKQYBQkiYGrUgG0NT/Aa1o1h+t8G5khBYwY9B
         bE9YRom62/kD3fLGNzBm9Hlm09L0L2MvPW+KryKQJv+/K+UMtI2MWhVPYmGCTrICrR9v
         rMmQT9wW/Qq85XM7aUx4snDUgNkv20Z2LmYjWzQCqrRz72sv4IdjjkWaPMSfA2wZHZGs
         czNEgzsWivNvInRYa3lMR2GL64BNIJB7CYeRwngcC/2ekJlf0Zw6sIuzH0NkdgB5wotS
         rA3ZIr4C0/d1UwN25Kzq3Vw9UgRCSLnN6ZKP0OfMUcmD8iNLlIe398nSqzIVPNpcwFj6
         VxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        fh=y1ntvTlXNjpRhBBgsDdovBt6yXe1uBr2x3Ot5PgVdks=;
        b=kfEycXrqwOnYXeh5Hkk49VbAS+uYX5wFTDqoLRGSuna4c30bs53/dg7t8hXE/Kd0as
         s5hiiaj4HRzbYa9vy/qcQmdYFmdmmWbMVPBiJT7xhuRZmlShy8W7WikH6uo/aUWRgyro
         Yu+RpZwokbwqZAn1i4coI8vfC9j/+dXHoJOyF5Xed5ic4r96foVJtwkebKfd4H13Hrom
         JkFI1up8dGZWS2i0n9UEALo/Hqy/KIkpTqqZJs77odoNLedPOx8yRxKugrLHdwColnTL
         e67ulPhk3IdKUH4pZanJjLZogxyyrqoTyftUb5w6GRdgrG2eALGpTE96afhlPBMSHwTv
         4e+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812078; x=1795416878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        b=CiKObOuX/4GgFxJtLA5I+w2s9HzZVUU1MTFOep6PKcQ26TEV3aGaAp+5bek4fY6riJ
         1Nc2t+DqI9uWpPBQx1VjDwHnV8inaHKKRyzDb0jt40ZsqZ9/NDDmVt9bAFQ7TcyfGxoB
         DULsxSBs1dNMY62iSGuw9AKq0DvKP+1GMqPfAqZvs6WgmwIlOz6sV2Gt0DOjvtDCK29d
         rAO9aLj8g3Xt+fIgNU7Z37gW1tR/FkftyFw5eSZIdivrdkOEw/kl89Xji6yIi1UP6C6s
         cGaN+2j+/v370RqPUbU84HqQHJ7Y+vSaI3H8yzwsEDIwHWuELBUjuFv/HS40M1zrsehs
         os8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812078; x=1795416878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GCa22WYDhr12KkfdMsjsskbSmYxoFUogucBL51KQZMA=;
        b=lB3d9NYBHCz+AkUNhrPTH4o10fhHs+qb6u1rdKvxe1r4iXHeO84Mgv49OLbtDvRUuD
         5+G/rTDb8RCJvhzWBCMCF5tCGLpoxPbWsNHmMlWcWD7Gyq1sAsoLfeFHduEFNWFL1nEJ
         lRCyKzzvgnlK3YeYnUmN1XnZz8qkyEtubXsbrEguFU9q+79QTyRNEDxYywsSAdcabwn/
         VmBKfweCZnUQ05IROP/ireBWgn2rNwiPgiszdROhO4PrvECq65i89AO9xbpjedBkb/yr
         IeilQBK90y3YGD+rDppBnJKWhjImZqWHrUcEW8PD+Morc/jkA19hg427TQhrmfCUD/9f
         PT5A==
X-Forwarded-Encrypted: i=1; AL+hErFINIPNCtDbZxx1K2FbfAr2rLFe3GZiAkvwPN9Ncq+pS9g7h0amu7yZ+NnEnsSARbg2RKTR5JD7NsXPekFhwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vYg2PUw2l+EDjPy//Lta1p/BeAoW9JI8R5RsWJ5CqHH3xsFFa
	wMK+IBwRgHDAhnhLvf5D6Y622Tl88NnsDsmhrqaS+YiTnjUVSTvAofstTDxVDPWO55VjCp2omcI
	xSSpLRGwbxeeQDv2Gb8O/L2oM/rreLzI=
X-Gm-Gg: AYBFou3RkNugq1cHquyeyUgdXjM4op5UkWsvZaIm4AmJ/Q86Gnf1agsveXdM0vb+Uxz
	b1mkr51nfup8BQjy31OIoknv98Ym2KvM3qAT6AvYWQqZ1mBUpJ4XI3eeLeM39jOdfsCTsWyPdhQ
	OUT409+CoFs5ty8pSnO/ARWeCuZ1GrFUIQg6BwLzCozQE2f31lQGEscRLB1y68iEa/zyo8EAOcM
	LGnQ3xYCGtiUBbjjDq/vGB+sd63bAn+zDj+PyIhvKEEqofEo4sJKLn9cz3NQ8R7gArwAzYEHwdt
	0YD9nBEDYGnk78QTA8+/VleFrSIFQcFDyMSHFdn+n9Ezdy17SEVS9lGzpiCPN2ZB0xV+HB3Og1O
	QWfFmpFxnC9Y7546xMhRJPnD53Cjofx11EPiDYfHwYP4gzvO37FVaf/uGEcDl5midKyHNKNV427
	cexLVDw1o8QgEdEzPbZRW11j3Pct0w/PNysbWJYFnu2GNJYPOteQ==
X-Received: by 2002:a05:6820:2485:b0:719:d9b:d750 with SMTP id
 006d021491bc7-71ab5228714mr4043224eaf.38.1794812078431; Sun, 15 Nov 2026
 22:54:38 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-2-hjf3108@gmail.com>
 <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev>
In-Reply-To: <56FC313D-ADEF-48B2-BBF5-A4DFAC129C3A@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sun, 15 Nov 2026 22:54:02 -0800
X-Gm-Features: AclHuK_XRmXcfYCSWosOm6Y6HOd1DVl8wfnRRgwwmGcmDHiQhzYvKhagZ-zvSxI
Message-ID: <CABOQOSU4Oebap-U=6oGa_VQsZwm4szumK93XFJ__w0Q4f25=iQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4 1/7] wifi: rtw88: 8812a, 8814a: enable STBC
 for HT transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 05:35, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the update. Two comments below.
>
> On November 15, 2026 12:43:27 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > 8812a and 8814a support STBC, enable it.
>
> Could you mention here that this enables HT TX STBC on these chips? As
> far as I can see, VHT TX STBC was already advertised when more than one RF
> path is available, so that would make the scope clearer.
The commit subject line already mentions HT explicitly, do you think
it will be better
to put it again in the description too?

> [ ... ]
>
> > Tested on RTL8812AU, STBC packets were captured in monitor mode.
>
> Were these HT transmissions from the RTL8812AU, for example on 2.4 GHz
> or with an HT only AP? As far as I can see, we already advertise VHT TX
> STBC on this chip, so a VHT capture would not confirm the change here.
Yes it is a HT only AP, I see HT STBC packets in the capture.

> Best regards,
> Luka Gejak
