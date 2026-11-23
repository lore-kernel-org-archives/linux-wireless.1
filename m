Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430397;
	b=bKP+LLpEVdA3x4xfrfBrjX36Ao7y2fu9bp8F6nBL8CeTJ1zclktMDrjqpJ3a8b8ZwmMT
	 CB+jpuMynA0uafDiaUZsGBjHIFXXBsGTCnwaunuFs+KBWSL3iS11tONmqOcLJJTs28Bgf
	 AxTYWK3PTEoRNpURW+vzEHflvJ81gg9lp7tQtaob3z8Up80PfpCnfIXvWqggT4t5sEJ1Y
	 bEKIrt5QrKKL2vHtoLiVlnaS8bzKZj3w0Kcx9A692PERfZ1r3CPLiEliZXJN6UNJCn9Nd
	 EQCN+9wDdswdd31EECRPQfjLBl2sqS5uwZIcFlkqrrrKG+6k5n4SxsbhiIz2GitU/Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430397;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6Gj0XCFh8VHVjmg8Aa1L87ToNBEQ6zjjIOAqZjyYcDQ=;
	b=eYMt5IezJkCMXs54yPKstcz/e449vaj8Swkcp7f06+usBCkeai+t3NC4WwmgsbosvfNl
	 ilG2kgK8KbgFSB9a+UuNDhWhY0+KA5AddUQiG23bVJmHYyaVWwv+omuJJdCN/ImSh3hpH
	 Tg6mkGLMKxObrXAJ9P6hri9I5CjJqDRgU50qYmnsPpF4+5kyRoMjSp0tM3hFmARiG0jjg
	 xOfooveqrwd4MOp+TWjKvt6GcnaJLBcjTCNlsKnEaYEDo5Nr+IqU5fcaxc6nquReUxOU7
	 b/MuHy2zbUgZs6EI8SGmR+FXAZMli7Z4TW9o5hcX6RZvwcMLXNjDeJ5rJ7CcnrHBGGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUbP+2Jy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9544F606A334
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUbP+2Jy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0299C1F000D0
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430397;
	bh=6Gj0XCFh8VHVjmg8Aa1L87ToNBEQ6zjjIOAqZjyYcDQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WUbP+2JypP6O3pqoB3C48/ThFZDbcumjTKzk7UcQpjc9aom9Jfu60vxCy7k6pX2FC
	 ckIuWpLgQtSPiUCdHcjJHYd9pGmdbnP5qe43Z4EhBhRW/irt10Fs87cwGtdq5sGqhR
	 OJjjgSa9NaJ4Y6UZxEnNTVyZPOwctNF7O5x9pDm3DvjnXTncFJ2o0swh3h5QUqPdcB
	 K40mw7uXBebgXbyktAYf/DznvU0hBaCcPV2B+ttkUCViBsXRPfzG0HC2cpPFPfT5CC
	 nbiThpgPuJctGSri/RK3zcj2H3vPT/H9bQ/5tDwy4tIVssKp56VClwIwDK1E30YFPh
	 Vk+egT9SVJLeg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3836765e87.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 02:39:56 -0800 (PST)
X-Gm-Message-State: APuU4Z+4QSxx5VkXZsYalgSDKFmnf9aUJWsYI9U1JPDwsxYn+HLjrb/p
	YtgU+qBq1t7BtJ26EdJalaZfrxIKvcCKR1oq2nht0L+e91oMAz/UCCzkfH9yLcH5ZfAEtw7UK+W
	W/krRV8uN41T7Z3NBBgMGIFEoK9f5dgQ=
X-Received: by 2002:a05:6512:114a:b0:5c1:4f6f:5656 with SMTP id
 2adb3069b0e04-5c1b7cc1abdmr3306555e87.44.1795430395471; Mon, 23 Nov 2026
 02:39:55 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8BB6488B-D0B9-4ECB-9740-E892DDA3F4C1@rfareas.com> <179543030763.976281.10810918160433779862.b4-ty@b4>
In-Reply-To: <179543030763.976281.10810918160433779862.b4-ty@b4>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 18:39:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65HE56ckquBS39ouzg=q+nRKoVg2rVes7AOYQ29vmrEHw@mail.gmail.com>
X-Gm-Features: Aa3M54rSzoYJUfqn32b-xaM1ODFo8Nn-Nn2mvK5uMX6we8c9_ajhgUxk6WM-tDc
Message-ID: <CAGb2v65HE56ckquBS39ouzg=q+nRKoVg2rVes7AOYQ29vmrEHw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wireless-regdb: Allow channel 144 for Kazakhstan (KZ)
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:38=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, 23 Nov 2026 13:22:29 +0300, RFAREAS Support wrote:
> > Channel 144 (5710-5730 MHz) straddles the 5725 MHz boundary between
> > the 5470-5725 MHz and 5725-5850 MHz rules, so it cannot be used.
> >
> > Both ranges have the same limits in item 24 of Annex 1 to the Rules
> > (100 mW e.i.r.p., indoor use only); 5725-5850 MHz has no DFS flag and
> > is the less restrictive one. Extend the lower range to 5730 MHz and
> > start the upper one there, as done for the US. 5725-5730 MHz then
> > requires DFS, which is more restrictive than before.
> >
> > [...]
>
> Applied to master in wens/wireless-regdb.git, thanks!
>
> [2/2] wireless-regdb: Allow channel 144 for Kazakhstan (KZ)
>       https://git.kernel.org/wens/wireless-regdb/c/c0b2d4b1b27a

Email threading was broken on this series, which is why you only see [2/2]
here.

> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>
