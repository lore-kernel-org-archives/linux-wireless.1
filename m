Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.158.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187859;
	b=i2NI+NmYvob0VRKg7d37f7U9GvVG5+9rjzQnj2AN5Cp3nULp86wAFY3qYHXKg13QSGdr
	 wooIKayGH4EaRRaPwFs2OF6CPF5o5g7hdXGJA6xGUfQ5zuuKbUMeWwRxsltyE1S7SPiqn
	 1IR6WPoEpM6u9+bpKqYa6QfpuxE12lXgKkezHSDvEYU/Qty6N8H6Iaad31Lf7I/l6D4z5
	 i0UVBxP1XA3lnLTE4MlAxMI+R8p4tm76h5Y5g2I4h7RH12zwCSYQJT+jQ8AWClEAa7Bev
	 Y2ZySpW4sgH64eQgI1IjBLsq5My6LyDYAa//bLgxbJWZ6sb9Pt9VctOQZEXpd2V42Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187859;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=4Gq03GgV6TQ5rpxazRcGaTW2ycWOiyS1E7TDSb4z090=;
	b=Mta4NxToPTR1xHsVmi7pZAVcIbrTg1jF9EerTTR2ddZwZd1n9eIenTpJFD+NrZ4JMH6d
	 fd+cH5TS5KsGbzwEcJitStmwRRS6R4WXXQLb2rS7ZpEGo+FaJ00HDKdxOIECU4s0wV0fj
	 FtYu+32U+IueYNm9E112q0kj6/hEWkzMWRF03859tS3nDS73Ny0nQImgmU5jswGpuSlsT
	 a3zLmnYZVf/f7OW5q5Y7na3Dtk+iBJq+SuVl1WezT/pUuNMCEyhLimzz3lazMpLw94KZ2
	 MG7YFTrLQRdKoK0GFeGTiZ18uTPtK6xWoHSYFDpVAR1YIh7AzFbxLankocQK5Ud61Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=WnbzEXR7;
	arc=none smtp.remote-ip=62.149.158.116
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53904606A339
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 15:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53904606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=WnbzEXR7
Received: from DELL-MOBILE03.ad.smart.it ([95.246.58.155])
	by Aruba SMTP with ESMTPSA
	id UQMjxFIDMmlDxUQMjxey2Y; Fri, 20 Nov 2026 16:17:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1795187849; bh=r2cMWP2+SC1+Yb5JSmPustqgF8rwF1SsSKTYPqMPego=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=WnbzEXR7dLk+SouXwqoyQIymTeJEbWssx1uNBYksKI8jmg3UbWELZoCWnb3jB5Z7s
	 IAunBKIAR8nYP065WXPOcu3S6lG5FK8oZZI8Xw+N9s2UNZoesnKGQ254UAEUNitFsl
	 IBJwwn3ZZdpuI9QTqEaK1DP2LiM1GglVWBBU4zvyLXLGqhmIqO0hZG54JUn+YNvdWu
	 bxjjABzNP72KLfWo+95/A8tagTaWoCYgZwRDnBaAdMaGrp/+pBt+t+T+VCl2Jpfjvk
	 f/28x7TVjf4EOS3S6DOL/YI68qRKq/3Ix7YpB/bmo2l39hvc+edr7uLd+Jd/5CWWKV
	 mTfEGaAaaD+CQ==
Date: Fri, 20 Nov 2026 16:17:27 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [ANN] I will stop applying driver patches
Message-ID: <20261120161727.332fc3e0@DELL-MOBILE03.ad.smart.it>
In-Reply-To: <940c366543565baf0039f716ac9a65d482a06a8f.camel@sipsolutions.net>
References: <20261106172631.00002d25@mythread.it>
	<940c366543565baf0039f716ac9a65d482a06a8f.camel@sipsolutions.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNNXjm0JcAR0oot1OGkY2cn1r/vPD/VbsRA4ogGAlrhi4DPZ8lmq8jCFj6LYsMyHWByJC2kYDbOAyGI18IwBbHKBW8MQC09yEozhYZbhZCDbPRAzfb75
 Yzj8rLILvy0+ZY+f5iAqf+m8wdeetkssvPNQScdl2fm5k0ujiKkY0xek0Og6vtZ2VbxaRmS7SZn8euf92P/LvPVWXhkM8emDQbta0JHG3KJev/D3FJvgK6/O
 nc4pl2R8LoDurbBMwMEV+ykRTHllh+PM1yIf4l9VuFU=

On Thu, 19 Nov 2026 16:03:48 +0100
Johannes Berg <johannes@sipsolutions.net> wrote:

Hi Johannes

> 
> I don't even have the hardware, so I cannot hope to do anything
> reasonable with these patches.

Fair, I get that without the hardware and without publicly available
documentation, the effort to review something that targets Broadcom
hardware is very likely the same as doing it yourself in the first
place. I wrongly thought that somewhere there was still someone with the
hardware and knowledge to review it.

> 
> I think the right thing that happens in these cases is that those
> people who actually have and care about the hardware build a
> community around it first, and *then* go bother the upstream
> maintainer (i.e. me) after they've figured this out.
> 

Well... since your announcement, I opened a fork of b43 on my github, to
try to organize my own and other people's contributions and keep working
on it.
Note: very rough, experimental, many names are still placeholders (in
AC almost all of them).

> 
> Demanding that someone magically upstream reviews things isn't going
> to work. I'd much rather kick a driver for decades-old hardware like
> b43 out entirely and say you can maintain it in a github repo, than
> start reviewing patches for it, I have far too many things, even with
> a better ROI for the community (like work on shared components) to
> deal with.

It's not all decades-old hardware, late N and AC hardware is still in
use and capable enough. Just to say, my fiber connection is saturated
by the bcm4360 just fine, even with b43-next.

> 
> Maybe you (again, not personally maybe, a more generic "you") want to
> become an upstream maintainer, great. Start reviewing other drivers,
> other patches, get a feeling for the processes involved, send useful
> comments that show you're learning things. Eventually, open a tree and
> send me pull requests that don't require me combing through every
> patch. Ask questions where you're unsure, that's fine, but be
> present. And I also get that this is a time commitment, trust me, I
> do. If you don't have time for that, that's fair, but then I don't
> see why you're demanding that I spend my time on it, if it's
> something that my employer doesn't really care about (so I'm not
> really paid for it directly), nor I care about myself.
> 

For others, I don't know. But for me, personally, outside of my own
hardware I'd be more of a burden than a help, and I'd rather not be. I
can help with hardware I own, but that's because I own it, I can see it
running and probe it. When in doubt, it's my source of truth: I can go
back to it and check, create weird tricks to check more if simply
checking with what's available is not enough. 
My wifi experience was "none" until 4 months ago, now it's just
"lacking" with a spike around how Broadcom hardware behaves. Also
since I already started, I want to finish improving the driver for my
own hardware (which spans from G-chips to AC-chips, with samples from
every gen, so not a fast task either). When I'm finished, maybe I'll
know something more and be able to say (or ask) something useful.

Alessio

