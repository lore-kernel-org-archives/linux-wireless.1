Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795880958;
	b=XqgaXOCyPM9lM6r2IDH5QjJl7+uiAzpswDHk1Pd91ml8zbSzgxGkBmjNV1wK1RvbEV85
	 XytjqsIa20xK+r1OeqgRtLJ4i71n/HGVozzqZVHdaTgDMmgN4mo+tzMyPNT7Fgm5yg420
	 H32DD6P9kb9mQzNlswd6LYdQ7EoG3LwtgM82LuKfD52Rdiw4+h9LE2fIO1+ZhHgqPu97R
	 IHo8OA6cAv++xGB4Xp0Y42f5A46yxOOhuEj2RexS06WMzhRHGPJuXK1hUpRc1vgt5Yz5a
	 oghpLIyrah+ijNi6tgobPQilEZ6F+zc7HX8HhYm+zSG4bu0TVtso9vVt+pHrDhSUm/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Iem176l+/beNm/bXUY1odjWLpnoe3iRpkrmiYvpCNVc=;
	b=zly3YIN4S0xF613c005NcQ1f4ALzfo/Tj2z2lfYtHGIhrjDJpjvKO2Sgbpd3GmWe5yqg
	 OyTHmVl5nOmxOoDyPwTc94GlvB8ij7qGElZN2NwEgXURGpMNjVelzHL/PvcOwbLpT0a0J
	 hVF+Mm2U4+O6/gKJdrBgE2soUQkFFIVsss99XFAnySMNydvSTuJEGRD7axQROJfdCxYSM
	 y7eKDzQwDO+p5mPichItoXXcYnqNx/onW2iQOoWidB9f9/H1CO4KvJOSaTJZV1+hZAKX8
	 kRQkLyMn8TJFo/o/sJsXpg7cYyO0opsv7kziV4NyjmawFfZES4LjrP5bR5az103geIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f71Lz3i4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22834606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22834606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f71Lz3i4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862b090e3c3so4724195a34.2
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795880957; cv=none;
        d=google.com; s=arc-20260327;
        b=HwDXr36T4+tgvYupng2dqh3oVCT6/IThCSNH3WQhyVSU988ja6VL83oP94HzZXhWPo
         IEhhB/nwOmbB/4Pjxywt/xodKDZmCppPAfOupIlsYMo7SUDmNE61FxFg86Q1WRS550+v
         xDgZyuOoenXwxghiOlbn+bTEOIquecIdjCsI8HcT4yCPRR7Gt5ccXHqgZTheLOZ7LOFi
         E01/GPepQUPli9mcloU1U5dHlkOc2amP7MpKTTD1coq0lFI0tKWw86Qow8Sk2NlFAHxO
         0qh78Uu4UjPEcB39KbEXBtbWw1ieQlEfSLthxDKIaG3N2ye+RnAUkrzl/gAuByn6gd8Z
         XIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Iem176l+/beNm/bXUY1odjWLpnoe3iRpkrmiYvpCNVc=;
        fh=jyeZuGzR71yKqCeM8HSefNcbnnVm60GV7PIpqYJbIq0=;
        b=fDZrR9C774fdhHeDthcUemNWK7pmhKfJhFnrSAihwTj+wXRoBVeX1QgZRtGRVlgNek
         rttnrLppTTfnj2PNs11GB7L+jAcsDGJv9Hm81J8F4kFBfdOt3BpZZht16Ao65EtX54na
         +3YoK+IXpRY6chJkiB9VQh5PxGDIx2bX1vP/mkHH34FS+EA9Y0Avl7hal/YR95tRNAAS
         V2E1XUv3xZ/ZiuFSAiVTRhppokg++DRCr0Zgn5Geyto4APU33ThwMrP3t+ozaBHwYJr8
         kj3/VLvWjF8GGMd8hJX6LZWZx8CENEeNoasIDx9eYegdn9RDZIKMEB+LxTqP0mHjeA0y
         NFaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880957; x=1796485757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iem176l+/beNm/bXUY1odjWLpnoe3iRpkrmiYvpCNVc=;
        b=f71Lz3i49HzGfNPnqtWpIwGDSbHa/Xs51rq4jqNTilV2SFyjpgth5iKoNaaEPzokpG
         EAq37WeF5L2DwNNSVlxdcadrNDlmcw4e/2l8CswIGpZc8hih9UWfMTq1VaXqXOGN07OX
         lgDsu84aCaAua7T2w0ta5dfBnBG6EXudn74/dWi0q9CcdcNB6IefCLbZmO/RSeNOXtRD
         y7yeorSVX4HXIHNI5VKTFyEYkTuitU5R0NhmTarlV7rsWHXzAmiwPaykjtTj2nf2HDcp
         hL9NCgRbgApwUk7r2OkBLHMT396qVORT3xE3T/Zr33JbeAttVfDuFHBwc+g7sRBSuVH7
         szxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880957; x=1796485757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iem176l+/beNm/bXUY1odjWLpnoe3iRpkrmiYvpCNVc=;
        b=srfchYEEHL1NujP70JSKRq7bfbbuguGKrQ1bpljk41l3up/gck/p9ToMYIn42PO00t
         na6HyJH8Nkc9SwR2HjP+X+8sGPp9Cu2IoXLChl8P5WHlaFQpCv3p513z+/A5c3BVfoHj
         9FUZRhNS2KarHyvnOz5o4vHCX+lbgoT97g4IT5S3QsNNIZQCY1B8jLZOf2ASh1/mG3XK
         sTPeuBkvvCo1sxX1l6nb7c0iGrqvj2LYLJFz/aAbxLpi4QfKsy8YSSWRtGV05RaUBLrV
         me7tMBZGCUWZQZclhC2Wbpl+8YESgUhZvih0ZxJvFLN68MJUvJY8fNp9VP8rk21ldtgq
         KLsw==
