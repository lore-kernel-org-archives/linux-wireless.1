Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794544232;
	b=KFF05TG7Jmr59WPGkEECbiiu2cVRFRCLCT4blE9m98F5NkgVoNA34b503/xjaNu4YeSZ
	 uqxfXKRmA8UQRzMtyMKO8Jmh5StEoXFllQDXTP88Tbv7IMNjGL9Im+dLXfQIlpbOWLm0k
	 yesUhVSwSHCSBo7YfpR5PmNKJd3XbewwzqAakyB14UOJAKXZOdOiV4a8AMfM8iFsGWB6F
	 sGMHuR4c9Pvtm+P7nQg45BMGg7mHHm9Ie6KhuBt8rw8GP70G/ICVUu++9bglmy/1NUdRx
	 J9fyUT7R8MPVBkRpnpV6iWnTMdm1cv7WOwr66+DtLN95QPqpf3QI+AhmDvmufV8mUaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
	b=fZdxwdomMOrxBw6mQnUbg9l9S3cF+0NODKnuGd+6Ub6pAKQTf+SJQNtW8/Hoi80+g1oC
	 CQtNNglb0HZoP/6CBAyQRCl3A6SSUBV1RK5Sw6mJKet39HsvejIW55TMv0qQ47WYh0neI
	 ze1JJz9Nk1ht28FQarTzjSb7NRxns8S6ruZ9i5lqD68T7ycB8y6exA66oVvF589UoN2EE
	 4RlkcYYLpZYo8kWMUutoFeaWAYcaS804gUrNXMw5AvHgwH9o0HeytY3u+mZP9JCkFcUkH
	 cOBmZsksHRmxJH4VEdUTnjNhxJh3i3q+K4KfEfMyJ55sJx+e7lJBryq7aamy3dY9rKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxAB6gc0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E619606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 04:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E619606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxAB6gc0
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e977109392so2883805ad.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 20:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794544231; cv=none;
        d=google.com; s=arc-20260327;
        b=WykJIf0m8yKLoD7w9wVaupDKwnbnvgnjwM+iV2K0qkijdDVPMy6LobpR+8SCsQHVhu
         wtlsvdb+w7AlCgcBg6830gAwM862VACCE+yYg0lAlzWD0W5zWNUReaig+G2+d3W5DaKp
         ZuGAu8hJOJZ54ttgAVmQqCHWx3eBaSOiQ2G/lZm53atulY8+8FDHRfjWxe76oKmsfYyg
         KVTtTsgBmaXeAlYmhQbuQg2XCsPgZbv0zDw4Bkm+7wrMHPgWf5r/KO9x1AuIZJOZTtnG
         9VvXkhKIQqt5WRY50YVjRpZnnI9VmMMC0yiAtQDFKM73DWla1d07SzAaklzEcXWldUO4
         SDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        fh=wBlcil1SPVq5VJ2qgArzdP9ZSylNiZCgf8/sz979JqM=;
        b=pHV4/uCPf9LA5au3qkkqzXyKbYamY9YdkJvJ+wG/pV/ZUnWtFAWD2jb68Km2M9au9+
         4coWMqNe10wIjqsKjFO75P2+jwV/SIX+mff2vi80wdfAQ8kkoMc2LhJUFY/vDKI6Z4o8
         bB58W1cMrUKhuQpOeQR32QIfYYC4QX2Cr6JEua6kOvoP9tctnT0gb8stwODvSr+vDUkQ
         Mz/fcLrHGZqQfBRVO1JgMjsLVGK7nctYOaVlsbVHWApLT3JWhruiXV0mhe5cygtjTm3l
         rWmL7i1Z/n1gIooG71JNtJSqQp73Kpyod7s/D5sDXUn3a9LkMo06M8ON6aMBNaCRqPKu
         5PxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544231; x=1795149031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        b=GxAB6gc0OjN9kxpCjzG6RiULVYI2Ao31G4lshW5NFUYlfFzmdrFalL1Ql/J73j3XHq
         RntJUrtfOf78xrCEOfdyshEvEJNJBQimbRscKLTBkariSkrCL2Z3SWrNOU4etIKKuY9n
         +V+vJz4zGX3KMev7WiHtVCpo9VJv0WlO3JlO6hByCx3/IOWY3cIJMRSR4UJ1Q93Qk9wB
         05S3okcUEfbBe4NuV7Of5m+8E24JM7DttU07Y786F9fBd8Y6Vune3uAEg+5974DCI9lQ
         ECgfXOED3RZVEtrymhXq0mPhmOMFKbtj44A5X3egSY0MknxQR4WVlfYEMacR7XpCJKAF
         RfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544231; x=1795149031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        b=x3qHCV8kEvKWASwC+oIaHjZqCT4gLsky/w/0c1gKnBHB5fNwOQx5WAw1jIVv3MynP4
         zBdXhUZXEaKTsl5hRoGBg/dK6oGpO/LiQDO7b56I7PW+amA/aadwmIDKP7n/TnA5EXcp
         DYxkeUm/3O2sId1m8+UjXIWgBi0zSLFauB+Gyv+81LY9hybKzXBrcU9oaZKc2pi+sUEV
         iWv2FzVIL2oSeUg/hXcDi1vjj9sYe7Boo49IlJU230lx0AeFHFjVv+Az6kp7JrzEZv9+
         j8OwRN2sg3ZllbOrZ+GKlqxaZJN5JVADq1sN/qmSDIFtQBhxStOZi6mfCFXx+I19ezOd
         g8gw==
