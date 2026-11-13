Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558097;
	b=azDKftSOJgVtvqZOgUz2PalGvS6tkQ+sDHCQ68n/PxiTIzNujc66zwz/l/B9Ex1WmQ9W
	 SHdlrBnP3NelRAk/ROOgDSLtGzmZiBtz8Qy5TmReXVVKMivsvo0oQL/nh6EZsf33LcpVJ
	 vKEm5X7F4C7ViVXsF0Nc/HQjCCaj4/8AILwrTllOV9M1GZj05tLoI73CB50aM3NHcFbqE
	 yyJx61cepl8uPc8JDacYW422pkyOM3kE+b/2Whi7OUTH+Lhs2VDntfvTnwanUgYCr61qB
	 WiCr1SNWF3pYMBjXHvy82hijcWsfUuE1tKk1c6DGUIl4r62tYcD7AzeC2Vhlpr3Of6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
	b=SIpZM28i3LK7LvcTovvxWdSOJ1ujeNA6AVQCcnY3NCV7L0crV9s33YtDbC5KmoN5A4xL
	 WOLv9G3NhBKERdgkbUfTm6d3wg8Lrnq+vqKaqoF17UEhnDK3RItYMBEEIL5SsEQr+eIEz
	 PvnOlZa6EcMHnvR2DYmfkwKa9v0LLn5S7WSWtA1G+HEQyY2b5oIFZvxpKIDbqG6NfOXsA
	 6aDDtXhRo7TDgUCFY/VOHRAKAgwUsZEKIPFw92dL6jWT6oZQBDHRlHT2dZberXPtxXvNc
	 hDSuuQhMjf8VT6CbWScP0JBxoYxaLqZZFse3Uyq+a+mA5jeJk5ssLDTYTe2SqqOdVXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHuzErJV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC7606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADC7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sHuzErJV
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-703be215729so194059eaf.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558096; cv=none;
        d=google.com; s=arc-20260327;
        b=bkKpPwP9YYvGKjBlb43lvLYjouskxEmV6hgpraWQpv4aXD99xWp3T/6LlvXNAXqmyN
         5ACfKOeJOm2sMnmWEBkGJXu66CrC8G6QLN+U9kGjO/DjafkUjPklXWHc42Bjd0qp8w/4
         +kW55PUVF48DimN6E1vfbMKwDrlv/nEGL8bB0Czoae++GGELjtRk6wtTJtTJk2hJt213
         nzWDvXG01Gk4eEir3Pd3PtdH2P1j6WJO7LwnNHcWUnLbDVnyCsb6n1sVWz9OMtTYe2eW
         gs7w1osSITdaYbC6xYpGjx0Uamw6hR/l7ALAqpG/UFWXdV5U7dVpwvnpPD3r2hjAQSLa
         29DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        fh=Luyeq08C5OKR0/aZCVoX8bjajrGcqYAh587Fbivhv84=;
        b=HlZ1NVnFYcihYYjMYg3W/B0BDWS9guy9b7bSeideqqHYAqzpf2go5AZNEsWDXlSKm7
         GoGsBdFKDj4Ymet41wDAQCzM8FD1hp2oIApvcmmbJyz4zO9SB/JRZB4zk4g+psvtqUED
         JqjP8D/GIIr+P8J9l2ezuWBQAIMeyw49TGLZO5NUMT6w3cXXIZamVTcSzl67GJjeMImN
         s1wBoGTqskzop5BCy5drmSF43c5CEZQbFA/WoA2dHLyGFMIOTZmW7fm1/9Cwr7tNbyKk
         REPyZRttQkOki85D0ShfQ2/MeCNCpegL0CKErCAF1oGr+86c3tSje+MIW6+xz6PoJBUt
         FXTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558096; x=1795162896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        b=sHuzErJVzomgiTelK29LPNjE9twCNleZ8A7LRc3j69JutjscPuukUX4px2pZPx/P9J
         mpEn+mntl3hsoHcxJ/kT4G21sknlo2Cxlu2NFh+bjkF2NVExm3h8KiMZIM3nPjo5Ccga
         zFSTwpdxD3GKvqd3Y8cIHoof96hvAormhnb+meK+xCAbtkoZbmWYYYXiTmAvB2R9LN1T
         crOnhPxkoiq/dkFZXZJHHCjZGzP4SYorFUWjfRg3sLcW4kb6LTqK1cqHg4r3lDWDLdEi
         1o/D5N0EB2DNnxa47+RT10QxcpnSvc0xgCSGyDxWrsDTzHIqmG71oLOWnXTXHky8f2PD
         /FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558096; x=1795162896;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGfzQKRW9n3iDF7EhAvIDmtHZ/Lq1Fi9s79BDzfKfpQ=;
        b=Td8rGuTvx/ymkghXOJuJJLekL6i6Ykabv9YdIIGPoxLxnl/EpCEw5HSTkKbR58pQF9
         t+uU9/X9/D1h/nzCA2T710RjtAhXwgkOOYrmabACZTuoijDSzeowCHnjyBP4vIbuPkEK
         KkAxmOxREFTDtgFuJXYRVMIDPy4dzWvClEY2nMqO+DT3FZ3wt06GEJUwgUSm6sKpOF23
         EeGk6pguoTcNTs1eIitYDaNcksiRWL0t2z5KpaU6xwWVOzrh7NiIOfXnTBLuQuOqQbC3
         wcyZzlmGT1nUpTZW+lXnImvTZ0eM2sBVOZK3l8Ch9KSsO6YvkTdP/dNFlB1cv3x67ZAS
         OAIg==
