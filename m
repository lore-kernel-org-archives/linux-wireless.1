Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090797;
	b=ZEeVL7ffiVIL82cfJhpFyUgfu4sWHtXRnLqaTPRE5al8M+orLW5Q0FW9numiTNN22adG
	 upCjfHw7utH5InKmp88VhSwMA20jDEYzaLl6jsxtvd1MUmYcXmw9Jj5cQdPG+6qBLSvPa
	 HRgzSU+8TVWRwq+6TQIfTAvIoj0wGsq5MxhbWDQdVD1N2W5gY8V9OTl0DRfkHu+uXJz9b
	 /aYMkKpqevX/S3qObL3ITjmiMck1V98uW0wZThxW25DyhHneYq2fd4EqxSkdfQQ/P50kf
	 Iy6/MmvSPROA4Ovm3g/Q40h3eE4uLXuMG+OOVi+M6oGhIZn+wSG01SwAMmnEW+d0qqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090797;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3gmccjYqj54OpQwxCx6BodGClmmljqO/sWD6CyVyKWM=;
	b=PDysfVDv6QnCQDlKW86etGgGu7ZGNTuRyOmiIKdegKA1W9qc45axfW0nwdh6SUlrIBd/
	 vUBCG+PjNpfzOOCvRpsujESQHF5e2xiKBKnLKgc5cHX2Vf9XmiEVbDZ+4/PYukVanqOcE
	 YyeNMqnNwYyo+vnqr3J/hH+h3pnNd/Wl/X/kCN8zLIUY93ECiWWC/S5DlbOoACr1SHDs7
	 LpPvgMj+MBNhYvWHvUUJxoLmnvZ2nT6b4shg/IDGNiGcBN12izm7MTDtFU1MvNyfyDCt1
	 t+oBbFi2fgBsor6aNVbq6ItDEBLEHstsSNMMmBS4tF3fEI5KQdC9laOhpRLavU0GFQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=lngVNG7p;
	arc=none smtp.remote-ip=79.135.106.26
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74752606A325
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74752606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=lngVNG7p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1795090794; x=1795349994;
	bh=3gmccjYqj54OpQwxCx6BodGClmmljqO/sWD6CyVyKWM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lngVNG7pEMG4K45iTe7eiKh/1sa6U5XYZ990dG0Vy5AXVpxaEOpsBp61YJ6KKpJsM
	 vsIz++Y2ODbFfEHjYH80bdn8EEH8Rn8/dFXWOFrW/6PKXO3pZYk9jzsGHN4dOe2eSc
	 24DuQV4X1xK/ItTxMvGIMvskbrw+VwkyeTim/HhnGRbqQKHScYNe3AxZss2xVINMU0
	 9N8yPKk1siDAGBg/EGdwCtf+cbh2ngTkeFPjN/gN+LOsp0zyoR7GNker5OAVlgZ8ZF
	 aErW2NPktn2ZogSyYYoXJC4EIZ78+m/7vuSRcUcCf0gi/N1kUQ8hvWL0STlPlHrZ1W
	 w4kDndW/tCTOw==
Date: Thu, 19 Nov 2026 12:19:47 +0000
To: Christian Lamparter <chunkeey@gmail.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: carl9170: take the URB reference before queueing the TX frame
Message-ID: <Tsg4m0noYosUHea-XtmwgWHk7P-OYoNucvGSMmGqJf13jq7kfKHe_3YoAw8zXDeZMr-hL8lfTUyd4fsd1bLrytdW2M_aiq5VgbGy5f2WgN4=@becholey.ch>
In-Reply-To: <2b4f5359-096b-4add-b2d5-6b2d5705081c@gmail.com>
References: <20261119093511.558151-1-alex@becholey.ch> <2b4f5359-096b-4add-b2d5-6b2d5705081c@gmail.com>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 50bf1d52f6dcde81316f7883b1498701c7a53751
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 19th, 2026 at 12:36 PM, Christian Lamparter <chunkeey=
@gmail.com> wrote:

> On 11/19/26 10:35 AM, Alexandre Becholey wrote:
> > carl9170_tx() puts a frame on ar->tx_status[] while it holds only its
> > initial reference and takes the reference for the URB afterwards. A TX
> > status for the frame's cookie that is processed on another CPU in
> > between drops the only reference, and mac80211 frees the frame. The
> > driver then increments the dead refcount and submits the freed skb as
> > URB buffer and context.
>=20
> Ok, so you have virtual AR9170 (as in USB-emulated device or did you
> make a custom firmware) that is injecting/generating tx_statuses with
> potential "future" cookies to arrive even before the driver gets to
> fully assign the cookie?
>=20
> Yeah, I think I can see what you are doing there and why.

Yes, a USB-emulated device, no custom firmware. It is a userspace
program on raw-gadget with dummy_hcd, or attached to QEMU's xHCI
through usb-redir. It accepts the firmware download and then answers
the way the carl9170 firmware does: BOOT trap, command responses, the
EEPROM through register reads, and a TXCOMP trap for each uploaded
frame. For this bug it also sends TXCOMP for cookies 1..4 while the
host is transmitting.

