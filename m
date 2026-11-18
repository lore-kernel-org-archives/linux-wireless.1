Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795038996;
	b=OWnP+XYp2lsdYKORnuaWpzAC7c4vwlYV8jgHr5xveJVJWSeLBHDelnLdGk61fOMNadbk
	 K7xH3qCxO00NWt2Hky0NeIiluqoUvATJMu/VkSRE+sE+gsCJO/mje8WO0w3ICFir+HaHM
	 6wZe3StUcNfkZuVN8Mj9hy0iMFdYgJEXOMjNgJiaIEwv/tbV8hS2L9oYXnwZImQO/9qja
	 kdfs90JjcOgMUN66e1SjvhUd4T0dn9l1Xmi/i6pfQjBLmlVoZqQsVens2i8gFibsvT5Wf
	 5uNXcJJ5oNimYORwpHJnxPXipvDdjUhpKXu+mu9EmjE2VuJls/SB56FbZJFuC8WE4oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
	b=molrFKOXyXWoo+NyzWHE8lnzOJODthPeF5aITu5h0XPNq+Olx1OqouDuqAIfrFirQsRJ
	 yyAW4imPs2CTmTchKytJW2BVN5YIZdlVNF/lHZXFNcESRr/rLDEL7O50WJ+n9oCTPKNCY
	 6OuFsqny/16wFBidcVaz6yB2txYUmQ2QPvBJ2TY6MsWSLziC52hGxHoF2jjiI8KHrNu3o
	 jjkcRIBnCeQYgsh+HMvtAEZ1/4wqvOd+E994cqgK8jFlaKx1x+C2zPcfNujV9gd9PQbCl
	 VVbzWXOe6obkKQ+za5n0SlQiRIcnb9EGu8Ycel3iwtKLR+McugyKwaZMo8vdBq0deeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzFOOmSv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B5606A32F
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966B5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzFOOmSv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38318d69173so1582287eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038996; cv=none;
        d=google.com; s=arc-20260327;
        b=EFzFXGo0OiPlHfAH2TF8YVAPrZGd0+ZVZd2arcB2S22rw4RNheISHXM8swEuEKHGc8
         b2mNSjLkM3cHXPoBHLihV8Sce1+GCd2w9wkM5FIpUJGSL/nIsvU9R7S54CLdO6xnwe6S
         nlIIbz9OsfWgGw18Uwc5YSORyCh6htE0PPPnOEpDsN2l1idkmxnHq6CQ8/TYyUY6A7I4
         8bOR/A88tVITOiUH8pKNv3SRJhfPVhDYXzXRMV5eBwKR8T/04/G0AiQbn9wZPO4VdYUc
         MxxRbh4zlM2d4ueVPKpJq77MGhzIa0cttkSDXVtUIeqZegl0nfBzhlqGSeYdpnDILW4i
         OpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        fh=Ein38p4ueWvvLHG+zltUaOQCqiwZ1A4/iznv0tPpLuc=;
        b=UrPotHPZIumPG0nFkd9W2Ow/FaLIB+RmoLhTXTf0ogGgcfLQO3d+mzj8ixkj9IMZx8
         /R77qB4X/i8rtelPIQosqlYW7kj2fTEH3XBsH1Cs+rcdycUnMQxuUlzG4aTTcpiFTYKw
         if/JBfUAeP34kfSxDbYvGcYyAXcmZ8W6Kn44wP0nh2ZX5/qWpyqx9zpqS8k0JQWileaK
         3zM1XkTuthGWPg9khQ/H8vUAAVcOd/h9zKDCdQw9OQMnDWk0z4IuGp7oZDFEsl0TcQv/
         EB0oh1OYz4K4De6bRNHjkePjy/427EjZqYLdE232vjsVN5ifB2vfw51oiytUg+HDkSqw
         Ms0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038996; x=1795643796; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=wzFOOmSveXu8HuiVzCIMGW7OP0GoYf2SnRjJ9Dkjrf2+WvUPWZwaJ/L9yscUEhaVsx
         chJo+GeNVFybPEDBryX6BYtsMHtFpmRKcbDI/8TjsTB/2EgBmt+FD+Z8p1CR70Ugdk3r
         wzfq5a2svAb/Lm5Vuckw0Hvln7eYCWw4ahKHQvCf/Cm924mCAxt3pOe5tyY38PkEd09H
         CPz86mmr18fVq7pR/jH/F5f1hDAU2tJn2KvfyIXDCOsMdQ7HaTq8OfMP/P023MDzZmX/
         xZdncSfyR+s0TeyuEUD+6fqlcskr/iGNft1oGF2dugvjdHlPeNRqOioj/vEARpLCDGP6
         4uLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038996; x=1795643796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=nrr2FTABT+4c6C7Cmo1LJbgQB99HZ99YU6OmzQq3+XBL6vrOKqGlYXzwSKe0d6qkZu
         k/uF/9wgnucuZ/MENc4LJ1azbXGQdUBuZVuiJOBiizOJi1sbGW4uyE3ekSuVyzwTmPaL
         p9dPTPoiczgCDPscaoryFGs2c35LSBALaKoIq/JAwzGIokDtegD6adsDY9PW7gp38EXl
         p677+LddyxSvfvVa/0Hl5Js2ArZeJwtVUo1tWB3D7Y1w9CBx+T9LHS4umSRFkL+Uw194
         cJZcjGjexBZ4ENS5insTjxG8/3Aq1rRyiRYnW8b4x5mzLUsGvBZIXl0G8R7SsBchf95N
         lLjQ==