X-Forwarded-Encrypted: i=1; AL+hErF7PlKu2Q0ZhxMyEWd9OBPZXEzcVOzQTFBANqKh8W3zYrwep7cywWuZdYcW+VUHG9O179vto0MURM/jiLWZPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+r14G5gC0DNs37GCZkTgRR5SQp52KhfS574XtUd2IRCFHXPPc1
	ZDcSZsbTXR+fYoyilbwpu/2q5HhxmOa3MN4pglUtwfR9rYl4QD2hVu7Sl5qfCLWkdbh5dg5Vyos
	6zOJFIiZmw3l/m3WSTN8cFw8qyWONOdU=
X-Gm-Gg: AYBFou1HL0J88pvRdBJBeKQfkfozaDyx3S4fNBkqPr7fZsWBKgWYBkum3TsOnPuVe88
	y+qK7ldymKdd/Jrq0s+1I77iR4dljQ4x50BYoQmlhphf1eYg6LV9Tteyfme5DBMUcTZyA2bfjsL
	+yQWNncQqFUSmzaiKFH7stvU66w/kpNGHaoN6h/rCGlgZTmU0DiMLenWBmrMPiFTwGcgfepHVbM
	5Uf1kCsmPDTGHvHb9ckP0st/0/LKTt2tjoviITFNX1dXN/ogCm6xZEzuM2LBpeKH8ig/9JJVrJf
	+OnVM6sm46opminvugclX/O+S6T3RnQ7DN5FTqtOps9xrtuoRukrD2H81HJjaYqtvliXm+COgcA
	TtniJ4X8QSeA7SL7FP4sYDNMssJfodCNLQ5hwSPlp5mdxV8TC5g4gUulcjk8VNl9FtUylvLt9hi
	whhz9GFTd5rt/4sMNT3AwHnFFNYHnQE0s=
X-Received: by 2002:a05:6820:891b:b0:70e:2878:8d7f with SMTP id
 006d021491bc7-71ab521aaf4mr673667eaf.90.1794558095789; Fri, 13 Nov 2026
 00:21:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
 <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
In-Reply-To: <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 13 Nov 2026 16:20:57 +0800
X-Gm-Features: AclHuK9ZhDXk36FrDyJDIOdq_rY7JNuByJ2PhL4VB5kN5p2s13AgmX_l188dn74
Message-ID: <CABOQOSVz0M4G2mzwtb000Ss86PjoTUwKvfoRQziLwY9DAqdNbg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: 88xxa: receive VHT SU
 beamformed transmissions
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 16:09, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Two more small comments that I missed in my first reply.
>
> On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> > index e35c57c9d1..c2a18f6be8 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
>
> [ ... ]
>
> > +     rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
> > +
> > +     rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2,
> > +                      0x0202);
>
> The other values in this function have defines, but 0x0202 is bare. The
> vendor code doesn't name it either, so maybe just a short comment on
> what these two bytes do, if you know it.
Yeah, indeed the vendor code is full of magic numbers, I don't really
know what they mean beyond guessing.

> [ ... ]
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > index 5ffa29d181..128a18ee33 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>
> [ ... ]
>
> > +     if (rtwdev->efuse.hw_cap.nss == 2) {
> > +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
> > +             csi_param = 0x01090109;
> > +     } else {
> > +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
> > +             csi_param = 0x01080108;
> > +     }
>
> [ ... ]
>
> > +     for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
> > +             rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);
>
> These numbers are hard to follow. As far as I can see csi_param is the
> same 16 bit value twice, BFMER0 in the low half and BFMER1 in the high
> half, with the layout rtw_bf_enable_bfee_su() builds from named fields:
>
>         csi_param = (u16)((coefficientsize << 10) |
>                           (codebookinfo << 8) |
>                           (grouping << 6) |
>                           (nr_index << 3) |
>                           nc_index);
>
> So here codebookinfo and nr_index are 1, and nc_index is nss minus 1.
> Maybe build it the same way, or add a comment. For REG_CSI_CONTENT_VALUE
> the vendor code has "nc = 2" and "nc = 1" comments next to the two
> values, which would already help.
I opted to avoid trying to add more meaning to the vendor code, because
I couldn't be sure if they were correct. Rather than risk incorrect
documentation,
I just put the magic numbers in, since they are used as is without modification.

I can dig the vendor code for some confirmation that the csi param format
is the same for the later chips as 88xxa.

> Best regards,
> Luka Gejak