>=20
> > A device can hit this window by reporting TX status for the small,
> > predictable cookies while the host transmits, which gives a KASAN
> > slab-use-after-free in carl9170_usb_tx() and carl9170_tx_callback().
> >
> > Take the reference before the frame is queued, as the driver did
> > before commit caf1eae20668 ("carl9170: improve unicast PS buffering").
> >
> > The bug was found, and the reproducer and this fix were written, by AI
> > agents (Claude Mythos and Claude Opus models). The analysis and the
> > patch were reviewed by a human.
> >
> > Fixes: caf1eae20668 ("carl9170: improve unicast PS buffering")
> > Cc: stable@vger.kernel.org
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
>=20
> > Signed-off-by: Alexandre Becholey <alex@becholey.ch>
> > ---
> > An emulated AR9170 that answers TX status for cookies 1..4 while the
>=20
> Do you really have emulated AR9170 like something similar to mac80211_hws=
im? Cool!
> I'm not interested in the reproducer, but a even a semi-working simulator=
 for the
> AR9170: Now that would be sick!

Not that far. It plays an open access point, so the host can bring
wlan0 up, associate and send traffic, including ADDBA and A-MPDU, but
there is no PHY behind it and it only covers what the tests need.
It is about 1500 lines of C; I can send it to you off-list if it is
useful.

>=20
> > host sends traffic (an unprivileged UDP socket is enough) triggers
> > "refcount_t: addition on 0" and KASAN use-after-free on v7.3.1 and
> > "kernel BUG at lib/refcount.c:34" on master 666539eecdf4. With the fix:
> > no report in 68 patched trigger boots (9 on xHCI, 9 on master); traffic
> > with a well-behaved device (also HT/A-MPDU) is unchanged.
>=20
> Am I reading this correctly? You have access to a real AR9170 hardware de=
vice too
> and this patch was tested there as well? If that's the case, why did you =
not add
> this to the commit message above? Because I think this belongs into the c=
ommit
> message. This is the "best" way to show everyone that you really did
> "dotted the i's and crossed the t's".

No, sorry, that was unclear. The "well-behaved device" is the same
emulator in a mode where it reports TX status only after the frame was
uploaded, as the firmware does. The patch has not been tested on real
hardware.

>=20
> Question: What do you mean with (9 on xHCI, 9 on master)?

All 68 boots were QEMU virtual machines (arm64) running a kernel with
the patch. 9 of them attached the emulated device to QEMU's xHCI
controller instead of dummy_hcd, and 9 ran torvalds/master
666539eecdf4 with the patch instead of v7.3.1. None of them showed the
refcount warning or a KASAN report, while the same reproducer triggers
it in most boots without the patch. On an instrumented build we also
checked that the early TX status really arrives in the window between
queueing and carl9170_usb_tx() with the patch applied.

Thanks for the review and the ack.
Alexandre

>=20
> Do you mean 9 tests where successfully performed on real hardware (connec=
ted to a xHCI controller)
> And "9 on master" means that a patched linux on top of 666539eecdf4 [1] s=
urvived without
> triggering a use-after-free?
>=20
> Cheers,
> Christian
>=20
> [1] <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D666539eecdf4db623f5e3c3e55cf9f2dfad24aa4>
>=20
>=20
> > Reproducer available on request.
> > Applies to master 4405c18c95d2 (tx.c unchanged since the tests).
> >   drivers/net/wireless/ath/carl9170/tx.c | 16 +++++++++-------
> >   1 file changed, 9 insertions(+), 7 deletions(-)
> >
> >
> > diff --git a/drivers/net/wireless/ath/carl9170/tx.c b/drivers/net/wirel=
ess/ath/carl9170/tx.c
> > index 06aaf281655b..46d8bc6647e3 100644
> > --- a/drivers/net/wireless/ath/carl9170/tx.c
> > +++ b/drivers/net/wireless/ath/carl9170/tx.c
> > @@ -1364,13 +1364,6 @@ static void carl9170_tx(struct ar9170 *ar)
> >
> >   =09=09=09atomic_inc(&ar->tx_total_pending);
> >
> > -=09=09=09q =3D __carl9170_get_queue(ar, i);
> > -=09=09=09/*
> > -=09=09=09 * NB: tx_status[i] vs. tx_status[q],
> > -=09=09=09 * TODO: Move into pick_skb or alloc_dev_space.
> > -=09=09=09 */
> > -=09=09=09skb_queue_tail(&ar->tx_status[q], skb);
> > -
> >   =09=09=09/*
> >   =09=09=09 * increase ref count to "2".
> >   =09=09=09 * Ref counting is the easiest way to solve the
> > @@ -1378,9 +1371,18 @@ static void carl9170_tx(struct ar9170 *ar)
> >   =09=09=09 *=09carl9170_tx_callback
> >   =09=09=09 * and wlan tx status functions:
> >   =09=09=09 *=09carl9170_tx_status/janitor.
> > +=09=09=09 * It must be taken before the frame is queued on
> > +=09=09=09 * tx_status[], where the status path can find it.
> >   =09=09=09 */
> >   =09=09=09carl9170_tx_get_skb(skb);
> >
> > +=09=09=09q =3D __carl9170_get_queue(ar, i);
> > +=09=09=09/*
> > +=09=09=09 * NB: tx_status[i] vs. tx_status[q],
> > +=09=09=09 * TODO: Move into pick_skb or alloc_dev_space.
> > +=09=09=09 */
> > +=09=09=09skb_queue_tail(&ar->tx_status[q], skb);
> > +
> >   =09=09=09carl9170_usb_tx(ar, skb);
> >   =09=09=09schedule_garbagecollector =3D true;
> >   =09=09}
>=20
> 
