Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860125;
	b=ktnBPdyMRzP+CRM6YNfInwwJaTVG6d7I81b3yROHf/4R6uWJxDqr2c9j/yC6aUiOhPKq
	 jxJbEhbRl5NAYtBN9PnXoDNV5N6Z6l29K1ASY1VJoeh8YLQkze21ZoVUIujYIz3YsGn6G
	 aFY3GAmn/CdJLBdEpWcxA8BnOJw5ZBkx6Nh3zEVC2aW5WnL6l3Y+VxnLoW6so2JsmiKTE
	 ZjplOzO1kLlNA7FAb0x6Kt9kSG+/lfWrqaPcVluFn9CxnY4TiqOrQQi8hbssW9Gopbyul
	 AAzo479OZkL6VKZVIx6dRIUSiMKFhI4dRIXDOb/+JIQmMmvvBzWfdgtPb5BgDP0mhoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
	b=hGJLqqrkhzQhzGHJr/BvSRW07YxCiJIKTnTnnAC1N9MB0ndr9FePMcmzyVWfWYl6rFYA
	 LNBptNUsfsd+ynHhNhPNAHz93/KTKXj8ldChmAtVnmaggLK2LQUAnVRzp4Bxaztx+hdmG
	 1mGKEXVUfhJrjJ4FAqfhe3lnJJ0aJTqzdZSbH3Mhw6pX6W14MM6s804vbfkyP3aS2DPYL
	 lBpxRmzug/OOuRz0aGaqdHAnuCww7F/CszLoDKl7IU6yhIUdpU1+nloPQCMuP+sRNLwik
	 yj0w8Q2x+n5i4G0mIfsIXdOECufnK3JKc+wGiqXFVsAqNpS7YlQ1VfD2A4OfGwNuZZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrfslSZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D51606A889
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 20:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D51606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrfslSZk
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3791619605cso7310731eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794860124; cv=none;
        d=google.com; s=arc-20260327;
        b=Aht11NGcEYzxyYR5jHN3Gu3WhIP0VgRm1LZeiRG/1coR5SdhPZGQIPXLqoJKm9Gz8b
         7487RATLfZlc5n9Ft+8mQyGtqjZmfX+z1eRmB7NB79DUICsi5svgDONW3Vke6e8DFJm0
         jHiao9H7YKKv7Cum3XO5cQgAHc7x/aDMvnxYkeJoFcM89bqmHJWUP6e2nPRlqoQmVSZQ
         nDAJcfuw6lHKAPxHF/fCqbWGMqnppeV/CLBr6fgvZs2vj3+xY1IZwscsBf0WR+ER1MQA
         2sqpRUD8yK12i3FQphC4U9RB8KGd1XJwW1Yd2ujfvjaM3W4lJ37t25LE0jezQbXofOOU
         XlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        fh=i8G9GdWmPyqgCSOmREf+BIYxR16UiAY8j1tnfkBAsUk=;
        b=IE49Swhzh5I1iTP+PGy6sW/r2o64tnYVSRvpOdLhQjkzEP0gTWVFgw3IesZ+BQ7vjH
         fvn/BG1yy7l83i+B0g2UZa82XdcpDlsiDWjC78Cl5L00tui7xiMiK/IXsi4rNgCEPjMo
         x1w05szZMcUjPLhDc/NPF7mpSj3rpvnTzu0EssIdvSH62F4p9brFohgKoeY8zblaTZdk
         Inz/a45GLk6BMAX7LvczSQNlqs8hsCr3cqembLwDBtAj+Er2O3HPIt1sJz+ShYjrLKiY
         IiiFjonpmI2ifXu3+H/9e0HP7oWM4CKX3GBhVgrxTyruGR4RZXmSETcgMJX0MPpJcUDT
         W2QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794860124; x=1795464924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        b=vrfslSZkkWIbbZ3S+55KHF/+hOyua/BeiYWf3E3VT8wwroxcEs+tYLtCqQYF0gtHOK
         rgIdXBxeGre0iISx4kMw1NOz1lQnEuLIQT3ios4WH8/NdmqzAHp1ccFf6XYVDAn4Upgv
         HbZErb5EpXHVfYJEYGZuf4voWw4sBpxw1ij+ECapyU/5Oy6SBvVwoqVVYheYuf0nrXYN
         YVO6jYVJurRl4UZ7EOQopDsxsACsQC5MYOc4nMF7flILyn3m1LZE/D+b3ZnJ9eITKdPx
         VNed4HlWno9VMWF6pXRHBvnpg57uAZTB0B3kcomesqHEMKJFkbluM0FXNnkkDrSqCuuv
         JSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860124; x=1795464924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U9DIk4gufLfzsj+yHBbTJaIiLke5+veThAGL5SoV3Q=;
        b=yceCzn8/7aeE/6sbV43Yx194vCNkKiru6Gu5GaghfQjmvjrBA8HjHu7ejbkQa7sZXh
         yG5FT6sNFUFE3FoVIC25V/gKR4LqgqpjWA8D4lQu9lbENnT4HZKVC90HhgnSCZ+TBZfp
         TVoLiP4mK5mG9fptxt17XmO/ipUCm3CbpoR8HVPtAK6j5ID5G1+mL7REeYnyzulW/rxl
         4VDllzMM4PtG4HVWeirZS5dqB8eaInWbSkgXsuFVv/bLHjajDME3V3wmZURyx/DFg8LP
         GrWiSYGReM73MBRyIDWMDuX7pOnyHyN6bzLjwbmKkB0gZBZEQzyW1Trt31NGjrtX7tLh
         oNwQ==
