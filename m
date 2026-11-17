Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927530;
	b=o5AURXTMvEl79AipR56egJD3EetArDvxwh2m+Sp6yEfor2AMfpvijR9Rd+q7QfK4GKWN
	 847jy5UStRg9mwdPa35TKNVPJKKUSSdZ9cyR60JThqrRipMxS3/h1ysjarcw0/FbLAuA7
	 wMExswCbbBwynlQMt0gKuou127jXYATOC/XtmSsKzhdGX6axYrlhQ5kGpv0qRS8Bn6WtJ
	 1onhCvHMG18m3XkkqKqcFdvS3Tbt9DTJFNytvuINXHldLfHo8Gr/P7qKCk3lTu4Hg4q6o
	 hby0PFrjf6M29dvw3WhWWfhCnzw4gv0DHw2o2+RQi5XbRZui2Li8rJ8jp4q/wXQRifA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
	b=RRZSikYXLBD6wohVcwcbba/AXlXyqS4Upf42Y/WisdTkwRjGSnOhDCnB7yv8sNP73iEg
	 fcinJy2o/EVVOCr+6+JlQofx3VMXBn07iGDzZHXt1j40XJ8VNwmJfCCS2yMBiX2Klt3xO
	 uo6Y7S4y8e/jZLawDPw0rKiJ3jBTgNaVGZajDI8xnpawK6+XA7DiW9/01M5P/LUusB6Hm
	 z9jhTuXuFkpYBAmXwRH0vTp8oHWpGQq3nBExl71bZW+8bCY+4c6/b4kLiAIc+l0G/ohdO
	 tX6Dud9zkHG/3kFzRltG9w0sslbChisV7HwcQY/vBYi0Imf7HNycWny+mdID0tlRhaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXZiJNT5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACC606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 14:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51ACC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXZiJNT5
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2191110b3a.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 06:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794927530; cv=none;
        d=google.com; s=arc-20260327;
        b=gIRfsrBfWMwziltRLkUu3t2pkbqWI/BStB5WkJ8WioM39ocHR6kXnMWroJaM85THqM
         y56lDJngcDErq0ZsdJFOsrk71pz0KI+tsIeOFh0qsdOET+PeqeJT43gchEdM5y6MZuVt
         nQjv0fyrUeAzIcHHTkP2B5JYwaQZgaEFEkDu2Jc5iiQe0bimqqKhtYP1zs5MIu6RLS3T
         cjHU2qS1iIXRsijKYVk/S8GjgMRAo951ZRHoxSdXnkPK61MIqP0VnRbkE9ZsuADcmDR0
         KXLl5ACoRmi8wusYDNThl6asUHOjAceS3R2ga3mii48JFf5qUo4q7PKHBmjOp7QKT4Lk
         5nLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        fh=Hc5spICtGzgI+h4jvz9So/gAiKrp07odJ4R/SeoPbSI=;
        b=ryAQML/qyalW0oAW2Ywzq/FucySApljUmyJPQwSFNKcR/bT7V1WjkouEJq9tb85eoH
         h/6H5jjMsqBL9UQ7ZHsEkkwoU9oQkqaplb4N+eojNrWsJGBxmEt3fyEcPt/Zo+fDs07v
         0zhjqEpfLuqIPdvCTR5VvmqVNSCzb6pOWq2op+ATsVtDJL31wkDDGN+r9b9qTww/Fu8q
         i+Tc8Tbl8+6MR+hnA5biZ23+at58VyUbn1zzunbeRTGZ1iVscbISM2SU9jEv9Yv+rstl
         sROi/dEJZBWXTiVWNZw2ffuMjyaLoTBv3nBdnIGB8Hd1rvf0Dte/mvFgnAZpLhoYonm6
         rflA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927530; x=1795532330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        b=uXZiJNT5vMrpplettboptMa3j8K512EH+19DBN6MaG7i4WWsmLVR1XLeCD1HcYxbCv
         DmYLYhDziRULmJAc5qSxm90xz0497eS3JSgj1bcrICGisnzPx1NgV+s6Pbn9mkH9NHyB
         igGIJ/1iEs+jiU8M9w3kObrkxbLLjbqjF5nULhlKfKRhtbhOG7AFVXn0CIArZFbY8AIi
         NP+dnkZX7qeXTNMt9+3RJUIi2vWEfmqUzjUeQimgSv683voKtKCcnDraZS8N2s5Z3Hlq
         IPNQF7GV/ne3/ZBKTITLv3UoLhqiJo3WYNlBuTQFwQX515oNHeMXydXfGvhckl+PIJtE
         LwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927530; x=1795532330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPDYX9H0g1BawO3rTHI9KVIdSs+LnRoUnNvMMbtRxnE=;
        b=pEDN2LemWpyNwKGIkoWsVAV3N2pkNatlyCbCzoImurQ2XeuKvQg8BAtIB2tfmSaQXf
         acRR9m21J7qDacyHW4Dgzz0+H72yae35xxyt3VnLr7GCC47qINpXk62m2ohOq+KTG4Tj
         857j2Z+xB17mP6U2IRx+/UiFCQIAmS6CeSp4yTQ8DEX3FsT396K2i9vGYQ+jyr1QaRGc
         EdjTlr3PmhstmN54JanhnD2+102JjDXwd0E3TRrgELnse7wk+OxWQJPbrbHsGsW4wdgF
         lJNexaDS+tQ+DpVZS0qHvOnFBI+2kDAf+Bp1gc2kcyK51g97k2hFC3sidZAHvDHe7US1
         J26w==
