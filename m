Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794161418;
	b=4idsgmc2yBhNK8xfeQeFKcO6NN5JWzwY5GC6XZ8EtRze5LZG7Q713UW0Y4wTtkOsfp4H
	 5Mbp6jcMQdzTPFawNPaDOPfvRhAcnNUO/LoWRSy89GAuCJf19Qh9gZufty9q8oFsCvpjy
	 A7IlzXT4HAO6YPkfsHd0E9Mgf81RfQH2LCopvmy0jpFkW51DHopaWg9hdxTLrLm/BuNq0
	 YCB76LvxWJaQzyhpy0FC1aoI4/XDKltrfcGIT/eLXBOYUa3egCojmnEpM9p33hR1dj7IP
	 Dk4U6iWdLSgk63A3vTmGDIb2Ao9obKVVhhTzDwuDz6hypilpDHKRt/G6IVEI1gOrkbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
	b=b3Td87y7tls1mbR4ZkEkwNdRPJoxZPqtyKwdUP2sYPpjlt9jhet12RUJUaMhSv3+g2bQ
	 1hVXc1TN7RKiD6gmn+ibKkzE0Ib/cqijIjMI6vVlGr9BIorZfZ5CnvaPijESObKV2jB32
	 zMPzLtoI48jFlTvIyjpMIStlHTTb5Ekl170CUuNMZQtBVMKkzjajd0Qi+/OiM2GAy0M1z
	 TE9W3n01cPer7JXQ1qoJkgsbis5UY6H+9MTF61JArxZdNSmgq/WfMLP2ZAwjnKAUcqWmW
	 YASy+zqIVVwgddqlx8e52SaQrnDgaID7JlK+QHao2DMVkSA6aNb/Q9csornHCTNLvCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwWvNAIG;
	arc=fail smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335D606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B335D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwWvNAIG
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70b875f6f13so163003eaf.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161416; cv=none;
        d=google.com; s=arc-20260327;
        b=EU9D/iHP8VFxZOOfWcfhnf6ztLae/BTvPNqEz4LdR1Vwjq1XEIyHmsg1yV3Altyd22
         GQab7035WLnAtKx5AUKEFtROrGCXriPESJ3vGeOl9t20odkw/h9BMb+ivJT3Pz9ZJ/Ur
         laOskozJv6hafnoFS/mdiGiTPuCJtvl6nZxYFgeZwjfdtCA7piv+9IDW4Ww7js7FblAK
         j9bUvRdh39vz7cRXJZq4t3tszk+DDZwA4GRSYUN2ZIjRamT5UVXK0Low8viiozKbIsHF
         AMWsXeRqUNyQiS3WsxTR/G+JESoBjHCjRBzv3QMQG6Lw4w/T8d1btzd/QsZu+j46BO51
         ugEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        fh=JX6c2pHJmT6s8m88sxOIg3Y3NF+5m9Uyy4wnGXevBKs=;
        b=dJ1XUwd6VoVjKlKEnMR6LmkkoJ2ju+7v3k/+E5sVcOgfUMjjSVTDvPe7SEf3kgV+Hb
         m+jj/+XLgmSQfBnpzIPCV3eDD8bqwW4h+CDEI5y6UPN7f254jlWr15oLQU4OPGlINHBg
         HOt+6HoWHqtltYCLiD9eF7IOQFj5fw/EQa3zR8IwA0hSgu8JJ+77psMPNjnMqElgtcGB
         FVN7tUgGH2lHPQQdro26Fhw+k3skfQnThYeoeU7R0qYswrvnMotzLyzZ17dRjGNAdfkA
         mieXzal1QTidcL331yDl/Sg+h1YrfhkdQb563XSyoC+QvpzJ4wkMl2JPPMIQcO8wpQPw
         d8ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161416; x=1794766216; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        b=mwWvNAIGocK+R0mIUWgJrnkHMoAVEZkFD4rxUbnqbAhBM65ubX6L3JugHm/2hx6BT3
         TU/pe0ifcFVP/S6x14Li1u9FBQgPBLCZeRXabyOWtFHdNrEi9dFQcNR8AQj17ME70Mep
         FEH1W2yfItAUNWDTFCwUp95Umjci1t0ZrpX6fj/eCfzhQAFmjFiOkhXSSa2p+I1MFEPM
         inf+m42qS57sX42APJeHArzdfmhMi5gHKNM1LqhdZoD06yRaxNVsEfAdQLe8XZwvQg4F
         p8tru1eyrNodtmFfWle9ttkqNcpPNRVTKMonZpTkjDcYUS1xFdrsOZ4214IZkS4/lKnS
         gIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161416; x=1794766216;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btiqivIRWTf5mLIqtgnevPElODO67cdEVjtOf44ouLc=;
        b=m1pTEURbTNu+HhzOIsCqYsjOdey8N2hTENTm+mDsTh0zsWPOtTYgdK8stqyp6J1uJA
         p6XiPc26rdn7wn4685kCSYyP1DUgmk5+4xtxOqmQxgPra0fEbAONlJtinrH0iWqnOKEg
         L1zuA12vn3HpA6Pb+NfNHLFshr5AWcNyrhAQBCfzrNLBe2PMfvQAFdVYSC9FOPuXQT9J
         Aau8g63S2ogA/93QBiNIPzO33JmLu22dNjE5ZpjO6tPscmCu2X0sKCQZR0uDHTMX3To1
         zHK7FjxhUgf6sNjMzshFLfABbm2YbVXoJhzLBycGSjVLxazhg2G2ZZHQw6W36Kn1UGAW
         3FeA==