X-Forwarded-Encrypted: i=1; AL+hErG49Pms6nRPTSDdxG4IDvelI3zFquT3UPwY11aRmvyJ4EhJe0YkNYoNc/uw029o/AUiZaekh0/lT5VvQvLVcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8yFLCY73SpiFybiUSKNJi8CeG8NwsQuHag/TX8ACpjUG8m1QI
	+IzBcK9uG+Q89JUiX6rEor7fcgUAzqjLjGw1+WvQMUwoxW8SgFp5pdT0c3UzCQopltTJyENTnGH
	Tj06lEYX1pn6V3PaxA1sAf88NKy0b5Ts=
X-Gm-Gg: AZFdTZfhYOGi9b+fsK5QdYbS6czsLaJF1lUJtnEHm/ztJI7oKQHOn2u6QUE8fa1lsfN
	NKJ8bHvURDXAi5bG9O5a0bjMGrf0idq1BZUrj78AwXRXaXoOyLIEe12eyQvaCDOxNxBQXuWU1XT
	mQ9RIEC5Wu1pOln+l0lhHKM6q8NrSHkV0ZBqDaPkWnViq0uWUqRxr35TTL9XSoJ539pkTPFhiUU
	PVI4k3YCbfxjcBgcJmMMGOhMHMQU7H27Ee+JVWFO2uC+x9lXlgM4rIIZljU+j2sGxJofl29qebT
	KwPiuXLFfFXGV2AUezcNaOUepIHi7UJfIj60/s9q/ZDiT7RZ9di/z9PeNImp5gpWsYJlPBo+y/w
	ol9c5YyKjs6P/MOtRtotllBtHZhONCDbbj0lyK2EmRexeQxZVGbhun8VDf8IIO618NxeA10pEQ+
	2/StQBDgMJZCFnltZknMr8v4Uh
X-Received: by 2002:a05:7301:da0f:b0:36c:a42d:9bc9 with SMTP id
 5a478bee46e88-37966961442mr11539095eec.25.1794860123301; Mon, 16 Nov 2026
 12:15:23 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-mac80211-rx-null-link-v2-1-ea512ae98139@gmail.com> <ab8a37b85e4eac72a3176c0d43ed59017ee0187e.camel@sipsolutions.net>
In-Reply-To: <ab8a37b85e4eac72a3176c0d43ed59017ee0187e.camel@sipsolutions.net>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Mon, 16 Nov 2026 17:15:11 -0300
X-Gm-Features: AclHuK-_T8rNXwIvw9C2aoOvEckYiplrQOXDu822YU9icPFp7kvGxeBI3RRnOxs
Message-ID: <CAOCBhwGA-8P=aLa2bw19QtowCXQV6JwQ86S+OPha2u5s7U41qA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mac80211: check for a NULL link in the
 MLD station RX loop
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Benjamin Berg <benjamin.berg@intel.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My apologies; I sent this via an automation b4 tool, and the message
contained the raw output from the LLM.

A summary of the issue: 'ieee80211_vif_update_links()' sets
'sdata->link[link_id]' to 'NULL' before removing the STA from the link
hash table. During this interval, an incoming frame might still
encounter the STA for that link within the 'for_each_link_sta_info()'
loop in
'__ieee80211_rx_handle_packet()'. Subsequently,
'ieee80211_rx_valid_freq()' may end up dereferencing a null pointer.

I discovered this while reading the code, though I have not been able
to reproduce the issue. If you agree that this is indeed a problem, I
can submit a V3=E2=80=94or you may proceed without one. If I have overlooke=
d
something, please feel free to discard the patch.


Em seg., 16 de nov. de 2026 =C3=A0s 16:38, Johannes Berg
<johannes@sipsolutions.net> escreveu:
>
> On Mon, 2026-11-16 at 19:37 +0000, Joas Antonio dos Santos via B4 Relay
> wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > Since commit 6d531b9af16e ("wifi: mac80211: rework RX packet handling")=
,
> > __ieee80211_rx_handle_packet() looks up the link of each MLD station
> > that matches addr2 and passes it straight to ieee80211_rx_valid_freq(),
> > which dereferences link->sdata and link->conf whenever status->freq is
> > set.  The non-MLD loop and the interface loop below it check the link,
> > this one does not.
> >
> > The link can be NULL there.  ieee80211_vif_update_links() clears
> > sdata->link[link_id] for a removed link first, and only later, after
> > ieee80211_tear_down_links() (including its synchronize_rcu()) and
> > drv_change_vif_links(), calls ieee80211_sta_remove_link(), which takes
> > the link station out of the hash.  RX runs under RCU only, so a data
> > frame from that link's address arriving in this window finds the link
> > station but a NULL link, and the kernel oopses in softirq context.  A
> > link is removed this way for example when an associated AP announces
> > removal of one of its links (ieee80211_ml_reconf_work()), and the
> > frames only need a matching transmitter address, before any crypto.
> >
> > Before the rework, ieee80211_rx_data_set_link() returned false for a
> > NULL link and the frame was skipped.  Skip it again.
> >
> > Fixes: 6d531b9af16e ("wifi: mac80211: rework RX packet handling")
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > ---
> > Found by LLM-assisted code review of the RX rework and confirmed by
> > reading the link removal path by hand.  I have not reproduced the oops
> > at runtime.
> >
> > v1 got no replies but is marked "Changes Requested" in patchwork, so I
> > am not sure what is expected.  Please let me know if something else is
> > wanted here.
> >
>
> I've said this pretty generally before - don't send me raw LLM output,
> read it and make it make sense.
>
> johannes



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