X-Forwarded-Encrypted: i=1; AL+hErHbGDRfPOYV2xKv5LZL4sHTatOXhj0L5VVypxW52J281fdeCgbS6zfEzgjc+laCr+AwXluNbmRoe8ya8xiX3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LI91/WaSSQh7TaEBykbA/MhHLL1LqZxgQ84dvW29EafivmOqK
	M1peLwEPmnTWFn03zbsRh78xG3U6pIlcd5eqnKi+B22oaL/b1KwTSmS9BdQ9MZmWIC+cO08w1LS
	nS03WEAtCxVxE/36IEpZ5a7V1xJNr3f8=
X-Gm-Gg: AYBFou2M+gP+nZjnJvgUT5On2O045zPn7qcpEXP2i+VcYelBTg0KCr6dJ/xiyeqdjgY
	ECvCa8cDFj1uvdodIRCRbNQsjQEURRQLqKs9wkFGY7S4VuD1PIgAozo8A0u23c6a1IymTbQdi9a
	NIYG2f0KYzYRFF5WtB63ud5rLDNVokivmxRScyBHL5PIjLX/ZhkqSrXFhjrPTsm/C/8xxakRfMa
	G0j1lYDNSfNQ9dgIKQbIoQwdeb652jDiQby59cKCVJsSXWE22tjQp6RTy8jvI+VKFXVVgyjdA+J
	Txfd8g7CHpgvjyCt08ycclHZDxlFNUKJefUz1GxqUUu0BpA22b9IhGWWyDpNhTWgubtePQYROX6
	8WvHGF12YFdhKojMnj3aL81VnLKPRM6dwoxEwxg==
X-Received: by 2002:a17:903:182:b0:2ed:e93:71af with SMTP id
 d9443c01a7336-2ee0dc308c5mr15517075ad.41.1794544231297; Thu, 12 Nov 2026
 20:30:31 -0800 (PST)
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
In-Reply-To: <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Thu, 12 Nov 2026 23:30:19 -0500
X-Gm-Features: AclHuK-CD9AhS9wuiw7FzrTpd5YfPUmDM3UamdoqNBrWohFtQOjQtGgfwx-_tK0
Message-ID: <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Devin,

Just checking in on this one. Is a v2 still planned? I=E2=80=99ve been runn=
ing
the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
follows the channel, and the readings look right.

As I mentioned in my last reply, I take the busy, rx and tx deltas in
32 bits, since offset 19 wraps about every 72 minutes. Since then,
about one reading a day still comes out near 2^64, so roughly 2^32 =C2=B5s
below the previous one, as if the counter stepped back. All but one
were on 2412 MHz. I haven=E2=80=99t dug into it, but it may be worth a look
before v2.

Happy to test a v2 on the A9000 whenever it=E2=80=99s ready. Thanks as well
for getting the channel fix through to stable.

Chris

On Mon, Oct 26, 2026 at 9:21=E2=80=AFAM Chris <hoopyfrood42@gmail.com> wrot=
e:
>
> On Sat, Oct 24, 2026 at 6:29=E2=80=AFPM Chris <hoopyfrood42@gmail.com> wr=
ote:
> >
> > On Sat, Oct 24, 2026 at 1:34=E2=80=AFPM Devin Wittmayer
> > <lucid_duck@justthetip.ca> wrote:
> > >
> > > Chris wrote:
> > > > One thing on offset 20: in monitor mode it doesn't look like all of
> > > > rx.
> > >
> > > You're right, it isn't all of rx. Your numbers made me curious, so I
> > > tried it here with an A9000 as a 20 MHz monitor next to an Alfa. It
> > > seems to come down to how strong the signal is. Share of the time:
> > >
> > >                                          offset 20   decoded frames
> > >   one strong neighbour (-22 dBm)            2.3%          2.0%
> > >   only weak neighbours (-73 dBm or less)    0.0%          3.6%
> > >   my upload, monitor on a side channel     54.6%          7.5%
> > >
> > > Strong signals land in 20 even when the monitor can't decode them,
> > > including spill from the next channel, and weak ones are left out.
> > > That would fit what you saw on 5 GHz and on channels 2 to 4.
> > >
> > > As a station the A9000's own downlink does show up in 20, so I'd keep
> > > it as the receive time.
> > >
> > > Thanks for the long run against the Wi-Spy, and for the Tested-by.
> > >
> > > Devin
> >
> >
> > Devin Wittmayer wrote:
> > > As a station the A9000's own downlink does show up in 20, so I'd keep
> > > it as the receive time.
> >
> > Makes sense, thanks for running that down. Strong signals counting and
> > weak ones not explains both of the oddities I saw. For my use, a monito=
r
> > hopping channels, busy time is the figure that matters, and that one
> > held up on every channel.
> >
> > Happy to test a v2 on the A9000 if one comes.
> >
> > Chris
>
>
> Hi Devin,
> One more from the long run, which you'll want before a v2: the busy
> counter (offset 19) looks to be 32 bits wide, and it wraps.
>
> Since fix 5 went in, about 2.5 days of channel hopping, my scanner's
> sanity check threw out four survey readings where a channel's busy time
> jumped by close to 2^64 us. Each one is a normal reading less exactly
> 2^32 us, e.g. 264 ms busy in 645 ms active, minus 2^32. So the firmware
> counter wrapped (every ~71.6 minutes of busy time), and in
>
>     state->cc_busy +=3D __res_u64(IDX_BUSY_TIME) - state_ts->cc_busy;
>
> the new value is smaller than the old, the difference goes negative,
> and cc_busy wraps. It happens once per wrap; the readings after it are
> fine.
>
> Taking the difference in 32 bits would cover it, e.g.
>
>     state->cc_busy +=3D (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc_bus=
y);
>
> and the same for tx and rx, if those are 32-bit too. I only see busy
> directly, so I can't confirm the other two.
>
> Happy to run a v2 against the same setup.
>
> Chris