X-Forwarded-Encrypted: i=1; AL+hErHMn2IrtP7MnKDFarHwg3qsuinSLRguBwz7QAkHHffQ871d/ccT7lI9hiRrL8bE+5LoOl+F0udcvO2Xdf5R7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/e4dVzvCzKpImWcMWmkyVgAESy/J55J7Kfo8cDq7ssF7BS+1Av
	12YCcIUBWbhF4jjjsJ4UHOsMscZFeTW6TXua5gPY+B9fFYhXJuP/asTckZc0nzJd1LK89e+DKi8
	j1i2Tq9FfekDL3amCjemxFIX+n1ekVQs=
X-Gm-Gg: AYBFou093eaXzvzviS1/X8/yalohkfT6/GijSnAKLHugN8QIoHMKXy+DBEjJaw3lb4H
	AKXNXWsj35MgqOLNOGE/pC4Ot31l0fPiY0EfBnFxP7mAPC2Soyw4cf//wOie6ChALaZDtXYulIk
	t5yNZ0gAm1RH8/yqwScHYpojLU7y8oN85VrTpoRjUTn66rw+JORYVEtfsk13yGx8P1Tx7ryO2vS
	Mb04eXqqyXBdSGHWO9vEtO8s5/yRS/lVWVHkZ3aWQtVd5m4gRQ3qDfFI4JxzkJGiu7k4DlZvTIx
	AiR307Qzg/xSYA/JNT6Q3Yqjy8WKFBp9K3a8YkTyc16oPXtCnzpvTxaoc8NbeaXpdmMEzwsR4h6
	HBRUli7ApqWv7N3PmKiJmG3FO7w2hQU6w/EOrqGCfdg7jRN4oJgz9x4rqf3BRmwMI7atT
X-Received: by 2002:a05:6820:151a:b0:70b:960c:53d2 with SMTP id
 006d021491bc7-7170f1cefa6mr953045eaf.1.1794161416544; Sun, 08 Nov 2026
 10:10:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031070950.425176-1-hjf3108@gmail.com> <20261031070950.425176-8-hjf3108@gmail.com>
 <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev>
In-Reply-To: <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:09:40 +0700
X-Gm-Features: AclHuK_deMRBZS9b4i96HTqAJICAKUrHkmh4JZIXs4UzcR6GIwTXgavBQn1K-mo
Message-ID: <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 7/7] wifi: rtw88: 8812a, 8821a: respect peer
 A-MPDU size limits
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 00:35, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Two small comments below.
>
> October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > index f7391f6aa3039c7ba4d88249d968a5f1763ea866..f597edec290f64fda1c457812b240515360dc387 100644
> > --- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
> > @@ -49,6 +49,13 @@ static void rtw8821a_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
> >  {
> >  }
> >
> > +static void rtw8821a_set_ampdu_factor(struct rtw_dev *rtwdev, u8 factor)
> > +{
> > +     factor = min_t(u8, factor, IEEE80211_HT_MAX_AMPDU_64K);
>
> For a VHT peer rtw_set_ampdu_factor() passes the VHT exponent here, so
> IEEE80211_VHT_MAX_AMPDU_64K would match the 8812a version. It is the
> same value, so this is only about readability.
>
> > +
> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH, (8192 << factor) - 1);
> > +}
>
> This is the same as rtw8812a_set_ampdu_factor() apart from the limit.
> Maybe a single rtw88xxa_set_ampdu_factor() that picks the limit by chip
> id, like rtw88xxa_set_crystal_cap() in patch 5 does for the mask?
I feel that this one would not deduplicate much code and defeats the point of a
per chip set_ampdu_factor callback anyway.

> Best regards,
> Luka Gejak
