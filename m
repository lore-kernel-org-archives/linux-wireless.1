Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591910;
	b=ZBf1/XFxmRj0uaH7tUshZm7OKIgpUrqpwx5o35Er/30nWXvhyhdp9T1yBJ/SDVLMzE3P
	 LOOfXuEMwsUpGSrG/8R2KJl8yrSE66FroosLc7rjogenYw/CmLZSDLXbaUafhq/XLkiut
	 e5fZCv8mKTcjEYky1Pf5bVWMm4u8NLow8jomPuBfqTkiceHN9Wi61foJB3ACMJORZLXDD
	 qexrJ01zJcCYqGzzO9+955xtb3m/UFxQOqMtCYRqW+wvPEkzUC47tg0Fba2jk76u/Essx
	 7mA+QwIc6gX68qS/voXHn+g/u44EqjODWVx0tINa34p/74g9dv4cpPZLxzS+sZf0cLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
	b=mUvIdloKqbYtqZPN2XvL08QE5NZnFEPqE8nt7vDvr8pp71D1epLjs8DcV8LuA6YHP4nZ
	 OFPbnPgihovWFJFEh5sDJq4TUzoCsY0hnITTzd9S6RFbkDEBPzepmjartH7xl8qvhNpX7
	 OADpKphUH48DJZmEqCdd0F2g6HStyfXrbKN25fsAawdK6DelK7q6xAla8kJ6a2e+wChKP
	 fJ0SSfY94c6gZ3q9h+8r2wYD4jE3IupDn5Ru3L7w/oUDxU0avhW8tNWE30rMyRKxlVHGG
	 XifVSlbeCbX/3GedlmKRCdxx+reEGIX/fRFN4+xvSs0ZCtEDjU8X6cQYqLzfCX/136g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYqvwJju;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7947606BD34
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 17:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7947606BD34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYqvwJju
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso7695455ad.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 09:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591909; cv=none;
        d=google.com; s=arc-20260327;
        b=dek06T7PWchd69GjwsHBeflUSzLzf+d5Yp74oi/JMI5XGvvsGsPsT5f4y/+BeKKHbs
         sLxATTYEykUf58+42CL0WiOeO2cEOZdw+BkqRGUAkaFvdb9f9fufI6y+twmUnec090Db
         5j66EmidiutAwiNd+zEuYl1oa0A6F+UTqd7usSMZ5MWMJjQ93J2cZOguLj/G7vWFkiV6
         Y5oDN5aSRNKSnBv67O/uZLlT7VpxpXyYXVzrkIShivAycYegZIaoAqghR/vjl5fBeTty
         BetGETGPeGg8Ds3EzgZdus0OvsFom/AGfxK/Ou0wRw85ej9G9fzZmkbZaswEIobMErV+
         fIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        fh=x4JfGgCuO9UsLj0vu0o11akDVEEkWfJu7yxcCXxh2+M=;
        b=EJk7P2Ptf61GFRkssGBchFnXc7y+nxzVQQwmMnK+HoZgeMrXhxf8x9n9vqYah1X+EX
         ftv+QSaHT+gr/UARWWQwo7lLmQdZ7jTupPoY5SNLBFU8eeoPppSOimoauQsc244hiQat
         7LCsv0TYSrbULJJdZmlYspjsszhIaO4Ej84ZcALocbYlnCOvJ+kaPwA4KdXvTO1PIO8i
         XQxgpzNurHwaCScEbPPprKOdfTl9l7bo5EIcX/252wZOcmEOJo9Wh3mQQL6KRQ1ZL/zU
         q3mtHo8fUmci+eZ26UoozSAqCrEVzzuQyjlgg7yS/TB19FUCPUyBtRyRkhC8NPL+AHBs
         qE+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591909; x=1795196709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        b=PYqvwJjuuda6DD3rttBG5ySXX/eJUwAFwjWxlkn+rq4qRPlpB0+pXEAnA6XUMPvGgY
         rQO+BMCQzYLfaD3aMBt1YJf/QAiIBmxih3tb4X0WKIU3XhcYyLmMpCkVbqj+m0ePl5Tn
         mJg/RRhFRtTApZjCR62ASF1H3UkCIXDKchJ8AuBy8L3UUiTj4NWMxt8Lep8ittPhDePG
         snV0ypWN5Bc0LRuS/jkTAcEFMYgV+jPySp4LrwvxlYMEydDf4PNYOdBHgmna0Csp6ojQ
         ujqPeN8itjQTrgokaRCgKVdIMF7XSYCwYCutFXkx1zqXSspQtfds4JQWRHUNPb7KJnnS
         BFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591909; x=1795196709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        b=xcz9EQFVzH/CxHUnHISLDxoPLlvFVetJoCnofdIoaMuy56XfctZSQfB6gf9nnTl/+v
         TasgQR/I1P/NBNqpnW/N0RAGYewoC2VwQT8kgrstpF56UfoqJtgPJhmiO7oTdPnGb66h
         CWos8JFye8KkE+4mLehxfOdCmSGOQtEWH0HH9BGqCjK3ePOZr2AjVRec+yc/6xRbsXMC
         y0IvjFJb633OQ1GPG0Io91z7EL21l/zSeXpjrSq+EBC43GqcltDTxWXD4Ue8Y/a5Wiln
         9/QomiftFs18LUR65/c2UiZ+/LO3idBctba0/uLLYiWmCyYAlw24ukk+4xupp/OhVI4/
         Xumw==
