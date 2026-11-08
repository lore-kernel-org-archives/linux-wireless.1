Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161580;
	b=lxzu7CG9zovGjIUobfDCR3suY0supVSYl2Zw6m6DM6iUZxeAoGpWCuBFMRVN31VcuSOc
	 3GpXz7vVPaytD3kzrvzIGzNyIHAt5SsuWIfzoWIfMnUCU11Z/ObGhTpNqeSU2owJ9Umm2
	 WE1Z950dIWOZHJTLrMpPYxL2BCFwQRw0uVp6pabJoCqVSyomdNU/L/bJo3yt/la0NUAL5
	 WAuAFcr/LZi8A+OR2pm+d2+6SdiYVSU99QW2QfIGmsLr1XIjzPlovvRM4OIoyQJw4T22b
	 HR6QKVHdhyalAv3zDaegsw2wftxZ3ArA3JCkQPGgQ5Zwd3yidy/ePBzmcLfg8QXHLOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
	b=i/qpxSn7ineH38xiJyVDY58mrbi+chquTUGcHs/wSeHFkq/2fAsogaPgfQxQqPrP9u0U
	 ebrz59Er8qfkxYuzfUo/FzYY2B1IrFdccw+i+GmStgyVoLd7C2g8QauQ0nrnjxZ1HgpuT
	 8zUcGTGEIe8MbGdalTbhUUI2un1I55Nb3tVrOH4+khK/dyV8b35xr5LDbu6bx+jAswaiX
	 4bNVfUWd3yEHGyzu4LUjVWoPqdHuLz75Q1ZjI2jr7XkHlHmS/PnLmNDlja6M0P2TbQcc1
	 ED3WjpQaFeFVbw5z+qQUn2i3/GbW4nb0QPSlpWxSN602fqt9qOHvp/FdgoJHeGdtHcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBte9H9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A8606A322
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1A8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBte9H9u
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-563a0462094so88066b6e.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161579; cv=none;
        d=google.com; s=arc-20260327;
        b=eyI7tZZTqOIEvjXgRQL5zKlI8qWRWJnpkgDeLw8m5LgFQejosSmBD7CYwJavwBpqkK
         xqcFegroSjxGLmIAM3jo26G9AHVZ/qVN/uFIqqWT0wXzeNWlgwBBHfST3I4npgpulcBh
         6Jivr8CzflP+01RXXsMKnOksZsBw8HHUCSg82hccEFKjHNvccpv6hUnrFGxN6pgctk3k
         dfx25HSGbAV0sBRvry0TNVvpSGEVsUD8kB2CKvS/3i+BI4cBVMhgoB75UTU6lJzfqEtW
         F163cfeVXCliGnksdKWviwV6NBPv5KHGjWkrvna6mL8WuyQ3zxnYLf0tSU2iRr7unWCN
         ApOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=GOTVHD6l/HS0uAAC2Wc5/hkzSnOGdtvrzrdX3g9KcSiSYhQs1/xU6xhHyd3T2rCPsb
         zzdNhw6J58JPDNNKar1MyGY4n4WsAGBElf1hd7wH/ZFq+Y4/Alwd1MpYCYc3iOLDYZtb
         IXK3JPsobY703E2aY090xlHTvACPSnnrKZJuDbGIWriixwDkE94cOWmdYzekH6ni6UCK
         6tAZgNAFNjsEKjsgUDcHGxfzJXjsBtwIvYT4szVJZ3n8l5Ywexi1/3HNpgW0DgAhGZ45
         8FBEEdHXvGhMaedR/Ap/JWCU7xP3xvPgKkGa02W/2YgEvPUk6MyZx8xsFEVViXtIe4A2
         lbQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161579; x=1794766379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        b=qBte9H9uJHuVxe/196AT1r7QBpCHdNmjNqpstnpvNZGR0QBVo72LMlLSFIJA4+27N1
         Zej90nX4PUxdwy/Ayphs/PIYHRJKFsN4N5cRzTuWi6Dv0N1+nzKgD/TiLQeFBPJ3nWpa
         xvSxrvilo87iNKC2OTcmRdckuD1sgQrmDXYBvYIhxZnVXJloJo90JtlTid41WZy29p2C
         rPddl1kLM68ENEzA8ek8z82LfUNt4xW+QPqQnLwCLk+mHqj44JkUdf49DSDTKAku5gCe
         qOrVRdcBqvB8wXmvmwF0FSeQopNHl8n0MBOAY/eYaWVgGWPtsw2fYYm6tgaVwEVs6+Xg
         zEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161579; x=1794766379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V7mrn4Tdcq2AN261SQzO3UjqbYkOVkf4ISU4JjFBUeA=;
        b=UCZYR1OwlUhMdiAwFlFBa988FAKC5dlW8Q1nkpGgkuY8cab795iXgWJKaMKEXn7lmC
         7Wr9u6ayaWdpQIDslcC88MA7BUkFog48Hixts/s40KAVCHtgAfQBiqD3xctFEj4f4M8z
         mjRfu1QGoRJt/PjB10su7eZTPe/EiLXIMJskkW5niDQs84uU5zkT7MpTK/DYqas3dgsR
         KZfK87gBtN8gfgsdTr4D6ikrttvCzu6LuUWAv0MkFex52ubAMU5LPaRcXOMP8Vav84Zz
         /DP8aPP7oigqxUAGDlcmUdfZ6q1u41Hr9h7lx1uDOfhjRwU9TLlVhSK0UxcWDz0VoE5N
         G75A==
