Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100632;
	b=oVt0s3mH6tUILwhaDcW4Te2kfsEw3cAx0u6ftkacOlEC/BjNChZi8uI2N1IrpSjXsCe0
	 4r2aoFwCfSK0OH6ITmIBAyB7IXlPtghCrMLfSooC5/dT17+GuxdAikoZHFLoylcW/HUP+
	 F5wkauKrqU01cAZlo81ZWID7IJ4ly8LtTdm59ND3bjIyBFU05OirJh4bQGnqJZnfuqCSw
	 BhFjWo9tsj4Kd/hUE7MZdHDUmlDmZmDlDRaR/lRU/yoC8QJWs2XdKxA+KPbhZmjTjeHGA
	 yFnD5J6AvqPwJ+3+cRqh7z0/qvw20DNWO4EEMT2mHlAhCUudz+0KEtcK+cD6fpQwckg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100632;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=2DNA/UZEMH8AVZWxg+dU8IaHm5I9tJkEMZIreWMFoic=;
	b=YlvBN6idSfJfPQvB3D+TRP8/05a65yQj8JeJxAUyF9conK+5+kmWc0q2ZjkEOKayvliz
	 llho+mATMMUrQ9ZMhKur8Mx7t+mcT5gWOtxcxd9DQOk6HV9FmDPtccqac3PgbqGBTxPH0
	 XJsvSt6HP7AwDSoeTGDShNAPuk3QQaSoMBow7P568p44sKE/YXUr51wbxLUUyonre19Ey
	 Sm/Tpaaw21MAE3bX2BP5GTU89r4FLbijwmG25ziiwZ/oP299DaaJHwCb3CcNLCgLdAnFq
	 dZ3VL3e0PeQ1VylSiUyU6vbg4TGS/ji9WX91tUw24X84ZzSylXB6zOIamRamzyHcDBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JXNmKZIq;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB34606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JXNmKZIq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2DNA/UZEMH8AVZWxg+dU8IaHm5I9tJkEMZIreWMFoic=;
	t=1795100631; x=1796310231; b=JXNmKZIqwaMXsb9Ft900E0eOmw35KfqJc63flX+aXwctTGZ
	Q0adNWqSylzOVN4FIp7nibT7i5pf4dvh+AUGX8XJqCJMlkLI/8TnfRIsHxXcm411amDvw9mwYFxnA
	4AazaEwILjYZDmfStKoQN+bxDk/be9aeQH0W8p9XZL4cK1qpurz7Y4RRV9p7rjQ5rPDBZbSqUXwgD
	G7sAEXqdAGVIhbeWYfkkyaVvlhes5nTO+p2v6whXM2JYMphhLVDJEVToxvvrB2wj32YpPyN/wpFYv
	9gOwcNwc09t+wd7ziPuAasgoFwTBg8Ij+VP/eEKPJle4db0gbVTwiw58xhUvCiWQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU3fx-00000004RA2-0cGI;
	Thu, 19 Nov 2026 16:03:49 +0100
Message-ID: <940c366543565baf0039f716ac9a65d482a06a8f.camel@sipsolutions.net>
Subject: Re: [ANN] I will stop applying driver patches
From: Johannes Berg <johannes@sipsolutions.net>
To: Alessio Ferri <alessio.ferri@mythread.it>
Cc: linux-wireless@vger.kernel.org
Date: Thu, 19 Nov 2026 16:03:48 +0100
In-Reply-To: <20261106172631.00002d25@mythread.it>
References: <20261106172631.00002d25@mythread.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Alessio,

I had to let this one cool off for a while ...

> in defense of the people who "send patches to decades-old drivers":
> Those drivers are incomplete/buggy/a pain to deal with, usually because
> of the poor vendor support or totally missing documentation (no need to
> name names).=20

Trust me, I know. I was part of the reverse engineering team.

> A lot of people (I am one of them) have had to deal with them for ages,
> with great suffering and little hope of ever fixing the situation,
> because of missing developers interested in fixing them / no
> documentation to start from / no time to reverse the whole thing.
> Finally today, with some assistance from an LLM, one could hope to have
> working hardware with Linux, or at least try to; it seems then natural
> to send patches upstream for review, instead of keeping them private.

Without really saying that's _you_ specifically, and in fact it's
probably not you from what I've seen, it's crazy at this point to go and
demand turnaround for your patches, "this must be in wireless", etc.

> Sometimes, even with an LLM helping, the work takes months.
> Sometimes, the contributor has no idea of what they are doing, and
> I get why this is a problem, after all maintainers are not review
> machines.

I don't even have the hardware, so I cannot hope to do anything
reasonable with these patches.

> But, there has to be a middle ground, maybe a small overall quota per
> merge window would push people to self-review their own work more
> carefully. That would avoid creating perverse incentives, like
> forcing people to give reviews, with the risk of having people give away
> random Reviewed-by tags just to reach the required number.

I think the right thing that happens in these cases is that those people
who actually have and care about the hardware build a community around
it first, and *then* go bother the upstream maintainer (i.e. me) after
they've figured this out.

If nobody except the one guy who's fixing things with an LLM cares, then
it doesn't need to go upstream, let it die.

If all of them are just throwing patches over the wall with "I have no
idea my LLM said this" then I'm not going to be the one fixing that for
them. Some of them need to read the list, look at patches to other
drivers, learn things and then come back upstream.

Demanding that someone magically upstream reviews things isn't going to
work. I'd much rather kick a driver for decades-old hardware like b43
out entirely and say you can maintain it in a github repo, than start
reviewing patches for it, I have far too many things, even with a better
ROI for the community (like work on shared components) to deal with.

Look, I get it, everybody thinks upstream magically makes things better
quality and it's free to send things upstream. I'm telling you that it's
not, I've paid for it for years (quite a bit personally in time), and
that at the current level of everyone thinks "upstream" will fix it I'm
no longer doing it.

Maybe you (again, not personally maybe, a more generic "you") want to
become an upstream maintainer, great. Start reviewing other drivers,
other patches, get a feeling for the processes involved, send useful
comments that show you're learning things. Eventually, open a tree and
send me pull requests that don't require me combing through every patch.
Ask questions where you're unsure, that's fine, but be present. And I
also get that this is a time commitment, trust me, I do. If you don't
have time for that, that's fair, but then I don't see why you're
demanding that I spend my time on it, if it's something that my employer
doesn't really care about (so I'm not really paid for it directly), nor
I care about myself.

I do care about the whole thing enough that I've done this for years,
and I have no regrets - it's part of giving back to the community that
has built me up and brought me to where I am today. But most
contributors? If I don't apply their patches immediately, or give them
comments to feed into their LLMs, they don't stay around and give
nothing back. I'm done with that.

johannes