X-Forwarded-Encrypted: i=1; AL+hErFQ3UrdDRRSspcTVpRX11rq7btuuCTDZrc0jLkVJcqZ/3PCifvHR3m5qKhDQ1Jjz3IYzDeKFkrbVGpXNj8KPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z88a990K4wVlD1LtK97GMVb/DMB1A+KTS7VGj2syvI8qo1kHElC
	N1Os9rXunfuLCuzxl2jU/+zkCB8c7umQI3doQPyz4PUNMrLrYLZuMTDEnPdw+xa9NDsk2sCN75Z
	NU1nNsm2bvvGxfOKmG9mZyTdFYF816Mo=
X-Gm-Gg: AYBFou2aZ1eOdv7dWS/SSUVxjIG8Dzow4y2x5fqUYDlUqI7wZHXozlIRnmsCb0+BVpS
	y/eOogqQQjdTUhXQZaZxA/SjP2RpfqOSxos4UE7bBN3Pas3DrjZBNZhkDnfy3ovQEtZOVl6Vwau
	dLczcUs1Nt3fWo+B+i4yfHO8ztD1Ja9Kh666JSQls9n0qEiWXzQRB/vv/YvSEOidirkMVGn97jX
	5uC2xN0KvtKUVfgHVbIFu4E5t/zHtSVHJEUmW9NnagTsCDI5EgIiXkDMYwt/oZr0yn1VvMGeiHq
	3VQxhy7giZJIHGKixKW+NSJQgYVLFjmtyl6PNQu5Vmk9KQ18/GAMPw58iTIuZqhQXLmqQZFsAsa
	/MOcJi3cE1+FVqsQptqlcdo+LUaA94ouPfTXNwQ==
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id
 98e67ed59e1d1-3b1b0a1f097mr3248202a91.12.1794591908865; Fri, 13 Nov 2026
 09:45:08 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
 <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
 <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
 <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com> <20261113163823.8252-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261113163823.8252-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Fri, 13 Nov 2026 12:44:54 -0500
X-Gm-Features: AclHuK-kboXCmkkZ8ATzKP0-8pyPMq66IuBjqFLfP5gRrQyyh3-Tpydyt0hROfU
Message-ID: <CAHaeJsQ1EHxMLzKjtTZZekJWS-8hXb4XaUW9C4bO0anJoVLh9A@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:38=E2=80=AFAM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> On Thu, Nov 12, 2026 at 11:30:19PM -0500, Chris wrote:
> > Just checking in on this one. Is a v2 still planned? I=E2=80=99ve been =
running
> > the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
> > follows the channel, and the readings look right.
>
> Yes, but it is on hold. With the A9000 at USB 2.0 the firmware is slow
> to answer the query during a download, the query times out and the
> chip gets reset. MediaTek's series for the same counters does it too.
> I wrote that up here:
>
>   https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_duck=
@justthetip.ca/
>
> v2 has to get past that first.
>
> > As I mentioned in my last reply, I take the busy, rx and tx deltas in
> > 32 bits, since offset 19 wraps about every 72 minutes. Since then,
> > about one reading a day still comes out near 2^64, so roughly 2^32 =C2=
=B5s
> > below the previous one, as if the counter stepped back. All but one
> > were on 2412 MHz. I haven=E2=80=99t dug into it, but it may be worth a =
look
> > before v2.
>
> v2 takes all three differences in 32 bits, the way you suggested. With
> a wrap forced early the RFC steps back by 2^32 us and v2 does not.
> After that change the totals can only go up, so is your once-a-day
> reading from the RFC as posted, or with the change in your driver?
>
> Thanks for keeping it running.
>
> Devin


On Fri, Nov 13, 2026, Devin Wittmayer wrote:
> After that change the totals can only go up, so is your once-a-day
> reading from the RFC as posted, or with the change in your driver?

With the change, as far as I can tell. The build with the 32-bit
differences was installed on Nov 5 and loaded at a reboot a few minutes
later, and that module is still the one running. From Nov 6 to Nov 8 it
still gave 14 of these readings, 10 on 2412 MHz and 4 on 5745 MHz. Each
was a busy total of about 2^64 - 2^32 us plus a few hundred ms, some of
them on a channel with under a second of active time. My tool logs only
the first one per channel per run, so 14 is a floor.

There have been none since midday on Nov 8, about five days of scanning
on the same module.

I agree a 32-bit difference shouldn't be able to do that, so something
else may be going on in my build. I'll keep watching and report back if
it shows up again.

On the USB 2.0 timeouts: the A9000 here is on USB 2.0 as well and has
run your RFC since Oct 23 with no 00030022 timeout. Nearly all of that
is monitor mode, though, with only short station sessions, never a long
download.

Chris
