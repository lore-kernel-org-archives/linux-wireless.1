Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426579;
	b=JoCoE6II2jEsCXN0X2kdx/EM/oNAFEf6kJoytzAY1Q+pRlzowI7SfXYVWvl+Pv3CkwYy
	 b4o/gyVy5aySHvVhHIuodPrHbDQid0nFZ44zaAH1T9lsiPtHFX2SroNmoXPkyWryGa/Rw
	 QTm2fjNAL6RxTE1GUkE90dhW6KUU2yo35BiZtIgs2dUzmt2GzGQusLYR58mM+5tGEpxHt
	 IsaKJA9LQRUTlNRv2jQ6VRHrRQESkkRo2uuIOOfRwsALuBofRmWdfP0t1CJSDJG5tjnp9
	 5eNgyYx0VLwT1iDCmYPl8FWG11VgQzBJstbSnQikTMLUbNlr17xSCSBXbgv/h6Jp5aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426579;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Lk6mDG2mByNoEFbOZq7k0USMrITJPKdvFgnA68Y58aM=;
	b=ZPx2FgyZqIfPbcYaPZDEOaAdZ7j7TrL0i6SCSuDZNC8bKC7xyPiC2+iHitB0IgTg6Bcm
	 URnOdPi5CRX1r5tZhm8AmQS6HTusZUBogksXZOm3iCyvPLbfyBwEJz+BfMk0x11rmY8+3
	 3lYYz+3+rulEub3Y679h1IQ/bdB1SGYLytMfpyYGKeAjh+Pk1/D6xGGJCgIojP/dwEjDH
	 qYzZu09foyGAQ2eys9oGnnbIpfgPZ4gSevHkMTTQcddxsKVQYfKkuyvFE0DKdtY4AFiQ3
	 0l9ldT2K2Jmn2K4ic8JmaUq6Id1N789m0i0xC3eib4zlQBLROzWzfzK13Ofx4D2OJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knfc6I1w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9239606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knfc6I1w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56641F000D2
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795426578;
	bh=Lk6mDG2mByNoEFbOZq7k0USMrITJPKdvFgnA68Y58aM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=knfc6I1woKhjm5lrajdBpt2tCx0IEHgRV03fTMn6KGfNqQF9IQBEiGo4NsCFbC/EA
	 lZ5UNdltr/zINytU0AIvQy54ebB/BFInLNN8O6+M510+dAnJlMvYkOBFwr1P+X00w6
	 pFDTmSTUkU3EuRz2JPM7nI2H4ToWcrN2JcX7WvfiDmRxGmHRF2WResr0l/xwzBSOh7
	 MTb3WUsEL0rJJ6dKmKpptLfaEHxM82BC73TUaOFNMmbKpEOBI69BCbt2LHVCQ5XN+9
	 zzdFoEQBTqYU+wSuQAg2KaAXklZA+Ni/fRmec9c2+CLheA41UdtQpsLAC05xm2Pjp6
	 xlyLzqwEhaFnQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ada7d53082so34131181fa.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 01:36:18 -0800 (PST)
X-Gm-Message-State: APuU4Z+/ELi0Eu/x0GTQ1sIRwxr+kFh2Y6znB9pJVgf1j8lsLTQ05NY2
	184/tIYBcmlwmKfXyrnCBajAMI/4EwaLx0lJOKUqGTawspsU9YsUx3/wTNiOBXzLQO1avBmyrPx
	fyEtLXn0mcJb4TSrXE3++3mnalLzaMEo=
X-Received: by 2002:a05:651c:1a25:b0:3ac:f9f5:c73 with SMTP id
 38308e7fff4ca-3ae7b71ba1cmr25052601fa.3.1795426577272; Mon, 23 Nov 2026
 01:36:17 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250924022156.8435-1-pkshih@gmail.com> <CAGb2v66MZpd8QWYptLrh5O5qf-DWAnqxf3d692JWZoF3jCRj0g@mail.gmail.com>
 <CAHrRpuknX-Ptz990dqKpPAN71k_fNdJT5aX3CcmckyeOgC9MJA@mail.gmail.com> <CAGb2v64Q1OAKhE3FWHJm1OeEoJuo=tXet7kgRDdgb=nLqbNVCw@mail.gmail.com>
In-Reply-To: <CAGb2v64Q1OAKhE3FWHJm1OeEoJuo=tXet7kgRDdgb=nLqbNVCw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 17:36:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65W_4seSpoqKt+AhZ4CHBD59dBenBb2Bj85hYmQ33=z7w@mail.gmail.com>
X-Gm-Features: Aa3M54qv6CSY0ftXtfi0J2Ou-HMSnIOrNuZZTVCfrrrVxEMfmMPl-1AhcqAxWJY
Message-ID: <CAGb2v65W_4seSpoqKt+AhZ4CHBD59dBenBb2Bj85hYmQ33=z7w@mail.gmail.com>
Subject: Re: [PATCH] wireless-regdb: Update regulatory info including
 bandwidth for Trinidad and Tobago (TT) for 2025
