Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836725;
	b=ZI6OTXsfK+CWSbKxbDkNYHSkYcXV/peGquR5y9PjYR1Eez+i94/uLwgWta0Gih0uKQcu
	 9DHeHSA6pdlYF0YHWprz7vaqglnHaZzf2Qu0LjoNDgUomPzp4FFOHKJJCtaYl/jpaDZ/n
	 eVotte3q8trpq3ihdEaKJT6nVpvc+VoyYWtwL8LDdhbyKN3R6OMvz4kclNPQFLcwS0CxT
	 4jKDCmwMr+yJkEbDIcr0wYGKExNYHXaCrIw1sJTEM0BxYoL9OTjtjmmClSNWWVfTcK8SC
	 vzBSib5kRfoDJ1fudpipRiG/rFmwxe91oGMoKNHOxBhTuJ86qT9C21W4rAjrupNuQ6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
	b=k8klfwvkiqGeYX26QezxAd5K+S8xs3gsbpE+NYC9pDKTDQNX4R0kJuKJ2rzXqizOT9Gn
	 zDeJzcOAYFMiWQGdRTTZCJgPngQES58v2zt36BEfUz1am6hl7XmZ9Ll08o1Cgqq0Q/wY1
	 jaj8AgomjKi8iQHGkXjSDDpwtCBTxU2HxzyL6d9yBsXdsRz4WVDWnjNw2ykYZxhruRzw8
	 +BtAvULvI3cS+SIUJ/rvQHT1QKtBx43h9ZpPo/sVcfDp1b5ivHQxBN+xIaSd88/XfYC2v
	 gAOFO3utaanH8aionw3p/QEzXFPp5COaAQ6jtpa9PG89oNeASNGFBoxQzpE/PM652qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gwSa/GC6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EFC606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwSa/GC6
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3ad104bc8ecso16843251fa.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794836723; cv=none;
        d=google.com; s=arc-20260327;
        b=aCnZC2mRuoQq80mr/hrazyNVQ4pzEE5FhrP4hRmxzVfzZLQuXjyXfyIMamF8EYXWuP
         khKEa8psPzVs/9Fq1WrhZVrCVwuSIT0i3dMIirDoe78hjzLiAQhawwix1hgwmFqs6ozG
         AyUTqv0FkPbjYQk9nR6ZgwlphAAYgRKUX+HH4Z1EN3TO2P8W1UCO8Iqs2P+/AFPMuu5X
         lqzu3SoBZXLUr3joXoTHjQZtlpMBVMYwoONAZwqKGOAXz3Zf0U3zSVq6foxDIdtLRPpt
         TwTrlM63eOtQNaRbigfBiQKbYtZnu2n0H8p4UytjjIvBlU04P2vHVwapeVlJBf5n0mlk
         Nf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        fh=5OygDCCh51BuMifypfRHOm2+jyT/cOnnETDxOED+SP4=;
        b=Iw9BVAoi/KJ3OBAY9A3udzpKRMcJ/roXnCBV2A9B7F8lOMhfKvBxylIUXZCcGpHOpR
         C+1neLT0kbstv2Tbbmf9SY3qIyr0u7fYMeEwXT1MPkKf/DQY3un9B+/nckExE7Y8WIrQ
         ouJL1boTn9ZPE6XgEBXX5EN5dFHuFiDltbB7rXxVsluiwmRJlMgiqFcg1Fo1hxYWnw6D
         HEgVWHc+4jFJ6UuT0SUgyB90dZrD9+d5u9LOsp4WmInvtvePo4YryrwSgzvzAY08MmnA
         VGU7Ce1YAyqXk3BIxzSChN9PPfJbeYrK8IdxFY17UL7NKmMFI89XETdglFK5OFKoITlB
         x/hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836723; x=1795441523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        b=gwSa/GC63pgr2q5W1+uhEpCkbq/WCBEU31JLYLPhsrNMreDR9Nzh+Pd7kdwrSo12LU
         +9dfKPjZj1QT1vfmeeE2YyKGqXelUp/cexnj2OmGSaw4MNpfvh/IZITZt57C4emhnGYz
         KO2v5dL6CwMx8uVOcgbZ+nNyszo/RzTMPOp3QS8eEPNwq3od4imADGw1DZPTiOSmOB85
         JQRzIfXyS8co3p0LCac+g9JrudVLU3J+TnoL7cWzP4pRqT2bQtMJCd1dF3umoXzwQl7P
         CWm+opke7QR/6BCeA1FBWo3tD0pQdHC0SKUHqFpaoa6a1PHabIw4jECx3GCcwXn/NmJG
         lxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836723; x=1795441523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MfPxpD3ssoEyoEYAFCC9TgbZ4F1jgbdjRi4UtWFAug=;
        b=2e4L/jPZLbMwSq0SZQZqQBYuDZ3ax/iqyyJoYOz5k/L1AWsWk4EejDm0WXA+mxV2H8
         1TvAdDtsJ1zaQ2XRgVMBivhiGYm03HFvR7y41VK+SmyRI0fuPEju1/N3ZzdYufHK4wAS
         cjPDm0L59i+M7AiBcJu5KzapiQUI267tjVbXgPCkP+oGqg4QslaV7BtMhyHzrXlxrSEf
         dp+mBWYaGk/7pqXBfCqXJAODROvKDtlpWDAblpsqGGa+9bWL3JB7sJh6qUs4vpnw7s7u
         PuFSRzyncODfsgRg1Ammtjh7h7+8oLOhtroAjjBk7aLBGZno07RA2PHXGlPC+hiBuS04
         Ie+g==
