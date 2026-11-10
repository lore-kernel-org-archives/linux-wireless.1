Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794330096;
	b=tLH0uuKjtuhIZzC7TZJPpccpbbCcguP2Z92oaBUbQHqDWoMdUbU3MkR82wpogJ0DI1Tj
	 ZWLsol2hIQ+24Kje7hH7Jb958mquasBkeP2B9LV3Okz3LQn88Lf2ZeGYI7/cZZVi7mb5d
	 9bZBmA0PlgV8YghlGODga0EfBxDUB5hQ0TCshelWehwsLFUBxfN8R5CecREF7mNSqRGjY
	 OwxHRrJ8rjq56YMl8qzK9SX50d3RJ+CVnTkuGHJJgXR00fT3+lZBPzZHraMaPBJVnIM3w
	 cNpBgibJK1rrcdGFEdpYv0eL1eC5BYssl36OdQc5cFz+F1iqPowN9vCnLuNFERU7Vyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
	b=B1Gs4WdN82/mYezAcOUnHRKwi3oAk7Ls3xVVRfQeY0r9GSekV6G3mW1HuEU0FWO3POH4
	 pGG8NyDIk2he7kT1xbzmuQqlPpNWr+XL2s0CGxlsIYeQCdedTTW0+2u1MXpLAgn0Di797
	 njekjfZEPAQzgx6ahfpz1U4+erHmlijUDdFBS96UlqOEx/gObcJ0HFXs/WVwBPvtrlfUh
	 agoojRicupjHKTnEPWkGHMfCKOyF7qHE/oGUmaQYs9T83gVpyZVjhEyYHU7BmKUYc3/Bf
	 me0qeyEOSkUNkIMk7Kqa9V2GUiNqluTWi53FB8XS7U/70fGoKAVmZw8aIw2dPz8MQtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkiwtVJz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDFE606A826
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDFE606A826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkiwtVJz
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed08b07213so9473165ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794330095; cv=none;
        d=google.com; s=arc-20260327;
        b=k98StovZ8otWK7CuPpW27JP+E35otyThr1tBoqUlcMhMBzvAZrvXUeLuGWP9ovuDAg
         UN1Ovr3LC+DALA+dlNPLmtkAilggH5++3xobqQc8qcXZbYnMtEjcfru9icH8fU0mBnU6
         99s5B3f3uAvXt8k1hWx4QGfyB8UaRMC1Mne6jaUFp4pVlXxUFDyrVy9H/I8MX5RlH70i
         R8NH6SiGDP2ihfiR9nPon8SGsLXAoFeKo9VxdHae0IyhLZR0kR2bG8dBxAmmlgE14n/N
         1nh4vApkTEBZGiFsfEUVzLx0SME/Y3lxqenEUEtmGtQvXMON5c/UlzmuN6UF9zM9nznK
         3qhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        fh=PmUsoUYY84pwFu8SqgcTqQWUKc3dM0rVZbJuqYImW4k=;
        b=V8dF1VEuYjtjD/kAInDFkMPdH+7MxtPGyEdRE8eGCj2infDZPKN8zEFQGTFQywhMpF
         bYehMe1OuyUh346D4CX6DeAaHClc6Pq1wcgjgFnlJ7vmLL8dYfDQxE6h760t3UO11UM6
         Roc1gw3RQdNu9jpZUT+JdWxv4dVlljPQwGIp9xqVN68DxdR41JrycBeLeopu2Rv+qh+y
         zfrv710v9K3Y6gPCCQXaowFLUl0P+38imwRcZceusqBghTH34SkaHVc9oygQzuN3sVWL
         M2s6218YOqnduFJ+QKUbN0HcSjEUJ+9RpAt7VzyNRuGnXmD74ihHN8AL9IUUg+AxQYZs
         3KuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330095; x=1794934895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        b=DkiwtVJzqQk6PVel78hJBmAzaNLZqfqlGFlW5GqGzYK1GnjLQACI/8337BH36hZ0Gr
         2HdjvHaRKQ6lG6ORPfUa2vrcfYQgvNy9dMVXSL9DsxECBe+kQTuaRiIGR/ihyfSeffTZ
         9xiaDsYkE4tdoKMPsmqsZx19cH84KyhfRqHQoOCJTFrcNCdCWhuOVN7g6/PK/+CznEPv
         ojJQokDwhjBgxwF6iQsDGy/jdYyM2vbb0s/LdBVgAEMn9mtb8UC/gazQUmr28qsbISYu
         hnBSD4WfZF71jgT28i7KEJlty4Wd39HJHDilSDpiiObI6+r3JUD+vVjQqSYvoTTgIKDM
         xpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330095; x=1794934895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        b=kdjGT+yn0ZfQp4EqyiaLttMV16N0s2sAbQ7b1EyIFcnWRcJS9qov2EEPKVzNxsSHJO
         RvHuInE3L+0eZ2QtzAw69CwuS65qSkDf7U7GlCu8BgRCWangvTX5QjZssORYLXgveLoY
         dmN7M0ggN36mRpZ2SNfHtmVprombXpE4N5IriPs2LfPWbegcN74TbNENP9Bd4DlkMHff
         LVKiyGXR79k8+QoOvxL6EXULdwxA8TFBXGhN/eiJ/eoFfZEkHuT/1P8gW4QgSpMDOfzU
         9oVvrL0V/7z0Ozs4h1tlZcv+e6ACw1xdv3yFeFGuxDvu1ET+ydDOep0sRP9Jry73I7+q
         dFBg==