X-Forwarded-Encrypted: i=1; AL+hErF6mFKinuI7xQX059A/8/JhGjuUfdoB4DcKLxeUPLskAG+ITx7dPUCGPOCB6u/RcwHGW386pG+leskDyxfchA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ttVcaQjhYyzDfNZan/Vma6cmUQm3OqjSaIUDXrtAdbTPaVlnZ
	TVkxTHBj4uZStZO/3CEnv47h5x6mVII6l81pwDq8uhunBmO1G9sLtgApR/8/N28Ql4uG3WY+vH1
	vKYvnCIg34DeeTBU2HxIXvGG9vvRHDtE=
X-Gm-Gg: AZFdTZfMNyZxfvytc66HwtunBheH78FR9SLu0KJWjBtcdLQG7sb8tG2sfJeH4ZxKYYL
	cWxto23YrJLrsudbZWqLtDdXhvQiGIEZoe2qT4iNf2mKJL2Bi5SoP7z14x7J8rQbDYmmLwuZn8c
	zwwH09dpLzHc5blwZvtkmuf4zemOUbJ4PWyqF0efZcYO9e0eaTu3D8Gy8liPnBCiRr3npwn3pOT
	Ina0ZFrpQy+m3yFQLG6Ena0AtKRCl9+kdiXuBy4YVlVX2H7coJml+U/WowLnA4FfTJU/ofl0lym
	A/O7Bv360RrMPLdZfticF722oD16cfc/jbrG8NbnxIhPrKRjlsi9IOMZ/18zM532pJeB7ON8T27
	gn8qexPPb7LZRAtB6v59AYOkgW2Pmhu2hf+9O0rdK1jkolpf12cDugr42MdsBNzENa1FviKwuY0
	Bh6VgBzf6CtR7CWZ4qqtWh3v3wH5uF3OE=
X-Received: by 2002:a05:6820:1504:b0:71b:8238:4e19 with SMTP id
 006d021491bc7-71b82385426mr9694556eaf.5.1795880956955; Sat, 28 Nov 2026
 07:49:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-8-hjf3108@gmail.com>
 <8C60F8E1-BA73-44C7-B837-9FF401391234@linux.dev>
In-Reply-To: <8C60F8E1-BA73-44C7-B837-9FF401391234@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 23:48:39 +0800
X-Gm-Features: Aa3M54rbuC9MkRIaVBaRdbfr2bgVC8x51fmSf4B0yk9N9XPpAu4CGVlAJgjTO1I
Message-ID: <CABOQOSVwrt-CNGcX+MkBtewA0Yx_LqR65mbGqWT5J9x6QduaJg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v5 7/7] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Nov 2026 at 23:44, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> On November 27, 2026 7:00:27 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
> >Previously, these chips had no set_ampdu_factor callback, so
> >rtw_set_ampdu_factor() returned before programming the peer's
> >limit.
> >
> >Honor the peer-advertised receive limit for transmitted A-MPDUs.
> >
> >Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> >---
>
> Looks good to me,
>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Thanks for reviewing all the revisions!
> Best regards,
> Luka Gejak

Best regards,
Jie Feng