X-Forwarded-Encrypted: i=1; AL+hErHHxEq4aj076Bv9xZDoNZmK02JLid11yb2nWG3F17HPSxCQm4ck2jU+v5eiCusBrMDITKSF5SZoC+j0r+2u4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wk5xA/QoJacGtzDTqd5dI3hAH5WplclpK5MXXoG+2xZhtwOgF
	QB0fmLD+yidhalMtCh01mwsDoWZHv7f4VGW/iAI7M5cHYHqWn2q+sHNv15TaKFnl8gjvY1KoxYD
	4o/k+YyHpHkuuSwVWNYgF9r6Xrppy4JE=
X-Gm-Gg: AYBFou3Tj9uzhOg4ac0mQxlwqjBNxbr1M4jk011UL1IHEIOaJf8sFO9EbfYOI7epJ7A
	EvjVKA7m0ebjJNuIWJ6VrzWKgUnBdxNWivjgE+nKzlANXxlYxU9BUcR/iC6A9U6DGy9V89UZFrY
	vDxCHSp7jbHrB5NASYNmBrhn0AuGxsG4TMgYf4divBSU/rKPBiAOSh3lqic7/IYKnbFHBXkul35
	R4kXOv6hdcIjkT0nmBQCmEvn6YC9ixY5MVQz1/r4jAFiwH78RujkE86W6cyfUjyEJlcQ5+l4x7J
	L3qRJnE49sYTigBWKV1BP86+SXjOnsGTsxG00JamOwkFxdxvED709rNFQ3xWWy/GQ5QM1T9C2ZW
	MA1jq4WWGQGX4l6iMfPyMpHOr1il+L1XXpr6o7Q==
X-Received: by 2002:a05:6a21:7e87:b0:3e2:891b:c50f with SMTP id
 adf61e73a8af0-3f7a71c513bmr11027784637.13.1794927529599; Tue, 17 Nov 2026
 06:58:49 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831032832.83338-1-eason.lai@mediatek.com>
 <20261112075558.1813785-1-michael.shih@mediatek.com> <20261112075558.1813785-3-michael.shih@mediatek.com>
 <20261113150048.5271-1-lucid_duck@justthetip.ca> <644ef5eaf8cf84f5760691ffe9bcf8e7ac8b9f69.camel@mediatek.com>
In-Reply-To: <644ef5eaf8cf84f5760691ffe9bcf8e7ac8b9f69.camel@mediatek.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Tue, 17 Nov 2026 09:58:36 -0500
X-Gm-Features: AclHuK9Pzpcw2OgK_ABRSF114EBt_4pkWN3NuhgG70kUz-EjTXmuHflRHxj__bQ
Message-ID: <CAHaeJsTYEi=T-3r_ZtY6-WweH6Be8C+v5euttsLSmbAg1fKBZw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
To: =?UTF-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
Cc: "lucid_duck@justthetip.ca" <lucid_duck@justthetip.ca>, 
	=?UTF-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>, 
	=?UTF-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?= <Litien.Chang@mediatek.com>, 
	"nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>, 
	=?UTF-8?B?UXVhbiBaaG91ICjlkajlhagp?= <Quan.Zhou@mediatek.com>, 
	=?UTF-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, 
	Ryder Lee <Ryder.Lee@mediatek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>, 
	=?UTF-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>, 
	=?UTF-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thanks for the explanation. A related question while the firmware
change is being prepared: we can=E2=80=99t find a noise floor reading for t=
he
MT7925. mt792x_phy_get_nf() returns 0, and the idle-power (IPI)
histogram that mt7915/mt7996 build their noise floor from reads as all
zeros on this chip. Setting IPI_EN through debugfs didn=E2=80=99t stick and
caused MCU timeouts and firmware reloads, so we stopped there.

Is a noise floor, or the IPI histogram, available from the MT7925
firmware, for example in the GET_MIB_INFO response or another MCU
query? Or could it be added alongside this change? With it, the survey
could report noise as well as busy time.

We=E2=80=99re running an A9000 on USB 2.0, mostly in monitor mode, with
firmware WM 20260605184805. We=E2=80=99re happy to test the firmware and
driver changes when they=E2=80=99re available.

Thanks,
Chris

On Mon, Nov 16, 2026 at 9:51=E2=80=AFPM Michael Shih (=E5=8F=B2=E5=90=9B=E4=
=BB=B2)
<Michael.Shih@mediatek.com> wrote:
>
> Hi Devin,
>
> Sorry for not mentioning that this Driver change requires MT7925  FW
> change as well, this is the reason why there is no transmit time with
> this driver change only.
>
> I am also preparing the FW change on MTK side, and the FW change will
> be provided to upstream on MTK's FW provision schedule.
>
> Thanks,
> Michael.
>
> *********** MEDIATEK Confidentiality Notice
>  ***********
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or
> otherwise exempt from disclosure under applicable laws. It is
> intended to be conveyed only to the designated recipient(s). Any
> use, dissemination, distribution, printing, retaining or copying
> of this e-mail (including its attachments) by unintended recipient(s)
> is strictly prohibited and may be unlawful. If you are not an
> intended recipient of this e-mail, or believe that you have received
> this e-mail in error, please notify the sender immediately
> (by replying to this e-mail), delete any and all copies of this
> e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