X-Forwarded-Encrypted: i=1; AL+hErG1stPRdumgyEynSUZ93b6/2iv/+rhzvgXNgMGB7vKIM9lpZvMqRv4yvVqaakU56JSvIGmknXxuRTrAoBw9Bg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vBLAb+YhcH9F2XMDpSK7bu8Vek42WEH+26haJs59OcZMdrwxw
	HmUMPnZKulbPftoddpCZGpCWYzn8M4QRLALtqx7YVWjd1We181a8nw7/Vi8Fcr4VGGfNBmpYmTw
	3d7AwjI6tDrNOu5R0zjgkS6lalxJZw3zouBg8DGE=
X-Gm-Gg: AZFdTZc/afSdSZsjeg4Eoq37J0kehZ3gvKCrBnQyGHqNvpjyf22XkPuUGNdwKbHEnVG
	C4ew0yToA1nEi1TDVQNiwcho0JyuQIc29lm7VIXubvlbUQtLvt9NuZzqOW9XhFW5vwntTpojDo/
	efFRxPUdqI3CE//ngxlf2kvqvQMxF6ToCU6+o1eTQjEy8N6AKsJaaNxvWZ4zUKJVesrf+vg35U4
	BoniTIjsIVJEe15iEjkgRiJtL+Y0PyQx0TwTqZzYO+H2yLSrwSjU+snp08M0W5tZNkrUZpg/KiQ
	68IaHE23Fuk/DqRRwHm/T8geNJ/K5Jxv0iXHnYcwCc6Juhv6HhYPpCSHxaBmkZ/ddaZiiFWh3O8
	6P+hnDz5LoQ+xXQaHQYw70vtUKOJAGx6aXNEVohdcNuKIkPMBUVJDy89WBHU5sKgZafsenZjQUx
	xcMtaw04tKyNCeTCzW
X-Received: by 2002:a05:7300:dc05:b0:36a:7bb7:4609 with SMTP id
 5a478bee46e88-38281cf2d27mr4946077eec.34.1795038995589; Wed, 18 Nov 2026
 13:56:35 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
In-Reply-To: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 16:56:24 -0500
X-Gm-Features: Aa3M54paIcao6XUjgvQroGOuSTezaTatALtRBeHgZB-rqUe0NegT6OT5B_ER2ss
Message-ID: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Loic,

Thanks for the review.

On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
> The above message looks too verbose and confusing for a somewhat
> simple issue. Maybe this should be split properly in two fixes.

I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
allocates an msdu_id in htt->pending_tx, but leaves the entry there
if ath10k_htc_send_hl() fails.

I also noticed that the same error path doesn't drop the extra skb
reference taken by skb_get(), so I included both fixes in v1. I think
I could have explained this more clearly when covering both fixes
together. Sorry for the confusion.

> If this is a fix you should not target 'ath-next'.
> Two fixes tag looks weird, what are you fixin exactly?

I Cc'd Wentao Liang because he had already posted a patch for the skb
reference leak [1], but I left that explanation out of v1. Would it be
okay if I sent a v2 that only fixes the msdu_id leak?

[1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/

Thanks,
Changyul