X-Gm-Message-State: APuU4Z+1RKL3U6NCYEDx4TIN821mJK+aDOhJIplJnx25NLZSX+S0+bCH
	L7866CvXdwGmxEtHKIS5d4S4bmrVns2yRwZkgzG+0Gf2qYuic4ZYzrRp1YBa3X39eJhHDr6YXsW
	I173o6kfrsmtV/iEOpogN1h4Bh1Lh4xje9AgLdyuJocZV
X-Gm-Gg: AYBFou2xZ2zkPquL/8wa4LRWITmrANQDRzjupn5Sc4F9RzZrBqVONpyKDW5ImpSyoz0
	3Df/W3ffJcSizeqFKyi9msqErOvwJDuMzuUMYt5eBkYOIkfMi/ssjl+tlsp9XyPWrfRmTblXq85
	CyxPItM0ETNXPOZjOjAaP1KTvTrnOnDOBaQRG1cyf7G8p/ekJmEqITkcslNkUTQmXrj4AMfT37A
	iiGAeLG0oOJraR2wI5mjKO6hvmr9EUyCBc32vO+1fKpa4DcVFErt4FF/BBc6LYeyyfnSKjX51gi
	QchzsAiYhzRmuIOs7EpwQHJBQLrdtEHcvKcJNiU1LWDM4VJKhi1AfwM0j6z5urkxrR8omZpxJLN
	cMdQBGidbyJBMVOoFmH5i1UWZUn9Aivs1q2+XQfjknXKcxjRL3TpQ73grgghE/VtQ+bvyAQ==
X-Received: by 2002:a2e:ab0c:0:b0:3ae:90:b8a6 with SMTP id 38308e7fff4ca-3ae2b524882mr30549221fa.26.1794836722999;
 Mon, 16 Nov 2026 05:45:22 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
 <87zev9t1m7.fsf@toke.dk>
In-Reply-To: <87zev9t1m7.fsf@toke.dk>
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Mon, 16 Nov 2026 21:45:09 +0800
X-Gm-Features: AclHuK-uiuuP0_wdfUnnUvGj05nPd6NTNUzShHBnpf62vHOiGyAMLfWUICUj6dg
Message-ID: <CAO-4RZ2Bwjtg=6o2gL2J0y8EWKLNrCW_Vy7sbKWhQ-Ga9a2A-Q@mail.gmail.com>
Subject: Re: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet (v7.4-rc2)
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Toke,

Thanks for pointing me to the existing patch!

I tested it on v7.4-rc2 using the same Kernsight/syzkaller reproducer.

The unpatched kernel reproduces the reported KASAN
slab-use-after-free, while the patched kernel no longer triggers the
issue under the same test conditions.

I can confirm that the patch resolves the issue in my tests.

Best regards,
Zheng Zheng

On Mon, Nov 16, 2026 at 8:14=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@toke.dk> wrote:
>
> =E9=93=AE <fengaojigui88@gmail.com> writes:
>
> > Hi Toke,
> >
> > We found a KASAN slab-use-after-free in the ath9k_htc WMI event tasklet
> > on v7.4-rc2 with syzkaller:
> >
> >   BUG: KASAN: slab-use-after-free in tasklet_action_common+0x2ec/0x3b0
> > kernel/softirq.c:988
> >
> >   Allocated by task 1259:
> >    ath9k_init_wmi+0x49/0x320 drivers/net/wireless/ath/ath9k/wmi.c:95
> >    ath9k_htc_probe_device+0x203/0x2650
> > drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
> >   Freed by task 1259:
> >    ath9k_htc_probe_device+0x292/0x2650
> > drivers/net/wireless/ath/ath9k/htc_drv_init.c:978
>
> I believe we already have a pending patch for this in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20261021120237.=
481898-1-toke@toke.dk/
>
> Could you please test if this resolves the issue you're seeing?
>
> -Toke