To: Ping-Ke Shih <pkshih@gmail.com>
Cc: linux-wireless@vger.kernel.org, wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 8, 2025 at 2:17=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Wed, Oct 8, 2025 at 11:32=E2=80=AFAM Ping-Ke Shih <pkshih@gmail.com> w=
rote:
> >
> > Chen-Yu Tsai <wens@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Sep 24, 2025 at 10:22=E2=80=AFAM Ping-Ke Shih <pkshih@gmail.c=
om> wrote:
> > > >
> > > > From: Ping-Ke Shih <pkshih@realtek.com>
> > > >
> > > > The Telecommunications Authority of Trinidad and Tobago [1] provide=
s
> > > > Schedule of Devices Eligible for Use under a Class Licence [2]. The
> > > > type 1 (End-user devices or customer premise equipment) with Schedu=
le B.1
> > > > and B.2 shows
> > > >
> > > >  - 2400 - 2483.5 MHz
> > > >    * 30 dBm
> > > >  - 5150 - 5250 MHz
> > > >    * 24 dBm
> > > >  - 5250 - 5350 MHz
> > > >    * 24 dBm
> > > >  - 5470 - 5725 MHz
> > > >    * 24 dBm
> > >
> > > For these bands, the rules specify ERP, or effective radiated power.
> > > However it states "Maximum Effective Radiated Power ERP (from RF
> > > transmitter)", so I think it is meant to "maximum conducted output
> > > power" as seen in FCC rules?
> > >
> > > This is not the same as EIRP, or effective isotropic radiated power.
> > > AFAIK the latter is what is supposed to be used in the database. This
> > > discrepancy is found in many rules originating from the FCC rules. Th=
e
> > > FCC rules specify maximum conducted power (TX power) plus max antenna
> > > gain in dBi.
> > >
> > > So there is some conversion involved. I think the values should be
> > > "max conducted power" + "max gain in dBi". This assumes no cable loss=
.
> > >
> > > I think we would also need to revisit the US rules.
> >
> > Thanks for the detail, but I still not clear if I should use ERP +
> > antenna gain as
> > EIRP, or should I apply FCC requirements as hard power limit?
>
> This old slide deck [1'] from the FCC (?) suggests that EIRP is max
> conducted power + 6 dBi antenna gain.

So it seems that TATT updated the schedule in 2026, and it now has explicit
EIRP values. Could you respin the patch?


Thanks
ChenYu

> > By [1], it also mentioned limits of maximum power spectral density, if =
we also
> > apply the limits, the values will be almost what I wrote, which are als=
o almost
> > the same as US country in db.txt.
>
> The PSD requirements also translate to the wording for some of the bands:
>
> For the 5.25-5.35 GHz and 5.47-5.725 GHz bands, the maximum conducted
> output power over the frequency bands of operation shall not exceed the
> lesser of 250 mW or 11 dBm + 10 log B, where B is the 26 dB emission
> bandwidth in megahertz. In addition, the maximum power spectral density
> shall not exceed 11 dBm in any 1 megahertz band.
>
> "11 dBm + 10 log B" is basically describing the PSD limit.
>
> If in doubt, maybe you could ask how certification labs interpret the
> text? I think that doubly applies to the Trinidad and Tobago case, where
> the text is somewhat mixing the terms ERP and max conducted power.
>
>
> Thanks
> ChenYu
>
> P.S. The FCC website seems to be more or less unavailable due to the gov'=
t
> shutdown, so it's hard to dig up more information at this time.
>
> [1'] https://transition.fcc.gov/bureaus/oet/ea/presentations/files/oct14/=
51-New-Rules-for-UNII-Bands,-Oct-2014-TN.pdf
>
>
>
> > [1] https://www.law.cornell.edu/cfr/text/47/15.407
> >
> > >
> > > >    * extend 5 MHz to 5730 MHz for channel 144
> > > >  - 5725 - 5850 MHz
> > > >    * 30 dBm
> > > >  - 5925 - 6425 MHz
> > > >    * 24 dBm
> > >
> > > These two bands have 0 dBi for max antenna gain, so max TX power =3D=
=3D
> > > max EIRP.
> > >
> > >
> > > ChenYu
> > >
> > > > [1] https://tatt.org.tt/licensing/class-license/
> > > > [2] https://tatt.org.tt/wp-content/uploads/2025/07/Schedule-B_Sched=
ule-of-Devices-Eligible-for-Use-under-a-Class-Licence-25th-July-2025.pdf
> > > >
> > > > Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
> > > > ---
> > > > Hints to find these entries: by searching "Wi-Fi" with type 1 in [2=
].
> > > > ---
> > > >  db.txt | 13 ++++++++-----
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/db.txt b/db.txt
> > > > index 6e1ad30222a4..90ffa4e0d5d7 100644
> > > > --- a/db.txt
> > > > +++ b/db.txt
> > > > @@ -1946,12 +1946,15 @@ country TR: DFS-ETSI
> > > >         # 60 GHz band channels 1-4, ref: Etsi En 302 567
> > > >         (57000 - 66000 @ 2160), (40)
> > > >
> > > > +# Source:
> > > > +# https://tatt.org.tt/wp-content/uploads/2025/07/Schedule-B_Schedu=
le-of-Devices-Eligible-for-Use-under-a-Class-Licence-25th-July-2025.pdf
> > > >  country TT: DFS-FCC
> > > > -       (2402 - 2482 @ 40), (20)
> > > > -       (5170 - 5250 @ 80), (17), AUTO-BW
> > > > -       (5250 - 5330 @ 80), (24), DFS, AUTO-BW
> > > > -       (5490 - 5730 @ 160), (24), DFS
> > > > -       (5735 - 5835 @ 80), (30)
> > > > +       (2400 - 2483.5 @ 40), (30)
> > > > +       (5150 - 5250 @ 80), (24), AUTO-BW
> > > > +       (5250 - 5350 @ 80), (24), DFS, AUTO-BW
> > > > +       (5470 - 5730 @ 160), (24), DFS
> > > > +       (5730 - 5850 @ 80), (30)
> > > > +       (5925 - 6425 @ 320), (24)
> > > >
> > > >  # Source:
> > > >  # Table of Frequency Allocations of Republic of China (Taiwan) / F=
eb 2017:
> > > > --
> > > > 2.25.1
> > > >