X-Gm-Message-State: APuU4Z8+QNwNlahb3W5UW21EoVzIhyljU+Fg4Qj+Yh0jTW9+td5cUqiD
	qL/La/TTKnO2YKggioibksnym1FuzWTs/khV9V+QDrw5+f3McRcW4rKm+oCAinTW8zqWFkvIqAn
	3wXgOAxttBF0kgZr0GUUsHROIusr3mOr6+If4XoM=
X-Gm-Gg: AYBFou1+Ym3h2ogtzrIwCYnz1qWW7aVUpYaoH/PPAimI3CZN+TRl4eqiBAAVSEcg169
	rWYDHpPZHmXg2pAr18fEWVAs7HpDORf7sl01mDuOnTH+ysw6l2YkXvKkvnKjlPv2aSlkl+tWd4U
	k4AGirlUIEfedS/cyqkd+oTygFQiP2FiTTOMHAlb6G7P1nfisjfszG3bQCabbAENBN+swe0l19e
	Dsy9LpZNBoRy8g8NosBvpXWJv4hTXEJU8nLGdmSN6ywJQa3Iig+ndemS8mLKRkiEDStu1HHwGME
	6DcyWHumlEYrQJO+F7B2J9uq64bp0I/sb0ibWCWHvDVkYE9plNEdfJRkvFuHPxp4JfKI75nSm5P
	CpGU1exhM1SYfT1aKG3eU359/r+4a41anQ94wZzxCeADbqWxXoBeyuaNI3gKQpf5iMx3aO7RIha
	BamrOSUyoPR1tKWsmO
X-Received: by 2002:a17:903:2c0d:b0:2dd:ad73:5b6c with SMTP id
 d9443c01a7336-2edb91d1be7mr29021395ad.28.1794330095334; Tue, 10 Nov 2026
 09:01:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026053633.361454-1-ragulbaby@gmail.com> <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
In-Reply-To: <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 10 Nov 2026 11:01:22 -0600
X-Gm-Features: AclHuK-qAhQQJmLAEoUnYuJytpf9QaGHuJqgYrVYZ81qt_RC_QuekruQ3SpoK44
Message-ID: <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 1:55=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 26/10/2026 06:36, Ragul Balaji wrote:
> > This series adds support for the following 802.11n USB adapters:
> > - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
> > - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
> >
> >
> > The protocol was inferred from USB captures of the vendor's
> > Windows driver, cross referenced with code from brcmsmac, brcmfmac and =
b43.
> > The code which are copied almost as-is from the referenced drivers
> > are indicated in the comments of the code
> >
> > The driver supports:
> >
> > - station, P2P client and monitor interfaces
> > - HT20 and HT40, A-MPDU and A-MSDU transmission
> > - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
> > - hardware CCMP with management frame protection
> > - the LEDs and the WPS button
> >
> > Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
> > TKIP/WEP can be added in later patches
> This is really old cruft and it is a different driver architecture.
> Within Broadcom we called it BMAC and when we upstreamed the brcm80211
> drivers this architecture was already going to be abandoned. The term
> BMAC is also found in brcmsmac code base so it is easy to see where the
> split was made for the RPC interface.
>
> Generally speaking I am a strong believer of reuse, but this series is
> touching the other drivers more than I like. I would rather split it in
> two series so we can apply the patches touching the existing drivers
> first and assure that there are no regressions. Then add the "new" BMAC
> driver.
Ok that makes sense. we will split it up into brcmfmac, brcmsmac and
the driver files.
Qn for you: should we rename this to "brcmbmac" or is this current name fin=
e?
>
> Regards,
> Arend