X-Gm-Message-State: APuU4Z/4Kq5XmccnKpYWZFXpQDO/oTZas+CWeZKxsdUBFY3iXTBmANmu
	1a9zGS8gUpwyPLnP+LE8T/+oHdWfGuIqv1dpbxLe7JzyUAZxGn6xbapZl8SEszLjLX0/vbQ0xrs
	apJsLs/r7HCdxzIDTxQWe0MsAtbNYyHEvbuqLXV8VoA==
X-Gm-Gg: AYBFou2QEx9ALhxYZyUpTqqo8se8IP9UYZBmZ6zlAXLvpV1E9rSYQQgzay++YKKu8wA
	pjJ+lc198pwLrLNSursq0giAVsbCMAtszGuPvpppyU1g1ebxPTTPdFScfpb+CfIJe+erQW5kM6z
	9XrgOUhsvEsg4oZNiSe6/FYiXpyKBzNiqlvhDjwTJAhsyaqoUAfIt+IIpKQu2MaX3o/LGO3y+Xc
	6J4E+yIFZ4KLGVgoJPbQPjr/oWC6hNXy7VOV8ZJ9GkdZVUD/V5JdHPKJwxzpkE50LaY5mHDY3Tl
	xgg4b9aXerSwCevpW3K7AtMd/nSFsXJ/1HWrwul51HQ+3nlDSFrXsX1+W3EeRkOtXjPkWFQs8m+
	9npi8+Zke77qj+qI/z4P3d6Abojpju1KVkNkzE6705CO2cxppmnQ8yzCgKL3sgvmnO5BJ
X-Received: by 2002:a05:6808:690b:b0:53c:7298:3598 with SMTP id
 5614622812f47-568145b6024mr1440894b6e.31.1794161578638; Sun, 08 Nov 2026
 10:12:58 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-3-hjf3108@gmail.com>
 <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
In-Reply-To: <ea79031bd2324090bb1b39b3c3f18a36@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:12:22 +0700
X-Gm-Features: AclHuK_DEGYGJmBL4I9-G70XKz8DCYgi6jcsy_kS1NLIHIqLvm8fk4Pm0FhqqFA
Message-ID: <CABOQOSV0Uys3VigkU4xoT-wfBmRk3UyxJ1KJ5dLDVA6vy=k6tA@mail.gmail.com>
Subject: Re: [PATCH rtw-next 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 11:13, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Only the first frame of an A-MPDU comes with the PHY status.
> > This makes mac80211 report the correct value when queried from iw.
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 6.1    5.2
> > RX 29.1   27.1
>
> How does improper RX_FLAG_NO_SIGNAL_VAL affect throughput?
I included the throughput numbers as a regression test, to show that it does not
cause any speed regressions. It should not affect throughput.
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > index 9f9a34492030c6..a8910cdbfa0979 100644
> > --- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > +++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
> > @@ -425,6 +425,9 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
> >                                                      stats->rx_bufshift);
> >                 _rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
> >                                                   p_drvinfo);
> > +       } else {
> > +               /* Only the first frame of an A-MPDU has the PHY status. */
>
> It is clear that this branch is !phystatus, so no need comment.
Will be removed in v2 of the patch series.

> > +               rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
> >         }
> >         /*rx_status->qual = stats->signal; */
> >         rx_status->signal = stats->recvsignalpower + 10;
> > --
> > 2.53.0
>
